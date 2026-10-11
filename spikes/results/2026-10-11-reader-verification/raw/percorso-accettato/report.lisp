(:SOURCE-CONSISTENCY :STABLE :SOURCE-FINGERPRINTS-AFTER
 ((:FILE "src/foundation/package.lisp" :MD5
   #A((32) BASE-CHAR . "5ee593a112958d94163dab17c5aa4ba2"))
  (:FILE "src/foundation/conditions.lisp" :MD5
   #A((32) BASE-CHAR . "942b596396c19815290a57830af2121b"))
  (:FILE "src/foundation/binary.lisp" :MD5
   #A((32) BASE-CHAR . "a06115175f450776762761dce25acdb8"))
  (:FILE "src/foundation/crc32c.lisp" :MD5
   #A((32) BASE-CHAR . "4db58e2f48bf77d751f1b83bb9f84b5c"))
  (:FILE "src/foundation/record.lisp" :MD5
   #A((32) BASE-CHAR . "c3ed0f09fa3fa6fe20c98e2ed6e69abe"))
  (:FILE "src/foundation/batch.lisp" :MD5
   #A((32) BASE-CHAR . "ca642ea47e4bff76f78f5b6d7287d6bd"))
  (:FILE "src/csn/package.lisp" :MD5
   #A((32) BASE-CHAR . "1130012fc5613a5648d22ed8628be0e8"))
  (:FILE "src/csn/registry.lisp" :MD5
   #A((32) BASE-CHAR . "a1cdb5661fc54beba5bf00e4765f3235"))
  (:FILE "src/mvcc/package.lisp" :MD5
   #A((32) BASE-CHAR . "f188d1dbd5d0adb49f53acf09157aef9"))
  (:FILE "src/mvcc/types.lisp" :MD5
   #A((32) BASE-CHAR . "a9bc70eab6720b5c6f8503178e2c966b"))
  (:FILE "src/mvcc/snapshots-types.lisp" :MD5
   #A((32) BASE-CHAR . "475517bd7ba04a1c37a82efeb8ff73d9"))
  (:FILE "src/mvcc/snapshots-core.lisp" :MD5
   #A((32) BASE-CHAR . "8bb066aab61a18eff175b9edb11e42a2"))
  (:FILE "src/mvcc/snapshots-csn.lisp" :MD5
   #A((32) BASE-CHAR . "0e9365e674d1584b111f915ce1f58634"))
  (:FILE "src/mvcc/snapshots-register.lisp" :MD5
   #A((32) BASE-CHAR . "2d5a795bcefd605c75da91c725ae83a2"))
  (:FILE "src/mvcc/snapshots-lifecycle.lisp" :MD5
   #A((32) BASE-CHAR . "ff98aea5cb9a7ae2671f6a887a003725"))
  (:FILE "src/mvcc/snapshots-read.lisp" :MD5
   #A((32) BASE-CHAR . "ae3ad96269b5e711a9dbb455f3c0ce48"))
  (:FILE "src/epochs/package.lisp" :MD5
   #A((32) BASE-CHAR . "875201dfab0a84efd40fe9828cc293c8"))
  (:FILE "src/epochs/types.lisp" :MD5
   #A((32) BASE-CHAR . "82253491f995f5bc153fb5ebf30d564c"))
  (:FILE "src/epochs/core.lisp" :MD5
   #A((32) BASE-CHAR . "765d14c88cd288093a77a57930cd6999"))
  (:FILE "src/epochs/read.lisp" :MD5
   #A((32) BASE-CHAR . "975b5f74e0c5a38ce978f4d9c7fcc6b8"))
  (:FILE "src/epochs/retire.lisp" :MD5
   #A((32) BASE-CHAR . "653b974f310c09f6e2224a84acc43bbf"))
  (:FILE "src/epochs/reclaim.lisp" :MD5
   #A((32) BASE-CHAR . "036dd02adf87d33c3ae2f40735c733fa"))
  (:FILE "src/read/package.lisp" :MD5
   #A((32) BASE-CHAR . "7d74d9decc5a0bc9f9331d89bd503e21"))
  (:FILE "src/read/types.lisp" :MD5
   #A((32) BASE-CHAR . "9c37ff8237fcc9fe9ae4f44316e854e3"))
  (:FILE "src/read/core.lisp" :MD5
   #A((32) BASE-CHAR . "4040905f4a64ba704a480d82e87ec748"))
  (:FILE "src/read/task.lisp" :MD5
   #A((32) BASE-CHAR . "9e0baf22c53329d393e047c669679645"))
  (:FILE "tests/foundation/support.lisp" :MD5
   #A((32) BASE-CHAR . "758adad069aec2f9dbe0635797314ff6"))
  (:FILE "tests/epochs/support.lisp" :MD5
   #A((32) BASE-CHAR . "592a2fe2e22214c52d4672d26620980b"))
  (:FILE "tests/epochs/lifecycle.lisp" :MD5
   #A((32) BASE-CHAR . "fe92ddd79dcaab3d3f7bdf387bf2295e"))
  (:FILE "tests/epochs/threads.lisp" :MD5
   #A((32) BASE-CHAR . "3a99a2eedef02d0f79faeca542e3c0cb"))
  (:FILE "tests/read/support.lisp" :MD5
   #A((32) BASE-CHAR . "0d5db03bd804747de7c309c82e40dd43"))
  (:FILE "tests/read/lifecycle.lisp" :MD5
   #A((32) BASE-CHAR . "73dab63d8414998d72f6c14e0d62e3ac"))
  (:FILE "tests/read/threads.lisp" :MD5
   #A((32) BASE-CHAR . "0cf2cad12c77c82b827da01782bc996d"))
  (:FILE "tools/reader-mutation.lisp" :MD5
   #A((32) BASE-CHAR . "33d0497fb4508ecdab4cb562bc9ccba6")))
 :DIAGNOSTIC
 #A((59) BASE-CHAR
    . "tools/reader-mutation.lisp COD-61: Baseline reader fallita.")
 :PROCESS-FIXTURES
 #A((125) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/reader-verification/ArcDocDB/spikes/out/4000706209-reader-self-test-98905-0/report.lisp")
 :EXPECTED-SUITE
 ("TEST-REQ-AFF-008-EBR-VALID-CAPACITIES-AND-INITIAL-STATE"
  "TEST-REQ-AFF-008-EBR-WORKER-CAPACITY-REFUSALS"
  "TEST-REQ-AFF-008-EBR-RETIREMENT-CAPACITY-REFUSALS"
  "TEST-REQ-CMP-005-EBR-CANONICAL-CONTEXT-AND-WORKER-RANGE"
  "TEST-REQ-CMP-005-EBR-ENTER-EXIT"
  "TEST-REQ-CMP-005-EBR-NESTED-ENTRY-PRESERVES-PIN"
  "TEST-REQ-CMP-005-EBR-INACTIVE-EXIT-REFUSED"
  "TEST-REQ-CMP-005-EBR-INDEPENDENT-READERS"
  "TEST-REQ-CMP-005-EBR-OWNER-NONLOCAL-CLEANUP"
  "TEST-REQ-CMP-007-EBR-RESERVATION-RESOURCE-AND-CREDITS"
  "TEST-REQ-CMP-007-EBR-NULL-RESOURCE-PRESERVES-STATE"
  "TEST-REQ-CMP-007-EBR-DUPLICATE-RESOURCE-PRESERVES-STATE"
  "TEST-REQ-AFF-008-EBR-FULL-CAPACITY-PRESERVES-STATE"
  "TEST-REQ-CMP-007-EBR-CANCEL-IS-IDEMPOTENT"
  "TEST-REQ-CMP-007-EBR-PUBLISH-ADVANCES-ONCE"
  "TEST-REQ-CMP-007-EBR-PUBLISHED-RETIREMENT-CANNOT-CANCEL"
  "TEST-REQ-CMP-007-EBR-INVALID-TICKET-STATE-OPERATIONS"
  "TEST-REQ-CMP-007-EBR-STRICT-RECLAIM-THRESHOLD"
  "TEST-REQ-CMP-007-EBR-TWO-OLD-READERS-BLOCK-RECLAIM"
  "TEST-REQ-CMP-007-EBR-NEW-READER-DOES-NOT-BLOCK-OLD-RETIREMENT"
  "TEST-REQ-CMP-007-EBR-THRESHOLD-IS-MONOTONE"
  "TEST-REQ-CMP-007-EBR-RESOURCE-UNTIL-COMPLETION"
  "TEST-REQ-CMP-007-EBR-COMPLETION-IS-IDEMPOTENT"
  "TEST-REQ-CMP-007-EBR-STALE-GENERATION-PRESERVES-REUSE"
  "TEST-REQ-CMP-007-EBR-ZERO-AND-WRONG-GENERATION-PRESERVE-STATE"
  "TEST-REQ-AFF-008-EBR-GENERATION-MAXIMUM-WITHOUT-WRAP"
  "TEST-REQ-AFF-008-EBR-EPOCH-CREDIT-BEFORE-PUBLICATION"
  "TEST-REQ-AFF-008-EBR-CANCEL-RESTORES-EPOCH-CREDIT"
  "TEST-REQ-AFF-004-EBR-METADATA-INCOHERENCE-FAULTS"
  "TEST-REQ-AFF-004-EBR-COUNTER-INCOHERENCE-FAULTS"
  "TEST-REQ-AFF-004-EBR-FUTURE-READER-FAULTS"
  "TEST-REQ-AFF-004-EBR-READER-CLEANUP-AFTER-FAULT"
  "TEST-REQ-CMP-007-EBR-CLAIM-IS-EXCLUSIVE"
  "TEST-REQ-CMP-005-EBR-READER-FINISHES-WITH-MAINTENANCE-MUTEX-HELD"
  "TEST-REQ-MVC-005-READ-CURRENT-BUFFER-UNTOUCHED"
  "TEST-REQ-MVC-005-READ-SNAPSHOT-CSN-ZERO-CARRY-BOXED"
  "TEST-REQ-MVC-004-READ-COMPLETION-KEEPS-SNAPSHOT"
  "TEST-REQ-MVC-004-READ-WAITING-REFUSAL-CLEANS-EPOCH"
  "TEST-REQ-MVC-004-READ-ENDED-BEGIN-CLEANS-EPOCH"
  "TEST-REQ-CON-004-READ-CURRENT-GENERATION-BEFORE-PIN"
  "TEST-REQ-CON-004-READ-SNAPSHOT-ZERO-GENERATION-BEFORE-PIN"
  "TEST-REQ-CON-004-READ-FOREIGN-SNAPSHOT-BEFORE-PIN"
  "TEST-REQ-CON-004-READ-ALREADY-ACTIVE-READER-REFUSAL"
  "TEST-REQ-CON-004-READ-NESTED-KEEPS-EXISTING-PIN"
  "TEST-REQ-MVC-005-READ-INACTIVE-BUFFER-REFUSAL"
  "TEST-REQ-MVC-005-READ-RESULT-RANGE-PRESERVES-BUFFER"
  "TEST-REQ-MVC-004-READ-FINAL-SNAPSHOT-CHECK"
  "TEST-REQ-CMP-007-READ-LOGICAL-EXPIRY-KEEPS-LIVE-EPOCH"
  "TEST-REQ-CON-004-READ-CLOCK-REGRESSION-RELEASES-PIN"
  "TEST-REQ-CMP-007-READ-ABANDON-RELEASES-PIN"
  "TEST-REQ-AFF-004-READ-IDLE-RESIDUAL-GENERATION"
  "TEST-REQ-AFF-004-READ-IDLE-RESIDUAL-CSN"
  "TEST-REQ-AFF-004-READ-IDLE-RESIDUAL-START"
  "TEST-REQ-AFF-004-READ-IDLE-RESIDUAL-CONFIRMED"
  "TEST-REQ-AFF-004-READ-IDLE-RESIDUAL-SNAPSHOT"
  "TEST-REQ-AFF-004-READ-ACTIVE-CURRENT-GENERATION"
  "TEST-REQ-AFF-004-READ-ACTIVE-CURRENT-CSN"
  "TEST-REQ-AFF-004-READ-ACTIVE-SNAPSHOT-ZERO-GENERATION"
  "TEST-REQ-AFF-004-READ-ACTIVE-FOREIGN-BINDING"
  "TEST-REQ-AFF-004-READ-MISSING-EPOCH-FAULT"
  "TEST-REQ-AFF-004-READ-FAULTED-CONTEXT-STAYS-FAULTED"
  "TEST-REQ-AFF-004-READ-FINAL-CSN-CHANGED-FAULT"
  "TEST-REQ-CMP-007-READ-EXTERNAL-ERROR-THROW-CLEANUP"
  "TEST-REQ-CON-004-READ-TWO-WORKER-MIGRATION")
 :SOURCE-FINGERPRINTS-BEFORE
 ((:FILE "src/foundation/package.lisp" :MD5
   #A((32) BASE-CHAR . "5ee593a112958d94163dab17c5aa4ba2"))
  (:FILE "src/foundation/conditions.lisp" :MD5
   #A((32) BASE-CHAR . "942b596396c19815290a57830af2121b"))
  (:FILE "src/foundation/binary.lisp" :MD5
   #A((32) BASE-CHAR . "a06115175f450776762761dce25acdb8"))
  (:FILE "src/foundation/crc32c.lisp" :MD5
   #A((32) BASE-CHAR . "4db58e2f48bf77d751f1b83bb9f84b5c"))
  (:FILE "src/foundation/record.lisp" :MD5
   #A((32) BASE-CHAR . "c3ed0f09fa3fa6fe20c98e2ed6e69abe"))
  (:FILE "src/foundation/batch.lisp" :MD5
   #A((32) BASE-CHAR . "ca642ea47e4bff76f78f5b6d7287d6bd"))
  (:FILE "src/csn/package.lisp" :MD5
   #A((32) BASE-CHAR . "1130012fc5613a5648d22ed8628be0e8"))
  (:FILE "src/csn/registry.lisp" :MD5
   #A((32) BASE-CHAR . "a1cdb5661fc54beba5bf00e4765f3235"))
  (:FILE "src/mvcc/package.lisp" :MD5
   #A((32) BASE-CHAR . "f188d1dbd5d0adb49f53acf09157aef9"))
  (:FILE "src/mvcc/types.lisp" :MD5
   #A((32) BASE-CHAR . "a9bc70eab6720b5c6f8503178e2c966b"))
  (:FILE "src/mvcc/snapshots-types.lisp" :MD5
   #A((32) BASE-CHAR . "475517bd7ba04a1c37a82efeb8ff73d9"))
  (:FILE "src/mvcc/snapshots-core.lisp" :MD5
   #A((32) BASE-CHAR . "8bb066aab61a18eff175b9edb11e42a2"))
  (:FILE "src/mvcc/snapshots-csn.lisp" :MD5
   #A((32) BASE-CHAR . "0e9365e674d1584b111f915ce1f58634"))
  (:FILE "src/mvcc/snapshots-register.lisp" :MD5
   #A((32) BASE-CHAR . "2d5a795bcefd605c75da91c725ae83a2"))
  (:FILE "src/mvcc/snapshots-lifecycle.lisp" :MD5
   #A((32) BASE-CHAR . "ff98aea5cb9a7ae2671f6a887a003725"))
  (:FILE "src/mvcc/snapshots-read.lisp" :MD5
   #A((32) BASE-CHAR . "ae3ad96269b5e711a9dbb455f3c0ce48"))
  (:FILE "src/epochs/package.lisp" :MD5
   #A((32) BASE-CHAR . "875201dfab0a84efd40fe9828cc293c8"))
  (:FILE "src/epochs/types.lisp" :MD5
   #A((32) BASE-CHAR . "82253491f995f5bc153fb5ebf30d564c"))
  (:FILE "src/epochs/core.lisp" :MD5
   #A((32) BASE-CHAR . "765d14c88cd288093a77a57930cd6999"))
  (:FILE "src/epochs/read.lisp" :MD5
   #A((32) BASE-CHAR . "975b5f74e0c5a38ce978f4d9c7fcc6b8"))
  (:FILE "src/epochs/retire.lisp" :MD5
   #A((32) BASE-CHAR . "653b974f310c09f6e2224a84acc43bbf"))
  (:FILE "src/epochs/reclaim.lisp" :MD5
   #A((32) BASE-CHAR . "036dd02adf87d33c3ae2f40735c733fa"))
  (:FILE "src/read/package.lisp" :MD5
   #A((32) BASE-CHAR . "7d74d9decc5a0bc9f9331d89bd503e21"))
  (:FILE "src/read/types.lisp" :MD5
   #A((32) BASE-CHAR . "9c37ff8237fcc9fe9ae4f44316e854e3"))
  (:FILE "src/read/core.lisp" :MD5
   #A((32) BASE-CHAR . "4040905f4a64ba704a480d82e87ec748"))
  (:FILE "src/read/task.lisp" :MD5
   #A((32) BASE-CHAR . "9e0baf22c53329d393e047c669679645"))
  (:FILE "tests/foundation/support.lisp" :MD5
   #A((32) BASE-CHAR . "758adad069aec2f9dbe0635797314ff6"))
  (:FILE "tests/epochs/support.lisp" :MD5
   #A((32) BASE-CHAR . "592a2fe2e22214c52d4672d26620980b"))
  (:FILE "tests/epochs/lifecycle.lisp" :MD5
   #A((32) BASE-CHAR . "fe92ddd79dcaab3d3f7bdf387bf2295e"))
  (:FILE "tests/epochs/threads.lisp" :MD5
   #A((32) BASE-CHAR . "3a99a2eedef02d0f79faeca542e3c0cb"))
  (:FILE "tests/read/support.lisp" :MD5
   #A((32) BASE-CHAR . "0d5db03bd804747de7c309c82e40dd43"))
  (:FILE "tests/read/lifecycle.lisp" :MD5
   #A((32) BASE-CHAR . "73dab63d8414998d72f6c14e0d62e3ac"))
  (:FILE "tests/read/threads.lisp" :MD5
   #A((32) BASE-CHAR . "0cf2cad12c77c82b827da01782bc996d"))
  (:FILE "tools/reader-mutation.lisp" :MD5
   #A((32) BASE-CHAR . "33d0497fb4508ecdab4cb562bc9ccba6")))
 :SCHEMA-VERSION 1 :KIND :READER-MUTATIONS :STATUS :FAILED :WORKER-ERRORS 1
 :BASELINE
 (:DIAGNOSTIC :COMPILATION-FAILURE :NAME "baseline" :DIRECTORY
  #A((114) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/reader-verification/ArcDocDB/spikes/out/reader-forbidden-file.lisp/baseline/")
  :EXPECTED-TESTS
  ("TEST-REQ-AFF-008-EBR-VALID-CAPACITIES-AND-INITIAL-STATE"
   "TEST-REQ-AFF-008-EBR-WORKER-CAPACITY-REFUSALS"
   "TEST-REQ-AFF-008-EBR-RETIREMENT-CAPACITY-REFUSALS"
   "TEST-REQ-CMP-005-EBR-CANONICAL-CONTEXT-AND-WORKER-RANGE"
   "TEST-REQ-CMP-005-EBR-ENTER-EXIT"
   "TEST-REQ-CMP-005-EBR-NESTED-ENTRY-PRESERVES-PIN"
   "TEST-REQ-CMP-005-EBR-INACTIVE-EXIT-REFUSED"
   "TEST-REQ-CMP-005-EBR-INDEPENDENT-READERS"
   "TEST-REQ-CMP-005-EBR-OWNER-NONLOCAL-CLEANUP"
   "TEST-REQ-CMP-007-EBR-RESERVATION-RESOURCE-AND-CREDITS"
   "TEST-REQ-CMP-007-EBR-NULL-RESOURCE-PRESERVES-STATE"
   "TEST-REQ-CMP-007-EBR-DUPLICATE-RESOURCE-PRESERVES-STATE"
   "TEST-REQ-AFF-008-EBR-FULL-CAPACITY-PRESERVES-STATE"
   "TEST-REQ-CMP-007-EBR-CANCEL-IS-IDEMPOTENT"
   "TEST-REQ-CMP-007-EBR-PUBLISH-ADVANCES-ONCE"
   "TEST-REQ-CMP-007-EBR-PUBLISHED-RETIREMENT-CANNOT-CANCEL"
   "TEST-REQ-CMP-007-EBR-INVALID-TICKET-STATE-OPERATIONS"
   "TEST-REQ-CMP-007-EBR-STRICT-RECLAIM-THRESHOLD"
   "TEST-REQ-CMP-007-EBR-TWO-OLD-READERS-BLOCK-RECLAIM"
   "TEST-REQ-CMP-007-EBR-NEW-READER-DOES-NOT-BLOCK-OLD-RETIREMENT"
   "TEST-REQ-CMP-007-EBR-THRESHOLD-IS-MONOTONE"
   "TEST-REQ-CMP-007-EBR-RESOURCE-UNTIL-COMPLETION"
   "TEST-REQ-CMP-007-EBR-COMPLETION-IS-IDEMPOTENT"
   "TEST-REQ-CMP-007-EBR-STALE-GENERATION-PRESERVES-REUSE"
   "TEST-REQ-CMP-007-EBR-ZERO-AND-WRONG-GENERATION-PRESERVE-STATE"
   "TEST-REQ-AFF-008-EBR-GENERATION-MAXIMUM-WITHOUT-WRAP"
   "TEST-REQ-AFF-008-EBR-EPOCH-CREDIT-BEFORE-PUBLICATION"
   "TEST-REQ-AFF-008-EBR-CANCEL-RESTORES-EPOCH-CREDIT"
   "TEST-REQ-AFF-004-EBR-METADATA-INCOHERENCE-FAULTS"
   "TEST-REQ-AFF-004-EBR-COUNTER-INCOHERENCE-FAULTS"
   "TEST-REQ-AFF-004-EBR-FUTURE-READER-FAULTS"
   "TEST-REQ-AFF-004-EBR-READER-CLEANUP-AFTER-FAULT"
   "TEST-REQ-CMP-007-EBR-CLAIM-IS-EXCLUSIVE"
   "TEST-REQ-CMP-005-EBR-READER-FINISHES-WITH-MAINTENANCE-MUTEX-HELD"
   "TEST-REQ-MVC-005-READ-CURRENT-BUFFER-UNTOUCHED"
   "TEST-REQ-MVC-005-READ-SNAPSHOT-CSN-ZERO-CARRY-BOXED"
   "TEST-REQ-MVC-004-READ-COMPLETION-KEEPS-SNAPSHOT"
   "TEST-REQ-MVC-004-READ-WAITING-REFUSAL-CLEANS-EPOCH"
   "TEST-REQ-MVC-004-READ-ENDED-BEGIN-CLEANS-EPOCH"
   "TEST-REQ-CON-004-READ-CURRENT-GENERATION-BEFORE-PIN"
   "TEST-REQ-CON-004-READ-SNAPSHOT-ZERO-GENERATION-BEFORE-PIN"
   "TEST-REQ-CON-004-READ-FOREIGN-SNAPSHOT-BEFORE-PIN"
   "TEST-REQ-CON-004-READ-ALREADY-ACTIVE-READER-REFUSAL"
   "TEST-REQ-CON-004-READ-NESTED-KEEPS-EXISTING-PIN"
   "TEST-REQ-MVC-005-READ-INACTIVE-BUFFER-REFUSAL"
   "TEST-REQ-MVC-005-READ-RESULT-RANGE-PRESERVES-BUFFER"
   "TEST-REQ-MVC-004-READ-FINAL-SNAPSHOT-CHECK"
   "TEST-REQ-CMP-007-READ-LOGICAL-EXPIRY-KEEPS-LIVE-EPOCH"
   "TEST-REQ-CON-004-READ-CLOCK-REGRESSION-RELEASES-PIN"
   "TEST-REQ-CMP-007-READ-ABANDON-RELEASES-PIN"
   "TEST-REQ-AFF-004-READ-IDLE-RESIDUAL-GENERATION"
   "TEST-REQ-AFF-004-READ-IDLE-RESIDUAL-CSN"
   "TEST-REQ-AFF-004-READ-IDLE-RESIDUAL-START"
   "TEST-REQ-AFF-004-READ-IDLE-RESIDUAL-CONFIRMED"
   "TEST-REQ-AFF-004-READ-IDLE-RESIDUAL-SNAPSHOT"
   "TEST-REQ-AFF-004-READ-ACTIVE-CURRENT-GENERATION"
   "TEST-REQ-AFF-004-READ-ACTIVE-CURRENT-CSN"
   "TEST-REQ-AFF-004-READ-ACTIVE-SNAPSHOT-ZERO-GENERATION"
   "TEST-REQ-AFF-004-READ-ACTIVE-FOREIGN-BINDING"
   "TEST-REQ-AFF-004-READ-MISSING-EPOCH-FAULT"
   "TEST-REQ-AFF-004-READ-FAULTED-CONTEXT-STAYS-FAULTED"
   "TEST-REQ-AFF-004-READ-FINAL-CSN-CHANGED-FAULT"
   "TEST-REQ-CMP-007-READ-EXTERNAL-ERROR-THROW-CLEANUP"
   "TEST-REQ-CON-004-READ-TWO-WORKER-MIGRATION")
  :STATUS :FAILED :RESULT :WORKER-ERROR :EXIT-CODE 2 :SIGNAL NIL :EXECUTION
  (:EXIT-CODE 2 :SIGNAL NIL :TIMED-OUT NIL :ARGV
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--disable-debugger"
    "--script" "isolated-build.lisp")
   :RUNNER
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/reader-verification/ArcDocDB/spikes/out/reader-forbidden-file.lisp/baseline/isolated-build.lisp")
   :STDOUT-LOG
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/reader-verification/ArcDocDB/spikes/out/reader-forbidden-file.lisp/baseline/stdout.log")
   :STDERR-LOG
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/reader-verification/ArcDocDB/spikes/out/reader-forbidden-file.lisp/baseline/stderr.log")
   :REPORT
   (:SCHEMA-VERSION 1 :KIND :READER-MUTATION-CHILD :PHASE :COMPILE-TESTS
    :STATUS :FAILED :FAILED-TEST NIL :PASSED-TESTS NIL :FAILURE-KIND :RUNTIME
    :DIAGNOSTIC
    #A((50) BASE-CHAR
       . "Compilazione non valida: tests/epochs/threads.lisp"))))
 :MUTANTS NIL :TARGETS
 ((:NAME "reclaim-at-equal-threshold" :FILE "src/epochs/reclaim.lisp" :TEST
   "TEST-REQ-CMP-007-EBR-STRICT-RECLAIM-THRESHOLD" :BEFORE
   "(when (< epoch (aref (registro-epoche-words registry) +word-threshold+))"
   :AFTER
   "(when (<= epoch (aref (registro-epoche-words registry) +word-threshold+))")
  (:NAME "allow-old-retirement-generation" :FILE "src/epochs/core.lisp" :TEST
   "TEST-REQ-CMP-007-EBR-STALE-GENERATION-PRESERVES-REUSE" :BEFORE
   "(= expected-generation (aref (registro-epoche-generations registry) slot))"
   :AFTER
   "(<= expected-generation (aref (registro-epoche-generations registry) slot))")
  (:NAME "claim-stays-retired" :FILE "src/epochs/reclaim.lisp" :TEST
   "TEST-REQ-CMP-007-EBR-CLAIM-IS-EXCLUSIVE" :BEFORE
   "(setf (aref (registro-epoche-states registry) slot) +retirement-claimed+)"
   :AFTER
   "(setf (aref (registro-epoche-states registry) slot) +retirement-retired+)")
  (:NAME "omit-abandon-cleanup" :FILE "src/read/task.lisp" :TEST
   "TEST-REQ-CMP-007-READ-ABANDON-RELEASES-PIN" :BEFORE
   "((:entering :active :faulted) (libera-contesto-lettura context))" :AFTER
   "((:entering :active :faulted) nil)")
  (:NAME "omit-final-snapshot-check" :FILE "src/read/task.lisp" :TEST
   "TEST-REQ-MVC-004-READ-FINAL-SNAPSHOT-CHECK" :BEFORE "(when snapshot
           (verifica-snapshot-in-buffer snapshot (aref words +word-generation+)
                                        now words +word-confirmed-csn+)
           (unless (= (aref words +word-snapshot-csn+) (aref words +word-confirmed-csn+))
             (guasto-contesto-lettura context :read-snapshot-csn-changed)))"
   :AFTER "(when snapshot nil)")
  (:NAME "overwrite-current-buffer" :FILE "src/read/task.lisp" :TEST
   "TEST-REQ-MVC-005-READ-CURRENT-BUFFER-UNTOUCHED" :BEFORE "        t)
      nil))"
   :AFTER "        t)
      (progn (setf (aref destination index) 0) nil)))")
  (:NAME "restore-faulted-as-idle" :FILE "src/read/core.lisp" :TEST
   "TEST-REQ-AFF-004-READ-FAULTED-CONTEXT-STAYS-FAULTED" :BEFORE
   "(unless faulted (setf (contesto-lettura-state context) :idle))" :AFTER
   "(when (or faulted (eq (contesto-lettura-state context) :faulted))
      (setf (contesto-lettura-state context) :idle))")
  (:NAME "reverse-clock-regression" :FILE "src/read/task.lisp" :TEST
   "TEST-REQ-CON-004-READ-CLOCK-REGRESSION-RELEASES-PIN" :BEFORE
   "(when (< now (aref words +word-start-time+))" :AFTER
   "(when (> now (aref words +word-start-time+))"))
 :SELF-TEST
 (:STATUS :OK :UNIQUE-TARGETS 8 :READ-EVAL-DISABLED T
  :ONLY-NAMED-RUNTIME-DETECTION T)
 :LIMITS
 (:EIGHT-TARGETED-MUTANTS :WHOLE-EPOCHS-THEN-READ-SUITE-BASELINE
  :NAMED-RUNTIME-TEST-KILL :SELECTED-TEST-MUTANT-RUN :MINIMAL-PRODUCT-COPY
  :VERIFIED-BASELINE-READER :PRIVATE-FASL :RAW-LOGS-AND-RUNNER-RETAINED
  :SIGNAL-TIMEOUT-COMPILATION-NOT-KILL :NO-C1-MCDC-OR-ENGINE-QUALIFICATION))
