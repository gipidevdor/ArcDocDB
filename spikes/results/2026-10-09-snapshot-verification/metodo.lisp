(:schema-version 1 :kind :snapshot-verification-method :date "2026-10-09"
 :baseline-main "edb043b1234479cadab0f39b7adf1918786fa91e"
 :registration :before-new-recorded-executions :status :planned
 :runtime-evidence :not-collected :source-freeze :ready
 :resumed-date "2026-10-11" :integration-main "5768e02d649f359cf7a9326f89b5e6b40fbf703c"
 :product-diff-from-planning-base :snapshot-and-csn-unchanged
 :frozen-verification-sources
 ((:file "tests/mvcc/support.lisp" :git-blob "ca49c8db671b145088d7acfac77cc28a4777dfc2")
  (:file "tests/mvcc/lifecycle.lisp" :git-blob "4e9a15f206e6374cc359b88adfc48f3983b4dd09")
  (:file "tests/mvcc/capture.lisp" :git-blob "3e08116a1f53e1b764a2f62d9174ff11037a8399")
  (:file "tools/snapshot-mutation.lisp" :git-blob "b46e9d42dd1c21e28ebbd661afe3ee05a1749fcd")
  (:file "Makefile" :git-blob "87622dd4bd4cdfeb80810aafe6787234efdca410")
  (:file "arcdocdb.asd" :git-blob "6d5b8599752287d56ca51971c3f24cca5af7a109")
  (:file "tools/foundation-coverage.lisp" :git-blob "d732271c6e5cae4f8e40c6f50e5b98cf4c6d7deb"))
 :scope (:snapshot-register :canonical-csn-adapter :snapshot-lifecycle
         :snapshot-validation :retention-threshold :bounded-timer)
 :product-api-and-formats :unchanged
 :dependencies (:arcdocdb-csn :arcdocdb-mvcc :existing-common-lisp-test-harness)
 :requirements (:req-mvc-003 :req-mvc-004 :req-mvc-005 :req-mvc-007
                :req-con-004 :req-aff-004 :req-aff-008)
 :invariants (:inv-m1 :inv-m2 :inv-m4 :inv-p5 :inv-a8)
 :test-sources
 (:package "arcdocdb.mvcc.tests" :registry "*mvcc-tests*" :runner "run"
  :files ("tests/mvcc/support.lisp" "tests/mvcc/lifecycle.lisp" "tests/mvcc/capture.lisp")
  :test-name-decision-mapping
  ((:file "tests/mvcc/support.lisp" :tests ())
   (:file "tests/mvcc/lifecycle.lisp" :tests ("TEST-REQ-AFF-008-SNAPSHOT-CONFIGURATION-BOUNDARIES" "TEST-REQ-AFF-008-SNAPSHOT-CONFIGURATION-TYPED-RANGE-REFUSALS" "TEST-REQ-MVC-005-SNAPSHOT-EMPTY-ARCHIVE-CSN-ZERO" "TEST-REQ-MVC-005-SNAPSHOT-CANONICAL-OUT-OF-ORDER-ACTIVATION" "TEST-REQ-MVC-005-SNAPSHOT-CARRY-U32-AND-BOXED-CSN" "TEST-REQ-MVC-007-SNAPSHOT-MAXIMUM-CSN-IS-NOT-ABSENCE" "TEST-REQ-MVC-007-SNAPSHOT-SAME-CSN-DISTINCT-GENERATIONS" "TEST-REQ-MVC-003-SNAPSHOT-MULTIPIN-RETENTION-BOUNDARIES" "TEST-REQ-MVC-007-SNAPSHOT-CONSERVATIVE-THRESHOLD-UNTIL-RECALCULATION" "TEST-REQ-AFF-008-SNAPSHOT-CAPACITY-REFUSES-BEFORE-MUTATION" "TEST-REQ-MVC-007-SNAPSHOT-PINNED-CONTEXT-REFUSES-BEFORE-MUTATION" "TEST-REQ-AFF-008-SNAPSHOT-DEADLINE-OVERFLOW-AND-EXACT-U64-BOUNDARY" "TEST-REQ-AFF-008-SNAPSHOT-PRIVATE-FI-GENERATION-EXHAUSTION" "TEST-REQ-MVC-004-SNAPSHOT-ACTIVE-READER-DEADLINE-BEFORE-EXACT-AFTER" "TEST-REQ-MVC-004-SNAPSHOT-ACTIVE-ACTIVATION-EXPIRY-REMOVES-PIN" "TEST-REQ-MVC-004-SNAPSHOT-WAIT-DEADLINE-BEFORE-EXACT-AFTER" "TEST-REQ-MVC-004-SNAPSHOT-LIFETIME-INCLUDES-INITIAL-WAIT" "TEST-REQ-AFF-008-SNAPSHOT-TIMER-BUDGET-REFUSALS-AND-EMPTY-SWEEP" "TEST-REQ-AFF-008-SNAPSHOT-TIMER-CIRCULAR-FAIRNESS-AND-MIXED-DEADLINES" "TEST-REQ-MVC-004-SNAPSHOT-TIMER-DISTINGUISHES-WAIT-AND-AGE" "TEST-REQ-MVC-007-SNAPSHOT-TERMINATION-IDEMPOTENT-ACTIVE-AND-WAITING" "TEST-REQ-MVC-007-SNAPSHOT-STALE-GENERATION-AFTER-CONTEXT-REUSE" "TEST-REQ-MVC-007-SNAPSHOT-STALE-CONTEXT-AFTER-SLOT-REUSE" "TEST-REQ-MVC-005-SNAPSHOT-PRIVATE-BUFFER-RANGE-AND-UNBOUND-IDENTITY" "TEST-REQ-AFF-004-SNAPSHOT-TERMINAL-INVALIDATION-PRESERVES-PINS" "TEST-REQ-AFF-004-SNAPSHOT-PRIVATE-FI-READER-CSN-STATE-AND-RANGE" "TEST-REQ-AFF-004-SNAPSHOT-PRIVATE-FI-COUNTER-GUARDS" "TEST-REQ-AFF-004-SNAPSHOT-PRIVATE-FI-RECALCULATION-INVARIANTS"))
   (:file "tests/mvcc/capture.lisp" :tests ("TEST-REQ-MVC-007-SNAPSHOT-ANNOUNCEMENT-BEFORE-CAPTURE" "TEST-REQ-MVC-007-SNAPSHOT-HORIZON-REGRESSION" "TEST-REQ-MVC-007-SNAPSHOT-CAPTURED-CSN-BELOW-HORIZON" "TEST-REQ-MVC-007-SNAPSHOT-BUSY-ROLLBACK-WITHOUT-PIN" "TEST-REQ-MVC-007-SNAPSHOT-BUSY-ROLLBACK-WITH-PIN" "TEST-REQ-MVC-007-SNAPSHOT-OTHER-RESOURCE-FAIL-STOP" "TEST-REQ-MVC-007-SNAPSHOT-CANONICAL-CONDITION-IDENTITY" "TEST-REQ-MVC-007-SNAPSHOT-THROW-AFTER-ANNOUNCEMENT" "TEST-REQ-MVC-007-SNAPSHOT-FAULT-BEFORE-PUBLISH" "TEST-REQ-MVC-007-SNAPSHOT-FAULT-DURING-PUBLISH" "TEST-REQ-MVC-007-SNAPSHOT-FAULT-AFTER-PUBLISH" "TEST-REQ-MVC-007-SNAPSHOT-READY-EQUALITY-AND-PUBLISHED-IDENTITY" "TEST-REQ-CON-004-SNAPSHOT-HELD-MUTEX-READER-AND-OTHER-ARCHIVE" "TEST-REQ-CON-004-SNAPSHOT-RECURSIVE-GUARD-AND-NIL-BODY" "TEST-REQ-CON-004-SNAPSHOT-READER-WITH-CSN-MUTEX-HELD"))))
 :decision-mapping
 ((:id "CSN-S01" :expected (:coherent-frontiers :independent-frontier-order-guards
                            :u32-carry :maximum-u64))
  (:id "CSN-S02" :expected (:capture-success :csn-busy :other-resource-exhausted
                            :invariant-violation :non-local-exit))
  (:id "CSN-S03" :expected (:provisional-threshold-with-and-without-existing-pins
                            :writer-observes-provisional-threshold
                            :no-identity-or-credit-consumed-on-busy))
  (:id "CSN-S04" :expected (:nil-body-is-not-contention :snapshot-busy
                            :recursive-acquisition-refused :mutex-released-after-exit))
  (:id "CSN-S05" :expected (:terminal-invalidation :repeated-invalidation
                            :fault-during-capture-or-publication :snapshot-reader-rejection)))
 :functional-method
 (:public-api-oracles :required :canonical-csn-registry :shared-with-test-writers
  :original-csn-tokens :required :explicit-monotonic-time-values :required
  :small-fixed-capacities :required :exact-deadline-and-u64-boundaries :required
  :generation-identity-and-buffer-preservation :required
  :bounded-sweep-and-retention-observations :required)
 :contention-method
 (:coordination :semaphores :finite-wait-and-join-deadlines :required
  :sleep-based-ordering :forbidden :worker-errors-propagated :required
  :bounded-cleanup-release-or-termination-and-collection-on-fi-failure :required
  :no-unbounded-polling)
 :injection-method
 (:boundary :snapshot-csn-adapter :execution :isolated-test-process
  :temporary-replacements-restored-by-unwind-protect :required
  :private-state-fixtures :only-explicit-boundary-or-fault-scenarios
  :not-a-production-callback-or-new-api)
 :mutation-method
 (:targets :snapshot-specific-runtime-guards-and-state-transitions
  :tool "tools/snapshot-mutation.lisp"
  :catalog
  ((:name "omit-announcement" :file "src/mvcc/snapshots-register.lisp" :test "TEST-REQ-MVC-007-SNAPSHOT-ANNOUNCEMENT-BEFORE-CAPTURE")
   (:name "keep-busy-announcement" :file "src/mvcc/snapshots-register.lisp" :test "TEST-REQ-MVC-007-SNAPSHOT-BUSY-ROLLBACK-WITHOUT-PIN")
   (:name "omit-h0-h1-guard" :file "src/mvcc/snapshots-register.lisp" :test "TEST-REQ-MVC-007-SNAPSHOT-HORIZON-REGRESSION")
   (:name "omit-h1-csn-guard" :file "src/mvcc/snapshots-register.lisp" :test "TEST-REQ-MVC-007-SNAPSHOT-CAPTURED-CSN-BELOW-HORIZON")
   (:name "ready-strictly-greater" :file "src/mvcc/snapshots-register.lisp" :test "TEST-REQ-MVC-007-SNAPSHOT-READY-EQUALITY-AND-PUBLISHED-IDENTITY")
   (:name "omit-registration-fail-stop" :file "src/mvcc/snapshots-register.lisp" :test "TEST-REQ-MVC-007-SNAPSHOT-THROW-AFTER-ANNOUNCEMENT")
   (:name "omit-csn-fault-propagation" :file "src/mvcc/snapshots-csn.lisp" :test "TEST-REQ-MVC-007-SNAPSHOT-CANONICAL-CONDITION-IDENTITY")
   (:name "publish-zero-identity" :file "src/mvcc/snapshots-register.lisp" :test "TEST-REQ-MVC-007-SNAPSHOT-READY-EQUALITY-AND-PUBLISHED-IDENTITY")
   (:name "retain-at-equal-threshold" :file "src/mvcc/snapshots-read.lisp" :test "TEST-REQ-MVC-007-SNAPSHOT-READY-EQUALITY-AND-PUBLISHED-IDENTITY")
   (:name "swallow-other-resource" :file "src/mvcc/snapshots-csn.lisp" :test "TEST-REQ-MVC-007-SNAPSHOT-OTHER-RESOURCE-FAIL-STOP"))
  :dedicated-test-selection :exact-name-from-mvcc-test-registry
  :isolated-source-copies-and-processes :required :unchanged-baseline :required
  :baseline-structured-phase-complete-and-exact-passed-test-list :required
  :compile-failure-signal-and-post-completion-nonzero :not-detections
  :worker-errors-and-original-exit-signal :preserved
  :self-test-and-invalid-cli :required-for-tool-cod-60-and-cod-61
  :self-test-ci-integration (:make-target "snapshot-mutation-selftest"
                            :included-in "check-core" :platforms (:linux :macos))
  :self-test-child-runner-log-report :preserved-from-spikes-out
  :expected-not-observed :all-listed-runtime-mutants-detected)
 :review-method
 (:two-readings :required :author-not-only-reader
  :actual-reviewer-role-source-hash-and-findings :required
  :c1-checklist-and-decision-scope :explicit)
 :recording
 (:local-executions-via "tools/record-command.lisp"
  :actual-argv-environment-output-exit-and-source-hashes :required
  :no-source-document-or-index-change-during-recorded-execution
  :failed-and-preliminary-records :preserved-with-original-status)
 :planned-verifications
 (:dedicated-functional-tests
  :mutation-tool-self-test ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
                           "tools/snapshot-mutation.lisp" "--self-test")
  :negative-cli :mutation-tool-cod-61
  :targeted-mutation-campaign ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
                             "tools/snapshot-mutation.lisp" "--check" "spikes/out/snapshot-mutazioni/")
  :integrated-make-check :final-evidence-trace-links-after-publication :ci-exact-pushed-head)
 :optional-partial-coverage
 (:tool "tools/foundation-coverage.lisp" :scope "mvcc"
  :instrumentation :all-product-sources :execution :arcdocdb-mvcc-tests-run-only
  :reported-files :eight-src-mvcc-files :filter "/src/mvcc/"
  :self-test-command ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
                      "tools/foundation-coverage.lisp" "--self-test" "spikes/out/snapshot-coverage-selftest/")
  :report-command ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
                   "tools/foundation-coverage.lisp" "--report" "spikes/out/snapshot-coverage/" "mvcc")
  :outputs (:sb-cover-state :html :raw-form-and-branch-counts)
  :uncovered-paths :explicit :mcdc :not-measured :release-gate :not-qualified)
 :publication
 (:schema-one-data-records :leaf-catalog-artifact-names
  :native-record-bytes-and-payload-names :unchanged
  :mutation-baseline-mutant-runner-and-log :preserved
  :actual-test-and-mutant-counts :from-original-records)
 :limits
 (:no-engine-or-phase-qualification :no-mcdc-claim
  :no-weak-memory-proof :no-zero-allocation-or-latency-claim
  :no-ebr-reclaim-or-primary-index-or-get-integration
  :no-durability-or-crash-recovery-proof
  :targeted-mutation-results-do-not-cover-all-possible-defects
  :expected-results-are-not-runtime-observations))
