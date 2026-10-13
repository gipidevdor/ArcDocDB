;;;; Osservazioni derivate dai record chiusi; i rilievi statici restano distinti.
(require :asdf)
(load "tools/evidence-storage.lisp")
(defun read-data (path) (arcdocdb.evidence:read-evidence path))
(defun save-data (data path)
  (with-open-file (s path :direction :output :if-exists :error)
    (let ((*print-readably* nil) (*print-escape* t)) (write data :stream s :pretty t) (terpri s))))
(defun closed-command (name &optional required-status)
  (let* ((path (format nil "spikes/out/~A/report.lisp" name)) (data (read-data path)))
    (unless (and (eq :command-verification (getf data :kind))
                 (member (getf data :status) '(:ok :failed))
                 (eq :stable (getf data :source-consistency))
                 (equal (getf data :source-blobs-before) (getf data :source-blobs-after))
                 (integerp (getf data :finished-at-universal-time))
                 (or (null required-status) (eq required-status (getf data :status))))
      (error "Record non chiuso/stabile o esito discordante: ~A" path))
    (values data path)))
(defun output-lines (data)
  (uiop:split-string (getf data :stdout) :separator '(#\Newline)))
(let* ((args (uiop:command-line-arguments))
       (freeze (first args)) (check-name (second args)) (bench-name (third args))
       (base "spikes/results/2026-10-13-get-fonti-serie/")
       (check (closed-command check-name :ok)) (bench (closed-command bench-name :ok))
       (commands nil)
       (test-lines (remove-if-not (lambda (line) (uiop:string-prefix-p "ok    TEST-" line))
                                 (output-lines check)))
       (directory-tests (count-if (lambda (line) (search "SERIES-GET-" line)) test-lines))
       (mutants (read-data "spikes/out/get-series-mutations-h/report.lisp"))
       (summary (read-data (concatenate 'string base "benchmark-summary.lisp"))))
  (unless (and (= 3 (length args)) (string= freeze (getf (getf check :environment) :commit))
               (string= freeze (getf (getf bench :environment) :commit))
               (> (length test-lines) 990) (= 27 directory-tests)
               (= (length test-lines) (length (remove-duplicates test-lines :test #'string=)))
               (search "build e test: nessun avviso, tutti i controlli superati" (getf check :stdout))
               (eq :ok (getf mutants :status))
               (eq :baseline-passed (getf (getf mutants :baseline) :result))
               (= 4 (length (getf mutants :mutants)))
               (every (lambda (m) (eq :detected (getf m :result))) (getf mutants :mutants))
               (eq :ok (getf summary :status)) (= 4800000 (getf summary :measured-cycles)))
    (error "Campagna finale incompleta o freeze diverso."))
  (dolist (dir (sort (uiop:subdirectories "spikes/out/") #'string< :key #'namestring))
    (let* ((name (car (last (pathname-directory dir)))) (path (merge-pathnames "report.lisp" dir)))
      (when (and (digit-char-p (char name 0)) (search "-command-" name) (probe-file path))
        (unless (eq :running (getf (read-data path) :status))
          (let ((record (closed-command name)))
            (push (list :producer name :status (getf record :status) :exit-code (getf record :exit-code)
                        :freeze (getf (getf record :environment) :commit)
                        :command (getf record :command) :source-consistency :stable) commands))))))
  (let ((record
          (list :schema-version 1 :kind :get-series-development-history :status :recorded
                :accepted-freeze freeze :check-producer check-name :benchmark-producer bench-name
                :named-tests (length test-lines) :new-series-get-tests directory-tests
                :mutants-detected 4 :baseline-passed t :commands (nreverse commands)
                :review '(:c1-two-reads-one-independent-reviewer-and-delta-completed
                          :c4-independent-final-reread-incomplete :c4-integrator-fixes-and-recorded-checks)
                :closed-agents '("Hilbert" "Raman" "Erdos" "Socrates" "Lagrange")
                :static-fixes '(:cache-arity-before-first-run :bounded-duplicate-search-geometry
                               :preserve-owner-before-controller-health :raw-producer-capture
                               :proof-helper-before-after-digests :no-obsolete-mutation-directory-key)
                :earlier-attempts
                '((:freeze "51c4c1f" :observed :fixture-output-sentinel :fix "3844d59")
                  (:freeze "51c4c1f" :observed :collector-capture-marker :fix "3844d59")
                  (:freeze "3844d59" :observed :fixture-lotto-owned :fix "5175dc7")
                  (:freeze "5175dc7" :observed :fixture-primary-csn-not-increasing :fix "0c8808b")
                  (:freeze "e6e0497" :observed :native-file-identity-integration :tests-added "ffe191a")
                  (:freeze "ffe191a" :observed :capture-confused-created-output-with-helper
                   :fix :invoked-sbcl-script-or-load-only)
                  (:freeze "ffe191a" :observed :derived-base-char-array-not-canonical
                   :fix :canonical-escaped-string-writing)
                  (:base "baaa68c" :observed :integrated-42-independent-outcome-tests
                   :freeze "92fa92b" :product-read-blobs-unchanged)
                  (:freeze "92fa92b" :observed :independent-c4-script-option-boundary-finding
                   :fix :stop-parsing-after-script-file))
                :negative-checks '(:benchmark-missing-completed-expected-exit-1
                                   :derive-rejects-self-test-instead-of-full-campaign)
                :patch-check '(:own-increment-from-baaa68c-passed
                               :full-base-4344d9e-rejected-imported-eof-blank-line
                               :raw-compiler-whitespace-retained-verbatim)
                :coverage '(:files 3 :expressions-covered 339 :expressions-total 363
                            :branches-covered 41 :branches-total 42
                            :remaining-branch :search-bound-impossible-with-valid-geometry-and-fixed-budget
                            :not-condition-coverage-or-mcdc)
                :limits '(:attempts-retained-not-promoted :static-distinct-from-dynamic-evidence
                          :closed-controller-benchmark-only :no-full-db-c1-qualification
                          :active-empty-bootstrap-rotation-relocation-reclaim-next-increment
                          :point-in-time-command-inventory-excludes-own-running-record))))
    (save-data record (concatenate 'string base "history.lisp"))
    (format t "~S~%" (list :status :ok :named-tests (length test-lines) :new-tests directory-tests
                            :closed-commands (length commands) :accepted-freeze freeze))))
