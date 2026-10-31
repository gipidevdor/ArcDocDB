(:SCHEMA-VERSION 1 :KIND :RETENTION-AUDIT :STATUS :OK :METHOD
 :LENGTH-AND-SHA256 :COPIES
 ((:SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/final-links/report.lisp")
   :COPY "final-links-process.lisp" :FINGERPRINT
   (:BYTES 330961 :SHA256
    "291bf63a82d5402a4f7ffc86eb091428abfc8979cc331e63ef0a0def133ab9ea"))
  (:SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/final-links/conservazione.lisp")
   :COPY "final-links-retention.lisp" :FINGERPRINT
   (:BYTES 1172 :SHA256
    "edb696165dd914405ec699dd3add6a4f61b15744ec279512cf4bc6464f338122"))
  (:SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/final-catalog/report.lisp")
   :COPY "final-catalog-process.lisp" :FINGERPRINT
   (:BYTES 331355 :SHA256
    "d036754508cadb1f2da22b6b24ea72d34bd2dee6e870259c73c28c9d26fd3cb3"))
  (:SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/final-catalog/conservazione.lisp")
   :COPY "final-catalog-retention.lisp" :FINGERPRINT
   (:BYTES 1176 :SHA256
    "ff3b68b34c14f4d7eb6fe1dab82f1fad82513d10c93e8f78e860028c59af067c"))
  (:SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/final-catalog-complete/report.lisp")
   :COPY "final-catalog-complete-process.lisp" :FINGERPRINT
   (:BYTES 331711 :SHA256
    "d7a36ca6ada61c6550fefc4f88220bccaf086fbdf10a542c77894abe5f0bbb1d"))
  (:SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/final-catalog-complete/conservazione.lisp")
   :COPY "final-catalog-complete-retention.lisp" :FINGERPRINT
   (:BYTES 1194 :SHA256
    "a10725f12057ca032b463e9e760e8ef586d75af94745d8ca658bca80c592ad48")))
 :HELPER-SOURCE "(require :asdf)
(let* ((root (truename \"./\"))
       (base (merge-pathnames \"spikes/results/2026-10-31-legal-review/\" root))
       (copies nil) (entries nil))
  (labels ((data (path) (let ((*read-eval* nil)) (with-open-file (in path) (read in))))
           (fingerprint (path)
             (list :bytes (with-open-file (in path :element-type '(unsigned-byte 8)) (file-length in))
                   :sha256 (subseq (uiop:run-program (list \"shasum\" \"-a\" \"256\" \"--\" (namestring path))
                                                    :output :string) 0 64)))
           (retain (source name)
             (when (eq (getf (data source) :kind) :compressed-evidence)
               (error \"This flat-copy plan requires a plain original: ~A\" source))
             (let* ((target (merge-pathnames name base)) (before (fingerprint source)))
               (when (probe-file target) (error \"Existing final target: ~A\" target))
               (uiop:copy-file source target)
               (unless (and (equal before (fingerprint source)) (equal before (fingerprint target)))
                 (error \"Final retention mismatch: ~A\" source))
               (push (list :source (namestring source) :copy name :fingerprint before) copies)))
           (save (name value exists)
             (with-open-file (out (merge-pathnames name base) :direction :output :if-exists exists)
               (write value :stream out :readably t :pretty t) (terpri out))))
    (dolist (label '(\"final-links\" \"final-catalog\" \"final-catalog-complete\"))
      (let* ((record (merge-pathnames (format nil \"spikes/out/legal-review-20261031/~A/report.lisp\" label) root))
             (name (format nil \"~A-process.lisp\" label))
             (sidecar (format nil \"~A-retention.lisp\" label)))
        (retain record name)
        (retain (merge-pathnames \"conservazione.lisp\" record) sidecar)
        (push (list :kind :command-verification :artifact name :process-artifact sidecar) entries)))
    (save \"final-retention-audit.lisp\"
          (list :schema-version 1 :kind :retention-audit :status :ok :method :length-and-sha256
                :copies (reverse copies) :helper-source (uiop:read-file-string *load-truename*)
                :limits '(:no-literal-byte-comparison :no-legal-approval)) :error)
    (let ((catalog (data (merge-pathnames \"catalogo.lisp\" base))))
      (setf (getf catalog :entries)
            (append (getf catalog :entries) (reverse entries)
                    '((:kind :retention-audit :artifact \"final-retention-audit.lisp\"))))
      (save \"catalogo.lisp\" catalog :supersede))
    (format t \"~S~%\" (list :status :ok :preserved-files (length copies)))))
"
 :LIMITS (:NO-LITERAL-BYTE-COMPARISON :NO-LEGAL-APPROVAL))
