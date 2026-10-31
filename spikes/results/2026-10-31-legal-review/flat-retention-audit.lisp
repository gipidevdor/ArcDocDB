(:SCHEMA-VERSION 1 :KIND :RETENTION-AUDIT :STATUS :OK :METHOD
 :LENGTH-AND-SHA256 :COPIES
 ((:SOURCE "catalogo.lisp" :COPY "catalog-invalid-nested-paths.lisp"
   :FINGERPRINT
   (:BYTES 413 :SHA256
    "1c443f13f0cc92792bb91695f15041ddfa280f0844389c0df69724bcb972a565"))
  (:SOURCE "collector-process/report.lisp" :COPY "collection-process.lisp"
   :FINGERPRINT
   (:BYTES 362177 :SHA256
    "7b9fc5983f84d0fd5fd194d4b6d42f6568ff0d1e84ffd6db04f11c60cd0372f3"))
  (:SOURCE "collector-process/conservazione.lisp" :COPY
   "collection-process-retention.lisp" :FINGERPRINT
   (:BYTES 1170 :SHA256
    "49712a424e26680241d060968fcc6125e621e6d168affbfb7354a25299bc900b"))
  (:SOURCE "collector-observations/report.lisp" :COPY "collection-report.lisp"
   :FINGERPRINT
   (:BYTES 37062 :SHA256
    "99d3bdf19054d45b283b2a425b5cd614e311090521f69ebae74a04c00cbf7373"))
  (:SOURCE "collector-observations/closed-check.log" :COPY "closed-check.lisp"
   :FINGERPRINT
   (:BYTES 6481 :SHA256
    "3c1c6dd218028ff32d017f848186957d709974d0ece1210fa170de3ee1170d3a")))
 :HELPER-SOURCE "(require :asdf)
(let* ((base (merge-pathnames \"spikes/results/2026-10-31-legal-review/\" (truename \"./\")))
       (copies nil))
  (labels ((fingerprint (path)
             (list :bytes (with-open-file (in path :element-type '(unsigned-byte 8)) (file-length in))
                   :sha256 (subseq (uiop:run-program (list \"shasum\" \"-a\" \"256\" \"--\" (namestring path))
                                                    :output :string) 0 64)))
           (retain (source target)
             (let* ((from (merge-pathnames source base)) (to (merge-pathnames target base))
                    (before (fingerprint from)))
               (when (probe-file to) (error \"Existing alias: ~A\" to))
               (uiop:copy-file from to)
               (unless (and (equal before (fingerprint from)) (equal before (fingerprint to)))
                 (error \"Alias differs: ~A\" to))
               (push (list :source source :copy target :fingerprint before) copies))))
    (retain \"catalogo.lisp\" \"catalog-invalid-nested-paths.lisp\")
    (retain \"collector-process/report.lisp\" \"collection-process.lisp\")
    (retain \"collector-process/conservazione.lisp\" \"collection-process-retention.lisp\")
    (retain \"collector-observations/report.lisp\" \"collection-report.lisp\")
    (retain \"collector-observations/closed-check.log\" \"closed-check.lisp\")
    (with-open-file (out (merge-pathnames \"flat-retention-audit.lisp\" base) :direction :output :if-exists :error)
      (write (list :schema-version 1 :kind :retention-audit :status :ok :method :length-and-sha256
                   :copies (reverse copies) :helper-source (uiop:read-file-string *load-truename*)
                   :reason :catalog-references-must-be-flat :limits '(:no-legal-approval))
             :stream out :readably t :pretty t) (terpri out))
    (with-open-file (out (merge-pathnames \"catalogo.lisp\" base) :direction :output :if-exists :supersede)
      (write '(:schema-version 1 :kind :evidence-catalog :date \"2026-10-31\"
               :entries ((:kind :command-archive-collection :artifact \"collection-report.lisp\"
                          :original \"collection-process.lisp\" :process-artifact \"collection-process-retention.lisp\")
                         (:kind :closed-archive-audit :artifact \"closed-check.lisp\")
                         (:kind :retention-audit :artifact \"retention-audit.lisp\")
                         (:kind :retention-audit :artifact \"flat-retention-audit.lisp\")))
             :stream out :readably t :pretty t) (terpri out))
    (format t \"~S~%\" (list :status :ok :copies (length copies)))))
"
 :REASON :CATALOG-REFERENCES-MUST-BE-FLAT :LIMITS (:NO-LEGAL-APPROVAL))
