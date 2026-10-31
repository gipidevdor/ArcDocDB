(require :asdf)
(asdf:load-asd (truename "arcdocdb.asd"))
(setf asdf:*compile-file-warnings-behaviour* :error asdf:*compile-file-failure-behaviour* :error)
(asdf:load-system "arcdocdb/tests")
(let ((tests '(arcdocdb.engine.tests::test-REQ-WAL-002-group-one-flush-distinct-CSNs-and-reopen-v1-v2-all-modes
 arcdocdb.engine.tests::test-REQ-IDX-005-group-cumulative-load-and-repeated-key-arena
 arcdocdb.engine.tests::test-REQ-IDX-005-group-cumulative-sequence-and-revision-headroom
 arcdocdb.engine.tests::test-REQ-WAL-005-group-input-budgets-and-CSN-exhaustion-before-effects
 arcdocdb.engine.tests::test-REQ-WAL-006-group-model-rotation-compaction-migration-and-recovery
 arcdocdb.engine.tests::test-REQ-WAL-006-group-admitted-failure-no-output-no-reentry
 arcdocdb.engine.tests::test-REQ-IDX-012-group-delta-unique-reservations-and-one-renewal
 arcdocdb.local.server.tests::test-REQ-WAL-002-local-ready-writes-share-one-flush-and-clear-queue
 arcdocdb.local.server.tests::test-REQ-IPC-002-local-ready-GET-order-is-a-write-barrier
 arcdocdb.local.server.tests::test-REQ-IPC-002-local-group-refusal-splits-only-before-admission
 arcdocdb.local.server.tests::test-REQ-IPC-002-local-pending-deadline-before-group-admission
 arcdocdb.local.server.tests::test-REQ-WAL-006-local-group-admitted-fault-never-retries-or-responds)))
  (dolist (test tests) (funcall test) (format t "~&ok ~A~%" test))
  (format t "~S~%" (list :kind :group-focused :status :passed :tests (length tests))))
