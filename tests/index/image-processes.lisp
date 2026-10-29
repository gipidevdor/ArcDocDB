;;; OWNER: harness C4, processi isolati e directory esclusive; oracolo dalla fonte fixture, non dal footer.
;;; REQ: REQ-IDX-010 REQ-REC-001 REQ-AFF-003
(in-package #:arcdocdb.index.page.tests)
(declaim (optimize (safety 3) (speed 2) (debug 3)))

(defun image-process-main (arguments)
  (destructuring-bind (mode path stage) arguments
    (let* ((directory (uiop:ensure-directory-pathname path)) (size 4096)
           (keys (list (lookup-key 1) (bytes 65535 127))) (source (image-source 2))
           (phase (cond ((string= stage "before-footer") :before-footer)
                        ((string= stage "after-footer") :after-footer)
                        ((string= stage "after-flush") :after-flush)
                        (t (error "Frontiera sconosciuta")))))
      (cond
        ((string= mode "write")
         (write-image-fixture directory size keys :source source
           :observer (lambda (step)
                       (when (eq step phase)
                         (format t "~&IMAGE-CRASH-READY ~S~%" step) (finish-output)
                         (sb-posix:kill (sb-posix:getpid) sb-posix:sigkill)
                         (error "SIGKILL non eseguito")) nil))
         (error "Frontiera non raggiunta"))
        ((string= mode "verify")
         (let* ((file-path (merge-pathnames "image.tmp" directory))
                (before (with-open-file (s file-path :element-type '(unsigned-byte 8))
                          (let ((b (bytes (file-length s)))) (read-sequence b s) b))))
           (with-image-input (file eof directory)
             (if (eq phase :before-footer)
                 (signals arcdocdb.conditions:arcdocdb-error
                          (p:recupera-immagine-pagine file eof size source 0 0 (image-validator keys)))
                 (let* ((image (p:recupera-immagine-pagine file eof size source 0 0 (image-validator keys) :frames 1))
                        (view (p:crea-vista-indice-paginato source)) (words (lookup-words)))
                   (p:pubblica-immagine-verificata view image)
                   (dolist (key keys)
                     (is (eq :live (p:leggi-vista-indice-paginato view key 0 (length key) words)))))))
           (with-open-file (s file-path :element-type '(unsigned-byte 8))
             (let ((after (bytes (file-length s)))) (read-sequence after s) (is (equalp before after))))
           (format t "~&IMAGE-RESTART-VERIFIED ~S~%" phase)))
        (t (error "Modo sconosciuto"))))))

(defun image-process-child (directory mode stage expected-status expected-code)
  (let* ((name (concatenate 'string mode "-" stage))
         (out (merge-pathnames (concatenate 'string name ".stdout") directory))
         (err (merge-pathnames (concatenate 'string name ".stderr") directory))
         (process (sb-ext:run-program (namestring sb-ext:*runtime-pathname*)
                    (list "--noinform" "--no-userinit" "--no-sysinit" "--script"
                          (namestring (asdf:system-relative-pathname "arcdocdb" "tools/index-image-crash.lisp"))
                          mode (namestring directory) stage) :wait nil :output out :error err)))
    (unwind-protect
         (progn
           (sb-ext:with-timeout 60 (sb-ext:process-wait process))
           (write-string (uiop:read-file-string out)) (write-string (uiop:read-file-string err))
           (format t "~&IMAGE-CHILD ~A ~A status=~S code=~S~%" mode stage
                   (sb-ext:process-status process) (sb-ext:process-exit-code process))
           (is (eq (sb-ext:process-status process) expected-status))
           (is (eql (sb-ext:process-exit-code process) expected-code))
           (is (search (if (string= mode "write") "IMAGE-CRASH-READY" "IMAGE-RESTART-VERIFIED")
                       (uiop:read-file-string out))))
      (when (member (sb-ext:process-status process) '(:running :stopped))
        (sb-ext:process-kill process sb-posix:sigkill)
        (sb-ext:with-timeout 5 (sb-ext:process-wait process)))
      (sb-ext:process-close process))))

(deftest req-idx-010-sigkill-prima-dopo-footer-flush-e-recovery-readonly
  (dolist (stage '("before-footer" "after-footer" "after-flush"))
    (arcdocdb.io.tests::with-directory (directory)
      (image-process-child directory "write" stage :signaled sb-posix:sigkill)
      (image-process-child directory "verify" stage :exited 0))))
