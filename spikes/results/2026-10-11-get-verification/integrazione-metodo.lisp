(:schema-version 1 :kind :get-integration-verification-method :date "2026-10-11" :status :planned
 :registration :before-integration-test-executions
 :previous-freeze "f1bd3cd98cba9cadc545764437566414cf9613b4"
 :incoming-main "0d0ec4bf4d0d5aae6d6692bbe109af2166b44731"
 :incoming-scope (:cbor-string-writer :worker-series-bridge :ordinary-suites :coverage-route)
 :reason :integrate-concurrent-main-before-publication
 :policy (:preserve-first-native-runs :preserve-all-incoming-asd-and-coverage-routes
          :no-get-product-change :review-merge :freeze-before-reruns)
 :planned-checks (:full-check-core :get-coverage :coverage-self-test :final-trace-links-evidence :exact-head-ci)
 :limits (:composition-verification :no-requalification-of-upstream-campaigns :partial-get-coverage :no-c1-or-mcdc-closure))
