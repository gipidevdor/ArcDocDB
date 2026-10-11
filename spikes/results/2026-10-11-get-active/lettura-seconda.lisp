(:schema-version 1 :kind :local-static-reading :date "2026-10-11"
 :reading :work-memory-and-lifetime :independent-review nil :qualification nil
 :source-paths ("src/get-resolver/active-types.lisp" "src/get-resolver/active-directory.lisp"
                "src/get-resolver/active-build.lisp" "src/get-resolver/active-read.lisp")
 :observations
 ((:id :persistent :finding "Quattro cifre u16, quattro vettori clonati per append. I vecchi PUT non vengono copiati. Le root non conservano la root precedente né lotto/evento riusabili.")
  (:id :memory :finding "Una riga privata per PUT ordinario, sei u32. Vista completa: 4369 nodi, 559232 byte di riferimenti su runtime 64 bit. Picco precedente + delta righe + 512 prima degli array. Non è un limite RSS.")
  (:id :bounds :finding "Scansioni limitate dal count verificato e byte configurati; ricorsione quattro livelli; ricerca pagina 17 confronti, ricerca riga comune 33. Convergenza ricontrollata dopo il diciassettesimo confronto per N=65536.")
  (:id :lifetime :finding "Directory/pagine/righe sono private e immutabili. Il controller protegge FD e radici fino al reclaim EBR, nuovo ingresso/acquisizione dopo migrazione. GC non autorizza chiusura FD.")
  (:id :hot :finding "Lookup/sonda non contengono I/O, mutex, contatore condiviso, scrittura alla directory o allocazione esplicita. Sono richieste misure reali per COD-30 e prestazioni.")
  (:id :limits :finding "Source solo da nuovo ACTIVE/controller root NIL. Rotazione, directory Serie, indice concreto e backlog complessivo restano da integrare. Nessuna qualifica del motore dedotta dalla compilazione."))
 :open (:heap-measurements :x86-disassembly :latency-and-throughput :condition-coverage
        :controller-backlog-budget :rotation :directory-publication :reclaim :independent-review :c1-qualification))
