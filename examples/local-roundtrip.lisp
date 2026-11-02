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
           (let ((client (arcdocdb.local:connect-local path :read-groups t :versions t)))
             (unwind-protect (funcall action client) (arcdocdb.local:close-local client))))
      (sb-thread:signal-semaphore stop)
      (unless (eq :finished (sb-thread:join-thread thread :timeout 30 :default :timed-out))
        (error "The example service did not stop; preserve its temporary directory."))
      (when failure (error failure)))))

(defun example-group-buffer (client keys target lengths present)
  (multiple-value-bind (count total) (arcdocdb.local:client-get-group-into client keys target lengths)
    (assert (= count 3)) (assert (= total (if present 4 0)))
    (assert (= (aref lengths 0) (if present 2 0))) (assert (zerop (aref lengths 1)))
    (assert (= (aref lengths 2) (if present 2 0)))
    (assert (= #x18 (aref target 0))) (assert (= #x2a (aref target 1)))
    (assert (= #x18 (aref target 2))) (assert (= #x2a (aref target 3)))))

(uiop:with-temporary-file (:pathname marker :directory (user-homedir-pathname) :prefix ".adb-example-")
  (let* ((root (uiop:ensure-directory-pathname (concatenate 'string (namestring (truename marker)) "-data/")))
         (data (merge-pathnames "storage/" root)) (runtime (merge-pathnames "runtime/" root))
         (key (example-octets 7)) (document (example-octets #x18 #x2a)) ; canonical CBOR integer 42
         (read-keys (vector key (example-octets 8) key))
         (read-lengths (make-array 8 :element-type '(unsigned-byte 64) :initial-element 0))
         (read-buffer (make-array arcdocdb.local:+server-max-frame+ :element-type '(unsigned-byte 8) :initial-element 0))
         (success nil))
    (sb-posix:mkdir (namestring root) #o700)
    (sb-posix:mkdir (namestring data) #o700)
    (sb-posix:mkdir (namestring runtime) #o700)
    (unwind-protect
         (progn
           (example-service data runtime t
             (lambda (client)
               (assert (= 1 (arcdocdb.local:client-put client key document)))
               (multiple-value-bind (status size) (arcdocdb.local:client-get-into client key read-buffer)
                 (assert (eq status :found)) (assert (= size 2))
                 (assert (= #x18 (aref read-buffer 0))) (assert (= #x2a (aref read-buffer 1))))
               (multiple-value-bind (status bytes) (arcdocdb.local:client-get client key)
                 (assert (eq status :found)) (assert (equalp bytes document)))
               (example-group-buffer client read-keys read-buffer read-lengths t)
               (multiple-value-bind (status size token) (arcdocdb.local:client-get-version-into client key read-buffer)
                 (assert (eq status :found)) (assert (= size 2)) (assert (= token 1))
                 (multiple-value-bind (result next) (arcdocdb.local:client-put-if client key document token)
                   (assert (eq result :applied)) (assert (= next 2)))
                 (multiple-value-bind (result current) (arcdocdb.local:client-delete-if client key token)
                   (assert (eq result :conflict)) (assert (= current 2))))))
           (example-service data runtime nil
             (lambda (client)
               (multiple-value-bind (status bytes) (arcdocdb.local:client-get client key)
                 (assert (eq status :found)) (assert (equalp bytes document)))
               (multiple-value-bind (status size) (arcdocdb.local:client-get-into client key read-buffer)
                 (assert (eq status :found)) (assert (= size 2)))
               (example-group-buffer client read-keys read-buffer read-lengths t)
               (multiple-value-bind (status size token) (arcdocdb.local:client-get-version-into client key read-buffer)
                 (assert (eq status :found)) (assert (= size 2)) (assert (= token 2)))
               (assert (= 3 (arcdocdb.local:client-delete client key)))
               (multiple-value-bind (status bytes) (arcdocdb.local:client-get client key)
                 (assert (eq status :absent)) (assert (null bytes)))
               (multiple-value-bind (status size) (arcdocdb.local:client-get-into client key read-buffer)
                 (assert (eq status :absent)) (assert (zerop size))
                 (assert (= #x18 (aref read-buffer 0))) (assert (= #x2a (aref read-buffer 1))))
               (example-group-buffer client read-keys read-buffer read-lengths nil)
               (multiple-value-bind (status size token) (arcdocdb.local:client-get-version-into client key read-buffer)
                 (assert (eq status :absent)) (assert (zerop size)) (assert (zerop token))
                 (assert (= #x18 (aref read-buffer 0))) (assert (= #x2a (aref read-buffer 1))))))
           (setf success t)
           (format t "Public Lisp example passed: Unix socket, single/group/versioned read buffers, conditional writes, reopen and absence.~%"))
      (if success
          (uiop:delete-directory-tree root :validate t)
          (format *error-output* "Example directory preserved for diagnosis: ~A~%" root)))))
