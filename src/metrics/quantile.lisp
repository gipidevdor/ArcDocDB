;;;; Integer nearest rank and inclusive bounds; no floating percentile arithmetic.
(in-package #:arcdocdb.metrics)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function ((integer 1 #.+massimi-campioni+) (integer 1 1000000) (integer 1 1000000))
                         (integer 1 #.+massimi-campioni+)) %rango-percentile))
(defun %rango-percentile (count numerator denominator)
  "Pre: nonempty count and 1 <= numerator <= denominator <= 1e6. Post: ceil(count*n/d).
Quotient/remainder bound every intermediate to fixnum range; private input checks apply."
  (multiple-value-bind (whole remainder) (floor count denominator)
    (+ (* whole numerator) (ceiling (* remainder numerator) denominator))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function (istantanea-latenze (integer 1 #.+massimi-campioni+))
                         (values latenza latenza (member :ok :above-range))) %borne-percentile))
(defun %borne-percentile (snapshot rank)
  "Pre: nonempty valid snapshot and rank in its population. Post: inclusive value interval and range status.
INVARIANT-VIOLATION detects an inconsistent population; the scan is bounded by fixed cell count."
  (let* ((config (istantanea-latenze-configurazione snapshot))
         (counts (istantanea-latenze-contatori snapshot)) (sum 0))
    (declare (type campioni sum))
    (loop for index fixnum below (length counts)
          do (incf sum (aref counts index))
             (when (>= sum rank)
               (return-from %borne-percentile
                 (if (= index (1- (length counts)))
                     (values (1+ (configurazione-istogramma-massimo config))
                             (istantanea-latenze-massimo-osservato snapshot) :above-range)
                     (multiple-value-bind (lower upper)
                         (%intervallo-cella index (configurazione-istogramma-bit-precisione config))
                       (values lower (min upper (configurazione-istogramma-massimo config)
                                          (istantanea-latenze-massimo-osservato snapshot)) :ok))))))
    (error 'invariant-violation :reason :metrics-histogram-population)))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function (t t &optional t)
                         (values (or null latenza) (or null latenza) (member :empty :ok :above-range) boolean))
                percentile-latenza))
(defun percentile-latenza (snapshot numerator &optional (denominator 1000))
  "Pre: immutable snapshot and exact rational fraction 1 <= n <= d <= 1e6.
Post: lower/upper bounds, :EMPTY/:OK/:ABOVE-RANGE and completeness of retained observations.
INVALID-ARGUMENT rejects malformed inputs. Saturated snapshots return completeness NIL; no sample confidence is claimed."
  (unless (and (istantanea-latenze-p snapshot) (typep numerator '(integer 1 1000000))
               (typep denominator '(integer 1 1000000)) (<= numerator denominator))
    (error 'invalid-argument :reason :metrics-percentile-argument))
  (let ((count (istantanea-latenze-campioni snapshot))
        (complete (not (istantanea-latenze-saturata-p snapshot))))
    (if (zerop count) (values nil nil :empty complete)
        (multiple-value-bind (lower upper status)
            (%borne-percentile snapshot (%rango-percentile count numerator denominator))
          (values lower upper status complete)))))
