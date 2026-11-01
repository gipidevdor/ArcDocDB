;;;; Real competing clients, canonical recovery, negotiated capability combinations and lost ACK reconciliation.
(in-package #:arcdocdb.local.process.tests)
(defun version-check-result (expected actual)
  (check (equalp expected actual) "Version result mismatch: expected ~S, got ~S" expected actual))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-TXS-003 REQ-REC-001 REQ-MVC-006
(deftest test-REQ-TXS-002-version-real-two-clients-stale-token-SIGKILL-reopen
  (call-with-run
   (lambda ()
     (let ((runtime (subdirectory "version-runtime/")) (key (decode-hex *key-one*)) (document (decode-hex "182A")))
       (dolist (version '(1 2))
         (scenario :conditional-clients version
           (lambda ()
             (let ((data (subdirectory (format nil "version-v~D/" version))))
               (multiple-value-bind (server socket) (start-server data runtime version 410 :create t)
                 (let ((first (l:connect-local (namestring socket) :versions t :write-groups t :read-groups t))
                       (second (l:connect-local (namestring socket) :versions t)))
                   (unwind-protect
                        (progn
                          (version-check-result '(:applied 1) (multiple-value-list (l:client-put-if first key document 0)))
                          (dolist (client (list first second))
                            (version-check-result (list :found document 1) (multiple-value-list (l:client-get-version client key))))
                          (version-check-result '(:applied 2) (multiple-value-list (l:client-put-if first key (decode-hex "F6") 1)))
                          (version-check-result '(:conflict 2) (multiple-value-list (l:client-put-if second key document 1)))
                          (version-check-result '(:conflict 2) (multiple-value-list (l:client-delete-if second key 1)))
                          (version-check-result '(:applied 3) (multiple-value-list (l:client-delete-if first key 2)))
                          (version-check-result '(:applied 4) (multiple-value-list (l:client-put-if second key document 0)))
                          (version-check-result '(:conflict 4) (multiple-value-list (l:client-delete-if first key 1)))
                          (check (equalp (vector document) (l:client-get-group first (vector key))) "Version/read-group interop"))
                     (l:close-local first) (l:close-local second)))
                 (stop-server server sb-posix:sigkill :conditional-strong-confirmed))
               (multiple-value-bind (server socket) (start-server data runtime version 411)
                 (let ((client (l:connect-local (namestring socket) :versions t)))
                   (unwind-protect
                        (progn (version-check-result (list :found document 4) (multiple-value-list (l:client-get-version client key)))
                               (version-check-result '(:conflict 4) (multiple-value-list (l:client-delete-if client key 2)))
                               (version-check-result '(:applied 5) (multiple-value-list (l:client-delete-if client key 4)))
                               (version-check-result '(:absent nil 0) (multiple-value-list (l:client-get-version client key))))
                     (l:close-local client)))
                 (stop-server server sb-posix:sigterm :conditional-recovered))))))))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-TXS-003 REQ-WAL-006 REQ-AFF-004 REQ-REC-001
(deftest test-REQ-WAL-006-version-real-lost-response-conflict-does-not-retry
  (call-with-run
   (lambda ()
     (let ((runtime (subdirectory "version-loss-runtime/")) (key (decode-hex *key-one*)) (document (decode-hex "182A")))
       (dolist (version '(1 2))
         (scenario :conditional-response-lost version
           (lambda ()
             (let ((data (subdirectory (format nil "version-loss-v~D/" version))))
               (multiple-value-bind (server socket)
                   (start-server data runtime version 420 :create t :script "tools/local-version-loss-server.lisp")
                 (let ((client (l:connect-local (namestring socket) :versions t)) (caught nil) (result :not-delivered))
                   (unwind-protect
                        (progn (handler-case (setf result (multiple-value-list (l:client-put-if client key document 0)))
                                 (l:outcome-unknown () (setf caught t)))
                               (check (and caught (eq result :not-delivered) (eq :closed (l::local-client-state client))) "False conditional ACK"))
                     (l:close-local client)))
                 (check (search "CONDITIONAL-RESPONSE-DROPPED" (uiop:read-file-string (child-stderr server))) "Missing exact loss injection")
                 (let ((client (l:connect-local (namestring socket) :versions t)))
                   (unwind-protect
                        (progn
                          (version-check-result '(:conflict 1) (multiple-value-list (l:client-put-if client key document 0)))
                          (version-check-result (list :found document 1) (multiple-value-list (l:client-get-version client key)))
                          (check (= 2 (l:client-put client (decode-hex *key-two*) document)) "Retry consumed a CSN"))
                     (l:close-local client)))
                 (stop-server server sb-posix:sigterm :conditional-loss-verified))))))))))
