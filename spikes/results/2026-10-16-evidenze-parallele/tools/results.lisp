(require :asdf)
(load "tools/evidence-storage.lisp")
(let ((rows nil))
  (dolist (path (uiop:command-line-arguments))
    (let* ((record (arcdocdb.evidence:read-evidence path))
           (stdout (getf record :stdout))
           (parsed (when (and stdout (plusp (length stdout)) (char= #\( (char stdout 0)))
                     (let ((*read-eval* nil)) (read-from-string stdout))))
           (embedded (and stdout (search "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-PARALLEL-SELF-TEST" stdout))))
      (unless (and (member (getf record :status) '(:ok :failed)) (eq :stable (getf record :source-consistency)))
        (error "Record non concluso/stabile: ~A." path))
      (push (list :record path :command (getf record :command) :status (getf record :status)
                  :wall-seconds (getf record :wall-seconds) :result parsed
                  :self-test (when embedded (let ((*read-eval* nil)) (read-from-string stdout nil nil :start embedded)))
                  :reason (cond ((search "4001155302-command" path) :ps-enumeration-failure-observed)
                                ((search "4001155836-command" path) :interrupted-for-cleanup-fix)
                                ((search "4001156028-command" path) :interrupted-for-main-integration)
                                ((search "4001156102-command" path) :timeout-fixture-capture-error)
                                (t :completed))
                  :stderr-empty (equal "" (getf record :stderr))) rows)))
  (unless (eq :ok (getf (first rows) :status)) (error "La verifica finale non è positiva."))
  (let ((data (list :schema-version 1 :kind :parallel-evidence-qualification :status :ok
                    :records (nreverse rows)
                    :reviews '((:scope :resource-contract :blocking-findings 0)
                               (:scope :worker-protocol-and-process-ownership
                                :initial-qualified-source-blob "d75c465bff01c0f2ba70bb07de2032ee47c392d7"
                                :final-source-blob "e3df9f52590ce2de86ad75b872c859b81bbcc518"
                                :blocking-findings 0))
                    :limits '(:c4-tool-only :no-c1-or-mcdc-closure
                              :failed-attempts-retained-not-reinterpreted
                              :local-single-sample-timing-before-snapshot-retries
                              :serial-first :uncontrolled-load-and-cache))))
    (with-open-file (out "spikes/out/evidence-parallel-20261016/results-report.lisp"
                         :direction :output :if-exists :error)
      (write data :stream out :pretty t) (terpri out))
    (write data :pretty t) (terpri)))
