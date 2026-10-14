(:schema-version 1 :kind :archive-audit-contract
 :source-commit "0c7d08f8383892a6c7c07d9c9b2fbae9afe8f523"
 :expected-groups ("publication-tools" "original-CI-attempt1" "CI-helper-R1" "CI-helper-R2" "CI-helper-R1-failure" "CI-helper-R2-negative-reference" "F2-full-outer" "F2-full-inner" "F2-full-cache" "F2-reader-fixtures" "F2-snapshot-fixtures" "F2-spike-aggregate" "F2-native-semantic-audit" "F2-semantic-output" "SPK-01-whole-cache" "SPK-02-whole-cache" "SPK-03-whole-cache" "SPK-04-whole-cache" "SPK-05-whole-cache" "SPK-06-whole-cache" "SPK-07-whole-cache" "SPK-08-whole-cache" "SPK-09-whole-cache" "SPK-10-whole-cache")
 :expected-processes (
  ("CI-helper-R1-failure" :failed 1 :stable)
  ("CI-helper-R2-negative-reference" :failed 1 :stable)
  ("F2-full-outer" :ok 0 :stable)
  ("F2-full-inner" :ok 0 :stable)
  ("F2-native-semantic-audit" :ok 0 :stable)
 )
 :required-fasl-groups ("F2-full-cache")
 :native-reports (("raw/F2-semantic-output/full-F2-audit.lisp" :cbor-interleaving-functional-native-audit :ok)
                  ("raw/CI-helper-R2/native-reference-audit.lisp" :get-source-lifetime-ci-audit :failed))
 :limits (:original-CI-failure-unqualified-for-F2 :historical-helper-failures-not-reclassified
          :F2-semantic-results-qualified-separately :complete-private-cache-and-SPK-whole-cache-bytes
          :no-earlier-scope-promotion :no-CI-pass-claim :no-performance-or-mcdc-or-C1-claim))
