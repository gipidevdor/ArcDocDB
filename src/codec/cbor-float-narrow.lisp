;;;; Riduzioni IEEE esatte su parole immediate, senza float nativi o u64.
;;; OWNER: parole locali alla chiamata; nessuno stato modificato.
;;; SHARED: nessuna scrittura, attesa o I/O tra Serie (INV-P6).
(in-package #:arcdocdb.cbor)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CBR-004 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (u32) (values (unsigned-byte 16) &optional))
                riduci-binary32-cbor))
(defun riduci-binary32-cbor (word)
  "Pre: binary32 can be shortened exactly according to local preference.
Post: binary16 bits, same sign/value/NaN payload, without rounding.
INVARIANT-VIOLATION for input that cannot be shortened, inconsistent exponent, or sign/shape."
  (unless (binary32-accorciabile-cbor-p word)
    (error 'invariant-violation :reason :cbor-float32-narrow-input))
  (let* ((exponent (ldb (byte 8 23) word)) (fraction (logand word #x7fffff))
         (sign (ldb (byte 1 31) word))
         (body (cond ((zerop exponent) 0)
                     ((= exponent 255) (logior #x7c00 (ash fraction -13)))
                     ((<= 113 exponent 142)
                      (logior (ash (- exponent 112) 10) (ash fraction -13)))
                     ((<= 103 exponent 112)
                      (ash (logior #x800000 fraction) (- exponent 126)))
                     (t (error 'invariant-violation :reason :cbor-float32-narrow-exponent))))
         (result (logior (ash sign 15) body)))
    (declare (type (unsigned-byte 8) exponent) (type (unsigned-byte 23) fraction)
             (type bit sign) (type (unsigned-byte 15) body)
             (type (unsigned-byte 16) result))
    (unless (= sign (ldb (byte 1 15) result))
      (error 'invariant-violation :reason :cbor-float32-narrow-sign))
    result))

;;; REQ: REQ-CBR-004 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (u32 u32 (integer 30 52))
                         (values (unsigned-byte 23) &optional))
                riduci-significando64-cbor))
(defun riduci-significando64-cbor (high low shift)
  "Pre: aligned HIGH21/LOW32 significand, SHIFT30..52 toward subnormal32.
Post: exact u23 quotient, reconstructs HIGH and LOW separately without u64.
INVARIANT-VIOLATION for width/alignment or different reconstructed words."
  (unless (<= high #x1fffff)
    (error 'invariant-violation :reason :cbor-float64-narrow-significand))
  (unless (binary64-allineato-cbor-p high low shift)
    (error 'invariant-violation :reason :cbor-float64-narrow-alignment))
  (let ((result (if (< shift 32)
                    (logior (ash high (- 32 shift)) (ash low (- shift)))
                    (ash high (- 32 shift)))))
    (declare (type (unsigned-byte 23) result))
    (unless (= high (ash result (- shift 32)))
      (error 'invariant-violation :reason :cbor-float64-narrow-high))
    (unless (if (< shift 32)
                (= low (ash (logand result (1- (ash 1 (- 32 shift)))) shift))
                (zerop low))
      (error 'invariant-violation :reason :cbor-float64-narrow-low))
    result))

;;; REQ: REQ-CBR-004 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (u32 u32) (values u32 &optional)) riduci-binary64-cbor))
(defun riduci-binary64-cbor (high low)
  "Pre: binary64 can be shortened exactly to binary32, HIGH/LOW u32 words.
Post: binary32 bits with the same sign/value/NaN significand, without u64/float.
INVARIANT-VIOLATION for input that cannot be shortened, inconsistent exponent, or sign."
  (unless (binary64-accorciabile-cbor-p high low)
    (error 'invariant-violation :reason :cbor-float64-narrow-input))
  (let* ((exponent (ldb (byte 11 20) high)) (fraction (logand high #xfffff))
         (sign (logand high #x80000000))
         (body (cond ((zerop exponent) 0)
                     ((= exponent 2047)
                      (logior #x7f800000 (ash fraction 3) (ash low -29)))
                     ((<= 897 exponent 1150)
                      (logior (ash (- exponent 896) 23) (ash fraction 3) (ash low -29)))
                     ((<= 874 exponent 896)
                      (riduci-significando64-cbor (logior #x100000 fraction)
                                                 low (- 926 exponent)))
                     (t (error 'invariant-violation :reason :cbor-float64-narrow-exponent))))
         (result (logior sign body)))
    (declare (type (unsigned-byte 11) exponent) (type (unsigned-byte 20) fraction)
             (type u32 sign result) (type (unsigned-byte 31) body))
    (unless (= sign (logand result #x80000000))
      (error 'invariant-violation :reason :cbor-float64-narrow-sign))
    result))
