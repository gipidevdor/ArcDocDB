(:schema-version 1 :kind :reader-verification-method :date "2026-10-11"
 :registration :before-recorded-executions :status :planned :runtime-evidence :not-collected
 :baseline-main "01dd641e783d1060b2f655cbf6562524ca83608a"
 :integration-main "2a0011f9d2bef104b22f7ad1eb86d7e5d60d5e11"
 :product-changes :none :source-freeze :ready
 :frozen-verification-sources
 (  (:file "tests/epochs/support.lisp" :git-blob "de53c4db528218c5bb4e074d7cd26a4a38f0ecc5")
  (:file "tests/epochs/lifecycle.lisp" :git-blob "6980f8ef0aec2f962d2c85c38ad5b712132ce2be")
  (:file "tests/epochs/threads.lisp" :git-blob "b772a3893467eaf1990ed47cc37e208cc573c3db")
  (:file "tests/read/support.lisp" :git-blob "e7f982fc2737ac7c0985c4881325be2711f30bd1")
  (:file "tests/read/lifecycle.lisp" :git-blob "6b20bd639c91aee4c0011b26ba10487ab0f54cc0")
  (:file "tests/read/threads.lisp" :git-blob "b4961a7cb2455d792430a31e8a7528f4561ddc54")
  (:file "tools/reader-mutation.lisp" :git-blob "256252a0cdeb1d62bce34cee030093858fd2a5f8")
  (:file "Makefile" :git-blob "5820eb0ee2f06bc024e238afe12106b0e74275dc")
  (:file "arcdocdb.asd" :git-blob "0bde12bf55a79fbd4e57401e2514cfa28a6f997d")
  (:file "tools/foundation-coverage.lisp" :git-blob "d78cb0ff6fe1ae72424fe9a8ef1ed6847f2cd647"))
 :scope (:epoch-admission-and-exit :bounded-retirement :strict-reclaim-threshold
         :reader-task-lifecycle :snapshot-delivery-check :owner-cleanup)
 :requirements (:req-cmp-005 :req-cmp-007 :req-aff-004 :req-aff-008
                :req-con-004 :req-mvc-004 :req-mvc-005)
 :invariants (:inv-p5 :inv-a8 :inv-c10 :inv-r1 :inv-m1 :inv-m4)
 :expected-baseline-count 64 :expected-baseline-order :epochs-then-read
 :expected-baseline-test-names
 (  "TEST-REQ-AFF-008-EBR-VALID-CAPACITIES-AND-INITIAL-STATE"
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
 :functional-method
 (:public-api-oracles :required :independent-integer-and-state-expectations :required
  :real-csn-snapshot-and-epoch-registries :required :original-csn-token :required
  :small-fixed-capacities :required :typed-u64-limit-fixtures :isolated
  :private-images :refusal-preservation-only :private-corruption :single-field-fixtures
  :external-unwind-protect :installed-before-admission :timeouts :typed-fixture-timeout)
 :decisions
 ((:id "EBR-D01" :witnesses (:valid-boundaries :typed-capacity-refusals))
  (:id "EBR-D02" :witnesses (:reservation-counts :capacity :epoch-credit :counter-fi))
  (:id "EBR-D03" :witnesses (:canonical-ticket :zero-wrong-and-stale-generation))
  (:id "EBR-D04" :witnesses (:reserved-retired-claimed-cancelled-completed :metadata-fi))
  (:id "EBR-D05" :witnesses (:generation-limit :epoch-credit-limit :capacity :duplicate-resource))
  (:id "EBR-D06" :witnesses (:valid-reserved-credit :publish-once :epoch-overflow-fi))
  (:id "EBR-D07" :witnesses (:duplicate-eq :bounded-slot-reuse))
  (:id "EBR-D08" :witnesses (:completion-idempotence :resource-retained-until-completion))
  (:id "READ-D01" :witnesses (:valid-idle :four-independent-word-fi :snapshot-fi))
  (:id "READ-D02" :witnesses (:generation-zero :foreign-registry :valid-input))
  (:id "READ-D03" :witnesses (:active-generation-zero :foreign-binding :valid-snapshot))
  (:id "READ-D04" :witnesses (:current-generation-fi :current-csn-fi :valid-current)))
 :decision-gaps (:retirement-slot-out-of-range :metadata-state-combinations-incomplete
                 :publication-zero-credit-fi :unknown-slot-state-and-credit-accounting-fi)
 :additional-runtime-guards (:strict-reclaim-threshold :exclusive-claim :snapshot-final-check)
 :concurrency-method
 (:real-threads (:two-reclaim-claimers :reader-with-maintenance-mutex-held :two-worker-migration)
  :coordination :semaphores :wait-and-join-seconds 5 :cleanup-join-seconds 1
  :waits-only-outside-reader-epoch :required :sleep-ordering :forbidden
  :logical-expiry-reclaim-sequence :serial-public-api-boundaries
  :worker-errors-propagated :required :owner-release :required)
 :mutation-method
 (:tool "tools/reader-mutation.lisp" :targets
 (  (:name "reclaim-at-equal-threshold" :file "src/epochs/reclaim.lisp" :test "TEST-REQ-CMP-007-EBR-STRICT-RECLAIM-THRESHOLD")
  (:name "allow-old-retirement-generation" :file "src/epochs/core.lisp" :test "TEST-REQ-CMP-007-EBR-STALE-GENERATION-PRESERVES-REUSE")
  (:name "claim-stays-retired" :file "src/epochs/reclaim.lisp" :test "TEST-REQ-CMP-007-EBR-CLAIM-IS-EXCLUSIVE")
  (:name "omit-abandon-cleanup" :file "src/read/task.lisp" :test "TEST-REQ-CMP-007-READ-ABANDON-RELEASES-PIN")
  (:name "omit-final-snapshot-check" :file "src/read/task.lisp" :test "TEST-REQ-MVC-004-READ-FINAL-SNAPSHOT-CHECK")
  (:name "overwrite-current-buffer" :file "src/read/task.lisp" :test "TEST-REQ-MVC-005-READ-CURRENT-BUFFER-UNTOUCHED")
  (:name "restore-faulted-as-idle" :file "src/read/core.lisp" :test "TEST-REQ-AFF-004-READ-FAULTED-CONTEXT-STAYS-FAULTED")
  (:name "reverse-clock-regression" :file "src/read/task.lisp" :test "TEST-REQ-CON-004-READ-CLOCK-REGRESSION-RELEASES-PIN"))
  :baseline :all-64-tests-exact-order :mutant-run :only-nominated-test
  :source-copies :private :fasl :private :literal-match :exact-and-unique
  :product-files 26 :suite-files 7 :child-seconds 30
  :runtime-detection :only-exit-one-exact-nominated-test
  :compile-warning-signal-timeout-fixture-timeout-post-complete-nonzero :worker-error
  :process-fixtures (:real-sigkill-nine :complete-then-exit-seven)
  :self-test-ci (:target "reader-mutation-selftest" :included-in "check-core" :linux :macos)
  :negative-cli :cod-61-refusal-preserved-as-failed
  :expected-not-observed :eight-detections-and-no-worker-error-in-mutation-campaign)
 :coverage-method
 (:tool "tools/foundation-coverage.lisp" :scopes ("epochs" "read")
  :independent-fasl-directories :required :run-only-corresponding-suite :required
  :expression-and-branch-numerators-and-denominators :required
  :native-sb-cover-state-and-html :preserved :inline-attribution-limit :explicit
  :mcdc :not-measured)
 :review-method (:independent-test-and-tool-readings :required :author-not-only-reader
                 :hashes-findings-and-resolution :preserved :c1-checklist :partial)
 :recording (:tool "tools/record-command.lisp" :argv-environment-output-exit :native
             :no-source-document-or-index-change-during-recorded-runs
             :source-consistency :stable-required :failed-record-status :unchanged)
 :planned-verifications (:integrated-check-core :mutation-self-test :negative-cli
                         :targeted-mutations :coverage-self-test :epochs-and-read-coverage
                         :publication-byte-audit :trace-links-evidence :ci-pushed-head)
 :publication (:catalog :schema-one-leaf-artifacts :native-bytes :unchanged
               :gzip-payload-leaf-names :unchanged :raw-child-sources-fasl-logs :preserved
               :file-bytes-and-sha256-copy-audit :required)
 :limits (:no-internal-inline-window-injection :epoch-change-returning-nil-not-exercised
          :no-internal-cleanup-interruption :no-weak-memory-proof :no-mcdc
          :no-zero-allocation-or-latency-measurement :no-engine-or-phase-qualification
          :no-get-segment-manager-durability-or-crash-recovery-integration
          :targeted-mutants-do-not-cover-all-defects :expected-results-not-observed))
