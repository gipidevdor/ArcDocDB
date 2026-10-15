;;;; Parent C4: deadline, SIGKILL verificato e output dei figli conservato nello stdout.
(in-package #:arcdocdb.vertical.tests)
(declaim (optimize (safety 3) (speed 2) (debug 3)))

(defun child (root version stage mode expected-status expected-code)
  (let* ((name (format nil "~A-~A" mode stage))
         (stdout (merge-pathnames (format nil "~A.stdout" name) root))
         (stderr (merge-pathnames (format nil "~A.stderr" name) root))
         (arguments (list "--noinform" "--no-userinit" "--no-sysinit" "--script"
                          (namestring (asdf:system-relative-pathname "arcdocdb" "tools/vertical-crash.lisp"))
                          mode (namestring root) (write-to-string version) (string-downcase stage)))
         (process (sb-ext:run-program (first sb-ext:*posix-argv*) arguments :search t :wait nil
                                     :output stdout :error stderr)))
    (unwind-protect
         (progn
           (sb-ext:with-timeout 60 (sb-ext:process-wait process))
           (format t "~&CHILD v~D ~A status=~S code=~S~%" version name
                   (sb-ext:process-status process) (sb-ext:process-exit-code process))
           (let ((text (uiop:read-file-string stdout)) (errors (uiop:read-file-string stderr)))
             (write-string text)
             (write-string errors)
             (when (string= mode "verify-wrong")
               (is (search "VERTICAL-ORACLE-MISMATCH" errors)))
             (when (string= mode "write")
               (is (search (format nil "CRASH-READY ~S"
                                   (if (eq stage :prepared) :checkpoint-prepared stage)) text))))
           (is (eq expected-status (sb-ext:process-status process)))
           (is (= expected-code (sb-ext:process-exit-code process))))
      (when (member (sb-ext:process-status process) '(:running :stopped))
        (sb-ext:process-kill process sb-posix:sigkill)
        (sb-ext:process-wait process))
      (sb-ext:process-close process))))

(defun scenario (version stage &optional negative)
  (let ((root (arcdocdb.get.active.tests::active-fresh-root)))
    (unwind-protect
         (progn
           (child root version stage "write" :signaled sb-posix:sigkill)
           (child root version stage "recover" :exited 0)
           (child root version stage "verify" :exited 0)
           (when negative (child root version stage "verify-wrong" :exited 1)))
      (uiop:delete-directory-tree root :validate t))))

;;; REQ: REQ-REC-001 REQ-WAL-006 REQ-IDX-001 REQ-STO-003 REQ-AFF-001 REQ-AFF-018
(defun test-REQ-REC-001-vertical-native-SIGKILL-reopen-v1-v2 ()
  (dolist (version '(1 2))
    (dolist (stage '(:committed :tail :prepared :rotated))
      (scenario version stage)
      (format t "~&VERTICAL v~D ~S PASS~%" version stage))))

;;; REQ: REQ-VAL-001 REQ-AFF-012
(defun test-REQ-VAL-001-vertical-oracle-rejects-wrong-value ()
  (scenario 2 :committed t))

(defun run ()
  (test-REQ-REC-001-vertical-native-SIGKILL-reopen-v1-v2)
  (format t "ok    test-REQ-REC-001-vertical-native-SIGKILL-reopen-v1-v2~%")
  (test-REQ-VAL-001-vertical-oracle-rejects-wrong-value)
  (format t "ok    test-REQ-VAL-001-vertical-oracle-rejects-wrong-value~%")
  (format t "2 test verticali superati; 8 scenari positivi e controllo negativo.~%")
  t)
