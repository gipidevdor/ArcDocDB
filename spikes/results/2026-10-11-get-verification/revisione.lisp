(:schema-version 1 :kind :get-functional-independent-review :date "2026-10-11" :status :passed-in-scope
 :readings ((:reviewer "/root" :scope (:implementation-contracts :fixture-oracles :asd-coverage :native-results))
            (:reviewer "/root/reader_upstream_review" :scope (:implementation-contracts :fixture-oracles :asd-coverage
                       :merge-preservation :native-results :html-and-state-data)))
 :freezes ("f1bd3cd98cba9cadc545764437566414cf9613b4" "222b9fdbadf89253ca99d114662a51fba481839b")
 :pre-execution-findings ((:issue :fixture-republished-identical-csn :cases 2
                           :resolution :publish-p-nil-and-one-custom-publication :verified-before-executions))
 :oracles (:known-input-value :explicit-csn-and-time :public-conditions-and-reasons
           :public-state-and-epoch-observation :observed-native-reads)
 :private-access (:alias-inputs :native-backend-observer :labelled-fault-injection-only-for-state-changes)
 :unresolved-blockers nil :product-defects-confirmed nil
 :limits (:scope-bounded-review :not-complete-c1-or-mcdc :no-inline-admission-reattribution
          :no-concurrency-weak-memory-allocation-performance-qualification))
