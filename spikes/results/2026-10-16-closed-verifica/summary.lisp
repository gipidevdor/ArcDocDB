(:schema-version 1 :kind :closed-recovery-verification :date "2026-10-16"
 :coverage-and-full-check-source "7c2845b131ee69bd69b86b90c829e49e7135e966"
 :integration-source "1c2341944c0cb9e967a11ab5724213c0ae41f678"
 :integration-command ("make" "build" "lint" "lint-selftest" "trace")
 :full-check-command ("make" "check-core")
 :closed-product-unchanged-after-coverage t
 :test-functions (:read 25 :semantics-and-set 15 :csn-and-serie 10 :native-publication 10
                  :serial-fault-injection 9 :total 69 :passed 69)
 :coverage (:scope "recovery-closed" :source "coverage/e/cover-index.html"
            :expressions (739 814) :raw-branches (87 94) :application-branches (87 90)
            :files ((:name "build" :expressions (135 152) :branches (0 0))
                    (:name "csn-serie" :expressions (33 37) :branches (0 0))
                    (:name "csn" :expressions (101 110) :branches (13 14))
                    (:name "publication" :expressions (89 99) :branches (13 14))
                    (:name "read" :expressions (191 197) :branches (32 32))
                    (:name "resolve" :expressions (54 61) :branches (9 10))
                    (:name "types" :expressions (15 33) :branches (0 4))
                    (:name "verify" :expressions (121 125) :branches (20 20)))
            :unreached-application-errors (:closed-recovery-resolution-count
                                          :closed-recovery-csn-outcomes
                                          :closed-recovery-set-consumption)
            :generated-branches (0 4) :exclusions nil :mcdc :open)
 :process-records 13 :command-failures 4 :failure-records-preserved t
 :revisions ("1c69331a" "155871f3" "07857fe4" "c89bceee" "cf6a5be3" "7c2845b1" "1c234194")
 :product-corrections (:orphan-outcome-edit-conflict-rejected :edit-csn-u64-and-count-guards)
 :c1 :open :benchmark :not-run :performance-claims nil
 :limits (:local-sbcl-macos-arm64 :not-linux-ci :not-power-loss :not-external-writers
          :not-global-csn-plan-qualification :not-traffic-admission :frozen-sources-required))
