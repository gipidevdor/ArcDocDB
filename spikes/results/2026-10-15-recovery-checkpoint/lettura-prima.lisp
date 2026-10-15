(:schema-version 1 :kind :local-static-reading :date "2026-10-15"
 :author :implementing-agent :independent nil :qualification nil
 :scope ("src/recovery-checkpoint/preflight.lisp" "src/recovery-checkpoint/order.lisp")
 :observations ((:authority "Manifest dal CONTROL trattenuto, stessa vista del nuovo ACTIVE e FD aperti; ID dal suo header.")
                (:ids "High-water disponibile, ID non riusato, next-id u64 prima di array; nessuna riserva implicita.")
                (:budgets "1+C+R menzioni, esiti, payload/versione e array cumulativi autorizzati prima della codifica.")
                (:ordering "Copie u64 delle sole chiavi, incluso zero; verifica di cardinalità e ordine stretto.")
                (:limits "SORT e builder CONTROL esclusi dal budget degli array propri; nessuna promessa RSS o heap zero."))
 :open (:functional-cases :fault-injection :independent-review :new-api-c1))
