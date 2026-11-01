;;;; Cold independent oracles and serial test registration; no product instrumentation.
;;; OWNER: loader owns *TESTS*; each test owns its fixtures and mutable histograms.
;;; SHARED: only immutable configurations/snapshots, published by explicit thread joins.
;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(defpackage #:arcdocdb.metrics.tests
  (:use #:cl)
  (:local-nicknames (#:m #:arcdocdb.metrics))
  (:import-from #:arcdocdb.foundation.tests #:is #:signals)
  (:import-from #:arcdocdb.conditions #:invalid-argument #:invariant-violation)
  (:export #:run))
(in-package #:arcdocdb.metrics.tests)
(declaim (optimize (safety 3) (speed 2) (debug 3)))

(defvar *tests* nil)

;;; REQ: REQ-OBS-001 REQ-OBS-002
(defmacro deftest (name &body body)
  "Pre: static test body with docstring. Post: typed function registered exactly once."
  `(progn (declaim (ftype (function () t) ,name))
          (defun ,name () ,@body) (pushnew ',name *tests*)))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function () boolean) run))
(defun run ()
  "Pre: suite loaded serially. Post: every registered test runs, including allocation; errors propagate."
  (dolist (test (reverse *tests*)) (funcall test) (format t "ok    ~A~%" test))
  (format t "~D test degli istogrammi di latenza superati.~%" (length *tests*))
  t)

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function ((integer 0) (integer 4 10))
                         (values (integer 0) (integer 0) (integer 0))) reference-bucket))
(defun reference-bucket (value precision)
  "Pre: nonnegative integer and supported precision. Post: independent index and inclusive bounds.
Enumerates dyadic bands using multiplication and FLOOR, without production mapping or integer-length."
  (let ((exact-limit (expt 2 (1+ precision))) (band-cells (expt 2 precision)))
    (when (< value exact-limit) (return-from reference-bucket (values value value value)))
    (loop for start = exact-limit then (* start 2)
          for width = 2 then (* width 2)
          for first-index = exact-limit then (+ first-index band-cells)
          when (< value (* start 2))
            do (let* ((offset (floor (- value start) width))
                      (lower (+ start (* offset width))))
                 (return (values (+ first-index offset) lower (+ lower width -1)))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function ((integer 1) (integer 1) (integer 1)) (integer 1)) reference-rank))
(defun reference-rank (count numerator denominator)
  "Pre: positive count and 1 <= numerator <= denominator. Post: exact CL rational nearest rank.
Cold oracle deliberately permits bignum intermediates and does not use the product quotient scheme."
  (ceiling (* count (/ numerator denominator))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function (m:istogramma-latenze) list) histogram-state))
(defun histogram-state (histogram)
  "Pre: quiescent private fixture on its owner. Post: independent copy of every mutable histogram field.
The thread-local scope is not histogram state; raw inspection also works for faulted fixtures."
  (list (copy-seq (m::istogramma-latenze-contatori histogram))
        (m::istogramma-latenze-campioni histogram)
        (m::istogramma-latenze-massimo-osservato histogram)
        (m::istogramma-latenze-saturato-p histogram)
        (m::istogramma-latenze-guasto-p histogram)))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function (m:istantanea-latenze) boolean) check-population))
(defun check-population (snapshot)
  "Pre: owner-captured immutable snapshot. Post: every regular bin plus overflow sums to total."
  (let* ((counts (m::istantanea-latenze-contatori snapshot))
         (config (m:istantanea-latenze-configurazione snapshot)))
    (is (typep counts '(simple-array (unsigned-byte 64) (*))))
    (is (= (length counts) (m:configurazione-istogramma-celle config)))
    (is (= (reduce #'+ counts :initial-value 0) (m:istantanea-latenze-campioni snapshot)))
    (is (<= (m:istantanea-latenze-campioni snapshot)
            (m:configurazione-istogramma-limite-campioni config))))
  t)

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function (m:istantanea-latenze vector (integer 1) (integer 1) boolean) boolean)
                check-reference-percentile))
(defun check-reference-percentile (snapshot sorted numerator denominator complete)
  "Pre: SORTED contains exactly the retained observations. Post: rank, bounds, status and completeness agree.
The sample maximum and configured maximum clip independent bucket bounds."
  (is (plusp (length sorted)))
  (is (= (length sorted) (m:istantanea-latenze-campioni snapshot)))
  (let* ((config (m:istantanea-latenze-configurazione snapshot))
         (maximum (m:configurazione-istogramma-massimo config))
         (value (aref sorted (1- (reference-rank (length sorted) numerator denominator)))))
    (multiple-value-bind (lower upper status complete-p)
        (m:percentile-latenza snapshot numerator denominator)
      (is (eq complete complete-p))
      (is (<= lower value upper))
      (if (> value maximum)
          (progn (is (eq :above-range status)) (is (= lower (1+ maximum)))
                 (is (= upper (aref sorted (1- (length sorted))))))
          (multiple-value-bind (index expected-lower expected-upper)
              (reference-bucket value (m:configurazione-istogramma-bit-precisione config))
            (declare (ignore index))
            (is (eq :ok status)) (is (= lower expected-lower))
            (is (= upper (min expected-upper maximum (aref sorted (1- (length sorted))))))))))
  t)

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function (m:istogramma-latenze list) m:istogramma-latenze) seed-synthetic-population))
(defun seed-synthetic-population (histogram entries)
  "Pre: fresh owner fixture, domain :TEST-SYNTHETIC-POPULATION; (value count) entries are valid.
Post: legitimate consistent bins/overflow/total/maximum near arithmetic limits, with no invented timings.
Synthetic metadata is explicit; this fixture is correctness evidence only, never measured throughput."
  (let* ((config (m::istogramma-latenze-configurazione histogram))
         (counts (m::istogramma-latenze-contatori histogram)) (total 0) (maximum 0))
    (is (eq (m::istogramma-latenze-owner histogram) sb-thread:*current-thread*))
    (is (eq :test-synthetic-population (m:configurazione-istogramma-dominio config)))
    (is (zerop (m::istogramma-latenze-campioni histogram)))
    (is (every #'zerop counts))
    (is (not m::*accesso-istogrammi*))
    (is (not (m::istogramma-latenze-guasto-p histogram)))
    (is (not (m::istogramma-latenze-saturato-p histogram)))
    (dolist (entry entries)
      (destructuring-bind (value count) entry
        (is (typep value `(integer 0 ,(1- (expt 2 60)))))
        (is (typep count '(integer 1)))
        (incf total count)
        (is (<= total (m:configurazione-istogramma-limite-campioni config)))
        (let ((index (if (> value (m:configurazione-istogramma-massimo config))
                         (1- (length counts))
                         (reference-bucket value (m:configurazione-istogramma-bit-precisione config)))))
          (incf (aref counts index) count))
        (setf maximum (max maximum value))))
    (setf (m::istogramma-latenze-campioni histogram) total
          (m::istogramma-latenze-massimo-osservato histogram) maximum)
    (check-population (m:istantanea-istogramma histogram)))
  histogram)
