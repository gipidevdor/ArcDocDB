;;;; C4 observability wrapper: the production service owns startup, grouping, I/O and cleanup.
(require :asdf)
(require :sb-posix)
(handler-case
    (progn
      (asdf:load-asd (merge-pathnames "../arcdocdb.asd" *load-truename*))
      (let ((*standard-output* *error-output*)) (asdf:load-system "arcdocdb/local"))
      (let ((args (uiop:command-line-arguments)) (filtered nil) (limit 8) (seen nil) (stopping nil))
        (unless (<= 4 (length args) 14) (error "Invalid C4 group-server arguments"))
        (let ((base (subseq args 0 4)))
          (setf args (nthcdr 4 args))
          (loop while args for token = (pop args) do
            (if (string= token "--test-group-limit")
                (progn
                  (unless (and (not seen) args (member (first args) '("1" "8") :test #'string=))
                    (error "Invalid C4 group limit"))
                  (setf limit (if (string= (pop args) "1") 1 8) seen t))
                (push token filtered)))
          (multiple-value-bind (create version discovery policy cache)
              (uiop:symbol-call :arcdocdb.local :server-cli-options (nreverse filtered))
            (flet ((stop-signal (signal info context) (declare (ignore signal info context)) (setf stopping t)))
              (sb-sys:enable-interrupt sb-posix:sigterm #'stop-signal)
              (sb-sys:enable-interrupt sb-posix:sigint #'stop-signal)
              (uiop:symbol-call :arcdocdb.local :serve-local (first base)
                (uiop:symbol-call :arcdocdb.local :local-unhex (third base) 16 16)
                (uiop:symbol-call :arcdocdb.local :local-unhex (fourth base) 16 16)
                (second base) :create create :version version :index-discovery discovery :index-policy policy
                :record-cache-budget cache :max-write-group limit :stop (lambda () stopping)
                :observer (lambda (engine phase)
                  (when (eq phase :after-flush)
                    (format *error-output* "~&GROUP-FLUSH ~D~%"
                      (uiop:symbol-call :arcdocdb.wal :gruppo-count (uiop:symbol-call :arcdocdb.engine :motore-group engine)))
                    (finish-output *error-output*)) nil)
                :ready (lambda () (format t "~S~%" (list :kind :local-server :state :ready :pid (sb-posix:getpid)))
                                   (finish-output) nil)))))))
  (error (condition) (format *error-output* "~&LOCAL-GROUP-SERVER-FAIL ~A: ~A~%" (type-of condition) condition)
    (sb-ext:exit :code 1)))
