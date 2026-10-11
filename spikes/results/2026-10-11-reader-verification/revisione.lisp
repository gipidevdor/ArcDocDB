(:schema-version 1 :kind :reader-static-review :date "2026-10-11"
 :status :approved-static :runtime-evidence :not-collected :product-changes :none
 :readings
 ((:reviewer "/root" :role :integration-review
   :files ("tests/epochs/support.lisp" "tests/epochs/lifecycle.lisp" "tests/epochs/threads.lisp"
           "tests/read/support.lisp" "tests/read/lifecycle.lisp" "tests/read/threads.lisp"
           "arcdocdb.asd" "Makefile" "tools/foundation-coverage.lisp")
   :resolved-findings (:inactive-controller-reader-before-waits :preserved-cbor-write-scope
                       :decision-mapping-matches-existing-contracts))
  (:reviewer "/root/reader_tests_review" :role :independent-test-review :status :approved-static
   :tests (:epochs 34 :read 30)
   :resolved-finding (:controller-had-active-other-reader-during-wait
                      :other-reader-now-inactive :rechecked-thread-blob
                      "b772a3893467eaf1990ed47cc37e208cc573c3db")
   :blocking-findings :none
   :gaps (:retirement-slot-out-of-range :metadata-state-combinations-incomplete
          :publication-zero-credit-fi :unknown-slot-state-and-credit-accounting-fi))
  (:reviewer "/root/reader_tool_review" :role :independent-c4-tool-review :status :approved-static
   :file "tools/reader-mutation.lisp"
   :sha256 "190f4d7c0821f3cad3a2ad36fcebc8cbd02045381fee5e35c53e333e925a3bd1"
   :product-files 26 :suite-files 7 :baseline-tests 64 :mutants 8 :blocking-findings :none
   :verified (:read-eval-disabled :one-keyword-plist :exact-ordered-baseline
              :selected-mutant-target :private-sources-and-fasl :finite-process-budget
              :runtime-kill-only :signal-timeout-and-post-complete-exit-worker-errors
              :typed-fixture-timeout :real-process-fixtures-retained)))
 :checklist
 ((:item 1 :status :static-conform :scope :requirements-adrs-existing-contracts)
  (:item 2 :status :test-cases-present :runtime :pending)
  (:item 3 :status :typed-refusals-and-isolated-fi-present :runtime :pending)
  (:item 4 :status :bounded :wait-join-seconds 5 :cleanup-join-seconds 1 :child-seconds 30)
  (:item 5 :status :not-measured :product-hot-path :unchanged :harness :allocating)
  (:item 6 :status :public-api-oracles :private-access :explicit-fi-and-preservation)
  (:item 7 :status :mapped-partial :new-product-decisions :none :mcdc :not-attested)
  (:item 8 :status :owned-fixtures :waits-outside-reader-epoch :required)
  (:item 9 :status :pending :checks (:trace :full-check :ci))
  (:item 10 :status :no-static-deviation-found)
  (:item 11 :status :no-new-product-shared-lock)
  (:item 12 :status :not-applicable :durable-changes :none))
 :limits (:static-review-only :no-engine-or-phase-qualification :no-c1-qualification
          :no-mcdc :no-weak-memory-proof :no-internal-inline-window-injection
          :no-internal-cleanup-interruption :no-allocation-or-latency-measurement))
