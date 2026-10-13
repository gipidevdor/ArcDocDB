(:schema-version 1 :kind :archive-audit-contract
 :source-commit "ae4022fb66914c53a8f9fba69298e88ce2a35d98"
 :collection-protocol :all-20-groups-immutable-before-collection
 :expected-groups
 ("core-outer" "core-inner" "core-compiler-fasl" "core-console"
  "reader-process-fixtures" "snapshot-process-fixtures" "spikes-native"
  "SPK-01" "SPK-02" "SPK-03" "SPK-04" "SPK-05" "SPK-06" "SPK-07"
  "SPK-08" "SPK-09" "SPK-10" "local-audit"
  "local-audit-R1-command" "local-audit-R2-command")
 :expected-processes
 (("core-outer" :ok 0 :stable)
  ("core-inner" :ok 0 :stable)
  ("local-audit-R1-command" :ok 0 :stable)
  ("local-audit-R2-command" :ok 0 :stable))
 :required-fasl-groups
 ("core-compiler-fasl" "SPK-01" "SPK-02" "SPK-03" "SPK-04" "SPK-05"
  "SPK-06" "SPK-07" "SPK-08" "SPK-09" "SPK-10")
 :native-reports
 (("raw/reader-process-fixtures/report.lisp" :reader-process-self-test :passed)
  ("raw/snapshot-process-fixtures/report.lisp" :snapshot-process-self-test :passed)
  ("raw/spikes-native/report.lisp" nil :complete)))
