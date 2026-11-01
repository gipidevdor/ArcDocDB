(require :asdf)
(setf asdf:*compile-file-warnings-behaviour* :error)
(asdf:load-asd (truename "arcdocdb.asd"))
(asdf:load-system "arcdocdb/tests")
(let ((count 0))
  (dolist (name '("TEST-REQ-WAL-002-BUFFERED-IDENTICAL-MIXED-SEALS-ONE-WRITE-AND-REUSE"
                  "TEST-REQ-AFF-008-BUFFERED-FALLBACK-AND-EXACT-64KIB-CAPACITY"
                  "TEST-REQ-AFF-008-BUFFER-TYPE-ALIAS-AND-FILE-REFUSAL-BEFORE-ACQUISITION"
                  "TEST-REQ-WAL-006-BUFFERED-EVERY-BYTE-CUT-AND-SHORT-WRITE-PREFIX-MODEL"
                  "TEST-REQ-AFF-001-BUFFERED-HARD-ERRORS-NO-FALLBACK-OR-FLUSH"
                  "TEST-REQ-AFF-004-ALL-APPEND-EXITS-FAULT-AND-PRESERVE-PRIMARY-CONTROL"
                  "TEST-REQ-AFF-001-BUFFERED-FLUSH-FAILURE-PRESERVES-WRITTEN-FRONTIER"
                  "TEST-REQ-AFF-004-ACQUISITION-EXIT-FAULTS-ONLY-OWNED-GROUP"
                  "TEST-REQ-AFF-001-BUFFERED-SHAPE-AND-RETURN-INVARIANTS-FAULT-BEFORE-CONFIRMATION"))
    (let ((test (find-symbol name :arcdocdb.wal.tests)))
      (unless (and test (fboundp test)) (error "Missing focused test: ~A" name))
      (funcall test) (incf count) (format t "ok ~A~%" name)))
  (arcdocdb.engine.tests::test-REQ-WAL-002-group-one-flush-distinct-CSNs-and-reopen-v1-v2-all-modes)
  (arcdocdb.engine.tests::test-REQ-WAL-002-engine-bounded-append-both-formats-and-primary-modes)
  (format t "~S~%" (list :kind :group-append-focused :status :passed :new-methods (1+ count) :existing-group-methods 1)))
