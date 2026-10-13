(:schema-version 1 :kind :archive-audit-contract
 :source-commit "ae4022fb66914c53a8f9fba69298e88ce2a35d98"
 :collection-protocol :all-4-groups-immutable-before-collection
 :expected-groups
 ("publication-plan" "publication-audit" "collection-command" "archive-audit-command")
 :expected-processes
 (("collection-command" :ok 0 :stable)
  ("archive-audit-command" :ok 0 :stable))
 :required-fasl-groups nil
 :native-reports
 (("raw/publication-audit/archive-audit-R1.lisp" :independent-active-archive-audit :ok)))
