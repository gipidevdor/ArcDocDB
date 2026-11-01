;;;; Finite publication receipt: hashes cover all preceding artifacts, not this receipt itself.
(load "spikes/out/metrics-main-merge-20261101/packet-support.lisp")
(defparameter *session* (merge-pathnames "spikes/out/metrics-main-merge-20261101/" (truename "./")))
(defparameter *published* (merge-pathnames "spikes/results/2026-11-01-metrics-main-merge/" (truename "./")))
(defparameter *receipts* (merge-pathnames "receipts/" *published*))
(when (probe-file *receipts*) (error "Exclusive publication receipts already exist."))
(ensure-directories-exist *receipts*)
(defparameter *commands* nil)
(dolist (label '("prepare" "collect" "final-check" "cleanup"))
  (let* ((directory (merge-pathnames (format nil "receipts/~A/" label) *session*))
         (record (arcdocdb.evidence:read-evidence (merge-pathnames "report.lisp" directory))))
    (assert (eq :ok (getf record :status))) (assert (eql 0 (getf record :exit-code)))
    (assert (eq :stable (getf record :source-consistency)))
    (multiple-value-bind (rows process) (add-command-record directory label *receipts*)
      (declare (ignore rows)) (push process *commands*))))
(dolist (pair '(("collection-observations/report.lisp" "collection.lisp")
                ("collection-observations/closed-check.log" "closed-check.log")
                ("cleanup-plan.lisp" "cleanup-plan.lisp")
                ("cleanup-owned.lisp" "method/cleanup-owned.lisp")
                ("close-publication.lisp" "method/close-publication.lisp")
                ("packet-support.lisp" "method/packet-support.lisp")))
  (add-compact-file (merge-pathnames (first pair) *session*) *receipts* (second pair)))
(let* ((argv '("git" "diff" "--quiet" "dd755e0080242e36a6cda1182117e3cddb230319" "--"
                "src" "tests" "tools" "arcdocdb.asd")))
  (multiple-value-bind (stdout stderr code)
      (uiop:run-program argv :output :string :error-output :string :ignore-error-status t)
    (assert (and (zerop code) (zerop (length stdout)) (zerop (length stderr))))))
(let* ((files (arcdocdb.ci::ci-files *published* :limit 100000 :max-depth 32))
       (rows (mapcar (lambda (path) (list :path (enough-namestring path *published*)
                                         :bytes (arcdocdb.evidence:file-bytes path)
                                         :sha256 (arcdocdb.evidence:file-sha256 path))) files))
       (bytes (reduce #'+ rows :key (lambda (row) (getf row :bytes)) :initial-value 0))
       (result (list :schema-version 1 :kind :metrics-evidence-closure :status :ok
                     :date-universal-time (get-universal-time)
                     :lisp (lisp-implementation-type) :version (lisp-implementation-version)
                     :os (software-type) :machine (machine-type)
                     :qualified-product-commit "dd755e0080242e36a6cda1182117e3cddb230319"
                     :product-test-tool-and-asd-diff :empty :documentation-followup t
                     :commands (nreverse *commands*) :files rows :file-count (length rows)
                     :stored-logical-bytes bytes
                     :limits '(:finite-preceding-artifact-receipt :self-excluded
                               :no-requirement-or-engine-performance-promotion
                               :all-source-command-output-preserved :not-physical-disk-usage))))
  ;; A second read detects a change between inventory and receipt creation.
  (dolist (row rows)
    (let ((path (merge-pathnames (getf row :path) *published*)))
      (assert (= (getf row :bytes) (arcdocdb.evidence:file-bytes path)))
      (assert (string= (getf row :sha256) (arcdocdb.evidence:file-sha256 path)))))
  (save-data result (merge-pathnames "closure.lisp" *published*))
  (format t "~S~%" (list :status :ok :files (length rows) :stored-logical-bytes bytes
                          :receipt (namestring (merge-pathnames "closure.lisp" *published*)))))
