;;;; Descriptor freddo: copie possedute di configurazione e mappa PUT autorevole.
;;; OWNER: costruttore, poi immutabile. SHARED: sole letture fra worker della Serie.
(in-package #:arcdocdb.fulltext.codec)
(declaim (optimize (safety 3) (debug 2)))

;;; REQ: REQ-SEC-008
(declaim (ftype (function (octets index index) (values u64 u32 index &optional)) meta-limiti))
(defun meta-limiti (buffer start end)
  "Pre: bounded META, cold path. Post: five positive limits, term/token and end.
u64 integers reassembled only here, before hot paths. Tokens beyond u32 are corruption."
  (multiple-value-bind (count cursor) (meta-conteggio buffer start end 5 5)
    (unless (= count 5) (error 'invariant-violation :reason :fulltext-limits-width))
    (let ((term 0) (tokens 0))
      (dotimes (i 5)
        (multiple-value-bind (high low next) (meta-positivo buffer cursor end)
          (when (= i 1) (setf term (logior (ash high 32) low)))
          (when (= i 2)
            (unless (zerop high) (error 'corruption-detected :reason :fulltext-meta-token-limit))
            (setf tokens low))
          (setf cursor next)))
      (unless (and (plusp term) (plusp tokens)) (error 'invariant-violation :reason :fulltext-limits-result))
      (values term tokens cursor))))

;;; REQ: REQ-SEC-008
(declaim (ftype (function (octets index index) index) meta-identificativi))
(defun meta-identificativi (meta start end)
  "Pre: after the root array. Post: three positive u64 identifiers consumed."
  (let ((cursor start))
    (dotimes (i 3)
      (multiple-value-bind (high low next) (meta-positivo meta cursor end)
        (unless (or (plusp high) (plusp low)) (error 'invariant-violation :reason :fulltext-id-positive))
        (setf cursor next)))
    (unless (<= cursor end) (error 'invariant-violation :reason :fulltext-ids-result))
    cursor))

;;; REQ: REQ-SEC-008
(declaim (ftype (function (octets u64 octets index index simple-bit-vector)
                         (values vettore-u32 u64 u32 &optional)) verifica-meta-descrittore))
(defun verifica-meta-descrittore (meta source-bytes hint hint-start hint-end rows)
  "Pre: validated span and types. Post: complete META bound to hint bytes and PUT map.
Hint validity and record outcomes are the caller's responsibility."
  (let* ((end (length meta)) (cursor 0))
    (multiple-value-bind (count next) (meta-conteggio meta 0 end 12 12)
      (unless (= count 12) (error 'invariant-violation :reason :fulltext-meta-root)) (setf cursor next))
    (setf cursor (meta-identificativi meta cursor end)
          cursor (meta-intero-esatto meta cursor end source-bytes)
          cursor (meta-intero-esatto meta cursor end (- hint-end hint-start))
          cursor (meta-intero-esatto meta cursor end (crc32c hint hint-start hint-end))
          cursor (meta-intero-esatto meta cursor end (length rows)))
    (multiple-value-bind (begin next) (meta-testo meta cursor end 1 64)
      (unless (span-uguali-p meta begin next +profile+ 0 (length +profile+))
        (error 'unsupported-format :reason :fulltext-profile)) (setf cursor next))
    (setf cursor (meta-intero-esatto meta cursor end 1))
    (multiple-value-bind (fields next) (meta-campi meta cursor end)
      (multiple-value-bind (term tokens after) (meta-limiti meta next end)
        (setf cursor (meta-intero-esatto meta after end (count 1 rows)))
        (unless (= cursor end) (error 'corruption-detected :reason :fulltext-meta-trailing :offset cursor))
        (values fields term tokens)))))

;;; REQ: REQ-SEC-008 REQ-SEC-010
(declaim (ftype (function (t t t t t t t t &key (:max-memory t)) descrittore-full-text)
                crea-descrittore-full-text))
(defun crea-descrittore-full-text (meta identity segment source-bytes hint hint-start hint-end rows
                                 &key (max-memory 67108864))
  "Pre: authoritative configuration, immutable verified hint, resolved committed-PUT bitmap.
META is a minimal CBOR array; ROWS[i]=1 only for committed PUTs in the prefix, including historical ones.
Post: immutable private copies of META/identity/bitmap and fields; no hint reference.
Does not certify hint, documents, inventory, MVCC, or readiness. INVALID-ARGUMENT for arguments;
CORRUPTION-DETECTED for inconsistent META, UNSUPPORTED-FORMAT for an unknown profile;
RESOURCE-EXHAUSTED before copies beyond budget. Cold constructor, no I/O."
  (unless (and (typep meta 'octets) (<= 1 (length meta) 65536)
               (typep identity 'octets) (= (length identity) 16) (typep segment 'u64)
               (typep source-bytes 'u64) (typep hint 'octets) (typep hint-start 'index)
               (typep hint-end 'index) (<= hint-start hint-end (length hint))
               (typep rows 'simple-bit-vector) (<= (length rows) 4294967296)
               (typep max-memory 'index))
    (error 'invalid-argument :reason :fulltext-descriptor-input))
  (when (> (+ (* 32 (length meta)) (ceiling (length rows) 8) 8192) max-memory)
    (error 'resource-exhausted :reason :fulltext-descriptor-memory))
  (multiple-value-bind (fields term tokens)
      (verifica-meta-descrittore meta source-bytes hint hint-start hint-end rows)
    (%descrittore-full-text (copy-seq meta) (copy-seq identity) (list segment) (copy-seq rows) fields term tokens)))
