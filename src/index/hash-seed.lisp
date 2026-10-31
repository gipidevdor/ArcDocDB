;;; OWNER: controller fornisce un seme per Serie prima della costruzione dell'indice.
;;; SHARED: due u32 read-only dell'indice; nessuna generazione casuale o cambio seme implicito.
(in-package #:arcdocdb.index.primary)
(declaim (optimize (safety 3) (speed 3) (debug 2)))

;;; REQ: REQ-IDX-001 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (indice-primario) (values u32 u32 &optional)) esigi-seme-hash))
(defun esigi-seme-hash (index)
  "Pre: canonical index. Post: two immutable u32 values from hash configuration.
Pair health and consistency verified; absent => INVALID-ARGUMENT :primary-hash-unconfigured.
Inconsistent internal pair => FAULTED with :primary-hash-seed-corrupt, without a normal digest."
  (esigi-indice-sano index)
  (when (null (indice-primario-seed-high index))
    (unless (null (indice-primario-seed-low index)) (guasto-indice index :primary-hash-seed-corrupt))
    (error 'invalid-argument :reason :primary-hash-unconfigured))
  (when (null (indice-primario-seed-low index)) (guasto-indice index :primary-hash-seed-corrupt))
  (values (indice-primario-seed-high index) (indice-primario-seed-low index)))

;;; REQ: REQ-IDX-001 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (indice-primario t t t u32 u32) (values u32 u32 &optional)) hash-con-seme-indice))
(defun hash-con-seme-indice (index key start end high low)
  "Pre: healthy owning index and owned seed. Post: two u32 values; external rejections propagated.
Kernel INVARIANT-VIOLATION makes the index terminal and resignals the same condition."
  (handler-case (arcdocdb.hash64:xxh64 key start end high low)
    (invariant-violation (condition) (invalida-indice-primario index) (error condition))))

;;; REQ: REQ-IDX-001 REQ-LIM-003 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (indice-primario t t t) (values u32 u32 &optional)) digest-chiave-indice))
(defun digest-chiave-indice (index key start end)
  "Pre: caller's unchanged span, configured seed, and healthy index on entry.
Post: two XXH64 u32 values computed with the immutable Serie seed, no writes.
Hashing an empty span is allowed; the writer separately validates minimum key length.
Hash kernel rejections and :primary-hash-unconfigured; the digest is not a lookup result.
Internal kernel assertion: index FAULTED, original condition propagated."
  (multiple-value-bind (high low) (esigi-seme-hash index)
    (hash-con-seme-indice index key start end high low)))
