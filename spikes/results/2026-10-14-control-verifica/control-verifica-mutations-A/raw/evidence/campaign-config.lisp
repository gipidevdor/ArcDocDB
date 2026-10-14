(:SCHEMA-VERSION 1 :KIND :IO-COMPLETION-MUTATION-CAMPAIGN-CONFIG :PROFILE
 :IO-COMPLETION :ARGV ("--check" "spikes/out/control-verifica-mutations-A/")
 :SOURCE-ROOT
 "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/" :TARGETS
 ((:NAME "omit-flush-cleanup" :FILE "src/io/flush.lisp" :TEST
   ("ARCDOCDB.IO.TESTS" "TEST-REQ-AFF-004-FLUSH-GUARD-ORIGINAL-CONDITION")
   :BEFORE "(when (and (not complete) (eq (file-state file) :open))
          (setf (file-state file) :faulted))"
   :AFTER "(progn complete nil)" :EXPECTED-FAILURE
   :INCOMPLETE-FLUSH-REMAINS-OPEN)
  (:NAME "omit-flush-frontier-check" :FILE "src/io/flush.lisp" :TEST
   ("ARCDOCDB.IO.TESTS" "TEST-REQ-AFF-008-FLUSH-GUARD-WRITTEN-MUTATED") :BEFORE
   "(unless (= written (file-written file))
             (error 'invariant-violation :reason :io-flush-frontier))"
   :AFTER "(progn written nil)" :EXPECTED-FAILURE
   :CHANGED-FLUSH-FRONTIER-ADMITTED)
  (:NAME "omit-append-cleanup" :FILE "src/io/transfer.lisp" :TEST
   ("ARCDOCDB.IO.TESTS"
    "TEST-REQ-AFF-004-TRANSFER-GUARD-ORIGINAL-WRITE-CONDITION")
   :BEFORE "(when (and (not complete) (eq (file-state file) :open))
          (setf (file-state file) :faulted))"
   :AFTER "(progn complete nil)" :EXPECTED-FAILURE
   :INCOMPLETE-APPEND-REMAINS-OPEN)
  (:NAME "fault-closed-in-fallisci" :FILE "src/io/types.lisp" :TEST
   ("ARCDOCDB.IO.TESTS" "TEST-REQ-AFF-004-FLUSH-GUARD-CLOSE-ERRNO-PRESERVED")
   :BEFORE "(when (and (not (eq operation :read)) (eq (file-state file) :open))
      (setf (file-state file) :faulted))"
   :AFTER "(when (not (eq operation :read))
      (setf (file-state file) :faulted))"
   :EXPECTED-FAILURE :CLOSED-CAPABILITY-REFAULTED))
 :TEST-SUITES
 (("ARCDOCDB.IO.TESTS" "*TESTS*" "tests/io/flush-failure.lisp" "FLUSH-GUARD-")
  ("ARCDOCDB.IO.TESTS" "*TESTS*" "tests/io/transfer-failure.lisp"
   "TRANSFER-GUARD-"))
 :MUTANT-FILES ("src/io/flush.lisp" "src/io/types.lisp" "src/io/transfer.lisp")
 :BACKEND-TEST-FILES
 ("tests/io/flush-failure.lisp" "tests/io/transfer-failure.lisp")
 :EXPECTED-TEST-COUNT 21 :SOURCE-HELPERS
 ("tools/io-completion-mutation.lisp" "tools/io-rename-mutation.lisp"
  "tools/evidence-storage.lisp")
 :DRIVER-SOURCE "tools/io-completion-mutation.lisp" :ENGINE-SOURCE
 "tools/io-rename-mutation.lisp" :EVIDENCE-SOURCE "tools/evidence-storage.lisp"
 :HELPER-MANIFEST
 ((:ROLE :DRIVER :FILE "tools/io-completion-mutation.lisp" :RAW "driver.lisp"
   :SHA256 "53241287a4c7908da5f75530a5e98080e722698e3ece443c720634269d7af5c3")
  (:ROLE :ENGINE :FILE "tools/io-rename-mutation.lisp" :RAW "engine.lisp"
   :SHA256 "bc7eb411474c133a64677fcd84d0325cbc3402e2c7c26419b3cb0e3ad55860a9")
  (:ROLE :EVIDENCE :FILE "tools/evidence-storage.lisp" :RAW
   "evidence-storage.lisp" :SHA256
   "8f287772a41b1ebe0e7b3ecc3826a4148082efed428a9749655977e62a9c15a6"))
 :DEADLINE-POLICY :COOPERATIVE :CHILD-SECONDS 120 :CAMPAIGN-SECONDS 900
 :CLEANUP-SECONDS 2)
