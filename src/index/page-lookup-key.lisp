;;; OWNER: lettore seriale; bucket preservato mentre una chiave esterna usa il secondo scratch.
;;; SHARED: nessuno; i confronti non espongono frame della cache.
(in-package #:arcdocdb.index.page)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-001 REQ-IDX-009 REQ-LIM-003
(declaim (ftype (function (lettore-indice-pagine octets index octets index index) boolean)
                confronta-byte-lookup))
(defun confronta-byte-lookup (reader buffer offset key start count)
  "Pre: verified intervals and equal-length keys. Post: complete byte comparison.
Cumulative budget charged before comparison, even on mismatch; no allocation."
  (when (> count (lettore-indice-pagine-key-remaining reader))
    (error 'arcdocdb.conditions:resource-exhausted :reason :index-page-lookup-key-budget))
  (decf (lettore-indice-pagine-key-remaining reader) count)
  (loop for i below count always (= (aref buffer (+ offset i)) (aref key (+ start i)))))

;;; REQ: REQ-IDX-001 REQ-IDX-009 REQ-LIM-003 REQ-AFF-002
(declaim (ftype (function (lettore-indice-pagine octets index index index page-number page-number)
                         boolean) confronta-chiave-esterna))
(defun confronta-chiave-esterna (reader key start length total page generation)
  "Pre: verified external reference in bucket, entry total. Post: complete consistent chain.
Verifies total and position of every fragment even after mismatch; no partial result.
Loops bounded by page credits, codec's descending topology, and total <=65535."
  (let ((buffer (lettore-indice-pagine-key-page reader)) (position 0) (same (= length total)))
    (loop repeat (lettore-indice-pagine-max-pages reader) do
      (leggi-pagina-lookup reader page generation buffer)
      (unless (and (= (aref buffer +off-kind+) 3)
                   (= (leggi-u32 buffer +off-count+) total)
                   (= (leggi-u32 buffer +off-parameter+) position))
        (error 'corruption-detected :reason :index-page-lookup-key-chain))
      (let ((used (leggi-u32 buffer +off-used+)))
        (when (= length total)
          (unless (confronta-byte-lookup reader buffer +page-header+ key (+ start position) used)
            (setf same nil)))
        (incf position used))
      (setf page (leggi-u64 buffer +off-next+) generation (leggi-u64 buffer +off-next-generation+))
      (when (zerop page)
        (unless (= position total) (error 'corruption-detected :reason :index-page-lookup-key-chain))
        (return-from confronta-chiave-esterna same)))
    (error 'arcdocdb.conditions:resource-exhausted :reason :index-page-lookup-page-budget)))

;;; REQ: REQ-IDX-001 REQ-IDX-009 REQ-LIM-003
(declaim (ftype (function (lettore-indice-pagine index octets index index) boolean) chiave-entry-uguale-p))
(defun chiave-entry-uguale-p (reader entry key start end)
  "Pre: verified bucket in scratch. Post: equal digest does not replace key bytes.
Inline key or external chain verified under the same request budgets."
  (let* ((buffer (lettore-indice-pagine-bucket reader)) (total (leggi-u16 buffer (+ entry +entry-key-length+))))
    (if (zerop (leggi-u16 buffer (+ entry +entry-flags+)))
        (and (= total (- end start))
             (confronta-byte-lookup reader buffer (+ +page-header+ (leggi-u32 buffer (+ entry +entry-key-offset+)))
                                   key start total))
        (confronta-chiave-esterna reader key start (- end start) total
          (leggi-u64 buffer (+ entry +entry-key-page+)) (leggi-u64 buffer (+ entry +entry-key-generation+))))))
