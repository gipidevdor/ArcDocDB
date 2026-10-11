(:schema-version 1 :kind :local-static-reading :date "2026-10-11"
 :reading :archive-binding-budgets-and-generated-code :independent-review nil :qualification nil
 :source-paths ("src/get/types.lisp" "src/get/build.lisp" "src/get/lookup.lisp"
                "src/get/lifecycle.lisp" "src/get/segment.lisp")
 :observations
 ((:id :archive-binding :finding "Aggiunto ambito canonico readonly con EBR/snapshot. Vista e worker devono condividere la stessa identità prima di acquisire il pin; ID worker selezionato dal registro del medesimo ambito.")
  (:id :key-hash :finding "Integrazione del kernel arrivato da main: GET calcola il digest col seme posseduto dall'indice. Non accetta digest dalla richiesta; nessuna modifica al kernel o ai suoi test.")
  (:id :payload :finding "Buffer fisso B e 152 byte di scratch in sei vettori, preflight prima delle allocazioni. Oggetti, registri, cache e risposta esclusi dal payload dichiarato.")
  (:id :bounded-work :finding "Nessun nuovo loop o mutex nel GET. Lookup usa budget esistente, copia/verifica entro record massimo, prova di 32 byte. I/O esatto delega al modulo I/O e soltanto al suo pool.")
  (:id :proof-offset :finding "Dopo cornice canonica OUTCOME si usano offset costanti del valore. Non si sommano offset arbitrari per leggere la parola alta del CSN.")
  (:id :output-offset :finding "Capienza controllata per sottrazione prima della somma; THE INDEX mantiene i controlli safety 3. Nessun overflow bignum introdotto dall'offset output valido.")
  (:id :arm64 :finding "Nel disassemblato finale dei dodici kernel selezionati non compare ALLOC-TRAMP o coercizione u64 a intero Lisp. Non misura le allocazioni reali né quelle delle funzioni chiamate.")
  (:id :terminal-cleanup :finding "Cleanup marca prima FAULTED, libera EBR e azzera riferimenti/range/word; ripristina IDLE soltanto se non era faulted. Un cleanup interrotto non autorizza riuso.")
  (:id :qualification :finding "Nessuna prova funzionale/concorrente o benchmark del nuovo modulo. Evidenze di altri sottosistemi non qualificano la composizione GET."))
 :open (:independent-review :condition-coverage :real-thread-stress :fault-injection
        :allocation-measurements :x86-64-disassembly :p95-p99 :resolver-and-pools
        :c1-qualification))
