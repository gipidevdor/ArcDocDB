;;;; Configuration rejection, bounded populations and sticky saturation.
;;; OWNER: each serial test owns its counters and private synthetic fixtures.
;;; SHARED: none.
(in-package #:arcdocdb.metrics.tests)

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-configuration-defaults-and-storage
  "Pre: public configuration factory. Post: defaults, unit scales, geometry and accepted counts are bounded."
  (let* ((cap (1- (expt 2 60))) (config (m:crea-configurazione-istogramma)))
    (is (= cap m:+massimi-campioni+)) (is (= cap m:+massima-latenza+))
    (is (typep cap 'fixnum))
    (is (= 7 (m:configurazione-istogramma-bit-precisione config)))
    (is (= 60000000000 (m:configurazione-istogramma-massimo config)))
    (is (= cap (m:configurazione-istogramma-limite-campioni config)))
    (is (eq :nanosecondi (m:configurazione-istogramma-unita config)))
    (is (= 1000000000 (m:configurazione-istogramma-tick-al-secondo config)))
    (is (eq :monotono (m:configurazione-istogramma-dominio config)))
    (loop for precision from 4 to 10
          do (dolist (maximum (list 0 1 256 60000000000 cap))
               (let* ((c (m:crea-configurazione-istogramma :bit-precisione precision :massimo maximum))
                      (cells (+ 2 (reference-bucket maximum precision))))
                 (is (= cells (m:configurazione-istogramma-celle c)))
                 (is (= (* 8 cells) (m:configurazione-istogramma-byte-contatori c)))
                 (is (<= 2 cells 65536))
                 (is (<= 16 (m:configurazione-istogramma-byte-contatori c) 524288))
                 (check-population (m:istantanea-istogramma (m:crea-istogramma c)))))))
  (dolist (unit '(:nanosecondi :microsecondi))
    (let* ((scale (if (eq unit :nanosecondi) 1000000000 1000000))
           (config (m:crea-configurazione-istogramma :unita unit :tick-al-secondo scale)))
      (is (= scale (m:configurazione-istogramma-tick-al-secondo config)))
      (is (= scale (m:configurazione-istogramma-tick-al-secondo
                    (m:crea-configurazione-istogramma :unita unit))))))
  (dolist (scale (list 1 7 1000000000 (1- (expt 2 60))))
    (let ((config (m:crea-configurazione-istogramma :unita :tick :tick-al-secondo scale
                                                  :dominio :test-external-clock)))
      (is (eq :tick (m:configurazione-istogramma-unita config)))
      (is (= scale (m:configurazione-istogramma-tick-al-secondo config)))
      (is (eq :test-external-clock (m:configurazione-istogramma-dominio config))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-invalid-configuration-types-and-limits
  "Pre: malformed configuration values. Post: typed invalid-argument, before any histogram is created."
  (dolist (arguments '((:bit-precisione 3) (:bit-precisione 11) (:bit-precisione 4.0)
                       (:bit-precisione 9/2) (:bit-precisione nil) (:bit-precisione :seven)
                       (:massimo -1) (:massimo 1.0) (:massimo 1/2) (:massimo nil)
                       (:massimo #x1000000000000000) (:massimo "256")
                       (:limite-campioni 0) (:limite-campioni -1) (:limite-campioni 1.0)
                       (:limite-campioni 3/2) (:limite-campioni nil)
                       (:limite-campioni #x1000000000000000)
                       (:unita :ns) (:unita nil) (:unita "nanosecondi")
                       (:dominio nil) (:dominio 0) (:dominio "monotono") (:dominio cl-user::clock)))
    (signals invalid-argument (apply #'m:crea-configurazione-istogramma arguments)
             :metrics-histogram-config))
  (dolist (arguments '((:unita :tick) (:unita :tick :tick-al-secondo nil)
                       (:unita :tick :tick-al-secondo 0) (:unita :tick :tick-al-secondo -1)
                       (:unita :tick :tick-al-secondo 1/2) (:unita :tick :tick-al-secondo 1.0)
                       (:unita :tick :tick-al-secondo :clock)
                       (:unita :tick :tick-al-secondo #x1000000000000000)
                       (:unita :nanosecondi :tick-al-secondo 1000000)
                       (:unita :microsecondi :tick-al-secondo 1000000000)))
    (signals invalid-argument (apply #'m:crea-configurazione-istogramma arguments)
             :metrics-histogram-scale))
  (dolist (object (list nil 0 :config #() (m:crea-istogramma)))
    (signals invalid-argument (m:crea-istogramma object) :metrics-histogram-config))
  (dolist (object '(nil 0 :histogram #()))
    (signals invalid-argument (m:registra-latenza object 0) :metrics-histogram-owner)
    (signals invalid-argument (m:azzera-istogramma object) :metrics-histogram-owner)
    (signals invalid-argument (m:istantanea-istogramma object) :metrics-histogram-owner)))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-out-of-domain-samples-never-mutate
  "Pre: ordinary, at-cap and sticky-saturated populations. Post: invalid samples reject without changing any field."
  (let ((histogram (m:crea-istogramma (m:crea-configurazione-istogramma :massimo 256 :limite-campioni 2))))
    (dotimes (phase 3)
      (let ((before (histogram-state histogram)))
        (dolist (sample (list -1 (expt 2 60) (expt 2 100) 1/2 0.0 1d0 nil t #\a :duration "7" #()))
          (signals invalid-argument (m:registra-latenza histogram sample) :metrics-latency-value)
          (is (equalp before (histogram-state histogram)))))
      (case phase
        (0 (m:registra-latenza histogram 0) (m:registra-latenza histogram 257))
        (1 (is (eq :saturated (m:registra-latenza histogram 256))))))
    (check-population (m:istantanea-istogramma histogram))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-cap-sticky-completeness-and-overflow
  "Pre: bounded windows with normal and overflow observations. Post: cap never wraps; completeness changes on loss."
  (dolist (limit '(1 3 7))
    (let* ((histogram (m:crea-istogramma
                      (m:crea-configurazione-istogramma :massimo 256 :limite-campioni limit)))
           (accepted (make-array limit)))
      (dotimes (index limit)
        (let ((value (if (evenp index) 257 index)))
          (setf (aref accepted index) value)
          (is (eq (if (> value 256) :above-range :recorded) (m:registra-latenza histogram value)))))
      (let ((full (m:istantanea-istogramma histogram))
            (before (histogram-state histogram)) (sorted (sort accepted #'<)))
        (check-population full)
        (is (not (m:istantanea-latenze-saturata-p full)))
        (check-reference-percentile full sorted 1 1 t)
        (is (eq :saturated (m:registra-latenza histogram m:+massima-latenza+)))
        ;; The loss flag alone changes, even if the rejected value would set a new maximum.
        (setf (fourth before) t)
        (is (equalp before (histogram-state histogram)))
        (dolist (sample '(0 256 257))
          (is (eq :saturated (m:registra-latenza histogram sample)))
          (is (equalp before (histogram-state histogram))))
        (let ((saturated (m:istantanea-istogramma histogram)))
          (check-population saturated)
          (is (= limit (m:istantanea-latenze-campioni saturated)))
          (dolist (fraction '((500 1000) (950 1000) (990 1000) (999 1000)))
            (check-reference-percentile saturated sorted (first fraction) (second fraction) nil)))
        ;; Earlier snapshot is immutable and remains complete after the first loss.
        (check-reference-percentile full sorted 1 1 t)
        (is (eq histogram (m:azzera-istogramma histogram)))
        (let ((empty (m:istantanea-istogramma histogram)))
          (check-population empty)
          (is (equal '(nil nil :empty t) (multiple-value-list (m:percentile-latenza empty 500)))))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-full-cap-counter-boundary-synthetic
  "Pre: consistent synthetic cap-1 population in a regular or overflow bin. Post: final accepted increment is safe.
Every counter, total, maximum and completeness remains consistent through sticky rejection and reset."
  (let ((cap (1- (expt 2 60))))
    (dolist (value (list 7 m:+massima-latenza+))
      (let* ((histogram (m:crea-istogramma
                        (m:crea-configurazione-istogramma :massimo 256 :dominio :test-synthetic-population)))
             (index (if (> value 256)
                        (1- (m:configurazione-istogramma-celle (m::istogramma-latenze-configurazione histogram)))
                        value)))
        (seed-synthetic-population histogram (list (list value (1- cap))))
        (is (eq (if (> value 256) :above-range :recorded) (m:registra-latenza histogram value)))
        (let ((full (m:istantanea-istogramma histogram)))
          (check-population full)
          (is (= cap (m:istantanea-latenze-campioni full)))
          (is (= cap (aref (m::istantanea-latenze-contatori full) index)))
          (is (= value (m:istantanea-latenze-massimo-osservato full)))
          (is (not (m:istantanea-latenze-saturata-p full))))
        (let ((before (histogram-state histogram)))
          (dotimes (attempt 4)
            (is (eq :saturated (m:registra-latenza histogram (if (evenp attempt) 0 m:+massima-latenza+))))
            (setf (fourth before) t)
            (is (equalp before (histogram-state histogram)))))
        (check-population (m:istantanea-istogramma histogram))
        (m:azzera-istogramma histogram)
        (is (eq :recorded (m:registra-latenza histogram 0)))
        (check-population (m:istantanea-istogramma histogram))))))
