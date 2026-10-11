(:schema-version 1 :kind :get-resolver-integration-verification-method :date "2026-10-11" :status :planned
 :registration :before-latest-integration-executions
 :previous-publication "30dae52c6789981034d3a7a0488d258b40918dae"
 :incoming-main "d155db3f977677fa95280f59c23fbe46a5e116d2"
 :incoming-scope (:closed-resolver :asd-component :implementation-documentation :static-evidence)
 :get-product-and-tests-policy :preserve-identical-seven-and-three-files
 :planned-checks (:warning-free-compilation-and-full-tests :product-lint :trace :links
                  :get-coverage :exact-published-head-full-check-core-ci)
 :freeze-before-recorded-runs t :preserve-earlier-runs t
 :limits (:integration-only :no-functional-resolver-qualification :partial-get-suite :no-phase-closure))
