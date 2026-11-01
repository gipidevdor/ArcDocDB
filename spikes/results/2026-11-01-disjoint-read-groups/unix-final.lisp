;;;; C4: rerun every affected Unix case after making the loss-injection fixtures causal.
(load (merge-pathnames "focused.lisp" *load-truename*))
(arcdocdb.local.process.tests:run)
(format t "~S~%" '(:kind :disjoint-unix-final :status :passed))
