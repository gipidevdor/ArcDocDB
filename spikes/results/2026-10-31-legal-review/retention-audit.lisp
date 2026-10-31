(:SCHEMA-VERSION 1 :KIND :RETENTION-AUDIT :STATUS :OK :METHOD
 :LENGTH-AND-SHA256 :COPIES
 ((:SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/collection/report.lisp")
   :COPY "collector-process/report.lisp" :FINGERPRINT
   (:BYTES 362177 :SHA256
    "7b9fc5983f84d0fd5fd194d4b6d42f6568ff0d1e84ffd6db04f11c60cd0372f3"))
  (:SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/collection/conservazione.lisp")
   :COPY "collector-process/conservazione.lisp" :FINGERPRINT
   (:BYTES 1170 :SHA256
    "49712a424e26680241d060968fcc6125e621e6d168affbfb7354a25299bc900b"))
  (:SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/results/2026-10-31-legal-review/collection/report.lisp")
   :COPY "collector-observations/report.lisp" :FINGERPRINT
   (:BYTES 37062 :SHA256
    "99d3bdf19054d45b283b2a425b5cd614e311090521f69ebae74a04c00cbf7373"))
  (:SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/results/2026-10-31-legal-review/collection/closed-check.log")
   :COPY "collector-observations/closed-check.log" :FINGERPRINT
   (:BYTES 6481 :SHA256
    "3c1c6dd218028ff32d017f848186957d709974d0ece1210fa170de3ee1170d3a")))
 :HELPER-SOURCE "(require :asdf)
(let* ((root (truename \"./\"))
       (base (merge-pathnames \"spikes/results/2026-10-31-legal-review/\" root))
       (copies nil))
  (labels ((data (path) (let ((*read-eval* nil)) (with-open-file (in path) (read in))))
           (fingerprint (path)
             (list :bytes (with-open-file (in path :element-type '(unsigned-byte 8)) (file-length in))
                   :sha256 (subseq (uiop:run-program (list \"shasum\" \"-a\" \"256\" \"--\" (namestring path))
                                                    :output :string) 0 64)))
           (copy-original (source relative)
             (let* ((target (merge-pathnames relative base)) (before (fingerprint source)))
               (when (probe-file target) (error \"Existing retention target: ~A\" target))
               (ensure-directories-exist target)
               (uiop:copy-file source target)
               (unless (and (equal before (fingerprint source)) (equal before (fingerprint target)))
                 (error \"Retention mismatch: ~A\" source))
               (push (list :source (namestring source) :copy relative :fingerprint before) copies)))
           (retain (source relative)
             (copy-original source relative)
             (let ((record (data source)))
               (when (eq (getf record :kind) :compressed-evidence)
                 (copy-original (merge-pathnames (getf record :payload) source)
                                (namestring (merge-pathnames (getf record :payload) relative))))))
           (save-new (name value)
             (with-open-file (out (merge-pathnames name base) :direction :output :if-exists :error)
               (write value :stream out :readably t :pretty t) (terpri out))))
    (let ((record (merge-pathnames \"spikes/out/legal-review-20261031/collection/report.lisp\" root)))
      (retain record \"collector-process/report.lisp\")
      (retain (merge-pathnames \"conservazione.lisp\" record) \"collector-process/conservazione.lisp\"))
    (retain (merge-pathnames \"collection/report.lisp\" base) \"collector-observations/report.lisp\")
    (retain (merge-pathnames \"collection/closed-check.log\" base) \"collector-observations/closed-check.log\")
    (save-new \"retention-audit.lisp\"
              (list :schema-version 1 :kind :retention-audit :status :ok :method :length-and-sha256
                    :copies (reverse copies) :helper-source (uiop:read-file-string *load-truename*)
                    :limits '(:no-literal-byte-comparison :no-legal-approval)))
    (save-new \"catalogo.lisp\"
              '(:schema-version 1 :kind :evidence-catalog :date \"2026-10-31\"
                :entries ((:kind :command-archive-collection :artifact \"collector-observations/report.lisp\"
                           :original \"collector-process/report.lisp\"
                           :process-artifact \"collector-process/conservazione.lisp\")
                          (:kind :closed-archive-audit :artifact \"collector-observations/closed-check.log\")
                          (:kind :retention-audit :artifact \"retention-audit.lisp\"))))
    (format t \"~S~%\" (list :status :ok :preserved-files (length copies)))))
"
 :LIMITS (:NO-LITERAL-BYTE-COMPARISON :NO-LEGAL-APPROVAL))
