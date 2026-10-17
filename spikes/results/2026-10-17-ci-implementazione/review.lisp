(:schema-version 1 :kind :ci-static-review
 :reviewer "Averroes" :scope "archive, producer, github, publish"
 :source-state :working-tree :reviewed-commit NIL :runtime-executed NIL
 :findings
 ((:id :pr-source-anchor :severity :p1
   :finding "Un parent del commit non attesta il merge provato dall'attempt."
   :resolution "Accettati solo SHA esatti dei metadata del run/check suite; nessun checkout del producer.")
  (:id :audit-missing-report :severity :p1
   :finding "Exit zero senza report strutturato poteva certificare completezza."
   :resolution "Report assente rende fallito il controllo; completezza delle metriche verificata separatamente.")
  (:id :reconciliation-cursor :severity :p1
   :finding "Ripartire dalla prima pagina poteva affamare gli attempt oltre il limite."
   :resolution "Cursore persistito per coppia run/attempt, rotazione della finestra e lacune esplicite.")
  (:id :aggregate-budget :severity :p1
   :finding "I budget del singolo job non limitavano la somma del run."
   :resolution "Controlli aggregati su byte persistenti, byte espansi e file; budget espanso decrementato prima dell'espansione successiva."))
 :limits (:static-review-during-integration :resolutions-reported-by-coordinator
          :not-a-runtime-publication-verification))
