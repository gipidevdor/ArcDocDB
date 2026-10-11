(:schema-version 1 :kind :snapshot-static-review :date "2026-10-11" :status :approved-static
 :product-changes :none :runtime-evidence :not-collected
 :readings
 ((:reviewer "/root" :role :integration-review
   :files ("tests/mvcc/support.lisp" "tests/mvcc/lifecycle.lisp" "tests/mvcc/capture.lisp"
           "tools/snapshot-mutation.lisp" "Makefile" "arcdocdb.asd" "tools/foundation-coverage.lisp")
   :resolved-findings (:lawful-nil-api :second-capture-other-resource :fresh-context-rollback
                       :deadline-ready-priority :timer-oracle-slot-order-independent
                       :compilation-worker-error :verified-baseline-directory-scope))
  (:reviewer "/root/snapshot_final_review" :role :independent-test-review
   :status :approved-static :tests (:lifecycle 28 :capture 15)
   :files ("tests/mvcc/support.lisp" "tests/mvcc/lifecycle.lisp" "tests/mvcc/capture.lisp")
   :blocking-findings :none)
  (:reviewer "/root/snapshot_final_tool" :role :independent-c4-tool-review
   :status :approved-static :git-blob "b46e9d42dd1c21e28ebbd661afe3ee05a1749fcd"
   :sha256 "c3645cbd9d450612cc61bbe2f9fb2110f5cb2c8622f7fd0c0d9940a6fc34df89"
   :copied-product-files 16 :copied-test-files 4 :expected-baseline-tests 43
   :blocking-findings :none))
 :checklist
 ((:item 1 :status :static-conform :scope :requirements-adrs)
  (:item 2 :status :test-cases-present :runtime :pending)
  (:item 3 :status :typed-refusals-and-injections-present :runtime :pending)
  (:item 4 :status :bounded :fixture-wait-seconds 5 :cleanup-join-seconds 1 :child-seconds 30)
  (:item 5 :status :not-measured :product-hot-path :unchanged :harness :allocating)
  (:item 6 :status :public-api-oracles :private-access :explicit-fi-and-preservation)
  (:item 7 :status :mapped-partial :new-product-decisions :none :mcdc :not-attested)
  (:item 8 :status :owned-fixtures :function-replacements :serial-and-restored)
  (:item 9 :status :pending :checks (:trace :full-check :ci))
  (:item 10 :status :no-static-deviation-found)
  (:item 11 :status :no-new-product-shared-lock)
  (:item 12 :status :not-applicable :durable-changes :none))
 :limits (:static-review-only :no-engine-qualification :no-c1-qualification :no-mcdc
          :no-weak-memory-proof :no-allocation-or-latency-measurement))
