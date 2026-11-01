(:SCHEMA-VERSION 1 :KIND :RETENTION-AUDIT :STATUS :OK :COPIES
 ((:SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/collection/report.lisp")
   :TARGET "collection-process.lisp" :BYTES 399030 :SHA256-BEFORE
   "d684b9df631834ce172d8cc20dead70ef58986f6a1c7db163e85855c0d264060"
   :SHA256-AFTER
   "d684b9df631834ce172d8cc20dead70ef58986f6a1c7db163e85855c0d264060"
   :TARGET-SHA256
   "d684b9df631834ce172d8cc20dead70ef58986f6a1c7db163e85855c0d264060"
   :BYTE-COMPARISON :EQUAL)
  (:SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/collection/conservazione.lisp")
   :TARGET "collection-process-retention.lisp" :BYTES 1163 :SHA256-BEFORE
   "cbd9c0e630e9fa3f50ea30b11c80f815675ad28f504078e2c41538b7474142e6"
   :SHA256-AFTER
   "cbd9c0e630e9fa3f50ea30b11c80f815675ad28f504078e2c41538b7474142e6"
   :TARGET-SHA256
   "cbd9c0e630e9fa3f50ea30b11c80f815675ad28f504078e2c41538b7474142e6"
   :BYTE-COMPARISON :EQUAL)
  (:SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/collection-observations/report.lisp")
   :TARGET "collection-report.lisp" :BYTES 51663 :SHA256-BEFORE
   "d07ce9daa1ec3f212967d0971f29fb4adf394368f8bb1acc5297e419846b0a63"
   :SHA256-AFTER
   "d07ce9daa1ec3f212967d0971f29fb4adf394368f8bb1acc5297e419846b0a63"
   :TARGET-SHA256
   "d07ce9daa1ec3f212967d0971f29fb4adf394368f8bb1acc5297e419846b0a63"
   :BYTE-COMPARISON :EQUAL)
  (:SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/collection-observations/closed-check.log")
   :TARGET "closed-check.lisp" :BYTES 8725 :SHA256-BEFORE
   "11abd7ec510ab4e90d1ab07ae72f31b4ca4969679b1dc70b38e7a7613dfc411c"
   :SHA256-AFTER
   "11abd7ec510ab4e90d1ab07ae72f31b4ca4969679b1dc70b38e7a7613dfc411c"
   :TARGET-SHA256
   "11abd7ec510ab4e90d1ab07ae72f31b4ca4969679b1dc70b38e7a7613dfc411c"
   :BYTE-COMPARISON :EQUAL))
 :HELPER "(require :asdf)
(load \"tools/evidence-storage.lisp\")
(defun backup-retention-bytes (path)
  (with-open-file (in path :element-type '(unsigned-byte 8))
    (let ((bytes (make-array (file-length in) :element-type '(unsigned-byte 8))))
      (unless (= (length bytes) (read-sequence bytes in)) (error \"Incomplete read: ~A\" path))
      bytes)))
(let* ((root (merge-pathnames \"spikes/results/2026-11-01-backup-comparison/\" (truename \"./\")))
       (copies nil))
  (ensure-directories-exist root)
  (labels ((copy-one (source name)
             (let* ((source (truename source)) (target (merge-pathnames name root))
                    (bytes (backup-retention-bytes source)) (hash (arcdocdb.evidence:file-sha256 source)))
               (with-open-file (out target :direction :output :if-exists :error :element-type '(unsigned-byte 8))
                 (write-sequence bytes out))
               (unless (and (equalp bytes (backup-retention-bytes target))
                            (equalp bytes (backup-retention-bytes source))
                            (string= hash (arcdocdb.evidence:file-sha256 target))
                            (string= hash (arcdocdb.evidence:file-sha256 source)))
                 (error \"Retention mismatch: ~A\" source))
               (push (list :source (namestring source) :target name :bytes (length bytes)
                           :sha256-before hash :sha256-after (arcdocdb.evidence:file-sha256 source)
                           :target-sha256 (arcdocdb.evidence:file-sha256 target)
                           :byte-comparison :equal) copies)))
           (copy-original (source name)
             (copy-one source name)
             (let ((*read-eval* nil))
               (with-open-file (in source)
                 (let ((record (read in)))
                   (when (eq (getf record :kind) :compressed-evidence)
                     (copy-one (merge-pathnames (getf record :payload) source)
                               (namestring (merge-pathnames (getf record :payload) name)))))))))
    (dolist (pair '((\"spikes/out/backup-compare-20261101/collection/report.lisp\" \"collection-process.lisp\")
                    (\"spikes/out/backup-compare-20261101/collection/conservazione.lisp\" \"collection-process-retention.lisp\")
                    (\"spikes/out/backup-compare-20261101/collection-observations/report.lisp\" \"collection-report.lisp\")
                    (\"spikes/out/backup-compare-20261101/collection-observations/closed-check.log\" \"closed-check.lisp\")))
      (copy-original (first pair) (second pair))))
  (with-open-file (out (merge-pathnames \"retention-audit.lisp\" root) :direction :output :if-exists :error)
    (write (list :schema-version 1 :kind :retention-audit :status :ok :copies (nreverse copies)
                 :helper (uiop:read-file-string *load-truename*)
                 :limits '(:completed-file-snapshots :not-atomic-filesystem-proof))
           :stream out :readably t :pretty t)
    (terpri out))
  (with-open-file (out (merge-pathnames \"catalogo.lisp\" root) :direction :output :if-exists :error)
    (write '(:schema-version 1 :kind :evidence-catalog :date \"2026-11-01\"
             :entries ((:kind :command-archive-collection :artifact \"collection-report.lisp\"
                        :original \"collection-process.lisp\" :process-artifact \"collection-process-retention.lisp\")
                       (:kind :closed-archive-audit :artifact \"closed-check.lisp\")
                       (:kind :retention-audit :artifact \"retention-audit.lisp\")))
           :stream out :readably t :pretty t)
    (terpri out)))
(format t \"~&Retention copies, byte comparison and SHA256 checks passed.~%\")
"
 :LIMITS (:COMPLETED-FILE-SNAPSHOTS :NOT-ATOMIC-FILESYSTEM-PROOF))
