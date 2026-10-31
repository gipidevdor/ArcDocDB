(in-package #:arcdocdb.fulltext.codec)
(declaim (optimize (safety 3) (debug 2)))

;;; REQ: REQ-SEC-008 REQ-SEC-010
(declaim (ftype (function (t t t t) null) prepara-codec))
(defun prepara-codec (descriptor space max-work max-bytes)
  "Pre: public boundary. Post: valid types/budgets and private counter zeroed.
INVALID-ARGUMENT for configuration; RESOURCE-EXHAUSTED for term capacity."
  (unless (and (typep descriptor 'descrittore-full-text) (typep space 'spazio-codec-full-text)
               (typep max-work 'index) (plusp max-work) (typep max-bytes 'index) (plusp max-bytes))
    (error 'invalid-argument :reason :fulltext-codec-input))
  (when (> (descrittore-full-text-term-limit descriptor) (spazio-codec-full-text-term-capacity space))
    (error 'resource-exhausted :reason :fulltext-codec-term-capacity))
  (setf (spazio-codec-full-text-work space) 0 (spazio-codec-full-text-work-limit space) max-work)
  nil)

;;; REQ: REQ-SEC-008
(declaim (ftype (function (t t t spazio-codec-full-text descrittore-full-text) null) controlla-buffer-codec))
(defun controlla-buffer-codec (buffer start end space descriptor)
  "Pre: valid workspace/descriptor. Post: simple u8 span, no aliasing with internal buffers.
INVALID-ARGUMENT before any write or loan."
  (unless (and (typep buffer 'octets) (typep start 'index) (typep end 'index)
               (<= start end (length buffer)))
    (error 'invalid-argument :reason :fulltext-codec-span))
  (when (or (eq buffer (descrittore-full-text-meta descriptor))
            (eq buffer (descrittore-full-text-identity descriptor))
            (eq buffer (a::spazio-full-text-bytes (spazio-codec-full-text-analysis space))))
    (error 'invalid-argument :reason :fulltext-codec-alias))
  nil)

;;; REQ: REQ-SEC-008
(declaim (ftype (function (descrittore-full-text u32 u16) null) controlla-riga-campo))
(defun controlla-riga-campo (descriptor row field)
  "Pre: numeric row/field. Post: declared field and committed-PUT row in the binding.
CORRUPTION-DETECTED for an uncovered row or unknown field; does not resolve CSN."
  (unless (campo-dichiarato-p descriptor field)
    (error 'corruption-detected :reason :fulltext-undeclared-field))
  (unless (and (< row (length (descrittore-full-text-rows descriptor)))
               (= 1 (sbit (descrittore-full-text-rows descriptor) row)))
    (error 'corruption-detected :reason :fulltext-uncommitted-row))
  nil)

;;; REQ: REQ-SEC-008 REQ-SEC-010
(declaim (ftype (function (spazio-codec-full-text index index) null) prepara-copertura))
(defun prepara-copertura (space length-count position-count)
  "Pre: file/run counts. Post: private bitmap zeroed after work reservation.
RESOURCE-EXHAUSTED before accessing beyond scratch; no per-entry allocations."
  (when (or (> length-count (length (spazio-codec-full-text-prefix space)))
            (> position-count (length (spazio-codec-full-text-marks space))))
    (error 'resource-exhausted :reason :fulltext-codec-scratch))
  (lavoro-codec space position-count)
  (fill (spazio-codec-full-text-marks space) 0 :end position-count)
  nil)

;;; REQ: REQ-SEC-008
(declaim (ftype (function (spazio-codec-full-text index u32 u32) null) marca-posizione))
(defun marca-posizione (space base count position)
  "Pre: field base within the reserved bitmap. Post: one unique position marked.
CORRUPTION-DETECTED for an out-of-field or duplicate position, even across distinct terms."
  (lavoro-codec space)
  (unless (< position count) (error 'corruption-detected :reason :fulltext-position-range))
  (let ((i (+ base position)))
    (unless (< i (length (spazio-codec-full-text-marks space)))
      (error 'invariant-violation :reason :fulltext-position-scratch))
    (when (= 1 (sbit (spazio-codec-full-text-marks space) i))
      (error 'corruption-detected :reason :fulltext-position-duplicate))
    (setf (sbit (spazio-codec-full-text-marks space) i) 1))
  nil)

;;; REQ: REQ-SEC-008
(declaim (ftype (function (spazio-codec-full-text index) null) verifica-copertura))
(defun verifica-copertura (space count)
  "Pre: all positions examined. Post: exact union [0,COUNT), otherwise corruption."
  (unless (<= count (length (spazio-codec-full-text-marks space)))
    (error 'invariant-violation :reason :fulltext-coverage-range))
  (dotimes (i count)
    (lavoro-codec space)
    (unless (= 1 (sbit (spazio-codec-full-text-marks space) i))
      (error 'corruption-detected :reason :fulltext-position-gap)))
  nil)
