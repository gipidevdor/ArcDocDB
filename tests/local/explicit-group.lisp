;;;; Real engine admissions through the explicit Unix dispatcher.
(in-package #:arcdocdb.local.server.tests)

(defun explicit-request (connection operations &optional (id 1))
  (let* ((buffer (l::local-connection-input connection))
         (end (l::encode-local-write-group buffer id operations (length operations)
                 (l::local-connection-space connection) 65536)))
    (l:decode-local-envelope buffer 4 end)))
(defun explicit-operations ()
  (vector (e:crea-operazione-scrittura :put (bytes 1) (bytes 0))
          (e:crea-operazione-scrittura :delete (bytes 1))
          (e:crea-operazione-scrittura :put (bytes 1) (bytes #x18 42))))
(defun explicit-cleared (connection)
  (let ((work (l::local-connection-group-workspace connection)))
    (is (every #'null (l::local-group-workspace-operations work)))
    (is (every #'zerop (l::local-group-workspace-spans work)))
    (is (every #'zerop (l::local-group-workspace-csns work)))))
(defun explicit-result (connection end count)
  (let* ((buffer (l::local-connection-output connection)) (env (l:decode-local-envelope buffer 4 end))
         (out (make-array 8 :element-type '(unsigned-byte 64))))
    (is (= count (l::decode-local-group-response buffer env out count))) out))

;;; REQ: REQ-IPC-002 REQ-WAL-006 REQ-AFF-004
(deftest test-REQ-WAL-006-explicit-group-response-failure-never-becomes-busy
  (with-engine (engine root :create t)
    (let* ((connection (l::make-local-connection :limit 65536 :write-groups t))
           (env (explicit-request connection (explicit-operations)))
           (original (symbol-function 'l::encode-local-group-response))
           (reject (symbol-function 'l:encode-local-response)) (rejections 0) (caught nil)
           (cause (make-condition 'arcdocdb.conditions:resource-exhausted :reason :response-fi)))
      (unwind-protect
           (progn
             (setf (symbol-function 'l::encode-local-group-response)
                   (lambda (&rest args) (declare (ignore args)) (error cause))
                   (symbol-function 'l:encode-local-response)
                   (lambda (&rest args) (incf rejections) (apply reject args)))
             (handler-case (l::local-dispatch engine connection env)
               (arcdocdb.conditions:resource-exhausted (observed) (is (eq observed cause)) (setf caught t)))
             (is caught) (is (zerop rejections))
             (is (equal '(0 3 0 3) (multiple-value-list (e:frontiere-motore engine)))) (explicit-cleared connection))
        (setf (symbol-function 'l::encode-local-group-response) original (symbol-function 'l:encode-local-response) reject)))))

;;; REQ: REQ-IPC-002 REQ-WAL-002 REQ-WAL-006 REQ-IDX-013
(deftest test-REQ-WAL-002-explicit-group-one-flush-mixed-keys-reopen-all-modes
  (dolist (version '(1 2))
    (dolist (mode '(:legacy :resident :paged))
      (arcdocdb.engine.tests::with-root (root)
        (let ((engine (arcdocdb.engine.tests::group-open root :create t :version version :mode mode)))
          (unwind-protect
               (let* ((connection (l::make-local-connection :limit 65536 :write-groups t))
                      (env (explicit-request connection (explicit-operations))) (flushes 0)
                      (original (symbol-function 'arcdocdb.io:durable-flush)))
                 (arcdocdb.engine.tests::rotation-force-paged engine mode)
                 (unwind-protect
                      (progn
                        (setf (symbol-function 'arcdocdb.io:durable-flush)
                              (lambda (file) (incf flushes) (funcall original file)))
                        (is (equalp #(1 2 3) (subseq (explicit-result connection (l::local-dispatch engine connection env) 3) 0 3)))
                        (is (= 1 flushes)))
                   (setf (symbol-function 'arcdocdb.io:durable-flush) original))
                 (explicit-cleared connection))
            (e:chiudi-motore engine)))
        (let ((engine (arcdocdb.engine.tests::group-open root :version version :mode mode)))
          (unwind-protect
               (let ((target (bytes 0 0)))
                 (multiple-value-bind (status length) (e:leggi-documento engine (bytes 1) target)
                   (is (eq :found status)) (is (= 2 length)) (is (equalp target (bytes #x18 42))))
                 (is (= 4 (e:cancella-documento engine (bytes 1)))))
            (e:chiudi-motore engine)))))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-WAL-006
(deftest test-REQ-IPC-002-explicit-group-refusals-have-no-side-effects-or-split
  (arcdocdb.engine.tests::with-root (root)
    (let ((engine (arcdocdb.engine.tests::group-open root :create t :records 1)))
      (unwind-protect
           (dolist (config '((nil 8 4) (t 1 5) (t 8 2)))
             (destructuring-bind (negotiated limit expected) config
               (let* ((connection (l::make-local-connection :limit 65536 :write-groups negotiated :group-limit limit))
                      (env (explicit-request connection (explicit-operations)))
                      (images (arcdocdb.engine.tests::images root))
                      (end (l::local-dispatch engine connection env)))
                 (is (= expected (l:envelope-code (l:decode-local-envelope (l::local-connection-output connection) 4 end))))
                 (is (equal '(0 0 0 0) (multiple-value-list (e:frontiere-motore engine))))
                 (arcdocdb.engine.tests::check-images root images) (explicit-cleared connection))))
        (e:chiudi-motore engine)))))

;;; REQ: REQ-IPC-002 REQ-WAL-006 REQ-LIM-003
(deftest test-REQ-IPC-002-explicit-group-validation-deadline-before-admission
  (with-engine (engine root :create t)
    (let* ((connection (l::make-local-connection :limit 65536 :write-groups t :deadline 5))
           (env (explicit-request connection (explicit-operations))))
      (signals l:protocol-error
        (l::local-dispatch engine connection env
          (lambda ()
            (is (svref (l::local-group-workspace-operations (l::local-connection-group-workspace connection)) 0)) 5)))
      (explicit-cleared connection)
      (is (equal '(0 0 0 0) (multiple-value-list (e:frontiere-motore engine)))))))

;;; REQ: REQ-IPC-002 REQ-WAL-002 REQ-WAL-006
(deftest test-REQ-WAL-002-explicit-group-drains-earlier-write-and-get-barrier
  (with-engine (engine root :create t)
    (let* ((group (l::make-local-connection :state :pending :limit 65536 :write-groups t :deadline 100))
           (connections (vector (group-pending 1 1 (bytes 9)) group (group-pending 1 2 (bytes 1)))))
      (setf (l::local-connection-pending group) (explicit-request group (explicit-operations)))
      (l::dispatch-local-ready engine connections (lambda () 10) (l::make-local-write-queue))
      (is (= 1 (group-response (svref connections 0) 1)))
      (is (equalp #(2 3 4) (subseq (explicit-result group (l::local-connection-size group) 3) 0 3)))
      (multiple-value-bind (status doc) (group-response (svref connections 2) 2)
        (is (eq :found status)) (is (equalp (bytes #x18 42) doc))) (explicit-cleared group))))

;;; REQ: REQ-IPC-002 REQ-WAL-006 REQ-LIM-003
(deftest test-REQ-IPC-002-explicit-group-rechecks-deadline-after-draining
  (let ((now 0))
    (with-engine (engine root :create t :observer
                         (lambda (handle phase) (declare (ignore handle)) (when (eq phase :after-flush) (setf now 10)) nil))
      (let* ((first (group-pending 1 1))
             (group (l::make-local-connection :state :pending :limit 65536 :write-groups t :deadline 5)))
        (setf now 0 (l::local-connection-pending group) (explicit-request group (explicit-operations)))
        (l::dispatch-local-ready engine (vector first group) (lambda () now) (l::make-local-write-queue))
        (is (= 1 (group-response first 1))) (is (eq :closed (l::local-connection-state group)))
        (is (equal '(0 1 0 1) (multiple-value-list (e:frontiere-motore engine))))))))
