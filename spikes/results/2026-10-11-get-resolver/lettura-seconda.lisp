(:schema-version 1 :kind :local-static-reading :date "2026-10-11"
 :reading :budgets-and-performance :independent-review nil :qualification nil
 :source-paths ("src/get-resolver/types.lisp" "src/get-resolver/scan.lisp"
                "src/get-resolver/sort.lisp" "src/get-resolver/build.lisp" "src/get-resolver/read.lisp")
 :observations
 ((:id :packed :finding "Sei u32 per PUT, nessun oggetto per riga. Prove e source buffer non rimangono nella mappa. Payload permanente 24P; header Lisp, FD e GC esclusi.")
  (:id :peak :finding "Preflight prima degli array: 24P+20O, altri 20O+1024 per radix se O>=2. Il buffer source è preesistente e da contabilizzare nel controller; scratch può restare nel GC.")
  (:id :body-cost-fix :finding "Dopo verifica integrale del prefisso si ricontrollano solo gli header nel buffer esclusivo stabile. CRC body OUTCOME ricontrollato alla copia; GET rilegge la prova fisica.")
  (:id :bounds :finding "Scansioni limitate dai byte; radix otto passate su O e 256 bucket. Binary su cardinalità u32 con 33 passi; nessun retry illimitato o lookup condiviso in scrittura.")
  (:id :hot :finding "Resolver legge array u32 e candidato u64 in due word, restituisce capacità/scalari. Nessun I/O, lock o allocazione esplicita sul solo resolver; misura reale delle allocazioni ancora assente.")
  (:id :errors :finding "Ordine GET rifiutato prima del cleanup; invarianti terminali nel contesto, unwind libera EBR. Il driver resta responsabile del fault della Serie e della consegna solo dopo conclusione."))
 :changes (:separate-candidate-word-checks-to-bound-decision-complexity
           :skip-proof-copy-traversal-when-outcome-count-is-zero)
 :open (:allocation-measurement :construction-cost :lookup-latency :memory-pressure
        :condition-coverage :concurrent-reclaim :independent-review :c1-qualification))
