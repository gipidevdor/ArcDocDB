;;; OWNER: solo attore M1; token e contatori seguono il replay o il commit prima di admission/ACK.
;;; SHARED: nessuno; identita' di prefisso append-only, nessun hash probabilistico.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-010 REQ-REC-001 REQ-AFF-008
(declaim (ftype (function (motore u64 u64 index index) null) registra-fonte-indice-motore))
(defun registra-fonte-indice-motore (engine csn segment offset bytes)
  "Pre: committed M1 record published in the private index, strict CSN order, no compaction.
Post: exact 32-byte token (version, segment, offset, length), last CSN separate.
Segments are not rewritten and IDs are not reused; the immutable prefix identifies the M1 source.
Before the first record the token contains only the version; tombstones advance the source."
  (unless (and (plusp segment) (plusp bytes)
               (or (zerop (b:leggi-u64 (motore-source-token engine) 8)) (> csn (motore-source-csn engine))))
    (error 'invariant-violation :reason :engine-image-source-order))
  (let ((token (motore-source-token engine)))
    (b:scrivi-u64 token 0 (motore-version engine)) (b:scrivi-u64 token 8 segment)
    (b:scrivi-u64 token 16 offset) (b:scrivi-u64 token 24 bytes)
    (setf (motore-source-csn engine) csn))
  (incf (motore-history-records engine))
  nil)

;;; REQ: REQ-IDX-010 REQ-IDX-001 REQ-AFF-008
(declaim (ftype (function (motore) arcdocdb.index.page:fonte-indice) fonte-canonica-indice-motore))
(defun fonte-canonica-indice-motore (engine)
  "Pre: canonical replay completed, exclusive owner; M1 root without split.
Post: owned token copies and exact cardinality of the authoritative fragment.
A future split/compaction backend requires a new source binding and does not reuse this contract."
  (when (motore-automatic-index engine)
    (return-from fonte-canonica-indice-motore
      (arcdocdb.index.page:crea-fonte-indice (motore-archive-id engine) (motore-series-id engine)
        (motore-source-token engine) (motore-source-csn engine) (automatic-index-controller-count (motore-automatic-index engine)))))
  (p::esigi-indice-sano (motore-index engine))
  (let* ((root (p::acquisisci-root (motore-index engine))) (directory (p::root-indice-directory root)))
    (unless (and (zerop (p::root-indice-depth root)) (= (length directory) 1))
      (error 'unsupported-format :reason :engine-image-source-outside-m1))
    (let ((fragment (svref directory 0)))
      (p::esigi-frammento-sano (motore-index engine) fragment)
      (arcdocdb.index.page:crea-fonte-indice (motore-archive-id engine) (motore-series-id engine)
        (motore-source-token engine) (motore-source-csn engine) (p::frammento-indice-live fragment)))))

;;; REQ: REQ-IDX-010 REQ-CON-002
(declaim (ftype (function (motore) arcdocdb.index.page:fonte-indice) fonte-indice-motore))
(defun fonte-indice-motore (engine)
  "Pre: owner and READY engine without a request in flight. Post: copied snapshot of the current source.
Does not lend the index or FD; becomes stale at the next commit, no reservation or I/O."
  (esigi-motore-pronto engine)
  (fonte-canonica-indice-motore engine))

;;; REQ: REQ-IDX-010 REQ-CON-002
(declaim (ftype (function (motore) (member :resident :paged)) modo-indice-motore))
(defun modo-indice-motore (engine)
  "Pre: serial READY owner. Post: backend for the next GET, no effect or migration guarantee."
  (esigi-motore-pronto engine)
  (if (if (motore-automatic-index engine) (automatic-index-controller-disk (motore-automatic-index engine))
          (motore-paged engine)) :paged :resident))

;;; REQ: REQ-IDX-010 REQ-IDX-011 REQ-IDX-001 REQ-AFF-008
(declaim (ftype (function (motore octets integer integer p:contesto-indice
                                (simple-array (unsigned-byte 64) (5)))
                         (member :live :absent :retry-limit)) sonda-indice-motore))
(defun sonda-indice-motore (engine key start end probe destination)
  "Pre: GET admitted in the M1 actor context, stable current index, private scratch.
Post: location/tombstone from delta, otherwise image if active; errors propagated without fallback. No intended allocation."
  (esigi-owner-motore engine)
  (unless (motore-busy engine) (error 'invariant-violation :reason :engine-image-lookup-admission))
  (when (motore-automatic-index engine)
    (return-from sonda-indice-motore (probe-automatic-index engine key start end probe destination)))
  (let ((paged (motore-paged engine)))
    (when (and (motore-delta engine) (null paged))
      (error 'invariant-violation :reason :engine-delta-without-image))
    (if paged
        (case (leggi-delta-motore engine key start end destination)
          (:live :live)
          (:absent :absent)
          (:untracked (arcdocdb.index.page:leggi-vista-indice-paginato paged key start end destination))
          (otherwise (error 'invariant-violation :reason :engine-delta-lookup-result)))
        (multiple-value-bind (high low) (p:digest-chiave-indice (motore-index engine) key start end)
          (p:leggi-indice-primario (motore-index engine) key start end high low probe destination)))))
