;;;; C4: forced warning-as-error product build and affected offline suites.
;;; REQ: REQ-AFF-014 REQ-AFF-010 REQ-VAL-001
(require :asdf)
(setf asdf:*compile-file-failure-behaviour* :error asdf:*compile-file-warnings-behaviour* :error)
(handler-bind ((warning (lambda (condition)
                          (unless (typep condition 'sb-kernel:redefinition-warning) (error condition)))))
  (asdf:load-asd (merge-pathnames "arcdocdb.asd" (truename "./")))
  (asdf:load-system "arcdocdb" :force t)
  (asdf:load-system "arcdocdb/tests"))
(uiop:symbol-call :arcdocdb.backup.tests :run)
(uiop:symbol-call :arcdocdb.verify.tests :run)
(format t "~&Forced product compilation and both offline suites passed.~%")
