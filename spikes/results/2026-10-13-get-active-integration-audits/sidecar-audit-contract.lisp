(:schema-version 1 :kind :archive-audit-contract
 :source-commit "e8c88a4cdc697422eb05b0c6a7f79d0ec9480e26"
 :collection-protocol :all-three-source-groups-immutable-before-collection
 :expected-groups
 ("publication-audit" "archive-audit-command" "archive-collector-command")
 :expected-processes
 (("archive-audit-command" :ok 0 :stable)
  ("archive-collector-command" :ok 0 :stable))
 :required-fasl-groups ()
 :native-reports
 (("raw/publication-audit/integration-archive-audit-R1.lisp"
   :independent-active-archive-audit :ok)))
