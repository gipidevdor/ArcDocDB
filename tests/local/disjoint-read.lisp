;;;; Canonical reads across independent writes; logical histories and strong/failure boundaries.
(in-package #:arcdocdb.local.server.tests)

(defmacro with-disjoint-flush-count ((count) &body body)
  `(let ((,count 0) (original (symbol-function 'arcdocdb.io:durable-flush)))
     (unwind-protect
          (progn (setf (symbol-function 'arcdocdb.io:durable-flush)
                       (lambda (file) (incf ,count) (funcall original file))) ,@body)
       (setf (symbol-function 'arcdocdb.io:durable-flush) original))))

;;; REQ: REQ-IPC-002 REQ-WAL-002 REQ-IDX-001
(deftest test-REQ-IPC-002-disjoint-GET-copies-before-later-same-key-write
  (dolist (present '(nil t))
    (with-engine (engine root :create t)
      (when present (e:scrivi-documento engine (bytes 2) (bytes #x18 #x2a)))
      (let* ((a (group-pending 1 1 (bytes 1))) (read (group-pending 2 2 (bytes 2)))
             (b (group-pending 3 1 (bytes 2) (bytes #xf6))) (queue (l::make-local-write-queue))
             (base (if present 1 0)))
        (with-disjoint-flush-count (flushes)
          (l::dispatch-local-ready engine (vector a read b) (lambda () 10) queue)
          (is (= 1 flushes)))
        (is (= (1+ base) (group-response a 1))) (is (= (+ 2 base) (group-response b 1)))
        (multiple-value-bind (status doc) (group-response read 2)
          (is (eq (if present :found :absent) status))
          (is (equalp doc (when present (bytes #x18 #x2a)))))
        (let ((out (bytes 0 0)))
          (is (equal (list :found 1 (+ 2 base)) (multiple-value-list (e:leggi-documento-con-versione engine (bytes 2) out))))
          (is (= #xf6 (aref out 0))))
        (conditional-queue-cleared queue)))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-IDX-001 REQ-WAL-006
(deftest test-REQ-IPC-002-exact-key-GET-barriers-include-delete-and-condition
  (dolist (kind '(:put :delete :condition :conflict))
    (with-engine (engine root :create t)
      (e:scrivi-documento engine (bytes 1) (bytes #xf6))
      (let* ((a (case kind (:put (group-pending 1 1)) (:delete (group-pending 1 3))
                        (otherwise (conditional-pending (bytes 1) (if (eq kind :conflict) 0 1)))))
             (read (group-pending 2 2)) (b (group-pending 3 1 (bytes 1 0))))
        (with-disjoint-flush-count (flushes)
          (conditional-turn engine (vector a read b)) (is (= (if (eq kind :conflict) 1 2) flushes)))
        (multiple-value-bind (status doc) (group-response read 2)
          (is (eq (if (eq kind :delete) :absent :found) status))
          (is (equalp doc (case kind (:delete nil) (:put (bytes 0)) (otherwise (bytes #xf6))))))))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-IDX-001
(deftest test-REQ-IPC-002-independent-GET-all-admission-gates
  (with-engine (engine root :create t)
    (let* ((a (group-pending 1 1 (bytes 1 0))) (read (group-pending 2 2 (bytes 1)))
           (queue (l::make-local-write-queue)))
      (is (not (l::independent-local-get-p engine read queue 0 (bytes 1))))
      (l::dispatch-local-pending engine a queue (lambda () 10))
      (is (l::independent-local-get-p engine read queue 0 (bytes 1)))
      (is (not (l::independent-local-get-p engine read queue 0 (bytes 1 0))))
      (is (not (l::independent-local-get-p engine read queue 0 nil)))
      (is (not (l::independent-local-get-p engine read queue 1 (bytes 1))))
      (is (not (l::independent-local-get-p engine a queue 0 (bytes 1))))
      (setf (l::local-connection-limit read) 60031)
      (is (not (l::independent-local-get-p engine read queue 0 (bytes 1))))
      (setf (l::local-connection-limit read) 60032 (e::motore-state engine) :faulted)
      (unwind-protect (is (not (l::independent-local-get-p engine read queue 0 (bytes 1))))
        (setf (e::motore-state engine) :ready) (l::clear-local-write-queue queue)))))

;;; REQ: REQ-IPC-002 REQ-WAL-002 REQ-LIM-003
(deftest test-REQ-IPC-002-rejected-GET-and-PING-still-drain-writes
  (dolist (gate '(:small :malformed :ping))
    (with-engine (engine root :create t)
      (let* ((a (group-pending 1 1)) (read (group-pending 2 (if (eq gate :ping) 0 2) (unless (eq gate :ping) (bytes 2))))
             (b (group-pending 3 1 (bytes 3))))
        (case gate (:small (setf (l::local-connection-limit read) 60031))
                   (:malformed
                    (let* ((env (request read 2 0 nil nil)) (buffer (l::local-connection-input read)))
                      (setf (aref buffer (1- (l::envelope-payload-start env))) 2
                            (l::local-connection-pending read) (l::decode-local-envelope buffer 4 (l::envelope-payload-end env))))))
        (with-disjoint-flush-count (flushes)
          (conditional-turn engine (vector a read b)) (is (= 2 flushes)))
        (is (= 1 (group-response a 1))) (is (= 2 (group-response b 1)))
        (let ((env (l::decode-local-envelope (l::local-connection-output read) 4 (l::local-connection-size read))))
          (is (= (case gate (:small 5) (:malformed 1) (otherwise 0)) (l::envelope-code env))))))))

;;; REQ: REQ-IPC-002 REQ-WAL-002 REQ-LIM-003
(deftest test-REQ-IPC-002-disjoint-GET-admin-limit-one
  (with-engine (engine root :create t)
    (with-disjoint-flush-count (flushes)
      (conditional-turn engine (vector (group-pending 1 1) (group-pending 2 2 (bytes 2))
                                      (group-pending 3 1 (bytes 3))) :limit 1)
      (is (= 2 flushes)))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-004
(deftest test-REQ-IPC-002-disjoint-GET-fresh-deadlines-before-and-after-copy
  (dolist (stage '(:before :after :write))
    (let ((now 0))
      (with-engine (engine root :create t)
        (let* ((a (group-pending 1 1)) (read (group-pending 2 2 (bytes 2)))
               (original (symbol-function 'l::local-dispatch-command)) (lookups 0))
          (setf (l::local-connection-deadline read) (if (eq stage :before) 0 5)
                (l::local-connection-deadline a) (if (eq stage :write) 5 100))
          (unwind-protect
               (progn
                 (setf (symbol-function 'l::local-dispatch-command)
                       (lambda (&rest args)
                         (when (= 2 (fourth args)) (incf lookups))
                         (prog1 (apply original args) (when (= 2 (fourth args)) (setf now 5)))))
                 (conditional-turn engine (vector a read) :clock (lambda () now)))
            (setf (symbol-function 'l::local-dispatch-command) original))
          (is (= (if (eq stage :before) 0 1) lookups))
          (is (eq :closed (l::local-connection-state read)))
          (if (eq stage :write)
              (progn (is (eq :closed (l::local-connection-state a))) (arcdocdb.engine.tests::check-frontier engine 0))
              (is (= 1 (group-response a 1)))))))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-IDX-001 REQ-REC-001
(deftest test-REQ-IPC-002-disjoint-GET-copy-survives-capacity-fallback-and-rotation
  (arcdocdb.engine.tests::with-root (root)
    (let ((engine (e:apri-motore root (id 73) (id 41) :create t :clock (lambda () 10) :max-records 1)))
      (unwind-protect
           (progn
             (e:scrivi-documento engine (bytes 2) (bytes #x18 #x2a))
             (let ((a (group-pending 1 1)) (read (group-pending 2 2 (bytes 2)))
                   (b (group-pending 3 1 (bytes 2) (bytes #xf6))))
               (conditional-turn engine (vector a read b))
               (is (= 2 (group-response a 1))) (is (= 3 (group-response b 1)))
               (multiple-value-bind (status doc) (group-response read 2)
                 (is (eq :found status)) (is (equalp (bytes #x18 #x2a) doc)))))
        (e:chiudi-motore engine)))))

;;; REQ: REQ-IPC-002 REQ-AFF-004 REQ-REC-001 REQ-WAL-006
(deftest test-REQ-IPC-002-disjoint-GET-read-fault-precedes-write-admission
  (arcdocdb.engine.tests::with-root (root)
    (let* ((armed nil) (cause (make-condition 'arcdocdb.conditions:io-fault :reason :disjoint-read :operation :test))
           (engine (e:apri-motore root (id 73) (id 41) :create t :clock (lambda () (if armed (error cause) 10)))))
      (unwind-protect
           (let ((a (group-pending 1 1)) (read (group-pending 2 2 (bytes 2))) (queue (l::make-local-write-queue)))
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
(deftest test-REQ-IPC-002-disjoint-GET-never-sends-before-strong-or-after-failed-turn
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
        (setf read (l::make-local-connection :limit 65536 :state :pending :deadline 100 :io-backend backend)
              (l::local-connection-pending read) (request read 2 2 (bytes 2) nil))
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
