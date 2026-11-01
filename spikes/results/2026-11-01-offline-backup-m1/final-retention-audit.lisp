(:SCHEMA-VERSION 1 :KIND :RETENTION-AUDIT :STATUS :OK :COPIES
 ((:SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/final-metadata/report.lisp")
   :TARGET "final-metadata-process.lisp" :BYTES 354948 :SHA256-BEFORE
   "aadc19d59b00330acaa4d37d39aeeafa293fc54def5772b14c2ec4ba44a6c010"
   :SHA256-AFTER
   "aadc19d59b00330acaa4d37d39aeeafa293fc54def5772b14c2ec4ba44a6c010"
   :TARGET-SHA256
   "aadc19d59b00330acaa4d37d39aeeafa293fc54def5772b14c2ec4ba44a6c010"
   :BYTE-COMPARISON :EQUAL)
  (:SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/final-metadata/conservazione.lisp")
   :TARGET "final-metadata-retention.lisp" :BYTES 1161 :SHA256-BEFORE
   "30fc6776f7244667c3e2e16dd1c4a73cbf7752daa1d3134a801056992dba433d"
   :SHA256-AFTER
   "30fc6776f7244667c3e2e16dd1c4a73cbf7752daa1d3134a801056992dba433d"
   :TARGET-SHA256
   "30fc6776f7244667c3e2e16dd1c4a73cbf7752daa1d3134a801056992dba433d"
   :BYTE-COMPARISON :EQUAL))
 :HELPER "(require :asdf)
(load \"tools/evidence-storage.lisp\")
(defun final-backup-bytes (path)
  (with-open-file (in path :element-type '(unsigned-byte 8))
    (let ((bytes (make-array (file-length in) :element-type '(unsigned-byte 8))))
      (unless (= (length bytes) (read-sequence bytes in)) (error \"Incomplete read: ~A\" path))
      bytes)))
(let ((root (truename \"spikes/results/2026-11-01-offline-backup-m1/\")) (copies nil))
  (labels ((retain (source name)
             (let* ((source (truename source)) (target (merge-pathnames name root))
                    (bytes (final-backup-bytes source)) (hash (arcdocdb.evidence:file-sha256 source)))
               (with-open-file (out target :direction :output :if-exists :error :element-type '(unsigned-byte 8))
                 (write-sequence bytes out))
               (unless (and (equalp bytes (final-backup-bytes target)) (equalp bytes (final-backup-bytes source))
                            (string= hash (arcdocdb.evidence:file-sha256 target))
                            (string= hash (arcdocdb.evidence:file-sha256 source)))
                 (error \"Retention mismatch: ~A\" source))
               (push (list :source (namestring source) :target name :bytes (length bytes)
                           :sha256-before hash :sha256-after (arcdocdb.evidence:file-sha256 source)
                           :target-sha256 (arcdocdb.evidence:file-sha256 target) :byte-comparison :equal) copies)
               (unless (equal \"gz\" (pathname-type source))
                (let ((*read-eval* nil))
                 (with-open-file (in source)
                   (let ((data (read in)))
                     (when (eq :compressed-evidence (getf data :kind))
                       (retain (merge-pathnames (getf data :payload) source)
                               (namestring (merge-pathnames (getf data :payload) name)))))))))))
    (retain \"spikes/out/backup-m1-20261101/final-metadata/report.lisp\" \"final-metadata-process.lisp\")
    (retain \"spikes/out/backup-m1-20261101/final-metadata/conservazione.lisp\" \"final-metadata-retention.lisp\"))
  (with-open-file (out (merge-pathnames \"final-retention-audit.lisp\" root) :direction :output :if-exists :error)
    (write (list :schema-version 1 :kind :retention-audit :status :ok :copies (nreverse copies)
                 :helper (uiop:read-file-string *load-truename*)
                 :limits '(:completed-file-snapshots :not-atomic-filesystem-proof
                           :final-check-precedes-own-record-retention))
           :stream out :readably t :pretty t)
    (terpri out)))
(format t \"~&Final metadata record and sidecar retained with byte/SHA256 comparison.~%\")
"
 :LIMITS
 (:COMPLETED-FILE-SNAPSHOTS :NOT-ATOMIC-FILESYSTEM-PROOF
  :FINAL-CHECK-PRECEDES-OWN-RECORD-RETENTION))
