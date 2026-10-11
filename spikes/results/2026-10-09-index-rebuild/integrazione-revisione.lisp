(:schema-version 1 :kind :static-integration-review :status :ok
 :reviewer "Russell" :agent-id "01a12a77-73b3-7a60-9b34-dcd82dac8762"
 :merge "e409040949e39f1f030c545931f6fddfa26b66a9"
 :checked-source "c7e53fee76993f2058d67c5b6dbf5036c236ef1d"
 :parents ("6892d6b" "5768e02") :blocking-findings nil
 :checks
 ((:id :index-registration :status :ok :file "arcdocdb.asd" :line 128
   :observation "Sette file index e i runner slot/primary registrati; rebuild confluisce nel registro primary.")
  (:id :cbor-registration :status :ok :file "arcdocdb.asd" :line 95
   :observation "Supporto, suite e thread scanner caricati dopo le dipendenze; runner a riga 139.")
  (:id :source-integration :status :ok
   :observation "src/codec identico a 5768e02; src/index identico a 6892d6b.")
  (:id :copy-publication :status :ok :file "src/index/rebuild-copy.lisp" :line 38
   :observation "Confronto payload esclude solo offset arena; verifica precede il piano, senza pubblicazione implicita."))
 :limits (:static-review :no-tests-executed :no-edits
          :exclusive-writer-caller-contract :trusted-digests-caller-contract
          :retired-root-lifecycle-caller-contract :payload-budget-not-rss))
