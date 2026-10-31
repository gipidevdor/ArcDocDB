;;;; Executable public-API example. Uses only a newly created private temporary directory.
(require :asdf)
(defparameter *example-root* (uiop:pathname-parent-directory-pathname
                            (uiop:pathname-directory-pathname *load-truename*)))
(asdf:initialize-output-translations
 `(:output-translations (t (,(merge-pathnames "_build/docs/runtime-cache/" *example-root*) :implementation))
                        :ignore-inherited-configuration))
(asdf:load-asd (merge-pathnames "arcdocdb.asd" *example-root*))
(asdf:load-system "arcdocdb/local")

(defun example-octets (&rest values)
  (make-array (length values) :element-type '(unsigned-byte 8) :initial-contents values))

(defun example-service (data runtime create action)
  "Start one local service, run ACTION with its public client, then join the service."
  (let* ((ready (sb-thread:make-semaphore)) (stop (sb-thread:make-semaphore))
         (failure nil) (path (namestring (merge-pathnames "service.sock" runtime)))
         ;; Fixed identities belong only to this disposable example. Reopen uses the same identities.
         (archive-id (make-array 16 :element-type '(unsigned-byte 8) :initial-element 73))
         (series-id (make-array 16 :element-type '(unsigned-byte 8) :initial-element 41))
         (thread (sb-thread:make-thread
                  (lambda ()
                    (handler-case
                        (arcdocdb.local:serve-local data archive-id series-id path :create create
                          :ready (lambda () (sb-thread:signal-semaphore ready) nil)
                          :stop (lambda () (sb-thread:try-semaphore stop)))
                      (error (condition) (setf failure condition) (sb-thread:signal-semaphore ready)))
                    :finished)
                  :name "ArcDocDB documentation example")))
    (unwind-protect
         (progn
           (unless (sb-thread:wait-on-semaphore ready :timeout 30)
             (error "The example service did not become ready."))
           (when failure (error failure))
           (let ((client (arcdocdb.local:connect-local path)))
             (unwind-protect (funcall action client) (arcdocdb.local:close-local client))))
      (sb-thread:signal-semaphore stop)
      (unless (eq :finished (sb-thread:join-thread thread :timeout 30 :default :timed-out))
        (error "The example service did not stop; preserve its temporary directory."))
      (when failure (error failure)))))

(uiop:with-temporary-file (:pathname marker :directory (user-homedir-pathname) :prefix ".adb-example-")
  (let* ((root (uiop:ensure-directory-pathname (concatenate 'string (namestring (truename marker)) "-data/")))
         (data (merge-pathnames "storage/" root)) (runtime (merge-pathnames "runtime/" root))
         (key (example-octets 7)) (document (example-octets #x18 #x2a)) ; canonical CBOR integer 42
         (success nil))
    (sb-posix:mkdir (namestring root) #o700)
    (sb-posix:mkdir (namestring data) #o700)
    (sb-posix:mkdir (namestring runtime) #o700)
    (unwind-protect
         (progn
           (example-service data runtime t
             (lambda (client)
               (assert (= 1 (arcdocdb.local:client-put client key document)))
               (multiple-value-bind (status bytes) (arcdocdb.local:client-get client key)
                 (assert (eq status :found)) (assert (equalp bytes document)))))
           (example-service data runtime nil
             (lambda (client)
               (multiple-value-bind (status bytes) (arcdocdb.local:client-get client key)
                 (assert (eq status :found)) (assert (equalp bytes document)))
               (assert (= 2 (arcdocdb.local:client-delete client key)))
               (multiple-value-bind (status bytes) (arcdocdb.local:client-get client key)
                 (assert (eq status :absent)) (assert (null bytes)))))
           (setf success t)
           (format t "Public Lisp example passed: Unix socket, PUT/GET, reopen, DELETE and absence.~%"))
      (if success
          (uiop:delete-directory-tree root :validate t)
          (format *error-output* "Example directory preserved for diagnosis: ~A~%" root)))))
