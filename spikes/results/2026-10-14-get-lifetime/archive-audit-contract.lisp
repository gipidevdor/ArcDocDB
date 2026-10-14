(:schema-version 1 :kind :archive-audit-contract :source-commit "a9e405113b0386afadf4a291a6f64fc82308ea1a"
 :expected-groups ("verification-inputs" "verification-runtime" "ci-audit-code" "scope-fasl" "core-R1-fasl" "core-R2-fasl" "scope" "core-R1-outer" "core-R1-inner" "core-R2-outer" "core-R2-inner" "git-count" "native-audit" "reader-fixtures" "snapshot-fixtures" "spike-check" "SPK-01" "SPK-02" "SPK-03" "SPK-04" "SPK-05" "SPK-06" "SPK-07" "SPK-08" "SPK-09" "SPK-10")
 :expected-processes (
 ("scope" :ok 0 :stable)
 ("core-R1-outer" :failed 2 :stable)
 ("core-R1-inner" :failed 2 :stable)
 ("core-R2-outer" :ok 0 :stable)
 ("core-R2-inner" :ok 0 :stable)
 ("git-count" :ok 0 :stable)
 ("native-audit" :ok 0 :stable)
)
 :required-fasl-groups ("scope-fasl" "core-R1-fasl" "core-R2-fasl")
 :native-reports nil
 :limits (:failed-R1-preserved :no-performance-or-mcdc-claim :CI-helper-code-provenance-only :semantic-results-qualified-separately))
