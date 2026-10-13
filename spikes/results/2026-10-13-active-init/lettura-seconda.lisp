(:schema-version 1 :kind :local-static-reading :date "2026-10-13"
 :reading :bounded-cost-and-resources :independent-review nil :qualification nil
 :source-paths ("src/active/types.lisp" "src/active/preflight.lisp" "src/active/prepare.lisp"
                "src/active/source.lisp" "arcdocdb.asd")
 :observations
 ((:id :bounded :finding "Costi sul solo header: due fstat, un append/read da 64 byte con short I/O limitato, due flush, confronto di 64 byte. Nessuna scansione di lotti, CSN o file completo.")
  (:id :ownership :finding "Due buffer caller distinti; wrapper/log/capacità non trattengono header o scratch. Riferimenti read-only e copier nil. Namespace, parent e controller unico per log restano precondizioni.")
  (:id :representation :finding "ID segmento limitato a positivo u32 dal percorso ACTIVE esistente; created-at u64 caller, nessun clock. Nessuna modifica a layout persistenti o limiti dei documenti.")
  (:id :execution :finding "Effetti eseguiti dal pool I/O con primitive io. Adattatore del writer legge riferimenti immutabili e conserva factory esistente; nessuna syscall/nuova scrittura condivisa per documento.")
  (:id :reentry :finding "Preflight richiede append a zero. Dopo progresso o flush, una seconda inizializzazione rifiuta il file avanzato; write/flush falliti restano faulted. Nessun tentativo di riscrivere o troncare."))
 :open (:allocation-measurement :latency-measurement :fault-injection :thread-stress
        :parent-provenance :catalog-uniqueness :independent-review :c1-qualification))
