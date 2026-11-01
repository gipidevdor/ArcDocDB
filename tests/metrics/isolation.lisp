;;;; Ownership and snapshot publication use bounded joins, never timing-dependent interrupts or redefinitions.
;;; OWNER: each worker constructs and mutates its own histogram; main owns registry and assertions.
;;; SHARED: immutable configuration, harness semaphores, and snapshots consumed only after JOIN.
(in-package #:arcdocdb.metrics.tests)

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(deftest REQ-OBS-001-snapshot-copy-and-reset-isolation
  "Pre: multiple captures and two histograms sharing immutable configuration. Post: all counter copies remain independent."
  (let* ((config (m:crea-configurazione-istogramma :bit-precisione 4 :massimo 513))
         (histogram (m:crea-istogramma config)) (other (m:crea-istogramma config))
         (storage (m::istogramma-latenze-contatori histogram)))
    (dotimes (value 514) (m:registra-latenza histogram value))
    (m:registra-latenza histogram 514) (m:registra-latenza histogram 999)
    (m:registra-latenza other 7)
    (let* ((first (m:istantanea-istogramma histogram))
           (second (m:istantanea-istogramma histogram))
           (other-before (m:istantanea-istogramma other))
           (saved-counts (copy-seq (m::istantanea-latenze-contatori first))))
      (is (eq config (m:istantanea-latenze-configurazione first)))
      (is (not (eq first second)))
      (is (not (eq storage (m::istantanea-latenze-contatori first))))
      (is (not (eq storage (m::istantanea-latenze-contatori second))))
      (is (not (eq (m::istantanea-latenze-contatori first) (m::istantanea-latenze-contatori second))))
      (is (not (eq storage (m::istogramma-latenze-contatori other))))
      (check-population first) (check-population second)
      (is (equalp saved-counts (m::istantanea-latenze-contatori second)))
      (m:registra-latenza histogram m:+massima-latenza+)
      (m:azzera-istogramma histogram)
      (is (eq storage (m::istogramma-latenze-contatori histogram)))
      (let ((empty (m:istantanea-istogramma histogram)))
        (check-population empty)
        (is (every #'zerop (m::istantanea-latenze-contatori empty)))
        (is (zerop (m:istantanea-latenze-massimo-osservato empty)))
        (is (equal '(nil nil :empty t) (multiple-value-list (m:percentile-latenza empty 500)))))
      (m:registra-latenza histogram 0)
      (m:azzera-istogramma other)
      (m:registra-latenza other 513)
      (dolist (snapshot (list first second))
        (check-population snapshot)
        (is (equalp saved-counts (m::istantanea-latenze-contatori snapshot)))
        (is (= 516 (m:istantanea-latenze-campioni snapshot)))
        (is (= 999 (m:istantanea-latenze-massimo-osservato snapshot)))
        (is (not (m:istantanea-latenze-saturata-p snapshot))))
      (is (equal '(7 7 :ok t) (multiple-value-list (m:percentile-latenza other-before 1 1))))
      (is (= 1 (m:istantanea-latenze-campioni (m:istantanea-istogramma histogram))))
      (is (equal '(0 0 :ok t)
                 (multiple-value-list (m:percentile-latenza (m:istantanea-istogramma histogram) 1 1)))))))

;;; REQ: REQ-OBS-001 REQ-AFF-008
(declaim (ftype (function (t t) (integer 0)) syntax-occurrences))
(defun syntax-occurrences (form tree)
  "Pre: finite acyclic proper macro syntax. Post: matching complete subforms, not incidental list tails.
No expansion or evaluation occurs; element-wise traversal preserves the distinction between EQ operands and a LET binding."
  (cond ((equal form tree) 1)
        ((consp tree) (loop for child in tree sum (syntax-occurrences form child)))
        (t 0)))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(deftest REQ-OBS-001-mutation-macro-expansion-and-values
  "Pre: the production mutation macro with a static test body. Post: one histogram evaluation and all body values survive."
  (is (zerop (syntax-occurrences '(m::*accesso-istogrammi* sb-thread:*current-thread*)
                                '(eq m::*accesso-istogrammi* sb-thread:*current-thread*))))
  (is (= 1 (syntax-occurrences '(m::*accesso-istogrammi* sb-thread:*current-thread*)
                               '(let ((m::*accesso-istogrammi* sb-thread:*current-thread*)) (values)))))
  (let ((histogram-form '(progn (incf evaluations) histogram))
        (body-form '(values :first nil :third)))
    (multiple-value-bind (expansion expanded-p)
        (macroexpand-1 `(m::%con-mutazione-istogramma (,histogram-form) ,body-form))
      (is expanded-p)
      (is (= 1 (syntax-occurrences histogram-form expansion)))
      (is (= 1 (syntax-occurrences body-form expansion)))
      (is (= 1 (syntax-occurrences '(m::*accesso-istogrammi* sb-thread:*current-thread*) expansion)))))
  (let ((histogram (m:crea-istogramma)) (evaluations 0) (hist :outer-hist) (completed :outer-completed))
    (is (equal '(:outer-hist nil :outer-completed)
               (multiple-value-list
                (m::%con-mutazione-istogramma ((progn (incf evaluations) histogram))
                  (is (eq m::*accesso-istogrammi* sb-thread:*current-thread*))
                  (is (m::istogramma-latenze-guasto-p histogram))
                  (values hist nil completed)))))
    (is (= evaluations 1))
    (is (not m::*accesso-istogrammi*))
    (is (not (m::istogramma-latenze-guasto-p histogram)))
    (is (null (multiple-value-list (m::%con-mutazione-istogramma (histogram) (values)))))
    (is (equal '(:read nil :values)
               (multiple-value-list
                (m::%con-mutazione-istogramma (histogram :reset nil :sola-lettura t)
                  (values :read nil :values)))))
    (check-population (m:istantanea-istogramma histogram))))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(deftest REQ-OBS-001-reentry-preserves-outer-busy-state
  "Pre: owner enters the production mutation macro. Post: same/cross-histogram entry errors preserve its TLS identity."
  (let ((histogram (m:crea-istogramma)) (other (m:crea-istogramma)) (body-ran nil))
    (m:registra-latenza histogram 7)
    (m::%con-mutazione-istogramma (histogram)
      (let ((before (histogram-state histogram)) (other-before (histogram-state other)))
        (is (eq m::*accesso-istogrammi* sb-thread:*current-thread*))
        (signals invalid-argument
                 (m::%con-mutazione-istogramma (histogram) (setf body-ran t)) :metrics-histogram-reentry)
        (is (not body-ran)) (is (equalp before (histogram-state histogram)))
        (signals invalid-argument
                 (m::%con-mutazione-istogramma (histogram :reset t) (setf body-ran t))
                 :metrics-histogram-reentry)
        (is (not body-ran)) (is (equalp before (histogram-state histogram)))
        (signals invalid-argument
                 (m::%con-mutazione-istogramma (histogram :sola-lettura t) (setf body-ran t))
                 :metrics-histogram-reentry)
        (is (not body-ran)) (is (equalp before (histogram-state histogram)))
        (signals invalid-argument (m:registra-latenza histogram 0) :metrics-histogram-reentry)
        (is (equalp before (histogram-state histogram)))
        (signals invalid-argument (m:azzera-istogramma histogram) :metrics-histogram-reentry)
        (is (equalp before (histogram-state histogram)))
        (signals invalid-argument (m:istantanea-istogramma histogram) :metrics-histogram-reentry)
        (is (equalp before (histogram-state histogram)))
        ;; A second histogram on this SAME owner is also within the non-reentrant scope.
        (signals invalid-argument (m:registra-latenza other 0) :metrics-histogram-reentry)
        (is (equalp other-before (histogram-state other)))
        (signals invalid-argument (m:azzera-istogramma other) :metrics-histogram-reentry)
        (is (equalp other-before (histogram-state other)))
        (signals invalid-argument (m:istantanea-istogramma other) :metrics-histogram-reentry)
        (is (equalp other-before (histogram-state other)))
        (is (equalp before (histogram-state histogram)))
        (is (eq m::*accesso-istogrammi* sb-thread:*current-thread*))))
    (is (not m::*accesso-istogrammi*))
    (is (not (m::istogramma-latenze-guasto-p histogram)))
    (is (eq :recorded (m:registra-latenza histogram 0)))
    (check-population (m:istantanea-istogramma histogram))))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(deftest REQ-OBS-001-mutation-macro-literal-modes
  "Pre: cold macroexpansion only. Post: literal NIL/T modes expand; dynamic, quoted or nonboolean modes reject."
  (dolist (options '(() (:reset nil) (:reset t) (:sola-lettura nil) (:sola-lettura t)
                      (:reset nil :sola-lettura nil) (:reset nil :sola-lettura t)
                      (:reset t :sola-lettura nil) (:reset t :sola-lettura t)))
    (multiple-value-bind (expansion expanded-p)
        (macroexpand-1 `(m::%con-mutazione-istogramma (histogram ,@options) (values :ok)))
      (is expanded-p)
      (is (= 1 (syntax-occurrences '(values :ok) expansion)))))
  (dolist (options '((:reset 0) (:reset 1) (:reset :yes) (:reset reset-mode) (:reset (not nil))
                      (:reset (quote t)) (:sola-lettura 0) (:sola-lettura 1) (:sola-lettura :yes)
                      (:sola-lettura read-mode) (:sola-lettura (not nil)) (:sola-lettura (quote nil))
                      (:reset nil :sola-lettura :yes) (:reset :yes :sola-lettura t)))
    (signals invalid-argument
             (macroexpand-1 `(m::%con-mutazione-istogramma (histogram ,@options) (values :ok)))
             :metrics-histogram-scope)))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(deftest REQ-OBS-001-read-abort-releases-busy-preserves-fault
  "Pre: the production scope in read-only mode, with healthy and already-faulted private fixtures.
Post: typed read abort releases busy and preserves all data/fault state; a nonlocal read exit behaves identically."
  (let ((histogram (m:crea-istogramma
                    (m:crea-configurazione-istogramma :dominio :test-synthetic-read-abort))))
    (m:registra-latenza histogram 7)
    (let ((before (histogram-state histogram)))
      (signals invalid-argument
               (m::%con-mutazione-istogramma (histogram :sola-lettura t)
                 (is (eq m::*accesso-istogrammi* sb-thread:*current-thread*))
                 (is (not (m::istogramma-latenze-guasto-p histogram)))
                 (error 'invalid-argument :reason :metrics-test-read-abort))
               :metrics-test-read-abort)
      (is (equalp before (histogram-state histogram)))
      (is (not m::*accesso-istogrammi*))
      (is (eq :read-aborted
              (catch 'metrics-read-abort
                (m::%con-mutazione-istogramma (histogram :reset nil :sola-lettura t)
                  (throw 'metrics-read-abort :read-aborted)))))
      (is (equalp before (histogram-state histogram))))
    (is (not m::*accesso-istogrammi*))
    (is (equal '(7 7 :ok t)
               (multiple-value-list (m:percentile-latenza (m:istantanea-istogramma histogram) 1 1))))
    ;; Synthetic fault flag is deliberate metadata of the private fixture, not a real interrupted read.
    (setf (m::istogramma-latenze-guasto-p histogram) t)
    (let ((before (histogram-state histogram)) (body-ran nil))
      (signals invariant-violation
               (m::%con-mutazione-istogramma (histogram :sola-lettura t) (setf body-ran t))
               :metrics-histogram-interrupted)
      (is (not body-ran)) (is (equalp before (histogram-state histogram)))
      (signals invalid-argument
               (m::%con-mutazione-istogramma (histogram :reset t :sola-lettura t)
                 (is (eq m::*accesso-istogrammi* sb-thread:*current-thread*))
                 (error 'invalid-argument :reason :metrics-test-read-abort))
               :metrics-test-read-abort)
      (is (equalp before (histogram-state histogram))))
    (is (not m::*accesso-istogrammi*))
    (m:azzera-istogramma histogram)
    (check-population (m:istantanea-istogramma histogram))))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(deftest REQ-OBS-001-abnormal-mutation-faults-until-reset
  "Pre: explicitly synthetic partial mutation through the SAME private macro as record/reset.
Post: typed body error sets fault, clears busy, rejects updates/captures until reset; no interrupts or redefinitions."
  (let* ((histogram (m:crea-istogramma
                    (m:crea-configurazione-istogramma :dominio :test-synthetic-interrupted-mutation)))
         (counts (m::istogramma-latenze-contatori histogram)))
    (m:registra-latenza histogram 7)
    (let ((retained (m:istantanea-istogramma histogram)))
      (signals invalid-argument
               (m::%con-mutazione-istogramma (histogram)
                 (is (eq m::*accesso-istogrammi* sb-thread:*current-thread*))
                 (is (m::istogramma-latenze-guasto-p histogram))
                 ;; Real partial write in private test storage: total/maximum are intentionally not advanced.
                 (incf (aref counts 0))
                 (error 'invalid-argument :reason :metrics-test-partial-mutation))
               :metrics-test-partial-mutation)
      (is (= 1 (aref counts 0)))
      (is (= 1 (m::istogramma-latenze-campioni histogram)))
      (is (m::istogramma-latenze-guasto-p histogram))
      (is (not m::*accesso-istogrammi*))
      (let ((before (histogram-state histogram)) (body-ran nil))
        (dotimes (attempt 2)
          (signals invariant-violation (m:registra-latenza histogram 0) :metrics-histogram-interrupted)
          (is (equalp before (histogram-state histogram)))
          (signals invariant-violation (m:istantanea-istogramma histogram) :metrics-histogram-interrupted)
          (is (equalp before (histogram-state histogram))))
        (signals invariant-violation
                 (m::%con-mutazione-istogramma (histogram) (setf body-ran t)) :metrics-histogram-interrupted)
        (is (not body-ran)) (is (equalp before (histogram-state histogram))))
      (is (eq histogram (m:azzera-istogramma histogram)))
      (is (eq counts (m::istogramma-latenze-contatori histogram)))
      (is (every #'zerop counts))
      (is (not (m::istogramma-latenze-guasto-p histogram)))
      (is (not m::*accesso-istogrammi*))
      (is (zerop (m::istogramma-latenze-massimo-osservato histogram)))
      (let ((empty (m:istantanea-istogramma histogram)))
        (check-population empty)
        (is (equal '(nil nil :empty t) (multiple-value-list (m:percentile-latenza empty 500)))))
      (is (eq :recorded (m:registra-latenza histogram 11)))
      (is (equal '(11 11 :ok t)
                 (multiple-value-list (m:percentile-latenza (m:istantanea-istogramma histogram) 1 1))))
      (is (equal '(7 7 :ok t) (multiple-value-list (m:percentile-latenza retained 1 1)))))))

;;; REQ: REQ-OBS-001 REQ-AFF-008
(declaim (ftype (function () integer) metrics-deadline))
(defun metrics-deadline ()
  "Pre: start of a thread fixture. Post: one common fifteen-second deadline for its waits and joins."
  (+ (get-internal-real-time) (* 15 internal-time-units-per-second)))

;;; REQ: REQ-OBS-001 REQ-AFF-008
(declaim (ftype (function (integer) double-float) metrics-seconds-left))
(defun metrics-seconds-left (deadline)
  "Pre: fixture deadline. Post: positive timeout, or failure instead of an unbounded wait."
  (let ((remaining (- deadline (get-internal-real-time))))
    (is (plusp remaining))
    (/ remaining (float internal-time-units-per-second 1d0))))

;;; REQ: REQ-OBS-001 REQ-AFF-008
(declaim (ftype (function (string function) sb-thread:thread) metrics-worker))
(defun metrics-worker (name thunk)
  "Pre: private worker body. Post: errors returned for propagation by the parent, never left to an interactive debugger."
  (sb-thread:make-thread (lambda () (handler-case (funcall thunk) (error (condition) condition))) :name name))

;;; REQ: REQ-OBS-001 REQ-AFF-008
(declaim (ftype (function (sb-thread:thread integer) list) metrics-join))
(defun metrics-join (thread deadline)
  "Pre: fixture worker. Post: joined :OK result or propagated error; JOIN supplies the snapshot publication edge."
  (let ((result (sb-thread:join-thread thread :timeout (metrics-seconds-left deadline) :default :metrics-timeout)))
    (when (typep result 'error) (error result))
    (is (consp result)) (is (eq :ok (first result)))
    result))

;;; REQ: REQ-OBS-001 REQ-AFF-008
(declaim (ftype (function (list) null) metrics-stop-workers))
(defun metrics-stop-workers (threads)
  "Pre: only this fixture's workers. Post: bounded cleanup, no live workers, and worker errors still propagate."
  (let ((failure nil))
    (dolist (thread threads)
      (when (sb-thread:thread-alive-p thread) (sb-thread:terminate-thread thread))
      (let ((result (sb-thread:join-thread thread :timeout 1 :default :metrics-stopped)))
        (when (typep result 'error) (unless failure (setf failure result)))
        (is (not (sb-thread:thread-alive-p thread)))))
    (when failure (error failure)))
  nil)

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(deftest REQ-OBS-001-wrong-owner-errors-before-change
  "Pre: owner remains quiescent while a foreign thread attempts each operation.
Post: record/reset/capture reject on ownership before touching ordinary, saturated or busy/faulted state."
  (let* ((histogram (m:crea-istogramma (m:crea-configurazione-istogramma
                                     :limite-campioni 1 :dominio :test-synthetic-owner-guard)))
         (deadline (metrics-deadline)) (threads nil))
    (m:registra-latenza histogram 7)
    (unwind-protect
         (dotimes (phase 3)
           (case phase
             (1 (m:registra-latenza histogram 8))
             (2 (setf (m::istogramma-latenze-guasto-p histogram) t)))
           (dolist (operation '(:record :reset :capture))
             (let* ((before (histogram-state histogram)) (action operation) (busy-p (= phase 2))
                    (thread (metrics-worker
                             "metrics foreign owner"
                             (lambda ()
                               (let ((m::*accesso-istogrammi* (when busy-p sb-thread:*current-thread*)))
                                 (ecase action
                                   (:record (signals invalid-argument (m:registra-latenza histogram 0)
                                                     :metrics-histogram-owner))
                                   (:reset (signals invalid-argument (m:azzera-istogramma histogram)
                                                    :metrics-histogram-owner))
                                   (:capture (signals invalid-argument (m:istantanea-istogramma histogram)
                                                      :metrics-histogram-owner)))
                                 (is (eq m::*accesso-istogrammi* (when busy-p sb-thread:*current-thread*))))
                               (list :ok)))))
               (push thread threads)
               (metrics-join thread deadline)
               (is (equalp before (histogram-state histogram))))))
      (metrics-stop-workers threads))
    (is (not m::*accesso-istogrammi*))
    (m:azzera-istogramma histogram)
    (check-population (m:istantanea-istogramma histogram))))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(declaim (ftype (function (m:configurazione-istogramma (integer 0 1)
                           sb-thread:semaphore sb-thread:semaphore integer) list) metrics-series-worker))
(defun metrics-series-worker (config series ready release deadline)
  "Pre: immutable config and one-way start gate. Post: worker-local windows and snapshots, no shared counter writes.
No worker waits on another worker; parent reads returned images only after bounded JOIN."
  (let ((histogram (m:crea-istogramma config)) (retained nil))
    (sb-thread:signal-semaphore ready)
    (is (sb-thread:wait-on-semaphore release :timeout (metrics-seconds-left deadline)))
    (dotimes (window 64)
      (m:azzera-istogramma histogram)
      (dotimes (index 64)
        (is (eq (if (zerop series) :recorded :above-range)
                (m:registra-latenza histogram (+ index (if (zerop series) 0 257))))))
      (when (zerop window) (setf retained (m:istantanea-istogramma histogram))))
    (let ((last (m:istantanea-istogramma histogram)))
      (m:azzera-istogramma histogram)
      (m:registra-latenza histogram series)
      (list :ok histogram retained last (m:istantanea-istogramma histogram)))))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(deftest REQ-OBS-001-two-owner-series-isolation
  "Pre: two real owners share immutable configuration. Post: disjoint series and retained snapshots remain isolated.
Bounded joins publish the snapshots; timing or exhaustive interleaving coverage is not claimed."
  (let* ((config (m:crea-configurazione-istogramma :massimo 256 :limite-campioni 64))
         (ready (sb-thread:make-semaphore)) (release (sb-thread:make-semaphore))
         (deadline (metrics-deadline)) (threads nil))
    (unwind-protect
         (progn
           (dotimes (series 2)
             (let ((id series))
               (push (metrics-worker "metrics independent series"
                                     (lambda () (metrics-series-worker config id ready release deadline))) threads)))
           (setf threads (nreverse threads))
           (dotimes (index 2)
             (is (sb-thread:wait-on-semaphore ready :timeout (metrics-seconds-left deadline))))
           (sb-thread:signal-semaphore release 2)
           (let* ((results (mapcar (lambda (thread) (metrics-join thread deadline)) threads))
                  (first-histogram (second (first results))) (second-histogram (second (second results))))
             (is (not (eq first-histogram second-histogram)))
             (is (eq (first threads) (m::istogramma-latenze-owner first-histogram)))
             (is (eq (second threads) (m::istogramma-latenze-owner second-histogram)))
             (is (not (eq (m::istogramma-latenze-contatori first-histogram)
                          (m::istogramma-latenze-contatori second-histogram))))
             (loop for result in results for series from 0
                   do (destructuring-bind (tag histogram retained last next) result
                        (declare (ignore tag histogram))
                        (is (not (eq (m::istantanea-latenze-contatori retained)
                                     (m::istantanea-latenze-contatori last))))
                        (dolist (snapshot (list retained last next))
                          (check-population snapshot)
                          (is (eq config (m:istantanea-latenze-configurazione snapshot))))
                        (dolist (snapshot (list retained last))
                          (is (= 64 (m:istantanea-latenze-campioni snapshot)))
                          (let ((reference (make-array 64)))
                            (dotimes (index 64) (setf (aref reference index) (+ index (if (zerop series) 0 257))))
                            (check-reference-percentile snapshot reference 999 1000 t)))
                        (is (= 1 (m:istantanea-latenze-campioni next)))
                        (is (equal (list series series :ok t)
                                   (multiple-value-list (m:percentile-latenza next 1 1))))))))
      (sb-thread:signal-semaphore release 2)
      (metrics-stop-workers threads))))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(deftest REQ-OBS-001-thread-local-guard-and-inherited-parent-identity
  "Pre: parent holds its production scope while a child operates its own histogram.
Post: guards are thread-local; a deliberately inherited parent identity cannot block the child owner.
Only dynamic LET bindings are used; the global root is never assigned. JOIN is the sole parent wait."
  (let* ((config (m:crea-configurazione-istogramma :dominio :test-synthetic-inherited-owner))
         (histogram (m:crea-istogramma config)) (parent sb-thread:*current-thread*)
         (deadline (metrics-deadline)) (threads nil))
    (is (not m::*accesso-istogrammi*))
    (unwind-protect
         (m::%con-mutazione-istogramma (histogram)
           (let* ((before (histogram-state histogram))
                  (thread
                    (metrics-worker
                     "metrics thread-local guard"
                     (lambda ()
                       (let ((owned (m:crea-istogramma config))
                             (inherited m::*accesso-istogrammi*))
                         ;; The actual child binding may be NIL or a foreign inherited identity.
                         (is (not (eq inherited sb-thread:*current-thread*)))
                         (is (eq :recorded (m:registra-latenza owned 7)))
                         (is (eq inherited m::*accesso-istogrammi*))
                         ;; Deterministic inherited-binding fixture: no dependency on SBCL's inheritance defaults.
                         (let ((m::*accesso-istogrammi* parent))
                           (m::%con-mutazione-istogramma (owned :sola-lettura t)
                             (is (eq m::*accesso-istogrammi* sb-thread:*current-thread*))
                             (signals invalid-argument (m:registra-latenza owned 8) :metrics-histogram-reentry))
                           (is (eq parent m::*accesso-istogrammi*))
                           (is (eq :recorded (m:registra-latenza owned 11)))
                           (is (eq parent m::*accesso-istogrammi*)))
                         (is (eq inherited m::*accesso-istogrammi*))
                         (list :ok (m:istantanea-istogramma owned)))))))
             (push thread threads)
             (let ((snapshot (second (metrics-join thread deadline))))
               (check-population snapshot)
               (is (= 2 (m:istantanea-latenze-campioni snapshot)))
               (is (equal '(11 11 :ok t) (multiple-value-list (m:percentile-latenza snapshot 1 1)))))
             (is (eq parent m::*accesso-istogrammi*))
             (is (equalp before (histogram-state histogram)))))
      (metrics-stop-workers threads))
    (is (not m::*accesso-istogrammi*))
    (is (not (m::istogramma-latenze-guasto-p histogram)))
    (check-population (m:istantanea-istogramma histogram))))
