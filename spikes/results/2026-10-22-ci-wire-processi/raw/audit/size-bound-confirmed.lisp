(require :asdf)
(require :sb-posix)
(defpackage :arcdocdb.ci (:use :cl))
(load "tools/ci/data.lisp")
(in-package :arcdocdb.ci)
(defun read-archived-data (path)
  (with-open-file (stream path :external-format :utf-8)
    (let ((*read-eval* nil)) (read stream))))
(let* ((summary (read-archived-data "spikes/results/ci/by-source/c03b8fea6f389e27a11fc8a6017d09475584b2c00ec52e133b4218996e585127/runs/39028943515/1/collections/24d50c29cbdc40ed9e1b170b20bbb13731396833dc08c47801f76e6fe040d056/summary.lisp"))
       (plan (read-archived-data "spikes/results/ci/by-source/c03b8fea6f389e27a11fc8a6017d09475584b2c00ec52e133b4218996e585127/runs/39028943515/1/payloads/coverage/7c06dc2ed795b97049bf55bb7a0bf4f302766377d6fe305f505fb2294a730cc0/raw/coverage.expected.lisp"))
       (files (getf plan :expected-files))
       (coverage (find "coverage" (getf summary :jobs) :test #'equal :key (lambda (row) (getf row :job)))))
  ;; Bound fixture, not a replacement for the original failed run.
  (setf (getf coverage :metrics) (list :expected-files files))
  (let* ((result (list :schema-version 1 :kind :ci-job-result :job "sealed"
                       :identity (getf summary :identity) :status :failed
                       :context (getf summary :context) :metrics summary :reason nil))
         (size (length (ci-wire-string result))))
    (assert (> size 65536))
    (format t "Bound fixture: ~D expected rows, ~D canonical characters, limit 65536.~%" (length files) size)
    (ci-save "spikes/out/ci-wire-audit/size-bound-confirmed-result.lisp"
             (list :kind :ci-check :status :passed :scope :fixture-data-only :expected-files (length files) :bytes size))))
