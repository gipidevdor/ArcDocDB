;;; OWNER: lease del thread corrente; cleanup rilascia solo la proprietà locale.
;;; SHARED: CAS owner per tratto di Serie; nessuno stato comune tra Serie.
(in-package #:arcdocdb.series)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-001 REQ-AFF-004
(declaim (ftype (function (controllore-serie (member :serie :archive)) null) %mark-fault))
(defun %mark-fault (controller scope)
  "Pre: owner or cleanup of its effect. Post: terminal fault, scope never reduced.
Does not delete data, resolve tokens, or reopen logs; no ordinary error."
  (if (eq scope :archive)
      (setf (controllore-serie-state controller) :archive-faulted)
      (case (sb-ext:compare-and-swap (controllore-serie-state controller) :healthy :faulted)
        ((:healthy :faulted :archive-faulted) nil)
        (otherwise
         (setf (controllore-serie-state controller) :archive-faulted)
         (error 'invariant-violation :reason :serie-health))))
  nil)

;;; REQ: REQ-AFF-001 REQ-AFF-004
(declaim (ftype (function (controllore-serie keyword) nil) %serie-invariant))
(defun %serie-invariant (controller reason)
  "Pre: false internal invariant. Post: Serie FAULTED, Archivio scope, condition propagated.
No rollback promised; the coordinator must stop the Archivio and preserve the context."
  (%mark-fault controller :archive)
  (error 'invariant-violation :reason reason))

;;; REQ: REQ-AFF-008 REQ-CON-002
(declaim (ftype (function (controllore-serie) null) %check-ring))
(defun %check-ring (controller)
  "Pre: lease or exclusive construction. Post: cursors and counters within capacity.
INVARIANT-VIOLATION makes the Serie FAULTED before using an inconsistent index."
  (let ((capacity (length (controllore-serie-slots controller))))
    (unless (and (<= 1 capacity +max-serie-commits+)
                 (< (controllore-serie-head controller) capacity)
                 (< (controllore-serie-tail controller) capacity)
                 (< (controllore-serie-publish-head controller) capacity))
      (%serie-invariant controller :serie-ring))
    (unless (and (<= (controllore-serie-count controller) capacity)
                 (<= (controllore-serie-unresolved controller) (controllore-serie-count controller))
                 (<= (controllore-serie-active-io controller) (controllore-serie-count controller)))
      (%serie-invariant controller :serie-count)))
  (%check-geometry controller)
  nil)

;;; REQ: REQ-CON-002 REQ-AFF-008
(declaim (ftype (function (controllore-serie index index) index) %position-after)
         (ftype (function (controllore-serie) null) %check-geometry))
(defun %position-after (controller position amount)
  "Pre: position in the ring, amount at most capacity. Post: sum modulo capacity.
Two limits checked before the sum<=2047; invariant failures => FAULTED."
  (let ((capacity (length (controllore-serie-slots controller))))
    (unless (< position capacity) (%serie-invariant controller :serie-ring))
    (unless (<= amount capacity) (%serie-invariant controller :serie-count))
    (let ((sum (+ position amount)))
      (if (>= sum capacity) (- sum capacity) sum))))

;;; REQ: REQ-CON-002 REQ-WAL-006 REQ-MVC-008
(defun %check-geometry (controller)
  "Pre: cursor/count limits already checked. Post: tail=head+count and
tail=publish-head+unresolved modulo capacity; no unverified slot reads."
  (unless (= (controllore-serie-tail controller)
             (%position-after controller (controllore-serie-head controller) (controllore-serie-count controller)))
    (%serie-invariant controller :serie-ring-geometry))
  (unless (= (controllore-serie-tail controller)
             (%position-after controller (controllore-serie-publish-head controller)
                              (controllore-serie-unresolved controller)))
    (%serie-invariant controller :serie-ring-geometry))
  nil)

;;; REQ: REQ-CON-002 REQ-AFF-004
(declaim (ftype (function (controllore-serie t) null) %check-owner))
(defun %check-owner (controller lease)
  "Pre: caller's token. Post: current thread/generation and valid ring.
INVALID-ARGUMENT for stale/foreign lease; invariant failures => FAULTED."
  (unless (and (typep lease 'index) (plusp lease)
               (= lease (controllore-serie-lease-generation controller))
               (eq (controllore-serie-owner controller) sb-thread:*current-thread*))
    (error 'invalid-argument :reason :serie-lease))
  (%check-ring controller)
  nil)

;;; REQ: REQ-CON-002 REQ-AFF-001
(declaim (ftype (function (controllore-serie sb-thread:thread) null) %release-owner))
(defun %release-owner (controller thread)
  "Pre: THREAD owns owner. Post: one CAS releases the capability without waiting.
INVARIANT-VIOLATION for inconsistent owner; no retry or token release."
  (unless (eq (controllore-serie-owner controller) thread)
    (%serie-invariant controller :serie-owner))
  (unless (eq (sb-ext:compare-and-swap (controllore-serie-owner controller) thread nil) thread)
    (%serie-invariant controller :serie-owner))
  nil)

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (controllore-serie) index) acquisisci-controllore-serie))
(defun acquisisci-controllore-serie (controller)
  "Pre: new writer slice. Post: thread's lease, generation without wrap.
RESOURCE-EXHAUSTED for busy/exhaustion; an acquisition error releases owner."
  (let ((thread sb-thread:*current-thread*) (committed nil))
    (unless (null (sb-ext:compare-and-swap (controllore-serie-owner controller) nil thread))
      (error 'resource-exhausted :reason :serie-busy))
    (unwind-protect
         (progn
           (%check-ring controller)
           (when (= (controllore-serie-lease-generation controller) most-positive-fixnum)
             (error 'resource-exhausted :reason :serie-lease-generation))
           (incf (controllore-serie-lease-generation controller))
           (%check-owner controller (controllore-serie-lease-generation controller))
           (setf committed t)
           (controllore-serie-lease-generation controller))
      (unless committed (%release-owner controller thread)))))

;;; REQ: REQ-CON-002 REQ-AFF-004
(declaim (ftype (function (controllore-serie t) null) rilascia-controllore-serie))
(defun rilascia-controllore-serie (controller lease)
  "Pre: slice finished, no incomplete local effect. Post: lease released.
INVALID-ARGUMENT for lease; INVARIANT-VIOLATION for an effect still in flight."
  (%check-owner controller lease)
  (when (controllore-serie-effect-active controller)
    (%serie-invariant controller :serie-effect))
  (%release-owner controller sb-thread:*current-thread*))

;;; REQ: REQ-AFF-001 REQ-WAL-006
(declaim (ftype (function (controllore-serie) null) %require-healthy))
(defun %require-healthy (controller)
  "Pre: owned lease. Post: healthy Serie and log before acceptance/publication.
Terminal IO-FAULT; a known log failure is reflected in the controller."
  (unless (eq (controllore-serie-state controller) :healthy)
    (error 'io-fault :reason :serie-faulted :operation :series))
  (unless (eq (stato-log (controllore-serie-log controller)) :open)
    (%mark-fault controller :serie)
    (error 'io-fault :reason :log-faulted :operation :series))
  nil)

;;; REQ: REQ-AFF-001 REQ-AFF-008
(declaim (ftype (function (controllore-serie) null) %begin-effect))
(defun %begin-effect (controller)
  "Pre: validated lease and preconditions. Post: local ownership of the effect acquired.
INVARIANT-VIOLATION on reentry; cleanup releases this resource."
  (when (controllore-serie-effect-active controller)
    (%serie-invariant controller :serie-effect))
  (%check-ring controller)
  (setf (controllore-serie-effect-active controller) t)
  nil)

;;; REQ: REQ-AFF-001 REQ-AFF-008
(declaim (ftype (function (controllore-serie boolean) null) %end-effect))
(defun %end-effect (controller complete)
  "Pre: cleanup by the effect owner. Post: local resource released.
Incomplete exit => Archivio FAULTED, references/tokens retained; no rollback
or suppression of the original condition or control transfer."
  (unless complete (%mark-fault controller :archive))
  (setf (controllore-serie-effect-active controller) nil)
  nil)

;;; REQ: REQ-AFF-008 REQ-CON-002
(declaim (ftype (function (controllore-serie index) index) %next-position))
(defun %next-position (controller position)
  "Pre: index in the current ring. Post: successor modulo capacity, without integer wrap.
INVARIANT-VIOLATION for inconsistent index/capacity."
  (let ((capacity (length (controllore-serie-slots controller))))
    (unless (<= 1 capacity +max-serie-commits+) (%serie-invariant controller :serie-ring))
    (unless (< position capacity) (%serie-invariant controller :serie-ring))
    (if (= (1+ position) capacity) 0 (1+ position))))
