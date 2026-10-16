(:schema-version 1 :kind :archive-runtime-verification :date "2026-10-16"
 :verified-source "e0c47315187e750ea42b84009cc500ea248372fe"
 :test-functions (:functional 15 :concurrent 2 :native 3 :serial-fault-injection 7
                  :total 27 :passed 27 :failed 0)
 :diagnostic (:record "processes/diagnostic/report.lisp" :status :ok :passed 27 :total 27
              :helper "inputs/diagnose.lisp.txt" :source-authentication :capture-before-and-after)
 :coverage (:scope "runtime" :record "processes/coverage/report.lisp"
            :html "coverage/product/cover-index.html" :files 5
            :module-expressions (178 201) :module-branches (34 34)
            :raw-expressions (190 230) :raw-branches (35 40)
            :rows ((:file "runtime/build" :expressions (94 102) :branches (16 16))
                   (:file "runtime/preflight" :expressions (60 64) :branches (16 16))
                   (:file "runtime/query" :expressions (23 30) :branches (2 2))
                   (:file "runtime/types" :expressions (1 5) :branches (0 0))
                   (:file "recovery-archive/types" :expressions (12 29) :branches (1 6)))
            :cas-loser :observed-not-forced :exclusions nil :mcdc :open)
 :full-check (:record "processes/check/report.lisp" :status :ok :source-consistency :stable)
 :parallel-evidence-self-test (:cases 48 :checks 756 :status :ok)
 :collection-first (:record "processes/collection-first/report.lisp" :status :failed
                    :phase :planning :reason :decoded-record
                    :cause :accidentally-selected-malformed-c4-protocol
                    :manifest "inputs/manifest-first.lisp.txt"
                    :observation "inputs/collection-first.lisp")
 :source-variants ("e0c47315187e750ea42b84009cc500ea248372fe")
 :reviews (:readings 2 :independent-reviewers 1 :reviewer-wrote-only-serial-fi t
           :coordinator-reread t :source "inputs/review.md.txt")
 :limits (:canonical-archive-object-required :physical-exclusion-external :frozen-plan-required
          :no-admission-gate :no-physical-reconciliation :no-controller-composition
          :interruption-after-cas-static-only :not-mcdc :not-full-c1
          :no-new-benchmark :no-throughput-or-rss-or-zero-heap-claim
          :local-darwin-arm64-only :external-load-uncontrolled)
 :retention (:collector :common :jobs 4 :closed-inventory :independent-child
             :producer :sibling-archive :no-append-after-closure
             :excluded (:fasl-caches :coverage-state :reconstructible-negative-inputs
                        :temporary-gzip-expansions :session-markers)))
