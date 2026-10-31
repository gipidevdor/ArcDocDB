;;; OWNER: writer riceve eventi solo dopo handoff sincronizzato dal compito I/O.
;;; SHARED: un contatore di consumatori per Serie, nessuna scrittura comune per documento.
(in-package #:arcdocdb.series)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CON-002 REQ-WAL-006 REQ-AFF-008
(declaim (ftype (function (controllore-serie t t t) null) inizia-io-commit-serie))
(defun inizia-io-commit-serie (controller lease event generation)
  "Pre: prepared event, before the only dispatch to the I/O pool. Post: active consumer.
Duplicate/stale/fault rejection before mutation. The caller retains the accepted dispatch;
if the scheduler rejects it, reschedules the same task without repeating this entry."
  (%check-owner controller lease) (%live-event controller event generation)
  (%require-healthy controller)
  (unless (eq (commit-serie-phase event) :preparato)
    (error 'invalid-argument :reason :serie-event-state))
  (unless (eq (commit-serie-io-state event) :idle)
    (error 'invalid-argument :reason :serie-io-state))
  (%check-captured-token controller event)
  (let ((complete nil))
    (%begin-effect controller)
    (unwind-protect
         (progn
           (setf (commit-serie-io-state event) :active)
           (incf (controllore-serie-active-io controller))
           (%check-ring controller)
           (unless (eq (commit-serie-io-state event) :active) (%serie-invariant controller :serie-io-state))
           (setf complete t) nil)
      (%end-effect controller complete))))

;;; REQ: REQ-CON-002 REQ-WAL-006 REQ-AFF-008 REQ-AFF-001
(declaim (ftype (function (controllore-serie t t t) null) completa-io-commit-serie))
(defun completa-io-commit-serie (controller lease event generation)
  "Pre: synchronized I/O completion message after retirement of the external I/O consumer;
permits draining after fault.
Post: the controller's I/O consumer is retired and its active count is reduced once;
written alone is insufficient.
INVALID-ARGUMENT for event/state; observed fault => Serie FAULTED."
  (%check-owner controller lease) (%live-event controller event generation)
  (unless (eq (commit-serie-io-state event) :active)
    (error 'invalid-argument :reason :serie-io-state))
  (unless (member (stato-lotto (the lotto (commit-serie-lotto event))) '(:durable :faulted))
    (error 'invalid-argument :reason :serie-io-in-flight))
  (unless (plusp (controllore-serie-active-io controller)) (%serie-invariant controller :serie-io-count))
  (let ((complete nil))
    (%begin-effect controller)
    (unwind-protect
         (progn
           (when (eq (stato-log (controllore-serie-log controller)) :faulted) (%mark-fault controller :serie))
           (setf (commit-serie-io-state event) :retired)
           (decf (controllore-serie-active-io controller))
           (%check-ring controller)
           (unless (eq (commit-serie-io-state event) :retired) (%serie-invariant controller :serie-io-state))
           (setf complete t) nil)
      (%end-effect controller complete))))

;;; REQ: REQ-CON-002 REQ-WAL-006 REQ-AFF-008 REQ-AFF-001
(declaim (ftype (function (controllore-serie t t t) null) ritira-io-commit-serie))
(defun ritira-io-commit-serie (controller lease event generation)
  "Pre: Serie FAULTED; caller retains the never-accepted dispatch or has
received its definitive synchronized retirement; group already canceled and batch sealed.
Post: I/O obligation retired without write/flush, token still pending. Does not independently
revoke a task; INVALID-ARGUMENT for health/state/owner, invariants => Archivio."
  (%check-owner controller lease) (%live-event controller event generation)
  (when (eq (stato-controllore-serie controller) :healthy)
    (error 'invalid-argument :reason :serie-not-faulted))
  (unless (eq (commit-serie-phase event) :preparato)
    (error 'invalid-argument :reason :serie-event-state))
  (unless (eq (commit-serie-io-state event) :active)
    (error 'invalid-argument :reason :serie-io-state))
  (%check-captured-token controller event)
  (%check-lotto-release controller (the lotto (commit-serie-lotto event)) :ritiro)
  (unless (plusp (controllore-serie-active-io controller)) (%serie-invariant controller :serie-io-count))
  (let ((complete nil))
    (%begin-effect controller)
    (unwind-protect
         (progn
           (setf (commit-serie-io-state event) :retired)
           (decf (controllore-serie-active-io controller))
           (%check-ring controller)
           (unless (eq (commit-serie-io-state event) :retired) (%serie-invariant controller :serie-io-state))
           (setf complete t) nil)
      (%end-effect controller complete))))

;;; REQ: REQ-AFF-001 REQ-AFF-008 REQ-WAL-006
(declaim (ftype (function (controllore-serie) null) %require-quiescent))
(defun %require-quiescent (controller)
  "Pre: lease, faulted Serie. Post: no active consumer in ANY slot.
INVALID-ARGUMENT if I/O is still owed; inconsistent counter => Archivio FAULTED.
Scan at most capacity<=1024, only on the fault path."
  (unless (zerop (controllore-serie-active-io controller))
    (error 'invalid-argument :reason :serie-io-active))
  (dotimes (i (length (controllore-serie-slots controller)))
    (let ((event (svref (controllore-serie-slots controller) i)))
      (unless (typep event 'commit-serie) (%serie-invariant controller :serie-event-slot))
      (when (eq (commit-serie-io-state event) :active) (%serie-invariant controller :serie-io-count))))
  nil)
