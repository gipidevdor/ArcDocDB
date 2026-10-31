;;;; Ring preallocato: serializzazione dei soli indici con un tentativo CAS.
;;; OWNER: payload dal chiamante alla coda soltanto all'accettazione.
;;; SHARED: slots/head/tail/count mutabili soltanto con guard locale posseduta.
(in-package #:arcdocdb.execution)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CON-001 REQ-CON-004 REQ-AFF-008
(defconstant +max-writer-capacity+ 65536)
(defconstant +max-writer-quantum+ 65536)
(defstruct (coda-writer (:constructor %make-coda-writer (slots capacity quantum))
                       (:copier nil))
  "Pre: preallocated private slots and finite budgets. Post: empty ring, no lease.
Guard and owner have separate CAS operations; generation is never recycled."
  (slots #() :type simple-vector :read-only t)
  (capacity 1024 :type index :read-only t)
  (quantum 64 :type index :read-only t)
  (head 0 :type index) (tail 0 :type index) (count 0 :type index)
  (guard nil :type (or null sb-thread:thread))
  (owner nil :type (or null sb-thread:thread))
  (generation 0 :type index) (extracted 0 :type index))

;;; REQ: REQ-CON-001 REQ-CON-004 REQ-AFF-008
(declaim (ftype (function (coda-writer) null) %check-queue))
(defun %check-queue (queue)
  "Pre: owned guard, or newly constructed unpublished queue.
Post: bounded indices and consistent FIFO relation; INVARIANT-VIOLATION on failure."
  (let ((capacity (coda-writer-capacity queue)) (head (coda-writer-head queue))
        (tail (coda-writer-tail queue)) (count (coda-writer-count queue)))
    (unless (and (<= 1 capacity +max-writer-capacity+)
                 (= (length (coda-writer-slots queue)) capacity)
                 (< head capacity) (< tail capacity) (<= count capacity))
      (error 'invariant-violation :reason :writer-queue-invariant))
    (unless (= tail (mod (+ head count) capacity))
      (error 'invariant-violation :reason :writer-queue-invariant)))
  nil)

;;; REQ: REQ-CON-001 REQ-CON-004 REQ-AFF-008
(declaim (ftype (function (coda-writer) sb-thread:thread) %acquisisci-guard))
(defun %acquisisci-guard (queue)
  "Pre: short ring operation. Post: local guard of current thread.
One CAS, without waiting; RESOURCE-EXHAUSTED if busy, INVARIANT-VIOLATION on failure."
  (let ((thread sb-thread:*current-thread*))
    (unless (null (sb-ext:compare-and-swap (coda-writer-guard queue) nil thread))
      (error 'resource-exhausted :reason :writer-queue-busy))
    (unless (eq (coda-writer-guard queue) thread)
      (error 'invariant-violation :reason :writer-guard))
    thread))

;;; REQ: REQ-CON-001 REQ-CON-004 REQ-AFF-008
(declaim (ftype (function (coda-writer sb-thread:thread) null) %rilascia-guard))
(defun %rilascia-guard (queue thread)
  "Pre: guard acquired by THREAD. Post: guard freed through one CAS.
INVARIANT-VIOLATION for a different owner; no waiting or implicit recovery."
  (unless (eq (coda-writer-guard queue) thread)
    (error 'invariant-violation :reason :writer-guard))
  (unless (eq (sb-ext:compare-and-swap (coda-writer-guard queue) thread nil) thread)
    (error 'invariant-violation :reason :writer-guard))
  nil)

;;; REQ: REQ-CON-001 REQ-CON-004 REQ-AFF-008
(declaim (ftype (function (&key (:capacity t) (:quantum t)) coda-writer) crea-coda-writer))
(defun crea-coda-writer (&key (capacity 1024) (quantum 64))
  "Pre: independent integer capacity and quantum between 1 and 65536.
Post: private SIMPLE-VECTOR ring allocated once; INVALID-ARGUMENT on rejection."
  (unless (and (typep capacity 'index) (<= 1 capacity +max-writer-capacity+))
    (error 'invalid-argument :reason :writer-configuration))
  (unless (and (typep quantum 'index) (<= 1 quantum +max-writer-quantum+))
    (error 'invalid-argument :reason :writer-configuration))
  (let ((queue (%make-coda-writer (make-array capacity :initial-element nil) capacity quantum)))
    (%check-queue queue)
    queue))

;;; REQ: REQ-CON-001 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (coda-writer t) index) %accoda-sotto-guard))
(defun %accoda-sotto-guard (queue message)
  "Pre: local guard owned by current thread, producer's payload.
Post: one FIFO acceptance and updated count; RESOURCE-EXHAUSTED if full
without mutations, INVARIANT-VIOLATION for inconsistent guard or indices."
  (unless (eq (coda-writer-guard queue) sb-thread:*current-thread*)
    (error 'invariant-violation :reason :writer-guard))
  (%check-queue queue)
  (when (= (coda-writer-count queue) (coda-writer-capacity queue))
    (error 'resource-exhausted :reason :writer-queue-full))
  (let ((tail (coda-writer-tail queue)))
    (setf (svref (coda-writer-slots queue) tail) message
          (coda-writer-tail queue) (mod (1+ tail) (coda-writer-capacity queue))
          (coda-writer-count queue) (1+ (coda-writer-count queue))))
  (%check-queue queue)
  (coda-writer-count queue))

;;; REQ: REQ-CON-001 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (coda-writer t) index) accoda-messaggio))
(defun accoda-messaggio (queue message)
  "Pre: opaque caller-owned payload, including NIL. Post: accepted in FIFO,
ownership transferred to queue, returns count after acceptance. RESOURCE-EXHAUSTED
for full/busy without mutating ring or payload; no callback, wait, or wakeup."
  (let ((thread (%acquisisci-guard queue)))
    (unwind-protect (%accoda-sotto-guard queue message)
      (%rilascia-guard queue thread))))
