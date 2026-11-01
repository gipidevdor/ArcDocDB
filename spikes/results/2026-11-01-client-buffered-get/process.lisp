;;;; C4: focused strict client/codec checks followed by the new real-process/recovery campaign.
(load (merge-pathnames "focused.lisp" *load-truename*))
(arcdocdb.local.process.tests::test-REQ-IPC-002-get-into-real-formats-primary-modes-and-SIGKILL-reopen)
(format t "~S~%" '(:kind :buffered-process-focused :status :passed))
