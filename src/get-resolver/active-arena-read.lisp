;;; OWNER: GET worker with an acquired immutable root under its existing EBR pin.
;;; SHARED: only captured prefix bounds authorize reads; the writer's initialized-tail counter is never read.
(in-package #:arcdocdb.get.resolver)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-001 REQ-WAL-006 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (contesto-get radice-get-attiva) arena-get-attiva) verifica-prefisso-arena-attiva))
(defun verifica-prefisso-arena-attiva (context root)
  "Pre: CANDIDATE with root acquired after pinning. Post: complete fixed geometry and captured immutable bounds.
No reader access to the unpublished suffix or writer counter; malformed prefix faults GET, never means absence."
  (let* ((source (radice-get-attiva-source root)) (arena (sorgente-get-attiva-arena source)))
    (unless (and arena (geometria-arena-attiva-p source arena)) (guasto-get context :active-append-prefix))
    (unless (prefisso-arena-attiva-p root arena) (guasto-get context :active-append-prefix))
    arena))

;;; REQ: REQ-IDX-001 REQ-CMP-007 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (contesto-get radice-get-attiva arena-get-attiva u32)
                         (values u32 u32 u32 &optional)) limiti-pagina-arena-attiva))
(defun limiti-pagina-arena-attiva (context root arena rank)
  "Pre: verified captured prefix, rank from bounded page search. Post: row interval and exact page end.
Checks only prefix neighbors, never an unpublished next page; invalid page/row bounds fault GET."
  (unless (< rank (radice-get-attiva-count root)) (guasto-get context :active-page-rank))
  (let* ((ends (arena-get-attiva-ends arena)) (limits (arena-get-attiva-limits arena))
         (end (aref ends rank)) (first (aref limits rank)) (limit (aref limits (1+ rank)))
         (before (if (zerop rank) +segment-header-bytes+ (aref ends (1- rank)))))
    (unless (and (<= +segment-header-bytes+ before) (< before end)
                 (<= end (radice-get-attiva-end root))
                 (or (= (1+ rank) (radice-get-attiva-count root)) (< end (aref ends (1+ rank))))
                 (<= first limit (radice-get-attiva-puts root)))
      (guasto-get context :active-append-page))
    (values first limit end)))

;;; REQ: REQ-IDX-001 REQ-CMP-007 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (contesto-get radice-get-attiva arena-get-attiva u32) u32) trova-pagina-arena-attiva))
(defun trova-pagina-arena-attiva (context root arena offset)
  "Pre: verified acquired prefix. Post: first captured page ending after OFFSET, in at most 17 comparisons.
Locations beyond the root frontier or malformed pages fault GET; no I/O, allocation or writer-counter read."
  (unless (<= +segment-header-bytes+ offset (1- (radice-get-attiva-end root)))
    (guasto-get context :active-location-frontier))
  (let ((left 0) (right (radice-get-attiva-count root)))
    (declare (type (integer 0 65536) left right))
    (loop repeat +active-page-attempts+ do
      (when (= left right)
        (unless (< left (radice-get-attiva-count root)) (guasto-get context :active-page-absent))
        (return-from trova-pagina-arena-attiva left))
      (let ((middle (+ left (floor (- right left) 2))))
        (multiple-value-bind (first limit end) (limiti-pagina-arena-attiva context root arena middle)
          (declare (ignore first limit)) ; The complete page bounds were validated; only END guides this search.
          (if (<= end offset) (setf left (1+ middle)) (setf right middle)))))
    (unless (and (= left right) (< left (radice-get-attiva-count root))) (guasto-get context :active-page-search-bound))
    left))

;;; REQ: REQ-IDX-001 REQ-WAL-006 REQ-CMP-007 REQ-AFF-002
(declaim (ftype (function (contesto-get radice-get-attiva)
                         (values segmento-get u32 u8 (or null u32) &optional)) risolvi-candidato-arena-attiva))
(defun risolvi-candidato-arena-attiva (context root)
  "Pre: CANDIDATE and acquired root under EBR; caller owns cleanup on every incomplete exit.
Post: exact prefix page/row resolved through the common source, CSN/size/flag/target/proof verifier.
No fabricated map, allocation, I/O or prefix inferred from EOF, H, or initialized-tail metadata."
  (let* ((arena (verifica-prefisso-arena-attiva context root))
         (segment (sorgente-get-attiva-segment (radice-get-attiva-source root)))
         (offset (ldb (byte 32 0) (aref (contesto-get-content context) 1))))
    (verifica-fonte-resolver context segment)
    (let ((rank (trova-pagina-arena-attiva context root arena offset)))
      (multiple-value-bind (first limit end) (limiti-pagina-arena-attiva context root arena rank)
        (when (< offset (if (zerop rank) +segment-header-bytes+ (aref (arena-get-attiva-ends arena) (1- rank))))
          (guasto-get context :active-append-page))
        (let ((base (trova-riga-resolver context (arena-get-attiva-rows arena) offset (- limit first) first)))
          (multiple-value-bind (flags proof) (verifica-riga-fonti-resolver context segment end (arena-get-attiva-rows arena) base)
            (values segment end flags proof)))))))
