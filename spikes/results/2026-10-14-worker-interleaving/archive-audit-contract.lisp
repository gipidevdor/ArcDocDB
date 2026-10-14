(:schema-version 1 :kind :archive-audit-contract
 :source-commit "91c818f3616da7d0807285aaf5af44f519cb4247"
 :expected-groups ("publication-tools" "historical-PR13-CI-pass" "historical-main-CI-failure"
                   "historical-PR13-CI-audit" "historical-main-CI-negative-audit"
                   "F3-full-outer" "F3-full-inner" "F3-full-cache"
                   "F3-reader-fixtures" "F3-snapshot-fixtures" "F3-spike-aggregate"
                   "F3-native-semantic-audit" "F3-semantic-output"
                   "SPK-01-whole-cache" "SPK-02-whole-cache" "SPK-03-whole-cache"
                   "SPK-04-whole-cache" "SPK-05-whole-cache" "SPK-06-whole-cache"
                   "SPK-07-whole-cache" "SPK-08-whole-cache" "SPK-09-whole-cache" "SPK-10-whole-cache")
 :expected-processes (("historical-PR13-CI-audit" :ok 0 :stable)
                      ("historical-main-CI-negative-audit" :failed 1 :stable)
                      ("F3-full-outer" :ok 0 :stable)
                      ("F3-full-inner" :ok 0 :stable)
                      ("F3-native-semantic-audit" :ok 0 :stable))
 :required-fasl-groups ("F3-full-cache")
 :native-reports (("raw/F3-semantic-output/full-F3-audit.lisp" :cbor-interleaving-functional-native-audit :ok))
 :limits (:historical-PR-pass-qualified-on-native-A-only :historical-main-failure-retained
          :neither-historical-CI-promoted-to-F3 :F3-full-results-qualified-separately
          :complete-private-cache-and-SPK-whole-cache-bytes :older-SPK-files-not-promoted
          :no-earlier-scope-promotion :no-F3-CI-pass-claim :no-performance-or-mcdc-or-C1-claim))
