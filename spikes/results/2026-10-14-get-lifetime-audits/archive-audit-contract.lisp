(:schema-version 1 :kind :archive-audit-contract
 :source-commit "a9e405113b0386afadf4a291a6f64fc82308ea1a"
 :expected-groups ("collection-command" "copy-audit-command" "aux-collection-R1" "aux-audit-placement-R1" "link-placement-R1" "copy-audit-output")
 :expected-processes (("collection-command" :ok 0 :stable) ("copy-audit-command" :ok 0 :stable)
                      ("aux-collection-R1" :ok 0 :stable)
                      ("aux-audit-placement-R1" :failed 1 :stable)
                      ("link-placement-R1" :failed 2 :stable))
 :required-fasl-groups nil :native-reports nil)
