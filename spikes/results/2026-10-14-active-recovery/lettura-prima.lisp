(:schema-version 1 :kind :local-static-reading :date "2026-10-14"
 :qualification nil :independent-review nil
 :source-paths ("src/recovery-active/read.lisp" "src/recovery-active/frames.lisp"
                "src/recovery-active/resolve.lisp" "src/recovery-active/build.lisp")
 :observations
 ((:id :authority :finding "Control log dal catalogo fornisce ID/view canonici. File readonly fisicamente distinto, header dallo stesso FD verifica tutti i bit di ID e Serie. EOF e tabella completa del giusto Archivio sono precondizioni esplicite, non dedotte dalla lunghezza dello scratch o dal tipo decision-table.")
  (:id :prefix :finding "Origine writer rifiutata prima del corpo. Scanner dell'intero EOF prima della semantica; body CRC non ripetuto nel passaggio header-only sul buffer esclusivo. Coda ignorata senza troncatura; testimone durevole e budget non diventano successo parziale.")
  (:id :atomic-prepare :finding "TXID prepared associato a un solo lotto, PUT e TOMBSTONE entrambi inclusi. Prepared dopo OUTCOME rifiutato. OUTCOME identici coalescono, differenti rifiutati; outcome senza prepared non crea effetti da solo.")
  (:id :resolution :finding "OUTCOME ha effetto locale anche se DECISION dimenticata. Ogni DECISION presente deve contenere la Serie e concordare col CSN locale. Solo DECISION senza OUTCOME produce esito da EDIT; mancanza di entrambe presumed abort solo con tabella autorevole completa.")
  (:id :failure :finding "Nessun handler generico o retry. Workspace parziale mai esportato dopo errore; tutte le capacità restano del caller, che fa fail-stop/quarantena. Nessun CSN, root o ammissione traffico."))
 :open (:functional-qualification :fault-injection :archive-bound-decision-reader :physical-eof-attestation
        :namespace-exclusivity :closed-inventory :recovery-integration :independent-review :c1))
