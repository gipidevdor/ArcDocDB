;;;; C4, COD-60/61. Preregistered in docs/implementazione/istogrammi-latenza-metodo.md.
;;;; --bench [--iterations N] [--repetitions R] | --self-test | --negative-fixture
;;;; No automatic campaign: run only after authors/reviewers have closed their work.
;;; OWNER: the script's main thread owns all histograms, sinks and report conses.
;;; SHARED: no driver threads, runtime integration or mutable product globals.
;;; The one special below is a script pathname, never product hot shared state.
(require :asdf)
(defpackage #:arcdocdb.metrics-histogram.bench (:use #:cl))
(in-package #:arcdocdb.metrics-histogram.bench)
(declaim (optimize (speed 2) (safety 3) (debug 2)))

(defparameter *root*
  (merge-pathnames "../" (uiop:pathname-directory-pathname *load-truename*)))
(defconstant +default-iterations+ 1000000)
(defconstant +max-iterations+ 10000000)
(defconstant +default-repetitions+ 5)
(defconstant +max-repetitions+ 20)
(defconstant +warmup+ 1024)
(defconstant +maximum+ 60000000000)
(defconstant +sample-limit+ 20000000)
(defconstant +workload-size+ 256)
(defconstant +checksum-mask+ #x1fffffff)

(define-condition bench-failure (error)
  ((reason :initarg :reason :reader failure-reason)
   (detail :initarg :detail :reader failure-detail))
  (:report (lambda (condition stream)
             (format stream "tools/metrics-histogram-bench.lisp COD-61 (~A): ~A"
                     (failure-reason condition) (failure-detail condition)))))

(defun reject (reason control &rest arguments)
  (error 'bench-failure :reason reason :detail (apply #'format nil control arguments)))

(defun decimal-argument (text maximum)
  "Only 1..MAXIMUM in canonical ASCII decimal; length checked before parsing."
  (unless (and (stringp text) (<= 1 (length text) (length (write-to-string maximum)))
               (char<= #\1 (char text 0) #\9)
               (every (lambda (char) (char<= #\0 char #\9)) text))
    (reject :argv "expected decimal integer 1..~D, got ~S" maximum text))
  (let ((value (parse-integer text :radix 10 :junk-allowed nil)))
    (unless (<= 1 value maximum) (reject :argv "integer outside 1..~D: ~S" maximum text))
    value))

(defun parse-arguments (argv)
  "Exact modes; benchmark options may occur once each, in either order."
  (when (member argv '(("--self-test") ("--negative-fixture")) :test #'equal)
    (return-from parse-arguments
      (list :mode (if (string= (first argv) "--self-test") :self-test :negative-fixture))))
  (unless (and (<= 1 (length argv) 5) (string= (first argv) "--bench")
               (evenp (length (rest argv))))
    (reject :argv "usage: --bench [--iterations 1..10000000] [--repetitions 1..20], --self-test, or --negative-fixture"))
  (let ((iterations +default-iterations+) (repetitions +default-repetitions+) (seen nil))
    (loop for (key value) on (rest argv) by #'cddr do
      (when (member key seen :test #'string=) (reject :argv "duplicate option ~S" key))
      (push key seen)
      (cond ((string= key "--iterations") (setf iterations (decimal-argument value +max-iterations+)))
            ((string= key "--repetitions") (setf repetitions (decimal-argument value +max-repetitions+)))
            (t (reject :argv "unknown option ~S" key))))
    (list :mode :bench :iterations iterations :repetitions repetitions)))

(defun load-product ()
  "Standard core ASDF load, outside all measurements; inherit the parent's cache."
  (unless (and (string= (lisp-implementation-type) "SBCL")
               (>= most-positive-fixnum #x0fffffffffffffff))
    (reject :implementation "requires 64-bit SBCL; no other implementation is qualified"))
  (when (or (member :sb-cover *features*) (find-package "SB-COVER"))
    (reject :coverage "use a fresh process without coverage instrumentation"))
  (let ((*standard-output* *error-output*) (*trace-output* *error-output*)
        (*compile-verbose* nil) (*compile-print* nil) (*load-verbose* nil) (*load-print* nil)
        (asdf:*compile-file-warnings-behaviour* :error)
        (asdf:*compile-file-failure-behaviour* :error))
    (handler-bind ((warning (lambda (condition)
                             (unless (typep condition 'sb-kernel:redefinition-warning)
                               (reject :product-warning "~A" condition)))))
      (asdf:load-asd (merge-pathnames "arcdocdb.asd" *root*))
      (asdf:load-system "arcdocdb" :force t :verbose nil)))
  (let ((package (find-package "ARCDOCDB.METRICS")))
    (unless package (reject :api "ASDF core must integrate src/metrics before running this driver"))
    (loop for (key name) in
          '((:config "CREA-CONFIGURAZIONE-ISTOGRAMMA") (:make "CREA-ISTOGRAMMA")
            (:record "REGISTRA-LATENZA") (:reset "AZZERA-ISTOGRAMMA")
            (:snapshot "ISTANTANEA-ISTOGRAMMA") (:percentile "PERCENTILE-LATENZA")
            (:cells "CONFIGURAZIONE-ISTOGRAMMA-CELLE")
            (:payload "CONFIGURAZIONE-ISTOGRAMMA-BYTE-CONTATORI")
            (:population "ISTANTANEA-LATENZE-CAMPIONI")
            (:saturated "ISTANTANEA-LATENZE-SATURATA-P")
            (:maximum "ISTANTANEA-LATENZE-MASSIMO-OSSERVATO"))
          append (multiple-value-bind (symbol visibility) (find-symbol name package)
                   (unless (and (eq visibility :external) (fboundp symbol))
                     (reject :api "missing exported function ARCDOCDB.METRICS:~A" name))
                   (list key (symbol-function symbol))))))

(defun call-api (api key &rest arguments)
  "Cold paths only. The update kernel directly FUNCALLs the resolved public function."
  (apply (getf api key) arguments))

(defun require-single-thread ()
  (let ((threads (sb-thread:list-all-threads)))
    (unless (and (= 1 (length threads)) (eq (first threads) sb-thread:*current-thread*))
      (reject :threads "process must have only the driver Lisp thread; found ~D" (length threads)))))

(defun real-clock () (get-internal-real-time))
(defun real-byte-counter () (sb-ext:get-bytes-consed))

(defstruct raw
  (completed 0 :type fixnum) (accepted 0 :type fixnum)
  (recorded 0 :type fixnum) (above-range 0 :type fixnum) (saturated 0 :type fixnum)
  (checksum 0 :type fixnum)
  ticks-before ticks-after tick-frequency bytes-before bytes-after)

(defun measure (thunk raw &key (clock #'real-clock)
                             (tick-frequency internal-time-units-per-second)
                             (byte-counter #'real-byte-counter))
  "Injectable batch clock/counter. RAW and THUNK already exist; cleanup retains failures.
Bytes enclose both clock reads; elapsed ticks enclose THUNK, excluding byte reads."
  (unless (and (integerp tick-frequency) (plusp tick-frequency))
    (reject :clock "tick frequency must be a positive integer"))
  (setf (raw-tick-frequency raw) tick-frequency
        (raw-bytes-before raw) (funcall byte-counter)
        (raw-ticks-before raw) (funcall clock))
  (unwind-protect (funcall thunk)
    (setf (raw-ticks-after raw) (funcall clock)
          (raw-bytes-after raw) (funcall byte-counter)))
  raw)

(defun timing (raw)
  "Conversion/report allocation after the counter closes; zero ticks imply no rate."
  (let* ((before (raw-ticks-before raw)) (after (raw-ticks-after raw))
         (frequency (raw-tick-frequency raw))
         (bytes-before (raw-bytes-before raw)) (bytes-after (raw-bytes-after raw)))
    (unless (and (every (lambda (x) (and (integerp x) (<= 0 x)))
                        (list before after bytes-before bytes-after))
                 (integerp frequency) (plusp frequency) (<= before after) (<= bytes-before bytes-after))
      (reject :clock-counter "missing, negative or regressing clock/byte readings"))
    (let* ((ticks (- after before)) (bytes (- bytes-after bytes-before))
           (seconds (/ ticks (float frequency 1d0))) (n (raw-completed raw)))
      (list :ticks-before before :ticks-after after :raw-ticks ticks :tick-frequency frequency
            :nominal-tick-ns (/ 1000000000d0 frequency) :seconds seconds
            :time-quality (if (zerop ticks) :below-resolution :measured)
            :elapsed-ns-per-op (when (and (plusp ticks) (plusp n)) (/ (* seconds 1d9) n))
            :operations-per-second (when (and (plusp ticks) (plusp n)) (/ n seconds))
            :bytes-before bytes-before :bytes-after bytes-after :bytes-consed bytes
            :zero-bytes-observed-p (zerop bytes) :counter-scope :whole-process))))

(defun make-workload (scenario)
  "One fixed vector, not an observations log. All values are preallocated fixnums."
  (let ((values (make-array +workload-size+ :element-type 'fixnum))
        (anchors (vector 0 1 15 16 31 32 127 128 255 256 1023 1024
                         1000000 1000000000 (1- +maximum+) +maximum+)))
    (dotimes (i +workload-size+ values)
      (setf (aref values i)
            (if (eq scenario :above-range)
                (+ +maximum+ 1 (mod (* i 8191) 1000000))
                (aref anchors (mod (+ (* i 73) 11) 16)))))))

(defun update-loop (record histogram values iterations raw)
  "Includes public owner/value/reentry/fault guards, dispatch, tallies and checksum.
RECORD NIL is the baseline. No sample objects or per-call clock reads."
  (declare (type (simple-array fixnum (*)) values) (type fixnum iterations) (type raw raw))
  (dotimes (i iterations)
    (let* ((value (aref values (logand i 255)))
           (status (if record (funcall record histogram value) :baseline))
           (token (case status
                    (:baseline (if record (reject :update-status "unexpected :baseline") 0))
                    (:recorded (incf (raw-recorded raw)) (incf (raw-accepted raw)) 1)
                    (:above-range (incf (raw-above-range raw)) (incf (raw-accepted raw)) 2)
                    (:saturated (incf (raw-saturated raw)) 3)
                    (otherwise (reject :update-status "unexpected return ~S" status)))))
      (setf (raw-checksum raw)
            (logand +checksum-mask+ (+ (raw-checksum raw) (logand value #xffff) token)))
      (incf (raw-completed raw)))))

(defun expected-checksum (values iterations token)
  "Cold cycle arithmetic oracle, independent of the mutable measured sink."
  (multiple-value-bind (cycles remainder) (floor iterations +workload-size+)
    (let ((cycle-sum 0) (tail-sum 0))
      (dotimes (i +workload-size+)
        (let ((term (+ (logand (aref values i) #xffff) token)))
          (incf cycle-sum term) (when (< i remainder) (incf tail-sum term))))
      (logand +checksum-mask+ (+ (* cycles cycle-sum) tail-sum)))))

(defun expected-maximum (values iterations)
  (let ((maximum 0))
    (dotimes (i (min iterations +workload-size+) maximum)
      (setf maximum (max maximum (aref values i))))))

(defun raw-fields (raw)
  (list :completed (raw-completed raw) :accepted (raw-accepted raw)
        :recorded (raw-recorded raw) :above-range (raw-above-range raw)
        :saturated (raw-saturated raw) :checksum (raw-checksum raw)
        :ticks-before (raw-ticks-before raw) :ticks-after (raw-ticks-after raw)
        :tick-frequency (raw-tick-frequency raw)
        :bytes-before (raw-bytes-before raw) :bytes-after (raw-bytes-after raw)))

(defun required-fields (plist keys)
  (unless (and (listp plist) (evenp (length plist))) (reject :missing-field "not a plist"))
  (dolist (key keys)
    (unless (= 1 (loop for tail on plist by #'cddr count (eq (car tail) key)))
      (reject :missing-field "missing or duplicated ~S" key))))

(defun check-observation (row)
  (required-fields row '(:iterations :scenario :expected-checksum :observed :timing))
  (let* ((raw (getf row :observed)) (n (getf row :iterations)) (scenario (getf row :scenario))
         (recorded (if (eq scenario :recorded) n 0))
         (above (if (eq scenario :above-range) n 0))
         (saturated (if (eq scenario :cap-saturated) n 0)))
    (unless (member scenario '(:baseline-loop :recorded :cap-saturated :above-range))
      (reject :scenario "unknown scenario ~S" scenario))
    (required-fields raw '(:completed :accepted :recorded :above-range :saturated :checksum
                           :ticks-before :ticks-after :tick-frequency :bytes-before :bytes-after))
    (unless (and (eql (getf raw :completed) n) (eql (getf raw :recorded) recorded)
                 (eql (getf raw :above-range) above) (eql (getf raw :saturated) saturated)
                 (eql (getf raw :accepted) (+ recorded above)))
      (reject :counts "completed/status/accepted counts disagree for ~S" scenario))
    (unless (eql (getf raw :checksum) (getf row :expected-checksum))
      (reject :checksum "sink differs from independent cycle oracle"))
    (let* ((tm (getf row :timing)) (ticks (getf tm :raw-ticks)) (frequency (getf tm :tick-frequency))
           (bytes (getf tm :bytes-consed)))
      (required-fields tm '(:raw-ticks :tick-frequency :seconds :time-quality :elapsed-ns-per-op
                           :operations-per-second :bytes-consed :bytes-before :bytes-after
                           :ticks-before :ticks-after))
      (dolist (field '(:ticks-before :ticks-after :tick-frequency :bytes-before :bytes-after))
        (unless (eql (getf raw field) (getf tm field))
          (reject :timing "raw/converted sensor field differs: ~S" field)))
      (unless (and (integerp ticks) (<= 0 ticks) (integerp frequency) (plusp frequency)
                   (integerp bytes) (<= 0 bytes)
                   (= ticks (- (getf tm :ticks-after) (getf tm :ticks-before)))
                   (= bytes (- (getf tm :bytes-after) (getf tm :bytes-before)))
                   (= (getf tm :seconds) (/ ticks (float frequency 1d0)))
                   (if (zerop ticks)
                       (and (eq :below-resolution (getf tm :time-quality))
                            (null (getf tm :elapsed-ns-per-op)) (null (getf tm :operations-per-second)))
                       (and (eq :measured (getf tm :time-quality))
                            (= (getf tm :elapsed-ns-per-op) (/ (* (getf tm :seconds) 1d9) n))
                            (= (getf tm :operations-per-second) (/ n (getf tm :seconds))))))
        (reject :timing "inconsistent timing/allocation fields"))))
  t)

(defun check-snapshot (api histogram population saturated maximum)
  "Outside both sensors; only public immutable snapshot accessors."
  (let* ((snapshot (call-api api :snapshot histogram))
         (actual (list :population (call-api api :population snapshot)
                       :saturated-p (call-api api :saturated snapshot)
                       :maximum (call-api api :maximum snapshot))))
    (unless (equal actual (list :population population :saturated-p saturated :maximum maximum))
      (reject :snapshot "expected population/saturation/maximum ~S/~S/~S, got ~S"
              population saturated maximum actual))
    actual))

(defun footprint (api precision)
  "Exact counter payload via public configuration, checked against integer geometry."
  (let* ((config (call-api api :config :bit-precisione precision :massimo +maximum+))
         (shift (max 0 (- (integer-length +maximum+) 1 precision)))
         (cells (+ 2 (* shift (expt 2 precision)) (floor +maximum+ (expt 2 shift))))
         (actual-cells (call-api api :cells config)) (payload (call-api api :payload config)))
    (unless (and (= cells actual-cells) (= payload (* cells 8)))
      (reject :footprint "public counter geometry disagrees for p=~D" precision))
    (list :precision precision :maximum +maximum+ :cells actual-cells :counter-payload-bytes payload
          :scope :fixed-counter-payload-only
          :excluded '(:configuration :histogram-header :array-header :snapshot :allocator :rss))))

(defun run-one (api report precision scenario repetition iterations warmup values)
  (require-single-thread)
  (let* ((cap (eq scenario :cap-saturated)) (baseline (eq scenario :baseline-loop))
         (config (call-api api :config :bit-precisione precision :massimo +maximum+
                           :limite-campioni (if cap 1 +sample-limit+)
                           :unita :nanosecondi :dominio :monotono))
         (histogram (call-api api :make config)) (raw (make-raw))
         (record (unless baseline (getf api :record)))
         (token (ecase scenario (:baseline-loop 0) (:recorded 1) (:above-range 2) (:cap-saturated 3)))
         (row (list :status :pending :precision precision :scenario scenario :repetition repetition
                    :iterations iterations :warmup-iterations warmup :sample-limit (if cap 1 +sample-limit+)
                    :expected-completed iterations
                    :expected-accepted (if (member scenario '(:recorded :above-range)) iterations 0)
                    :expected-checksum (expected-checksum values iterations token)
                    :observed nil :timing nil :snapshot-after nil)))
    ;; Publish before warmup/sensors/checks; the boundary preserves pending and partial rows.
    (push row (getf report :measurements))
    (when cap
      (unless (eq :recorded (call-api api :record histogram 0)) (reject :prefill "cap prefill failed")))
    (update-loop record histogram values warmup (make-raw))
    (unless (eq histogram (call-api api :reset histogram)) (reject :reset "reset returned another histogram"))
    (when cap
      (unless (eq :recorded (call-api api :record histogram 0)) (reject :prefill "cap prefill failed")))
    (check-snapshot api histogram (if cap 1 0) nil 0)
    (let ((thunk (lambda () (update-loop record histogram values iterations raw))))
      (sb-ext:gc :full t)
      (require-single-thread)
      (unwind-protect (measure thunk raw)
        (setf (getf row :observed) (raw-fields raw))))
    (setf (getf row :timing) (timing raw))
    (check-observation row)
    (setf (getf row :snapshot-after)
          (check-snapshot api histogram (cond (baseline 0) (cap 1) (t iterations)) cap
                          (if (or baseline cap) 0 (expected-maximum values iterations))))
    (require-single-thread)
    (setf (getf row :status) :ok)))

(defun campaign (api report iterations repetitions warmup)
  "Each repetition has fresh private fixtures. Rotate scenario order by repetition."
  (let ((regular (make-workload :recorded)) (above (make-workload :above-range))
        (scenarios #(:baseline-loop :recorded :cap-saturated :above-range)))
    (dolist (precision '(4 7 10))
      (push (footprint api precision) (getf report :footprints))
      (dotimes (rep repetitions)
        (dotimes (offset 4)
          (let ((scenario (svref scenarios (mod (+ rep offset) 4))))
            (run-one api report precision scenario (1+ rep) iterations warmup
                     (if (eq scenario :above-range) above regular))))))))

(defun expect-rejection (function reason)
  "COD-60 requires the specified rejection, not an unrelated runtime error."
  (let ((detected nil))
    (handler-case (funcall function)
      (bench-failure (condition)
        (unless (eq reason (failure-reason condition)) (error condition))
        (setf detected t)))
    (unless detected (reject :self-test "COD-60: mutation ~S was not detected" reason))))

(defun synthetic-row (&optional (end 27) (frequency 1000) (bytes-end 164))
  "Two controlled reads each; no wall-clock performance assertion."
  (let* ((raw (make-raw)) (ticks (list 7 end)) (bytes (list 100 bytes-end))
         (values (make-array +workload-size+ :element-type 'fixnum :initial-element 3)))
    (measure (lambda () (update-loop (lambda (histogram value)
                                      (declare (ignore histogram value)) :recorded)
                                    nil values 4 raw)) raw
             :clock (lambda () (unless ticks (reject :self-test "extra clock read")) (pop ticks))
             :tick-frequency frequency
             :byte-counter (lambda () (unless bytes (reject :self-test "extra counter read")) (pop bytes)))
    (unless (and (null ticks) (null bytes)) (reject :self-test "missing sensor reads"))
    (list :iterations 4 :scenario :recorded :expected-checksum 16
          :observed (raw-fields raw) :timing (timing raw))))

(defun checker-fixtures ()
  (let ((row (synthetic-row)) (zero (synthetic-row 7)))
    (check-observation row) (check-observation zero)
    (unless (and (= 20 (getf (getf row :timing) :raw-ticks))
                 (= 5000000d0 (getf (getf row :timing) :elapsed-ns-per-op))
                 (= 64 (getf (getf row :timing) :bytes-consed)))
      (reject :self-test "injected sensor arithmetic failed"))
    (dolist (field '(:completed :accepted :recorded))
      (let ((copy (copy-tree row)))
        (incf (getf (getf copy :observed) field))
        (expect-rejection (lambda () (check-observation copy)) :counts)))
    (let ((copy (copy-tree row)))
      (incf (getf (getf copy :observed) :checksum))
      (expect-rejection (lambda () (check-observation copy)) :checksum))
    (let ((copy (copy-tree row)))
      (remf (getf copy :observed) :completed)
      (expect-rejection (lambda () (check-observation copy)) :missing-field))
    (let ((copy (copy-tree row)))
      (incf (getf (getf copy :timing) :elapsed-ns-per-op))
      (expect-rejection (lambda () (check-observation copy)) :timing))
    (expect-rejection (lambda () (synthetic-row 6)) :clock-counter)
    (expect-rejection (lambda () (synthetic-row 27 1000 99)) :clock-counter)
    (expect-rejection (lambda () (synthetic-row 27 0)) :clock)
    (list :status :ok :injected-clock-and-counter t :zero-tick-policy :below-resolution
          :specific-corruption-rejections 9)))

(defun argv-fixtures ()
  (dolist (argv '(("--bench") ("--bench" "--iterations" "1" "--repetitions" "1")
                  ("--bench" "--repetitions" "20" "--iterations" "10000000")
                  ("--self-test") ("--negative-fixture")))
    (parse-arguments argv))
  (dolist (argv '(nil ("--bench" "1") ("--bench" "--iterations")
                  ("--bench" "--iterations" "0") ("--bench" "--iterations" "10000001")
                  ("--bench" "--repetitions" "21") ("--bench" "--repetitions" "-1")
                  ("--bench" "--iterations" "+1") ("--bench" "--iterations" "01")
                  ("--bench" "--iterations" " 1") ("--bench" "--iterations" "1x")
                  ("--bench" "--iterations" "1.0") ("--bench" "--iterations=1")
                  ("--bench" "--repetitions" "1" "--repetitions" "2")
                  ("--self-test" "--iterations" "1") ("--negative-fixture" "extra")))
    (expect-rejection (lambda () (parse-arguments argv)) :argv))
  (list :status :ok :accepted-fixtures 5 :rejected-fixtures 16))

(defun product-fixtures (api)
  "Small cold public snapshot/query fixture, separate from update-cost batches."
  (let* ((config (call-api api :config :bit-precisione 4 :massimo +maximum+ :limite-campioni 2))
         (histogram (call-api api :make config)) (above (1+ +maximum+)))
    (unless (equal (multiple-value-list (call-api api :percentile (call-api api :snapshot histogram) 500))
                   '(nil nil :empty t)) (reject :self-test "empty query differs"))
    (unless (and (eq :recorded (call-api api :record histogram 0))
                 (eq :above-range (call-api api :record histogram above)))
      (reject :self-test "public update status differs"))
    (let ((snapshot (call-api api :snapshot histogram)))
      (unless (and (equal (multiple-value-list (call-api api :percentile snapshot 500)) '(0 0 :ok t))
                   (equal (multiple-value-list (call-api api :percentile snapshot 1000))
                          (list above above :above-range t)))
        (reject :self-test "public nearest-rank bounds differ"))
      (unless (eq :saturated (call-api api :record histogram 1))
        (reject :self-test "sample cap not enforced"))
      (unless (equal (multiple-value-list (call-api api :percentile (call-api api :snapshot histogram) 500))
                     '(0 0 :ok nil)) (reject :self-test "saturated completeness differs"))
      (call-api api :reset histogram)
      (check-snapshot api histogram 0 nil 0)
      (unless (equal (multiple-value-list (call-api api :percentile snapshot 500)) '(0 0 :ok t))
        (reject :self-test "captured snapshot changed after reset"))))
  (list :status :ok :cold-public-query-fixture t :old-snapshot-after-reset :unchanged))

(defun allocation-sensor-fixture ()
  "One deliberately retained 1 MiB object, not an allocation-rate benchmark."
  (let* ((before (real-byte-counter))
         (live (make-array 1048576 :element-type '(unsigned-byte 8) :initial-element 42))
         (after (real-byte-counter)))
    (unless (and (= 42 (aref live (1- (length live)))) (>= (- after before) 1048576))
      (reject :self-test "positive byte-counter control not detected"))
    (list :status :ok :bytes-before before :bytes-after after :bytes-consed (- after before)
          :retained-payload-bytes (length live) :counter-scope :whole-process)))

(defun make-report (argv)
  (list :schema-version 1 :kind :metrics-histogram-benchmark :status :running
        :argv (copy-list argv) :parameters nil :phase :argv :diagnostic nil
        :environment (list :lisp (lisp-implementation-type) :version (lisp-implementation-version)
                           :os (software-type) :os-version (software-version) :machine (machine-type)
                           :external-load-status :uncontrolled
                           :asdf-output-translations (uiop:getenv "ASDF_OUTPUT_TRANSLATIONS")
                           :xdg-cache-home (uiop:getenv "XDG_CACHE_HOME"))
        :clock (list :source :get-internal-real-time :tick-frequency internal-time-units-per-second
                     :nominal-tick-ns (/ 1000000000d0 internal-time-units-per-second)
                     :effective-resolution :not-calibrated)
        :footprints nil :self-test nil :measurements nil
        :limits '(:component-update-throughput-only :absolute-cost-includes-driver-loop
                  :baseline-not-subtracted :whole-process-byte-counter :external-load-uncontrolled
                  :apple-m4-macos-campaign-only :no-linux-or-portability-claim
                  :no-engine-performance-claim :no-per-request-timing-percentiles
                  :cold-construction-snapshot-query-reset-excluded :no-universal-zero-allocation-claim)))

(defun emit-report (report)
  (setf (getf report :measurements) (nreverse (getf report :measurements))
        (getf report :footprints) (nreverse (getf report :footprints)))
  (let ((*print-readably* t) (*print-pretty* t) (*print-length* nil) (*print-level* nil)
        (*print-base* 10) (*print-radix* nil) (*package* (find-package :keyword)))
    (write report :stream *standard-output*) (terpri) (finish-output)))

(defun main ()
  (let* ((argv (uiop:command-line-arguments)) (report (make-report argv)))
    (handler-case
        (handler-bind ((warning (lambda (condition)
                                 (unless (typep condition 'sb-kernel:redefinition-warning)
                                   (reject :warning "~A" condition)))))
          (let* ((options (parse-arguments argv)) (mode (getf options :mode))
                 (bench (eq mode :bench)) (negative (eq mode :negative-fixture))
                 (iterations (cond (bench (getf options :iterations)) (negative 4) (t 16)))
                 (repetitions (if bench (getf options :repetitions) 1))
                 (warmup (cond (bench +warmup+) (negative 0) (t 16))))
            (setf (getf report :parameters)
                  (list :mode mode :iterations iterations :repetitions repetitions
                        :precisions (unless negative '(4 7 10)) :maximum +maximum+
                        :workload-size +workload-size+ :unit :nanosecondi
                        :unit-scale 1000000000 :domain :monotono
                        :sample-limit +sample-limit+ :saturated-sample-limit 1
                        :warmup-iterations warmup))
            (when negative
              (let ((row (synthetic-row)))
                (setf (getf report :phase) :deliberate-negative-fixture)
                (push row (getf report :measurements))
                (remf (getf row :observed) :completed)
                (check-observation row)
                (reject :self-test "COD-60: incomplete row escaped boundary")))
            (setf (getf report :phase) :load-product)
            (let ((api (load-product)))
              (require-single-thread)
              (setf (getf report :phase) :self-test)
              (dolist (fixture (list #'argv-fixtures #'checker-fixtures #'allocation-sensor-fixture))
                (push (funcall fixture) (getf report :self-test)))
              (push (product-fixtures api) (getf report :self-test))
              (setf (getf report :phase) (if bench :benchmark :smoke))
              (campaign api report iterations repetitions warmup)))
          (setf (getf report :status) :ok (getf report :phase) :complete)
          (emit-report report))
      (error (condition)
        (setf (getf report :status) :failed (getf report :diagnostic) (princ-to-string condition))
        (dolist (row (getf report :measurements))
          (unless (eq (getf row :status) :ok) (setf (getf row :status) :failed)))
        (format *error-output* "~&tools/metrics-histogram-bench.lisp COD-61 [~A]: ~A~%"
                (getf report :phase) condition)
        (emit-report report)
        (uiop:quit 1)))))

(main)
