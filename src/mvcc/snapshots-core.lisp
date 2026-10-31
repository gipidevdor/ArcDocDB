;;; OWNER: mutazioni del registro sotto mutex snapshot; ordine dei lock: snapshot poi CSN.
;;; SHARED: soglia e identità sotto mutex; salute monotona verso FAULTED anche dal confine Archivio.
(in-package #:arcdocdb.mvcc)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-MVC-007 REQ-AFF-004
(declaim (inline snapshot-pinned-p))
(declaim (ftype (function ((unsigned-byte 8)) boolean) snapshot-pinned-p))
(defun snapshot-pinned-p (state)
  "Pre: numeric state. Post: waiting and active states retain versions; other states do not."
  (or (= state +snapshot-waiting+) (= state +snapshot-active+)))

;;; REQ: REQ-MVC-007 REQ-AFF-004
(declaim (inline esigi-snapshot-sano))
(declaim (ftype (function (registro-snapshot) null) esigi-snapshot-sano))
(defun esigi-snapshot-sano (registry)
  "Pre: existing registry. Post: snapshot health sampled with an acquire barrier.
INVARIANT-VIOLATION after FAULTED; no access to private CSN registry fields."
  (sb-thread:barrier (:read)
    (unless (eq (registro-snapshot-health registry) :open)
      (error 'invariant-violation :reason :snapshot-registry-faulted)))
  nil)

;;; REQ: REQ-MVC-005 REQ-AFF-004 REQ-CON-004
(declaim (ftype (function (registro-snapshot) null) invalida-registro-snapshot))
(defun invalida-registro-snapshot (registry)
  "Pre: trusted Archivio boundary after a failure, or interrupted snapshot mutation.
Post: FAULTED health published, idempotently and without mutex; never resets or releases pins/EBR.
Only external write: monotonic terminal state. The controller must isolate the Archivio."
  (sb-thread:barrier (:write))
  (setf (registro-snapshot-health registry) :faulted)
  nil)

;;; REQ: REQ-CON-004 REQ-AFF-008
(declaim (inline esigi-ingresso-snapshot))
(declaim (ftype (function (registro-snapshot) null) esigi-ingresso-snapshot))
(defun esigi-ingresso-snapshot (registry)
  "Pre: worker coordination, before WITH-MUTEX :WAIT-P NIL.
Post: no recursive acquisition; RESOURCE-EXHAUSTED :SNAPSHOT-BUSY for the current owner.
Contention with other workers is decided by the mutex attempt, not this observation."
  (when (eq (sb-thread:mutex-owner (registro-snapshot-mutex registry)) sb-thread:*current-thread*)
    (error 'resource-exhausted :reason :snapshot-busy))
  nil)

;;; REQ: REQ-MVC-007 REQ-AFF-004
(declaim (ftype (function (registro-snapshot keyword) nil) guasto-snapshot))
(defun guasto-snapshot (registry reason)
  "Pre: snapshot mutex owned. Post: FAULTED published, typed error, no rollback."
  (invalida-registro-snapshot registry)
  (error 'invariant-violation :reason reason))

;;; REQ: REQ-MVC-007 REQ-AFF-008
(declaim (ftype (function (registro-snapshot) null) verifica-contatori-snapshot))
(defun verifica-contatori-snapshot (registry)
  "Pre: snapshot mutex owned. Post: counters/cursors compatible with K.
INVARIANT-VIOLATION with fail-stop for inconsistency; no scan on the reader path."
  (esigi-snapshot-sano registry)
  (let ((capacity (length (registro-snapshot-states registry))))
    (unless (and (<= (registro-snapshot-count registry) capacity)
                 (< (registro-snapshot-cursor registry) capacity)
                 (< (registro-snapshot-sweep-cursor registry) capacity)
                 (if (zerop (registro-snapshot-count registry))
                     (= (aref (registro-snapshot-words registry) 1) +max-csn+)
                     (plusp (aref (registro-snapshot-words registry) 0))))
      (guasto-snapshot registry :snapshot-counters-inconsistent)))
  nil)

;;; REQ: REQ-MVC-007 REQ-AFF-008
(declaim (ftype (function (registro-snapshot) csn-slot) trova-slot-snapshot))
(defun trova-slot-snapshot (registry)
  "Pre: mutex owned and credit available. Post: unpinned slot, at most K visits.
INVARIANT-VIOLATION for inconsistent state or accounting."
  (let* ((states (registro-snapshot-states registry)) (capacity (length states))
         (cursor (registro-snapshot-cursor registry)))
    (dotimes (step capacity)
      (let* ((candidate (+ cursor step))
             (slot (if (< candidate capacity) candidate (- candidate capacity)))
             (state (aref states slot)))
        (unless (<= state +snapshot-age-expired+)
          (guasto-snapshot registry :snapshot-slot-state))
        (unless (snapshot-pinned-p state) (return-from trova-slot-snapshot slot))))
    (guasto-snapshot registry :snapshot-credit-accounting)))

;;; REQ: REQ-MVC-007 REQ-MVC-004
(declaim (ftype (function (contesto-snapshot u64) csn-slot) esigi-identita-snapshot))
(defun esigi-identita-snapshot (context expected-generation)
  "Pre: snapshot mutex owned. Post: slot of the original identity, even if already ended.
SNAPSHOT-TOO-OLD for reused context/slot; no access to a new incarnation."
  (let* ((registry (contesto-snapshot-registry context)) (slot (contesto-snapshot-slot context)))
    (unless (and (plusp expected-generation)
                 (= expected-generation (aref (contesto-snapshot-word context) 0))
                 (< slot (length (registro-snapshot-generations registry)))
                 (= expected-generation (aref (registro-snapshot-generations registry) slot)))
      (error 'snapshot-too-old :reason :snapshot-stale-identity))
    slot))

;;; REQ: REQ-MVC-007 REQ-MVC-003
(declaim (ftype (function (registro-snapshot) null) ricalcola-soglia-snapshot))
(defun ricalcola-soglia-snapshot (registry)
  "Pre: mutex owned, states updated. Post: minimum pin CSN or MAX-U64.
Checks count and metadata before raising threshold; fail-stop on inconsistency."
  (let ((states (registro-snapshot-states registry)) (minimum +max-csn+) (count 0)
        (last-generation (aref (registro-snapshot-words registry) 0)))
    (declare (type u64 minimum last-generation))
    (dotimes (slot (length states))
      (let ((state (aref states slot)))
        (unless (<= state +snapshot-age-expired+)
          (guasto-snapshot registry :snapshot-slot-state))
        (when (snapshot-pinned-p state)
          (unless (and (<= 1 (aref (registro-snapshot-generations registry) slot) last-generation)
                       (<= (aref (registro-snapshot-wait-deadlines registry) slot)
                           (aref (registro-snapshot-deadlines registry) slot)))
            (guasto-snapshot registry :snapshot-slot-metadata))
          (incf count)
          (setf minimum (min minimum (aref (registro-snapshot-csns-array registry) slot))))))
    (unless (= count (registro-snapshot-count registry))
      (guasto-snapshot registry :snapshot-credit-accounting))
    (unless (<= (aref (registro-snapshot-words registry) 1) minimum)
      (guasto-snapshot registry :snapshot-threshold-regression))
    (sb-thread:barrier (:write))
    (setf (aref (registro-snapshot-words registry) 1) minimum))
  nil)

;;; REQ: REQ-MVC-004 REQ-MVC-003 REQ-MVC-007
(declaim (ftype (function (registro-snapshot csn-slot (unsigned-byte 8)) null)
                ritira-slot-snapshot))
(defun ritira-slot-snapshot (registry slot terminal-state)
  "Pre: mutex owned, pinned slot, known terminal state. Post: pin removed and threshold updated.
Nonlocal exit during mutation marks FAULTED; does not delete records or EBR references."
  (let ((complete nil))
    (unwind-protect
         (progn
           (setf (aref (registro-snapshot-states registry) slot) terminal-state)
           (sb-thread:barrier (:memory))
           (decf (registro-snapshot-count registry))
           (ricalcola-soglia-snapshot registry)
           (setf complete t))
      (unless complete (invalida-registro-snapshot registry))))
  nil)
