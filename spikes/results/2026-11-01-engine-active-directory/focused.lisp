(require :asdf)
(asdf:load-asd (truename "arcdocdb.asd"))
(setf asdf:*compile-file-warnings-behaviour* :error asdf:*compile-file-failure-behaviour* :error)
(asdf:load-system "arcdocdb/tests")
(let ((tests '(arcdocdb.get.active.tests::test-REQ-AFF-008-active-append-startup-exact-budget-and-empty-root
 arcdocdb.get.active.tests::test-REQ-WAL-005-active-append-open-refusals-preserve-entire-arena
 arcdocdb.get.active.tests::test-REQ-WAL-006-active-append-v1-v2-pages-and-tombstone-boundaries
 arcdocdb.get.active.tests::test-REQ-WAL-006-active-append-prepared-tail-is-not-a-reader-frontier
 arcdocdb.get.active.tests::test-REQ-IDX-001-active-append-old-root-ignores-all-unpublished-tail-fields
 arcdocdb.get.active.tests::test-REQ-AFF-002-active-append-damaged-prefix-faults-before-IO
 arcdocdb.get.active.tests::test-REQ-WAL-005-active-append-reused-tail-faults-without-CSN
 arcdocdb.get.active.tests::test-REQ-WAL-005-active-append-known-CSN-order-refusal-keeps-tail-unused
 arcdocdb.get.active.tests::test-REQ-WAL-006-active-append-incomplete-copy-and-adoption-never-reuse
 arcdocdb.get.active.tests::test-REQ-IDX-001-active-append-65536-page-search-boundaries
 arcdocdb.engine.tests::test-REQ-WAL-006-engine-append-arena-keeps-old-root-prefix-v1-v2
 arcdocdb.engine.tests::test-REQ-IDX-013-engine-append-arena-follows-ACTIVE-not-primary-backend)))
  (dolist (test tests) (funcall test) (format t "~&ok ~A~%" test))
  (format t "~S~%" (list :kind :active-arena-focused :status :passed :tests (length tests))))
