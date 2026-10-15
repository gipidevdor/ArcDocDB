(load "tools/evidence-storage.lisp")
(dolist (name '("4001084677-command-26041-0" "4001084717-command-26681-0"
                "4001084717-command-26680-0" "4001084796-command-28225-0"
                "4001084796-command-28226-0" "4001084944-command-30704-0"
                "4001084944-command-30703-0" "4001084951-command-30845-0"))
  (let* ((path (format nil "spikes/out/~A/report.lisp" name))
         (r (arcdocdb.evidence:read-evidence path)) (out (getf r :stdout)))
    (format t "~A ~S exit=~S ~S seconds=~S sources=~D stderr=~D~%"
            name (getf r :status) (getf r :exit-code) (getf r :source-consistency)
            (getf r :wall-seconds) (length (getf r :source-blobs-after)) (length (getf r :stderr)))
    (when (or (search "26041" name) (search "30845" name))
      (write-string (subseq out (max 0 (- (length out) 700)))))))
