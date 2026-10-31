(:SCHEMA-VERSION 1 :KIND :RETENTION-AUDIT :STATUS :OK :COPIES
 ((:SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/collection/report.lisp")
   :TARGET "collection-process.lisp" :BYTES 355645 :SHA256-BEFORE
   "3080553d497b959cc24d06c3f6d51b0f508f2c9c467f21dc852cb3f2ad1e4524"
   :SHA256-AFTER
   "3080553d497b959cc24d06c3f6d51b0f508f2c9c467f21dc852cb3f2ad1e4524"
   :TARGET-SHA256
   "3080553d497b959cc24d06c3f6d51b0f508f2c9c467f21dc852cb3f2ad1e4524"
   :BYTE-COMPARISON :EQUAL)
  (:SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/collection/conservazione.lisp")
   :TARGET "collection-process-retention.lisp" :BYTES 1153 :SHA256-BEFORE
   "facde6fd7bd6f999180bb0564fab3e4618890d881da4e4bc99f1d8f7a4cf2394"
   :SHA256-AFTER
   "facde6fd7bd6f999180bb0564fab3e4618890d881da4e4bc99f1d8f7a4cf2394"
   :TARGET-SHA256
   "facde6fd7bd6f999180bb0564fab3e4618890d881da4e4bc99f1d8f7a4cf2394"
   :BYTE-COMPARISON :EQUAL)
  (:SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/collection-observations/report.lisp")
   :TARGET "collection-report.lisp" :BYTES 24456 :SHA256-BEFORE
   "90c635080a8c4ef8984fa6464bbe08353377d4ded353edfc2142b4458457cc6d"
   :SHA256-AFTER
   "90c635080a8c4ef8984fa6464bbe08353377d4ded353edfc2142b4458457cc6d"
   :TARGET-SHA256
   "90c635080a8c4ef8984fa6464bbe08353377d4ded353edfc2142b4458457cc6d"
   :BYTE-COMPARISON :EQUAL)
  (:SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/collection-observations/closed-check.log")
   :TARGET "closed-check.lisp" :BYTES 4161 :SHA256-BEFORE
   "b9d425f7ffb5d7da320c8f0e81b8474f79836eba176f8a495729d788df270210"
   :SHA256-AFTER
   "b9d425f7ffb5d7da320c8f0e81b8474f79836eba176f8a495729d788df270210"
   :TARGET-SHA256
   "b9d425f7ffb5d7da320c8f0e81b8474f79836eba176f8a495729d788df270210"
   :BYTE-COMPARISON :EQUAL))
 :HELPER "(require :asdf)
(load \"tools/evidence-storage.lisp\")
(defun verifier-retention-bytes (path)
  (with-open-file (in path :element-type '(unsigned-byte 8))
    (let ((bytes (make-array (file-length in) :element-type '(unsigned-byte 8))))
      (unless (= (length bytes) (read-sequence bytes in)) (error \"Incomplete read: ~A\" path))
      bytes)))
(let* ((root (merge-pathnames \"spikes/results/2026-10-31-offline-verifier/\" (truename \"./\")))
       (copies nil))
  (ensure-directories-exist root)
  (labels ((copy-one (source name)
             (let* ((source (truename source)) (target (merge-pathnames name root))
                    (bytes (verifier-retention-bytes source)) (hash (arcdocdb.evidence:file-sha256 source)))
               (with-open-file (out target :direction :output :if-exists :error :element-type '(unsigned-byte 8))
                 (write-sequence bytes out))
               (unless (and (equalp bytes (verifier-retention-bytes target))
                            (equalp bytes (verifier-retention-bytes source))
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
    (dolist (pair '((\"spikes/out/verify-m1-20261031/collection/report.lisp\" \"collection-process.lisp\")
                    (\"spikes/out/verify-m1-20261031/collection/conservazione.lisp\" \"collection-process-retention.lisp\")
                    (\"spikes/out/verify-m1-20261031/collection-observations/report.lisp\" \"collection-report.lisp\")
                    (\"spikes/out/verify-m1-20261031/collection-observations/closed-check.log\" \"closed-check.lisp\")))
      (copy-original (first pair) (second pair))))
  (with-open-file (out (merge-pathnames \"retention-audit.lisp\" root) :direction :output :if-exists :error)
    (write (list :schema-version 1 :kind :retention-audit :status :ok :copies (nreverse copies)
                 :helper (uiop:read-file-string *load-truename*)
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
(format t \"~&Retention copies, byte comparison and SHA256 checks passed.~%\")
"
 :LIMITS (:COMPLETED-FILE-SNAPSHOTS :NOT-ATOMIC-FILESYSTEM-PROOF))
