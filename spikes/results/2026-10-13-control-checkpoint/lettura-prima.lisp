(:schema-version 1 :kind :local-static-reading :date "2026-10-13"
 :independent-review nil :qualification nil
 :source-paths ("src/control/package.lisp" "src/control/types.lisp" "src/control/dependency.lisp"
                "src/control/build.lisp" "src/control/preflight.lisp" "src/control/transfer.lisp"
                "src/control/prepare.lisp" "src/io/identity.lisp")
 :observations
 ((:id :authority :finding "Nuovo ACTIVE preparato, ancora header-only, identifica Serie/versione/segmento. Payload completo da fonte autorevole; manifest verificato prima dell'I/O. Non prova inventario o allocatore.")
  (:id :durability :finding "SEAL costruito con durable storico zero. Nuovo temporaneo O_EXCL; file scritto/flush/riletto uguale e parent sincronizzato. La rinomina autorevole del recovery non è eseguita.")
  (:id :physical-files :finding "Readonly e append associati; controllo separato device/inode impedisce di scrivere sul file ACTIVE. Backend uguali prima di fstat; callback/namespace/parent fidati sono precondizioni.")
  (:id :failure :finding "Guasti dei codec/recovery/I/O propagati senza handler generico, retry, close, rollback o risultato parziale; risorse restano al caller. Dopo progresso append non è nuovamente inizializzabile."))
 :open (:functional-qualification :fault-injection :concurrency-stress :independent-review :c1))
