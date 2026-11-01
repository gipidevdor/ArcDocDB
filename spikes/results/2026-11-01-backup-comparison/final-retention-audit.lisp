(:SCHEMA-VERSION 1 :KIND :RETENTION-AUDIT :STATUS :OK :COPIES
 ((:SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/final-metadata/report.lisp")
   :TARGET "final-metadata-process.lisp" :BYTES 355356 :SHA256-BEFORE
   "b1e7bfc5f08220fe70eef426c3453039c42c44c4e858038c1425e67cdc43273e"
   :SHA256-AFTER
   "b1e7bfc5f08220fe70eef426c3453039c42c44c4e858038c1425e67cdc43273e"
   :TARGET-SHA256
   "b1e7bfc5f08220fe70eef426c3453039c42c44c4e858038c1425e67cdc43273e"
   :BYTE-COMPARISON :EQUAL)
  (:SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/final-metadata/conservazione.lisp")
   :TARGET "final-metadata-retention.lisp" :BYTES 1171 :SHA256-BEFORE
   "99a1e2fe50c968a51566c82529e31cb9347bf2a09d34c9dc57f2df9907b220b8"
   :SHA256-AFTER
   "99a1e2fe50c968a51566c82529e31cb9347bf2a09d34c9dc57f2df9907b220b8"
   :TARGET-SHA256
   "99a1e2fe50c968a51566c82529e31cb9347bf2a09d34c9dc57f2df9907b220b8"
   :BYTE-COMPARISON :EQUAL))
 :HELPER "(require :asdf)
(load \"tools/evidence-storage.lisp\")
(defun final-backup-bytes (path)
  (with-open-file (in path :element-type '(unsigned-byte 8))
    (let ((bytes (make-array (file-length in) :element-type '(unsigned-byte 8))))
      (unless (= (length bytes) (read-sequence bytes in)) (error \"Incomplete read: ~A\" path))
      bytes)))
(let ((root (truename \"spikes/results/2026-11-01-backup-comparison/\")) (copies nil))
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
    (retain \"spikes/out/backup-compare-20261101/final-metadata/report.lisp\" \"final-metadata-process.lisp\")
    (retain \"spikes/out/backup-compare-20261101/final-metadata/conservazione.lisp\" \"final-metadata-retention.lisp\"))
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
