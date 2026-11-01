;;;; C4, COD-60/61. Preregistered 2026-11-01 in metriche-serie-metodo.md.
;;;; --bench [--iterations N] [--repetitions R] | --self-test | --negative-fixture
;;;; Authoring handoff: do not execute until writing and independent review close.
;;; OWNER: the sole driver Lisp thread owns partitions, raw sinks and report rows.
;;; SHARED: immutable workload data only; no driver threads or product-global writes.
(let ((*standard-output* *error-output*) (*trace-output* *error-output*))
  (require :asdf))
(defpackage #:arcdocdb.metrics-counter.bench (:use #:cl))
(in-package #:arcdocdb.metrics-counter.bench)
(declaim (optimize (speed 2) (safety 3) (debug 2)))

(defparameter *root*
  (merge-pathnames "../" (uiop:pathname-directory-pathname *load-truename*)))
(defconstant +default-iterations+ 1000000)
(defconstant +max-iterations+ 10000000)
(defconstant +default-repetitions+ 5)
(defconstant +max-repetitions+ 20)
(defconstant +warmup+ 1024)
(defconstant +precision+ 7)
(defconstant +maximum+ 60000000000)
(defconstant +sample-limit+ 100000000)
(defconstant +workload-size+ 256)
(defconstant +checksum-mask+ #x1fffffff)
(defconstant +serie+ #xc4)
(defconstant +metric-end+ 1000000000)
(defparameter *scenarios*
  #(:baseline-loop :request-ok :request-error :cache-hit :wal-append-16-bytes
    :wal-flush-4-records :queue-update :saturated-request))
(defparameter *counter-keys*
  '(:richieste :errori :cache-hit :cache-miss :cache-espulsioni :cache-errori-verifica
    :wal-append :wal-byte :wal-flush :wal-record))

(define-condition bench-failure (error)
  ((reason :initarg :reason :reader failure-reason)
   (detail :initarg :detail :reader failure-detail))
  (:report (lambda (condition stream)
             (format stream "metrics-counter-bench C4 (~A): ~A"
                     (failure-reason condition) (failure-detail condition)))))

(defun reject (reason control &rest arguments)
  (error 'bench-failure :reason reason :detail (apply #'format nil control arguments)))

(defun strict-warning (condition)
  "Only the recognized SBCL redefinition class is allowed, including under ASDF."
  (if (typep condition 'sb-kernel:redefinition-warning)
      (muffle-warning condition)
      (reject :warning "~A" condition)))

(defun decimal-argument (text maximum)
  (unless (and (stringp text) (<= 1 (length text) (length (write-to-string maximum)))
               (char<= #\1 (char text 0) #\9)
               (every (lambda (char) (char<= #\0 char #\9)) text))
    (reject :argv "expected canonical decimal 1..~D, got ~S" maximum text))
  (let ((value (parse-integer text :radix 10 :junk-allowed nil)))
    (unless (<= 1 value maximum) (reject :argv "outside 1..~D: ~S" maximum text))
    value))

(defun parse-arguments (argv)
  (when (member argv '(("--self-test") ("--negative-fixture")) :test #'equal)
    (return-from parse-arguments
      (list :mode (if (string= (first argv) "--self-test") :self-test :negative-fixture))))
  (unless (and (<= 1 (length argv) 5) (string= (first argv) "--bench")
               (evenp (length (rest argv))))
    (reject :argv "usage: --bench [--iterations 1..10000000] [--repetitions 1..20], --self-test, or --negative-fixture"))
  (let ((iterations +default-iterations+) (repetitions +default-repetitions+) (seen nil))
    (loop for (key value) on (rest argv) by #'cddr do
      (when (member key seen :test #'string=) (reject :argv "duplicate ~S" key))
      (push key seen)
      (cond ((string= key "--iterations") (setf iterations (decimal-argument value +max-iterations+)))
            ((string= key "--repetitions") (setf repetitions (decimal-argument value +max-repetitions+)))
            (t (reject :argv "unknown option ~S" key))))
    (list :mode :bench :iterations iterations :repetitions repetitions)))

(defun require-single-thread ()
  (let ((threads (sb-thread:list-all-threads)))
    (unless (and (= 1 (length threads)) (eq (first threads) sb-thread:*current-thread*))
      (reject :threads "requires exactly the driver Lisp thread; found ~D" (length threads)))))

(defun load-product ()
  "Normal forced core load; inherit the parent's private hierarchical ASDF cache."
  (unless (and (string= (lisp-implementation-type) "SBCL")
               (>= most-positive-fixnum #x0fffffffffffffff))
    (reject :implementation "requires 64-bit SBCL"))
  (when (or (member :sb-cover *features*) (find-package "SB-COVER"))
    (reject :coverage "requires a fresh process without coverage instrumentation"))
  (require-single-thread)
  (let ((*compile-verbose* nil) (*compile-print* nil) (*load-verbose* nil) (*load-print* nil)
        (asdf:*compile-file-warnings-behaviour* :error)
        (asdf:*compile-file-failure-behaviour* :error))
    (handler-bind ((warning #'strict-warning))
      (asdf:load-asd (merge-pathnames "arcdocdb.asd" *root*))
      (asdf:load-system "arcdocdb" :force t :verbose nil)))
  (require-single-thread)
  (let ((package (find-package "ARCDOCDB.METRICS")) (api nil))
    (unless package (reject :api "core has no ARCDOCDB.METRICS package"))
    (loop for (key name) in
          '((:config "CREA-CONFIGURAZIONE-ISTOGRAMMA") (:make "CREA-METRICHE-SERIE")
            (:request "REGISTRA-RICHIESTA") (:cache "REGISTRA-CACHE")
            (:append "REGISTRA-APPEND-WAL") (:flush "REGISTRA-FLUSH-WAL")
            (:queue "REGISTRA-CODA") (:reset "AZZERA-METRICHE-SERIE")
            ;; Function/type ISTANTANEA-METRICHE is legal; the Serie reader is distinct.
            (:snapshot "ISTANTANEA-METRICHE") (:serie "ISTANTANEA-METRICHE-SERIE")
            (:worker "ISTANTANEA-METRICHE-WORKER") (:start "ISTANTANEA-METRICHE-INIZIO")
            (:end "ISTANTANEA-METRICHE-FINE") (:sources "NUMERO-FONTI-METRICHE")
            (:counter "VALORE-CONTATORE") (:rate "TASSO-CONTATORE")
            (:queue-state "STATO-CODA") (:complete "METRICHE-COMPLETE-P")
            (:requests "ISTANTANEA-METRICHE-LATENZA-RICHIESTE")
            (:flushes "ISTANTANEA-METRICHE-LATENZA-FLUSH")
            (:population "ISTANTANEA-LATENZE-CAMPIONI")
            (:saturated "ISTANTANEA-LATENZE-SATURATA-P")) do
      (multiple-value-bind (symbol visibility) (find-symbol name package)
        (unless (and (eq visibility :external) (fboundp symbol))
          (reject :api "missing exported function ARCDOCDB.METRICS:~A" name))
        (setf (getf api key) (symbol-function symbol))))
    (let ((condition (find-symbol "INVALID-ARGUMENT" "ARCDOCDB.CONDITIONS")))
      (unless (and condition (find-class condition nil))
        (reject :api "missing INVALID-ARGUMENT condition"))
      (setf (getf api :invalid-argument) condition))
    api))

(defun call-api (api key &rest arguments)
  "Allocating adapter for cold paths only; never called by UPDATE-LOOP."
  (apply (getf api key) arguments))

(defun make-config (api limit)
  (call-api api :config :bit-precisione +precision+ :massimo +maximum+
            :limite-campioni limit :unita :nanosecondi :dominio :monotono))

(defun real-clock () (get-internal-real-time))
(defun real-byte-counter () (sb-ext:get-bytes-consed))

(defstruct raw
  (completed 0 :type fixnum) (accepted 0 :type fixnum)
  (recorded 0 :type fixnum) (above-range 0 :type fixnum) (saturated 0 :type fixnum)
  (gauge 0 :type fixnum) (baseline 0 :type fixnum) (checksum 0 :type fixnum)
  ticks-before ticks-after tick-frequency bytes-before bytes-after)

(defun measure (thunk raw &key (clock #'real-clock)
                             (tick-frequency internal-time-units-per-second)
                             (byte-counter #'real-byte-counter))
  "Preallocated THUNK/RAW; byte readings enclose both clock reads and the batch."
  (unless (and (integerp tick-frequency) (plusp tick-frequency))
    (reject :clock "frequency must be a positive integer"))
  (setf (raw-tick-frequency raw) tick-frequency
        (raw-bytes-before raw) (funcall byte-counter)
        (raw-ticks-before raw) (funcall clock))
  (unwind-protect (funcall thunk)
    (unwind-protect (setf (raw-ticks-after raw) (funcall clock))
      (setf (raw-bytes-after raw) (funcall byte-counter))))
  raw)

(defun raw-fields (raw)
  (list :completed (raw-completed raw) :accepted (raw-accepted raw)
        :recorded (raw-recorded raw) :above-range (raw-above-range raw)
        :saturated (raw-saturated raw) :gauge (raw-gauge raw) :baseline (raw-baseline raw)
        :checksum (raw-checksum raw)
        :ticks-before (raw-ticks-before raw) :ticks-after (raw-ticks-after raw)
        :tick-frequency (raw-tick-frequency raw)
        :bytes-before (raw-bytes-before raw) :bytes-after (raw-bytes-after raw)))

(defun required-fields (plist keys)
  (let ((length (handler-case (list-length plist) (type-error () nil))))
    (unless (and length (evenp length)) (reject :missing-field "not a proper even plist")))
  (dolist (key keys)
    (unless (= 1 (loop for tail on plist by #'cddr count (eq (car tail) key)))
      (reject :missing-field "missing or duplicated ~S" key))))

(defun timing-fields (fields)
  "Cold exact arithmetic; no cost or rate is fabricated for a zero tick window."
  (required-fields fields '(:completed :ticks-before :ticks-after :tick-frequency :bytes-before :bytes-after))
  (let ((before (getf fields :ticks-before)) (after (getf fields :ticks-after))
        (frequency (getf fields :tick-frequency)) (n (getf fields :completed))
        (bytes-before (getf fields :bytes-before)) (bytes-after (getf fields :bytes-after)))
    (unless (and (every (lambda (x) (and (integerp x) (<= 0 x)))
                        (list before after bytes-before bytes-after))
                 (integerp frequency) (plusp frequency) (<= before after) (<= bytes-before bytes-after))
      (reject :clock-counter "missing, negative or regressing clock/byte readings"))
    (unless (and (integerp n) (<= 0 n)) (reject :counts "invalid completed count"))
    (let* ((ticks (- after before)) (bytes (- bytes-after bytes-before)) (seconds (/ ticks frequency)))
      (list :ticks-before before :ticks-after after :raw-ticks ticks :tick-frequency frequency
            :nominal-tick-ns (/ 1000000000 frequency) :seconds seconds
            :time-quality (if (zerop ticks) :below-resolution :measured)
            :elapsed-ns-per-op (when (and (plusp ticks) (plusp n)) (/ (* seconds 1000000000) n))
            :operations-per-second (when (and (plusp ticks) (plusp n)) (/ n seconds))
            :bytes-before bytes-before :bytes-after bytes-after :bytes-consed bytes
            :zero-bytes-observed-p (zerop bytes) :counter-scope :whole-process))))

(defun make-workloads ()
  "Fixed working sets, never an observations log. All hot values fit fixnums."
  (let ((durations (make-array +workload-size+ :element-type 'fixnum))
        (depths (make-array +workload-size+ :element-type 'fixnum))
        (anchors (vector 0 1 15 16 31 32 127 128 255 256 1023 1024
                         1000000 1000000000 (1- +maximum+) +maximum+)))
    (dotimes (i +workload-size+)
      (setf (aref durations i) (aref anchors (mod (+ (* i 73) 11) 16))
            (aref depths i) (logand (+ (* i 73) 11) 255)))
    (values durations depths)))

(defun update-loop (scenario function metrics durations depths iterations raw)
  "Includes public guards, scenario/status dispatch, tallies and a bounded sink."
  (declare (type (simple-array fixnum (*)) durations depths)
           (type fixnum iterations) (type raw raw))
  (dotimes (i iterations)
    (let* ((index (logand i 255)) (duration (aref durations index)) (depth (aref depths index))
           (status
             (ecase scenario
               (:baseline-loop :baseline)
               (:request-ok (funcall function metrics duration :ok))
               (:request-error (funcall function metrics duration :errore))
               (:cache-hit (funcall function metrics :hit))
               (:wal-append-16-bytes (funcall function metrics 16))
               (:wal-flush-4-records (funcall function metrics duration 4))
               (:queue-update
                (unless (eq metrics (funcall function metrics :richieste depth))
                  (reject :update-status "queue update returned a different partition"))
                :gauge)
               (:saturated-request (funcall function metrics duration :ok))))
           (token (case status
                    (:baseline (incf (raw-baseline raw)) 0)
                    (:recorded (incf (raw-recorded raw)) (incf (raw-accepted raw)) 1)
                    (:above-range (incf (raw-above-range raw)) (incf (raw-accepted raw)) 2)
                    (:saturated (incf (raw-saturated raw)) 3)
                    (:gauge (incf (raw-gauge raw)) (incf (raw-accepted raw)) 4)
                    (otherwise (reject :update-status "unexpected return ~S" status)))))
      (setf (raw-checksum raw)
            (logand +checksum-mask+ (+ (raw-checksum raw) (logand duration #xffff) depth token)))
      (incf (raw-completed raw)))))

(defun expected-tallies (scenario iterations)
  "The append byte cap can bind before its event count at the upper CLI bound."
  (let* ((baseline (if (eq scenario :baseline-loop) iterations 0))
         (gauge (if (eq scenario :queue-update) iterations 0))
         (recorded (case scenario
                     ((:baseline-loop :queue-update :saturated-request) 0)
                     (:wal-append-16-bytes (min iterations (floor +sample-limit+ 16)))
                     (otherwise iterations)))
         (saturated (case scenario
                      (:saturated-request iterations)
                      (:wal-append-16-bytes (- iterations recorded))
                      (otherwise 0))))
    (list :completed iterations :accepted (+ recorded gauge) :recorded recorded
          :above-range 0 :saturated saturated :gauge gauge :baseline baseline)))

(defun expected-checksum (durations depths iterations tallies)
  "Independent cold cycle sum; no measured sink or per-operation result log."
  (multiple-value-bind (cycles remainder) (floor iterations +workload-size+)
    (let ((cycle-sum 0) (tail-sum 0))
      (dotimes (i +workload-size+)
        (let ((term (+ (logand (aref durations i) #xffff) (aref depths i))))
          (incf cycle-sum term) (when (< i remainder) (incf tail-sum term))))
      (logand +checksum-mask+
              (+ (* cycles cycle-sum) tail-sum (getf tallies :recorded)
                 (* 3 (getf tallies :saturated)) (* 4 (getf tallies :gauge)))))))

(defun check-observation (row)
  (required-fields row '(:iterations :scenario :expected-checksum :observed :timing))
  (let ((n (getf row :iterations)) (scenario (getf row :scenario)) (fields (getf row :observed)))
    (unless (and (integerp n) (<= 1 n +max-iterations+)) (reject :counts "invalid iterations"))
    (unless (find scenario *scenarios*) (reject :scenario "unknown scenario ~S" scenario))
    (required-fields fields '(:completed :accepted :recorded :above-range :saturated :gauge :baseline
                             :checksum :ticks-before :ticks-after :tick-frequency :bytes-before :bytes-after))
    (loop for (key value) on (expected-tallies scenario n) by #'cddr do
      (unless (eql value (getf fields key)) (reject :counts "~S differs for ~S" key scenario)))
    (unless (and (integerp (getf fields :checksum))
                 (eql (getf fields :checksum) (getf row :expected-checksum)))
      (reject :checksum "sink differs from independent cycle oracle"))
    (required-fields (getf row :timing)
                     '(:ticks-before :ticks-after :raw-ticks :tick-frequency :nominal-tick-ns
                       :seconds :time-quality :elapsed-ns-per-op :operations-per-second
                       :bytes-before :bytes-after :bytes-consed :zero-bytes-observed-p :counter-scope))
    (unless (equal (getf row :timing) (timing-fields fields))
      (reject :timing "derived timing/allocation arithmetic differs from raw readings")))
  t)

(defun snapshot-summary (api snapshot)
  "Cold public readers only, including both queue knowledge classifications."
  (list :serie (call-api api :serie snapshot) :worker (call-api api :worker snapshot)
        :start (call-api api :start snapshot) :end (call-api api :end snapshot)
        :sources (call-api api :sources snapshot) :complete (call-api api :complete snapshot)
        :counters (loop for key in *counter-keys* collect
                    (cons key (multiple-value-list (call-api api :counter snapshot key))))
        :request-histogram
        (let ((hist (call-api api :requests snapshot)))
          (list :population (call-api api :population hist) :saturated (call-api api :saturated hist)))
        :flush-histogram
        (let ((hist (call-api api :flushes snapshot)))
          (list :population (call-api api :population hist) :saturated (call-api api :saturated hist)))
        :queues (list (cons :richieste (multiple-value-list (call-api api :queue-state snapshot :richieste)))
                      (cons :wal (multiple-value-list (call-api api :queue-state snapshot :wal))))))

(defun expected-summary (counts &key (start 0) (end +metric-end+) incomplete
                                    request-saturated flush-saturated
                                    (request-queue '(nil nil :unobserved))
                                    (wal-queue '(nil nil :unobserved)))
  (list :serie +serie+ :worker 0 :start start :end end :sources 1
        :complete (not (or incomplete request-saturated flush-saturated))
        :counters (loop for key in *counter-keys* collect
                    (list key (getf counts key 0) (null (member key incomplete))))
        :request-histogram (list :population (getf counts :richieste 0) :saturated request-saturated)
        :flush-histogram (list :population (getf counts :wal-flush 0) :saturated flush-saturated)
        :queues (list (cons :richieste request-queue) (cons :wal wal-queue))))

(defun check-summary (actual expected)
  (unless (equal actual expected)
    (reject :snapshot "expected ~S, got ~S" expected actual))
  actual)

(defun window-summary (scenario iterations depths &optional initial)
  (let* ((n (if initial 0 iterations)) (counts nil) (incomplete nil)
         (request-saturated nil) (queue '(nil nil :unobserved)))
    (case scenario
      (:request-ok (setf counts (list :richieste n)))
      (:request-error (setf counts (list :richieste n :errori n)))
      (:cache-hit (setf counts (list :cache-hit n)))
      (:wal-append-16-bytes
       (let ((accepted (min n (floor +sample-limit+ 16))))
         (setf counts (list :wal-append accepted :wal-byte (* 16 accepted)))
         (when (> n accepted) (setf incomplete '(:wal-append :wal-byte)))))
      (:wal-flush-4-records (setf counts (list :wal-flush n :wal-record (* 4 n))))
      (:queue-update
       (when (plusp n)
         (setf queue (list (aref depths (mod (1- n) +workload-size+))
                           (loop for i below (min n +workload-size+) maximize (aref depths i)) :exact))))
      (:saturated-request
       (setf counts '(:richieste 1))
       (when (plusp n) (setf incomplete '(:richieste) request-saturated t))))
    (expected-summary counts :end (if initial 0 +metric-end+) :incomplete incomplete
                      :request-saturated request-saturated :request-queue queue)))

(defun scenario-function (api scenario)
  (getf api (ecase scenario
              (:baseline-loop :unused)
              ((:request-ok :request-error :saturated-request) :request)
              (:cache-hit :cache) (:wal-append-16-bytes :append)
              (:wal-flush-4-records :flush) (:queue-update :queue))))

(defun prefill (api metrics scenario)
  (when (eq scenario :saturated-request)
    (unless (eq :recorded (call-api api :request metrics 0 :ok))
      (reject :prefill "cap-one prefill was not recorded"))))

(defun run-one (api report scenario repetition iterations warmup durations depths)
  (require-single-thread)
  (let* ((limit (if (eq scenario :saturated-request) 1 +sample-limit+))
         (config (make-config api limit)) (function (scenario-function api scenario))
         (raw (make-raw)) (tallies (expected-tallies scenario iterations))
         (row (list :status :pending :phase :warmup :scenario scenario :repetition repetition
                    :precision +precision+ :maximum +maximum+ :sample-limit limit
                    :iterations iterations :warmup-iterations warmup :expected-tallies tallies
                    :expected-checksum (expected-checksum durations depths iterations tallies)
                    :observed nil :timing nil :snapshot-before nil :snapshot-after nil)))
    ;; Publish the row before any warmup, sensor or cold check can fail.
    (push row (getf report :measurements))
    (let ((warm-metrics (call-api api :make +serie+ 0 0 config)) (warm-raw (make-raw)))
      (prefill api warm-metrics scenario)
      (update-loop scenario function warm-metrics durations depths warmup warm-raw))
    (let ((metrics (call-api api :make +serie+ 0 0 config)))
      (prefill api metrics scenario)
      (setf (getf row :snapshot-before)
            (snapshot-summary api (call-api api :snapshot metrics 0)))
      (check-summary (getf row :snapshot-before) (window-summary scenario iterations depths t))
      (let ((thunk (lambda () (update-loop scenario function metrics durations depths iterations raw))))
        (sb-ext:gc :full t)
        (require-single-thread)
        (setf (getf row :phase) :measurement)
        (unwind-protect (measure thunk raw)
          (setf (getf row :observed) (raw-fields raw))))
      (setf (getf row :phase) :cold-checks
            (getf row :timing) (timing-fields (getf row :observed)))
      (check-observation row)
      (setf (getf row :snapshot-after)
            (snapshot-summary api (call-api api :snapshot metrics +metric-end+)))
      (check-summary (getf row :snapshot-after) (window-summary scenario iterations depths)))
    (require-single-thread)
    (setf (getf row :status) :ok (getf row :phase) :complete)))

(defun campaign (api report iterations repetitions warmup)
  (multiple-value-bind (durations depths) (make-workloads)
    (dotimes (rep repetitions)
      (dotimes (offset (length *scenarios*))
        (run-one api report (svref *scenarios* (mod (+ rep offset) (length *scenarios*)))
                 (1+ rep) iterations warmup durations depths))))
  (unless (= (length (getf report :measurements)) (* 8 repetitions))
    (reject :counts "campaign is missing measurement windows")))

(defun expect-rejection (function reason)
  "COD-60: only the specified rejection satisfies a detection control."
  (let ((detected nil))
    (handler-case (funcall function)
      (bench-failure (condition)
        (unless (eq reason (failure-reason condition)) (error condition))
        (setf detected t)))
    (unless detected (reject :self-test "specified rejection ~S was not detected" reason))))

(defun synthetic-row (&optional (end 27) (frequency 1000) (bytes-end 164))
  "Controlled public-call stand-in; four recorded calls with a known checksum."
  (let* ((raw (make-raw)) (ticks (list 7 end)) (bytes (list 100 bytes-end))
         (durations (make-array +workload-size+ :element-type 'fixnum :initial-element 3))
         (depths (make-array +workload-size+ :element-type 'fixnum :initial-element 2))
         (function (lambda (metrics duration outcome)
                     (declare (ignore metrics duration outcome)) :recorded)))
    (measure (lambda ()
               (update-loop :request-ok function nil durations depths 4 raw)) raw
             :clock (lambda () (unless ticks (reject :self-test "extra clock read")) (pop ticks))
             :tick-frequency frequency
             :byte-counter (lambda () (unless bytes (reject :self-test "extra byte read")) (pop bytes)))
    (unless (and (null ticks) (null bytes)) (reject :self-test "missing sensor reads"))
    (let ((fields (raw-fields raw)))
      (list :iterations 4 :scenario :request-ok :expected-checksum 24
            :observed fields :timing (timing-fields fields)))))

(defun argv-fixtures ()
  (let ((accepted '(("--bench") ("--bench" "--iterations" "1" "--repetitions" "1")
                    ("--bench" "--repetitions" "20" "--iterations" "10000000")
                    ("--self-test") ("--negative-fixture")))
        (rejected '(nil ("--bench" "1") ("--bench" "--iterations")
                    ("--bench" "--iterations" "0") ("--bench" "--iterations" "10000001")
                    ("--bench" "--repetitions" "0") ("--bench" "--repetitions" "21")
                    ("--bench" "--iterations" "-1") ("--bench" "--iterations" "+1")
                    ("--bench" "--iterations" "01") ("--bench" "--iterations" " 1")
                    ("--bench" "--iterations" "1 ") ("--bench" "--iterations" "1x")
                    ("--bench" "--iterations" "1.0") ("--bench" "--iterations" "")
                    ("--bench" "--iterations=1") ("--bench" "--unknown" "1")
                    ("--bench" "--iterations" "1" "--iterations" "2")
                    ("--bench" "--repetitions" "1" "--repetitions" "2")
                    ("--self-test" "--iterations" "1") ("--negative-fixture" "extra")
                    ("--bench" "--self-test") ("--self-test" "--bench"))))
    (dolist (argv accepted) (parse-arguments argv))
    (unless (equal (parse-arguments '("--bench"))
                   (list :mode :bench :iterations +default-iterations+ :repetitions +default-repetitions+))
      (reject :self-test "parser defaults differ"))
    (unless (equal (parse-arguments '("--bench" "--repetitions" "20" "--iterations" "10000000"))
                   '(:mode :bench :iterations 10000000 :repetitions 20))
      (reject :self-test "parser upper bounds differ"))
    (dolist (argv rejected) (expect-rejection (lambda () (parse-arguments argv)) :argv))
    (list :control :parser :status :ok :accepted (length accepted) :rejected (length rejected))))

(defun checker-fixtures ()
  (let ((row (synthetic-row)) (zero (synthetic-row 7)) (zero-bytes (synthetic-row 27 1000 100)))
    (check-observation row) (check-observation zero) (check-observation zero-bytes)
    (let ((tm (getf row :timing)) (zt (getf zero :timing)))
      (unless (and (= 20 (getf tm :raw-ticks)) (= 1/50 (getf tm :seconds))
                   (= 5000000 (getf tm :elapsed-ns-per-op)) (= 200 (getf tm :operations-per-second))
                   (= 1000000 (getf tm :nominal-tick-ns)) (= 64 (getf tm :bytes-consed))
                   (eq :below-resolution (getf zt :time-quality)) (zerop (getf zt :seconds))
                   (null (getf zt :elapsed-ns-per-op)) (null (getf zt :operations-per-second))
                   (zerop (getf (getf zero-bytes :timing) :bytes-consed))
                   (getf (getf zero-bytes :timing) :zero-bytes-observed-p))
        (reject :self-test "fixed injected arithmetic/zero-window expectations differ")))
    (dolist (field '(:completed :accepted :recorded :above-range :saturated :gauge :baseline))
      (let ((copy (copy-tree row)))
        (incf (getf (getf copy :observed) field))
        (expect-rejection (lambda () (check-observation copy)) :counts)))
    (let ((copy (copy-tree row)))
      (incf (getf (getf copy :observed) :checksum))
      (expect-rejection (lambda () (check-observation copy)) :checksum))
    (let ((copy (copy-tree row)))
      (remf (getf copy :observed) :completed)
      (expect-rejection (lambda () (check-observation copy)) :missing-field))
    (dolist (field '(:raw-ticks :seconds :elapsed-ns-per-op :operations-per-second
                    :nominal-tick-ns :bytes-consed :bytes-before :tick-frequency))
      (let ((copy (copy-tree row)))
        (incf (getf (getf copy :timing) field))
        (expect-rejection (lambda () (check-observation copy)) :timing)))
    (let ((copy (copy-tree zero)))
      (setf (getf (getf copy :timing) :operations-per-second) 0)
      (expect-rejection (lambda () (check-observation copy)) :timing))
    (expect-rejection (lambda () (synthetic-row 6)) :clock-counter)
    (expect-rejection (lambda () (synthetic-row -1)) :clock-counter)
    (expect-rejection (lambda () (synthetic-row nil)) :clock-counter)
    (expect-rejection (lambda () (synthetic-row 27 1000 99)) :clock-counter)
    (expect-rejection (lambda () (synthetic-row 27 1000 -1)) :clock-counter)
    (expect-rejection (lambda () (synthetic-row 27 1000 nil)) :clock-counter)
    (expect-rejection (lambda () (synthetic-row 27 0)) :clock)
    (expect-rejection (lambda () (synthetic-row 27 -1)) :clock)
    (unless (and (= 6250000 (getf (expected-tallies :wal-append-16-bytes 6250000) :recorded))
                 (= 1 (getf (expected-tallies :wal-append-16-bytes 6250001) :saturated))
                 (= 3750000 (getf (expected-tallies :wal-append-16-bytes 10000000) :saturated)))
      (reject :self-test "append byte-cap arithmetic differs"))
    (list :control :sensors-and-checker :status :ok :injected-clock-and-bytes t
          :arithmetic-row row :zero-tick-row zero :zero-byte-row zero-bytes
          :zero-window-rates nil :specified-rejections
          '(:counts :checksum :missing-field :timing :clock-counter :clock)
          :append-cap-boundaries :arithmetic-only)))

(defun allocation-sensor-fixture ()
  "Retained positive allocation control; not an allocation-rate measurement."
  (let* ((before (real-byte-counter))
         (live (make-array 1048576 :element-type '(unsigned-byte 8) :initial-element 42))
         (after (real-byte-counter)))
    (unless (and (= 42 (aref live (1- (length live)))) (>= (- after before) 1048576))
      (reject :self-test "positive 1 MiB allocation control was not detected"))
    (list :control :positive-allocation :status :ok :bytes-before before :bytes-after after
          :bytes-consed (- after before) :retained-payload-bytes (length live) :counter-scope :whole-process)))

(defun expect-invalid (api function)
  (let ((detected nil))
    (handler-case (funcall function)
      (error (condition)
        (unless (typep condition (getf api :invalid-argument)) (error condition))
        (setf detected t)))
    (unless detected (reject :self-test "public invalid input did not signal INVALID-ARGUMENT"))))

(defun require-result (actual expected)
  (unless (equal actual expected) (reject :self-test "expected ~S, got ~S" expected actual)))

(defun product-fixtures (api)
  "Small public functional/validation checks, outside every measured interval."
  (let* ((config (make-config api +sample-limit+))
         (metrics (call-api api :make +serie+ 0 0 config)))
    (check-summary (snapshot-summary api (call-api api :snapshot metrics 0))
                   (expected-summary nil :end 0))
    (require-result (call-api api :request metrics 0 :ok) :recorded)
    (require-result (call-api api :request metrics 31 :errore) :recorded)
    (dolist (outcome '(:hit :miss :espulsione :errore-verifica))
      (require-result (call-api api :cache metrics outcome) :recorded))
    (require-result (call-api api :append metrics 16) :recorded)
    (require-result (call-api api :flush metrics 127 4) :recorded)
    (dolist (depth '(0 3 1)) (require-result (call-api api :queue metrics :richieste depth) metrics))
    (require-result (call-api api :queue metrics :wal 2) metrics)
    (let* ((snapshot (call-api api :snapshot metrics +metric-end+))
           (before (snapshot-summary api snapshot))
           (counts '(:richieste 2 :errori 1 :cache-hit 1 :cache-miss 1 :cache-espulsioni 1
                     :cache-errori-verifica 1 :wal-append 1 :wal-byte 16 :wal-flush 1 :wal-record 4)))
      (check-summary before (expected-summary counts :request-queue '(1 3 :exact) :wal-queue '(2 2 :exact)))
      (require-result (multiple-value-list (call-api api :rate snapshot :richieste)) '(2 :ok t))
      (require-result (multiple-value-list (call-api api :rate snapshot :wal-byte)) '(16 :ok t))
      (let ((zero (call-api api :snapshot metrics 0))
            (fractional (call-api api :snapshot metrics 3000000000)))
        (require-result (multiple-value-list (call-api api :rate zero :richieste)) '(nil :zero-window t))
        (require-result (multiple-value-list (call-api api :rate fractional :richieste)) '(2/3 :ok t)))
      (dolist (function
                (list (lambda () (call-api api :request metrics -1 :ok))
                      (lambda () (call-api api :request metrics (expt 2 60) :ok))
                      (lambda () (call-api api :request metrics 0 :unknown))
                      (lambda () (call-api api :cache metrics :unknown))
                      (lambda () (call-api api :append metrics -1))
                      (lambda () (call-api api :append metrics (expt 2 60)))
                      (lambda () (call-api api :flush metrics -1 4))
                      (lambda () (call-api api :flush metrics 1 -1))
                      (lambda () (call-api api :flush metrics 1 (expt 2 60)))
                      (lambda () (call-api api :queue metrics :unknown 1))
                      (lambda () (call-api api :queue metrics :wal -1))
                      (lambda () (call-api api :queue metrics :richieste (expt 2 60)))
                      (lambda () (call-api api :snapshot metrics -1))
                      (lambda () (call-api api :reset metrics 0))
                      (lambda () (call-api api :reset metrics -1))))
        (expect-invalid api function)
        (check-summary (snapshot-summary api (call-api api :snapshot metrics +metric-end+)) before))
      (dolist (function
                (list (lambda () (call-api api :make -1 0 0 config))
                      (lambda () (call-api api :make (expt 2 128) 0 0 config))
                      (lambda () (call-api api :make +serie+ -1 0 config))
                      (lambda () (call-api api :make +serie+ (expt 2 60) 0 config))
                      (lambda () (call-api api :make +serie+ 0 -1 config))
                      (lambda () (call-api api :make +serie+ 0 0 nil))
                      (lambda () (call-api api :request nil 0 :ok))
                      (lambda () (call-api api :counter snapshot :unknown))
                      (lambda () (call-api api :rate snapshot :unknown))
                      (lambda () (call-api api :queue-state snapshot :unknown))))
        (expect-invalid api function))
      (require-result (call-api api :reset metrics +metric-end+) metrics)
      (check-summary (snapshot-summary api (call-api api :snapshot metrics +metric-end+))
                     (expected-summary nil :start +metric-end+ :request-queue '(1 1 :exact)
                                       :wal-queue '(2 2 :exact)))
      (check-summary (snapshot-summary api snapshot) before)
      (expect-invalid api (lambda () (call-api api :snapshot metrics (1- +metric-end+))))
      (expect-invalid api (lambda () (call-api api :reset metrics (1- +metric-end+))))
      (expect-invalid api (lambda () (call-api api :reset metrics +metric-end+)))
      (check-summary (snapshot-summary api (call-api api :snapshot metrics +metric-end+))
                     (expected-summary nil :start +metric-end+ :request-queue '(1 1 :exact)
                                       :wal-queue '(2 2 :exact)))))
  (list :control :public-functional-and-validation :status :ok
        :counter-and-histogram-totals t :queue-knowledge t :typed-input-rejection t
        :rational-and-zero-window-rates t :strict-reset-advance t :reset-and-old-snapshot t))

(defun saturation-fixtures (api)
  "Small cold controls distinguish sticky rejection from merely not fitting once."
  (let ((append (call-api api :make +serie+ 0 0 (make-config api 16)))
        (flush (call-api api :make +serie+ 0 0 (make-config api 4)))
        (request (call-api api :make +serie+ 0 0 (make-config api 1))))
    (require-result (call-api api :append append 16) :recorded)
    (require-result (call-api api :append append 1) :saturated)
    (require-result (call-api api :append append 0) :saturated)
    (require-result (call-api api :cache append :hit) :recorded)
    (require-result (call-api api :request append 1 :ok) :recorded)
    (let ((snapshot (call-api api :snapshot append +metric-end+)))
      (check-summary (snapshot-summary api snapshot)
                     (expected-summary '(:wal-append 1 :wal-byte 16 :cache-hit 1 :richieste 1)
                                       :incomplete '(:wal-append :wal-byte)))
      (require-result (multiple-value-list (call-api api :rate snapshot :wal-byte)) '(16 :incomplete nil)))
    (require-result (call-api api :flush flush 1 4) :recorded)
    (require-result (call-api api :flush flush 1 1) :saturated)
    (require-result (call-api api :flush flush 1 0) :saturated)
    (require-result (call-api api :append flush 0) :recorded)
    (require-result (call-api api :request flush 1 :errore) :recorded)
    (check-summary (snapshot-summary api (call-api api :snapshot flush +metric-end+))
                   (expected-summary '(:wal-flush 1 :wal-record 4 :wal-append 1 :richieste 1 :errori 1)
                                     :incomplete '(:wal-flush :wal-record) :flush-saturated t))
    (require-result (call-api api :request request 0 :ok) :recorded)
    (require-result (call-api api :request request 1 :errore) :saturated)
    (require-result (call-api api :request request 1 :ok) :saturated)
    (require-result (call-api api :cache request :hit) :recorded)
    (require-result (call-api api :cache request :hit) :saturated)
    (require-result (call-api api :cache request :miss) :recorded)
    (let ((snapshot (call-api api :snapshot request +metric-end+)))
      (check-summary (snapshot-summary api snapshot)
                     (expected-summary '(:richieste 1 :cache-hit 1 :cache-miss 1)
                                       :incomplete '(:richieste :errori :cache-hit) :request-saturated t))
      (require-result (multiple-value-list (call-api api :rate snapshot :richieste)) '(1 :incomplete nil))))
  (list :control :sticky-family-saturation :status :ok :other-families-continue t
        :smaller-subsequent-increment-still-rejected t))

(defun make-report (argv)
  (list :schema-version 1 :kind :metrics-counter-benchmark :status :running
        :method-date "2026-11-01" :argv (copy-list argv) :parameters nil
        :phase :argv :diagnostic nil :controls nil :measurements nil
        :environment (list :lisp (lisp-implementation-type) :version (lisp-implementation-version)
                           :os (software-type) :os-version (software-version) :machine (machine-type)
                           :external-load-status :uncontrolled
                           :asdf-output-translations (uiop:getenv "ASDF_OUTPUT_TRANSLATIONS")
                           :xdg-cache-home (uiop:getenv "XDG_CACHE_HOME")
                           :cache-policy :inherit-parent-private-hierarchy)
        :clock (list :source :get-internal-real-time :tick-frequency internal-time-units-per-second
                     :nominal-tick-ns (/ 1000000000 internal-time-units-per-second)
                     :effective-resolution :not-calibrated)
        :limits '(:component-event-loop-only :includes-public-guards-dispatch-tallies-sink
                  :baseline-not-subtracted :whole-process-byte-counter :external-load-uncontrolled
                  :macos-arm64-campaign-scope :no-linux-qualification :no-database-performance-claim
                  :no-per-request-timing-percentiles :no-universal-zero-allocation-claim
                  :cold-construction-capture-report-gc-excluded :automatic-gc-enabled
                  :append-byte-cap-can-bind-above-6250000-iterations)))

(defun emit-report (report)
  (setf (getf report :measurements) (nreverse (getf report :measurements))
        (getf report :controls) (nreverse (getf report :controls)))
  (let ((*print-readably* t) (*print-pretty* t) (*print-length* nil) (*print-level* nil)
        (*print-base* 10) (*print-radix* nil) (*package* (find-package :keyword)))
    (write report :stream *standard-output*) (terpri) (finish-output)))

(defun main ()
  (let* ((argv (uiop:command-line-arguments)) (report (make-report argv)))
    (handler-case
        (progn
          (let ((*standard-output* *error-output*) (*trace-output* *error-output*))
            (handler-bind ((warning #'strict-warning))
              (let* ((options (parse-arguments argv)) (mode (getf options :mode))
                     (bench (eq mode :bench)) (negative (eq mode :negative-fixture))
                     (iterations (cond (bench (getf options :iterations)) (negative 4) (t 16)))
                     (repetitions (if bench (getf options :repetitions) 1))
                     (warmup (cond (bench +warmup+) (negative 0) (t 16))))
                (setf (getf report :parameters)
                      (list :mode mode :iterations iterations :repetitions repetitions
                            :expected-windows (if negative 1 (* 8 repetitions))
                            :scenarios (coerce *scenarios* 'list) :precision +precision+ :maximum +maximum+
                            :sample-limit +sample-limit+ :saturated-sample-limit 1
                            :unit :nanosecondi :unit-scale 1000000000 :domain :monotono
                            :workload-size +workload-size+ :warmup-iterations warmup
                            :metric-window-start 0 :metric-window-end +metric-end+
                            :metric-window-clock :synthetic-validation-only))
                (require-single-thread)
                (when negative
                  (setf (getf report :phase) :deliberate-negative-fixture)
                  (let ((row (synthetic-row)))
                    (setf (getf row :status) :pending)
                    (push row (getf report :measurements))
                    (remf (getf row :observed) :completed)
                    (check-observation row)
                    (reject :self-test "missing-field negative fixture escaped rejection")))
                (setf (getf report :phase) :load-product)
                (let ((api (load-product)))
                  (setf (getf report :phase) :controls)
                  (dolist (fixture (list #'argv-fixtures #'checker-fixtures #'allocation-sensor-fixture))
                    (push (funcall fixture) (getf report :controls)))
                  (push (product-fixtures api) (getf report :controls))
                  (push (saturation-fixtures api) (getf report :controls))
                  (require-single-thread)
                  (setf (getf report :phase) (if bench :benchmark :small-functional-windows))
                  (campaign api report iterations repetitions warmup)))))
          (setf (getf report :status) :ok (getf report :phase) :complete)
          (emit-report report))
      (error (condition)
        (setf (getf report :status) :failed
              (getf report :diagnostic)
              (list :reason (if (typep condition 'bench-failure) (failure-reason condition) :unexpected-error)
                    :message (princ-to-string condition)))
        (dolist (row (getf report :measurements))
          (unless (eq (getf row :status) :ok) (setf (getf row :status) :failed)))
        (format *error-output* "~&metrics-counter-bench C4 [~A]: ~A~%" (getf report :phase) condition)
        (emit-report report)
        (uiop:quit 1)))))

(main)
