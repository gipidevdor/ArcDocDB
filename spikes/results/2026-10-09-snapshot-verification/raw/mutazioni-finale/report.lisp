(:SOURCE-CONSISTENCY :STABLE :SOURCE-FINGERPRINTS-AFTER
 ((:FILE "src/foundation/package.lisp" :MD5
   #A((32) BASE-CHAR . "4637efcf00ec170d7af32898f0739757"))
  (:FILE "src/foundation/conditions.lisp" :MD5
   #A((32) BASE-CHAR . "942b596396c19815290a57830af2121b"))
  (:FILE "src/foundation/binary.lisp" :MD5
   #A((32) BASE-CHAR . "a06115175f450776762761dce25acdb8"))
  (:FILE "src/foundation/crc32c.lisp" :MD5
   #A((32) BASE-CHAR . "4db58e2f48bf77d751f1b83bb9f84b5c"))
  (:FILE "src/foundation/record.lisp" :MD5
   #A((32) BASE-CHAR . "65ff9f2bb226ec818cec8f688ba7aa5c"))
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
  (:FILE "tests/foundation/support.lisp" :MD5
   #A((32) BASE-CHAR . "758adad069aec2f9dbe0635797314ff6"))
  (:FILE "tests/mvcc/support.lisp" :MD5
   #A((32) BASE-CHAR . "e7d26bd67650663c88ceda526023ae83"))
  (:FILE "tests/mvcc/lifecycle.lisp" :MD5
   #A((32) BASE-CHAR . "341627288b50485858efedc207fc95b5"))
  (:FILE "tests/mvcc/capture.lisp" :MD5
   #A((32) BASE-CHAR . "1f0309fa9258eb62a45167de5d2279d5"))
  (:FILE "tools/snapshot-mutation.lisp" :MD5
   #A((32) BASE-CHAR . "a7b8fcfc2283e1a5fbf23e82ce6184da")))
 :PROCESS-FIXTURES
 #A((129) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/4000702759-snapshot-self-test-40174-0/report.lisp")
 :EXPECTED-SUITE
 ("TEST-REQ-AFF-008-SNAPSHOT-CONFIGURATION-BOUNDARIES"
  "TEST-REQ-AFF-008-SNAPSHOT-CONFIGURATION-TYPED-RANGE-REFUSALS"
  "TEST-REQ-MVC-005-SNAPSHOT-EMPTY-ARCHIVE-CSN-ZERO"
  "TEST-REQ-MVC-005-SNAPSHOT-CANONICAL-OUT-OF-ORDER-ACTIVATION"
  "TEST-REQ-MVC-005-SNAPSHOT-CARRY-U32-AND-BOXED-CSN"
  "TEST-REQ-MVC-007-SNAPSHOT-MAXIMUM-CSN-IS-NOT-ABSENCE"
  "TEST-REQ-MVC-007-SNAPSHOT-SAME-CSN-DISTINCT-GENERATIONS"
  "TEST-REQ-MVC-003-SNAPSHOT-MULTIPIN-RETENTION-BOUNDARIES"
  "TEST-REQ-MVC-007-SNAPSHOT-CONSERVATIVE-THRESHOLD-UNTIL-RECALCULATION"
  "TEST-REQ-AFF-008-SNAPSHOT-CAPACITY-REFUSES-BEFORE-MUTATION"
  "TEST-REQ-MVC-007-SNAPSHOT-PINNED-CONTEXT-REFUSES-BEFORE-MUTATION"
  "TEST-REQ-AFF-008-SNAPSHOT-DEADLINE-OVERFLOW-AND-EXACT-U64-BOUNDARY"
  "TEST-REQ-AFF-008-SNAPSHOT-PRIVATE-FI-GENERATION-EXHAUSTION"
  "TEST-REQ-MVC-004-SNAPSHOT-ACTIVE-READER-DEADLINE-BEFORE-EXACT-AFTER"
  "TEST-REQ-MVC-004-SNAPSHOT-ACTIVE-ACTIVATION-EXPIRY-REMOVES-PIN"
  "TEST-REQ-MVC-004-SNAPSHOT-WAIT-DEADLINE-BEFORE-EXACT-AFTER"
  "TEST-REQ-MVC-004-SNAPSHOT-LIFETIME-INCLUDES-INITIAL-WAIT"
  "TEST-REQ-AFF-008-SNAPSHOT-TIMER-BUDGET-REFUSALS-AND-EMPTY-SWEEP"
  "TEST-REQ-AFF-008-SNAPSHOT-TIMER-CIRCULAR-FAIRNESS-AND-MIXED-DEADLINES"
  "TEST-REQ-MVC-004-SNAPSHOT-TIMER-DISTINGUISHES-WAIT-AND-AGE"
  "TEST-REQ-MVC-007-SNAPSHOT-TERMINATION-IDEMPOTENT-ACTIVE-AND-WAITING"
  "TEST-REQ-MVC-007-SNAPSHOT-STALE-GENERATION-AFTER-CONTEXT-REUSE"
  "TEST-REQ-MVC-007-SNAPSHOT-STALE-CONTEXT-AFTER-SLOT-REUSE"
  "TEST-REQ-MVC-005-SNAPSHOT-PRIVATE-BUFFER-RANGE-AND-UNBOUND-IDENTITY"
  "TEST-REQ-AFF-004-SNAPSHOT-TERMINAL-INVALIDATION-PRESERVES-PINS"
  "TEST-REQ-AFF-004-SNAPSHOT-PRIVATE-FI-READER-CSN-STATE-AND-RANGE"
  "TEST-REQ-AFF-004-SNAPSHOT-PRIVATE-FI-COUNTER-GUARDS"
  "TEST-REQ-AFF-004-SNAPSHOT-PRIVATE-FI-RECALCULATION-INVARIANTS"
  "TEST-REQ-MVC-007-SNAPSHOT-ANNOUNCEMENT-BEFORE-CAPTURE"
  "TEST-REQ-MVC-007-SNAPSHOT-HORIZON-REGRESSION"
  "TEST-REQ-MVC-007-SNAPSHOT-CAPTURED-CSN-BELOW-HORIZON"
  "TEST-REQ-MVC-007-SNAPSHOT-BUSY-ROLLBACK-WITHOUT-PIN"
  "TEST-REQ-MVC-007-SNAPSHOT-BUSY-ROLLBACK-WITH-PIN"
  "TEST-REQ-MVC-007-SNAPSHOT-OTHER-RESOURCE-FAIL-STOP"
  "TEST-REQ-MVC-007-SNAPSHOT-CANONICAL-CONDITION-IDENTITY"
  "TEST-REQ-MVC-007-SNAPSHOT-THROW-AFTER-ANNOUNCEMENT"
  "TEST-REQ-MVC-007-SNAPSHOT-FAULT-BEFORE-PUBLISH"
  "TEST-REQ-MVC-007-SNAPSHOT-FAULT-DURING-PUBLISH"
  "TEST-REQ-MVC-007-SNAPSHOT-FAULT-AFTER-PUBLISH"
  "TEST-REQ-MVC-007-SNAPSHOT-READY-EQUALITY-AND-PUBLISHED-IDENTITY"
  "TEST-REQ-CON-004-SNAPSHOT-HELD-MUTEX-READER-AND-OTHER-ARCHIVE"
  "TEST-REQ-CON-004-SNAPSHOT-RECURSIVE-GUARD-AND-NIL-BODY"
  "TEST-REQ-CON-004-SNAPSHOT-READER-WITH-CSN-MUTEX-HELD")
 :SOURCE-FINGERPRINTS-BEFORE
 ((:FILE "src/foundation/package.lisp" :MD5
   #A((32) BASE-CHAR . "4637efcf00ec170d7af32898f0739757"))
  (:FILE "src/foundation/conditions.lisp" :MD5
   #A((32) BASE-CHAR . "942b596396c19815290a57830af2121b"))
  (:FILE "src/foundation/binary.lisp" :MD5
   #A((32) BASE-CHAR . "a06115175f450776762761dce25acdb8"))
  (:FILE "src/foundation/crc32c.lisp" :MD5
   #A((32) BASE-CHAR . "4db58e2f48bf77d751f1b83bb9f84b5c"))
  (:FILE "src/foundation/record.lisp" :MD5
   #A((32) BASE-CHAR . "65ff9f2bb226ec818cec8f688ba7aa5c"))
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
  (:FILE "tests/foundation/support.lisp" :MD5
   #A((32) BASE-CHAR . "758adad069aec2f9dbe0635797314ff6"))
  (:FILE "tests/mvcc/support.lisp" :MD5
   #A((32) BASE-CHAR . "e7d26bd67650663c88ceda526023ae83"))
  (:FILE "tests/mvcc/lifecycle.lisp" :MD5
   #A((32) BASE-CHAR . "341627288b50485858efedc207fc95b5"))
  (:FILE "tests/mvcc/capture.lisp" :MD5
   #A((32) BASE-CHAR . "1f0309fa9258eb62a45167de5d2279d5"))
  (:FILE "tools/snapshot-mutation.lisp" :MD5
   #A((32) BASE-CHAR . "a7b8fcfc2283e1a5fbf23e82ce6184da")))
 :SCHEMA-VERSION 1 :KIND :SNAPSHOT-MUTATIONS :STATUS :OK :WORKER-ERRORS 0
 :BASELINE
 (:DIAGNOSTIC NIL :NAME "baseline" :DIRECTORY
  #A((115) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/baseline/")
  :EXPECTED-TESTS
  ("TEST-REQ-AFF-008-SNAPSHOT-CONFIGURATION-BOUNDARIES"
   "TEST-REQ-AFF-008-SNAPSHOT-CONFIGURATION-TYPED-RANGE-REFUSALS"
   "TEST-REQ-MVC-005-SNAPSHOT-EMPTY-ARCHIVE-CSN-ZERO"
   "TEST-REQ-MVC-005-SNAPSHOT-CANONICAL-OUT-OF-ORDER-ACTIVATION"
   "TEST-REQ-MVC-005-SNAPSHOT-CARRY-U32-AND-BOXED-CSN"
   "TEST-REQ-MVC-007-SNAPSHOT-MAXIMUM-CSN-IS-NOT-ABSENCE"
   "TEST-REQ-MVC-007-SNAPSHOT-SAME-CSN-DISTINCT-GENERATIONS"
   "TEST-REQ-MVC-003-SNAPSHOT-MULTIPIN-RETENTION-BOUNDARIES"
   "TEST-REQ-MVC-007-SNAPSHOT-CONSERVATIVE-THRESHOLD-UNTIL-RECALCULATION"
   "TEST-REQ-AFF-008-SNAPSHOT-CAPACITY-REFUSES-BEFORE-MUTATION"
   "TEST-REQ-MVC-007-SNAPSHOT-PINNED-CONTEXT-REFUSES-BEFORE-MUTATION"
   "TEST-REQ-AFF-008-SNAPSHOT-DEADLINE-OVERFLOW-AND-EXACT-U64-BOUNDARY"
   "TEST-REQ-AFF-008-SNAPSHOT-PRIVATE-FI-GENERATION-EXHAUSTION"
   "TEST-REQ-MVC-004-SNAPSHOT-ACTIVE-READER-DEADLINE-BEFORE-EXACT-AFTER"
   "TEST-REQ-MVC-004-SNAPSHOT-ACTIVE-ACTIVATION-EXPIRY-REMOVES-PIN"
   "TEST-REQ-MVC-004-SNAPSHOT-WAIT-DEADLINE-BEFORE-EXACT-AFTER"
   "TEST-REQ-MVC-004-SNAPSHOT-LIFETIME-INCLUDES-INITIAL-WAIT"
   "TEST-REQ-AFF-008-SNAPSHOT-TIMER-BUDGET-REFUSALS-AND-EMPTY-SWEEP"
   "TEST-REQ-AFF-008-SNAPSHOT-TIMER-CIRCULAR-FAIRNESS-AND-MIXED-DEADLINES"
   "TEST-REQ-MVC-004-SNAPSHOT-TIMER-DISTINGUISHES-WAIT-AND-AGE"
   "TEST-REQ-MVC-007-SNAPSHOT-TERMINATION-IDEMPOTENT-ACTIVE-AND-WAITING"
   "TEST-REQ-MVC-007-SNAPSHOT-STALE-GENERATION-AFTER-CONTEXT-REUSE"
   "TEST-REQ-MVC-007-SNAPSHOT-STALE-CONTEXT-AFTER-SLOT-REUSE"
   "TEST-REQ-MVC-005-SNAPSHOT-PRIVATE-BUFFER-RANGE-AND-UNBOUND-IDENTITY"
   "TEST-REQ-AFF-004-SNAPSHOT-TERMINAL-INVALIDATION-PRESERVES-PINS"
   "TEST-REQ-AFF-004-SNAPSHOT-PRIVATE-FI-READER-CSN-STATE-AND-RANGE"
   "TEST-REQ-AFF-004-SNAPSHOT-PRIVATE-FI-COUNTER-GUARDS"
   "TEST-REQ-AFF-004-SNAPSHOT-PRIVATE-FI-RECALCULATION-INVARIANTS"
   "TEST-REQ-MVC-007-SNAPSHOT-ANNOUNCEMENT-BEFORE-CAPTURE"
   "TEST-REQ-MVC-007-SNAPSHOT-HORIZON-REGRESSION"
   "TEST-REQ-MVC-007-SNAPSHOT-CAPTURED-CSN-BELOW-HORIZON"
   "TEST-REQ-MVC-007-SNAPSHOT-BUSY-ROLLBACK-WITHOUT-PIN"
   "TEST-REQ-MVC-007-SNAPSHOT-BUSY-ROLLBACK-WITH-PIN"
   "TEST-REQ-MVC-007-SNAPSHOT-OTHER-RESOURCE-FAIL-STOP"
   "TEST-REQ-MVC-007-SNAPSHOT-CANONICAL-CONDITION-IDENTITY"
   "TEST-REQ-MVC-007-SNAPSHOT-THROW-AFTER-ANNOUNCEMENT"
   "TEST-REQ-MVC-007-SNAPSHOT-FAULT-BEFORE-PUBLISH"
   "TEST-REQ-MVC-007-SNAPSHOT-FAULT-DURING-PUBLISH"
   "TEST-REQ-MVC-007-SNAPSHOT-FAULT-AFTER-PUBLISH"
   "TEST-REQ-MVC-007-SNAPSHOT-READY-EQUALITY-AND-PUBLISHED-IDENTITY"
   "TEST-REQ-CON-004-SNAPSHOT-HELD-MUTEX-READER-AND-OTHER-ARCHIVE"
   "TEST-REQ-CON-004-SNAPSHOT-RECURSIVE-GUARD-AND-NIL-BODY"
   "TEST-REQ-CON-004-SNAPSHOT-READER-WITH-CSN-MUTEX-HELD")
  :STATUS :OK :RESULT :BASELINE-PASSED :EXIT-CODE 0 :SIGNAL NIL :EXECUTION
  (:EXIT-CODE 0 :SIGNAL NIL :TIMED-OUT NIL :ARGV
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--disable-debugger"
    "--script" "isolated-build.lisp")
   :RUNNER
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/baseline/isolated-build.lisp")
   :STDOUT-LOG
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/baseline/stdout.log")
   :STDERR-LOG
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/baseline/stderr.log")
   :REPORT
   (:SCHEMA-VERSION 1 :KIND :SNAPSHOT-MUTATION-CHILD :PHASE :COMPLETE :STATUS
    :OK :FAILED-TEST NIL :PASSED-TESTS
    (#A((50) BASE-CHAR . "TEST-REQ-AFF-008-SNAPSHOT-CONFIGURATION-BOUNDARIES")
     #A((60) BASE-CHAR
        . "TEST-REQ-AFF-008-SNAPSHOT-CONFIGURATION-TYPED-RANGE-REFUSALS")
     #A((48) BASE-CHAR . "TEST-REQ-MVC-005-SNAPSHOT-EMPTY-ARCHIVE-CSN-ZERO")
     #A((59) BASE-CHAR
        . "TEST-REQ-MVC-005-SNAPSHOT-CANONICAL-OUT-OF-ORDER-ACTIVATION")
     #A((49) BASE-CHAR . "TEST-REQ-MVC-005-SNAPSHOT-CARRY-U32-AND-BOXED-CSN")
     #A((52) BASE-CHAR
        . "TEST-REQ-MVC-007-SNAPSHOT-MAXIMUM-CSN-IS-NOT-ABSENCE")
     #A((55) BASE-CHAR
        . "TEST-REQ-MVC-007-SNAPSHOT-SAME-CSN-DISTINCT-GENERATIONS")
     #A((55) BASE-CHAR
        . "TEST-REQ-MVC-003-SNAPSHOT-MULTIPIN-RETENTION-BOUNDARIES")
     #A((68) BASE-CHAR
        . "TEST-REQ-MVC-007-SNAPSHOT-CONSERVATIVE-THRESHOLD-UNTIL-RECALCULATION")
     #A((58) BASE-CHAR
        . "TEST-REQ-AFF-008-SNAPSHOT-CAPACITY-REFUSES-BEFORE-MUTATION")
     #A((64) BASE-CHAR
        . "TEST-REQ-MVC-007-SNAPSHOT-PINNED-CONTEXT-REFUSES-BEFORE-MUTATION")
     #A((66) BASE-CHAR
        . "TEST-REQ-AFF-008-SNAPSHOT-DEADLINE-OVERFLOW-AND-EXACT-U64-BOUNDARY")
     #A((58) BASE-CHAR
        . "TEST-REQ-AFF-008-SNAPSHOT-PRIVATE-FI-GENERATION-EXHAUSTION")
     #A((67) BASE-CHAR
        . "TEST-REQ-MVC-004-SNAPSHOT-ACTIVE-READER-DEADLINE-BEFORE-EXACT-AFTER")
     #A((62) BASE-CHAR
        . "TEST-REQ-MVC-004-SNAPSHOT-ACTIVE-ACTIVATION-EXPIRY-REMOVES-PIN")
     #A((58) BASE-CHAR
        . "TEST-REQ-MVC-004-SNAPSHOT-WAIT-DEADLINE-BEFORE-EXACT-AFTER")
     #A((56) BASE-CHAR
        . "TEST-REQ-MVC-004-SNAPSHOT-LIFETIME-INCLUDES-INITIAL-WAIT")
     #A((63) BASE-CHAR
        . "TEST-REQ-AFF-008-SNAPSHOT-TIMER-BUDGET-REFUSALS-AND-EMPTY-SWEEP")
     #A((69) BASE-CHAR
        . "TEST-REQ-AFF-008-SNAPSHOT-TIMER-CIRCULAR-FAIRNESS-AND-MIXED-DEADLINES")
     #A((58) BASE-CHAR
        . "TEST-REQ-MVC-004-SNAPSHOT-TIMER-DISTINGUISHES-WAIT-AND-AGE")
     #A((67) BASE-CHAR
        . "TEST-REQ-MVC-007-SNAPSHOT-TERMINATION-IDEMPOTENT-ACTIVE-AND-WAITING")
     #A((62) BASE-CHAR
        . "TEST-REQ-MVC-007-SNAPSHOT-STALE-GENERATION-AFTER-CONTEXT-REUSE")
     #A((56) BASE-CHAR
        . "TEST-REQ-MVC-007-SNAPSHOT-STALE-CONTEXT-AFTER-SLOT-REUSE")
     #A((67) BASE-CHAR
        . "TEST-REQ-MVC-005-SNAPSHOT-PRIVATE-BUFFER-RANGE-AND-UNBOUND-IDENTITY")
     #A((62) BASE-CHAR
        . "TEST-REQ-AFF-004-SNAPSHOT-TERMINAL-INVALIDATION-PRESERVES-PINS")
     #A((63) BASE-CHAR
        . "TEST-REQ-AFF-004-SNAPSHOT-PRIVATE-FI-READER-CSN-STATE-AND-RANGE")
     #A((51) BASE-CHAR . "TEST-REQ-AFF-004-SNAPSHOT-PRIVATE-FI-COUNTER-GUARDS")
     #A((61) BASE-CHAR
        . "TEST-REQ-AFF-004-SNAPSHOT-PRIVATE-FI-RECALCULATION-INVARIANTS")
     #A((53) BASE-CHAR
        . "TEST-REQ-MVC-007-SNAPSHOT-ANNOUNCEMENT-BEFORE-CAPTURE")
     #A((44) BASE-CHAR . "TEST-REQ-MVC-007-SNAPSHOT-HORIZON-REGRESSION")
     #A((52) BASE-CHAR
        . "TEST-REQ-MVC-007-SNAPSHOT-CAPTURED-CSN-BELOW-HORIZON")
     #A((51) BASE-CHAR . "TEST-REQ-MVC-007-SNAPSHOT-BUSY-ROLLBACK-WITHOUT-PIN")
     #A((48) BASE-CHAR . "TEST-REQ-MVC-007-SNAPSHOT-BUSY-ROLLBACK-WITH-PIN")
     #A((50) BASE-CHAR . "TEST-REQ-MVC-007-SNAPSHOT-OTHER-RESOURCE-FAIL-STOP")
     #A((54) BASE-CHAR
        . "TEST-REQ-MVC-007-SNAPSHOT-CANONICAL-CONDITION-IDENTITY")
     #A((50) BASE-CHAR . "TEST-REQ-MVC-007-SNAPSHOT-THROW-AFTER-ANNOUNCEMENT")
     #A((46) BASE-CHAR . "TEST-REQ-MVC-007-SNAPSHOT-FAULT-BEFORE-PUBLISH")
     #A((46) BASE-CHAR . "TEST-REQ-MVC-007-SNAPSHOT-FAULT-DURING-PUBLISH")
     #A((45) BASE-CHAR . "TEST-REQ-MVC-007-SNAPSHOT-FAULT-AFTER-PUBLISH")
     #A((63) BASE-CHAR
        . "TEST-REQ-MVC-007-SNAPSHOT-READY-EQUALITY-AND-PUBLISHED-IDENTITY")
     #A((61) BASE-CHAR
        . "TEST-REQ-CON-004-SNAPSHOT-HELD-MUTEX-READER-AND-OTHER-ARCHIVE")
     #A((54) BASE-CHAR
        . "TEST-REQ-CON-004-SNAPSHOT-RECURSIVE-GUARD-AND-NIL-BODY")
     #A((52) BASE-CHAR
        . "TEST-REQ-CON-004-SNAPSHOT-READER-WITH-CSN-MUTEX-HELD"))
    :FAILURE-KIND NIL :DIAGNOSTIC NIL)))
 :MUTANTS
 ((:DIAGNOSTIC NIL :NAME "omit-announcement" :DIRECTORY
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/omit-announcement/")
   :EXPECTED-TESTS ("TEST-REQ-MVC-007-SNAPSHOT-ANNOUNCEMENT-BEFORE-CAPTURE")
   :STATUS :OK :RESULT :DETECTED :EXIT-CODE 1 :SIGNAL NIL :EXECUTION
   (:EXIT-CODE 1 :SIGNAL NIL :TIMED-OUT NIL :ARGV
    ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--disable-debugger"
     "--script" "isolated-build.lisp"
     "TEST-REQ-MVC-007-SNAPSHOT-ANNOUNCEMENT-BEFORE-CAPTURE")
    :RUNNER
    #A((143) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/omit-announcement/isolated-build.lisp")
    :STDOUT-LOG
    #A((134) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/omit-announcement/stdout.log")
    :STDERR-LOG
    #A((134) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/omit-announcement/stderr.log")
    :REPORT
    (:SCHEMA-VERSION 1 :KIND :SNAPSHOT-MUTATION-CHILD :PHASE :TESTS :STATUS
     :FAILED :FAILED-TEST
     #A((53) BASE-CHAR
        . "TEST-REQ-MVC-007-SNAPSHOT-ANNOUNCEMENT-BEFORE-CAPTURE")
     :PASSED-TESTS NIL :FAILURE-KIND :RUNTIME :DIAGNOSTIC
     #A((134) BASE-CHAR . "Asserzione fallita: (= 4
                       (ARCDOCDB.MVCC:SOGLIA-SNAPSHOT
                        ARCDOCDB.MVCC.TESTS::REGISTRY))"))))
  (:DIAGNOSTIC NIL :NAME "keep-busy-announcement" :DIRECTORY
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/keep-busy-announcement/")
   :EXPECTED-TESTS ("TEST-REQ-MVC-007-SNAPSHOT-BUSY-ROLLBACK-WITHOUT-PIN")
   :STATUS :OK :RESULT :DETECTED :EXIT-CODE 1 :SIGNAL NIL :EXECUTION
   (:EXIT-CODE 1 :SIGNAL NIL :TIMED-OUT NIL :ARGV
    ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--disable-debugger"
     "--script" "isolated-build.lisp"
     "TEST-REQ-MVC-007-SNAPSHOT-BUSY-ROLLBACK-WITHOUT-PIN")
    :RUNNER
    #A((148) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/keep-busy-announcement/isolated-build.lisp")
    :STDOUT-LOG
    #A((139) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/keep-busy-announcement/stdout.log")
    :STDERR-LOG
    #A((139) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/keep-busy-announcement/stderr.log")
    :REPORT
    (:SCHEMA-VERSION 1 :KIND :SNAPSHOT-MUTATION-CHILD :PHASE :TESTS :STATUS
     :FAILED :FAILED-TEST
     #A((51) BASE-CHAR . "TEST-REQ-MVC-007-SNAPSHOT-BUSY-ROLLBACK-WITHOUT-PIN")
     :PASSED-TESTS NIL :FAILURE-KIND :RUNTIME :DIAGNOSTIC
     #A((40) BASE-CHAR . "ArcDocDB: SNAPSHOT-COUNTERS-INCONSISTENT"))))
  (:DIAGNOSTIC NIL :NAME "omit-h0-h1-guard" :DIRECTORY
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/omit-h0-h1-guard/")
   :EXPECTED-TESTS ("TEST-REQ-MVC-007-SNAPSHOT-HORIZON-REGRESSION") :STATUS :OK
   :RESULT :DETECTED :EXIT-CODE 1 :SIGNAL NIL :EXECUTION
   (:EXIT-CODE 1 :SIGNAL NIL :TIMED-OUT NIL :ARGV
    ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--disable-debugger"
     "--script" "isolated-build.lisp"
     "TEST-REQ-MVC-007-SNAPSHOT-HORIZON-REGRESSION")
    :RUNNER
    #A((142) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/omit-h0-h1-guard/isolated-build.lisp")
    :STDOUT-LOG
    #A((133) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/omit-h0-h1-guard/stdout.log")
    :STDERR-LOG
    #A((133) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/omit-h0-h1-guard/stderr.log")
    :REPORT
    (:SCHEMA-VERSION 1 :KIND :SNAPSHOT-MUTATION-CHILD :PHASE :TESTS :STATUS
     :FAILED :FAILED-TEST
     #A((44) BASE-CHAR . "TEST-REQ-MVC-007-SNAPSHOT-HORIZON-REGRESSION")
     :PASSED-TESTS NIL :FAILURE-KIND :RUNTIME :DIAGNOSTIC
     #A((119) BASE-CHAR
        . "Asserzione fallita: (TYPEP ARCDOCDB.MVCC.TESTS::OBSERVED
                           ARCDOCDB.MVCC.TESTS::EXPECTED-TYPE)"))))
  (:DIAGNOSTIC NIL :NAME "omit-h1-csn-guard" :DIRECTORY
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/omit-h1-csn-guard/")
   :EXPECTED-TESTS ("TEST-REQ-MVC-007-SNAPSHOT-CAPTURED-CSN-BELOW-HORIZON")
   :STATUS :OK :RESULT :DETECTED :EXIT-CODE 1 :SIGNAL NIL :EXECUTION
   (:EXIT-CODE 1 :SIGNAL NIL :TIMED-OUT NIL :ARGV
    ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--disable-debugger"
     "--script" "isolated-build.lisp"
     "TEST-REQ-MVC-007-SNAPSHOT-CAPTURED-CSN-BELOW-HORIZON")
    :RUNNER
    #A((143) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/omit-h1-csn-guard/isolated-build.lisp")
    :STDOUT-LOG
    #A((134) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/omit-h1-csn-guard/stdout.log")
    :STDERR-LOG
    #A((134) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/omit-h1-csn-guard/stderr.log")
    :REPORT
    (:SCHEMA-VERSION 1 :KIND :SNAPSHOT-MUTATION-CHILD :PHASE :TESTS :STATUS
     :FAILED :FAILED-TEST
     #A((52) BASE-CHAR
        . "TEST-REQ-MVC-007-SNAPSHOT-CAPTURED-CSN-BELOW-HORIZON")
     :PASSED-TESTS NIL :FAILURE-KIND :RUNTIME :DIAGNOSTIC
     #A((119) BASE-CHAR
        . "Asserzione fallita: (TYPEP ARCDOCDB.MVCC.TESTS::OBSERVED
                           ARCDOCDB.MVCC.TESTS::EXPECTED-TYPE)"))))
  (:DIAGNOSTIC NIL :NAME "ready-strictly-greater" :DIRECTORY
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/ready-strictly-greater/")
   :EXPECTED-TESTS
   ("TEST-REQ-MVC-007-SNAPSHOT-READY-EQUALITY-AND-PUBLISHED-IDENTITY") :STATUS
   :OK :RESULT :DETECTED :EXIT-CODE 1 :SIGNAL NIL :EXECUTION
   (:EXIT-CODE 1 :SIGNAL NIL :TIMED-OUT NIL :ARGV
    ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--disable-debugger"
     "--script" "isolated-build.lisp"
     "TEST-REQ-MVC-007-SNAPSHOT-READY-EQUALITY-AND-PUBLISHED-IDENTITY")
    :RUNNER
    #A((148) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/ready-strictly-greater/isolated-build.lisp")
    :STDOUT-LOG
    #A((139) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/ready-strictly-greater/stdout.log")
    :STDERR-LOG
    #A((139) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/ready-strictly-greater/stderr.log")
    :REPORT
    (:SCHEMA-VERSION 1 :KIND :SNAPSHOT-MUTATION-CHILD :PHASE :TESTS :STATUS
     :FAILED :FAILED-TEST
     #A((63) BASE-CHAR
        . "TEST-REQ-MVC-007-SNAPSHOT-READY-EQUALITY-AND-PUBLISHED-IDENTITY")
     :PASSED-TESTS NIL :FAILURE-KIND :RUNTIME :DIAGNOSTIC
     #A((207) BASE-CHAR . "Asserzione fallita: (EQUAL '(1 7 T)
                           (MULTIPLE-VALUE-LIST
                            (ARCDOCDB.MVCC:REGISTRA-SNAPSHOT
                             ARCDOCDB.MVCC.TESTS::CONTEXT 0)))"))))
  (:DIAGNOSTIC NIL :NAME "omit-registration-fail-stop" :DIRECTORY
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/omit-registration-fail-stop/")
   :EXPECTED-TESTS ("TEST-REQ-MVC-007-SNAPSHOT-THROW-AFTER-ANNOUNCEMENT")
   :STATUS :OK :RESULT :DETECTED :EXIT-CODE 1 :SIGNAL NIL :EXECUTION
   (:EXIT-CODE 1 :SIGNAL NIL :TIMED-OUT NIL :ARGV
    ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--disable-debugger"
     "--script" "isolated-build.lisp"
     "TEST-REQ-MVC-007-SNAPSHOT-THROW-AFTER-ANNOUNCEMENT")
    :RUNNER
    #A((153) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/omit-registration-fail-stop/isolated-build.lisp")
    :STDOUT-LOG
    #A((144) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/omit-registration-fail-stop/stdout.log")
    :STDERR-LOG
    #A((144) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/omit-registration-fail-stop/stderr.log")
    :REPORT
    (:SCHEMA-VERSION 1 :KIND :SNAPSHOT-MUTATION-CHILD :PHASE :TESTS :STATUS
     :FAILED :FAILED-TEST
     #A((50) BASE-CHAR . "TEST-REQ-MVC-007-SNAPSHOT-THROW-AFTER-ANNOUNCEMENT")
     :PASSED-TESTS NIL :FAILURE-KIND :RUNTIME :DIAGNOSTIC
     #A((119) BASE-CHAR
        . "Asserzione fallita: (TYPEP ARCDOCDB.MVCC.TESTS::OBSERVED
                           ARCDOCDB.MVCC.TESTS::EXPECTED-TYPE)"))))
  (:DIAGNOSTIC NIL :NAME "omit-csn-fault-propagation" :DIRECTORY
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/omit-csn-fault-propagation/")
   :EXPECTED-TESTS ("TEST-REQ-MVC-007-SNAPSHOT-CANONICAL-CONDITION-IDENTITY")
   :STATUS :OK :RESULT :DETECTED :EXIT-CODE 1 :SIGNAL NIL :EXECUTION
   (:EXIT-CODE 1 :SIGNAL NIL :TIMED-OUT NIL :ARGV
    ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--disable-debugger"
     "--script" "isolated-build.lisp"
     "TEST-REQ-MVC-007-SNAPSHOT-CANONICAL-CONDITION-IDENTITY")
    :RUNNER
    #A((152) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/omit-csn-fault-propagation/isolated-build.lisp")
    :STDOUT-LOG
    #A((143) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/omit-csn-fault-propagation/stdout.log")
    :STDERR-LOG
    #A((143) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/omit-csn-fault-propagation/stderr.log")
    :REPORT
    (:SCHEMA-VERSION 1 :KIND :SNAPSHOT-MUTATION-CHILD :PHASE :TESTS :STATUS
     :FAILED :FAILED-TEST
     #A((54) BASE-CHAR
        . "TEST-REQ-MVC-007-SNAPSHOT-CANONICAL-CONDITION-IDENTITY")
     :PASSED-TESTS NIL :FAILURE-KIND :RUNTIME :DIAGNOSTIC
     #A((119) BASE-CHAR
        . "Asserzione fallita: (TYPEP ARCDOCDB.MVCC.TESTS::OBSERVED
                           ARCDOCDB.MVCC.TESTS::EXPECTED-TYPE)"))))
  (:DIAGNOSTIC NIL :NAME "publish-zero-identity" :DIRECTORY
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/publish-zero-identity/")
   :EXPECTED-TESTS
   ("TEST-REQ-MVC-007-SNAPSHOT-READY-EQUALITY-AND-PUBLISHED-IDENTITY") :STATUS
   :OK :RESULT :DETECTED :EXIT-CODE 1 :SIGNAL NIL :EXECUTION
   (:EXIT-CODE 1 :SIGNAL NIL :TIMED-OUT NIL :ARGV
    ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--disable-debugger"
     "--script" "isolated-build.lisp"
     "TEST-REQ-MVC-007-SNAPSHOT-READY-EQUALITY-AND-PUBLISHED-IDENTITY")
    :RUNNER
    #A((147) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/publish-zero-identity/isolated-build.lisp")
    :STDOUT-LOG
    #A((138) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/publish-zero-identity/stdout.log")
    :STDERR-LOG
    #A((138) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/publish-zero-identity/stderr.log")
    :REPORT
    (:SCHEMA-VERSION 1 :KIND :SNAPSHOT-MUTATION-CHILD :PHASE :TESTS :STATUS
     :FAILED :FAILED-TEST
     #A((63) BASE-CHAR
        . "TEST-REQ-MVC-007-SNAPSHOT-READY-EQUALITY-AND-PUBLISHED-IDENTITY")
     :PASSED-TESTS NIL :FAILURE-KIND :RUNTIME :DIAGNOSTIC
     #A((33) BASE-CHAR . "ArcDocDB: SNAPSHOT-STALE-IDENTITY"))))
  (:DIAGNOSTIC NIL :NAME "retain-at-equal-threshold" :DIRECTORY
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/retain-at-equal-threshold/")
   :EXPECTED-TESTS
   ("TEST-REQ-MVC-007-SNAPSHOT-READY-EQUALITY-AND-PUBLISHED-IDENTITY") :STATUS
   :OK :RESULT :DETECTED :EXIT-CODE 1 :SIGNAL NIL :EXECUTION
   (:EXIT-CODE 1 :SIGNAL NIL :TIMED-OUT NIL :ARGV
    ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--disable-debugger"
     "--script" "isolated-build.lisp"
     "TEST-REQ-MVC-007-SNAPSHOT-READY-EQUALITY-AND-PUBLISHED-IDENTITY")
    :RUNNER
    #A((151) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/retain-at-equal-threshold/isolated-build.lisp")
    :STDOUT-LOG
    #A((142) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/retain-at-equal-threshold/stdout.log")
    :STDERR-LOG
    #A((142) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/retain-at-equal-threshold/stderr.log")
    :REPORT
    (:SCHEMA-VERSION 1 :KIND :SNAPSHOT-MUTATION-CHILD :PHASE :TESTS :STATUS
     :FAILED :FAILED-TEST
     #A((63) BASE-CHAR
        . "TEST-REQ-MVC-007-SNAPSHOT-READY-EQUALITY-AND-PUBLISHED-IDENTITY")
     :PASSED-TESTS NIL :FAILURE-KIND :RUNTIME :DIAGNOSTIC
     #A((134) BASE-CHAR . "Asserzione fallita: (NOT
                     (ARCDOCDB.MVCC:DEVE-TRATTENERE-P
                      ARCDOCDB.MVCC.TESTS::REGISTRY 7))"))))
  (:DIAGNOSTIC NIL :NAME "swallow-other-resource" :DIRECTORY
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/swallow-other-resource/")
   :EXPECTED-TESTS ("TEST-REQ-MVC-007-SNAPSHOT-OTHER-RESOURCE-FAIL-STOP")
   :STATUS :OK :RESULT :DETECTED :EXIT-CODE 1 :SIGNAL NIL :EXECUTION
   (:EXIT-CODE 1 :SIGNAL NIL :TIMED-OUT NIL :ARGV
    ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--disable-debugger"
     "--script" "isolated-build.lisp"
     "TEST-REQ-MVC-007-SNAPSHOT-OTHER-RESOURCE-FAIL-STOP")
    :RUNNER
    #A((148) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/swallow-other-resource/isolated-build.lisp")
    :STDOUT-LOG
    #A((139) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/swallow-other-resource/stdout.log")
    :STDERR-LOG
    #A((139) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/snapshot-mutazioni-finale/swallow-other-resource/stderr.log")
    :REPORT
    (:SCHEMA-VERSION 1 :KIND :SNAPSHOT-MUTATION-CHILD :PHASE :TESTS :STATUS
     :FAILED :FAILED-TEST
     #A((50) BASE-CHAR . "TEST-REQ-MVC-007-SNAPSHOT-OTHER-RESOURCE-FAIL-STOP")
     :PASSED-TESTS NIL :FAILURE-KIND :RUNTIME :DIAGNOSTIC
     #A((108) BASE-CHAR . "Asserzione fallita: (EQ ARCDOCDB.MVCC.TESTS::EXPECTED
                        ARCDOCDB.MVCC.TESTS::OBSERVED)")))))
 :TARGETS
 ((:NAME "omit-announcement" :FILE "src/mvcc/snapshots-register.lisp" :TEST
   "TEST-REQ-MVC-007-SNAPSHOT-ANNOUNCEMENT-BEFORE-CAPTURE" :BEFORE
   "(setf (aref words 1) (min previous announcement))" :AFTER
   "(setf (aref words 1) previous)")
  (:NAME "keep-busy-announcement" :FILE "src/mvcc/snapshots-register.lisp"
   :TEST "TEST-REQ-MVC-007-SNAPSHOT-BUSY-ROLLBACK-WITHOUT-PIN" :BEFORE
   "(setf (aref words 1) previous)" :AFTER
   "(setf (aref words 1) (min previous announcement))")
  (:NAME "omit-h0-h1-guard" :FILE "src/mvcc/snapshots-register.lisp" :TEST
   "TEST-REQ-MVC-007-SNAPSHOT-HORIZON-REGRESSION" :BEFORE
   "(unless (<= announcement horizon csn)" :AFTER "(unless (<= horizon csn)")
  (:NAME "omit-h1-csn-guard" :FILE "src/mvcc/snapshots-register.lisp" :TEST
   "TEST-REQ-MVC-007-SNAPSHOT-CAPTURED-CSN-BELOW-HORIZON" :BEFORE
   "(unless (<= announcement horizon csn)" :AFTER
   "(unless (<= announcement horizon)")
  (:NAME "ready-strictly-greater" :FILE "src/mvcc/snapshots-register.lisp"
   :TEST "TEST-REQ-MVC-007-SNAPSHOT-READY-EQUALITY-AND-PUBLISHED-IDENTITY"
   :BEFORE "(ready (>= horizon csn))" :AFTER "(ready (> horizon csn))")
  (:NAME "omit-registration-fail-stop" :FILE "src/mvcc/snapshots-register.lisp"
   :TEST "TEST-REQ-MVC-007-SNAPSHOT-THROW-AFTER-ANNOUNCEMENT" :BEFORE
   "(values generation csn ready))))
      (unless complete (invalida-registro-snapshot registry)))))"
   :AFTER "(values generation csn ready))))
      (unless complete nil))))")
  (:NAME "omit-csn-fault-propagation" :FILE "src/mvcc/snapshots-csn.lisp" :TEST
   "TEST-REQ-MVC-007-SNAPSHOT-CANONICAL-CONDITION-IDENTITY" :BEFORE
   "(invariant-violation (condition)
      (invalida-registro-snapshot registry)
      (error condition))))"
   :AFTER "(invariant-violation (condition)
      (error condition))))")
  (:NAME "publish-zero-identity" :FILE "src/mvcc/snapshots-register.lisp" :TEST
   "TEST-REQ-MVC-007-SNAPSHOT-READY-EQUALITY-AND-PUBLISHED-IDENTITY" :BEFORE
   "(setf (aref word 0) generation)" :AFTER "(setf (aref word 0) 0)")
  (:NAME "retain-at-equal-threshold" :FILE "src/mvcc/snapshots-read.lisp" :TEST
   "TEST-REQ-MVC-007-SNAPSHOT-READY-EQUALITY-AND-PUBLISHED-IDENTITY" :BEFORE
   "(< (soglia-snapshot registry) new-csn)" :AFTER
   "(<= (soglia-snapshot registry) new-csn)")
  (:NAME "swallow-other-resource" :FILE "src/mvcc/snapshots-csn.lisp" :TEST
   "TEST-REQ-MVC-007-SNAPSHOT-OTHER-RESOURCE-FAIL-STOP" :BEFORE
   "(unless (eq (error-reason condition) :csn-busy) (error condition))" :AFTER
   "(when (eq (error-reason condition) :csn-busy) (error condition))"))
 :SELF-TEST
 (:STATUS :OK :UNIQUE-TARGETS 10 :READ-EVAL-DISABLED T
  :ONLY-NAMED-RUNTIME-DETECTION T)
 :LIMITS
 (:TEN-TARGETED-MUTANTS :WHOLE-MVCC-SUITE-BASELINE :NAMED-RUNTIME-TEST-KILL
  :MINIMAL-PRODUCT-COPY :VERIFIED-BASELINE-SNAPSHOT :PRIVATE-FASL
  :RAW-LOGS-AND-RUNNER-RETAINED :SIGNAL-TIMEOUT-COMPILATION-NOT-KILL
  :NO-C1-MCDC-OR-ENGINE-QUALIFICATION))
