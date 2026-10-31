;;;; Prefisso CLOSED di un segmento compattato; nessun I/O, replay o classificazione TAIL.
;;; OWNER: chiamante; buffer stabile, identità e limite valido da fonte autorevole.
;;; SHARED: nessuna scrittura condivisa tra Serie, lock o contatore globale.
(in-package #:arcdocdb.storage.format)
(declaim (optimize (safety 3) (debug 2)))

;;; REQ: REQ-FOR-001 REQ-FOR-002 REQ-AFF-008
(declaim (ftype (function (octets integer octets integer integer) (values index &optional))
                check-compaction-arguments))
(defun check-compaction-arguments (buffer valid-bytes id-serie max-bytes max-records)
  "Pre: typed arguments. Post: authoritative limit and finite budgets validated even when empty.
INVALID-ARGUMENT for configuration; RESOURCE-EXHAUSTED for bytes beyond budget,
before header verification. No byte read or modified."
  (unless (and (typep valid-bytes 'index)
               (<= +segment-header-bytes+ valid-bytes +segment-max-bytes+)
               (<= valid-bytes (length buffer))
               (<= +segment-header-bytes+ max-bytes +segment-max-bytes+)
               (typep max-records 'index) (= (length id-serie) +serie-id-bytes+))
    (error 'invalid-argument :reason :compaction-arguments :offset 0))
  (check-range buffer 0 valid-bytes)
  (when (> valid-bytes max-bytes)
    (error 'resource-exhausted :reason :compaction-byte-budget :offset 0))
  (the index valid-bytes))

;;; REQ: REQ-FOR-003 REQ-CMP-009
(declaim (ftype (function (octets index index u16) (values index u8 &optional))
                verifica-record-compattato))
(defun verifica-record-compattato (buffer pos end version)
  "Pre: stable range and version from header. Post: ordinary PUT/TOMBSTONE frame,
increasing end and type; does not materialize u64 stamp. Propagates codec errors,
CORRUPTION-DETECTED for type/prepared, INVARIANT-VIOLATION for impossible progress."
  (multiple-value-bind (next kind flags ks ke vs ve)
      (verifica-cornice buffer pos end :version version)
    (declare (ignore ks ke vs ve))
    (unless (and (< pos next) (<= next end))
      (error 'invariant-violation :reason :compaction-progress :offset pos))
    (unless (or (= kind +put+) (= kind +tombstone+))
      (error 'corruption-detected :reason :compaction-record-kind :offset pos))
    (when (logtest flags +prepared+)
      (error 'corruption-detected :reason :compaction-prepared :offset pos))
    (values next kind)))

;;; REQ: REQ-FOR-003 REQ-CMP-009 REQ-AFF-008
(declaim (ftype (function (octets index index u16 index)
                         (values index index index index &optional)) scansiona-compattato))
(defun scansiona-compattato (buffer start end version max-records)
  "Pre: verified header, authoritative boundaries, and valid budgets. Post: exact end and counts,
only after complete contiguous frames; tail beyond END ignored. RESOURCE-EXHAUSTED
before the record exceeding budget; INVARIANT-VIOLATION for counts or internal bound."
  (check-range buffer start end)
  (let ((pos start) (count 0) (puts 0) (tombstones 0))
    (declare (type index pos count puts tombstones))
    (loop repeat (1+ (floor (- end start) +header-bytes+))
          do (when (= pos end)
               (return-from scansiona-compattato (values pos count puts tombstones)))
             (when (>= count max-records)
               (error 'resource-exhausted :reason :compaction-record-budget :offset pos))
             (multiple-value-bind (next kind) (verifica-record-compattato buffer pos end version)
               (if (= kind +put+) (incf puts) (incf tombstones))
               (incf count)
               (unless (and (= count (+ puts tombstones))
                            (<= count (floor (- next start) +header-bytes+)))
                 (error 'invariant-violation :reason :compaction-count :offset pos))
               (setf pos next)))
    (error 'invariant-violation :reason :compaction-loop-bound :offset start)))

;;; REQ: REQ-FOR-001 REQ-FOR-002 REQ-FOR-003 REQ-CMP-009 REQ-AFF-008
(declaim (ftype (function (octets integer octets u64
                                &key (:max-bytes integer) (:max-records integer))
                         (values index u16 index index index &optional))
                verifica-segmento-compattato))
(defun verifica-segmento-compattato (buffer valid-bytes id-serie segment-id
                                   &key (max-bytes 67108864) (max-records 65536))
  "Pre: stable BUFFER from byte zero, authoritative identities, VALID-BYTES within buffer.
Post: VALID-BYTES, version, total/PUT/TOMBSTONE count after complete verification;
compaction origin only, opaque CSNs, no physical-tail read or mutation.
INVALID-ARGUMENT for configuration/writer origin; typed header,
frame, prepared, and budget errors propagated. No CBOR semantics, visibility, or durability."
  (let ((end (check-compaction-arguments buffer valid-bytes id-serie max-bytes max-records)))
    (multiple-value-bind (start version origine created-at)
        (verifica-header-segmento buffer 0 end id-serie segment-id)
      (declare (ignore created-at))
      (unless (= origine +compaction-origin+)
        (error 'invalid-argument :reason :compaction-origin :offset 0))
      (multiple-value-bind (next count puts tombstones)
          (scansiona-compattato buffer start end version max-records)
        (unless (and (= next end) (= count (+ puts tombstones)))
          (error 'invariant-violation :reason :compaction-result :offset next))
        (values next version count puts tombstones)))))
