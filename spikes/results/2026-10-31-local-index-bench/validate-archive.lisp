(require :asdf)
(load "tools/evidence-storage.lisp")
(let ((root "spikes/results/2026-10-31-local-index-bench/") (commands 0) (results 0))
  (dolist (name '("standard-command" "self-test-command" "self-test-final-command"
                  "focused-command" "focused-2.6.9-command"
                  "component-throughput-command" "component-performance-command"
                  "component-throughput-2.6.9-command" "component-performance-2.6.9-command"
                  "attempt-format-driver-command"))
    (let ((r (arcdocdb.evidence:read-evidence (concatenate 'string root name "/report.lisp")))
          (failed (string= name "attempt-format-driver-command")))
      (assert (eq :stable (getf r :source-consistency)))
      (assert (= (if failed 1 0) (getf r :exit-code)))
      (assert (eq (if failed :failed :ok) (getf r :status)))
      (assert (equalp (getf r :source-blobs-before) (getf r :source-blobs-after)))
      (incf commands)))
  (dolist (name '("focused-run" "focused-2.6.9-run"))
    (let ((r (arcdocdb.evidence:read-evidence (concatenate 'string root name "/result.lisp"))))
      (assert (eq :ok (getf r :status))) (assert (getf r :fixture-removed))
      (assert (= 120 (length (getf r :rows))))
      (assert (eq :detected (getf r :oracle-negative-control)))
      (dolist (row (getf r :rows))
        (assert (= (if (eq :engine (getf row :layer)) 2 11) (length (getf row :windows))))
        (dolist (w (getf row :windows))
          (assert (= (getf w :calls) (length (getf w :ticks))))
          (assert (every (lambda (tick) (not (minusp tick))) (getf w :ticks)))))
    (incf results)))
  (dolist (prefix '("" "comparison-2.6.9/"))
    (let ((r (arcdocdb.evidence:read-evidence (concatenate 'string root prefix "summary.lisp"))))
      (assert (eq :ok (getf r :status)))
      (assert (= 224 (length (getf r :metrics)))) (assert (= 40 (length (getf r :startup))))
      (assert (every (lambda (row) (= 3 (getf row :replicas))) (getf r :metrics)))))
  (let ((r (arcdocdb.evidence:read-evidence (concatenate 'string root "standard-runs/report.lisp"))))
    (assert (eq :complete (getf r :status))) (assert (= 11 (length (getf r :runs)))))
  (loop for i from 1 to 11 do
    (arcdocdb.evidence:read-evidence (format nil "~Astandard-runs/SPK-~2,'0D.lisp" root i)))
  (let ((r (list :schema-version 1 :kind :benchmark-archive-validation :status :ok
                 :command-records commands :focused-profiles results
                 :focused-rows 240 :metric-groups 448 :startup-groups 80
                 :raw-tick-lengths :verified :compression-hashes :verified
                 :sources-before-after :identical :retained-driver-failure :expected)))
    (with-open-file (s (concatenate 'string root "archive-validation.lisp")
                      :direction :output :if-exists :supersede)
      (write r :stream s :pretty t :readably t) (terpri s))
    (write r :pretty t) (terpri)))
