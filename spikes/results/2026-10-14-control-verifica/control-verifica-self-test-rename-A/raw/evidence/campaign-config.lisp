(:SCHEMA-VERSION 1 :KIND :IO-RENAME-MUTATION-CAMPAIGN-CONFIG :PROFILE
 :IO-RENAME :ARGV
 ("--self-test" "spikes/out/control-verifica-self-test-rename-A/") :SOURCE-ROOT
 "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/" :TARGETS
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
 :MUTANT-FILES ("src/io/rename.lisp") :BACKEND-TEST-FILES
 ("tests/io/rename.lisp") :EXPECTED-TEST-COUNT NIL :SOURCE-HELPERS
 ("tools/io-rename-mutation.lisp" "tools/evidence-storage.lisp") :DRIVER-SOURCE
 "tools/io-rename-mutation.lisp" :ENGINE-SOURCE "tools/io-rename-mutation.lisp"
 :EVIDENCE-SOURCE "tools/evidence-storage.lisp" :HELPER-MANIFEST
 ((:ROLE :DRIVER :FILE "tools/io-rename-mutation.lisp" :RAW "driver.lisp"
   :SHA256 "bc7eb411474c133a64677fcd84d0325cbc3402e2c7c26419b3cb0e3ad55860a9")
  (:ROLE :ENGINE :FILE "tools/io-rename-mutation.lisp" :RAW "engine.lisp"
   :SHA256 "bc7eb411474c133a64677fcd84d0325cbc3402e2c7c26419b3cb0e3ad55860a9")
  (:ROLE :EVIDENCE :FILE "tools/evidence-storage.lisp" :RAW
   "evidence-storage.lisp" :SHA256
   "8f287772a41b1ebe0e7b3ecc3826a4148082efed428a9749655977e62a9c15a6"))
 :DEADLINE-POLICY :COOPERATIVE :CHILD-SECONDS 120 :CAMPAIGN-SECONDS 900
 :CLEANUP-SECONDS 2)
