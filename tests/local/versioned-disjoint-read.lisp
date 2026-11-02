;;;; C4: version/value coherence at the serial boundary; no speculative token overlay.
(in-package #:arcdocdb.local.server.tests)

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-IDX-001 REQ-IDX-013 REQ-CCH-002 REQ-WAL-006
(deftest test-REQ-IPC-002-disjoint-VERSION-GET-coherent-copy-v1-v2-all-profiles
  (dolist (version '(1 2)) (dolist (mode '(:legacy :resident :paged)) (dolist (present '(nil t))
    (arcdocdb.engine.tests::with-root (root)
      (let ((engine (read-test-open root t version mode :cache 1048576)))
        (unwind-protect
             (progn
               (when present (e:scrivi-documento engine (bytes 2) (bytes #x18 #x2a)))
               (let* ((a (group-pending 1 1)) (read (conditional-pending (bytes 2) 0 0 nil))
                      (b (group-pending 3 1 (bytes 2) (bytes #xf6))) (base (if present 1 0))
                      (queue (l::make-local-write-queue)) (id #xffffffffffffffff))
                 (setf (l::local-connection-pending read) (version-envelope read 0 (bytes 2) nil 0 id)
                       (l::local-connection-limit read) 60040)
                 (with-disjoint-flush-count (flushes)
                   (l::dispatch-local-ready engine (vector a read b) (lambda () 10) queue) (is (= 1 flushes)))
                 (is (= (1+ base) (group-response a 1))) (is (= (+ 2 base) (group-response b 1)))
                 (is (equalp (list (if present :found :absent) (when present (bytes #x18 #x2a)) base)
                             (multiple-value-list (conditional-response read 0))))
                 (is (= id (l:envelope-id (l:decode-local-envelope (l::local-connection-output read) 4 (l::local-connection-size read)))))
                 (is (equal (list :found 1 (+ 2 base)) (multiple-value-list (e:leggi-documento-con-versione engine (bytes 2) (bytes 0)))))
                 (conditional-queue-cleared queue)))
          (e:chiudi-motore engine))))))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-IDX-001 REQ-WAL-006
(deftest test-REQ-IPC-002-disjoint-VERSION-GET-exact-key-barriers-and-conflicts
  (dolist (kind '(:put :delete :condition :conflict))
    (with-engine (engine root :create t)
      (e:scrivi-documento engine (bytes 1) (bytes #xf6))
      (let* ((a (case kind (:put (group-pending 1 1)) (:delete (group-pending 1 3))
                        (otherwise (conditional-pending (bytes 1) (if (eq kind :conflict) 0 1)))))
             (read (conditional-pending (bytes 1) 0 0 nil)) (b (group-pending 3 1 (bytes 1 0))))
        (with-disjoint-flush-count (flushes)
          (conditional-turn engine (vector a read b)) (is (= (if (eq kind :conflict) 1 2) flushes)))
        (is (equalp (list (if (eq kind :delete) :absent :found)
                         (case kind (:delete nil) (:put (bytes 0)) (otherwise (bytes #xf6)))
                         (case kind (:delete 0) (:conflict 1) (otherwise 2)))
                    (multiple-value-list (conditional-response read 0))))))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-IDX-001
(deftest test-REQ-IPC-002-disjoint-VERSION-GET-all-admission-gates
  (with-engine (engine root :create t)
    (let* ((a (group-pending 1 1 (bytes 1 0))) (read (conditional-pending (bytes 1) 0 0 nil))
           (queue (l::make-local-write-queue)))
      (flet ((allowed (&optional (code 0) (key (bytes 1)) (operation 0))
               (l::independent-local-version-get-p engine read queue code key operation)))
        (is (not (allowed))) (l::dispatch-local-pending engine a queue (lambda () 10))
        (is (allowed)) (is (not (allowed 0 (bytes 1 0)))) (is (not (allowed 0 nil)))
        (dolist (code '(1 5)) (is (not (allowed code))))
        (dolist (operation '(1 3)) (is (not (allowed 0 (bytes 1) operation))))
        (setf (l::local-connection-limit read) 60039) (is (not (allowed)))
        (setf (l::local-connection-limit read) 60040) (is (allowed))
        (setf (l::local-connection-versions read) nil) (is (not (allowed)))
        (setf (l::local-connection-versions read) t (l::local-connection-pending read) (request read 1 2 (bytes 1) nil))
        (is (not (allowed)))
        (setf (l::local-connection-pending read) (version-envelope read 0 (bytes 1) nil 0)
              (e::motore-state engine) :faulted)
        (unwind-protect (is (not (allowed)))
          (setf (e::motore-state engine) :ready) (l::clear-local-write-queue queue))))))

;;; REQ: REQ-IPC-002 REQ-WAL-002 REQ-LIM-003
(deftest test-REQ-IPC-002-disjoint-VERSION-GET-rejections-remain-barriers
  (dolist (gate '(:small :unnegotiated :malformed))
    (with-engine (engine root :create t)
      (let ((a (group-pending 1 1)) (read (conditional-pending (bytes 2) 0 0 nil)) (b (group-pending 3 1 (bytes 3))))
        (case gate (:small (setf (l::local-connection-limit read) 60039))
                   (:unnegotiated (setf (l::local-connection-versions read) nil))
                   (:malformed (let* ((env (l::local-connection-pending read)) (input (l::local-connection-input read)))
                                 (setf (aref input (l:envelope-payload-start env)) #xf6))))
        (with-disjoint-flush-count (flushes) (conditional-turn engine (vector a read b)) (is (= 2 flushes)))
        (is (= 1 (group-response a 1))) (is (= 2 (group-response b 1)))
        (let ((env (l:decode-local-envelope (l::local-connection-output read) 4 (l::local-connection-size read))))
          (is (= (case gate (:small 5) (:unnegotiated 4) (otherwise 1)) (l:envelope-code env))))))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-CCH-002 REQ-WAL-002
(deftest test-REQ-IPC-002-disjoint-VERSION-GET-mixed-queue-and-cache-verification-fallback
  (dolist (damaged '(nil t))
    (arcdocdb.engine.tests::with-root (root)
      (let ((engine (read-test-open root t 2 :paged :cache 1048576)))
        (unwind-protect
             (progn
               (e:scrivi-documento engine (bytes 9) (bytes #xf6))
               (e:leggi-documento engine (bytes 9) (bytes 0))
               (when damaged (arcdocdb.engine.tests::cache-bit-flip engine))
               (let ((a (conditional-pending (bytes 1) 0)) (conflict (conditional-pending (bytes 2) 99))
                     (read (conditional-pending (bytes 9) 0 0 nil)) (b (group-pending 3 1 (bytes 3))))
                 (with-disjoint-flush-count (flushes) (conditional-turn engine (vector a conflict read b)) (is (= 1 flushes)))
                 (is (equal '(:applied 2) (multiple-value-list (conditional-response a))))
                 (is (equal '(:conflict 0) (multiple-value-list (conditional-response conflict))))
                 (is (equalp (list :found (bytes #xf6) 1) (multiple-value-list (conditional-response read 0))))
                 (is (= 3 (group-response b 1)))
                 (is (= (if damaged 1 0) (getf (e:statistiche-cache-motore engine) :verify-failed)))))
          (e:chiudi-motore engine))))))

;;; REQ: REQ-IPC-002 REQ-WAL-002 REQ-LIM-003
(deftest test-REQ-IPC-002-disjoint-VERSION-GET-admin-limit-one
  (with-engine (engine root :create t)
    (with-disjoint-flush-count (flushes)
      (conditional-turn engine (vector (group-pending 1 1) (conditional-pending (bytes 2) 0 0 nil)
                                      (group-pending 3 1 (bytes 3))) :limit 1)
      (is (= 2 flushes)))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-004
(deftest test-REQ-IPC-002-disjoint-VERSION-GET-fresh-deadlines-before-and-after-copy
  (dolist (stage '(:before :after :write))
    (let ((now 0))
      (with-engine (engine root :create t)
        (let* ((a (group-pending 1 1)) (read (conditional-pending (bytes 2) 0 0 nil))
               (original (symbol-function 'l::local-dispatch-version-command)) (lookups 0))
          (setf (l::local-connection-deadline read) (if (eq stage :before) 0 5)
                (l::local-connection-deadline a) (if (eq stage :write) 5 100))
          (unwind-protect
               (progn
                 (setf (symbol-function 'l::local-dispatch-version-command)
                       (lambda (&rest args)
                         (when (zerop (seventh args)) (incf lookups))
                         (prog1 (apply original args) (when (zerop (seventh args)) (setf now 5)))))
                 (conditional-turn engine (vector a read) :clock (lambda () now)))
            (setf (symbol-function 'l::local-dispatch-version-command) original))
          (is (= (if (eq stage :before) 0 1) lookups))
          (is (eq :closed (l::local-connection-state read)))
          (if (eq stage :write)
              (progn (is (eq :closed (l::local-connection-state a))) (arcdocdb.engine.tests::check-frontier engine 0))
              (is (= 1 (group-response a 1)))))))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-IDX-001 REQ-REC-001
(deftest test-REQ-IPC-002-disjoint-VERSION-GET-copy-survives-capacity-fallback-and-rotation
  (arcdocdb.engine.tests::with-root (root)
    (let ((engine (e:apri-motore root (id 73) (id 41) :create t :clock (lambda () 10) :max-records 1)))
      (unwind-protect
           (progn
             (e:scrivi-documento engine (bytes 2) (bytes #x18 #x2a))
             (let ((a (group-pending 1 1)) (read (conditional-pending (bytes 2) 0 0 nil))
                   (b (group-pending 3 1 (bytes 2) (bytes #xf6))))
               (conditional-turn engine (vector a read b))
               (is (= 2 (group-response a 1))) (is (= 3 (group-response b 1)))
               (multiple-value-bind (status doc token) (conditional-response read 0)
                 (is (= 1 token)) (is (eq :found status)) (is (equalp (bytes #x18 #x2a) doc)))))
        (e:chiudi-motore engine)))))

;;; REQ: REQ-IPC-002 REQ-AFF-004 REQ-REC-001 REQ-WAL-006
(deftest test-REQ-IPC-002-disjoint-VERSION-GET-read-fault-precedes-write-admission
  (arcdocdb.engine.tests::with-root (root)
    (let* ((armed nil) (cause (make-condition 'arcdocdb.conditions:io-fault :reason :disjoint-read :operation :test))
           (engine (e:apri-motore root (id 73) (id 41) :create t :clock (lambda () (if armed (error cause) 10)))))
      (unwind-protect
           (let ((a (group-pending 1 1)) (read (conditional-pending (bytes 2) 0 0 nil)) (queue (l::make-local-write-queue)))
             (e:scrivi-documento engine (bytes 2) (bytes #xf6))
             (setf armed t)
             (handler-case (progn (l::dispatch-local-ready engine (vector a read) (lambda () 10) queue) (error "Missing read fault"))
               (arcdocdb.conditions:io-fault (seen) (is (eq cause seen))))
             (is (eq :faulted (e:stato-motore engine)))
             (is (eq :pending (l::local-connection-state a))) (is (eq :pending (l::local-connection-state read)))
             (conditional-queue-cleared queue))
        (e:chiudi-motore engine)))
    (let ((reopened (engine root)))
      (unwind-protect
           (progn (arcdocdb.engine.tests::check-frontier reopened 1)
                  (is (eq :absent (e:leggi-documento reopened (bytes 1) (bytes 0)))))
        (e:chiudi-motore reopened)))))

;;; REQ: REQ-IPC-002 REQ-WAL-006 REQ-AFF-004 REQ-REC-001
(deftest test-REQ-IPC-002-disjoint-VERSION-GET-never-sends-before-strong-or-after-failed-turn
  (dolist (exit '(:success :error :throw))
    (let* ((armed nil) (sends 0) (observed nil) (read nil)
           (backend (l::make-native-backend :send
                      (lambda (fd buffer start count) (declare (ignore fd buffer start))
                        (incf sends) (values count 0)))))
      (with-engine (engine root :create t :observer
                    (lambda (handle phase) (declare (ignore handle))
                      (when (and armed (eq :after-flush phase))
                        (is (eq :response (l::local-connection-state read))) (is (zerop sends))
                        (is (= (l::local-until 10 30) (l::local-connection-deadline read)))
                        (setf observed t)
                        (case exit (:error (error 'arcdocdb.conditions:io-fault :reason :disjoint-flush :operation :test))
                                   (:throw (throw 'disjoint-stop :stopped)))) nil))
        (setf read (l::make-local-connection :limit 65536 :versions t :state :pending :deadline 100 :io-backend backend)
              (l::local-connection-pending read) (version-envelope read 0 (bytes 2) nil 0 2))
        (let* ((a (group-pending 1 1)) (b (group-pending 3 1 (bytes 3))) (queue (l::make-local-write-queue)))
          (setf armed t)
          (let ((result (catch 'disjoint-stop
                          (handler-case (progn (l::dispatch-local-ready engine (vector a read b) (lambda () 10) queue) :ok)
                            (arcdocdb.conditions:io-fault () :fault)))))
            (is (eq result (case exit (:success :ok) (:error :fault) (:throw :stopped)))))
          (is observed) (is (zerop sends)) (conditional-queue-cleared queue)
          (if (eq exit :success)
              (progn (is (= 1 (group-response a 1))) (is (= 2 (group-response b 1))))
              (is (eq :faulted (e:stato-motore engine)))))))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-004
(deftest test-REQ-IPC-002-disjoint-VERSION-GET-deadlines-after-decode-and-canonical-copy
  (dolist (phase '(:decode :copy))
    (let ((now 0) (reads 0) (decode (symbol-function 'l::decode-local-version))
          (get (symbol-function 'e:leggi-documento-con-versione)))
      (with-engine (engine root :create t)
        (let ((a (group-pending 1 1)) (read (conditional-pending (bytes 9) 0 0 nil 5)) (b (group-pending 3 1 (bytes 3))))
          (unwind-protect
               (progn
                 (setf (symbol-function 'l::decode-local-version)
                       (lambda (&rest args) (multiple-value-prog1 (apply decode args) (when (eq phase :decode) (setf now 5))))
                       (symbol-function 'e:leggi-documento-con-versione)
                       (lambda (&rest args) (incf reads) (multiple-value-prog1 (apply get args) (when (eq phase :copy) (setf now 5)))))
                 (with-disjoint-flush-count (flushes)
                   (conditional-turn engine (vector a read b) :clock (lambda () now)) (is (= 1 flushes)))
                 (is (= (if (eq phase :decode) 0 1) reads)) (is (eq :closed (l::local-connection-state read)))
                 (is (= 1 (group-response a 1))) (is (= 2 (group-response b 1))))
            (setf (symbol-function 'l::decode-local-version) decode (symbol-function 'e:leggi-documento-con-versione) get)))))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-MVC-006 REQ-LIM-001
(deftest test-REQ-IPC-002-disjoint-VERSION-GET-full-u64-record-token-before-carry
  (with-engine (engine root :create t)
    (let ((registry (e::motore-registry engine)) (token #x80000000ffffffff))
      ;; C4 registry fixture only, matching the existing engine carry test.
      (setf (arcdocdb.csn::registro-csn-last-high registry) #x80000000
            (arcdocdb.csn::registro-csn-horizon-high registry) #x80000000
            (arcdocdb.csn::registro-csn-last-low registry) #xfffffffe
            (arcdocdb.csn::registro-csn-horizon-low registry) #xfffffffe)
      (is (= token (e:scrivi-documento engine (bytes 9) (bytes #xf6))))
      (let ((a (group-pending 1 1)) (read (conditional-pending (bytes 9) 0 0 nil)) (b (group-pending 3 1 (bytes 3))))
        (with-disjoint-flush-count (flushes) (conditional-turn engine (vector a read b)) (is (= 1 flushes)))
        (is (equalp (list :found (bytes #xf6) token) (multiple-value-list (conditional-response read 0))))
        (is (= (1+ token) (group-response a 1))) (is (= (+ 2 token) (group-response b 1)))))))
