(:SCHEMA-VERSION 1 :KIND :IO-RENAME-MUTATION-CAMPAIGN-CONFIG :ARGV
 ("--self-test" "spikes/out/io-rename-self-test-mutation-E/") :SOURCE-ROOT
 "/Users/gpicchiarelli/.codex/worktrees/io-rinomina/ArcDocDB/" :TARGETS
 ((:NAME "accept-same-name" :FILE "src/io/rename.lisp" :TEST
   ("ARCDOCDB.IO.TESTS" "TEST-REQ-REC-001-IO-RENAME-SAME-NAME-SAME-STRING")
   :BEFORE "(when (string= source destination)
    (error 'invalid-argument :reason :io-rename-same-name))"
   :AFTER "(progn nil)" :EXPECTED-FAILURE :SAME-NAME-ADMITTED)
  (:NAME "allow-slash-name" :FILE "src/io/rename.lisp" :TEST
   ("ARCDOCDB.IO.TESTS" "TEST-REQ-REC-001-IO-RENAME-SLASH-NAME") :BEFORE
   "(and (<= 1 code 127) (char/= character #\\/))" :AFTER "(<= 1 code 127)"
   :EXPECTED-FAILURE :SLASH-NAME-ADMITTED)
  (:NAME "accept-nonzero-callback-result" :FILE "src/io/rename.lisp" :TEST
   ("ARCDOCDB.IO.TESTS" "TEST-REQ-AFF-001-IO-RENAME-NIL-RESULT-FAULTS") :BEFORE
   "(unless (eql result 0) (fallisci-rinomina directory :io-rename-result))"
   :AFTER "(when (eql result 0) nil)" :EXPECTED-FAILURE
   :INVALID-CALLBACK-RESULT-ADMITTED)
  (:NAME "omit-incomplete-exit-cleanup" :FILE "src/io/rename.lisp" :TEST
   ("ARCDOCDB.IO.TESTS"
    "TEST-REQ-AFF-004-IO-RENAME-ORIGINAL-TYPED-CONDITION-PRESERVED")
   :BEFORE "(when (and (not complete) (eq (file-state directory) :open))
          (setf (file-state directory) :faulted))"
   :AFTER "(progn complete nil)" :EXPECTED-FAILURE
   :INCOMPLETE-EXIT-REMAINS-OPEN))
 :TEST-SUITES
 (("ARCDOCDB.IO.TESTS" "*TESTS*" "tests/io/rename.lisp" "IO-RENAME-")
  ("ARCDOCDB.IO.TESTS" "*TESTS*" "tests/io/rename-native.lisp" "IO-RENAME-"))
 :DEADLINE-POLICY :COOPERATIVE :CHILD-SECONDS 120 :CAMPAIGN-SECONDS 900
 :CLEANUP-SECONDS 2)
