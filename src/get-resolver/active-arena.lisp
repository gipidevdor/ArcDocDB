;;; OWNER: cold source factory, then the sole writer with its existing Serie lease.
;;; SHARED: typed arrays contain immutable published prefixes; only the unpublished tail is writable.
(in-package #:arcdocdb.get.resolver)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-001 REQ-AFF-008
(declaim (ftype (function (t integer integer integer) null) verifica-configurazione-arena-attiva))
(defun verifica-configurazione-arena-attiva (mode pages puts budget)
  "Pre: dimensions already validated by VERIFICA-BUDGET-ATTIVO. Post: directory mode and full startup charge admitted.
INVALID-ARGUMENT for mode, RESOURCE-EXHAUSTED before any allocation when append-only arrays exceed the grant."
  (unless (member mode '(:persistent :append-only)) (error 'invalid-argument :reason :active-directory-mode))
  (when (and (eq mode :append-only) (> (+ (* 8 pages) 4 (* +active-row-payload+ puts)) budget))
    (error 'resource-exhausted :reason :active-append-payload-budget))
  nil)

;;; REQ: REQ-IDX-001 REQ-AFF-008
(declaim (ftype (function (t (integer 1 65536) u32) (or null arena-get-attiva)) crea-arena-get-attiva))
(defun crea-arena-get-attiva (mode pages puts)
  "Pre: cold source with complete configuration/payload verified. Post: fixed arrays or NIL for persistent mode.
No data CSN, publication or I/O; allocation failure leaves the source unconstructed."
  (case mode
    (:persistent nil)
    (:append-only
     (%make-arena-get-attiva
       (make-array pages :element-type '(unsigned-byte 32) :initial-element 0)
       (make-array (1+ pages) :element-type '(unsigned-byte 32) :initial-element 0)
       (make-array (* puts +row-words+) :element-type '(unsigned-byte 32) :initial-element 0)))
    (otherwise (error 'invalid-argument :reason :active-directory-mode))))

;;; REQ: REQ-IDX-001 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (sorgente-get-attiva arena-get-attiva) boolean) geometria-arena-attiva-p))
(defun geometria-arena-attiva-p (source arena)
  "Pre: typed source and arena. Post: exact preallocated page/row dimensions, with no contents or frontier inferred.
False is handled by the owning writer/GET fault boundary; no mutation or I/O."
  (and (= (length (arena-get-attiva-ends arena)) (sorgente-get-attiva-max-pages source))
       (= (length (arena-get-attiva-limits arena)) (1+ (sorgente-get-attiva-max-pages source)))
       (= (length (arena-get-attiva-rows arena)) (* +row-words+ (sorgente-get-attiva-max-puts source)))))

;;; REQ: REQ-IDX-001 REQ-WAL-006 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (radice-get-attiva arena-get-attiva) boolean) prefisso-arena-attiva-p))
(defun prefisso-arena-attiva-p (root arena)
  "Pre: source/arena dimensions match. Post: exact immutable root prefix bounds or false, never writer progress.
All array accesses follow checked root bounds; false belongs to the caller's fault boundary."
  (let ((source (radice-get-attiva-source root)) (count (radice-get-attiva-count root)))
    (and (null (radice-get-attiva-directory root)) (zerop (radice-get-attiva-nodes root))
         (<= count (sorgente-get-attiva-max-pages source)) (<= (radice-get-attiva-puts root) (sorgente-get-attiva-max-puts source))
         (<= +segment-header-bytes+ (radice-get-attiva-end root) +segment-max-bytes+)
         (zerop (aref (arena-get-attiva-limits arena) 0))
         (= (radice-get-attiva-puts root) (aref (arena-get-attiva-limits arena) count))
         (= (radice-get-attiva-end root)
            (if (zerop count) +segment-header-bytes+ (aref (arena-get-attiva-ends arena) (1- count)))))))

;;; REQ: REQ-IDX-001 REQ-WAL-005 REQ-WAL-006 REQ-AFF-008
(declaim (ftype (function (sorgente-get-attiva (or null radice-get-attiva)) null) verifica-coda-arena-attiva))
(defun verifica-coda-arena-attiva (source previous)
  "Pre: sole writer, cumulative page/PUT limits already admitted. Post: exact initialized prefix and untouched next page.
INVARIANT-VIOLATION for malformed or reused metadata; no array, CSN or event changes. Readers never use COUNT."
  (let* ((arena (the arena-get-attiva (sorgente-get-attiva-arena source)))
         (rank (if previous (radice-get-attiva-count previous) 0))
         (ends (arena-get-attiva-ends arena)) (limits (arena-get-attiva-limits arena)))
    (unless (geometria-arena-attiva-p source arena) (error 'invariant-violation :reason :active-append-state))
    (unless (and (= rank (arena-get-attiva-count arena)) (< rank (length ends))
                 (if previous (prefisso-arena-attiva-p previous arena) (zerop (aref limits 0)))
                 (zerop (aref ends rank)) (zerop (aref limits (1+ rank))))
      (error 'invariant-violation :reason :active-append-state))
    (when (> (payload-arena-get-attiva arena) (sorgente-get-attiva-budget source))
      (error 'resource-exhausted :reason :active-append-payload-budget)))
  nil)
