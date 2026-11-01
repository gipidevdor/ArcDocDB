;;;; C4: force warning-as-error product build, then only suites affected by the integration.
;;; REQ: REQ-AFF-014 REQ-AFF-010 REQ-VAL-001
(require :asdf)
(setf asdf:*compile-file-failure-behaviour* :error
      asdf:*compile-file-warnings-behaviour* :error)
(handler-bind ((warning (lambda (condition)
                          (unless (typep condition 'sb-kernel:redefinition-warning)
                            (error condition)))))
  (asdf:load-asd (merge-pathnames "arcdocdb.asd" (truename "./")))
  (asdf:load-system "arcdocdb" :force t)
  (asdf:load-system "arcdocdb/tests"))
(assert (= 60 (length (uiop:symbol-call :arcdocdb.ci.tests :suite-specifications))))
(dolist (package '(:arcdocdb.backup.tests :arcdocdb.verify.tests :arcdocdb.metrics.tests
                   :arcdocdb.local.wire.tests :arcdocdb.local.native.tests
                   :arcdocdb.local.server.tests :arcdocdb.local.process.tests))
  (uiop:symbol-call package :run))
(format t "~&Integrated backup, verifier, metrics and four Unix suites passed; product compiled without warnings.~%")
