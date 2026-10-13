;;;; Read-only audit of downloaded CI artifacts against an explicit Git commit.
;;;; Only the trusted evidence reader is LOADed; all reports/logs are data.
;;;; Invoke SBCL with --dynamic-space-size 2048. No tracked files are changed.
(require :asdf)
(require :sb-posix)
(declaim (optimize (safety 3) (debug 3)))
(defparameter *auditor-source* *load-truename*)

(define-condition ci-audit-error (error)
  ((message :initarg :message :reader audit-message))
  (:report (lambda (condition stream) (write-string (audit-message condition) stream))))

(defun demand (condition control &rest arguments)
  (unless condition
    (error 'ci-audit-error :message (apply #'format nil control arguments))))

(defun read-native (path)
  (uiop:symbol-call :arcdocdb.evidence :read-evidence path))

(defun native-sha256 (path)
  (uiop:symbol-call :arcdocdb.evidence :file-sha256 path))

(defun audit-process-fixture (pair kind child-kind)
  (let* ((path (car pair)) (record (cdr pair))
         (directory (uiop:pathname-directory-pathname path))
         (mutants (getf record :mutants)) (observations nil))
    (demand (and (eql 1 (getf record :schema-version)) (eq kind (getf record :kind))
                 (eq :passed (getf record :status)) (= 2 (getf record :worker-errors))
                 (null (getf record :baseline)) (= 2 (length mutants)))
            "Process fixture header/counters invalid: ~A." path)
    (demand (and (= 1 (count :signal mutants :key (lambda (entry) (getf entry :name))))
                 (= 1 (count :completion-exit mutants :key (lambda (entry) (getf entry :name)))))
            "Process fixture names missing/duplicated: ~A." path)
    (dolist (entry mutants)
      (let* ((name (getf entry :name)) (execution (getf entry :execution))
             (report (getf execution :report))
             (child (merge-pathnames (format nil "~(~A~)/" name) directory))
             (stdout (merge-pathnames "stdout.log" child))
             (stderr (merge-pathnames "stderr.log" child))
             (runner (merge-pathnames "isolated-build.lisp" child)))
        (demand (and (eq :worker-error (getf entry :result)) (null (getf execution :timed-out))
                     (eql 1 (getf report :schema-version)) (eq child-kind (getf report :kind)))
                "Process classification/schema invalid: ~A ~S." path name)
        (demand (equal (getf execution :argv)
                       '("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--disable-debugger" "--script" "isolated-build.lisp"))
                "Unexpected child argv: ~A ~S." path name)
        (dolist (file (list stdout stderr runner))
          (demand (probe-file file) "Missing native process diagnostic ~A." file))
        (dolist (field '(:runner :stdout-log :stderr-log))
          (let* ((native (getf execution field))
                 (leaf (ecase field (:runner "isolated-build.lisp") (:stdout-log "stdout.log") (:stderr-log "stderr.log")))
                 (suffix (format nil "/~(~A~)/~A" name leaf)))
            (demand (and (stringp native) (uiop:string-suffix-p native suffix))
                    "Native process path suffix invalid: ~A ~S." path field)))
        (demand (equal report (read-native stdout))
                "Raw child stdout differs from embedded native report: ~A." stdout)
        (ecase name
          (:signal
           (demand (and (eql 9 (getf execution :signal)) (eql 137 (getf execution :exit-code))
                        (eq :failed (getf report :status)) (eq :tests (getf report :phase))
                        (eq :runtime (getf report :failure-kind)) (equal "fixture" (getf report :failed-test)))
                   "SIGKILL fixture OS/runtime values invalid: ~A." path))
          (:completion-exit
           (demand (and (null (getf execution :signal)) (eql 7 (getf execution :exit-code))
                        (eq :ok (getf report :status)) (eq :complete (getf report :phase))
                        (equal '("fixture") (getf report :passed-tests)))
                   "Post-COMPLETE nonzero exit values invalid: ~A." path)))
        (push (list :name name :classification :worker-error :native-signal (getf execution :signal)
                    :native-exit-code (getf execution :exit-code) :timed-out nil
                    :raw-stdout-equals-native-report t :raw-stdout-sha256 (native-sha256 stdout)
                    :raw-stderr-sha256 (native-sha256 stderr)
                    :raw-runner-sha256 (native-sha256 runner)) observations)))
    (list :native-process-report (namestring path) :kind kind :status :passed
          :worker-errors 2 :processes (nreverse observations))))

(defun fixture-inventory (paths)
  (loop for report in paths append
        (let ((root (uiop:pathname-directory-pathname report)))
          (loop for file in (cons report
                                 (loop for name in '("signal/" "completion-exit/") append
                                       (loop for leaf in '("stdout.log" "stderr.log" "isolated-build.lisp")
                                             collect (merge-pathnames (concatenate 'string name leaf) root))))
                collect (list :path (namestring file)
                              :bytes (uiop:symbol-call :arcdocdb.evidence :file-bytes file)
                              :sha256 (native-sha256 file))))))

(let* ((commit "42dcad77530c09784f9d77fabb92ff4477927983")
       (library #p"tools/evidence-storage.lisp")
       (paths (mapcar #'truename '(#p"spikes/out/4000910623-reader-self-test-11984-0/report.lisp"
                                  #p"spikes/out/4000910623-snapshot-self-test-11981-0/report.lisp"))))
  (handler-case
      (let* ((expected (string-right-trim '(#\Newline #\Return)
                                         (uiop:run-program (list "git" "rev-parse" (concatenate 'string commit ":tools/evidence-storage.lisp"))
                                                           :output :string)))
             (actual (string-right-trim '(#\Newline #\Return)
                                       (uiop:run-program '("git" "hash-object" "--" "tools/evidence-storage.lisp") :output :string)))
             (before nil) (results nil) (source-sha nil))
        (demand (equal expected actual) "Trusted library differs from frozen Git.")
        (load library)
        (setf source-sha (native-sha256 *auditor-source*) before (fixture-inventory paths))
        (setf results
              (list (audit-process-fixture (cons (first paths) (read-native (first paths)))
                                           :reader-process-self-test :reader-mutation-child)
                    (audit-process-fixture (cons (second paths) (read-native (second paths)))
                                           :snapshot-process-self-test :snapshot-mutation-child)))
        (demand (equal before (fixture-inventory paths)) "Fixture raw bytes changed during audit.")
        (demand (and (equal source-sha (native-sha256 *auditor-source*))
                     (equal actual (string-right-trim '(#\Newline #\Return)
                                                      (uiop:run-program '("git" "hash-object" "--" "tools/evidence-storage.lisp")
                                                                        :output :string))))
                "Auditor/trusted reader changed during audit.")
        (let ((*print-readably* t))
          (write (list :schema-version 1 :kind :get-active-local-fixture-independent-audit :status :ok
                       :expected-library-commit commit :data-files (length before) :processes 4 :worker-errors 4
                       :two-pass-byte-inventory-stable t :auditor-source (namestring *auditor-source*)
                       :auditor-sha256 source-sha :auditor-and-library-stable t :raw-byte-inventory before
                       :native-results results :limits '(:read-eval-disabled :one-form-and-eof :no-evidence-or-fasl-load
                                                         :self-test-failures-are-not-product-mutation-kills)) :pretty t)
          (terpri)))
    (error (condition)
      (let ((*print-readably* t))
        (write (list :schema-version 1 :kind :get-active-local-fixture-independent-audit :status :failed
                     :diagnostic (princ-to-string condition)) :pretty t) (terpri))
      (sb-ext:exit :code 1))))

