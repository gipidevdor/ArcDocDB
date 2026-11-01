(:SCHEMA-VERSION 1 :KIND :RETENTION-AUDIT :STATUS :OK :COPIES
 ((:SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/collection/report.lisp")
   :TARGET "collection-process.lisp" :BYTES 390626 :SHA256-BEFORE
   "081e13b5562a62a369b89df6ec2caef2f6e29283654196d011e7b234c09a8bde"
   :SHA256-AFTER
   "081e13b5562a62a369b89df6ec2caef2f6e29283654196d011e7b234c09a8bde"
   :TARGET-SHA256
   "081e13b5562a62a369b89df6ec2caef2f6e29283654196d011e7b234c09a8bde"
   :BYTE-COMPARISON :EQUAL)
  (:SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/collection/conservazione.lisp")
   :TARGET "collection-process-retention.lisp" :BYTES 1153 :SHA256-BEFORE
   "ded089f9e1b3ae99a17b25197561f72ac05d076141de1a1f24231f6de1956e80"
   :SHA256-AFTER
   "ded089f9e1b3ae99a17b25197561f72ac05d076141de1a1f24231f6de1956e80"
   :TARGET-SHA256
   "ded089f9e1b3ae99a17b25197561f72ac05d076141de1a1f24231f6de1956e80"
   :BYTE-COMPARISON :EQUAL)
  (:SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/collection-observations/report.lisp")
   :TARGET "collection-report.lisp" :BYTES 43129 :SHA256-BEFORE
   "857f79c286092176d820ae25d42bc15fcf84cc33923d7f39fea2ef4a464f061e"
   :SHA256-AFTER
   "857f79c286092176d820ae25d42bc15fcf84cc33923d7f39fea2ef4a464f061e"
   :TARGET-SHA256
   "857f79c286092176d820ae25d42bc15fcf84cc33923d7f39fea2ef4a464f061e"
   :BYTE-COMPARISON :EQUAL)
  (:SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/collection-observations/closed-check.log")
   :TARGET "closed-check.lisp" :BYTES 7326 :SHA256-BEFORE
   "40b29138b6736c60ec49142bca14947756345dea1d1fdb9d05394d7fd30f9e41"
   :SHA256-AFTER
   "40b29138b6736c60ec49142bca14947756345dea1d1fdb9d05394d7fd30f9e41"
   :TARGET-SHA256
   "40b29138b6736c60ec49142bca14947756345dea1d1fdb9d05394d7fd30f9e41"
   :BYTE-COMPARISON :EQUAL))
 :HELPER "(require :asdf)
(load \"tools/evidence-storage.lisp\")
(defun backup-retention-bytes (path)
  (with-open-file (in path :element-type '(unsigned-byte 8))
    (let ((bytes (make-array (file-length in) :element-type '(unsigned-byte 8))))
      (unless (= (length bytes) (read-sequence bytes in)) (error \"Incomplete read: ~A\" path))
      bytes)))
(let* ((root (merge-pathnames \"spikes/results/2026-11-01-offline-backup-m1/\" (truename \"./\")))
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
    (dolist (pair '((\"spikes/out/backup-m1-20261101/collection/report.lisp\" \"collection-process.lisp\")
                    (\"spikes/out/backup-m1-20261101/collection/conservazione.lisp\" \"collection-process-retention.lisp\")
                    (\"spikes/out/backup-m1-20261101/collection-observations/report.lisp\" \"collection-report.lisp\")
                    (\"spikes/out/backup-m1-20261101/collection-observations/closed-check.log\" \"closed-check.lisp\")))
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
