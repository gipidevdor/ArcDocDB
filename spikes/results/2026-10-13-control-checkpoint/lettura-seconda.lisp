(:schema-version 1 :kind :local-static-reading :date "2026-10-13"
 :independent-review nil :qualification nil
 :source-paths ("src/control/types.lisp" "src/control/build.lisp" "src/control/preflight.lisp"
                "src/control/transfer.lisp" "src/control/prepare.lisp" "arcdocdb.asd")
 :observations
 ((:id :bounds :finding "Payload limitato da metadata e formato record; file P+144. Cicli I/O ceiling(size/chunk), confronto count e short I/O positivi limitati dalle primitive. Chunk positivo prima dell'I/O.")
  (:id :memory :finding "Piano ha byte privati e manifest posseduto. Payload caller copiato; nessun buffer esportato. Risultato preparato non trattiene piano o scratch. Builder WAL intermedio è recuperabile dal GC.")
  (:id :pool :finding "Costruzione e replay semantico senza I/O. Pool I/O trasferisce/confronta blocchi, senza ricostruire il manifest. Scratch min(size,chunk), default chunk64KiB. Nessun percorso per documento modificato.")
  (:id :concurrency :finding "ACTIVE e file temporaneo richiedono proprietà esclusiva fino alla rinomina/adozione. Nessun lock, clock o CSN globale aggiunto; ciascuna Serie possiede i propri piani e file."))
 :open (:allocation-measurement :latency-measurement :throughput-measurement :rss-measurement
        :independent-review :c1))
