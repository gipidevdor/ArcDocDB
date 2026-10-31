(:SCHEMA-VERSION 1 :KIND :RETENTION-AUDIT :STATUS :OK :COPIES
 ((:SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/core-review-20261031/collection/report.lisp")
   :TARGET "collection-process.lisp" :BYTES 339235 :SHA256-BEFORE
   "07bdba18e07a5c76e4681bde811cf5232feb4bbbff252028c83a7ec881ee120e"
   :SHA256-AFTER
   "07bdba18e07a5c76e4681bde811cf5232feb4bbbff252028c83a7ec881ee120e"
   :TARGET-SHA256
   "07bdba18e07a5c76e4681bde811cf5232feb4bbbff252028c83a7ec881ee120e"
   :BYTE-COMPARISON :EQUAL)
  (:SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/core-review-20261031/collection/conservazione.lisp")
   :TARGET "collection-process-retention.lisp" :BYTES 1157 :SHA256-BEFORE
   "02577ea949cb46f07f5f7a4dec2e5bd4b24344a9f91c49d965186bdf8adbe7e5"
   :SHA256-AFTER
   "02577ea949cb46f07f5f7a4dec2e5bd4b24344a9f91c49d965186bdf8adbe7e5"
   :TARGET-SHA256
   "02577ea949cb46f07f5f7a4dec2e5bd4b24344a9f91c49d965186bdf8adbe7e5"
   :BYTE-COMPARISON :EQUAL)
  (:SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/core-review-20261031/collection-observations/report.lisp")
   :TARGET "collection-report.lisp" :BYTES 8790 :SHA256-BEFORE
   "30240aa631a4a777a57961ced8f19eaf7604a8c73396ae5049a67e014b65c9ce"
   :SHA256-AFTER
   "30240aa631a4a777a57961ced8f19eaf7604a8c73396ae5049a67e014b65c9ce"
   :TARGET-SHA256
   "30240aa631a4a777a57961ced8f19eaf7604a8c73396ae5049a67e014b65c9ce"
   :BYTE-COMPARISON :EQUAL)
  (:SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/core-review-20261031/collection-observations/closed-check.log")
   :TARGET "closed-check.lisp" :BYTES 1736 :SHA256-BEFORE
   "05da44a2702b63ea9b121c2e6f35f561ed274e1ec1aee5a48b29fa488466db1c"
   :SHA256-AFTER
   "05da44a2702b63ea9b121c2e6f35f561ed274e1ec1aee5a48b29fa488466db1c"
   :TARGET-SHA256
   "05da44a2702b63ea9b121c2e6f35f561ed274e1ec1aee5a48b29fa488466db1c"
   :BYTE-COMPARISON :EQUAL))
 :HELPER "(require :asdf)
(load \"tools/evidence-storage.lisp\")
(defun review-bytes (path)
  (with-open-file (in path :element-type '(unsigned-byte 8))
    (let ((bytes (make-array (file-length in) :element-type '(unsigned-byte 8))))
      (unless (= (length bytes) (read-sequence bytes in)) (error \"Incomplete read: ~A\" path))
      bytes)))
(let ((root (truename \"spikes/results/2026-10-31-core-code-review/\")) (copies nil))
  (dolist (pair '((\"spikes/out/core-review-20261031/collection/report.lisp\" \"collection-process.lisp\")
                  (\"spikes/out/core-review-20261031/collection/conservazione.lisp\" \"collection-process-retention.lisp\")
                  (\"spikes/out/core-review-20261031/collection-observations/report.lisp\" \"collection-report.lisp\")
                  (\"spikes/out/core-review-20261031/collection-observations/closed-check.log\" \"closed-check.lisp\")))
    (let* ((source (truename (first pair))) (target (merge-pathnames (second pair) root))
           (bytes (review-bytes source)) (hash (arcdocdb.evidence:file-sha256 source)))
      (with-open-file (out target :direction :output :if-exists :error :element-type '(unsigned-byte 8))
        (write-sequence bytes out))
      (unless (and (equalp bytes (review-bytes target)) (equalp bytes (review-bytes source))
                   (string= hash (arcdocdb.evidence:file-sha256 target))
                   (string= hash (arcdocdb.evidence:file-sha256 source)))
        (error \"Retention mismatch: ~A\" source))
      (push (list :source (namestring source) :target (second pair) :bytes (length bytes)
                  :sha256-before hash :sha256-after (arcdocdb.evidence:file-sha256 source)
                  :target-sha256 (arcdocdb.evidence:file-sha256 target)
                  :byte-comparison :equal) copies)))
  (with-open-file (out (merge-pathnames \"retention-audit.lisp\" root) :direction :output :if-exists :error)
    (write (list :schema-version 1 :kind :retention-audit :status :ok
                 :copies (nreverse copies) :helper (uiop:read-file-string *load-truename*)
                 :limits '(:completed-file-snapshots :not-atomic-filesystem-proof))
           :stream out :readably t :pretty t)
    (terpri out))
  (with-open-file (out (merge-pathnames \"catalogo.lisp\" root) :direction :output :if-exists :error)
    (write '(:schema-version 1 :kind :evidence-catalog :date \"2026-10-31\"
             :entries ((:kind :command-archive-collection :artifact \"collection-report.lisp\"
                        :original \"collection-process.lisp\" :process-artifact \"collection-process-retention.lisp\")
                       (:kind :closed-archive-audit :artifact \"closed-check.lisp\")
                       (:kind :retention-audit :artifact \"retention-audit.lisp\")))
           :stream out :readably t :pretty t)
    (terpri out)))
(format t \"~&Retention: 4 copies, byte comparison and SHA256 checks passed.~%\")
"
 :LIMITS (:COMPLETED-FILE-SNAPSHOTS :NOT-ATOMIC-FILESYSTEM-PROOF))
