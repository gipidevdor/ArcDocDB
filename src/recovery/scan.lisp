;;;; Prefisso contiguo e testimoni durevoli; ADR-0037, senza applicare record.
;;; OWNER: chiamante; buffer stabile per l'intera scansione e per l'uso del risultato.
;;; SHARED: nessuno stato mutabile, lock o scrittura condivisa tra Serie.
(in-package #:arcdocdb.recovery.scan)
(declaim (optimize (safety 3) (debug 2)))

;;; REQ: REQ-FOR-001 REQ-FOR-003
(defconstant +seal-record-bytes+ (+ +header-bytes+ +seal-bytes+))

;;; REQ: REQ-AFF-009 REQ-AFF-017
(define-condition log-corruption (corruption-detected)
  ((prefix-end :initarg :prefix-end :reader %corruption-prefix-end :type index)
   (witness-offset :initarg :witness-offset :reader %corruption-witness-offset :type u64)
   (durable-offset :initarg :durable-offset :reader %corruption-durable-offset :type u64)
   (first-reason :initarg :first-reason :reader %corruption-first-reason :type keyword))
  (:documentation "Pre: intact SEAL witness and frontier beyond the first invalid batch.
Post: preserves the prefix in the buffer, absolute offsets, and initial reason; no durable
effect. The owner applies fail-stop without modifying the existing file."))

;;; REQ: REQ-AFF-009
(declaim (ftype (function (log-corruption) (values index &optional)) corruption-prefix-end)
         (ftype (function (log-corruption) (values u64 &optional)) corruption-witness-offset)
         (ftype (function (log-corruption) (values u64 &optional)) corruption-durable-offset)
         (ftype (function (log-corruption) (values keyword &optional)) corruption-first-reason))

;;; REQ: REQ-AFF-009
(defun corruption-prefix-end (condition)
  "Pre: CONDITION log-corruption. Post: prefix index, no modification.
A violation of the contract's types signals TYPE-ERROR with safety 3."
  (the index (%corruption-prefix-end condition)))

;;; REQ: REQ-AFF-009
(defun corruption-witness-offset (condition)
  "Pre: CONDITION log-corruption. Post: absolute u64 witness offset, unchanged.
A violation of the contract's types signals TYPE-ERROR with safety 3."
  (the u64 (%corruption-witness-offset condition)))

;;; REQ: REQ-AFF-009
(defun corruption-durable-offset (condition)
  "Pre: CONDITION log-corruption. Post: declared absolute u64 frontier, unchanged.
A violation of the contract's types signals TYPE-ERROR with safety 3."
  (the u64 (%corruption-durable-offset condition)))

;;; REQ: REQ-AFF-009
(defun corruption-first-reason (condition)
  "Pre: CONDITION log-corruption. Post: first error's keyword, no modification.
A violation of the contract's types signals TYPE-ERROR with safety 3."
  (the keyword (%corruption-first-reason condition)))

;;; REQ: REQ-AFF-008 REQ-AFF-009 REQ-FOR-003
(declaim (ftype (function (octets integer integer u64 integer keyword u64 t
                                integer integer integer integer integer)
                         (values index &optional)) check-scan-arguments))
(defun check-scan-arguments (buffer start end file-id version log-kind file-offset
                            file-size max-bytes max-batches max-batch-records
                            max-batch-bytes max-search-bytes)
  "Pre: typed inputs, stable physical EOF attested by the caller.
Post: range, explicit version, identity, u64 EOF, and consistent budgets verified.
Signals INVALID-ARGUMENT, UNSUPPORTED-FORMAT, or RESOURCE-EXHAUSTED before scanning."
  (check-range buffer start end)
  (format-limits version)
  (case log-kind
    (:segment nil)
    ((:control :multiserie)
     (unless (zerop file-id)
       (error 'invalid-argument :reason :log-scan-arguments)))
    (otherwise (error 'invalid-argument :reason :log-kind)))
  (unless (and (typep max-bytes 'index) (typep max-batches 'index)
               (plusp max-batches) (typep max-batch-records 'u32)
               (plusp max-batch-records) (typep max-batch-bytes 'index)
               (>= max-batch-bytes +seal-record-bytes+)
               (typep max-search-bytes 'index)
               (typep (+ file-offset end) 'u64))
    (error 'invalid-argument :reason :log-scan-arguments))
  (unless (and (typep file-size 'u64) (= file-size (+ file-offset end)))
    (error 'invalid-argument :reason :incomplete-log-buffer))
  (when (> (- end start) max-bytes)
    (error 'resource-exhausted :reason :log-byte-budget :offset (+ file-offset start)))
  end)

;;; REQ: REQ-AFF-009 REQ-AFF-008 REQ-FOR-003
(declaim (ftype (function (octets index index u64 integer keyword u64 u32 index)
                         (values index u32 (or null keyword) &optional)) checked-batch))
(defun checked-batch (buffer start end file-id version log-kind file-offset
                      max-records max-bytes)
  "Pre: nonempty range and verified budgets. Post: intact batch with progress,
or START, zero, and the reason from the only intercepted condition, CORRUPTION-DETECTED.
Propagates other errors; no record applied or bytes modified."
  (check-range buffer start end)
  (unless (< start end)
    (error 'invariant-violation :reason :scan-empty-batch :offset start))
  (handler-case
      (multiple-value-bind (next stamp durable count)
          (verifica-lotto buffer start end file-id :version version :log-kind log-kind
                          :file-offset file-offset :max-records max-records :max-bytes max-bytes)
        (unless (and (< start next) (<= next end) (<= count max-records)
                     (typep stamp 'u64) (<= durable (+ file-offset start)))
          (error 'invariant-violation :reason :scan-batch-result :offset start))
        (values next count nil))
    (corruption-detected (condition)
      (values start 0 (error-reason condition)))))

;;; REQ: REQ-AFF-009 REQ-FOR-001 REQ-FOR-003
(declaim (ftype (function (octets index index u64 integer u64 u64)
                         (values boolean u64 &optional)) seal-witness))
(defun seal-witness (buffer pos end file-id version file-offset records-start)
  "Pre: 56-byte candidate fully available, absolute offsets verified.
Post: true and a frontier only for an intact SEAL of the file with plausible positions.
CORRUPTION-DETECTED in the candidate produces NIL, zero; other errors propagate.
Does not attest to the witness batch: count and checksum do not authorize replay."
  (check-range buffer pos (+ pos +seal-record-bytes+))
  (unless (<= (+ pos +seal-record-bytes+) end)
    (error 'invariant-violation :reason :scan-seal-range :offset pos))
  (unless (= (aref buffer (+ pos +type-offset+)) +seal+)
    (return-from seal-witness (values nil 0)))
  (handler-case
      (multiple-value-bind (next kind flags ks ke vs ve)
          (verifica-cornice buffer pos (+ pos +seal-record-bytes+) :version version)
        (unless (and (= next (+ pos +seal-record-bytes+)) (= kind +seal+)
                     (zerop flags) (= ks ke) (= vs (+ pos +header-bytes+))
                     (= (- ve vs) +seal-bytes+))
          (error 'invariant-violation :reason :scan-seal-result :offset pos))
        (let ((batch-start (leggi-u64 buffer (+ vs +seal-batch-start-offset+)))
              (durable (leggi-u64 buffer (+ vs +seal-durable-offset+))))
          (if (and (u64-equal-p buffer (+ vs +seal-file-id-offset+) file-id)
                   (<= records-start batch-start (+ file-offset pos))
                   (<= durable batch-start))
              (values t durable)
              (values nil 0))))
    (corruption-detected () (values nil 0))))

;;; REQ: REQ-AFF-009 REQ-AFF-008 REQ-AFF-017
(declaim (ftype (function (octets index index u64 integer u64 u64 keyword index) null)
                search-durable-witness))
(defun search-durable-witness (buffer prefix-end end file-id version file-offset
                               records-start first-reason max-search-bytes)
  "Pre: P is the start of the invalid batch; complete EOF and stable buffer.
Post: NIL only after a complete search of every position with 56 bytes available.
Signals LOG-CORRUPTION for a frontier beyond P, RESOURCE-EXHAUSTED for an incomplete search.
No skipping between candidates, even after a valid SEAL with a frontier no greater than P."
  (check-range buffer prefix-end end)
  (unless (<= records-start (+ file-offset prefix-end))
    (error 'invariant-violation :reason :scan-search-start :offset prefix-end))
  (let* ((positions (max 0 (1+ (- end prefix-end +seal-record-bytes+))))
         (limit (min positions max-search-bytes))
         (absolute-prefix (+ file-offset prefix-end)))
    (loop for delta below limit
          do (let ((pos (+ prefix-end delta)))
               (multiple-value-bind (valid durable)
                   (seal-witness buffer pos end file-id version file-offset records-start)
                 (when (and valid (> durable absolute-prefix))
                   (error 'log-corruption :reason :log-durable-corruption
                          :offset absolute-prefix :prefix-end prefix-end
                          :witness-offset (+ file-offset pos) :durable-offset durable
                          :first-reason first-reason)))))
    (when (< limit positions)
      (error 'resource-exhausted :reason :log-search-budget
             :offset (+ absolute-prefix limit))))
  nil)

;;; REQ: REQ-AFF-009 REQ-AFF-008 REQ-AFF-017 REQ-FOR-003
(declaim (ftype (function (octets index index u64 integer keyword u64
                                index u32 index index)
                         (values index (member :complete :tail) index index &optional))
                scan-prefix))
(defun scan-prefix (buffer start end file-id version log-kind file-offset
                    max-batches max-batch-records max-batch-bytes max-search-bytes)
  "Pre: range, EOF, and budgets verified. Post: only a contiguous prefix of intact batches;
counts exclude the failed batch and every SEAL. Propagates durable corruption and budget errors.
Makes no data visible; TAIL classification requires a complete search."
  (check-range buffer start end)
  (unless (plusp max-batches)
    (error 'invariant-violation :reason :scan-batch-limit :offset start))
  (let ((pos start) (batches 0) (records 0))
    (loop repeat max-batches
          do (when (= pos end)
               (return-from scan-prefix (values pos :complete batches records)))
             (multiple-value-bind (next count first-reason)
                 (checked-batch buffer pos end file-id version log-kind file-offset
                                max-batch-records max-batch-bytes)
               (when first-reason
                 (search-durable-witness buffer pos end file-id version file-offset
                                         (+ file-offset start) first-reason max-search-bytes)
                 (return-from scan-prefix (values pos :tail batches records)))
               (incf batches)
               (incf records count)
               (setf pos next)
               (unless (<= records (floor (- pos start) +header-bytes+))
                 (error 'invariant-violation :reason :scan-record-count :offset pos))))
    (if (= pos end)
        (values pos :complete batches records)
        (error 'resource-exhausted :reason :log-batch-budget :offset (+ file-offset pos)))))

;;; REQ: REQ-AFF-009 REQ-AFF-008 REQ-AFF-017 REQ-FOR-001 REQ-FOR-003
(declaim (ftype (function (octets integer integer u64
                                &key (:version integer) (:log-kind keyword)
                                (:file-offset u64) (:file-size t) (:max-bytes integer)
                                (:max-batches integer) (:max-batch-records integer)
                                (:max-batch-bytes integer) (:max-search-bytes integer))
                         (values index (member :complete :tail) index index &optional))
                scansiona-log))
(defun scansiona-log (buffer start end file-id
                      &key (version 0) (log-kind :segment) (file-offset 0) file-size
                           (max-bytes 67108864) (max-batches 65536)
                           (max-batch-records 65536) (max-batch-bytes 67108864)
                           (max-search-bytes 67108864))
  "Pre: stable buffer through physical EOF; authoritative u64 FILE-SIZE from the caller,
equal to FILE-OFFSET+END; START is the first record after a verified header or checkpoint.
Explicit version 1/2 even for an empty log; all budgets finite.
Post: end in BUFFER, COMPLETE/TAIL, batch and record counts excluding SEAL; only a
verified contiguous prefix, without replay, I/O, mutations, or durable effects (INV-A9).
Signals typed argument, format, or budget errors, or LOG-CORRUPTION with a witness.
Opening path: does not promise absence of allocations."
  (check-scan-arguments buffer start end file-id version log-kind file-offset file-size
                        max-bytes max-batches max-batch-records max-batch-bytes max-search-bytes)
  (scan-prefix buffer start end file-id version log-kind file-offset
               max-batches max-batch-records max-batch-bytes max-search-bytes))
