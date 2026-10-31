;;; OWNER: writer locale pubblica una radice immutabile per lotto, mai per documento.
;;; SHARED: CAS della radice con reader; registro CSN di Archivio solo alla risoluzione.
(in-package #:arcdocdb.series)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CON-002 REQ-WAL-006 REQ-AFF-001 REQ-AFF-008
(declaim (ftype (function (controllore-serie t) null) %check-initial-root))
(defun %check-initial-root (controller root)
  "Pre: lease/ring/health verified. Post: non-NIL root and unused controller, without effects.
INVALID-ARGUMENT for NIL root/already completed startup; reentry => Archivio FAULTED.
Does not release the previous effect or modify ring, frontiers, or CSN."
  (when (null root) (error 'invalid-argument :reason :serie-initial-root))
  (unless (and (null (controllore-serie-root controller))
               (null (controllore-serie-planned-root controller))
               (zerop (controllore-serie-event-generation controller))
               (zerop (controllore-serie-count controller)))
    (error 'invalid-argument :reason :serie-started))
  (when (controllore-serie-effect-active controller)
    (%serie-invariant controller :serie-effect))
  nil)

;;; REQ: REQ-CON-002 REQ-WAL-006 REQ-AFF-001 REQ-AFF-008
(declaim (ftype (function (controllore-serie t t) t) inizializza-radice-serie))
(defun inizializza-radice-serie (controller lease root)
  "Pre: lease, unused controller, immutable non-NIL ROOT; admission still closed.
Post: initial root published by canonical CAS and also planned; ring/CSN/offsets unchanged.
INVALID-ARGUMENT before effects for NIL root or already completed startup.
Incomplete exit/invariant failure => Archivio FAULTED, without rollback; no I/O.
CAS publishes memory: the durable opening decision remains with the catalog."
  (%check-owner controller lease) (%require-healthy controller)
  (%check-initial-root controller root)
  (let ((complete nil))
    (unwind-protect
         (progn
           (%begin-effect controller)
           (setf (controllore-serie-planned-root controller) root)
           (unless (null (sb-ext:compare-and-swap (controllore-serie-root controller) nil root))
             (%serie-invariant controller :serie-root-cas))
           (unless (and (eq (controllore-serie-root controller) root)
                        (eq (controllore-serie-planned-root controller) root))
             (%serie-invariant controller :serie-root-invariant))
           (%check-ring controller)
           (setf complete t)
           root)
      (%end-effect controller complete))))

;;; REQ: REQ-WAL-006 REQ-MVC-008 REQ-AFF-001
(declaim (ftype (function (controllore-serie commit-serie) null) %check-publication))
(defun %check-publication (controller event)
  "Pre: current FIFO event, healthy Serie. Post: token, coverage, and root checked BEFORE CAS.
Missing coverage is an ordinary rejection; inconsistent token/root requires fail-stop.
Log failure => Serie FAULTED, never a new publication."
  (%check-captured-token controller event)
  (unless (member (commit-serie-io-state event) '(:active :retired))
    (error 'invalid-argument :reason :serie-io-not-started))
  (handler-case
      (verifica-pubblicazione-lotto (the lotto (commit-serie-lotto event))
       (controllore-serie-registry controller) (controllore-serie-log controller)
       (commit-serie-slot event) (commit-serie-high event) (commit-serie-low event) (commit-serie-level event))
    (io-fault (condition) (%mark-fault controller :serie) (error condition))
    (invariant-violation (condition) (%mark-fault controller :archive) (error condition)))
  (unless (eq (controllore-serie-root controller)
              (if (eq (commit-serie-phase event) :preparato)
                  (commit-serie-expected-root event) (commit-serie-root event)))
    (%serie-invariant controller :serie-root-invariant))
  nil)

;;; REQ: REQ-WAL-006 REQ-MVC-008 REQ-CON-002
(declaim (ftype (function (controllore-serie commit-serie) null) %publish-root))
(defun %publish-root (controller event)
  "Pre: owned effect and complete preflight. Post: root published only once.
CAS publishes memory, not durable atomicity: the written SEAL is the WAL point.
CAS/phase/root invariant failure => Archivio fail-stop, without rollback or second publication."
  (case (commit-serie-phase event)
    (:preparato
     (setf (commit-serie-phase event) :pubblicando)
     (unless (eq (sb-ext:compare-and-swap (controllore-serie-root controller)
                                        (commit-serie-expected-root event) (commit-serie-root event))
                 (commit-serie-expected-root event))
       (%serie-invariant controller :serie-root-cas))
     (setf (commit-serie-phase event) :pubblicato))
    (:pubblicato nil)
    (otherwise (%serie-invariant controller :serie-event-state)))
  (unless (eq (commit-serie-phase event) :pubblicato) (%serie-invariant controller :serie-event-state))
  (unless (eq (controllore-serie-root controller) (commit-serie-root event))
    (%serie-invariant controller :serie-root-invariant))
  nil)

;;; REQ: REQ-MVC-008 REQ-WAL-006
(declaim (ftype (function (controllore-serie commit-serie) null) %advance-publication))
(defun %advance-publication (controller event)
  "Pre: effect and outcome already resolved/canceled. Post: pending cursor advanced.
Count/phase invariants prevent advancing past a still-pending token."
  (unless (plusp (controllore-serie-unresolved controller)) (%serie-invariant controller :serie-count))
  (unless (member (commit-serie-phase event) '(:risolto :annullato))
    (%serie-invariant controller :serie-event-state))
  (decf (controllore-serie-unresolved controller))
  (setf (controllore-serie-publish-head controller)
        (%next-position controller (controllore-serie-publish-head controller)))
  (%check-ring controller)
  nil)

;;; REQ: REQ-MVC-008 REQ-WAL-006
(declaim (ftype (function (controllore-serie commit-serie)
                         (values (member :risolto :pendente) u32 u32 &optional)) %resolve-publication))
(defun %resolve-publication (controller event)
  "Pre: published root, owned effect. Post: resolved, or pending ONLY on csn-busy.
Resolution uses the captured token; busy neither republishes nor advances FIFO.
Unexpected errors/register-event interruptions require Archivio fail-stop."
  (unless (eq (commit-serie-phase event) :pubblicato) (%serie-invariant controller :serie-event-state))
  (handler-case
      (multiple-value-bind (high low)
          (risolvi-lotto-pubblicato (the lotto (commit-serie-lotto event))
           (controllore-serie-registry controller) (commit-serie-slot event)
           (commit-serie-high event) (commit-serie-low event) (commit-serie-level event))
        (setf (commit-serie-phase event) :risolto)
        (%advance-publication controller event)
        (values :risolto high low))
    (resource-exhausted (condition)
      (unless (eq (error-reason condition) :csn-busy) (error condition))
      (unless (eq (commit-serie-phase event) :pubblicato) (%serie-invariant controller :serie-event-state))
      (values :pendente 0 0))))

;;; REQ: REQ-WAL-006 REQ-MVC-008 REQ-CON-002 REQ-AFF-001
(declaim (ftype (function (controllore-serie t t t)
                         (values (member :risolto :pendente) u32 u32 &optional)) pubblica-commit-serie))
(defun pubblica-commit-serie (controller lease event generation)
  "Pre: synchronized event; prepared immutable root, Serie FIFO order.
Post: atomic publication followed by resolution; :pendente preserves outcome/obligation.
No client acknowledgment; known I/O error => Serie faulted, uncertain outcome => Archivio.
Cleanup releases the local effect, preserving the cause and all pending references."
  (%check-owner controller lease) (%live-event controller event generation)
  (%check-publish-head controller event) (%require-healthy controller)
  (%check-publication controller event)
  (let ((complete nil))
    (%begin-effect controller)
    (unwind-protect
         (handler-case
             (progn
               (%publish-root controller event)
               (multiple-value-bind (status high low) (%resolve-publication controller event)
                 (setf complete t) (values status high low)))
           (io-fault (condition)
             (%mark-fault controller :serie) (setf complete t) (error condition)))
      (%end-effect controller complete))))
