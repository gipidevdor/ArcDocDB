(:schema-version 1 :kind :local-static-reading :date "2026-10-15"
 :author :implementing-agent :independent nil :qualification nil
 :scope ("src/recovery-closed/resolve.lisp" "src/recovery-closed/publication.lisp" "src/recovery-closed/types.lisp")
 :observations ((:resolution "Solo OUTCOME e chiusura EDIT; entrambe presenti devono concordare. Zero distinto dall'assenza.")
                (:counts "Ogni prepared in una sola classe: locale, solo EDIT oppure abort; prove orfane non creano commit.")
                (:coverage "Stesso oggetto CONTROL, membership, unicità ID e count esatto; budget prima della tabella seen.")
                (:publication "Controllo insieme prima del claim, poi publisher ACTIVE canonico; nessun secondo gettone.")
                (:limits "Namespace/catalogo stabili restano precondizioni; nessuna ammissione traffico o prova di salute futura."))
 :open (:functional-cases :allocation-measurement :throughput :independent-review :new-api-c1))
