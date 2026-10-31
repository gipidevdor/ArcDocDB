;;;; Ricircolo bounded: pubblica e prende una testa nello stesso ring pieno.
;;; OWNER: il ring possiede A dopo successo; il chiamante possiede la testa restituita.
;;; SHARED: lista Serie pronte (ADR-0045 §8), una operazione per tratto, mai per messaggio.
(in-package #:arcdocdb.execution)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (partizione-pronta writer-programmabile)
                         (values writer-programmabile (member :writer) index &optional))
                %scambia-pronto))
(defun %scambia-pronto (partition writer)
  "Pre: current guard, full ring, unique obligation. Post: head to the caller and WRITER
at the tail, count unchanged. INVARIANT-VIOLATION for invalid shape, capacity, or head."
  (%check-pronta partition)
  (unless (= (partizione-pronta-count partition) (partizione-pronta-capacity partition))
    (error 'invariant-violation :reason :ready-recycle-full))
  (let* ((head (partizione-pronta-head partition))
         (old (svref (partizione-pronta-slots partition) head))
         (next (mod (1+ head) (partizione-pronta-capacity partition))))
    (unless (typep old 'writer-programmabile)
      (error 'invariant-violation :reason :ready-queue-invariant))
    (setf (svref (partizione-pronta-slots partition) head) writer
          (partizione-pronta-head partition) next
          (partizione-pronta-tail partition) next)
    (%check-pronta partition)
    (values old :writer (partizione-pronta-count partition))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (partizione-pronta writer-programmabile)
                         (values (or null writer-programmabile)
                                 (member :published :writer) index &optional))
                %ricircola-pronto))
(defun %ricircola-pronto (partition writer)
  "Pre: current guard and unique obligation. Post: published, or head and slot exchanged.
INVARIANT-VIOLATION for inconsistent ring or payload; no rejection for a full ring."
  (%check-pronta partition)
  (if (= (partizione-pronta-count partition) (partizione-pronta-capacity partition))
      (%scambia-pronto partition writer)
      (values nil :published (%pubblica-pronto partition writer))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (lista-writer-pronti t t)
                         (values (or null writer-programmabile)
                                 (member :published :writer) index &optional))
                ricircola-writer-pronto))
(defun ricircola-writer-pronto (ready shard writer)
  "Pre: unique :SCHEDULE obligation and caller able to take another writer.
Post: NIL/:PUBLISHED/count if room; head/:WRITER/capacity if full: new
obligation to the ring, head to the caller. INVALID-ARGUMENT for shard/writer; RESOURCE-EXHAUSTED
busy retains the obligation. Invariants require fail-stop; no retry, waiting, or deduplication."
  (let ((partition (%partizione-verificata ready shard)))
    (unless (typep writer 'writer-programmabile)
      (error 'invalid-argument :reason :ready-writer))
    (let ((thread (%prendi-guard-pronta partition)))
      (unless thread (error 'resource-exhausted :reason :ready-queue-busy))
      (unwind-protect (%ricircola-pronto partition writer)
        (%rilascia-guard-pronta partition thread)))))
