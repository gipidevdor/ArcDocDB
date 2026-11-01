;;;; Cold allocation is explicit; the owned mutable array is never returned.
(in-package #:arcdocdb.metrics)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(declaim (ftype (function (t) istantanea-latenze) istantanea-istogramma))
(defun istantanea-istogramma (histogram)
  "Pre: capture on the histogram owner with no reentrant mutation. Post: independent immutable image.
Allocates one bounded counter array and snapshot on the cold path. INVALID-ARGUMENT rejects owner/type.
Cross-thread consumers require a publication edge supplied by their caller; no seqlock promise is made."
  (let ((hist (%verifica-istogramma-owner histogram)))
    (%con-mutazione-istogramma (hist :sola-lettura t)
      (let* ((source (istogramma-latenze-contatori hist))
             (copy (make-array (length source) :element-type '(unsigned-byte 64) :initial-element 0)))
        (replace copy source)
        (%make-istantanea-latenze (istogramma-latenze-configurazione hist) copy
          (istogramma-latenze-campioni hist) (istogramma-latenze-saturato-p hist)
          (istogramma-latenze-massimo-osservato hist))))))
