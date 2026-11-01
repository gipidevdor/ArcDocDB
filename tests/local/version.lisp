;;;; Actor barriers, canonical engine integration and scripted client failures.
(in-package #:arcdocdb.local.server.tests)
(defun version-envelope (connection operation key document token &optional (id 1))
  (let* ((buffer (l::local-connection-input connection))
         (end (l::encode-local-version buffer id operation key document token 65536)))
    (l:decode-local-envelope buffer 4 end)))
(defun version-dispatch (engine connection operation key document token)
  (let* ((end (l::local-dispatch engine connection (version-envelope connection operation key document token)))
         (buffer (l::local-connection-output connection)))
    (is (= (- end 4) (l:read-frame-length buffer 0 end)))
    (l::decode-local-version-response buffer (l:decode-local-envelope buffer 4 end) (l::local-connection-space connection) operation)))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-TXS-003 REQ-WAL-006
(deftest test-REQ-TXS-002-version-barrier-sees-earlier-collected-write
  (with-engine (engine root :create t)
    (let* ((first (group-pending 1 1 (bytes 1) (bytes #x18 42)))
           (conditional (l::make-local-connection :limit 65536 :versions t :state :pending :deadline 100)))
      (setf (l::local-connection-pending conditional) (version-envelope conditional 1 (bytes 1) (bytes #xf6) 0))
      (l::dispatch-local-ready engine (vector first conditional) (lambda () 10) (l::make-local-write-queue))
      (is (= 1 (group-response first 1)))
      (let* ((buffer (l::local-connection-output conditional))
             (envelope (l:decode-local-envelope buffer 4 (l::local-connection-size conditional))))
        (is (equal '(:conflict 1) (multiple-value-list (l::decode-local-version-response buffer envelope (l::local-connection-space conditional) 1)))))
      (arcdocdb.engine.tests::check-frontier engine 1))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-LIM-003 REQ-AFF-004
(deftest test-REQ-IPC-002-version-expired-after-drain-never-compares-or-writes
  (let ((now 0))
    (with-engine (engine root :create t :observer (lambda (engine phase) (declare (ignore engine))
                                                  (when (eq phase :after-flush) (setf now 10)) nil))
      (let* ((first (group-pending 1 1 (bytes 1) (bytes #xf6)))
             (conditional (l::make-local-connection :limit 65536 :versions t :state :pending :deadline 5)))
        (setf (l::local-connection-pending conditional) (version-envelope conditional 1 (bytes 1) (bytes 0) 1))
        (l::dispatch-local-ready engine (vector first conditional) (lambda () now) (l::make-local-write-queue))
        (is (eq :closed (l::local-connection-state conditional))) (arcdocdb.engine.tests::check-frontier engine 1)))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-TXS-003 REQ-IDX-013 REQ-MVC-006
(deftest test-REQ-TXS-002-version-dispatch-v1-v2-all-primary-profiles
  (dolist (version '(1 2)) (dolist (mode '(:legacy :resident :paged))
    (arcdocdb.engine.tests::with-root (root)
      (let ((engine (read-test-open root t version mode)) (connection (l::make-local-connection :limit 65536 :versions t)))
        (unwind-protect
             (progn
               (is (equal '(:absent nil 0) (multiple-value-list (version-dispatch engine connection 0 (bytes 1) nil 0))))
               (is (equal '(:applied 1) (multiple-value-list (version-dispatch engine connection 1 (bytes 1) (bytes #xf6) 0))))
               (is (equalp (list :found (bytes #xf6) 1) (multiple-value-list (version-dispatch engine connection 0 (bytes 1) nil 0))))
               (is (equal '(:conflict 1) (multiple-value-list (version-dispatch engine connection 1 (bytes 1) (bytes 0) 0))))
               (is (equal '(:conflict 1) (multiple-value-list (version-dispatch engine connection 3 (bytes 1) nil 2))))
               (is (equal '(:applied 2) (multiple-value-list (version-dispatch engine connection 3 (bytes 1) nil 1))))
               (is (equal '(:applied 3) (multiple-value-list (version-dispatch engine connection 1 (bytes 1) (bytes #xf6) 0))))
               (is (equal '(:conflict 3) (multiple-value-list (version-dispatch engine connection 3 (bytes 1) nil 1))))
               (arcdocdb.engine.tests::check-frontier engine 3))
          (e:chiudi-motore engine)))))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-LIM-003 REQ-AFF-004
(deftest test-REQ-IPC-002-version-budget-capability-and-deadline-before-engine
  (with-engine (engine root :create t)
    (let ((connection (l::make-local-connection :limit 4096 :versions t :deadline 100)) (originals (arcdocdb.engine.tests::images root)))
      (signals l:request-rejected (version-dispatch engine connection 0 (bytes 1) nil 0))
      (setf (l::local-connection-versions connection) nil)
      (signals l:request-rejected (version-dispatch engine connection 1 (bytes 1) (bytes #xf6) 0))
      (setf (l::local-connection-versions connection) t)
      (signals l:protocol-error (l::local-dispatch engine connection (version-envelope connection 1 (bytes 1) (bytes #xf6) 0) (lambda () 100)))
      (is (eq :ready (e:stato-motore engine))) (arcdocdb.engine.tests::check-frontier engine 0)
      (arcdocdb.engine.tests::check-images root originals))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-WAL-006 REQ-LIM-003
(deftest test-REQ-IPC-002-version-maximum-document-and-read-grant
  (with-engine (engine root :create t)
    (let ((connection (l::make-local-connection :limit 65536 :versions t)) (document (arcdocdb.local.wire.tests::get-document 60000)))
      (is (equal '(:applied 1) (multiple-value-list (version-dispatch engine connection 1 (bytes 1) document 0))))
      (is (equalp (list :found document 1) (multiple-value-list (version-dispatch engine connection 0 (bytes 1) nil 0))))
      (setf (l::local-connection-limit connection) 60039)
      (signals l:request-rejected (version-dispatch engine connection 0 (bytes 1) nil 0))
      (setf (l::local-connection-limit connection) 60040)
      (is (equalp (list :found document 1) (multiple-value-list (version-dispatch engine connection 0 (bytes 1) nil 0)))))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-WAL-006 REQ-AFF-004
(deftest test-REQ-WAL-006-version-post-commit-error-is-not-rejection
  (let ((cause (make-condition 'arcdocdb.conditions:resource-exhausted :reason :conditional-post-commit)))
    (with-engine (engine root :create t :observer (lambda (engine phase) (declare (ignore engine))
                                                  (when (eq phase :after-commit) (error cause)) nil))
      (let ((connection (l::make-local-connection :limit 65536 :versions t)) (seen nil))
        (handler-case (version-dispatch engine connection 1 (bytes 1) (bytes #xf6) 0)
          (error (actual) (is (eq cause actual)) (setf seen t)))
        (is seen) (is (eq :faulted (e:stato-motore engine)))))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-WAL-006 REQ-AFF-004
(deftest test-REQ-IPC-002-version-client-fragments-conflict-and-read-three-values
  (dolist (operation '(0 1 3))
    (let* ((reply (if (zerop operation) (bytes #x83 #xf5 1 #x41 #xf6) (bytes #x82 #xf4 1)))
           (client (scripted-group-client (client-group-reply reply) :fragment 1 :short-io t :versions t)))
      (unwind-protect
           (progn
             (is (equalp (if (zerop operation) (list :found (bytes #xf6) 1) '(:conflict 1))
                         (multiple-value-list (l::exchange-local-version client operation (bytes 1) (when (= operation 1) (bytes #xf6)) 0))))
             (is (eq :ready (l::local-client-state client))) (is (= 2 (l::local-client-next-id client))))
        (l:close-local client)))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-AFF-004
(deftest test-REQ-IPC-002-version-client-failure-classification-and-decode-deadline
  (dolist (operation '(0 1 3))
    (dolist (variant '(:bad-token :wrong-id :eof :deadline :decode))
      (let* ((payload (if (zerop operation) (bytes #x83 #xf5 (if (eq variant :bad-token) 0 1) #x41 #xf6)
                         (bytes #x82 #xf5 (if (eq variant :bad-token) 0 1))))
             (client (scripted-group-client (if (eq variant :eof) (bytes 0 0)
                                               (client-group-reply payload 0 (if (eq variant :wrong-id) 2 1)))
                                             :versions t :expire (case variant (:deadline t) (:decode :decode)))))
        (unwind-protect
             (progn
               (if (zerop operation)
                   (signals l:protocol-error (l:client-get-version client (bytes 1)))
                   (signals l:outcome-unknown (l::exchange-local-version client operation (bytes 1) (when (= operation 1) (bytes #xf6)) 0)))
               (is (eq :closed (l::local-client-state client))))
          (l:close-local client))))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-LIM-003 REQ-AFF-004
(deftest test-REQ-IPC-002-version-client-preflight-and-known-rejection-remain-ready
  (let ((client (scripted-group-client (client-group-reply (bytes #xf6) 2) :versions t)))
    (unwind-protect
         (progn
           (signals arcdocdb.conditions:invalid-argument (l:client-delete-if client (bytes 1) -1))
           (is (= 1 (l::local-client-next-id client)))
           (signals l:request-rejected (l:client-delete-if client (bytes 1) 0))
           (is (eq :ready (l::local-client-state client))) (is (= 2 (l::local-client-next-id client))))
      (l:close-local client)))
  (let ((client (scripted-group-client (bytes))))
    (unwind-protect
         (progn (signals arcdocdb.conditions:unsupported-format (l:client-get-version client (bytes 1)))
                (is (= 1 (l::local-client-next-id client))) (is (eq :ready (l::local-client-state client))))
      (l:close-local client))))
