;;;; Cold rational arithmetic and sorted observations are independent percentile oracles.
;;; OWNER: serial test owns all fixtures; synthetic populations carry explicit metadata.
;;; SHARED: none.
(in-package #:arcdocdb.metrics.tests)

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-empty-and-zero-percentiles
  "Pre: empty and all-zero populations, including maximum zero. Post: four public values distinguish both."
  (dolist (maximum '(0 256 60000000000))
    (let* ((histogram (m:crea-istogramma (m:crea-configurazione-istogramma :massimo maximum)))
           (empty (m:istantanea-istogramma histogram)))
      (check-population empty)
      (is (zerop (m:istantanea-latenze-massimo-osservato empty)))
      (dolist (fraction '((1 1000000) (500 1000) (950 1000) (990 1000) (999 1000) (1 1)))
        (is (equal '(nil nil :empty t)
                   (multiple-value-list (m:percentile-latenza empty (first fraction) (second fraction))))))
      (dotimes (index 17) (is (eq :recorded (m:registra-latenza histogram 0))))
      (let ((snapshot (m:istantanea-istogramma histogram)))
        (check-population snapshot)
        (is (= 17 (aref (m::istantanea-latenze-contatori snapshot) 0)))
        (is (equal '(0 0 :ok t) (multiple-value-list (m:percentile-latenza snapshot 999))))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-rational-nearest-rank-at-count-limits
  "Pre: arbitrary count/fraction pairs, including products beyond fixnum. Post: nearest rank matches CL ratios."
  (let ((cap (1- (expt 2 60))))
    (dolist (count (list 1 2 3 7 999 1000 1001 1000000 (1- cap) cap))
      (dolist (denominator '(1 2 3 7 997 1000 999983 1000000))
        (dolist (numerator (remove-duplicates (list 1 (max 1 (floor denominator 2))
                                                  (max 1 (1- denominator)) denominator)))
          (let ((rank (reference-rank count numerator denominator)))
            (is (= rank (m::%rango-percentile count numerator denominator)))
            (is (<= 1 rank count))))))
    ;; Exhaustive small counts/fractions catch exact-divisibility and ceil/floor mistakes.
    (loop for count from 1 to 37
          do (loop for denominator from 1 to 31
                   do (loop for numerator from 1 to denominator
                            do (is (= (reference-rank count numerator denominator)
                                      (m::%rango-percentile count numerator denominator))))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-p50-p95-p99-p999-sorted-reference
  "Pre: deterministic unsorted repeated observations and selected overflow populations.
Post: P50/P95/P99/P999 and endpoint fractions enclose the exact sorted nearest-rank sample for p4..10."
  (loop for precision from 4 to 10
        do (dolist (maximum '(256 60000000000))
             (dolist (above-count '(0 1 11 51 501))
               (let* ((count 1001)
                      (values (make-array count))
                      (histogram (m:crea-istogramma
                                  (m:crea-configurazione-istogramma :bit-precisione precision
                                                                   :massimo maximum))))
                 (dotimes (index count)
                   (setf (aref values index)
                         (if (< index above-count) (+ maximum 1 (mod index 97))
                             (mod (+ (* index index 17) (* index 31)) (1+ maximum)))))
                 ;; Multiplication by 37 permutes 0..1000; input order differs from the sorted oracle.
                 (dotimes (index count)
                   (let ((value (aref values (mod (* index 37) count))))
                     (is (eq (if (> value maximum) :above-range :recorded)
                             (m:registra-latenza histogram value)))))
                 (let ((sorted (sort (copy-seq values) #'<))
                       (snapshot (m:istantanea-istogramma histogram)))
                   (check-population snapshot)
                   (is (= above-count (aref (m::istantanea-latenze-contatori snapshot)
                                           (1- (m:configurazione-istogramma-celle
                                                (m:istantanea-latenze-configurazione snapshot))))))
                   (dolist (fraction '((1 1001) (500 1000) (950 1000) (990 1000) (999 1000)
                                       (1 3) (2 3) (999983 1000000) (1 1)))
                     (check-reference-percentile snapshot sorted (first fraction) (second fraction) t))
                   (is (equal (multiple-value-list (m:percentile-latenza snapshot 500 1000))
                              (multiple-value-list (m:percentile-latenza snapshot 500))))))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-public-rank-with-synthetic-full-population
  "Pre: explicitly synthetic, consistent full-cap histogram. Post: public rank selects the right cumulative bin."
  (let* ((cap (1- (expt 2 60))) (zeros (floor cap 2)) (sevens (floor cap 3))
         (histogram (m:crea-istogramma
                     (m:crea-configurazione-istogramma :massimo 256 :dominio :test-synthetic-population))))
    (seed-synthetic-population histogram (list (list 0 zeros) (list 7 sevens)
                                              (list 257 (- cap zeros sevens))))
    (let ((snapshot (m:istantanea-istogramma histogram)))
      (dolist (fraction '((1 1000000) (1 2) (500 1000) (2 3) (950 1000) (990 1000)
                          (999 1000) (999999 1000000) (1 1)))
        (let* ((rank (reference-rank cap (first fraction) (second fraction)))
               (expected (cond ((<= rank zeros) '(0 0 :ok t))
                               ((<= rank (+ zeros sevens)) '(7 7 :ok t))
                               (t '(257 257 :above-range t)))))
          (is (equal expected (multiple-value-list
                               (m:percentile-latenza snapshot (first fraction) (second fraction))))))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-invalid-percentile-arguments
  "Pre: valid snapshot including empty input. Post: malformed fractions or snapshot types signal invalid argument."
  (let ((snapshot (m:istantanea-istogramma (m:crea-istogramma))))
    (dolist (pair '((0 1000) (-1 1000) (1001 1000) (1 0) (1 -1) (1 1000001)
                    (1000001 1000001) (1/2 1) (1 3/2) (1.0 2) (1 2.0)
                    (nil 1) (1 nil) (:p50 1000) (1 "1000")))
      (signals invalid-argument (m:percentile-latenza snapshot (first pair) (second pair))
               :metrics-percentile-argument))
    (dolist (object (list nil 1 #() snapshot))
      (unless (eq object snapshot)
        (signals invalid-argument (m:percentile-latenza object 500) :metrics-percentile-argument)))
    (signals invalid-argument (m:percentile-latenza (m:crea-istogramma) 500)
             :metrics-percentile-argument)))
