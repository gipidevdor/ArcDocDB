;;;; Dedicated owner, capture-storage and abnormal-root-mutation contracts for metric partitions.
;;; OWNER: serial fixture or constructing worker; joins publish only immutable captures.
;;; SHARED: immutable configuration, bounded harness semaphores and joined results; never mutable payload writes.
(in-package #:arcdocdb.metrics.tests)

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(declaim (ftype (function (m:metriche-serie) list) counter-live-payloads))
(defun counter-live-payloads (metrics)
  "Pre: private quiescent fixture. Post: its four payload identities for storage-alias assertions only."
  (list (m::metriche-serie-contatori metrics) (m::metriche-serie-code metrics)
        (m::istogramma-latenze-contatori (m::metriche-serie-latenza-richieste metrics))
        (m::istogramma-latenze-contatori (m::metriche-serie-latenza-flush metrics))))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(declaim (ftype (function (m:istantanea-metriche) list) counter-capture-payloads))
(defun counter-capture-payloads (snapshot)
  "Pre: immutable published capture. Post: its four private payload identities; no writes through these references."
  (list (m::istantanea-metriche-contatori snapshot) (m::istantanea-metriche-code snapshot)
        (m::istantanea-latenze-contatori (m:istantanea-metriche-latenza-richieste snapshot))
        (m::istantanea-latenze-contatori (m:istantanea-metriche-latenza-flush snapshot))))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(declaim (ftype (function (t (integer 0) (integer 0)) list) counter-owner-actions))
(defun counter-owner-actions (metrics fine new-start)
  "Pre: cold fixture arguments. Post: named closures covering every owner API and each independently guarded queue kind."
  (list (cons :request (lambda () (m:registra-richiesta metrics 0 :errore)))
        (cons :cache (lambda () (m:registra-cache metrics :hit)))
        (cons :append (lambda () (m:registra-append-wal metrics 0)))
        (cons :flush (lambda () (m:registra-flush-wal metrics 0 0)))
        (cons :request-queue (lambda () (m:registra-coda metrics :richieste 0)))
        (cons :wal-queue (lambda () (m:registra-coda metrics :wal 0)))
        (cons :capture (lambda () (m:istantanea-metriche metrics fine)))
        (cons :reset (lambda () (m:azzera-metriche-serie metrics new-start)))))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(deftest REQ-OBS-001-counter-captures-own-storage-and-survive-update-reset
  "Pre: two owner-local partitions with shared configuration, repeated captures and a singleton aggregate.
Post: every payload is independent; updates/reset retain live storage and leave all prior images unchanged."
  (let* ((config (m:crea-configurazione-istogramma :limite-campioni 2 :massimo 32))
         (metrics (m:crea-metriche-serie 1 0 0 config)) (other (m:crea-metriche-serie 2 0 0 config))
         (storage (counter-live-payloads metrics)))
    (m:registra-richiesta metrics 7 :errore) (m:registra-append-wal metrics 2)
    (m:registra-flush-wal metrics 9 1)
    (m:registra-coda metrics :richieste 11) (m:registra-coda metrics :richieste 3)
    (m:registra-coda metrics :wal 7) (m:registra-coda metrics :wal 2)
    (m:registra-richiesta other 31) (m:registra-cache other :miss)
    (let* ((first (m:istantanea-metriche metrics 1)) (second (m:istantanea-metriche metrics 1))
           (other-before (m:istantanea-metriche other 1)) (sum (m:aggrega-metriche (vector first)))
           (snapshots (list first second other-before sum)) (saved (mapcar #'counter-snapshot-image snapshots))
           (payloads (append storage (counter-live-payloads other)
                             (mapcan #'counter-capture-payloads snapshots))))
      (is (not (eq first second)))
      (is (= (length payloads) (length (remove-duplicates payloads :test #'eq))))
      (dolist (snapshot snapshots)
        (dolist (payload (counter-capture-payloads snapshot))
          (is (typep payload '(simple-array (unsigned-byte 64) (*))))))
      (m:registra-richiesta metrics 99 :ok) (m:registra-richiesta metrics 999 :errore)
      (m:registra-append-wal metrics 1) (m:registra-flush-wal metrics 999 2)
      (m:registra-coda metrics :richieste 1)
      (m:azzera-metriche-serie metrics 1) (m:azzera-metriche-serie other 1)
      (is (every #'eq storage (counter-live-payloads metrics)))
      (m:registra-richiesta metrics 0) (m:registra-cache other :hit)
      (check-metric-counts (m:istantanea-metriche metrics 2) '((:richieste . 1)))
      (check-metric-counts (m:istantanea-metriche other 2) '((:cache-hit . 1)))
      (is (equalp saved (mapcar #'counter-snapshot-image snapshots))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(deftest REQ-OBS-001-counter-foreign-owner-rejects-ordinary-saturated-and-faulted-state
  "Pre: owner is quiescent while foreign workers attempt all APIs against normal, closed and synthetically faulted state.
Post: typed owner rejection precedes all writes; bounded JOIN publishes worker assertions, no asynchronous interrupts."
  (let* ((metrics (m:crea-metriche-serie 0 0 0
                    (m:crea-configurazione-istogramma :limite-campioni 1 :dominio :test-synthetic-owner-rejection)))
         (root (m::metriche-serie-latenza-richieste metrics))
         (deadline (metrics-deadline)) (threads nil))
    (unwind-protect
         (dotimes (phase 3)
           (case phase
             (1 (dotimes (attempt 2)
                  (m:registra-richiesta metrics 7 :errore) (m:registra-cache metrics :hit)
                  (m:registra-append-wal metrics 1) (m:registra-flush-wal metrics 9 1)))
             (2 (is (eq :synthetic-abort
                        (catch 'counter-owner-abort
                          (m::%con-mutazione-istogramma (root)
                            (throw 'counter-owner-abort :synthetic-abort)))))))
           (dolist (entry (counter-owner-actions metrics 1 1))
             (let* ((before (counter-partition-state metrics)) (action (cdr entry)) (busy-p (= phase 2))
                    (thread (metrics-worker
                             "metric counters foreign owner"
                             (lambda ()
                               (let ((m::*accesso-istogrammi* (when busy-p sb-thread:*current-thread*)))
                                 (signals invalid-argument (funcall action) :metrics-series-owner)
                                 (is (eq m::*accesso-istogrammi* (when busy-p sb-thread:*current-thread*))))
                               (list :ok)))))
               (push thread threads) (metrics-join thread deadline)
               (is (equalp before (counter-partition-state metrics))))))
      (metrics-stop-workers threads))
    (is (not m::*accesso-istogrammi*))
    (m:azzera-metriche-serie metrics 1)
    (check-metric-counts (m:istantanea-metriche metrics 1) nil)))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(deftest REQ-OBS-001-counter-prima-observes-entry-before-mutation-marker
  "Pre: healthy or synthetically faulted but consistent partition enters the actual production reset scope.
Post: ordered PRIMA forms see original fault under TLS; the body sees T, values survive and the guard unwinds."
  (dolist (initial-fault '(nil t))
    (let* ((metrics (m:crea-metriche-serie 0 0 0
                      (m:crea-configurazione-istogramma :dominio :test-synthetic-prima-entry)))
           (root (m::metriche-serie-latenza-richieste metrics))
           (storage (counter-live-payloads metrics)) (evaluations 0) (observed :unset) (trace nil))
      (m:registra-richiesta metrics 7 :errore) (m:registra-flush-wal metrics 9 2)
      (m:registra-coda metrics :richieste 7) (m:registra-coda metrics :wal 11)
      (let ((healthy (counter-partition-state metrics)))
        ;; Synthetic abort changes only the real scope marker; every payload remains valid.
        (when initial-fault
          (is (eq :faulted
                  (catch 'counter-prima-entry-fault
                    (m::%con-mutazione-istogramma (root)
                      (throw 'counter-prima-entry-fault :faulted))))))
        (let ((before (counter-partition-state metrics)))
          (is (equal '(:body nil :third)
                     (multiple-value-list
                      (m::%con-mutazione-istogramma
                          ((progn (incf evaluations) root) :reset t
                           :prima ((is (eq m::*accesso-istogrammi* sb-thread:*current-thread*))
                                   (setf observed (m::istogramma-latenze-guasto-p root))
                                   (is (eq observed initial-fault))
                                   (is (equalp before (counter-partition-state metrics)))
                                   (push :first trace)
                                   (push :second trace)))
                        (is (m::istogramma-latenze-guasto-p root))
                        (is (eq m::*accesso-istogrammi* sb-thread:*current-thread*))
                        (is (eq observed initial-fault))
                        (push :body trace)
                        (values :body nil :third)))))
          (is (= 1 evaluations))
          (is (equal '(:first :second :body) (reverse trace)))
          (is (not m::*accesso-istogrammi*))
          (is (equalp healthy (counter-partition-state metrics)))
          (is (every #'eq storage (counter-live-payloads metrics)))
          (check-metric-counts (m:istantanea-metriche metrics 1)
                               '((:richieste . 1) (:errori . 1) (:wal-flush . 1) (:wal-record . 2))))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(deftest REQ-OBS-001-counter-prima-abort-preserves-prior-fault-and-all-arrays
  "Pre: healthy/faulted synthetic fixtures, with typed and nonlocal failures in production PRIMA forms.
Post: failed setup never runs the body or changes payload/fault; TLS unwinds, and non-reset fault entry skips PRIMA."
  (dolist (initial-fault '(nil t))
    (let* ((metrics (m:crea-metriche-serie 0 0 0
                      (m:crea-configurazione-istogramma :dominio :test-synthetic-prima-abort)))
           (root (m::metriche-serie-latenza-richieste metrics))
           (storage (counter-live-payloads metrics)) (prep-ran nil) (body-ran nil))
      (m:registra-richiesta metrics 7) (m:registra-cache metrics :hit)
      (m:registra-append-wal metrics 3) (m:registra-flush-wal metrics 9 2)
      (m:registra-coda metrics :richieste 7) (m:registra-coda metrics :wal 11)
      (when initial-fault
        (is (eq :faulted
                (catch 'counter-prima-abort-fault
                  (m::%con-mutazione-istogramma (root)
                    (throw 'counter-prima-abort-fault :faulted))))))
      (let ((before (counter-partition-state metrics)))
        (signals invalid-argument
                 (m::%con-mutazione-istogramma
                     (root :reset t
                      :prima ((setf prep-ran t)
                              (is (eq m::*accesso-istogrammi* sb-thread:*current-thread*))
                              (is (eq initial-fault (m::istogramma-latenze-guasto-p root)))
                              (error 'invalid-argument :reason :metrics-test-prima-precondition)))
                   (setf body-ran t))
                 :metrics-test-prima-precondition)
        (is prep-ran) (is (not body-ran))
        (is (equalp before (counter-partition-state metrics)))
        (is (not m::*accesso-istogrammi*))
        (setf prep-ran nil)
        (is (eq :prep-aborted
                (catch 'counter-prima-nonlocal-abort
                  (m::%con-mutazione-istogramma
                      (root :reset t
                       :prima ((setf prep-ran t)
                               (is (eq m::*accesso-istogrammi* sb-thread:*current-thread*))
                               (is (eq initial-fault (m::istogramma-latenze-guasto-p root)))
                               (throw 'counter-prima-nonlocal-abort :prep-aborted)))
                    (setf body-ran t)))))
        (is prep-ran) (is (not body-ran))
        (is (equalp before (counter-partition-state metrics)))
        (is (every #'eq storage (counter-live-payloads metrics)))
        (is (not m::*accesso-istogrammi*))
        (when initial-fault
          (setf prep-ran nil)
          (signals invariant-violation
                   (m::%con-mutazione-istogramma (root :prima ((setf prep-ran t)))
                     (setf body-ran t))
                   :metrics-histogram-interrupted)
          (is (not prep-ran)) (is (not body-ran))
          (is (equalp before (counter-partition-state metrics)))
          (is (not m::*accesso-istogrammi*)))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(deftest REQ-OBS-001-counter-prima-reentry-rejects-before-nested-preconditions
  "Pre: healthy root enters actual production PRIMA before marking; same-owner operations attempt nested entry.
Post: same/cross-partition reentry and regressing capture/reset cuts reject under TLS, without nested setup or writes."
  (let* ((metrics (m:crea-metriche-serie 0 0 10)) (other (m:crea-metriche-serie 1 0 10))
         (root (m::metriche-serie-latenza-richieste metrics))
         (nested-prep-ran nil) (nested-body-ran nil) (prep-ran nil))
    (m:registra-richiesta metrics 7) (m:registra-coda other :wal 11)
    (let ((before (counter-partition-state metrics)) (other-before (counter-partition-state other)))
      (m::%con-mutazione-istogramma
          (root :prima ((setf prep-ran t)
                        (is (not (m::istogramma-latenze-guasto-p root)))
                        (is (eq m::*accesso-istogrammi* sb-thread:*current-thread*))
                        (signals invalid-argument
                                 (m::%con-mutazione-istogramma
                                     (root :reset t :prima ((setf nested-prep-ran t)))
                                   (setf nested-body-ran t))
                                 :metrics-histogram-reentry)
                        (dolist (partition (list metrics other))
                          (dolist (entry (counter-owner-actions partition 10 11))
                            (signals invalid-argument (funcall (cdr entry)) :metrics-histogram-reentry)
                            (is (equalp before (counter-partition-state metrics)))
                            (is (equalp other-before (counter-partition-state other))))
                          ;; Valid tick types, invalid mutable bounds: reentry must win over these preconditions.
                          (signals invalid-argument (m:istantanea-metriche partition 9) :metrics-histogram-reentry)
                          (signals invalid-argument (m:azzera-metriche-serie partition 10) :metrics-histogram-reentry))
                        (is (not nested-prep-ran)) (is (not nested-body-ran))
                        (is (not (m::istogramma-latenze-guasto-p root)))
                        (is (eq m::*accesso-istogrammi* sb-thread:*current-thread*))))
        (is prep-ran)
        (is (m::istogramma-latenze-guasto-p root)))
      (is (not m::*accesso-istogrammi*))
      (is (equalp before (counter-partition-state metrics)))
      (is (equalp other-before (counter-partition-state other)))
      (signals invalid-argument (m:istantanea-metriche metrics 9) :metrics-window-end)
      (signals invalid-argument (m:azzera-metriche-serie metrics 10) :metrics-window-start)
      (is (equalp before (counter-partition-state metrics))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(deftest REQ-OBS-001-counter-prima-keyword-validation-and-single-expansion
  "Pre: cold macroexpansion of actual PRIMA syntax; no generated form is evaluated.
Post: non-list setup values signal typed invalid argument; static setup, body and histogram forms occur once in all modes."
  (dolist (bad '(t 0 -1 1/2 0.0 :before prelude-forms "setup" #() #\a))
    (signals invalid-argument
             (macroexpand-1 `(m::%con-mutazione-istogramma (histogram :prima ,bad) (values :body)))
             :metrics-histogram-scope))
  (dolist (reset '(nil t))
    (dolist (read-only '(nil t))
      (dolist (prelude '(nil ((values :prep-first) (values :prep-second))))
        (let ((histogram-form '(progn (incf evaluations) histogram)) (body-form '(values :body nil :last)))
          (multiple-value-bind (expansion expanded-p)
              (macroexpand-1 `(m::%con-mutazione-istogramma
                                 (,histogram-form :reset ,reset :sola-lettura ,read-only :prima ,prelude)
                               ,body-form))
            (is expanded-p)
            (is (= 1 (syntax-occurrences histogram-form expansion)))
            (is (= 1 (syntax-occurrences body-form expansion)))
            (is (= 1 (syntax-occurrences '(m::*accesso-istogrammi* sb-thread:*current-thread*) expansion)))
            (dolist (form prelude) (is (= 1 (syntax-occurrences form expansion))))))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(deftest REQ-OBS-001-counter-owner-argument-types-and-partition-wide-reentry
  "Pre: malformed live objects, then a held request-root scope and another same-owner partition/histogram.
Post: every public operation rejects reentry across the whole owner without disturbing its active scope or either partition."
  (let* ((metrics (m:crea-metriche-serie 0 0 0)) (other (m:crea-metriche-serie 1 0 0))
         (root (m::metriche-serie-latenza-richieste metrics)) (histogram (m:crea-istogramma)))
    (dolist (bad (list nil 0 :metrics #() histogram (m:istantanea-metriche metrics 1)))
      (dolist (entry (counter-owner-actions bad 1 1)) (signals invalid-argument (funcall (cdr entry)))))
    (m:registra-richiesta metrics 7) (m:registra-richiesta other 9)
    (m::%con-mutazione-istogramma (root)
      (let ((before (counter-partition-state metrics)) (other-before (counter-partition-state other))
            (histogram-before (histogram-state histogram)))
        (is (eq m::*accesso-istogrammi* sb-thread:*current-thread*))
        (dolist (partition (list metrics other))
          (dolist (entry (counter-owner-actions partition 1 1))
            (signals invalid-argument (funcall (cdr entry)) :metrics-histogram-reentry)
            (is (equalp before (counter-partition-state metrics)))
            (is (equalp other-before (counter-partition-state other)))))
        (dolist (child (list root (m::metriche-serie-latenza-flush metrics) histogram))
          (signals invalid-argument (m:registra-latenza child 0) :metrics-histogram-reentry)
          (signals invalid-argument (m:istantanea-istogramma child) :metrics-histogram-reentry)
          (signals invalid-argument (m:azzera-istogramma child) :metrics-histogram-reentry))
        (is (equalp histogram-before (histogram-state histogram)))
        (is (eq m::*accesso-istogrammi* sb-thread:*current-thread*))))
    (is (not m::*accesso-istogrammi*))
    (check-metric-counts (m:istantanea-metriche metrics 1) '((:richieste . 1)))
    (check-metric-counts (m:istantanea-metriche other 1) '((:richieste . 1)))))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(declaim (ftype (function (m:metriche-serie (member :error :throw)) t) counter-synthetic-partial-queue-write))
(defun counter-synthetic-partial-queue-write (metrics exit-kind)
  "Pre: private cold fixture with domain :TEST-SYNTHETIC-ROOT-MUTATION and an observed request queue at seven.
Post: deliberately aborts the production root scope after writing current=4 with valid old peak=7.
Only this explicitly synthetic fixture writes raw queue storage; bounded values and current<=peak remain valid."
  (let* ((root (m::metriche-serie-latenza-richieste metrics)) (queues (m::metriche-serie-code metrics)))
    (is (eq :test-synthetic-root-mutation
            (m:configurazione-istogramma-dominio (m::istogramma-latenze-configurazione root))))
    (is (equal '(7 7 :exact) (multiple-value-list (m:stato-coda (m:istantanea-metriche metrics 1) :richieste))))
    (m::%con-mutazione-istogramma (root)
      (is (m::istogramma-latenze-guasto-p root))
      ;; Planned CODE layout: current/peak requests, current/peak WAL. Known-mask is already set.
      (setf (aref queues 0) 4)
      (ecase exit-kind
        (:error (error 'invalid-argument :reason :metrics-test-partial-queue-write))
        (:throw (throw 'counter-queue-abort :synthetic-abort))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(deftest REQ-OBS-001-counter-abnormal-root-mutation-blocks-all-apis-and-recovery-forgets-queues
  "Pre: typed and nonlocal synthetic aborts after a partial queue write in the real request-root guard.
Post: all updates/capture fault until a strictly later owner reset; recovery forgets both uncertain queues and old images survive."
  (dolist (exit-kind '(:error :throw))
    (let* ((metrics (m:crea-metriche-serie 0 0 0
                      (m:crea-configurazione-istogramma :dominio :test-synthetic-root-mutation)))
           (root (m::metriche-serie-latenza-richieste metrics)) (storage (counter-live-payloads metrics)))
      (m:registra-richiesta metrics 7 :errore) (m:registra-cache metrics :hit)
      (m:registra-append-wal metrics 3) (m:registra-flush-wal metrics 9 2)
      (m:registra-coda metrics :richieste 7) (m:registra-coda metrics :wal 11)
      (let* ((retained (m:istantanea-metriche metrics 1)) (saved (counter-snapshot-image retained)))
        (ecase exit-kind
          (:error (signals invalid-argument (counter-synthetic-partial-queue-write metrics :error)
                           :metrics-test-partial-queue-write))
          (:throw (is (eq :synthetic-abort
                          (catch 'counter-queue-abort (counter-synthetic-partial-queue-write metrics :throw))))))
        (is (m::istogramma-latenze-guasto-p root)) (is (not m::*accesso-istogrammi*))
        (is (= 4 (aref (m::metriche-serie-code metrics) 0)))
        (let ((before (counter-partition-state metrics)))
          (dotimes (attempt 2)
            (dolist (entry (counter-owner-actions metrics 1 1))
              (unless (eq :reset (car entry))
                (signals invariant-violation (funcall (cdr entry)) :metrics-histogram-interrupted)
                (is (equalp before (counter-partition-state metrics))))))
          (signals invalid-argument (m:azzera-metriche-serie metrics 0))
          (is (equalp before (counter-partition-state metrics))))
        (m:azzera-metriche-serie metrics 1)
        (is (every #'eq storage (counter-live-payloads metrics)))
        (is (every #'zerop (m::metriche-serie-code metrics)))
        (is (zerop (m::metriche-serie-code-note metrics)))
        (is (not (m::istogramma-latenze-guasto-p root)))
        (let ((recovered (m:istantanea-metriche metrics 1)))
          (check-metric-counts recovered nil)
          (dolist (kind '(:richieste :wal))
            (is (equal '(nil nil :unobserved) (multiple-value-list (m:stato-coda recovered kind))))))
        (is (eq :recorded (m:registra-richiesta metrics 1)))
        (is (eq :recorded (m:registra-flush-wal metrics 2 1)))
        (m:registra-coda metrics :richieste 0)
        (check-metric-counts (m:istantanea-metriche metrics 2) '((:richieste . 1) (:wal-flush . 1) (:wal-record . 1)))
        (is (equalp saved (counter-snapshot-image retained)))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(declaim (ftype (function (m:configurazione-istogramma (integer 0 1)
                           sb-thread:semaphore sb-thread:semaphore integer) list) counter-isolated-series-worker))
(defun counter-isolated-series-worker (config identity ready release deadline)
  "Pre: immutable config, two one-way harness gates and a bounded shared deadline.
Post: owner-local windows for a distinct Serie, with first/last/next immutable captures published by JOIN only."
  (let ((metrics (m:crea-metriche-serie identity 5 0 config)) (retained nil))
    (sb-thread:signal-semaphore ready)
    (is (sb-thread:wait-on-semaphore release :timeout (metrics-seconds-left deadline)))
    (dotimes (window 16)
      (when (plusp window) (m:azzera-metriche-serie metrics window))
      (dotimes (index 4)
        (is (eq (if (zerop identity) :recorded :above-range)
                (m:registra-richiesta metrics (+ index (if (zerop identity) 0 33))
                                      (if (evenp index) :errore :ok)))))
      (m:registra-cache metrics (if (zerop identity) :hit :miss))
      (m:registra-append-wal metrics (1+ identity)) (m:registra-flush-wal metrics (+ 7 identity) (+ 2 identity))
      (m:registra-coda metrics :richieste (+ 8 identity)) (m:registra-coda metrics :richieste (+ 2 identity))
      (m:registra-coda metrics :wal identity)
      (when (zerop window) (setf retained (m:istantanea-metriche metrics 1))))
    (let ((last (m:istantanea-metriche metrics 16)))
      (m:azzera-metriche-serie metrics 16) (m:registra-richiesta metrics identity)
      (list :ok metrics retained last (m:istantanea-metriche metrics 17)))))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(deftest REQ-OBS-001-counter-two-real-owner-series-and-published-captures-stay-isolated
  "Pre: two constructing owners share only configuration and gates, with equal worker IDs and different Serie IDs.
Post: counters/queues/distributions and retained windows stay isolated; bounded JOIN is the publication edge."
  (let* ((config (m:crea-configurazione-istogramma :bit-precisione 4 :massimo 32 :limite-campioni 8))
         (ready (sb-thread:make-semaphore)) (release (sb-thread:make-semaphore))
         (deadline (metrics-deadline)) (threads nil))
    (unwind-protect
         (progn
           (dotimes (identity 2)
             (let ((id identity))
               (push (metrics-worker "metric counters independent Serie"
                                     (lambda () (counter-isolated-series-worker config id ready release deadline))) threads)))
           (setf threads (nreverse threads))
           (dotimes (index 2) (is (sb-thread:wait-on-semaphore ready :timeout (metrics-seconds-left deadline))))
           (sb-thread:signal-semaphore release 2)
           (let* ((results (mapcar (lambda (thread) (metrics-join thread deadline)) threads))
                  (payloads (mapcan (lambda (result) (counter-live-payloads (second result))) results)))
             (is (= 8 (length (remove-duplicates payloads :test #'eq))))
             (loop for result in results for identity from 0 for owner in threads
                   do (destructuring-bind (tag metrics retained last next) result
                        (declare (ignore tag))
                        (is (eq owner (m::istogramma-latenze-owner (m::metriche-serie-latenza-richieste metrics))))
                        (is (eq owner (m::istogramma-latenze-owner (m::metriche-serie-latenza-flush metrics))))
                        (let ((captures (append (counter-capture-payloads retained) (counter-capture-payloads last)
                                                (counter-capture-payloads next))))
                          (is (= 12 (length (remove-duplicates captures :test #'eq))))
                          (dolist (payload captures) (is (not (member payload payloads :test #'eq)))))
                        (dolist (snapshot (list retained last next))
                          (is (= identity (m:istantanea-metriche-serie snapshot)))
                          (is (= 5 (m:istantanea-metriche-worker snapshot)))
                          (is (= 1 (m:numero-fonti-metriche snapshot))))
                        (dolist (snapshot (list retained last))
                          (check-metric-counts snapshot
                            (list '(:richieste . 4) '(:errori . 2)
                                  (cons (if (zerop identity) :cache-hit :cache-miss) 1)
                                  '(:wal-append . 1) (cons :wal-byte (1+ identity))
                                  '(:wal-flush . 1) (cons :wal-record (+ 2 identity))))
                          (check-reference-percentile (m:istantanea-metriche-latenza-richieste snapshot)
                                                      (if (zerop identity) #(0 1 2 3) #(33 34 35 36)) 999 1000 t)
                          (is (equal (list (+ 2 identity) (+ 8 identity) :exact)
                                     (multiple-value-list (m:stato-coda snapshot :richieste)))))
                        (check-metric-counts next '((:richieste . 1)))
                        (is (equal (list (+ 2 identity) (+ 2 identity) :exact)
                                   (multiple-value-list (m:stato-coda next :richieste))))
                        (is (equal (list identity identity :exact) (multiple-value-list (m:stato-coda next :wal))))))))
      (sb-thread:signal-semaphore release 2)
      (metrics-stop-workers threads))))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(deftest REQ-OBS-001-counter-root-guard-is-thread-local-with-inherited-parent-identity
  "Pre: parent holds its request-root scope while a child constructs its own Serie partition.
Post: child owner can update/capture/reset, including under an explicitly inherited parent binding; parent state is untouched."
  (let* ((config (m:crea-configurazione-istogramma)) (metrics (m:crea-metriche-serie 0 0 0 config))
         (root (m::metriche-serie-latenza-richieste metrics)) (parent sb-thread:*current-thread*)
         (deadline (metrics-deadline)) (threads nil))
    (unwind-protect
         (m::%con-mutazione-istogramma (root)
           (let* ((before (counter-partition-state metrics))
                  (thread (metrics-worker
                           "metric counters thread-local root"
                           (lambda ()
                             (let ((owned (m:crea-metriche-serie 1 0 0 config)) (inherited m::*accesso-istogrammi*))
                               (is (not (eq inherited sb-thread:*current-thread*)))
                               (is (eq :recorded (m:registra-richiesta owned 7)))
                               (let ((m::*accesso-istogrammi* parent))
                                 (is (eq :recorded (m:registra-flush-wal owned 9 1)))
                                 (check-metric-counts (m:istantanea-metriche owned 1)
                                                     '((:richieste . 1) (:wal-flush . 1) (:wal-record . 1)))
                                 (m:azzera-metriche-serie owned 1)
                                 (is (eq :recorded (m:registra-richiesta owned 11)))
                                 (is (eq parent m::*accesso-istogrammi*)))
                               (is (eq inherited m::*accesso-istogrammi*))
                               (list :ok (m:istantanea-metriche owned 2)))))))
             (push thread threads)
             (let ((snapshot (second (metrics-join thread deadline))))
               (check-metric-counts snapshot '((:richieste . 1)))
               (is (equal '(11 11 :ok t)
                          (multiple-value-list (m:percentile-latenza (m:istantanea-metriche-latenza-richieste snapshot) 1 1)))))
             (is (equalp before (counter-partition-state metrics)))
             (is (eq parent m::*accesso-istogrammi*))))
      (metrics-stop-workers threads))
    (is (not m::*accesso-istogrammi*))
    (check-metric-counts (m:istantanea-metriche metrics 1) nil)))
