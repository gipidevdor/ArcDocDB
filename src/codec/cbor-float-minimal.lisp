;;;; Larghezza preferita dei float CBOR, solo campi IEEE e parole immediate.
;;; OWNER: ogni chiamata possiede parole locali; nessuno stato modificato.
;;; SHARED: nessuna scrittura, attesa o I/O tra Serie (INV-P6).
(in-package #:arcdocdb.cbor)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-LIM-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (u32) (values boolean &optional)) binary32-accorciabile-cbor-p))
(defun binary32-accorciabile-cbor-p (word)
  "Pre: binary32 bits in u32 WORD. Post: T only if a binary16 expands to the same bits,
preserving sign, zero, infinity, and right-padded NaN payload.
INVARIANT-VIOLATION for inconsistent fields/alignment; no intended float or heap allocation."
  (let ((exponent (ldb (byte 8 23) word)) (fraction (logand word #x7fffff)))
    (declare (type (unsigned-byte 8) exponent) (type (unsigned-byte 23) fraction))
    (unless (and (<= exponent 255) (<= fraction #x7fffff))
      (error 'invariant-violation :reason :cbor-float32-fields))
    (let ((shorter
            (cond ((zerop exponent) (zerop fraction))
                  ((= exponent 255) (zerop (logand fraction #x1fff)))
                  ((<= 113 exponent 142) (zerop (logand fraction #x1fff)))
                  ((<= 103 exponent 112)
                   (zerop (logand (logior #x800000 fraction)
                                  (1- (ash 1 (- 126 exponent))))))
                  (t nil))))
      (when (and shorter (plusp (logand fraction #x1fff)))
        (error 'invariant-violation :reason :cbor-float32-alignment))
      shorter)))

;;; REQ: REQ-LIM-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (u32 u32 (integer 30 52)) (values boolean &optional))
                binary64-allineato-cbor-p))
(defun binary64-allineato-cbor-p (high low shift)
  "Pre: binary64 significand in HIGH21/LOW32, SHIFT 30..52 for subnormal destination.
Post: T if all bits below SHIFT are zero, without combining words into a u64.
INVARIANT-VIOLATION for inconsistent internal width, shift, or alignment."
  (unless (<= high #x1fffff)
    (error 'invariant-violation :reason :cbor-float64-significand))
  (unless (<= 30 shift 52)
    (error 'invariant-violation :reason :cbor-float64-shift))
  (let ((aligned
          (if (<= shift 32)
              (zerop (logand low (1- (ash 1 shift))))
              (and (zerop low)
                   (zerop (logand high (1- (ash 1 (- shift 32)))))))))
    (when (and aligned (plusp (logand low #x1fffffff)))
      (error 'invariant-violation :reason :cbor-float64-alignment))
    aligned))

;;; REQ: REQ-LIM-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (u32 u32) (values boolean &optional)) binary64-accorciabile-cbor-p))
(defun binary64-accorciabile-cbor-p (high low)
  "Pre: binary64 in u32 HIGH/LOW. Post: T only if a binary32 expands to the same bits,
preserving sign, zero, infinity, and NaN payload; no u64/float materialization.
INVARIANT-VIOLATION for inconsistent fields/alignment; at most comparisons and masks."
  (let ((exponent (ldb (byte 11 20) high)) (fraction-high (logand high #xfffff)))
    (declare (type (unsigned-byte 11) exponent) (type (unsigned-byte 20) fraction-high))
    (unless (and (<= exponent 2047) (<= fraction-high #xfffff))
      (error 'invariant-violation :reason :cbor-float64-fields))
    (let ((shorter
            (cond ((zerop exponent) (and (zerop fraction-high) (zerop low)))
                  ((= exponent 2047) (zerop (logand low #x1fffffff)))
                  ((<= 897 exponent 1150) (zerop (logand low #x1fffffff)))
                  ((<= 874 exponent 896)
                   (binary64-allineato-cbor-p (logior #x100000 fraction-high)
                                              low (- 926 exponent)))
                  (t nil))))
      (when (and shorter (plusp (logand low #x1fffffff)))
        (error 'invariant-violation :reason :cbor-float64-alignment))
      shorter)))
