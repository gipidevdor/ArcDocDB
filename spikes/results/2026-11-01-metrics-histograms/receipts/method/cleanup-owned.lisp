;;;; Remove only this completed campaign's explicitly named compiled caches.
(load "spikes/out/metrics-histograms-20261101/packet-support.lisp")
(defparameter *session* (merge-pathnames "spikes/out/metrics-histograms-20261101/" (truename "./")))
(defparameter *targets*
  '("audit-fasl/" "runs/269-v1/fasl/" "runs/269-v2/fasl/"
    "runs/2610-v1/fasl/" "runs/2610-v2/fasl/" "bench-selftest-269-fasl/"
    "bench-negative-269-fasl/" "bench-269-fasl/" "bench-2610-fasl/"))
(defparameter *plan*
  (loop for relative in *targets* for path = (merge-pathnames relative *session*)
        collect (if (probe-file path)
                    (let ((files (arcdocdb.ci::ci-files path :limit 100000 :max-depth 32)))
                      (assert (uiop:string-prefix-p (namestring *session*) (namestring (truename path))))
                      (list :path (namestring path) :status :present :files (length files)
                            :logical-bytes (reduce #'+ files :key #'arcdocdb.evidence:file-bytes :initial-value 0)))
                    (list :path (namestring path) :status :not-created :files 0 :logical-bytes 0))))
(save-data (list :schema-version 1 :kind :owned-cache-cleanup-plan :targets *plan*)
           (merge-pathnames "cleanup-plan.lisp" *session*))
(dolist (row *plan*)
  (when (eq :present (getf row :status))
    (let ((path (pathname (getf row :path))))
      (uiop:delete-directory-tree path :validate (lambda (candidate)
                                                  (and (equal path candidate)
                                                       (uiop:string-prefix-p (namestring *session*) (namestring candidate))))
                                       :if-does-not-exist :error)
      (assert (not (probe-file path))))))
(let ((result (list :schema-version 1 :kind :owned-cache-cleanup :status :ok
                    :targets *plan* :removed-files (reduce #'+ *plan* :key (lambda (row) (getf row :files)))
                    :removed-logical-bytes (reduce #'+ *plan* :key (lambda (row) (getf row :logical-bytes)))
                    :source-and-original-evidence-removed nil :shared-cache-removed nil
                    :limits '(:explicit-campaign-cache-list :not-physical-free-space-measurement
                              :no-other-worktrees :no-git-maintenance))))
  (save-data result (merge-pathnames "spikes/results/2026-11-01-metrics-histograms/cleanup.lisp" (truename "./")))
  (format t "~S~%" result))
