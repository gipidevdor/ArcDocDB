;;;; C4: targeted new real-process method; complete affected-suite coverage is separate.
(require :asdf)
(asdf:load-asd (truename "arcdocdb.asd")) (asdf:load-system "arcdocdb/tests")
(arcdocdb.local.process.tests::test-REQ-IPC-002-group-buffer-real-formats-primary-modes-overflow-and-SIGKILL-reopen)
(format t "~S~%" '(:kind :group-buffer-process-new :status :passed :formats 2 :primary-modes 2 :children 8 :SIGKILLs 4))
