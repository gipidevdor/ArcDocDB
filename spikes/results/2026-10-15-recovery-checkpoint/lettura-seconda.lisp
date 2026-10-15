(:schema-version 1 :kind :local-static-reading :date "2026-10-15"
 :author :implementing-agent :independent nil :qualification nil
 :scope ("src/recovery-checkpoint/sections.lisp" "src/recovery-checkpoint/build.lisp")
 :observations ((:preservation "CLOSED precedenti con tutti gli esiti, REMOVED e chiusura ACTIVE derivata; nessuna mutazione sorgente.")
                (:codecs "Serializer ACTIVE e scrivi-valore-edit canonici; header/EDIT/SEAL e replay dal builder CONTROL esistente.")
                (:postconditions "Transizione conservativa, P, count e ogni coppia derivata controllati sul manifest ricostruito.")
                (:ownership "Solo sezioni private; nessuna destinazione caller o risultato parziale. Fonti ricontrollate al ritorno.")
                (:publication "Stesso checkpoint-control, preparatore e pubblica-control-da-active; nessun nuovo punto atomico."))
 :open (:functional-cases :allocation-measurement :throughput :independent-review :new-api-c1))
