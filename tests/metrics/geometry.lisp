;;;; Independent integer bucket coverage, with no clock or timing assertions.
;;; OWNER: serial test owns histograms and expected counters.
;;; SHARED: none.
(in-package #:arcdocdb.metrics.tests)

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-exact-low-bins
  "Pre: each supported precision. Post: every value below 2^(p+1) has its own exact public percentile."
  (loop for precision from 4 to 10
        for exact-limit = (expt 2 (1+ precision))
        do (let* ((config (m:crea-configurazione-istogramma :bit-precisione precision
                                                           :massimo (1- exact-limit)))
                  (histogram (m:crea-istogramma config)))
             (dotimes (value exact-limit) (is (eq :recorded (m:registra-latenza histogram value))))
             (let* ((snapshot (m:istantanea-istogramma histogram))
                    (counts (m::istantanea-latenze-contatori snapshot)))
               (check-population snapshot)
               (is (= (length counts) (1+ exact-limit)))
               (dotimes (value exact-limit)
                 (is (= 1 (aref counts value)))
                 (is (equal (list value value :ok t)
                            (multiple-value-list (m:percentile-latenza snapshot (1+ value) exact-limit)))))
               (is (zerop (aref counts exact-limit)))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function (m:istogramma-latenze vector (integer 0)) null) record-reference-value))
(defun record-reference-value (histogram expected value)
  "Pre: owner histogram configured to the entire domain. Post: one actual and independently counted sample."
  (let* ((config (m::istogramma-latenze-configurazione histogram))
         (index (reference-bucket value (m:configurazione-istogramma-bit-precisione config))))
    (is (eq :recorded (m:registra-latenza histogram value)))
    (incf (aref expected index)))
  nil)

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-every-power-and-precision-boundary
  "Pre: p=4..10, entire 60-bit domain. Post: every dyadic sub-bin edge and neighboring integer maps correctly.
Expected storage is independent; only one cold capture per precision, avoiding quadratic snapshot work."
  (let ((domain-maximum (1- (expt 2 60))))
    (loop for precision from 4 to 10
          do (let* ((config (m:crea-configurazione-istogramma :bit-precisione precision
                                                             :massimo domain-maximum))
                    (histogram (m:crea-istogramma config))
                    (cells (+ 2 (reference-bucket domain-maximum precision)))
                    (expected (make-array cells :initial-element 0)))
               (is (= cells (m:configurazione-istogramma-celle config)))
               (is (= (* cells 8) (m:configurazione-istogramma-byte-contatori config)))
               (dotimes (value (expt 2 (1+ precision)))
                 (record-reference-value histogram expected value))
               ;; Explicitly exercise every power of two, including the last domain edge.
               (dotimes (exponent 60)
                 (dolist (delta '(-1 0 1))
                   (let ((value (+ (expt 2 exponent) delta)))
                     (when (<= 0 value domain-maximum)
                       (record-reference-value histogram expected value)))))
               ;; Dyadic enumeration: all precision boundaries, not just powers of two.
               (loop for start = (expt 2 (1+ precision)) then (* start 2)
                     for width = 2 then (* width 2)
                     while (<= start domain-maximum)
                     do (dotimes (part (expt 2 precision))
                          (let* ((lower (+ start (* part width))) (upper (+ lower width -1)))
                            (dolist (value (list (1- lower) lower (1+ lower) upper (1+ upper)))
                              (when (<= value domain-maximum)
                                (record-reference-value histogram expected value)))
                            (multiple-value-bind (index oracle-lower oracle-upper)
                                (reference-bucket lower precision)
                              (is (= lower oracle-lower)) (is (= upper oracle-upper))
                              (multiple-value-bind (actual-lower actual-upper)
                                  (m::%intervallo-cella index precision)
                                (is (= lower actual-lower)) (is (= upper actual-upper)))))))
               (let ((snapshot (m:istantanea-istogramma histogram)))
                 (check-population snapshot)
                 (is (equalp expected (m::istantanea-latenze-contatori snapshot)))
                 (is (= domain-maximum (m:istantanea-latenze-massimo-osservato snapshot)))
                 (is (zerop (aref expected (1- cells)))))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-configured-and-observed-maximum-clipping
  "Pre: maxima inside a bucket and at a power of two. Post: regular bounds clip and max+1 always overflows."
  (loop for precision from 4 to 10
        do (let ((edge (expt 2 (1+ precision))))
             (dolist (maximum (remove-duplicates (list 0 1 256 edge (+ edge 4) (+ (* edge 2) 2))))
               (let* ((config (m:crea-configurazione-istogramma :bit-precisione precision :massimo maximum))
                      (histogram (m:crea-istogramma config)))
                 (is (eq :recorded (m:registra-latenza histogram maximum)))
                 (let ((snapshot (m:istantanea-istogramma histogram)))
                   (check-reference-percentile snapshot (vector maximum) 1 1 t)
                   (is (= maximum (nth-value 1 (m:percentile-latenza snapshot 1 1)))))
                 (is (eq :above-range (m:registra-latenza histogram (1+ maximum))))
                 (let ((snapshot (m:istantanea-istogramma histogram)))
                   (check-population snapshot)
                   (is (= 1 (aref (m::istantanea-latenze-contatori snapshot)
                                  (1- (m:configurazione-istogramma-celle config)))))
                   (is (equal (list (1+ maximum) (1+ maximum) :above-range t)
                              (multiple-value-list (m:percentile-latenza snapshot 1 1)))))
                 ;; Observed maximum clips the bucket even when the configured maximum is larger.
                 (when (> maximum edge)
                   (m:azzera-istogramma histogram)
                   (m:registra-latenza histogram edge)
                   (check-reference-percentile (m:istantanea-istogramma histogram)
                                               (vector edge) 1 1 t)))))))
