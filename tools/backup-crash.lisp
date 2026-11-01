;;;; C4 child: actual offline backup/restore through public APIs, no constructed recovery state.
;;; REQ: REQ-AFF-014 REQ-AFF-013 REQ-VAL-001
(require :asdf)
(asdf:load-asd (merge-pathnames "../arcdocdb.asd" *load-truename*))
(asdf:load-system "arcdocdb/tests")
(uiop:symbol-call :arcdocdb.backup.tests :child-main (uiop:command-line-arguments))
