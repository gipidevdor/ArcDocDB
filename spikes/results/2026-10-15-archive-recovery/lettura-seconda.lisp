(:schema-version 1 :kind :local-static-reading :date "2026-10-15"
 :author :implementing-agent :independent nil :qualification nil
 :scope ("src/recovery-archive/types.lisp" "src/recovery-archive/query.lisp" "src/recovery-archive/active.lisp")
 :observations ((:ownership "UUID e tabella posseduti; nessuno scratch, array, FD numerico o tabella grezza esportati.")
                (:binding "EQ dell'ambito canonico prima dell'I/O ACTIVE; bootstrap corretto resta precondizione.")
                (:lifetime "Decision FD aperto prima e dopo la delega; controller congela file/namespace e conserva ownership.")
                (:compatibility "Vecchio ingresso invariato; budget inoltrati, nessuna nuova semantica prepared/CSN.")
                (:performance "Apertura con allocazioni bounded; query delegate, nessun nuovo lock o scrittura condivisa."))
 :open (:functional-cases :allocation-measurement :throughput :independent-review :new-api-c1))
