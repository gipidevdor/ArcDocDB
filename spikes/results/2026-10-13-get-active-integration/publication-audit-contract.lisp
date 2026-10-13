(:schema-version 1
 :kind :archive-audit-contract
 :source-commit "e8c88a4cdc697422eb05b0c6a7f79d0ec9480e26"
 :collection-protocol :all-22-groups-immutable-before-collection
 :expected-groups
 ("core-wrapper" "core-native" "coverage-active-command" "coverage-closed-command"
  "usage-duplicate-suite" "core-compiler-fasl" "coverage-active" "coverage-closed"
  "snapshot-process-fixtures" "reader-process-fixtures" "spikes-native"
  "SPK-01" "SPK-02" "SPK-03" "SPK-04" "SPK-05" "SPK-06" "SPK-07" "SPK-08" "SPK-09" "SPK-10"
  "active-integration-audit")
 :expected-processes
 (("core-wrapper" :ok 0 :stable)
  ("core-native" :ok 0 :stable)
  ("coverage-active-command" :ok 0 :stable)
  ("coverage-closed-command" :ok 0 :stable)
  ("usage-duplicate-suite" :failed 1 :stable))
 :required-fasl-groups
 ("core-compiler-fasl" "coverage-active" "coverage-closed"
  "SPK-01" "SPK-02" "SPK-03" "SPK-04" "SPK-05" "SPK-06" "SPK-07" "SPK-08" "SPK-09" "SPK-10")
 :native-reports
 (("raw/coverage-active/coverage-summary.lisp" :get-resolver-coverage :ok)
  ("raw/coverage-closed/coverage-summary.lisp" :get-resolver-coverage :ok)
  ("raw/snapshot-process-fixtures/report.lisp" :snapshot-process-self-test :passed)
  ("raw/reader-process-fixtures/report.lisp" :reader-process-self-test :passed)
  ("raw/spikes-native/report.lisp" nil :complete)
  ("raw/active-integration-audit/full-audit-R1.lisp" :get-active-local-independent-audit :ok)
  ("raw/active-integration-audit/fixtures-audit-R1.lisp" :get-active-local-fixture-independent-audit :ok)))
