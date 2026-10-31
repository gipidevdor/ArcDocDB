(:SCHEMA-VERSION 1 :KIND :RETENTION-AUDIT :STATUS :OK :COPIES
 ((:SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/core-review-20261031/final-metadata/report.lisp")
   :TARGET "final-metadata-process.lisp" :BYTES 331483 :SHA256-BEFORE
   "44c20e795cc2c082a4f3ede98416dea9af7e97807f612ac97058c35caa0c824c"
   :SHA256-AFTER
   "44c20e795cc2c082a4f3ede98416dea9af7e97807f612ac97058c35caa0c824c"
   :TARGET-SHA256
   "44c20e795cc2c082a4f3ede98416dea9af7e97807f612ac97058c35caa0c824c"
   :BYTE-COMPARISON :EQUAL)
  (:SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/core-review-20261031/final-metadata/conservazione.lisp")
   :TARGET "final-metadata-retention.lisp" :BYTES 1165 :SHA256-BEFORE
   "3f177249fc75ebe190693566d1fb3b3eabb00217fe53c4880fd638fda6d787e8"
   :SHA256-AFTER
   "3f177249fc75ebe190693566d1fb3b3eabb00217fe53c4880fd638fda6d787e8"
   :TARGET-SHA256
   "3f177249fc75ebe190693566d1fb3b3eabb00217fe53c4880fd638fda6d787e8"
   :BYTE-COMPARISON :EQUAL))
 :HELPER "(require :asdf)
(load \"tools/evidence-storage.lisp\")
(defun final-review-bytes (path)
  (with-open-file (in path :element-type '(unsigned-byte 8))
    (let ((bytes (make-array (file-length in) :element-type '(unsigned-byte 8))))
      (unless (= (length bytes) (read-sequence bytes in)) (error \"Incomplete read: ~A\" path))
      bytes)))
(let ((root (truename \"spikes/results/2026-10-31-core-code-review/\")) (copies nil))
  (dolist (name '(\"report.lisp\" \"conservazione.lisp\"))
    (let* ((source (truename (concatenate 'string \"spikes/out/core-review-20261031/final-metadata/\" name)))
           (target (merge-pathnames (if (string= name \"report.lisp\")
                                       \"final-metadata-process.lisp\" \"final-metadata-retention.lisp\") root))
           (bytes (final-review-bytes source)) (hash (arcdocdb.evidence:file-sha256 source)))
      (with-open-file (out target :direction :output :if-exists :error :element-type '(unsigned-byte 8))
        (write-sequence bytes out))
      (unless (and (equalp bytes (final-review-bytes target)) (equalp bytes (final-review-bytes source))
                   (string= hash (arcdocdb.evidence:file-sha256 source))
                   (string= hash (arcdocdb.evidence:file-sha256 target)))
        (error \"Final retention mismatch: ~A\" source))
      (push (list :source (namestring source) :target (file-namestring target)
                  :bytes (length bytes) :sha256-before hash
                  :sha256-after (arcdocdb.evidence:file-sha256 source)
                  :target-sha256 (arcdocdb.evidence:file-sha256 target)
                  :byte-comparison :equal) copies)))
  (with-open-file (out (merge-pathnames \"final-retention-audit.lisp\" root)
                       :direction :output :if-exists :error)
    (write (list :schema-version 1 :kind :retention-audit :status :ok
                 :copies (nreverse copies) :helper (uiop:read-file-string *load-truename*)
                 :limits '(:copied-after-the-check :not-self-attested-by-that-check))
           :stream out :readably t :pretty t)
    (terpri out)))
(format t \"~&Final retention: 2 byte-equal copies; checksums unchanged.~%\")
"
 :LIMITS (:COPIED-AFTER-THE-CHECK :NOT-SELF-ATTESTED-BY-THAT-CHECK))
