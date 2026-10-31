;;; OWNER: writer logico; il buffer privato non attraversa API di mutazione esterne.
;;; SHARED: token locale; solo il registro CSN di Archivio toccato dal ponte alla chiusura/risoluzione.
(in-package #:arcdocdb.wal)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-WAL-005
(declaim (ftype (function (lotto keyword) null) esigi-lotto))
(defun esigi-lotto (lotto state)
  "Pre: writer capability. Post: required state; INVALID-ARGUMENT on premature reuse."
  (unless (eq (lotto-state lotto) state) (error 'invalid-argument :reason :lotto-state))
  (unless (<= (lotto-used lotto) (length (lotto-buffer lotto)))
    (error 'invariant-violation :reason :lotto-length))
  nil)

;;; REQ: REQ-WAL-005 REQ-AFF-008
(declaim (ftype (function (lotto u8 octets octets &key (:flags u8) (:txid u64)) index) aggiungi-record))
(defun aggiungi-record (lotto kind key value &key (flags 0) (txid 0))
  "Pre: open batch, stable inputs. Post: record copied, SEAL space always reserved.
Budget/format rejection before mutation; ordinary stamp set at closure.
RESOURCE-EXHAUSTED/INVALID-ARGUMENT; prepares bytes, no durable atomicity point."
  (esigi-lotto lotto :open)
  (when (lotto-csn-registry lotto) (error 'invalid-argument :reason :lotto-csn-bound))
  (unless (log-record-p (lotto-kind lotto) kind)
    (error 'invalid-argument :reason :lotto-record-kind))
  (when (or (= (lotto-count lotto) (length (lotto-offsets lotto)))
            (> (+ +header-bytes+ (length key) (length value) +seal-total+)
               (- (length (lotto-buffer lotto)) (lotto-used lotto))))
    (error 'resource-exhausted :reason :lotto-capacity))
  (let* ((start (lotto-used lotto))
         (end (scrivi-record (lotto-buffer lotto) start kind txid key value
                            :version (lotto-version lotto) :flags flags)))
    (setf (aref (lotto-offsets lotto) (lotto-count lotto)) start
          (lotto-used lotto) end)
    (incf (lotto-count lotto))
    (unless (<= (+ end +seal-total+) (length (lotto-buffer lotto)))
      (error 'invariant-violation :reason :lotto-seal-space))
    end))

;;; REQ: REQ-WAL-005
(declaim (ftype (function (lotto u32 u32) u32) ristampa-record-parole))
(defun ristampa-record-parole (lotto high low)
  "Pre: exclusive buffer written by the codec. Post: ordinary CSNs and aggregate CRC.
Prepared/OUTCOME/DECISION TXIDs unchanged; no body scan or copy.
INVARIANT-VIOLATION for corrupt count/offset before accessing the corresponding header."
  (esigi-lotto lotto :open)
  (unless (<= (lotto-count lotto) (length (lotto-offsets lotto)))
    (error 'invariant-violation :reason :lotto-record-count))
  (let ((buffer (lotto-buffer lotto)) (checksum 0))
    (dotimes (i (lotto-count lotto) checksum)
      (let ((pos (aref (lotto-offsets lotto) i)))
        (unless (<= (+ pos +header-bytes+) (lotto-used lotto))
          (error 'invariant-violation :reason :lotto-record-offset))
        (let ((kind (aref buffer (+ pos +type-offset+)))
              (flags (aref buffer (+ pos +flags-offset+))))
          (when (and (or (= kind +put+) (= kind +tombstone+) (= kind +edit+)) (not (logbitp 0 flags)))
            (scrivi-u32 buffer (+ pos +stamp-offset+) low)
            (scrivi-u32 buffer (+ pos +stamp-offset+ 4) high)
            (scrivi-u32 buffer pos (crc32c buffer (+ pos +body-crc-offset+) (+ pos +header-bytes+))))
          (setf checksum (crc32c buffer pos (+ pos +header-crc-bytes+) checksum)))))))

;;; REQ: REQ-WAL-005 REQ-AFF-008
(declaim (ftype (function (lotto file-offset file-offset) null) verifica-chiusura-lotto))
(defun verifica-chiusura-lotto (lotto file-start durable)
  "Pre: exclusive writer. Post: open batch and valid SEAL space/offsets before CSN assignment.
INVALID-ARGUMENT for offsets; INVARIANT-VIOLATION for corrupt internal budget."
  (esigi-lotto lotto :open)
  (unless (and (<= durable file-start)
               (<= (+ file-start (lotto-used lotto) +seal-total+) most-positive-fixnum))
    (error 'invalid-argument :reason :lotto-offset))
  (unless (and (<= (lotto-count lotto) (length (lotto-offsets lotto)))
               (<= (+ (lotto-used lotto) +seal-total+) (length (lotto-buffer lotto))))
    (error 'invariant-violation :reason :lotto-seal-space))
  nil)

;;; REQ: REQ-WAL-005 REQ-AFF-008
(declaim (ftype (function (lotto u32 u32 file-offset file-offset) index) sigilla-lotto-parole))
(defun sigilla-lotto-parole (lotto high low file-start durable)
  "Pre: verifica-chiusura-lotto completed; writer-private buffer and u32 CSN words.
Post: records and SEAL with complete CRCs; immutable buffer, SEAL only prepared before I/O.
INVARIANT-VIOLATION for inconsistent final length; no rollback of an already acquired CSN."
  (let ((seal (lotto-seal-value lotto)) (checksum (ristampa-record-parole lotto high low)))
    (scrivi-u64 seal +seal-batch-start-offset+ file-start)
    (scrivi-u64 seal +seal-durable-offset+ durable)
    (scrivi-u32 seal +seal-count-offset+ (lotto-count lotto))
    (scrivi-u32 seal +seal-checksum-offset+ checksum)
    (setf (lotto-used lotto)
          (scrivi-record-parole (lotto-buffer lotto) (lotto-used lotto) +seal+ high low
                                (lotto-empty-key lotto) seal :version (lotto-version lotto))
          (lotto-start lotto) file-start
          (lotto-state lotto) :sealed)
    (unless (<= +seal-total+ (lotto-used lotto) (length (lotto-buffer lotto)))
      (error 'invariant-violation :reason :lotto-sealed-length))
    (lotto-used lotto)))

;;; REQ: REQ-WAL-005 REQ-AFF-008
(declaim (ftype (function (lotto u64 file-offset file-offset) index) sigilla-lotto))
(defun sigilla-lotto (lotto stamp file-start durable)
  "Pre: stamp acquired by caller, no bridge CSN association; historical durable frontier.
Post: sealed buffer; SEAL prepared, atomic point persisted by subsequent write/flush.
INVALID-ARGUMENT before modification; neither registers nor resolves the caller's CSN."
  (verifica-chiusura-lotto lotto file-start durable)
  (when (lotto-csn-registry lotto) (error 'invalid-argument :reason :lotto-csn-bound))
  (sigilla-lotto-parole lotto (ldb (byte 32 32) stamp) (ldb (byte 32 0) stamp) file-start durable))

;;; REQ: REQ-WAL-005 REQ-AFF-008
(declaim (ftype (function (lotto) null) verifica-ritiro-lotto))
(defun verifica-ritiro-lotto (lotto)
  "Pre: task never delivered or retired with synchronized proof from caller.
Post: sealed buffer and no owning group; INVALID-ARGUMENT otherwise.
No mutation or independent attestation about the scheduler."
  (esigi-lotto lotto :sealed)
  (unless (null (lotto-owner lotto)) (error 'invalid-argument :reason :lotto-owned))
  nil)

;;; REQ: REQ-WAL-005 REQ-AFF-008
(declaim (ftype (function (lotto) null) verifica-riuso-lotto))
(defun verifica-riuso-lotto (lotto)
  "Pre: writer observes I/O completion and retirement from group. Post: reuse admissible.
INVALID-ARGUMENT for state, pending CSN, or owning group; no mutation.
RESOURCE-EXHAUSTED before effects if incarnation cannot advance without wrap.
Does not attest to retirement of external references, which remains the controller's obligation."
  (esigi-lotto lotto :durable)
  (when (lotto-csn-pending lotto) (error 'invalid-argument :reason :lotto-csn-pending))
  (unless (null (lotto-owner lotto)) (error 'invalid-argument :reason :lotto-owned))
  (when (= (lotto-incarnation lotto) most-positive-fixnum)
    (error 'resource-exhausted :reason :lotto-incarnation))
  nil)

;;; REQ: REQ-WAL-005 REQ-AFF-008
(declaim (ftype (function (lotto) null) riusa-lotto))
(defun riusa-lotto (lotto)
  "Pre: durable, removed from group, and no in-flight consumer/reference.
Post: same buffer, open and empty, incarnation advanced without wrap.
Rejections before effects; does not attest to reclamation or absence of external references."
  (verifica-riuso-lotto lotto)
  (incf (lotto-incarnation lotto))
  (setf (lotto-used lotto) 0 (lotto-count lotto) 0 (lotto-start lotto) 0 (lotto-state lotto) :open
        (lotto-csn-registry lotto) nil (lotto-csn-log lotto) nil (lotto-csn-pending lotto) nil
        (lotto-csn-slot lotto) 0 (lotto-csn-high lotto) 0 (lotto-csn-low lotto) 0)
  nil)

;;; REQ: REQ-WAL-005
(declaim (ftype (function (lotto) keyword) stato-lotto)
         (ftype (function (lotto) index) lunghezza-lotto)
         (ftype (function (lotto) file-offset) inizio-lotto))
(defun stato-lotto (lotto)
  "Pre: owned capability. Post: observed state without mutation." (lotto-state lotto))
;;; REQ: REQ-WAL-005
(defun lunghezza-lotto (lotto)
  "Pre: owned capability. Post: number of occupied bytes, without I/O." (lotto-used lotto))
;;; REQ: REQ-WAL-005
(defun inizio-lotto (lotto)
  "Pre: closed batch. Post: planned file offset, without modification." (lotto-start lotto))
