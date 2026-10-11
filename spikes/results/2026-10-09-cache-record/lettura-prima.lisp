(:schema-version 1 :kind :local-static-reading :date "2026-10-11"
 :reading :copy-verification-and-input :independent-review nil :qualification nil
 :source-paths ("src/cache/read.lisp" "src/cache/write.lisp" "src/foundation/record.lisp")
 :observations
 ((:id :bounded-copy :finding "Otto tag e un tentativo seqlock; lunghezza della copia dalla richiesta verificata, non da metadata arbitrari.")
  (:id :private-result :finding "Range valore esposto solo dopo copia coerente, CRC e confronto dell'identità attesa; miss può sporcare scratch ed è esplicitamente da scartare.")
  (:id :verification :finding "PUT ordinario confronta entrambe le parole CSN; prepared confronta TXID e CSN in OUTCOME autorevole. API u64 precedente delega allo stesso verificatore.")
  (:id :failure-origin :finding "Solo corruption-detected della copia in cache diventa verify-failed; input dal segmento propaga la condizione, mai un allarme di disco deciso dalla cache.")
  (:id :input-alias-fix :finding "Rimosso il divieto eccessivo di PUT/OUTCOME nello stesso buffer input stabile. Il divieto di alias con prova/chiave resta per la destinazione modificata dalla ricerca.")
  (:id :conservative-discard :finding "Bit di rifiuto può scartare una generazione nuova concorrente, con solo miss aggiuntivo; ogni hit verifica comunque il contenuto.")
  (:id :hot-csn :finding "Il nuovo confine passa due u32, senza costruire CSN u64. Nessuna misura di allocazione eseguita."))
 :open (:functional-cases :differential-cache-off :concurrent-interleavings :fault-injection
        :allocation-measurements :independent-review :integrated-get :c1-qualification))
