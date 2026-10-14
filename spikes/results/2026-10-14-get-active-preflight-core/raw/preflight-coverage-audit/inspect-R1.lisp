(require :asdf)
(let* ((root (truename "./"))
       (commit "8c0866711c50d047f87b9c484ce56d42a87ba19c")
       (reader "tools/evidence-storage.lisp")
       (git-blob (string-trim '(#\Newline #\Return)
                   (uiop:run-program (list "git" "rev-parse" (concatenate 'string commit ":" reader))
                                     :output :string)))
       (actual (string-trim '(#\Newline #\Return)
                 (uiop:run-program (list "git" "hash-object" "--" reader) :output :string))))
  (assert (equal git-blob actual))
  (assert (equal commit (string-trim '(#\Newline #\Return)
                         (uiop:run-program '("git" "rev-parse" "HEAD") :output :string))))
  (load (merge-pathnames reader root) :verbose nil :print nil)
  (let* ((audit (uiop:symbol-call :arcdocdb.evidence :read-evidence
                   "spikes/out/preflight-coverage-audit/coverage-audit-R1.lisp"))
         (native (uiop:symbol-call :arcdocdb.evidence :read-evidence
                    "spikes/out/4000985824-command-62860-0/report.lisp"))
         (sha (uiop:symbol-call :arcdocdb.evidence :file-sha256
                 "spikes/out/preflight-coverage-audit/audit.lisp")))
    (assert (and (eq :ok (getf audit :status))
                 (eq :get-active-preflight-coverage-independent-audit (getf audit :kind))
                 (equal commit (getf audit :expected-commit))
                 (equal "20441b55034443585b011ec9949c9901441593add62dbb3d82f79e472fe6aa19" sha)
                 (equal sha (getf audit :auditor-sha256))
                 (getf audit :two-pass-byte-inventories-match)
                 (getf audit :source-path-blob-and-clean-head-before-after)
                 (= 42 (length (getf audit :active-test-names)))
                 (= 42 (length (getf audit :closed-test-names)))
                 (eq :ok (getf native :status)) (= 0 (getf native :exit-code))
                 (eq :stable (getf native :source-consistency))
                 (zerop (length (getf native :stderr)))
                 (equal commit (getf (getf native :environment) :commit))
                 (equal (getf native :source-blobs-before) (getf native :source-blobs-after))
                 (equal (sort (copy-list (getf native :source-blobs-before)) #'string<
                              :key (lambda (entry) (getf entry :path)))
                        (getf audit :complete-source-path-blobs))))
    (assert (equal '("ce7877778ada522c45a3136b6f74997574e41d154004bfb0f8aaf4fd24621163"
                     "2e21d354370e68bb215d59933190fec1267386610d99fc256fff423b509c37bc")
                   (mapcar (lambda (entry) (getf entry :sha256)) (getf audit :provenance-originals))))
    (with-standard-io-syntax
      (let ((*print-pretty* t))
        (write (list :schema-version 1 :kind :preflight-coverage-audit-final-inspection :status :ok
                     :native-command-report "spikes/out/4000985824-command-62860-0/report.lisp"
                     :native-stdout (getf native :stdout) :native-stderr-bytes 0
                     :expected-commit commit :source-count (getf audit :source-count)
                     :registered-asdf-sources (length (getf audit :registered-asdf-source-files))
                     :auditor-sha256 sha :provenance-original-sha-match t
                     :two-pass-byte-inventories-match t
                     :results (loop for result in (getf audit :results) collect
                                 (list :scope (getf result :scope) :named-tests (getf result :named-tests)
                                       :sources (getf result :source-files) :html-files (getf result :html-files)
                                       :totals (getf result :totals)
                                       :private-fasl (getf (getf result :fasl) :fasl-count)
                                       :preflight (find "src/get-resolver/active-preflight.lisp"
                                                        (getf result :files) :test #'equal
                                                        :key (lambda (file) (getf file :path)))))))
        (terpri)))))
