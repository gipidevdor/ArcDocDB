(:schema-version 1 :kind :get-active-integration-audit-sidecar-plan
 :freeze "e8c88a4cdc697422eb05b0c6a7f79d0ec9480e26"
 :collection-protocol :all-three-source-groups-immutable-before-collection
 :groups
 (("publication-audit" "spikes/out/active-publication-audit/")
  ("archive-audit-command" "spikes/out/4000913439-command-75858-0/" t)
  ("archive-collector-command" "spikes/out/4000912988-command-63343-0/" t))
 :files
 (("README.md" "spikes/out/active-integration-audit-sidecar/README-template.txt")
  ("sidecar-audit-contract.lisp" "spikes/out/active-integration-audit-sidecar/contract.lisp")
  ("sidecar-audit-source.txt" "spikes/out/active-integration-audit-sidecar/audit.lisp"))
 :limits (:complete-explicit-groups :read-as-data :no-self-inclusion
          :no-product-qualification :no-performance-or-mcdc-claim))
