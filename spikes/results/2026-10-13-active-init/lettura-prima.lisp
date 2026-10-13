(:schema-version 1 :kind :local-static-reading :date "2026-10-13"
 :reading :durable-order-and-authority :independent-review nil :qualification nil
 :source-paths ("src/active/preflight.lisp" "src/active/prepare.lisp"
                "src/active/source.lisp" "src/io/transfer.lisp")
 :observations
 ((:id :preflight :finding "Formato, ID, buffer/alias, budget readonly/append, modi/stati, backend e frontiere zero verificati prima di fstat o modifica dell'header.")
  (:id :binding :finding "Associazione fisica precede header/write. Il parent è una precondizione del controller; il solo inode non prova la directory del nome. Tre capacità dello stesso backend.")
  (:id :durability :finding "Header writer, append esatto, flush file a 64, rilettura con CRC/Serie/ID e confronto completo dei byte, flush directory e ricontrollo finale prima del risultato. L'EDIT decide l'apertura.")
  (:id :source :finding "Adattatore confronta log canonico, registro CSN writer/snapshot e frontiere ancora a 64. Factory ACTIVE riceve la prova obbligatoria; non legge H né pubblica root.")
  (:id :failure :finding "Nessun handler, retry, rollback, close, delete o risultato parziale. Guasti I/O conservano semantica esistente; caller possiede capacità su ogni uscita e deve fare quarantena/cleanup."))
 :open (:functional-cases :native-files :fault-injection :condition-coverage :thread-stress
        :catalog-edit-execution :server-open-rotation :independent-review :c1-qualification))
