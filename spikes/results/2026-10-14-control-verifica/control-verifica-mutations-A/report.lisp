(:FINISHED-AT-UNIVERSAL-TIME 4000986634 :COUNTERS
 (:BASELINE-PASSED 1 :BASELINE-FAILED 0 :DETECTED 4 :SURVIVED 0
  :COMPILATION-ERROR 0 :INFRASTRUCTURE-ERROR 0 :INVALID 0)
 :SOURCE-MANIFEST-AFTER "raw/evidence/source-manifest-after.lisp" :TEST-COUNT
 21 :FROZEN-MANIFEST "raw/evidence/frozen-manifest.lisp" :SCHEMA-VERSION 1
 :KIND :IO-COMPLETION-MUTATIONS :PROFILE :IO-COMPLETION :STATUS :OK :ARGV
 ("--check" "spikes/out/control-verifica-mutations-A/")
 :STARTED-AT-UNIVERSAL-TIME 4000985801 :SELF-TEST
 (:STATUS :OK :CLASSIFIER-CASES 54 :ANCHOR-NEGATIVE-CASES 3 :ANCHOR-ROUNDTRIP T
  :RECORD-ROUNDTRIP T :TYPED-FIXTURE-TIMEOUT-DETECTION T
  :CANONICAL-SHA256-FIXTURES 3 :WRITE-SCHEMA-SHA-DETECTION T :NO-COMPILATION T
  :NO-PRODUCT-CHILD T :PROFILE :IO-COMPLETION :PROFILE-CHECKS
  (:STATUS :OK :TEST-COUNT 21 :FILE-ANCHOR-CASES 4 :FILE-ANCHOR-ROUNDTRIP T
   :HELPER-DIGEST-NEGATIVE-CASES 6 :IO-SOURCE-DIGEST-NEGATIVE-CASES 3
   :DRIVER-ENGINE-IN-INVENTORY T :REGISTRY
   (:MARKER-UNION T :UNRELATED-RENAME-EXCLUDED T :MISSING-TRANSFER-REJECTED T)
   :NO-COMPILATION T :NO-PRODUCT-CHILD T))
 :BASELINE
 (:NAME "baseline" :PROFILE :IO-COMPLETION :FILE NIL :RESULT :BASELINE-PASSED
  :STATUS :OK :COPY-DIRECTORY
  "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/control-verifica-mutations-A/raw/isolatedtests/baseline/"
  :EVIDENCE-DIRECTORY
  "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/control-verifica-mutations-A/raw/evidence/baseline/"
  :EXPECTED-FAILURE NIL :SUGGESTED-DETECTION-TEST NIL :PRODUCER-RECORD
  "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/control-verifica-mutations-A/report.lisp"
  :PRODUCER-CLOSED T :CHILD-LAUNCHED T :CHILD-REAPED T :TIMED-OUT NIL :CLEANUP
  :REAPED :DIAGNOSTIC NIL :SOURCE-CONSISTENCY :STABLE :CHANGED-PATHS NIL
  :CONFIG-SHA256
  "e1a42fe794adc5ed897d43a8c7e82d9b127b532b98912e6f99bcae1bdb2af199"
  :CONFIG-SHA256-AFTER
  "e1a42fe794adc5ed897d43a8c7e82d9b127b532b98912e6f99bcae1bdb2af199"
  :CONFIG-RECORD
  "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/control-verifica-mutations-A/raw/evidence/baseline/config.lisp"
  :CHILD-REPORT
  "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/control-verifica-mutations-A/raw/evidence/baseline/child-report.lisp"
  :RESULT-RECORD
  "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/control-verifica-mutations-A/raw/evidence/baseline/result.lisp"
  :DEADLINE-SECONDS 120 :FAILED-TEST NIL :FAILURE-KIND NIL :PASSED-COUNT 21
  :ARTIFACTS-VERIFIED T :EXIT-CODE 0 :SIGNAL NIL)
 :MUTANTS
 ((:NAME "fault-closed-in-fallisci" :PROFILE :IO-COMPLETION :FILE
   "src/io/types.lisp" :RESULT :DETECTED :STATUS :OK :COPY-DIRECTORY
   "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/control-verifica-mutations-A/raw/isolatedtests/fault-closed-in-fallisci/"
   :EVIDENCE-DIRECTORY
   "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/control-verifica-mutations-A/raw/evidence/fault-closed-in-fallisci/"
   :EXPECTED-FAILURE :CLOSED-CAPABILITY-REFAULTED :SUGGESTED-DETECTION-TEST
   ("ARCDOCDB.IO.TESTS" "TEST-REQ-AFF-004-FLUSH-GUARD-CLOSE-ERRNO-PRESERVED")
   :PRODUCER-RECORD
   "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/control-verifica-mutations-A/report.lisp"
   :PRODUCER-CLOSED T :CHILD-LAUNCHED T :CHILD-REAPED T :TIMED-OUT NIL :CLEANUP
   :REAPED :DIAGNOSTIC NIL :SOURCE-CONSISTENCY :STABLE :CHANGED-PATHS
   ("src/io/types.lisp") :CONFIG-SHA256
   "db65842a1038bc4d82e86411fbcce8b7570caa3c90146fcfd4120fbdd3984f2a"
   :CONFIG-SHA256-AFTER
   "db65842a1038bc4d82e86411fbcce8b7570caa3c90146fcfd4120fbdd3984f2a"
   :CONFIG-RECORD
   "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/control-verifica-mutations-A/raw/evidence/fault-closed-in-fallisci/config.lisp"
   :CHILD-REPORT
   "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/control-verifica-mutations-A/raw/evidence/fault-closed-in-fallisci/child-report.lisp"
   :RESULT-RECORD
   "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/control-verifica-mutations-A/raw/evidence/fault-closed-in-fallisci/result.lisp"
   :DEADLINE-SECONDS 120 :FAILED-TEST
   ("ARCDOCDB.IO.TESTS" "TEST-REQ-AFF-004-FLUSH-GUARD-CLOSE-ERRNO-PRESERVED")
   :FAILURE-KIND :ASSERTION :PASSED-COUNT 6 :ARTIFACTS-VERIFIED T :EXIT-CODE 1
   :SIGNAL NIL)
  (:NAME "omit-append-cleanup" :PROFILE :IO-COMPLETION :FILE
   "src/io/transfer.lisp" :RESULT :DETECTED :STATUS :OK :COPY-DIRECTORY
   "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/control-verifica-mutations-A/raw/isolatedtests/omit-append-cleanup/"
   :EVIDENCE-DIRECTORY
   "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/control-verifica-mutations-A/raw/evidence/omit-append-cleanup/"
   :EXPECTED-FAILURE :INCOMPLETE-APPEND-REMAINS-OPEN :SUGGESTED-DETECTION-TEST
   ("ARCDOCDB.IO.TESTS"
    "TEST-REQ-AFF-004-TRANSFER-GUARD-ORIGINAL-WRITE-CONDITION")
   :PRODUCER-RECORD
   "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/control-verifica-mutations-A/report.lisp"
   :PRODUCER-CLOSED T :CHILD-LAUNCHED T :CHILD-REAPED T :TIMED-OUT NIL :CLEANUP
   :REAPED :DIAGNOSTIC NIL :SOURCE-CONSISTENCY :STABLE :CHANGED-PATHS
   ("src/io/transfer.lisp") :CONFIG-SHA256
   "3a2872c23975f1de6adf9398ef4450aa91674c89a9af3c83dd2de3df984e01df"
   :CONFIG-SHA256-AFTER
   "3a2872c23975f1de6adf9398ef4450aa91674c89a9af3c83dd2de3df984e01df"
   :CONFIG-RECORD
   "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/control-verifica-mutations-A/raw/evidence/omit-append-cleanup/config.lisp"
   :CHILD-REPORT
   "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/control-verifica-mutations-A/raw/evidence/omit-append-cleanup/child-report.lisp"
   :RESULT-RECORD
   "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/control-verifica-mutations-A/raw/evidence/omit-append-cleanup/result.lisp"
   :DEADLINE-SECONDS 120 :FAILED-TEST
   ("ARCDOCDB.IO.TESTS"
    "TEST-REQ-AFF-004-TRANSFER-GUARD-ORIGINAL-WRITE-CONDITION")
   :FAILURE-KIND :ASSERTION :PASSED-COUNT 12 :ARTIFACTS-VERIFIED T :EXIT-CODE 1
   :SIGNAL NIL)
  (:NAME "omit-flush-frontier-check" :PROFILE :IO-COMPLETION :FILE
   "src/io/flush.lisp" :RESULT :DETECTED :STATUS :OK :COPY-DIRECTORY
   "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/control-verifica-mutations-A/raw/isolatedtests/omit-flush-frontier-check/"
   :EVIDENCE-DIRECTORY
   "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/control-verifica-mutations-A/raw/evidence/omit-flush-frontier-check/"
   :EXPECTED-FAILURE :CHANGED-FLUSH-FRONTIER-ADMITTED :SUGGESTED-DETECTION-TEST
   ("ARCDOCDB.IO.TESTS" "TEST-REQ-AFF-008-FLUSH-GUARD-WRITTEN-MUTATED")
   :PRODUCER-RECORD
   "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/control-verifica-mutations-A/report.lisp"
   :PRODUCER-CLOSED T :CHILD-LAUNCHED T :CHILD-REAPED T :TIMED-OUT NIL :CLEANUP
   :REAPED :DIAGNOSTIC NIL :SOURCE-CONSISTENCY :STABLE :CHANGED-PATHS
   ("src/io/flush.lisp") :CONFIG-SHA256
   "7ee63777de00e0ac371a80112f325c8bb25022dce1f0bd019035b8b95d3efde2"
   :CONFIG-SHA256-AFTER
   "7ee63777de00e0ac371a80112f325c8bb25022dce1f0bd019035b8b95d3efde2"
   :CONFIG-RECORD
   "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/control-verifica-mutations-A/raw/evidence/omit-flush-frontier-check/config.lisp"
   :CHILD-REPORT
   "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/control-verifica-mutations-A/raw/evidence/omit-flush-frontier-check/child-report.lisp"
   :RESULT-RECORD
   "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/control-verifica-mutations-A/raw/evidence/omit-flush-frontier-check/result.lisp"
   :DEADLINE-SECONDS 120 :FAILED-TEST
   ("ARCDOCDB.IO.TESTS" "TEST-REQ-AFF-008-FLUSH-GUARD-WRITTEN-MUTATED")
   :FAILURE-KIND :ASSERTION :PASSED-COUNT 9 :ARTIFACTS-VERIFIED T :EXIT-CODE 1
   :SIGNAL NIL)
  (:NAME "omit-flush-cleanup" :PROFILE :IO-COMPLETION :FILE "src/io/flush.lisp"
   :RESULT :DETECTED :STATUS :OK :COPY-DIRECTORY
   "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/control-verifica-mutations-A/raw/isolatedtests/omit-flush-cleanup/"
   :EVIDENCE-DIRECTORY
   "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/control-verifica-mutations-A/raw/evidence/omit-flush-cleanup/"
   :EXPECTED-FAILURE :INCOMPLETE-FLUSH-REMAINS-OPEN :SUGGESTED-DETECTION-TEST
   ("ARCDOCDB.IO.TESTS" "TEST-REQ-AFF-004-FLUSH-GUARD-ORIGINAL-CONDITION")
   :PRODUCER-RECORD
   "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/control-verifica-mutations-A/report.lisp"
   :PRODUCER-CLOSED T :CHILD-LAUNCHED T :CHILD-REAPED T :TIMED-OUT NIL :CLEANUP
   :REAPED :DIAGNOSTIC NIL :SOURCE-CONSISTENCY :STABLE :CHANGED-PATHS
   ("src/io/flush.lisp") :CONFIG-SHA256
   "f65d531ab7bc294144306602f8bccb5d8cfbdd1f30ec5c01669e955be1c62d48"
   :CONFIG-SHA256-AFTER
   "f65d531ab7bc294144306602f8bccb5d8cfbdd1f30ec5c01669e955be1c62d48"
   :CONFIG-RECORD
   "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/control-verifica-mutations-A/raw/evidence/omit-flush-cleanup/config.lisp"
   :CHILD-REPORT
   "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/control-verifica-mutations-A/raw/evidence/omit-flush-cleanup/child-report.lisp"
   :RESULT-RECORD
   "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/control-verifica-mutations-A/raw/evidence/omit-flush-cleanup/result.lisp"
   :DEADLINE-SECONDS 120 :FAILED-TEST
   ("ARCDOCDB.IO.TESTS" "TEST-REQ-AFF-004-FLUSH-GUARD-ORIGINAL-CONDITION")
   :FAILURE-KIND :ASSERTION :PASSED-COUNT 1 :ARTIFACTS-VERIFIED T :EXIT-CODE 1
   :SIGNAL NIL))
 :SOURCE-ROOT
 "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/" :TARGETS
 ((:NAME "omit-flush-cleanup" :FILE "src/io/flush.lisp" :TEST
   ("ARCDOCDB.IO.TESTS" "TEST-REQ-AFF-004-FLUSH-GUARD-ORIGINAL-CONDITION"))
  (:NAME "omit-flush-frontier-check" :FILE "src/io/flush.lisp" :TEST
   ("ARCDOCDB.IO.TESTS" "TEST-REQ-AFF-008-FLUSH-GUARD-WRITTEN-MUTATED"))
  (:NAME "omit-append-cleanup" :FILE "src/io/transfer.lisp" :TEST
   ("ARCDOCDB.IO.TESTS"
    "TEST-REQ-AFF-004-TRANSFER-GUARD-ORIGINAL-WRITE-CONDITION"))
  (:NAME "fault-closed-in-fallisci" :FILE "src/io/types.lisp" :TEST
   ("ARCDOCDB.IO.TESTS" "TEST-REQ-AFF-004-FLUSH-GUARD-CLOSE-ERRNO-PRESERVED")))
 :TEST-SELECTION
 (("ARCDOCDB.IO.TESTS" "*TESTS*" "tests/io/flush-failure.lisp" "FLUSH-GUARD-")
  ("ARCDOCDB.IO.TESTS" "*TESTS*" "tests/io/transfer-failure.lisp"
   "TRANSFER-GUARD-"))
 :EXPECTED-TESTS
 (("ARCDOCDB.IO.TESTS" "TEST-REQ-AFF-001-FLUSH-GUARD-SUCCESS")
  ("ARCDOCDB.IO.TESTS" "TEST-REQ-AFF-004-FLUSH-GUARD-ORIGINAL-CONDITION")
  ("ARCDOCDB.IO.TESTS" "TEST-REQ-AFF-004-FLUSH-GUARD-NONLOCAL-EXIT")
  ("ARCDOCDB.IO.TESTS" "TEST-REQ-AFF-008-FLUSH-GUARD-INVALID-RESULTS")
  ("ARCDOCDB.IO.TESTS" "TEST-REQ-AFF-001-FLUSH-GUARD-ERRNO-NO-RETRY")
  ("ARCDOCDB.IO.TESTS" "TEST-REQ-AFF-004-FLUSH-GUARD-CLOSE-SUCCESS-REJECTED")
  ("ARCDOCDB.IO.TESTS" "TEST-REQ-AFF-004-FLUSH-GUARD-CLOSE-ERRNO-PRESERVED")
  ("ARCDOCDB.IO.TESTS"
   "TEST-REQ-AFF-004-FLUSH-GUARD-CLOSE-INVALID-RESULT-PRESERVED")
  ("ARCDOCDB.IO.TESTS" "TEST-REQ-AFF-004-FLUSH-GUARD-CLOSE-ORIGINAL-CONDITION")
  ("ARCDOCDB.IO.TESTS" "TEST-REQ-AFF-008-FLUSH-GUARD-WRITTEN-MUTATED")
  ("ARCDOCDB.IO.TESTS" "TEST-REQ-AFF-008-FLUSH-GUARD-PREFLIGHT-CLOSED")
  ("ARCDOCDB.IO.TESTS" "TEST-REQ-AFF-008-FLUSH-GUARD-PREFLIGHT-INPUT")
  ("ARCDOCDB.IO.TESTS"
   "TEST-REQ-AFF-004-TRANSFER-GUARD-ORIGINAL-WRITE-CONDITION")
  ("ARCDOCDB.IO.TESTS" "TEST-REQ-AFF-004-TRANSFER-GUARD-NONLOCAL-WRITE")
  ("ARCDOCDB.IO.TESTS" "TEST-REQ-AFF-004-TRANSFER-GUARD-CLOSED-WRITE-PROGRESS")
  ("ARCDOCDB.IO.TESTS" "TEST-REQ-AFF-004-TRANSFER-GUARD-CLOSED-WRITE-ERRNO")
  ("ARCDOCDB.IO.TESTS"
   "TEST-REQ-AFF-004-TRANSFER-GUARD-CLOSED-WRITE-INVALID-RESULT")
  ("ARCDOCDB.IO.TESTS"
   "TEST-REQ-AFF-004-TRANSFER-GUARD-CLOSED-WRITE-ORIGINAL-CONDITION")
  ("ARCDOCDB.IO.TESTS" "TEST-REQ-AFF-008-TRANSFER-GUARD-WRITTEN-MUTATED")
  ("ARCDOCDB.IO.TESTS" "TEST-REQ-AFF-004-TRANSFER-GUARD-CLOSED-READ-PROGRESS")
  ("ARCDOCDB.IO.TESTS"
   "TEST-REQ-AFF-004-TRANSFER-GUARD-NONLOCAL-READ-REMAINS-READONLY"))
 :SOURCE-CONSISTENCY :STABLE :MUTANT-FILES
 ("src/io/flush.lisp" "src/io/types.lisp" "src/io/transfer.lisp")
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
 :RAW-ROOT "raw/evidence/" :COLLECTOR-EXCLUSIONS ("raw/isolatedtests/")
 :FILE-LIMIT-BYTES 16777216 :INVENTORY-LIMIT 4096 :CHILD-DEADLINE-SECONDS 120
 :CAMPAIGN-DEADLINE-SECONDS 900 :DEADLINE-POLICY :COOPERATIVE :CAMPAIGN-CONFIG
 "raw/evidence/campaign-config.lisp" :STATIC-RISKS
 (:PARENT-SOURCE-FREEZE-REQUIRED :NOT-EXECUTED-BY-AUTHOR :SERIAL-CHILDREN
  :COMPILER-FIXTURE-TYPE-IO-TIMEOUT-CRASH-NOT-KILLS
  :ISOLATEDCOPIES-EXCLUDED-FROM-COLLECTOR
  :EVIDENCE-DIRECTORY-MUST-BE-COLLECTED-WITH-TERMINAL-PRODUCER
  :CANONICAL-DIGEST-HELPER-USES-SHASUM :ALL-ASDF-TEST-DEFINITIONS-LOADED-ONLY
  :COOPERATIVE-PARENT-DEADLINE :STAT-TIMESTAMPS-PLATFORM-RESOLUTION
  :NO-ENGINE-QUALIFICATION :ONLY-FOUR-IO-COMPLETION-MUTANTS
  :FLUSH-TRANSFER-TYPES-LOCAL-PRODUCT-REQUIRED
  :TWENTY-ONE-BACKEND-TESTS-REQUIRED :NO-NATIVE-POWER-LOSS-EVIDENCE
  :SHARED-FALLISCI-ALSO-USED-BY-TRANSFER :FIRST-FAILING-EXACT-TARGET-REQUIRED))
