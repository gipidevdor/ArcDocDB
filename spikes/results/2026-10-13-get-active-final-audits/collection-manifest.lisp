(:schema-version 1 :kind :get-active-final-audit-sidecar-plan
 :freeze "ae4022fb66914c53a8f9fba69298e88ce2a35d98"
 :collection-protocol :all-4-groups-immutable-before-collection
 :groups
 (("publication-plan" "spikes/out/active-final-publication/")
  ("publication-audit" "spikes/out/active-final-publication-audit/")
  ("collection-command" "spikes/out/4000915508-command-29897-0/" t)
  ("archive-audit-command" "spikes/out/4000915641-command-34003-0/" t))
 :files
 (("README.md" "spikes/out/active-final-audit-sidecar/README-template.txt")
  ("sidecar-audit-contract.lisp" "spikes/out/active-final-audit-sidecar/contract.lisp")
  ("sidecar-audit-source.txt" "spikes/out/active-final-audit-sidecar/audit.lisp"))
 :limits (:complete-explicit-groups :native-outputs-as-data :no-self-inclusion
          :no-archive-append :no-product-qualification))
