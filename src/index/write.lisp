;;; OWNER: ogni chiamata ha il gettone writer della Serie; nessuna mutazione concorrente.
;;; SHARED: solo seqlock e campi dello slot; interruzione composta => salute terminale.
(in-package #:arcdocdb.index.slots)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-003 REQ-IDX-005 REQ-AFF-004
(declaim (inline sequenza-slot-writer))
(declaim (ftype (function (banco-slot fixnum) u64) sequenza-slot-writer))
(defun sequenza-slot-writer (bank base)
  "Pre: exclusive writer, valid base. Post: consistent contents and even sequence without wrap.
Corruption => FAULTED; a simple check neither consumes nor requires seqlock credit."
  (let* ((words (banco-slot-words bank)) (sequence (aref words (+ base +slot-sequence+))))
    (declare (type u64 sequence))
    (when (or (oddp sequence) (>= sequence +slot-sequence-limit+))
      (guasto-slot bank :index-slot-writer-sequence))
    (verifica-campi-slot bank (aref words (+ base +slot-csn+)) (aref words (+ base +slot-location+))
                         (aref words (+ base +slot-key+)) (aref words (+ base +slot-length+))
                         (if (banco-slot-retained bank) (aref words (+ base +slot-end+)) 0))
    sequence))

;;; REQ: REQ-IDX-003 REQ-IDX-005 REQ-AFF-008
(declaim (ftype (function (banco-slot integer) fixnum) credito-scrittura-slot))
(defun credito-scrittura-slot (bank slot)
  "Pre: exclusive writer; preflight before commit, including all updates already in flight.
Post: number of double increments still admitted; zero requires rebuild before commit.
Does not reserve credits: writer accounts for those needed by pending batches of the same Serie."
  (esigi-banco-writer bank)
  (let ((sequence (sequenza-slot-writer bank (base-slot bank slot))))
    (declare (type u64 sequence))
    (esigi-banco-sano bank)
    (values (floor (- +slot-sequence-limit+ 2 sequence) 2))))

;;; REQ: REQ-IDX-001 REQ-IDX-003 REQ-LIM-001 REQ-AFF-004
(declaim (ftype (function (banco-slot fixnum (or null contenuto-slot)) null) cambia-slot))
(defun cambia-slot (bank base source)
  "Pre: writer, already validated private SOURCE contents, or NIL for removal.
Post: all fields published before the new even sequence; no durability attested.
Every interruption after mutation starts makes the bank FAULTED, without seqlock rollback."
  (let* ((words (banco-slot-words bank)) (sequence (sequenza-slot-writer bank base)) (complete nil))
    (declare (type u64 sequence))
    (when (>= sequence (- +slot-sequence-limit+ 2))
      (error 'resource-exhausted :reason :index-slot-seqlock-rebuild))
    (unwind-protect
         (progn
           (esigi-banco-sano bank)
           (setf (aref words (+ base +slot-sequence+)) (1+ sequence))
           (sb-thread:barrier (:write))
           (setf (aref words (+ base +slot-csn+)) (if source (aref source 0) 0)
                 (aref words (+ base +slot-location+)) (if source (aref source 1) 0)
                 (aref words (+ base +slot-key+)) (if source (aref source 2) 0)
                 (aref words (+ base +slot-length+)) (if source (aref source 3) 0))
           (when (banco-slot-retained bank)
             (setf (aref words (+ base +slot-end+)) (if source (aref source 4) 0)))
           (sb-thread:barrier (:write))
           (setf (aref words (+ base +slot-sequence+)) (+ sequence 2))
           (esigi-banco-sano bank)
           (setf complete t))
      (unless complete (invalida-banco-slot bank))))
  nil)

;;; REQ: REQ-IDX-001 REQ-IDX-003 REQ-LIM-001 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (banco-slot integer contenuto-slot) null) pubblica-slot-v2))
(defun pubblica-slot-v2 (bank slot source)
  "Pre: writer token, private SOURCE; key/arena, retention, conflicts, and budgets prevalidated.
Post: payload published under seqlock; no commit acknowledgment or control byte written.
Input/range/frozen rejected before mutation; rebuild if seqlock credit is insufficient."
  (esigi-banco-writer bank)
  (let ((base (base-slot bank slot)))
    (esigi-contenuto-slot bank source)
    (cambia-slot bank base source))
  nil)

;;; REQ: REQ-IDX-003 REQ-IDX-006 REQ-AFF-004
(declaim (ftype (function (banco-slot integer) null) rimuovi-slot-v2))
(defun rimuovi-slot-v2 (bank slot)
  "Pre: exclusive writer, retention and storage tombstone already handled by caller.
Post: zero payload under seqlock, no in-memory tombstone; control becomes DELETED afterward.
Does not change arena keys; an already removed empty slot is idempotent without consuming sequence."
  (esigi-banco-writer bank)
  (let* ((base (base-slot bank slot)) (words (banco-slot-words bank)))
    (sequenza-slot-writer bank base)
    (unless (zerop (aref words (+ base +slot-csn+))) (cambia-slot bank base nil)))
  (esigi-banco-sano bank)
  nil)
