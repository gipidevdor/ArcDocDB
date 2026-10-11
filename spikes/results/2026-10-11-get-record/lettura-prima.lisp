(:schema-version 1 :kind :local-static-reading :date "2026-10-11"
 :reading :visibility-integrity-and-lifetime :independent-review nil :qualification nil
 :source-paths ("src/get/lookup.lisp" "src/get/target.lisp" "src/get/segment.lisp"
                "src/get/lifecycle.lisp")
 :observations
 ((:id :visibility :finding "Snapshot usa il CSN catturato dal contesto read. LIVE sopra s e ogni miss primario con snapshot richiedono ricerca storica, mai assenza inventata.")
  (:id :source-binding :finding "Capacità lega vista e file readonly dopo verifica dell'header letto dal medesimo FD. Target deve coincidere col segmento, rispettare frontiera committed e formato.")
  (:id :resolver-boundary :finding "Frontiera committed, flag record e offset OUTCOME restano responsabilità del resolver autorevole. Header, file size e CRC della prova non certificano da soli la pubblicazione del lotto.")
  (:id :prepared :finding "La prova è letta dallo stesso FD, controllata prima della cache; verificatore PUT comune confronta TXID e CSN. Prepared di origine compaction rifiutato.")
  (:id :failure-origin :finding "Cache verify-failed permette rilettura del segmento e richiede allarme; corruzione di OUTCOME/file propaga come sorgente persistente. Non si cattura genericamente error.")
  (:id :completion :finding "Valore copiato solo dopo verifica ma resta provvisorio: conclusione snapshot con tempo fresco dopo copia e cleanup EBR autorizzano il risultato. Ogni unwind invalida output.")
  (:id :migration :finding "Il contesto non espone FD o scratch e deve essere abbandonato prima di accodare originale. Nel pool I/O indice e resolver ripartono sotto una nuova epoca.")
  (:id :range-order-fix :finding "Range verificato non vuoto e presente prima di calcolare la lunghezza dell'output, evitando aritmetica su un range interno incoerente."))
 :open (:functional-cases :condition-coverage :fault-injection :real-thread-stress
        :historical-resolver :segment-controller :independent-review :c1-qualification))
