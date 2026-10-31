;;; OWNER: controller/pool I/O prima della pubblicazione; buffer esclusivo riusabile dopo il ritorno.
;;; SHARED: manifest immutabile della stessa Serie; nessuna scrittura durevole o swap qui.
(in-package #:arcdocdb.get.resolver)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-008 REQ-FOR-003 REQ-IDX-001
(declaim (ftype (function (u32 u32 u32 u32 u32 integer) null) verifica-budget-resolver))
(defun verifica-budget-resolver (bytes records batches batch-records batch-bytes payload)
  "Pre: constructor configuration. Post: consistent finite limits before I/O or allocation.
INVALID-ARGUMENT for zero/inconsistent bounds; does not alter files or published structures."
  (unless (and (<= +segment-header-bytes+ bytes +segment-max-bytes+)
               (plusp records) (plusp batches) (plusp batch-records)
               (<= (+ +header-bytes+ arcdocdb.record::+seal-bytes+) batch-bytes bytes)
               (<= 0 payload most-positive-fixnum))
    (error 'invalid-argument :reason :resolver-configuration))
  nil)

;;; REQ: REQ-STO-006 REQ-FOR-004 REQ-AFF-008
(declaim (ftype (function (manifest u32 octets u32) u32) frontiera-closed-resolver))
(defun frontiera-closed-resolver (manifest id buffer max-bytes)
  "Pre: manifest from the view's Serie, positive ID compatible with primary v2.
Post: CLOSED without additional EDIT outcomes, authoritative frontier within buffer and budget.
INVALID-ARGUMENT for unsupported state/EDIT, RESOURCE-EXHAUSTED for capacity.
Does not replace valid-bytes with EOF; ACTIVE requires the future writer path."
  (unless (plusp id) (error 'invalid-argument :reason :resolver-segment-id))
  (multiple-value-bind (state end outcomes) (trova-segmento manifest id)
    (unless (eq state :closed) (error 'invalid-argument :reason :resolver-segment-not-closed))
    (unless (zerop outcomes) (error 'invalid-argument :reason :resolver-edit-proof-unsupported))
    (unless (<= +segment-header-bytes+ end +segment-max-bytes+)
      (error 'corruption-detected :reason :resolver-manifest-boundary))
    (when (or (> end max-bytes) (> end (length buffer)))
      (error 'resource-exhausted :reason :resolver-source-budget))
    (the u32 end)))

;;; REQ: REQ-FOR-003 REQ-FOR-004 REQ-AFF-008
(declaim (ftype (function (octets u32 segmento-get u32 u32 u32 u32) null) verifica-sorgente-resolver))
(defun verifica-sorgente-resolver (buffer end segment records batches batch-records batch-bytes)
  "Pre: bytes from the capability's FD, CLOSED and frontier from the manifest.
Post: writer origin => prefix of whole batches; compaction => ordinary frames only.
Propagates corruption/budget errors; no interpretation of tail beyond END or visibility."
  (case (segmento-get-origin segment)
    (#.+writer-origin+
     (verifica-prefisso-writer buffer end (segmento-get-low segment)
                              (segmento-get-version segment) batches records batch-records batch-bytes))
    (#.+compaction-origin+
     (multiple-value-bind (next version count puts tombstones)
         (verifica-segmento-compattato buffer end
          (vista-get-serie-identity (segmento-get-owner segment)) (segmento-get-low segment)
          :max-bytes end :max-records records)
       (unless (and (= next end) (= version (segmento-get-version segment))
                    (= count (+ puts tombstones)) (<= count records))
         (error 'invariant-violation :reason :resolver-compaction-result))))
    (otherwise (error 'invariant-violation :reason :resolver-segment-origin)))
  nil)

;;; REQ: REQ-IDX-001 REQ-FOR-004 REQ-AFF-008
(declaim (ftype (function (octets u32 segmento-get u32 index) mappa-segmento-get)
                costruisci-righe-resolver))
(defun costruisci-righe-resolver (buffer end segment max-records payload)
  "Pre: entire prefix verified, stable exclusive buffer. Post: complete compact map.
Payload preflight before arrays: 24*PUT + 20*OUTCOME, plus 20*OUTCOME+1024 if at least two.
RESOURCE-EXHAUSTED on the authorized peak; no reference to proofs or source retained."
  (multiple-value-bind (puts outcomes) (conta-voci-resolver buffer end (segmento-get-version segment) max-records)
    (let ((peak (+ (* 4 +row-words+ puts) (* 4 +proof-words+ outcomes)
                   (if (> outcomes 1) (+ (* 4 +proof-words+ outcomes) (* 4 +radix-buckets+)) 0))))
      (when (> peak payload) (error 'resource-exhausted :reason :resolver-payload-budget))
      (let* ((proofs (make-array (* outcomes +proof-words+) :element-type '(unsigned-byte 32)
                                :initial-element 0))
             (rows (make-array (* puts +row-words+) :element-type '(unsigned-byte 32) :initial-element 0)))
        (unless (zerop outcomes)
          (copia-prove-resolver buffer end (segmento-get-version segment) proofs))
        (setf proofs (ordina-prove-resolver proofs))
        (copia-righe-resolver buffer end (segmento-get-version segment) proofs rows)
        (unless (= (* 4 (length rows)) (* 4 +row-words+ puts))
          (error 'invariant-violation :reason :resolver-payload-result))
        (%make-mappa-segmento-get segment end rows)))))

;;; REQ: REQ-IDX-001 REQ-FOR-001 REQ-FOR-003 REQ-FOR-004 REQ-CMP-007 REQ-AFF-008
(declaim (ftype (function (vista-get-serie file-io manifest u32 octets
                         &key (:max-bytes u32) (:max-records u32) (:max-batches u32)
                         (:max-batch-records u32) (:max-batch-bytes u32) (:budget-payload integer))
                         mappa-segmento-get) crea-mappa-segmento-get))
(defun crea-mappa-segmento-get (view file manifest id buffer
                               &key (max-bytes 268435456) (max-records 1048576) (max-batches 65536)
                                    (max-batch-records 65536) (max-batch-bytes 67108864)
                                    (budget-payload 67108864))
  "Pre: I/O pool, immutable CLOSED; manifest/view of the same Serie; exclusive buffer.
Post: capability and map from the same read-only FD, no bytes beyond the frontier read.
Propagates typed errors; no opening, closing, publication, or durable change.
The caller keeps the FD open until EBR reclamation; failure publishes no partial map."
  (verifica-budget-resolver max-bytes max-records max-batches max-batch-records max-batch-bytes budget-payload)
  (let* ((end (frontiera-closed-resolver manifest id buffer max-bytes))
         (segment (crea-segmento-get view file id buffer)))
    (when (> end +segment-header-bytes+)
      (unless (= (leggi-esatto file buffer +segment-header-bytes+ end +segment-header-bytes+)
                 end)
        (error 'invariant-violation :reason :resolver-source-read)))
    (verifica-sorgente-resolver buffer end segment max-records max-batches max-batch-records max-batch-bytes)
    (costruisci-righe-resolver buffer end segment max-records budget-payload)))
