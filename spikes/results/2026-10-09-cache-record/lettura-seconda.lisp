(:schema-version 1 :kind :local-static-reading :date "2026-10-11"
 :reading :capacity-concurrency-and-generated-code :independent-review nil :qualification nil
 :source-paths ("src/cache/types.lisp" "src/cache/build.lisp" "src/cache/core.lisp"
                "src/cache/clock.lisp" "src/cache/read.lisp" "src/cache/write.lisp")
 :observations
 ((:id :preallocation :finding "Tutte le classi e il payload sono prevalidati. Costi di metadata e vettori inclusi; header, mutex, garbage e buffer esterni esplicitamente esclusi dal payload.")
  (:id :zero-budget :finding "Nessuna classe attiva produce partizione vuota, payload zero e bypass senza file o coordinamento.")
  (:id :bounded-policy :finding "Ricerca otto tag; inserimento otto tag e sedici visite CLOCK al massimo; mutex con wait-p NIL. Mano sempre entro tre bit.")
  (:id :no-aba :finding "Contatore non resettato e mai oltre 2^62; posto esaurito/interrotto permanentemente disabilitato prima del rilascio mutex.")
  (:id :series-independence :finding "Tutti gli array/lock sono della partizione. Nessuna root, epoca, file o scrittura comune tra Serie; metriche restituite al worker.")
  (:id :approximate-heat :finding "Race su calore, rilettura e rifiuto sono conservative e cambiano solo hit rate o diagnostica, non sostituiscono la verifica dei record.")
  (:id :bounded-types :finding "Indici di posto limitati a 524287 e insieme a 65535; eliminati i rami di overflow/bignum di moltiplicazione nei kernel selezionati della cache.")
  (:id :arm64 :finding "Disassemblato finale: DMB ISHLD sulla copia, DMB ISHST su pubblicazione/cleanup. Nessun ALLOC-TRAMP nei sei kernel cache ispezionati; non è una misura di allocazione né una prova delle funzioni chiamate."))
 :open (:independent-review :real-thread-stress :x86-64-disassembly :allocation-measurements
        :p95-p99 :scan-pollution :get-integration :scheduler-budget :c1-qualification))
