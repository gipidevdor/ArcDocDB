(:schema-version 1 :kind :local-static-reading :date "2026-10-14"
 :qualification nil :independent-review nil
 :source-paths ("src/recovery-active/types.lisp" "src/recovery-active/query.lisp"
                "src/recovery-active/closure.lisp" "src/recovery-active/publication.lisp"
                "src/recovery-active/resolve.lisp")
 :observations
 ((:id :ownership :finding "Risultato immutabile senza copier, lega control e segmento canonici. Non trattiene buffer, workspace o decision-table. Due array u64 privati, nessuna tabella/array pubblico o FD numerico. FD resta aperto a carico del controller fino a reclaim.")
  (:id :budgets :finding "Preflight prima delle syscall e della mutazione dello scratch. Prepared limitati come TXID distinti, outcomes come occorrenze fisiche, frame/record limitati prima di workspace. Entry oltre codec rifiutata prima degli array; budget dell'EDIT intero rimane nel preparatore esistente.")
  (:id :packing :finding "Packing da hash privata in TXID ordinati unici e CSN corrispondenti; u64 completo e zero presente. Serializer verifica alias UUID, forma e range prima del primo byte. Query binaria limitata a integer-length(N), assenza non equivale ad abort.")
  (:id :publication :finding "Checkpoint chiude vecchio ID esattamente a P e con stessa cardinalità/esiti derivati. Vecchio FD aperto; controlli prima del claim. Delega conservazione e publisher canonici, nessun secondo gettone o nuovo punto atomico.")
  (:id :cost :finding "2 identity, header e CEILING((size-64)/chunk) trasferimenti, un passaggio CRC e semantica solo header. Risoluzione per TXID e query decisioni binarie. Allocazioni/boxing/ordinamento cold; payload risultato 16*E non RSS, nessuna misura di prestazione."))
 :open (:functional-qualification :fault-injection :allocation-and-latency-measurements
        :checkpoint-builder :primary-index-and-csn-restoration :recovery-admission :independent-review :c1))
