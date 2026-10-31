(require :asdf)
(asdf:load-asd (truename "arcdocdb.asd"))
(asdf:load-system "arcdocdb/tests")
(arcdocdb.local.process.tests::test-REQ-WAL-002-real-Unix-eight-strong-writes-one-flush-and-SIGKILL)
