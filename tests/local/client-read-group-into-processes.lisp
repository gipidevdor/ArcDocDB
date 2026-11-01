;;;; Public grouped arena output across formats, primary modes, strong state, overflow and crash/reopen.
(in-package #:arcdocdb.local.process.tests)
(defun group-buffer-process-check (client keys docs arena lengths)
  (fill arena #xa5) (fill lengths 999)
  (multiple-value-bind (count total) (l:client-get-group-into client keys arena lengths :start 4)
    (check (= count (length docs)) "Grouped arena count")
    (check (= total (loop for doc across docs sum (if doc (length doc) 0))) "Grouped arena total")
    (arcdocdb.local.server.tests::rg-into-guards arena lengths 4 docs)))

;;; REQ: REQ-IPC-002 REQ-IDX-001 REQ-LIM-003 REQ-REC-001 REQ-AFF-008
(deftest test-REQ-IPC-002-group-buffer-real-formats-primary-modes-overflow-and-SIGKILL-reopen
  (call-with-run
   (lambda ()
     (let ((runtime (subdirectory "group-buffer-runtime/")) (stage 940))
       (dolist (version '(1 2)) (dolist (mode '(:resident :paged))
         (scenario :group-buffer version
          (lambda ()
           (with-buffered-primary (mode)
            (let* ((data (subdirectory (format nil "group-buffer-v~D-~A/" version mode))) (keys (read-process-keys))
                   (docs (make-array 8 :initial-contents (loop for i below 8 collect
                     (let ((doc (arcdocdb.local.wire.tests::get-document 8184))) (fill doc (+ 65 i) :start 3) doc))))
                   (arena (make-array 65544 :element-type '(unsigned-byte 8)))
                   (lengths (make-array 10 :element-type '(unsigned-byte 64))))
              (multiple-value-bind (server socket)
                  (start-server data runtime version (incf stage) :create t :script "tools/local-buffered-get-server.lisp")
                (let ((client (l:connect-local (namestring socket) :read-groups t :versions t)))
                  (unwind-protect
                       (progn
                         (dotimes (i 8) (check (= (1+ i) (l:client-put client (svref keys i) (svref docs i))) "Grouped buffer seed"))
                         ;; Raw document aggregate is 65,472 bytes: above the single-document maximum.
                         (group-buffer-process-check client keys docs arena lengths)
                         (let ((legacy (l:client-get-group client keys)))
                           (check (equalp legacy docs) "Legacy group content") (fill arena 0)
                           (check (equalp legacy docs) "Legacy group borrowed arena"))
                         (check (= 9 (l:client-delete client (svref keys 0))) "Grouped buffer delete")
                         (group-buffer-process-check client (vector (svref keys 0) (svref keys 1) (svref keys 1) (svref keys 7))
                                                    (vector nil (svref docs 1) (svref docs 1) (svref docs 7)) arena lengths)
                         (check (= 10 (l:client-put client (svref keys 0) (decode-hex "F6"))) "Grouped buffer null")
                         (setf (svref docs 0) (decode-hex "F6")) (group-buffer-process-check client keys docs arena lengths)
                         (group-buffer-process-check client (make-array 8 :initial-element (decode-hex "DEAD"))
                                                    (make-array 8 :initial-element nil) arena lengths))
                    (l:close-local client)))
                (stop-server server sb-posix:sigkill :group-buffer-confirmed))
              (multiple-value-bind (server socket)
                  (start-server data runtime version (incf stage) :script "tools/local-buffered-get-server.lisp")
                (let ((client (l:connect-local (namestring socket) :read-groups t :versions t)))
                  (unwind-protect
                       (progn
                         (group-buffer-process-check client keys docs arena lengths)
                         (check (= 11 (l:client-put client (decode-hex "BEEF") (decode-hex "F6"))) "Grouped reads consumed CSN")
                         (let ((large (arcdocdb.local.wire.tests::get-document 60000)))
                           (check (= 12 (l:client-put client (svref keys 0) large)) "Grouped overflow seed one")
                           (check (= 13 (l:client-put client (svref keys 1) large)) "Grouped overflow seed two")
                           (fill arena #xa5) (fill lengths 999)
                           (let ((seen nil))
                             (handler-case (l:client-get-group-into client (vector (svref keys 0) (svref keys 1)) arena lengths :start 4)
                               (l:request-rejected (cause) (check (= 5 (l:rejection-status cause)) "Grouped overflow status") (setf seen t)))
                             (check seen "Grouped overflow accepted"))
                           (arcdocdb.local.server.tests::rg-into-untouched arena lengths) (l:client-ping client)
                           (group-buffer-process-check client (vector (svref keys 0)) (vector large) arena lengths))
                         (multiple-value-bind (status value token) (l:client-get-version client (svref keys 1))
                           (check (and (eq status :found) (= token 13) (= 60000 (length value))) "Grouped final version")))
                    (l:close-local client)))
                (stop-server server sb-posix:sigterm :group-buffer-recovered))))))))))))
