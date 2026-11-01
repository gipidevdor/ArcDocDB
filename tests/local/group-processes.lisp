;;;; Real negotiated client, strong completion, SIGKILL and lost response at the product boundary.
(in-package #:arcdocdb.local.process.tests)

(defun explicit-client-operations ()
  (let ((ops (make-array 8)))
    (dotimes (i 8 ops)
      (setf (svref ops i) (arcdocdb.engine:crea-operazione-scrittura :put (automatic-local-key i) (decode-hex "182A"))))))
(defun explicit-check-values (socket)
  (let ((client (l:connect-local (namestring socket))))
    (unwind-protect
         (dotimes (i 8)
           (multiple-value-bind (status doc) (l:client-get client (automatic-local-key i))
             (check (and (eq status :found) (equalp doc (decode-hex "182A"))) "Lost explicit write ~D" i)))
      (l:close-local client))))

;;; REQ: REQ-IPC-002 REQ-WAL-002 REQ-WAL-006 REQ-REC-001
(deftest test-REQ-WAL-006-explicit-Unix-strong-group-SIGKILL-reopen-and-next-CSN
  (call-with-run
   (lambda ()
     (let ((runtime (subdirectory "explicit-runtime/")))
       (dolist (version '(1 2))
         (scenario :explicit-strong-group version
           (lambda ()
             (let ((data (subdirectory (format nil "explicit-v~D/" version))))
               (multiple-value-bind (server socket)
                   (start-server data runtime version 210 :create t :script "tools/local-group-server.lisp")
                 (let ((client (l:connect-local (namestring socket) :write-groups t))
                       (out (make-array 8 :element-type '(unsigned-byte 64))))
                   (unwind-protect
                        (progn
                          (check (= 8 (l:client-write-group client (explicit-client-operations) out)) "Explicit count")
                          (dotimes (i 8) (check (= (1+ i) (aref out i)) "Explicit CSN")))
                     (l:close-local client)))
                 (check (= 1 (count "GROUP-FLUSH 8" (uiop:split-string (uiop:read-file-string (child-stderr server))
                                                     :separator '(#\Newline)) :test #'equal)) "Expected one strong flush")
                 (stop-server server sb-posix:sigkill :explicit-strong-acknowledged))
               (multiple-value-bind (server socket) (start-server data runtime version 211)
                 (explicit-check-values socket)
                 (let ((client (l:connect-local (namestring socket))))
                   (unwind-protect (check (= 9 (l:client-delete client (automatic-local-key 0))) "Explicit next CSN")
                     (l:close-local client)))
                 (stop-server server sb-posix:sigterm :explicit-recovered))))))))))

;;; REQ: REQ-IPC-002 REQ-WAL-006 REQ-REC-001
(deftest test-REQ-WAL-006-explicit-Unix-response-lost-after-strong-no-retry
  (call-with-run
   (lambda ()
     (let ((runtime (subdirectory "explicit-loss-runtime/")))
       (dolist (version '(1 2))
         (scenario :explicit-lost-response version
           (lambda ()
             (let ((data (subdirectory (format nil "explicit-loss-v~D/" version))))
               (multiple-value-bind (server socket)
                   (start-server data runtime version 220 :create t :script "tools/local-fault-server.lisp" :expected-failure t)
                 (let ((client (l:connect-local (namestring socket) :write-groups t))
                       (out (make-array 8 :element-type '(unsigned-byte 64) :initial-element 999)) (caught nil))
                   (unwind-protect
                        (progn
                          (handler-case (l:client-write-group client (explicit-client-operations) out)
                            (l:outcome-unknown () (setf caught t)))
                          (check caught "Lost group falsely acknowledged")
                          (check (every (lambda (n) (= n 999)) out) "Partial output escaped")
                          (check (eq :closed (l::local-client-state client)) "Lost group client still open"))
                     (l:close-local client)))
                 (wait-exit server)
                 (check (and (eq :exited (sb-ext:process-status (child-process server)))
                             (eql 1 (sb-ext:process-exit-code (child-process server)))
                             (search "LOCAL-AFTER-COMMIT" (uiop:read-file-string (child-stderr server))))
                        "Wrong explicit response fault")
                 (setf (child-outcome server) :pass) (close-child server))
               (multiple-value-bind (server socket) (start-server data runtime version 221)
                 (explicit-check-values socket)
                 (let ((client (l:connect-local (namestring socket))))
                   (unwind-protect (check (= 9 (l:client-delete client (automatic-local-key 0))) "Lost group retried or missing")
                     (l:close-local client)))
                 (stop-server server sb-posix:sigterm :explicit-loss-recovered))))))))))
