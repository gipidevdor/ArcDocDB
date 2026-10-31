;;; C4: validate owned command archives and unmodified-driver result matrices, READ-EVAL disabled.
(require :asdf)
(load "tools/evidence-storage.lisp")
(let ((root "spikes/results/2026-10-31-local-performance-fix/") (count 0))
  (dolist (name '("attempt-mnemonic-disassembly" "pre-owner-qualification" "targeted-qualification"
                  "cache-native-1" "cache-software" "cache-native-2"
                  "strict-software-run" "strict-2.6.9-run" "check-run" "check-run/ci-selftest"
                  "final-cache-native-1" "final-cache-software" "final-cache-native-2"
                  "bench-2.6.10-command" "bench-2.6.9-command" "get-throughput-command"
                  "attempt-get-worker-directory" "get-workers-command"))
    (let ((r (arcdocdb.evidence:read-evidence (concatenate 'string root name "/report.lisp")))
          (failed (member name '("attempt-mnemonic-disassembly" "attempt-get-worker-directory") :test #'string=)))
      (assert (eq :stable (getf r :source-consistency)))
      (assert (= (if failed 1 0) (getf r :exit-code)))
      (assert (eq (if failed :failed :ok) (getf r :status)))
      (assert (equalp (getf r :source-blobs-before) (getf r :source-blobs-after)))
      (incf count)))
  (let ((frozen (getf (arcdocdb.evidence:read-evidence (concatenate 'string root "check-run/report.lisp"))
                     :source-blobs-before)))
    (dolist (name '("strict-software-run" "strict-2.6.9-run" "bench-2.6.10-command"
                    "bench-2.6.9-command" "get-throughput-command" "get-workers-command"))
      (assert (equalp frozen (getf (arcdocdb.evidence:read-evidence
                                   (concatenate 'string root name "/report.lisp")) :source-blobs-before)))))
  (dolist (version '("2.6.10" "2.6.9"))
    (let* ((r (arcdocdb.evidence:read-evidence (format nil "~Abench-~A-run/result.lisp" root version)))
           (s (arcdocdb.evidence:read-evidence (format nil "~Ametrics-~A/summary.lisp" root version))))
      (assert (eq :ok (getf r :status))) (assert (= 120 (length (getf r :rows))))
      (assert (getf r :fixture-removed)) (assert (eq :detected (getf r :oracle-negative-control)))
      (assert (string= version (getf r :lisp)))
      (assert (= 224 (length (getf s :metrics)))) (assert (= 40 (length (getf s :startup))))
      (dolist (row (getf r :rows))
        (assert (= (if (eq :engine (getf row :layer)) 2 11) (length (getf row :windows))))
        (dolist (w (getf row :windows))
          (assert (= (getf w :calls) (length (getf w :ticks))))
          (assert (every (lambda (tick) (not (minusp tick))) (getf w :ticks)))))))
  (let ((r (arcdocdb.evidence:read-evidence (concatenate 'string root "get-throughput-run/report.lisp"))))
    (assert (eq :ok (getf r :status))) (assert (eq :arm64-crc32c (getf r :selected-backend)))
    (assert (= 432 (length (getf r :windows))))
    (assert (zerop (getf r :sensor-empty-bytes))) (assert (plusp (getf r :sensor-positive-bytes))))
  (let ((r (arcdocdb.evidence:read-evidence (concatenate 'string root "get-workers-run/report.lisp"))))
    (assert (eq :ok (getf r :status))) (assert (= 0 (getf r :exit-code)))
    (assert (eq :ok (getf (getf r :self-test) :status)))
    (assert (= 90 (length (getf r :serial)))) (assert (= 270 (length (getf r :parallel)))))
  (let ((r (list :schema-version 1 :kind :local-performance-validation :status :ok
                 :command-records count :expected-driver-failures 2
                 :final-source-gates :passed :source-before-after :identical
                 :raw-matrix-rows 240 :metric-groups 448 :startup-groups 80
                 :raw-tick-lengths :verified :final-gate-source-maps :identical :native-crc :observed :component-windows 792)))
    (with-open-file (s (concatenate 'string root "validation.lisp") :direction :output :if-exists :supersede)
      (write r :stream s :pretty t :readably t) (terpri s))
    (write r :pretty t) (terpri)))
