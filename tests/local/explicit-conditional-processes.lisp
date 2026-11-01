;;;; Single public synchronous client, exact versions/flushes, SIGKILL/reopen and one lost strong response.
(in-package #:arcdocdb.local.process.tests)
(defmacro with-explicit-if-environment ((mode &optional drop) &body body)
  `(let ((old-mode (uiop:getenv "ARCDOCDB_EXPLICIT_CONDITIONAL_MODE"))
         (old-drop (uiop:getenv "ARCDOCDB_EXPLICIT_CONDITIONAL_DROP_REPLY")))
     (unwind-protect
          (progn (sb-posix:setenv "ARCDOCDB_EXPLICIT_CONDITIONAL_MODE" (string-downcase (symbol-name ,mode)) 1)
                 (sb-posix:setenv "ARCDOCDB_EXPLICIT_CONDITIONAL_DROP_REPLY" (if ,drop "1" "0") 1) ,@body)
       (flet ((restore (name value) (if value (sb-posix:setenv name value 1) (sb-posix:unsetenv name))))
         (restore "ARCDOCDB_EXPLICIT_CONDITIONAL_MODE" old-mode) (restore "ARCDOCDB_EXPLICIT_CONDITIONAL_DROP_REPLY" old-drop)))))
(defun explicit-if-records (server)
  (let ((text (uiop:read-file-string (child-stderr server))) (cursor 0) (rows nil) (*read-eval* nil))
    (loop for start = (search "(:KIND :EXPLICIT-CONDITIONAL-REQUEST" text :start2 cursor) while start do
      (multiple-value-bind (form end) (read-from-string text nil nil :start start) (push form rows) (setf cursor end))) (reverse rows)))
(defun explicit-if-check-current (client keys documents tokens)
  (dotimes (i 8)
    (multiple-value-bind (status document token) (l:client-get-version client (svref keys i))
      (check (and (eq status (if (svref documents i) :found :absent)) (equalp document (svref documents i))
                  (= token (aref tokens i))) "Explicit conditional current result ~D" i))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-TXS-003 REQ-WAL-002 REQ-WAL-006 REQ-REC-001 REQ-IDX-013
(deftest test-REQ-TXS-002-explicit-if-real-single-client-mixed-SIGKILL-and-reopen
  (call-with-run
   (lambda ()
     (let ((runtime (subdirectory "explicit-if-runtime/")))
       (dolist (version '(1 2)) (dolist (mode '(:resident :paged))
         (scenario :explicit-if-strong version
           (lambda ()
             (with-explicit-if-environment (mode)
               (let* ((data (subdirectory (format nil "explicit-if-v~D-~A/" version mode))) (stage (if (eq mode :resident) 800 810))
                      (ops (explicit-client-operations)) (keys (map 'simple-vector #'automatic-local-key #(0 1 2 3 4 5 6 7)))
                      (expected (make-array 8 :element-type '(unsigned-byte 64) :initial-element 0))
                      (tokens (make-array 8 :element-type '(unsigned-byte 64) :initial-element 999))
                      (flags (make-array 8 :element-type '(unsigned-byte 8) :initial-element 204))
                      (documents (make-array 8 :initial-element (decode-hex "182A"))))
                 (multiple-value-bind (server socket)
                     (start-server data runtime version stage :create t :index-budget 8388608 :script "tools/local-conditional-request-server.lisp")
                   (let ((client (l:connect-local (namestring socket) :conditional-groups t :versions t :read-groups t :write-groups t)))
                     (unwind-protect
                          (progn
                            (check (= 8 (l:client-write-group-if client ops expected tokens flags)) "Initial explicit conditional count")
                            (dotimes (i 8) (check (= (1+ i) (aref tokens i)) "Initial explicit conditional CSN") (setf (aref expected i) (if (evenp i) (aref tokens i) 0)))
                            (dotimes (i 8)
                              (when (evenp i)
                                (setf (svref documents i) (unless (zerop (mod i 4)) (decode-hex "F6"))
                                      (svref ops i) (arcdocdb.engine:crea-operazione-scrittura
                                                     (if (svref documents i) :put :delete) (svref keys i) (svref documents i)))))
                            (check (= 4 (l:client-write-group-if client ops expected tokens flags)) "Mixed explicit conditional count")
                            (dotimes (i 8)
                              (check (and (= (if (evenp i) 1 0) (aref flags i))
                                          (= (if (evenp i) (+ 9 (/ i 2)) (1+ i)) (aref tokens i))) "Mixed explicit conditional result")
                              (unless (svref documents i) (setf (aref tokens i) 0)))
                            (explicit-if-check-current client keys documents tokens)
                            (fill expected #xffffffffffffffff)
                            (check (zerop (l:client-write-group-if client ops expected tokens flags)) "All-conflict explicit conditional count")
                            (check (every #'zerop flags) "All-conflict flags") (explicit-if-check-current client keys documents tokens))
                       (l:close-local client)))
                   (check (equal '(1 1 0) (mapcar (lambda (row) (getf row :flushes)) (explicit-if-records server))) "Explicit conditional flushes")
                   (check (search (format nil "EXPLICIT-CONDITIONAL-MODE ~A" mode) (uiop:read-file-string (child-stderr server))) "Unproved primary mode")
                   (stop-server server sb-posix:sigkill :explicit-if-strong-acknowledged))
                 (multiple-value-bind (server socket)
                     (start-server data runtime version (1+ stage) :index-budget 8388608 :script "tools/local-conditional-request-server.lisp")
                   (let ((client (l:connect-local (namestring socket) :versions t)))
                     (unwind-protect
                          (progn (explicit-if-check-current client keys documents tokens)
                                 (check (= 13 (l:client-put client (svref keys 0) (decode-hex "F6"))) "Explicit conditional next CSN"))
                       (l:close-local client)))
                   (stop-server server sb-posix:sigterm :explicit-if-recovered))))))))))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-TXS-003 REQ-WAL-006 REQ-REC-001 REQ-IDX-013
(deftest test-REQ-WAL-006-explicit-if-real-lost-response-SIGKILL-and-explicit-conflict-probe
  (call-with-run
   (lambda ()
     (let ((runtime (subdirectory "explicit-if-loss-runtime/")))
       (dolist (version '(1 2)) (dolist (mode '(:resident :paged))
         (scenario :explicit-if-lost-response version
           (lambda ()
             (let* ((data (subdirectory (format nil "explicit-if-loss-v~D-~A/" version mode))) (stage (if (eq mode :resident) 850 860))
                    (ops (explicit-client-operations)) (keys (map 'simple-vector #'automatic-local-key #(0 1 2 3 4 5 6 7)))
                    (expected (make-array 8 :element-type '(unsigned-byte 64) :initial-element 0))
                    (tokens (make-array 8 :element-type '(unsigned-byte 64) :initial-element 999))
                    (flags (make-array 8 :element-type '(unsigned-byte 8) :initial-element 204)))
               (with-explicit-if-environment (mode t)
                 (multiple-value-bind (server socket)
                     (start-server data runtime version stage :create t :index-budget 8388608 :script "tools/local-conditional-request-server.lisp")
                   (let ((client (l:connect-local (namestring socket) :conditional-groups t)) (unknown nil))
                     (unwind-protect
                          (progn
                            (handler-case (l:client-write-group-if client ops expected tokens flags) (l:outcome-unknown () (setf unknown t)))
                            (check (and unknown (eq :closed (l::local-client-state client))) "Lost explicit conditional reply acknowledged")
                            (check (and (every (lambda (v) (= 999 v)) tokens) (every (lambda (v) (= 204 v)) flags)) "Partial explicit conditional output"))
                       (l:close-local client)))
                   (check (search "EXPLICIT-CONDITIONAL-RESPONSE-DROPPED" (uiop:read-file-string (child-stderr server))) "Missing response-loss injection")
                   (check (equal '(1) (mapcar (lambda (row) (getf row :flushes)) (explicit-if-records server))) "Lost request flush")
                   (stop-server server sb-posix:sigkill :explicit-if-lost-strong-response)))
               (with-explicit-if-environment (mode)
                 (multiple-value-bind (server socket)
                     (start-server data runtime version (1+ stage) :index-budget 8388608 :script "tools/local-conditional-request-server.lisp")
                   (let ((client (l:connect-local (namestring socket) :conditional-groups t :versions t)))
                     (unwind-protect
                          (progn
                            ;; Deliberate application-level absence probe after uncertainty; the client never retries automatically.
                            (check (zerop (l:client-write-group-if client ops expected tokens flags)) "Lost request repeated writes")
                            (dotimes (i 8) (check (and (zerop (aref flags i)) (= (1+ i) (aref tokens i))) "Lost request durable token"))
                            (explicit-if-check-current client keys (make-array 8 :initial-element (decode-hex "182A")) tokens)
                            (check (= 9 (l:client-delete client (svref keys 0))) "Lost request retried or consumed conflict CSN"))
                       (l:close-local client)))
                   (check (equal '(0) (mapcar (lambda (row) (getf row :flushes)) (explicit-if-records server))) "Conflict probe flushed")
                   (stop-server server sb-posix:sigterm :explicit-if-loss-recovered))))))))))))
