(:schema-version 1
 :kind :archive-audit-contract
 :source-commit "42dcad77530c09784f9d77fabb92ff4477927983"
 :expected-groups
 ("core-R1-wrapper-failed" "core-R1-native-failed" "core-R2-wrapper" "core-R2-native"
  "coverage-active-command" "coverage-closed-command"
  "usage-unknown-suite" "usage-duplicate-suite" "usage-duplicate-report"
  "core-compiler-fasl" "coverage-active" "coverage-closed"
  "snapshot-process-fixtures" "reader-process-fixtures" "spikes-native"
  "SPK-01" "SPK-02" "SPK-03" "SPK-04" "SPK-05" "SPK-06" "SPK-07" "SPK-08" "SPK-09" "SPK-10"
  "active-local-audit")
 :expected-processes
 (("core-R1-wrapper-failed" :failed 2 :stable)
  ("core-R1-native-failed" :failed 2 :stable)
  ("core-R2-wrapper" :ok 0 :stable)
  ("core-R2-native" :ok 0 :stable)
  ("coverage-active-command" :ok 0 :stable)
  ("coverage-closed-command" :ok 0 :stable)
  ("usage-unknown-suite" :failed 1 :stable)
  ("usage-duplicate-suite" :failed 1 :stable)
  ("usage-duplicate-report" :failed 1 :stable))
 :required-fasl-groups
 ("core-compiler-fasl" "coverage-active" "coverage-closed"
  "SPK-01" "SPK-02" "SPK-03" "SPK-04" "SPK-05" "SPK-06" "SPK-07" "SPK-08" "SPK-09" "SPK-10")
 :native-reports
 (("raw/coverage-active/coverage-summary.lisp" :get-resolver-coverage :ok)
  ("raw/coverage-closed/coverage-summary.lisp" :get-resolver-coverage :ok)
  ("raw/snapshot-process-fixtures/report.lisp" :snapshot-process-self-test :passed)
  ("raw/reader-process-fixtures/report.lisp" :reader-process-self-test :passed)
  ("raw/spikes-native/report.lisp" nil :complete)
  ("raw/active-local-audit/full-audit-R1.lisp" :get-active-local-independent-audit :failed)
  ("raw/active-local-audit/full-audit-R2.lisp" :get-active-local-independent-audit :ok)
  ("raw/active-local-audit/initial-core-failure-audit-R2.lisp" :get-active-initial-failure-independent-audit :ok)
  ("raw/active-local-audit/fixtures-audit-R1.lisp" :get-active-local-fixture-independent-audit :ok)))
