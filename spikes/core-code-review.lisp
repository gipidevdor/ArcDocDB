;;;; Scoped review campaign; no product code or external dependencies.
;;;; REQ: REQ-VAL-001 REQ-AFF-003 REQ-AFF-012
(require :asdf)
(setf asdf:*compile-file-failure-behaviour* :error
      asdf:*compile-file-warnings-behaviour* :error)

(defun reject-review-warning (condition)
  (unless (typep condition 'sb-kernel:redefinition-warning)
    (error "Review compilation rejected ~A: ~A" (type-of condition) condition)))

(handler-bind ((warning #'reject-review-warning))
  (asdf:load-asd (truename "arcdocdb.asd"))
  (asdf:load-system "arcdocdb" :force t)
  (asdf:load-system "arcdocdb/tests"))

(let ((suites '("ARCDOCDB.FOUNDATION.TESTS" "ARCDOCDB.CSN.TESTS"
                "ARCDOCDB.MVCC.TESTS" "ARCDOCDB.EPOCHS.TESTS"
                "ARCDOCDB.READ.TESTS" "ARCDOCDB.CACHE.TESTS"
                "ARCDOCDB.EXECUTION.TESTS" "ARCDOCDB.SCHEDULER.TESTS"
                "ARCDOCDB.STORAGE.TESTS" "ARCDOCDB.IO.TESTS"
                "ARCDOCDB.WAL.TESTS" "ARCDOCDB.SERIES.TESTS"))
      (completed nil))
  (dolist (package suites)
    (format t "~&REVIEW-SUITE ~A~%" package)
    (unless (eq t (uiop:symbol-call package "RUN"))
      (error "Review suite did not report success: ~A" package))
    (push package completed))
  (format t "~&~S~%"
          (list :schema-version 1 :kind :core-code-review-checks :status :passed
                :suites (nreverse completed) :suite-count (length suites)
                :limits '(:scoped-existing-tests :single-platform
                          :not-performance-measurements :not-defect-absence-proof))))
