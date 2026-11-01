;;;; Measured hot-path allocation requirement; registered in normal runs.
;;;; Coverage instrumentation exclusion is owned by the main integrator, not this test registry.
;;; OWNER: serial test owns every warmed histogram; no worker is started here.
;;; SHARED: none; SBCL's allocation counter is sampled with ordinary GC enabled.
;;; REQ: REQ-OBS-001 REQ-OBS-002
(in-package #:arcdocdb.metrics.tests)
(declaim (optimize (safety 3) (speed 3) (debug 1)))

;;; REQ: REQ-OBS-001
(declaim (ftype (function (m:istogramma-latenze (integer 0 #x0fffffffffffffff) fixnum) null)
                hot-record-burst))
(defun hot-record-burst (histogram value repetitions)
  "Pre: warmed owner histogram, validated value and nonnegative repetition count.
Post: repeated public records only; no fixture, snapshot, list, timer or assertion allocation in this span."
  (dotimes (index repetitions) (m:registra-latenza histogram value))
  nil)

;;; REQ: REQ-OBS-001
(declaim (ftype (function (m:istogramma-latenze fixnum) null) hot-reset-windows))
(defun hot-reset-windows (histogram windows)
  "Pre: warmed owner histogram, maximum 256 and cap 8. Post: reusable full/saturated windows on fixed storage.
Each window resets, accepts regular/overflow observations, then rejects at cap; no snapshots or fixture allocation."
  (dotimes (window windows)
    (m:azzera-istogramma histogram)
    (dotimes (index 2)
      (m:registra-latenza histogram 0)
      (m:registra-latenza histogram 256)
      (m:registra-latenza histogram 257)
      (m:registra-latenza histogram m:+massima-latenza+))
    (dotimes (index 4) (m:registra-latenza histogram 1)))
  nil)

;;; REQ: REQ-OBS-001
(defmacro hot-allocated-bytes (&body body)
  "Pre: statically compiled warmed body and initialized SBCL allocation counter. Post: bytes consed during BODY.
GC stays enabled; construction, snapshot capture, assertions and result formatting belong outside this interval."
  (let ((before (gensym "BEFORE")))
    `(let ((,before (sb-ext:get-bytes-consed)))
       ,@body
       (- (sb-ext:get-bytes-consed) ,before))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-HOT-ALLOCATION
  "Pre: normal uninstrumented serial suite, ordinary GC enabled. Post: zero measured bytes for four warmed paths.
This is an allocation assertion, not a latency benchmark; coverage may exclude this test only, normal runs must retain it."
  (let* ((normal (m:crea-istogramma (m:crea-configurazione-istogramma :massimo m:+massima-latenza+)))
         (above (m:crea-istogramma (m:crea-configurazione-istogramma :massimo 256)))
         (saturated (m:crea-istogramma (m:crea-configurazione-istogramma :limite-campioni 1)))
         (windows (m:crea-istogramma (m:crea-configurazione-istogramma :massimo 256 :limite-campioni 8)))
         (window-storage (m::istogramma-latenze-contatori windows))
         (repetitions 100000))
    ;; All construction and warmup, including first allocation-counter use, precedes the four measured intervals.
    (hot-record-burst normal m:+massima-latenza+ 8192)
    (hot-record-burst above m:+massima-latenza+ 8192)
    (m:registra-latenza saturated 0)
    (hot-record-burst saturated m:+massima-latenza+ 8192)
    (hot-reset-windows windows 256)
    (m:azzera-istogramma normal) (m:azzera-istogramma above)
    (sb-ext:get-bytes-consed) (sb-ext:get-bytes-consed)
    (let* ((normal-bytes (hot-allocated-bytes (hot-record-burst normal m:+massima-latenza+ repetitions)))
           (above-bytes (hot-allocated-bytes (hot-record-burst above m:+massima-latenza+ repetitions)))
           (saturated-bytes (hot-allocated-bytes (hot-record-burst saturated m:+massima-latenza+ repetitions)))
           (window-bytes (hot-allocated-bytes (hot-reset-windows windows 10000))))
      (is (zerop normal-bytes)) (is (zerop above-bytes))
      (is (zerop saturated-bytes)) (is (zerop window-bytes)))
    ;; Cold captures validate that the measured calls really advanced each intended population/status path.
    (let ((normal-image (m:istantanea-istogramma normal))
          (above-image (m:istantanea-istogramma above))
          (saturated-image (m:istantanea-istogramma saturated))
          (window-image (m:istantanea-istogramma windows)))
      (dolist (snapshot (list normal-image above-image saturated-image window-image)) (check-population snapshot))
      (is (= repetitions (m:istantanea-latenze-campioni normal-image)))
      (is (= repetitions (m:istantanea-latenze-campioni above-image)))
      (is (eq :ok (nth-value 2 (m:percentile-latenza normal-image 1 1))))
      (is (eq :above-range (nth-value 2 (m:percentile-latenza above-image 1 1))))
      (is (not (m:istantanea-latenze-saturata-p normal-image)))
      (is (not (m:istantanea-latenze-saturata-p above-image)))
      (is (= 1 (m:istantanea-latenze-campioni saturated-image)))
      (is (zerop (m:istantanea-latenze-massimo-osservato saturated-image)))
      (is (m:istantanea-latenze-saturata-p saturated-image))
      (is (= 8 (m:istantanea-latenze-campioni window-image)))
      (is (= m:+massima-latenza+ (m:istantanea-latenze-massimo-osservato window-image)))
      (is (m:istantanea-latenze-saturata-p window-image))
      (is (eq window-storage (m::istogramma-latenze-contatori windows))))))
