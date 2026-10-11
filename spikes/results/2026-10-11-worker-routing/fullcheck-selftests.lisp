(:SCHEMA-VERSION 1 :KIND :ROUTING-FULLCHECK-AUXILIARY-SOURCE-BUNDLE :SCOPE
 (:ORIGINAL-FILES :NO-RECONSTRUCTION :NO-NEW-C4-GATE) :SOURCES
 ((:PATH
   #A((139) BASE-CHAR
      . "/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/routing-fullcheck-summary.lisp")
   :BYTES 5770 :SHA256
   "6db23f5490b56462eba037a1b21f25037336a7123db1bb5de0f2b4982aaa7b92" :TEXT
   ";;;; Metadata projection only; preserves self-test source files as original bytes.
(require :asdf)
(require :sb-posix)
(load \"tools/evidence-storage.lisp\")
(load \"tools/finish-evidence.lisp\")

(defun routing-file-text (path)
  (with-open-file (stream path :direction :input :external-format :utf-8)
    (let ((text (make-string (file-length stream))))
      (subseq text 0 (read-sequence text stream)))))

(defun routing-original-file (path)
  (list :path (namestring (truename path))
        :bytes (arcdocdb.evidence:file-bytes path)
        :sha256 (arcdocdb.evidence:file-sha256 path)
        :text (routing-file-text path)))

(defun routing-write-data (path data)
  (with-open-file (stream path :direction :output :if-exists :error :external-format :utf-8)
    (let ((*print-readably* t)) (write data :stream stream :pretty t) (terpri stream))))

(defun routing-fullcheck-summary (path)
  (let* ((record (arcdocdb.evidence:read-evidence path))
         (lines (uiop:split-string (or (getf record :stdout) \"\") :separator '(#\\Newline)))
         (stderr (or (getf record :stderr) \"\")))
    (list :report (namestring (truename path))
          :status (getf record :status) :exit-code (getf record :exit-code)
          :source-consistency (getf record :source-consistency)
          :source-count (length (getf record :source-blobs-before))
          :wall-seconds (getf record :wall-seconds)
          :command (getf record :command)
          :named-tests (count-if (lambda (line) (uiop:string-prefix-p \"ok    TEST-\" line)) lines)
          :smoke (count-if (lambda (line) (or (search \"ok    package ARCDOCDB\" line)
                                             (search \"ok    ARCDOCDB:*VERSION*\" line))) lines)
          :suite-summaries (remove-if-not (lambda (line) (and (search \"test\" line)
                                                            (search \"superati.\" line))) lines)
          :gate-lines (remove-if-not (lambda (line) (or (search \"nessun avviso\" line)
                                                       (search \"spike completati\" line)
                                                       (search \"fixture processi\" line))) lines)
          :stdout-bytes (length (sb-ext:string-to-octets (or (getf record :stdout) \"\") :external-format :utf-8))
          :stderr-bytes (length (sb-ext:string-to-octets stderr :external-format :utf-8))
          :stderr-warning-lines
          (remove-if-not (lambda (line) (or (search \"WARNING\" line)
                                          (search \"unhandled\" line)))
                         (uiop:split-string stderr :separator '(#\\Newline))))))

(defun routing-auxiliary (paths)
  (let ((files (list #p\"spikes/out/routing-fullcheck-runner.sh\"
                     #p\"spikes/out/routing-fullcheck-summary.lisp\")) (summaries nil))
    (dolist (path paths)
      (let ((record (arcdocdb.evidence:read-evidence path)))
        (push path files)
        (push (list :report (namestring (truename path)) :kind (getf record :kind)
                    :status (getf record :status) :worker-errors (getf record :worker-errors)
                    :children
                    (loop for child in (getf record :mutants)
                          for execution = (getf child :execution)
                          collect (list :name (getf child :name) :result (getf child :result)
                                        :exit-code (getf execution :exit-code)
                                        :signal (getf execution :signal)
                                        :timed-out (getf execution :timed-out)))) summaries)
        (dolist (child (getf record :mutants))
          (let ((execution (getf child :execution)))
            (dolist (key '(:runner :stdout-log :stderr-log))
              (push (getf execution key) files))))))
    (values (nreverse summaries)
            (list :schema-version 1 :kind :routing-fullcheck-auxiliary-source-bundle
                  :scope '(:original-files :no-reconstruction :no-new-C4-gate)
                  :sources (mapcar #'routing-original-file (nreverse files))))))

(defun routing-spikes-summary (path)
  (let ((record (arcdocdb.evidence:read-evidence path)))
    (list :report (namestring (truename path)) :status (getf record :status)
          :runs (loop for entry in (getf record :runs)
                      collect (list :id (getf entry :id) :status (getf entry :status)
                                    :exit-code (getf entry :exit-code)
                                    :source-consistency (getf entry :source-consistency)
                                    :stderr-bytes (length (or (getf entry :stderr) \"\")))))))

(let* ((args (uiop:command-line-arguments))
       (path (first args))
       (aux-paths (append (directory \"spikes/out/*-snapshot-self-test-*/report.lisp\")
                          (directory \"spikes/out/*-reader-self-test-*/report.lisp\")))
       (spike-paths (directory \"spikes/out/*-check-*/report.lisp\"))
       (out (format nil \"spikes/out/~D-routing-fullcheck-projection-~D/\"
                    (get-universal-time) (sb-posix:getpid))))
  (sb-posix:mkdir out #o700)
  (multiple-value-bind (aux-summary bundle) (routing-auxiliary aux-paths)
    (let ((summary (list :schema-version 1 :kind :routing-fullcheck-metadata-projection
                         :command (routing-fullcheck-summary path) :auxiliary aux-summary
                         :spikes (mapcar #'routing-spikes-summary spike-paths))))
      (routing-write-data (merge-pathnames \"summary.lisp\" out) summary)
      (routing-write-data (merge-pathnames \"auxiliary-bundle.lisp\" out) bundle)
      (unless (funcall (fdefinition 'compact-finished-directory) out)
        (error \"Projection compaction failed.\"))
      (format t \"~S~%~A~%\" summary out))))
")
  (:PATH
   #A((136) BASE-CHAR
      . "/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/routing-fullcheck-runner.sh")
   :BYTES 426 :SHA256
   "19ff087b3b8d70efbe28353ce05c090779b97f091c6affeecda81a9616814305" :TEXT
   "#!/bin/sh
# C4 qualification of the frozen overlay; private ASDF cache for all children.
exec /opt/homebrew/bin/sbcl --noinform --no-userinit --no-sysinit \\
  --script tools/record-command.lisp -- env \\
  'ASDF_OUTPUT_TRANSLATIONS=(:output-translations (t \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/final-fasl/\") :ignore-inherited-configuration)' \\
  make check-core
")
  (:PATH
   #A((158) BASE-CHAR
      . "/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712563-snapshot-self-test-87426-0/report.lisp")
   :BYTES 2165 :SHA256
   "7f4bbf6e63c0f4752f78f56760d74d1cdc945917e23c2b7990a710743e649166" :TEXT
   "(:SCHEMA-VERSION 1 :KIND :SNAPSHOT-PROCESS-SELF-TEST :STATUS :PASSED
 :WORKER-ERRORS 2 :BASELINE NIL :MUTANTS
 ((:NAME :SIGNAL :RESULT :WORKER-ERROR :EXECUTION
   (:EXIT-CODE 137 :SIGNAL 9 :TIMED-OUT NIL :ARGV
    (\"sbcl\" \"--noinform\" \"--no-userinit\" \"--no-sysinit\" \"--disable-debugger\"
     \"--script\" \"isolated-build.lisp\")
    :RUNNER
    #A((173) BASE-CHAR
       . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712563-snapshot-self-test-87426-0/signal/isolated-build.lisp\")
    :STDOUT-LOG
    #A((164) BASE-CHAR
       . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712563-snapshot-self-test-87426-0/signal/stdout.log\")
    :STDERR-LOG
    #A((164) BASE-CHAR
       . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712563-snapshot-self-test-87426-0/signal/stderr.log\")
    :REPORT
    (:SCHEMA-VERSION 1 :KIND :SNAPSHOT-MUTATION-CHILD :STATUS :FAILED :PHASE
     :TESTS :FAILURE-KIND :RUNTIME :FAILED-TEST \"fixture\")))
  (:NAME :COMPLETION-EXIT :RESULT :WORKER-ERROR :EXECUTION
   (:EXIT-CODE 7 :SIGNAL NIL :TIMED-OUT NIL :ARGV
    (\"sbcl\" \"--noinform\" \"--no-userinit\" \"--no-sysinit\" \"--disable-debugger\"
     \"--script\" \"isolated-build.lisp\")
    :RUNNER
    #A((182) BASE-CHAR
       . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712563-snapshot-self-test-87426-0/completion-exit/isolated-build.lisp\")
    :STDOUT-LOG
    #A((173) BASE-CHAR
       . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712563-snapshot-self-test-87426-0/completion-exit/stdout.log\")
    :STDERR-LOG
    #A((173) BASE-CHAR
       . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712563-snapshot-self-test-87426-0/completion-exit/stderr.log\")
    :REPORT
    (:SCHEMA-VERSION 1 :KIND :SNAPSHOT-MUTATION-CHILD :STATUS :OK :PHASE
     :COMPLETE :PASSED-TESTS (\"fixture\"))))))
")
  (:PATH
   #A((173) BASE-CHAR
      . "/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712563-snapshot-self-test-87426-0/signal/isolated-build.lisp")
   :BYTES 249 :SHA256
   "a345276e3dfe377c0bbd359793165915b1527938a65250d367ce5ac079feecc1" :TEXT
   "(REQUIRE :SB-POSIX)
(WRITE
 '(:SCHEMA-VERSION 1 :KIND :SNAPSHOT-MUTATION-CHILD :STATUS :FAILED :PHASE
   :TESTS :FAILURE-KIND :RUNTIME :FAILED-TEST \"fixture\")
 :READABLY T)
(TERPRI)
(FINISH-OUTPUT)
(SB-POSIX:KILL (SB-POSIX:GETPID) SB-POSIX:SIGKILL)
")
  (:PATH
   #A((164) BASE-CHAR
      . "/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712563-snapshot-self-test-87426-0/signal/stdout.log")
   :BYTES 128 :SHA256
   "e3502e714a0530acb1f0130c4ced4a016607bcb067e3686f6f29704db8423ea5" :TEXT
   "(:SCHEMA-VERSION 1 :KIND :SNAPSHOT-MUTATION-CHILD :STATUS :FAILED :PHASE :TESTS
 :FAILURE-KIND :RUNTIME :FAILED-TEST \"fixture\")
")
  (:PATH
   #A((164) BASE-CHAR
      . "/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712563-snapshot-self-test-87426-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" :TEXT "")
  (:PATH
   #A((182) BASE-CHAR
      . "/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712563-snapshot-self-test-87426-0/completion-exit/isolated-build.lisp")
   :BYTES 199 :SHA256
   "b8bb4416a818775bae5c77341eeec2c356a2733f633ac2bc8b6ac3ff955d05e0" :TEXT
   "(REQUIRE :SB-POSIX)
(WRITE
 '(:SCHEMA-VERSION 1 :KIND :SNAPSHOT-MUTATION-CHILD :STATUS :OK :PHASE
   :COMPLETE :PASSED-TESTS (\"fixture\"))
 :READABLY T)
(TERPRI)
(FINISH-OUTPUT)
(SB-EXT:EXIT :CODE 7)
")
  (:PATH
   #A((173) BASE-CHAR
      . "/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712563-snapshot-self-test-87426-0/completion-exit/stdout.log")
   :BYTES 107 :SHA256
   "4f22544421d9012fe132a36bf15950cd327ca959b8f9c5ef3d386e0c8b62a25c" :TEXT
   "(:SCHEMA-VERSION 1 :KIND :SNAPSHOT-MUTATION-CHILD :STATUS :OK :PHASE :COMPLETE
 :PASSED-TESTS (\"fixture\"))
")
  (:PATH
   #A((173) BASE-CHAR
      . "/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712563-snapshot-self-test-87426-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" :TEXT "")
  (:PATH
   #A((156) BASE-CHAR
      . "/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712563-reader-self-test-87438-0/report.lisp")
   :BYTES 2147 :SHA256
   "102e26be255079edd6537ae4a70e58b2164c93945c9d185c00ec04b33e5ea8ac" :TEXT
   "(:SCHEMA-VERSION 1 :KIND :READER-PROCESS-SELF-TEST :STATUS :PASSED
 :WORKER-ERRORS 2 :BASELINE NIL :MUTANTS
 ((:NAME :SIGNAL :RESULT :WORKER-ERROR :EXECUTION
   (:EXIT-CODE 137 :SIGNAL 9 :TIMED-OUT NIL :ARGV
    (\"sbcl\" \"--noinform\" \"--no-userinit\" \"--no-sysinit\" \"--disable-debugger\"
     \"--script\" \"isolated-build.lisp\")
    :RUNNER
    #A((171) BASE-CHAR
       . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712563-reader-self-test-87438-0/signal/isolated-build.lisp\")
    :STDOUT-LOG
    #A((162) BASE-CHAR
       . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712563-reader-self-test-87438-0/signal/stdout.log\")
    :STDERR-LOG
    #A((162) BASE-CHAR
       . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712563-reader-self-test-87438-0/signal/stderr.log\")
    :REPORT
    (:SCHEMA-VERSION 1 :KIND :READER-MUTATION-CHILD :STATUS :FAILED :PHASE
     :TESTS :FAILURE-KIND :RUNTIME :FAILED-TEST \"fixture\")))
  (:NAME :COMPLETION-EXIT :RESULT :WORKER-ERROR :EXECUTION
   (:EXIT-CODE 7 :SIGNAL NIL :TIMED-OUT NIL :ARGV
    (\"sbcl\" \"--noinform\" \"--no-userinit\" \"--no-sysinit\" \"--disable-debugger\"
     \"--script\" \"isolated-build.lisp\")
    :RUNNER
    #A((180) BASE-CHAR
       . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712563-reader-self-test-87438-0/completion-exit/isolated-build.lisp\")
    :STDOUT-LOG
    #A((171) BASE-CHAR
       . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712563-reader-self-test-87438-0/completion-exit/stdout.log\")
    :STDERR-LOG
    #A((171) BASE-CHAR
       . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712563-reader-self-test-87438-0/completion-exit/stderr.log\")
    :REPORT
    (:SCHEMA-VERSION 1 :KIND :READER-MUTATION-CHILD :STATUS :OK :PHASE
     :COMPLETE :PASSED-TESTS (\"fixture\"))))))
")
  (:PATH
   #A((171) BASE-CHAR
      . "/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712563-reader-self-test-87438-0/signal/isolated-build.lisp")
   :BYTES 247 :SHA256
   "ff5cf55dda241d32ea1b4308172c7dc526436cbf1d546e7471148cee95a873d1" :TEXT
   "(REQUIRE :SB-POSIX)
(WRITE
 '(:SCHEMA-VERSION 1 :KIND :READER-MUTATION-CHILD :STATUS :FAILED :PHASE :TESTS
   :FAILURE-KIND :RUNTIME :FAILED-TEST \"fixture\")
 :READABLY T)
(TERPRI)
(FINISH-OUTPUT)
(SB-POSIX:KILL (SB-POSIX:GETPID) SB-POSIX:SIGKILL)
")
  (:PATH
   #A((162) BASE-CHAR
      . "/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712563-reader-self-test-87438-0/signal/stdout.log")
   :BYTES 126 :SHA256
   "3697c68fa71f124c8d05d8cc5d649a744586a10989eb2e67c5bdce6bfc760142" :TEXT
   "(:SCHEMA-VERSION 1 :KIND :READER-MUTATION-CHILD :STATUS :FAILED :PHASE :TESTS
 :FAILURE-KIND :RUNTIME :FAILED-TEST \"fixture\")
")
  (:PATH
   #A((162) BASE-CHAR
      . "/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712563-reader-self-test-87438-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" :TEXT "")
  (:PATH
   #A((180) BASE-CHAR
      . "/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712563-reader-self-test-87438-0/completion-exit/isolated-build.lisp")
   :BYTES 197 :SHA256
   "1a45dcf8a6d03f1e8866e49280c6f0edb894320c90624d5620fad1e3d546cea9" :TEXT
   "(REQUIRE :SB-POSIX)
(WRITE
 '(:SCHEMA-VERSION 1 :KIND :READER-MUTATION-CHILD :STATUS :OK :PHASE :COMPLETE
   :PASSED-TESTS (\"fixture\"))
 :READABLY T)
(TERPRI)
(FINISH-OUTPUT)
(SB-EXT:EXIT :CODE 7)
")
  (:PATH
   #A((171) BASE-CHAR
      . "/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712563-reader-self-test-87438-0/completion-exit/stdout.log")
   :BYTES 105 :SHA256
   "5e630c1b44d68ce71b27d151e76bf367e3cbd941200adc36cdd30e0fe7390531" :TEXT
   "(:SCHEMA-VERSION 1 :KIND :READER-MUTATION-CHILD :STATUS :OK :PHASE :COMPLETE
 :PASSED-TESTS (\"fixture\"))
")
  (:PATH
   #A((171) BASE-CHAR
      . "/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712563-reader-self-test-87438-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" :TEXT
   "")))
