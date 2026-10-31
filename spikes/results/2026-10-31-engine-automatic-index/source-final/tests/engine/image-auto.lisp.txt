;;; OWNER: C4 serial runner; real engine operations and independent workload expectations.
;;; REQ: REQ-IDX-012 REQ-IDX-010 REQ-LIM-003 REQ-WAL-006
(in-package #:arcdocdb.engine.tests)

(defun install-auto (engine id &rest arguments)
  (let ((config (apply #'e:crea-opzione-rinnovo-automatico (build-option id) arguments)))
    (e:configura-rinnovo-automatico-motore engine config) config))

(defun check-auto-preflight-rejection (root engine thunk type reason)
  (let ((before (images root)) (csn (multiple-value-list (e:frontiere-motore engine)))
        (delta (e::motore-delta engine)) (file (check-active-file engine))
        (ordinal (e::motore-auto-renewals-used engine)) (caught nil))
    (handler-case (funcall thunk)
      (arcdocdb.conditions:arcdocdb-error (condition)
        (is (typep condition type)) (is (eq reason (arcdocdb.conditions:error-reason condition)))
        (setf caught t)))
    (is caught) (is (eq :ready (e:stato-motore engine)))
    (is (equal csn (multiple-value-list (e:frontiere-motore engine))))
    (is (eq delta (e::motore-delta engine))) (is (eq file (check-active-file engine)))
    (is (= ordinal (e::motore-auto-renewals-used engine)))
    (is (= (length before) (length (images root)))) (check-images root before)))

(deftest test-REQ-IDX-012-auto-configuration-domains-and-ownership
  (let* ((first (build-option 2)) (max-id (1- (ash 1 60)))
         (config (e:crea-opzione-rinnovo-automatico first)))
    (is (eq first (e::opzione-rinnovo-automatico-first config)))
    (is (= 64 (e::opzione-rinnovo-automatico-renewals config)))
    (dolist (args '((:policy nil) (:max-renewals 0) (:max-renewals 65537) (:max-renewals 1.5)
                    (:max-maintenance-payload -1) (:max-maintenance-payload 536870913)
                    (:max-maintenance-payload nil) (:max-pages 0) (:max-pages 65537) (:max-pages nil)))
      (signals arcdocdb.conditions:invalid-argument (apply #'e:crea-opzione-rinnovo-automatico first args)))
    (signals arcdocdb.conditions:invalid-argument (e:crea-opzione-rinnovo-automatico nil))
    (dolist (id (list 0 (1+ max-id)))
      (signals arcdocdb.conditions:invalid-argument (e:crea-opzione-rinnovo-automatico (build-option id))))
    (is (e:crea-opzione-rinnovo-automatico (build-option max-id) :max-renewals 1
                                         :max-maintenance-payload 0 :max-pages 1))
    (is (e:crea-opzione-rinnovo-automatico (build-option (- max-id 65535)) :max-renewals 65536
                                         :max-maintenance-payload 536870912 :max-pages 65536))
    (signals arcdocdb.conditions:invalid-argument
             (e:crea-opzione-rinnovo-automatico (build-option max-id) :max-renewals 2)
             :engine-auto-renewal-id-range)
    (with-root (root)
      (with-engine (engine (open-build-engine root :create t))
        (e:configura-rinnovo-automatico-motore engine nil)
        (signals arcdocdb.conditions:invalid-argument (e:configura-rinnovo-automatico-motore engine config))
        (renew-image engine (build-option 1))
        (e:configura-rinnovo-automatico-motore engine config)
        (setf (e::motore-auto-renewals-used engine) 1)
        (signals arcdocdb.conditions:invalid-argument (e:configura-rinnovo-automatico-motore engine :bad))
        (is (eq config (e::motore-auto-renewal engine))) (is (= 1 (e::motore-auto-renewals-used engine)))
        (let ((view (e::motore-paged engine)))
          (unwind-protect
               (progn (setf (e::motore-paged engine) nil)
                      (signals arcdocdb.conditions:invalid-argument
                               (e:configura-rinnovo-automatico-motore engine config)
                               :engine-auto-renewal-without-delta))
            (setf (e::motore-paged engine) view)))
        (is (eq :rejected
                (sb-thread:join-thread
                 (sb-thread:make-thread
                  (lambda () (handler-case (e:configura-rinnovo-automatico-motore engine nil)
                               (arcdocdb.conditions:invalid-argument () :rejected)))))))
        (is (eq config (e::motore-auto-renewal engine)))))))

(deftest test-REQ-IDX-012-auto-repeated-writes-independent-oracle-v1-v2-three-page-sizes
  (dolist (version '(1 2))
    (dolist (size '(4096 16384 65536))
      (with-root (root)
        (with-engine (engine (open-build-engine root :create t :version version))
          (let ((expected (make-array 8 :initial-element nil)) (csn 0)
                (first (build-option 1 :page-size size)))
            (renew-image engine first :keys 4 :bytes 64)
            (e:configura-rinnovo-automatico-motore engine
              (e:crea-opzione-rinnovo-automatico (build-option 2 :page-size size)))
            (let ((original (image (build-path root first))))
              (dotimes (step 24)
                (let ((id (mod step 8)))
                  (if (zerop (mod step 3))
                      (progn (is (= (incf csn) (e:cancella-documento engine (key id))))
                             (setf (aref expected id) nil))
                      (let ((value (value (mod step 12))))
                        (is (= (incf csn) (e:scrivi-documento engine (key id) value)))
                        (setf (aref expected id) value))))
                (dotimes (id 8) (check-get engine id (aref expected id)))
                (check-frontier engine csn))
              (is (equalp original (image (build-path root first)))))
            (is (= 7 (e::motore-auto-renewals-used engine)))
            (is (= 3 (e::delta-indice-motore-count (e::motore-delta engine))))
            (is (= size (e::opzione-indice-paginato-size (e::motore-paged-option engine))))))))))

(deftest test-REQ-IDX-012-auto-independent-threshold-and-capacity-triggers
  ;; Threshold-only: an already present key still fits, but two of four keys reach 50%.
  (with-root (root)
    (with-engine (engine (open-build-engine root :create t))
      (renew-image engine (build-option 1) :keys 4 :bytes 128)
      (install-auto engine 2 :policy (e:crea-politica-rinnovo-indice :soglia-percentuale 50))
      (e:scrivi-documento engine (key 1) (value 1)) (e:cancella-documento engine (key 2))
      (is (not (e::delta-saturo-per-chiave-p engine (key 1))))
      (let ((old (check-active-file engine)))
        (is (= 3 (e:scrivi-documento engine (key 1) (value 3))))
        (is (eq :closed (arcdocdb.io:stato-file old))))
      (check-get engine 1 (value 3)) (check-get engine 2 nil)
      (is (= 1 (e::motore-auto-renewals-used engine)))))
  ;; Capacity-only: 16 used bytes are below 100%, but another 49 would exceed 64.
  (with-root (root)
    (with-engine (engine (open-build-engine root :create t))
      (let ((long (bytes 49 31)))
        (renew-image engine (build-option 1) :keys 8 :bytes 64)
        (install-auto engine 2 :policy (e:crea-politica-rinnovo-indice :soglia-percentuale 100))
        (is (= 1 (e:scrivi-documento engine (key 1) (value 1))))
        (is (not (e:rinnovo-indice-richiesto-p engine (e:crea-politica-rinnovo-indice :soglia-percentuale 100))))
        (is (e::delta-saturo-per-chiave-p engine long))
        (is (= 2 (e:scrivi-documento engine long (value 2))))
        (check-build-get engine long (value 2)) (check-get engine 1 (value 1))
        (is (= 49 (e::delta-indice-motore-used (e::motore-delta engine))))
        (is (= 1 (e::motore-auto-renewals-used engine)))))))

(deftest test-REQ-IDX-012-auto-invalid-writes-precede-derived-effects
  (with-root (root)
    (with-engine (engine (open-build-engine root :create t))
      (renew-image engine (build-option 1) :keys 1 :bytes 64)
      (e:scrivi-documento engine (key 1) (value 1)) (install-auto engine 2)
      (check-auto-preflight-rejection root engine
        (lambda () (e:scrivi-documento engine (bytes 65) (value 1)))
        'arcdocdb.conditions:resource-exhausted :engine-delta-capacity)
      (check-auto-preflight-rejection root engine
        (lambda () (e:scrivi-documento engine (key 2) (bytes 0)))
        'arcdocdb.conditions:invalid-argument :engine-value-length)
      (check-auto-preflight-rejection root engine
        (lambda () (e:cancella-documento engine (bytes 0)))
        'arcdocdb.conditions:invalid-argument :engine-key-length)))
  (with-root (root)
    (with-engine (engine (open-build-engine root :create t :capacity 16))
      (dotimes (id 14) (e:scrivi-documento engine (key id) (value 1)))
      (renew-image engine (build-option 1))
      (e:scrivi-documento engine (key 1) (value 2)) (install-auto engine 2)
      (check-auto-preflight-rejection root engine
        (lambda () (e:scrivi-documento engine (key 20) (value 1)))
        'arcdocdb.conditions:resource-exhausted :primary-fragment-load))))

(deftest test-REQ-IDX-012-auto-reservation-collision-sequence-and-id-endpoint
  (with-root (root)
    (with-engine (engine (open-build-engine root :create t))
      (let ((next (build-option 2)))
        (renew-image engine (build-option 1)) (e:cancella-documento engine (key 1))
        (install-auto engine 2 :max-maintenance-payload (1- (e::payload-rinnovo-immagine engine next 1 16)))
        (check-auto-preflight-rejection root engine
          (lambda () (e:scrivi-documento engine (key 2) (value 2)))
          'arcdocdb.conditions:resource-exhausted :engine-image-renewal-memory)
        (install-auto engine 1)
        (check-auto-preflight-rejection root engine
          (lambda () (e:scrivi-documento engine (key 2) (value 2)))
          'arcdocdb.conditions:invalid-argument :engine-image-build-exists)
        (install-auto engine 2 :max-renewals 1
                      :max-maintenance-payload (e::payload-rinnovo-immagine engine next 1 16))
        (is (= 2 (e:scrivi-documento engine (key 2) (value 2))))
        (check-auto-preflight-rejection root engine
          (lambda () (e:cancella-documento engine (key 3)))
          'arcdocdb.conditions:resource-exhausted :engine-auto-renewal-limit))))
  (with-root (root)
    (with-engine (engine (open-build-engine root :create t))
      (renew-image engine (build-option 1)) (e:cancella-documento engine (key 1))
      (install-auto engine (1- (ash 1 60)) :max-renewals 1)
      (is (= 2 (e:cancella-documento engine (key 2))))
      (is (= (1- (ash 1 60)) (e::id-immagine-costruzione (e::motore-paged-option engine)))))))

(deftest test-REQ-IDX-012-auto-disabling-and-independent-engines
  (with-root (one)
    (with-root (two)
      (with-engine (first (open-build-engine one :create t))
        (with-engine (second (open-build-engine two :create t))
          (let ((config (e:crea-opzione-rinnovo-automatico (build-option 2))))
            (dolist (engine (list first second))
              (renew-image engine (build-option 1)) (e:configura-rinnovo-automatico-motore engine config)
              (e:cancella-documento engine (key 1)))
            (let ((before (images two)) (old (check-active-file second)))
              (e:scrivi-documento first (key 2) (value 2))
              (check-images two before) (is (eq old (check-active-file second)))
              (is (= 1 (e::motore-auto-renewals-used first))) (is (zerop (e::motore-auto-renewals-used second))))
            (e:configura-rinnovo-automatico-motore second nil)
            (check-auto-preflight-rejection two second
              (lambda () (e:cancella-documento second (key 3)))
              'arcdocdb.conditions:resource-exhausted :engine-delta-capacity)
            (e:configura-rinnovo-automatico-motore second config)
            ;; Manual delta disabling clears automatic maintenance in the same view swap.
            (e:rinnova-indice-paginato-motore second (build-option 3))
            (is (null (e::motore-auto-renewal second)))
            (is (zerop (e::motore-auto-renewals-used second)))
            (e:cancella-documento second (key 2))
            (is (eq :resident (e:modo-indice-motore second)))))))))

(deftest test-REQ-IDX-012-auto-incomplete-exits-primary-and-continuous-busy
  (dolist (phase '(:image-build-created :image-published :automatic-index-renewed))
    (dolist (failure '(:error :exit))
      (with-root (root)
        (let ((armed nil) (before-wal t)
              (cause (make-condition 'arcdocdb.conditions:io-fault :reason :auto-injected :operation :test)))
          (with-engine (engine (open-build-engine root :create t
                                :observer (lambda (engine step)
                                  (when armed
                                    (is (e::motore-busy engine))
                                    (when (eq step :before-append) (setf before-wal nil))
                                    (signals arcdocdb.conditions:invalid-argument
                                             (e:configura-rinnovo-automatico-motore engine nil))
                                    (signals arcdocdb.conditions:invalid-argument
                                             (e:cancella-documento engine (key 9)))
                                    (when (eq step phase)
                                      (if (eq failure :error) (error cause) (throw 'auto-exit :stopped)))) nil)))
            (initial-workload engine) (renew-image engine (build-option 1))
            (e:cancella-documento engine (key 1)) (install-auto engine 2) (setf armed t)
            (if (eq failure :error)
                (let ((caught nil))
                  (handler-case (e:scrivi-documento engine (key 3) (value 9))
                    (arcdocdb.conditions:io-fault (condition) (setf caught condition)))
                  (is (eq cause caught)) (is (eq cause (e::motore-failure engine))))
                (is (eq :stopped (catch 'auto-exit (e:scrivi-documento engine (key 3) (value 9))))))
            (is before-wal) (is (eq :faulted (e:stato-motore engine)))
            (is (not (e::motore-busy engine))))
          (with-engine (engine (open-build-engine root))
            (check-frontier engine 6) (check-get engine 1 nil) (check-get engine 3 (value 4))))))))

(deftest test-REQ-IDX-012-auto-success-one-admission-through-commit
  (with-root (root)
    (let ((armed nil) (seen nil))
      (with-engine (engine (open-build-engine root :create t
                            :observer (lambda (engine phase)
                              (when armed
                                (is (e::motore-busy engine)) (push phase seen)
                                (signals arcdocdb.conditions:invalid-argument
                                         (e:leggi-documento engine (key 1) (bytes 64)))
                                (signals arcdocdb.conditions:invalid-argument
                                         (e:configura-rinnovo-automatico-motore engine nil))) nil)))
        (renew-image engine (build-option 1)) (e:cancella-documento engine (key 1)) (install-auto engine 2)
        (setf armed t) (is (= 2 (e:scrivi-documento engine (key 2) (value 2)))) (setf armed nil)
        (setf seen (nreverse seen))
        (is (< (position :image-published seen) (position :automatic-index-renewed seen)
               (position :before-append seen) (position :after-commit seen)))
        (is (= 1 (count :automatic-index-renewed seen)))
        (is (= 1 (e::motore-auto-renewals-used engine)))
        (is (not (e::motore-busy engine))) (check-get engine 2 (value 2))))))

(deftest test-REQ-IDX-012-auto-internal-admission-guards-and-specific-capacity-condition
  (with-root (root)
    (with-engine (engine (open-build-engine root :create t))
      (e:rinnova-indice-paginato-motore engine (build-option 1))
      (signals arcdocdb.conditions:invalid-argument
               (install-auto engine 2) :engine-auto-renewal-without-delta)
      (renew-image engine (build-option 2))
      (let ((config (install-auto engine 3)) (delta (e::motore-delta engine)))
        (signals arcdocdb.conditions:invariant-violation
                 (e::esegui-rinnovo-automatico-motore engine (build-option 3)) :engine-auto-renewal-state)
        (signals arcdocdb.conditions:invariant-violation
                 (e::prepara-indice-scrittura-ammessa engine (key 1) nil) :engine-auto-renewal-admission)
        (unwind-protect
             (progn
               (setf (e::motore-busy engine) t (e::motore-auto-renewal engine) nil)
               (signals arcdocdb.conditions:invariant-violation
                        (e::esegui-rinnovo-automatico-motore engine (build-option 3)) :engine-auto-renewal-state)
               (setf (e::motore-auto-renewal engine) config (e::motore-delta engine) nil)
               (signals arcdocdb.conditions:invariant-violation
                        (e::esegui-rinnovo-automatico-motore engine (build-option 3)) :engine-auto-renewal-state)
               (setf (e::motore-delta engine) delta
                     (e::motore-auto-renewals-used engine) (e::opzione-rinnovo-automatico-renewals config))
               (signals arcdocdb.conditions:invariant-violation
                        (e::esegui-rinnovo-automatico-motore engine (build-option 3)) :engine-auto-renewal-ordinal))
          (setf (e::motore-busy engine) nil (e::motore-auto-renewal engine) config
                (e::motore-delta engine) delta (e::motore-auto-renewals-used engine) 0)))
      (let ((original (symbol-function 'e::verifica-capienza-delta-motore))
            (cause (make-condition 'arcdocdb.conditions:resource-exhausted :reason :unrelated-capacity))
            (caught nil))
        (unwind-protect
             (progn
               (setf (symbol-function 'e::verifica-capienza-delta-motore)
                     (lambda (engine key) (declare (ignore engine key)) (error cause)))
               (handler-case (e::delta-saturo-per-chiave-p engine (key 1))
                 (arcdocdb.conditions:resource-exhausted (condition) (setf caught condition)))
               (is (eq cause caught)))
          (setf (symbol-function 'e::verifica-capienza-delta-motore) original))))))

(deftest test-REQ-IDX-012-auto-corruption-postconditions-and-late-budget
  (dolist (failure '(:missing-delta :missing-view :counters :unpublished))
    (with-root (root)
      (with-engine (engine (open-build-engine root :create t))
        (renew-image engine (build-option 1)) (e:cancella-documento engine (key 1)) (install-auto engine 2)
        (ecase failure
          (:missing-delta (setf (e::motore-delta engine) nil))
          (:missing-view (setf (e::motore-paged engine) nil))
          (:counters (setf (e::delta-indice-motore-count (e::motore-delta engine)) 2))
          (:unpublished (fill (e::delta-indice-motore-states (e::motore-delta engine)) 0)))
        (signals arcdocdb.conditions:invariant-violation (e:cancella-documento engine (key 1)))
        (is (eq :faulted (e:stato-motore engine)))
        (is (not (probe-file (build-path root (build-option 2))))))))
  (dolist (change '(:busy :state :health))
    (with-root (root)
      (let ((armed nil) (wal nil))
        (with-engine (engine (open-build-engine root :create t
                              :observer (lambda (engine phase)
                                (when armed
                                  (when (eq phase :before-append) (setf wal t))
                                  (when (eq phase :automatic-index-renewed)
                                    (ecase change
                                      (:busy (setf (e::motore-busy engine) nil))
                                      (:state (setf (e::motore-state engine) :starting))
                                      (:health (arcdocdb.series:fault-controllore-serie
                                                (e::motore-controller engine) (e::motore-lease engine)))))) nil)))
          (renew-image engine (build-option 1)) (e:cancella-documento engine (key 1)) (install-auto engine 2)
          (setf armed t)
          (signals arcdocdb.conditions:invariant-violation (e:cancella-documento engine (key 2)))
          (is (not wal)) (is (eq :faulted (e:stato-motore engine)))))))
  (dolist (kind '(:pages :file))
    (with-root (root)
      (with-engine (engine (open-build-engine root :create t))
        (dotimes (id 40) (e:scrivi-documento engine (key id) (value 1)))
        (renew-image engine (build-option 1)) (e:cancella-documento engine (key 1))
        (e:configura-rinnovo-automatico-motore engine
          (e:crea-opzione-rinnovo-automatico
            (build-option 2 :max-bytes (if (eq kind :file) 12288 1048576))
            :max-pages (if (eq kind :pages) 1 65536)))
        (signals arcdocdb.conditions:resource-exhausted (e:cancella-documento engine (key 2)))
        (is (eq :faulted (e:stato-motore engine)))
        (is (probe-file (build-path root (build-option 2))))))))

(defun automatic-renewal-child-main (arguments)
  (destructuring-bind (mode path format stage) arguments
    (let ((root (uiop:ensure-directory-pathname path)) (version (parse-integer format)) (armed nil))
      (with-engine (engine (open-build-engine root :create (string= mode "auto-write") :version version
                            :observer (lambda (engine phase)
                              (when (and armed (string-equal stage (symbol-name phase)))
                                (is (e::motore-busy engine)) (crash phase)) nil)))
        (cond ((string= mode "auto-write")
               (initial-workload engine) (renew-image engine (build-option 1))
               (e:cancella-documento engine (key 1)) (install-auto engine 2)
               (setf armed t) (e:scrivi-documento engine (key 3) (value 9))
               (error "Missing automatic-renewal crash."))
              ((string= mode "auto-verify")
               (let ((committed (string= stage "after-commit")))
                 (check-frontier engine (if committed 7 6)) (check-get engine 1 nil)
                 (check-get engine 3 (value (if committed 9 4))))
               (is (null (e::motore-auto-renewal engine))))
              (t (error "Unknown automatic-renewal child mode."))))
      (when (string= mode "auto-verify")
        (if (member stage '("image-build-created" "after-commit") :test #'string=)
            (signals arcdocdb.conditions:arcdocdb-error
                     (open-build-engine root :version version :option (build-option 2)))
            (with-engine (engine (open-build-engine root :version version :option (build-option 2)))
              (check-frontier engine 6) (check-get engine 1 nil) (check-get engine 3 (value 4)))))
      (format t "~&AUTO-VERIFIED v~D ~A~%" version stage))))

(deftest test-REQ-IDX-012-auto-SIGKILL-around-renewal-and-document-commit-v1-v2
  (dolist (version '(1 2))
    (dolist (stage '("image-build-created" "image-published" "automatic-index-renewed" "after-commit"))
      (with-root (root)
        (child root version "auto-write" stage :signaled sb-posix:sigkill)
        (let* ((storage (merge-pathnames "storage/" root))
               (before (mapcar (lambda (option) (cons (build-path storage option) (image (build-path storage option))))
                               (list (build-option 1) (build-option 2)))))
          (child root version "auto-verify" stage :exited 0)
          (dolist (pair before) (is (equalp (cdr pair) (image (car pair))))))))))
