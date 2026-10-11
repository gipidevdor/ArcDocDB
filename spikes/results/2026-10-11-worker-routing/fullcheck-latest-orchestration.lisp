(:SCHEMA-VERSION 1 :KIND :WORKER-ROUTING-ORCHESTRATION-BUNDLE :VERSION "latest-main-general-check"
 :SOURCES
 ((:PATH
   #A((132) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/routing-latest-check-runner.sh")
   :BYTES 363 :SHA256 "9010698d4a47344f9eac3e708a6306c7486ae1efc91a657940bfe1fbf55e8c97" :GIT-BLOB
   "93207b19dc23bbadb8c9a9f20ac4f93699fdfcf4" :TEXT "#!/bin/sh
exec /opt/homebrew/bin/sbcl --dynamic-space-size 2048 --noinform --no-userinit --no-sysinit --script tools/record-command.lisp -- env 'ASDF_OUTPUT_TRANSLATIONS=(:output-translations (t \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/latest-fasl/\") :ignore-inherited-configuration)' make check-core
")
  (:PATH
   #A((129) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/routing-latest-summary.lisp")
   :BYTES 5837 :SHA256 "8cd7f8f0394661036d70c9700dee4a00b574e2e6e1c259317952a6228ca4a3bd" :GIT-BLOB
   "a72dc7088d45c9a0973e48bb1741e893f357755c" :TEXT
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
  (let ((files (list #p\"spikes/out/routing-latest-check-runner.sh\"
                     #p\"spikes/out/routing-latest-summary.lisp\"
                     #p\"spikes/out/routing-fullcheck-summary.preimage.lisp\")) (summaries nil))
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
            (list :schema-version 1 :kind :routing-latest-auxiliary-source-bundle
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
       (out (format nil \"spikes/out/~D-routing-latest-projection-~D/\"
                    (get-universal-time) (sb-posix:getpid))))
  (sb-posix:mkdir out #o700)
  (multiple-value-bind (aux-summary bundle) (routing-auxiliary aux-paths)
    (let ((summary (list :schema-version 1 :kind :routing-latest-metadata-projection
                         :command (routing-fullcheck-summary path) :auxiliary aux-summary
                         :spikes (mapcar #'routing-spikes-summary spike-paths))))
      (routing-write-data (merge-pathnames \"summary.lisp\" out) summary)
      (routing-write-data (merge-pathnames \"auxiliary-bundle.lisp\" out) bundle)
      (unless (funcall (fdefinition 'compact-finished-directory) out)
        (error \"Projection compaction failed.\"))
      (format t \"~S~%~A~%\" summary out))))
")
  (:PATH
   #A((141) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/routing-fullcheck-summary.preimage.lisp")
   :BYTES 5770 :SHA256 "6db23f5490b56462eba037a1b21f25037336a7123db1bb5de0f2b4982aaa7b92" :GIT-BLOB
   "03cc7daf57715cdfe01c81a33f0267126c671768" :TEXT
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
   #A((131) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/routing-latest-integrity.lisp")
   :BYTES 1516 :SHA256 "1c1b6905a5d1d8d6809ff4b90b1e2512b2841ccf5c2a7ff8fc1aa4ff974a6c8d" :GIT-BLOB
   "5057c970ffb8eec6ac1ec1491e1bd2d14a15a4f5" :TEXT
   ";;;; Integrity projection of preserved auxiliary files; no qualification gate added.
(require :asdf)
(load \"tools/evidence-storage.lisp\")
(let* ((base (first (uiop:command-line-arguments)))
       (bundle (arcdocdb.evidence:read-evidence (merge-pathnames \"auxiliary-bundle.lisp\" base)))
       (sources (getf bundle :sources)))
  (dolist (source sources)
    (let* ((path (getf source :path))
           (text-bytes (sb-ext:string-to-octets (getf source :text) :external-format :utf-8)))
      (with-open-file (stream path :direction :input :element-type '(unsigned-byte 8))
        (let ((original (make-array (file-length stream) :element-type '(unsigned-byte 8))))
          (read-sequence original stream)
          (unless (and (= (length original) (getf source :bytes))
                       (equalp original text-bytes)
                       (string= (getf source :sha256) (arcdocdb.evidence:file-sha256 path)))
            (error \"Auxiliary byte preservation mismatch: ~A\" path))))))
  (with-open-file (stream (merge-pathnames \"integrity.lisp\" base) :direction :output :if-exists :error)
    (write (list :schema-version 1 :kind :routing-auxiliary-byte-integrity :status :ok
                 :source-count (length sources) :original-byte-comparison :equal
                 :sha256-reread :equal :scope :auxiliary-original-files-only)
           :stream stream :readably t :pretty t)
    (terpri stream))
  (format t \"Auxiliary byte integrity: ~D originals equal, SHA256 reread equal.~%\" (length sources)))
")
  (:PATH
   #A((143) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/routing-fullcheck-integrity.preimage.lisp")
   :BYTES 1522 :SHA256 "2655abe81e5ac72968c2e034d6ca8ad65aa9fbcf9d4ef914628aca2f2109d806" :GIT-BLOB
   "8b468613bf07b850869effbce4625f0d096561f7" :TEXT
   ";;;; Integrity projection of preserved auxiliary files; no qualification gate added.
(load \"tools/evidence-storage.lisp\")
(let* ((base \"spikes/out/4000712744-routing-fullcheck-projection-92144/\")
       (bundle (arcdocdb.evidence:read-evidence (merge-pathnames \"auxiliary-bundle.lisp\" base)))
       (sources (getf bundle :sources)))
  (dolist (source sources)
    (let* ((path (getf source :path))
           (text-bytes (sb-ext:string-to-octets (getf source :text) :external-format :utf-8)))
      (with-open-file (stream path :direction :input :element-type '(unsigned-byte 8))
        (let ((original (make-array (file-length stream) :element-type '(unsigned-byte 8))))
          (read-sequence original stream)
          (unless (and (= (length original) (getf source :bytes))
                       (equalp original text-bytes)
                       (string= (getf source :sha256) (arcdocdb.evidence:file-sha256 path)))
            (error \"Auxiliary byte preservation mismatch: ~A\" path))))))
  (with-open-file (stream (merge-pathnames \"integrity.lisp\" base) :direction :output :if-exists :error)
    (write (list :schema-version 1 :kind :routing-auxiliary-byte-integrity :status :ok
                 :source-count (length sources) :original-byte-comparison :equal
                 :sha256-reread :equal :scope :auxiliary-original-files-only)
           :stream stream :readably t :pretty t)
    (terpri stream))
  (format t \"Auxiliary byte integrity: ~D originals equal, SHA256 reread equal.~%\" (length sources)))
")))
