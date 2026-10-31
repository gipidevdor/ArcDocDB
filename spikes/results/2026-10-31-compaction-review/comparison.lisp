(load "tools/evidence-storage.lisp")
(let ((old (getf (arcdocdb.evidence:read-evidence "spikes/results/2026-10-31-engine-compaction/metrics.lisp") :results))
      (new (getf (arcdocdb.evidence:read-evidence "spikes/results/2026-10-31-compaction-review/metrics.lisp") :results)))
  (format t "# Compaction benchmark comparison~%~%| SBCL | Format | Storage | Before ms | After ms | Time reduction | Read-byte reduction | GET/s after | GET P99 after µs |~%|---|---:|---|---:|---:|---:|---:|---:|---:|~%")
  (loop for a in old for b in new do
    (let* ((x (getf a :compaction)) (y (getf b :compaction)) (gx (getf (second (getf b :gets)) :median-ops-per-second))
           (gp (getf (second (getf b :gets)) :median-p99-us)))
      (assert (and (equal (getf a :sbcl) (getf b :sbcl)) (eq (getf a :mode) (getf b :mode)) (= (getf a :version) (getf b :version))))
      (format t "| ~A | ~D | ~A | ~,3F | ~,3F | ~,1F% | ~,1F% | ~D | ~D |~%"
              (getf b :sbcl) (getf b :version) (getf b :mode)
              (* 1000 (getf x :wall-seconds)) (* 1000 (getf y :wall-seconds))
              (* 100 (- 1 (/ (getf y :wall-seconds) (getf x :wall-seconds))))
              (* 100 (- 1 (/ (getf y :read-bytes) (getf x :read-bytes))))
              (round gx) (round gp)))))
