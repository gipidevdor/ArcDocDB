;;;; C4: new real-process failure boundaries, using the strict existing fixture harness.
(load (merge-pathnames "focused.lisp" *load-truename*))
(arcdocdb.local.process.tests::test-REQ-WAL-006-disjoint-real-GET-strong-failure-and-SIGKILL-recovery)
(format t "~S~%" '(:kind :disjoint-process-focused :status :passed))
