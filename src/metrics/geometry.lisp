;;;; Exact integer mapping: low values are exact, subsequent ranges are logarithmic.
(in-package #:arcdocdb.metrics)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (inline %indice-latenza))
(declaim (ftype (function (latenza precisione) (integer 0 65534)) %indice-latenza))
(defun %indice-latenza (value bits)
  "Pre: validated nonnegative value and precision. Post: bounded canonical cell index.
No conditions beyond the private input types; integer shifts neither round nor allocate."
  (let ((shift (max 0 (- (integer-length value) 1 bits))))
    (+ (ash shift bits) (ash value (- shift)))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function ((integer 0 65534) precisione) (values latenza latenza)) %intervallo-cella))
(defun %intervallo-cella (index bits)
  "Pre: regular cell index generated within the latency domain. Post: inclusive integer bounds.
No rounding or clock; private type checks apply. Overflow cells use a separate path."
  (let ((base (ash 1 bits)))
    (if (< index (* 2 base))
        (values index index)
        (let* ((shift (1- (ash index (- bits))))
               (part (+ base (logand index (1- base)))))
          (values (ash part shift) (1- (ash (1+ part) shift)))))))
