(require :asdf)
(setf asdf:*compile-file-warnings-behaviour* :error asdf:*compile-file-failure-behaviour* :error)
(asdf:load-asd (truename "arcdocdb.asd"))
(asdf:load-system "arcdocdb/tests")
(let ((tests '(arcdocdb.engine.tests::test-REQ-CCH-001-engine-cache-geometry-exact-minimum-and-zero
               arcdocdb.engine.tests::test-REQ-CCH-002-engine-active-closed-and-reopen-hits-v1-v2-all-modes
               arcdocdb.engine.tests::test-REQ-CCH-004-engine-corrupt-cache-rereads-segment-and-notifies
               arcdocdb.engine.tests::test-REQ-CCH-004-engine-cache-and-segment-corruption-never-delivered
               arcdocdb.engine.tests::test-REQ-CCH-002-engine-cache-updates-delete-compaction-and-mode-changes
               arcdocdb.engine.tests::test-REQ-CCH-001-engine-zero-budget-and-close-release
               arcdocdb.engine.tests::test-REQ-CCH-004-engine-warm-cache-never-bypasses-canonical-closed-proof
               arcdocdb.local.server.tests::test-REQ-CCH-001-local-record-cache-cli-and-early-validation
               arcdocdb.local.server.tests::test-REQ-CCH-002-local-dispatch-verified-cache-hit-and-fallback)))
  (dolist (test tests) (funcall test) (format t "~&ok ~A~%" test))
  (format t "~&~S~%" (list :kind :record-cache-focused :status :passed :tests (length tests))))
