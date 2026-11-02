;;;; Two-client compare-and-apply through reusable verified output and canonical restart.
(in-package #:arcdocdb.local.process.tests)
(defun check-version-into (client key target document token)
  (fill target #xa5)
  (version-check-result (list (if document :found :absent) (if document (length document) 0) token)
    (multiple-value-list (l:client-get-version-into client key target :start 4)))
  (when document
    (check (not (mismatch document target :start2 4 :end2 (+ 4 (length document)))) "Version-into exact bytes"))
  (dotimes (i 4) (check (= #xa5 (aref target i)) "Version-into prefix"))
  (loop for i from (+ 4 (if document (length document) 0)) below (length target)
        do (check (= #xa5 (aref target i)) "Version-into tail")))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-TXS-003 REQ-REC-001 REQ-IDX-010 REQ-WAL-006
(deftest test-REQ-TXS-002-version-into-real-two-clients-formats-modes-and-SIGKILL-reopen
  (call-with-run
   (lambda ()
     (let ((runtime (subdirectory "version-into-runtime/")) (stage 970) (key (decode-hex *key-one*))
           (small (decode-hex "182A")) (large (arcdocdb.local.wire.tests::get-document 60000))
           (target (make-array 60008 :element-type '(unsigned-byte 8))))
       (dolist (version '(1 2)) (dolist (mode '(:resident :paged))
         (scenario :version-into-conditional version
           (lambda ()
             (with-buffered-primary (mode)
               (let ((data (subdirectory (format nil "version-into-v~D-~A/" version mode))))
                 (multiple-value-bind (server socket)
                     (start-server data runtime version (incf stage) :create t :script "tools/local-buffered-get-server.lisp")
                   (let ((first (l:connect-local (namestring socket) :versions t))
                         (second (l:connect-local (namestring socket) :versions t)))
                     (unwind-protect
                          (progn
                            (check-version-into first key target nil 0)
                            (version-check-result '(:applied 1) (multiple-value-list (l:client-put-if first key small 0)))
                            (multiple-value-bind (status size token) (l:client-get-version-into second key target :start 4)
                              (check (and (eq :found status) (= 2 size) (= 1 token)) "Initial reusable token")
                              (version-check-result '(:applied 2) (multiple-value-list (l:client-put-if first key large token)))
                              (version-check-result '(:conflict 2) (multiple-value-list (l:client-put-if second key small token))))
                            (check-version-into second key target large 2)
                            (version-check-result '(:applied 3) (multiple-value-list (l:client-delete-if first key 2)))
                            (check-version-into second key target nil 0)
                            (version-check-result '(:applied 4) (multiple-value-list (l:client-put-if second key large 0)))
                            (version-check-result '(:conflict 4) (multiple-value-list (l:client-delete-if first key 1)))
                            (check-version-into first key target large 4))
                       (l:close-local first) (l:close-local second)))
                   (let ((client (l:connect-local (namestring socket) :versions t :max-frame 4096)) (seen nil))
                     (unwind-protect
                          (progn
                            (fill target #xa5)
                            (handler-case (l:client-get-version-into client key target :start 4)
                              (l:request-rejected (cause) (check (= 5 (l:rejection-status cause)) "Version frame refusal") (setf seen t)))
                            (check seen "Version frame unexpectedly accepted")
                            (check (every (lambda (n) (= n #xa5)) target) "Version rejection changed output")
                            (l:client-ping client))
                       (l:close-local client)))
                   (stop-server server sb-posix:sigkill :version-into-strong-confirmed))
                 (multiple-value-bind (server socket)
                     (start-server data runtime version (incf stage) :script "tools/local-buffered-get-server.lisp")
                   (let ((client (l:connect-local (namestring socket) :versions t)))
                     (unwind-protect
                          (progn
                            (check-version-into client key target large 4)
                            (multiple-value-bind (status size token) (l:client-get-version-into client key target :start 4)
                              (check (and (eq :found status) (= 60000 size)) "Recovered reusable document")
                              (version-check-result '(:applied 5) (multiple-value-list (l:client-put-if client key small token))))
                            (check-version-into client key target small 5)
                            (version-check-result (list :found small 5) (multiple-value-list (l:client-get-version client key))))
                       (l:close-local client)))
                   (stop-server server sb-posix:sigterm :version-into-recovery-verified))))))))))))
