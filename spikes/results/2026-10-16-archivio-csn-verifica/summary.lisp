(:schema-version 1 :kind :archive-csn-verification :date "2026-10-16"
 :verified-source "fc12350a53a0f07e62d7435fd1b5a89780c6eb4a"
 :test-functions (:set-and-preflight 22 :plan-provenance-lifetime 17 :native 9
                  :serial-fault-injection 6 :total 54 :passed 54)
 :diagnostic-attempts ((:record "processes/diagnostic-a/report.lisp" :status :failed
                        :total 54 :passed 47 :failed 7 :cause :fixture-oracles)
                       (:record "processes/diagnostic-b/report.lisp" :status :ok
                        :total 54 :passed 54 :failed 0))
 :coverage (:scope "recovery-archive-csn" :record "processes/coverage/report.lisp"
            :html "coverage/product/cover-index.html" :files 9
            :module-expressions (267 301) :module-branches (34 36)
            :raw-expressions (589 736) :raw-branches (57 74)
            :rows ((:file "recovery-active/build" :expressions (135 163) :branches (7 12))
                   (:file "recovery-active/types" :expressions (5 32) :branches (0 2))
                   (:file "recovery-archive-csn/build" :expressions (68 73) :branches (4 4))
                   (:file "recovery-archive-csn/preflight" :expressions (81 89) :branches (15 16))
                   (:file "recovery-archive-csn/query" :expressions (17 23) :branches (0 0))
                   (:file "recovery-archive-csn/series" :expressions (95 105) :branches (15 16))
                   (:file "recovery-archive-csn/types" :expressions (6 11) :branches (0 0))
                   (:file "recovery/decisions-query" :expressions (157 205) :branches (12 20))
                   (:file "recovery/decisions-types" :expressions (25 35) :branches (4 4)))
            :unreached-module-errors (:archive-csn-series-count :archive-csn-segment-count)
            :unreached-decision-fold-error :decision-csn-result
            :other-context-residuals :see-original-html :exclusions nil :mcdc :open)
 :full-check-reference "processes/check/report.lisp"
 :full-check-status :ok :full-check-source-consistency :stable
 :standard-correction (:cod-24 :decision-entry-shape :fold-consumption-and-normalization)
 :numeric-bug-on-canonical-input :not-demonstrated
 :base-tests (:absence-versus-zero :last-observed-not-next :first-assignment-M-plus-one
              :u32-carry :u64-exhaustion-without-wrap)
 :revisions ("434185ac" "dd855b14" "74cdc982" "fc12350a")
 :c1 :open :benchmark :not-run :performance-claims nil
 :limits (:local-sbcl-macos-arm64 :frozen-inputs-required :catalog-and-registri-authoritative-by-controller
          :no-traffic-admission :no-new-product-allocator :not-power-loss :not-linux-ci
          :not-full-engine-qualification :no-formal-proof-or-exemption))
