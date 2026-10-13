(:schema-version 1 :kind :local-static-reading :date "2026-10-13"
 :qualification nil :independent-review nil
 :source-paths ("src/control/publication.lisp" "src/control/types.lisp" "src/io/types.lisp"
                "src/io/namespace.lisp" "src/io/native-namespace.lisp" "arcdocdb.asd")
 :observations
 ((:id :lease :finding "Wrapper privato unico allocato prima dell'I/O. UNWIND-PROTECT prima del CAS owner NIL->wrapper; cleanup riconosce il proprio owner anche su uscita tra CAS e aggiornamento stato. Perdente non altera vincitore.")
  (:id :resources :finding "Directory/end conservati dal preparatore. FD vecchi e nuovi restano del caller, nessun nuovo FD aperto; risultato non trattiene il vecchio file o nuovi buffer. Ciclo owner/wrapper è gestito dal GC.")
  (:id :bounds :finding "Sei osservazioni di identità, una renameat e un fsync. Foglie copiate e iterate per lunghezza nota, namespace esclusivo durante tutte le osservazioni. Nessun CSN/clock/lock globale.")
  (:id :snapshots :finding "Osservatori di stato per proprietario o dopo join, non snapshot concorrente né permesso di ritentare. Campo :published prima di complete resta sicuro: un'uscita intermedia marca FAULTED conservativamente."))
 :open (:allocation-measurement :latency-measurement :concurrency-stress :fault-injection
        :independent-review :c1))
