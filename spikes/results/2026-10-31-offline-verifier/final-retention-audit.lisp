(:SCHEMA-VERSION 1 :KIND :RETENTION-AUDIT :STATUS :OK :COPIES
 ((:SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/final-metadata/report.lisp")
   :TARGET "final-metadata-process.lisp" :BYTES 335064 :SHA256-BEFORE
   "0c39d80d84c9163372937058c68c8e7ae4de3805f8054fa5cf421ad7cb154b97"
   :SHA256-AFTER
   "0c39d80d84c9163372937058c68c8e7ae4de3805f8054fa5cf421ad7cb154b97"
   :TARGET-SHA256
   "0c39d80d84c9163372937058c68c8e7ae4de3805f8054fa5cf421ad7cb154b97"
   :BYTE-COMPARISON :EQUAL)
  (:SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/final-metadata/conservazione.lisp")
   :TARGET "final-metadata-retention.lisp" :BYTES 1161 :SHA256-BEFORE
   "8df39fff6c409069ff7df1c7dedfba43133198016f2d91e0537847df798bdc01"
   :SHA256-AFTER
   "8df39fff6c409069ff7df1c7dedfba43133198016f2d91e0537847df798bdc01"
   :TARGET-SHA256
   "8df39fff6c409069ff7df1c7dedfba43133198016f2d91e0537847df798bdc01"
   :BYTE-COMPARISON :EQUAL))
 :HELPER "(require :asdf)
(load \"tools/evidence-storage.lisp\")
(defun final-verifier-bytes (path)
  (with-open-file (in path :element-type '(unsigned-byte 8))
    (let ((bytes (make-array (file-length in) :element-type '(unsigned-byte 8))))
      (unless (= (length bytes) (read-sequence bytes in)) (error \"Incomplete read: ~A\" path))
      bytes)))
(let ((root (truename \"spikes/results/2026-10-31-offline-verifier/\")) (copies nil))
  (dolist (pair '((\"spikes/out/verify-m1-20261031/final-metadata/report.lisp\" \"final-metadata-process.lisp\")
                  (\"spikes/out/verify-m1-20261031/final-metadata/conservazione.lisp\" \"final-metadata-retention.lisp\")))
    (let* ((source (truename (first pair))) (target (merge-pathnames (second pair) root))
           (bytes (final-verifier-bytes source)) (hash (arcdocdb.evidence:file-sha256 source)))
      (with-open-file (out target :direction :output :if-exists :error :element-type '(unsigned-byte 8))
        (write-sequence bytes out))
      (unless (and (equalp bytes (final-verifier-bytes target)) (equalp bytes (final-verifier-bytes source))
                   (string= hash (arcdocdb.evidence:file-sha256 target))
                   (string= hash (arcdocdb.evidence:file-sha256 source)))
        (error \"Retention mismatch: ~A\" source))
      (push (list :source (namestring source) :target (second pair) :bytes (length bytes)
                  :sha256-before hash :sha256-after (arcdocdb.evidence:file-sha256 source)
                  :target-sha256 (arcdocdb.evidence:file-sha256 target) :byte-comparison :equal) copies)))
  (with-open-file (out (merge-pathnames \"final-retention-audit.lisp\" root) :direction :output :if-exists :error)
    (write (list :schema-version 1 :kind :retention-audit :status :ok :copies (nreverse copies)
                 :helper (uiop:read-file-string *load-truename*)
                 :limits '(:completed-file-snapshots :not-atomic-filesystem-proof))
           :stream out :readably t :pretty t)
    (terpri out)))
(format t \"~&Final metadata record and sidecar retained with byte/SHA256 comparison.~%\")
"
 :LIMITS (:COMPLETED-FILE-SNAPSHOTS :NOT-ATOMIC-FILESYSTEM-PROOF))
