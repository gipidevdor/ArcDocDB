;;;; Focused offline-verifier campaign; driver included in source snapshots.
;;; REQ: REQ-AFF-010 REQ-VAL-001
(require :asdf)
(setf asdf:*compile-file-failure-behaviour* :error asdf:*compile-file-warnings-behaviour* :error)
(handler-bind ((warning (lambda (condition)
                         (unless (typep condition 'sb-kernel:redefinition-warning)
                           (error "Unexpected compilation warning: ~A" condition)))))
  (asdf:load-asd (truename "arcdocdb.asd"))
  (asdf:load-system "arcdocdb/tests"))
(uiop:symbol-call :arcdocdb.verify.tests :run)
