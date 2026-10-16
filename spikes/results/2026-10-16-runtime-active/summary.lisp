(:schema-version 1 :kind :runtime-active-verification :date "2026-10-16"
 :verified-source "a5ef8997834cb7597766fc7fe48985db3b6f4f14"
 :source-variants ("068521d1a20d1c268ec5fb05f4a8114c3b73a4a5"
                   "66b1d2028005106275eddeb66f2b1a277399587e"
                   "a5ef8997834cb7597766fc7fe48985db3b6f4f14")
 :test-functions (:new-binding 8 :new-adoption 11 :new-total 19
                  :runtime-suite 38 :series-suite 109 :total 147 :passed 147 :failed 0
                  :adoption-parameter-cases-declared 26)
 :diagnostic-first (:record "processes/diagnostic-first/report.lisp"
                    :status :failed :passed 145 :total 147
                    :reason :two-existing-oracle-domains-expanded-by-log-backlink)
 :diagnostic (:record "processes/diagnostic/report.lisp" :status :ok :passed 147 :total 147
              :source "66b1d2028005106275eddeb66f2b1a277399587e"
              :helper "inputs/diagnose.lisp.txt" :authentication :capture-before-and-after)
 :check-first (:record "processes/check-first/report.lisp" :status :failed
               :reason :unused-native-argument-in-test-helper :product-unchanged-by-fix)
 :full-check (:record "processes/check/report.lisp" :status :ok :source-consistency :stable)
 :coverage (:scope "runtime-active" :record "processes/coverage/report.lisp"
            :html "coverage/product/cover-index.html" :files 3
            :raw-expressions (325 388) :raw-branches (33 64)
            :rows ((:file "runtime/active" :expressions (71 76) :branches (10 10))
                   (:file "series/types" :expressions (124 145) :branches (16 28))
                   (:file "wal/types" :expressions (130 167) :branches (7 26)))
            :cas-loser :not-reached :exclusions nil :mcdc :open)
 :parallel-evidence-self-test (:cases 48 :checks 756 :status :ok)
 :reviews (:readings 2 :independent-reviewers 1 :source "inputs/review.lisp.txt"
           :coordinator-followup-reread t :followup-independent-review nil)
 :limits (:canonical-log-object-required :physical-exclusion-external
          :catalog-decision-external :no-admission-gate :no-old-source-collection
          :serial-durable-composition :no-new-atomic-root-index-protocol
          :interruption-after-cas-static-only :cod24-coordinator-boundary-open
          :not-mcdc :not-full-c1 :no-new-benchmark :no-throughput-or-rss-or-zero-heap-claim
          :local-darwin-arm64-only :external-load-uncontrolled)
 :retention (:collector :common :jobs 4 :closed-inventory :independent-child
             :producer :sibling-archive :no-append-after-closure
             :excluded (:fasl-caches :coverage-state :reconstructible-negative-inputs
                        :temporary-gzip-expansions :session-markers)))
