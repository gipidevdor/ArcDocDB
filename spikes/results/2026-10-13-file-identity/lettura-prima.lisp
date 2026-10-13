(:schema-version 1 :kind :local-static-reading :date "2026-10-13"
 :reading :authority-and-lifecycle :independent-review nil :qualification nil
 :source-paths ("src/io/types.lisp" "src/io/identity-types.lisp" "src/io/native.lisp"
                "src/io/identity.lisp" "src/get-resolver/active-build.lisp")
 :observations
 ((:id :domain :finding "Modi e stati controllati prima delle syscall; backend confrontati con EQ. Un backend privo di identity non riceve callback né fallback POSIX.")
  (:id :authority :finding "Fstat sui FD effettivi, tipo regolare e confronto dei due valori completi. Nessun percorso, header, lunghezza o digest usato come identità.")
  (:id :lifetime :finding "Prova lega due capacità immutabili; chiusura terminale invalidante anche dopo riuso del numero FD. Verifica prima della creazione della sorgente ACTIVE, sul file effettivo del log.")
  (:id :failure :finding "Solo syscall-error tradotto preservando errno e operazione identity; nessun retry o handler generico. Mancata prova non muta frontiere/stato né adotta lotti.")
  (:id :compatibility :finding "Le sei posizioni make-backend restano valide. La prova opzionale ACTIVE verifica l'identità; nil mantiene l'obbligo precedente del caller, non lo certifica."))
 :open (:functional-cases :native-platform-cases :condition-coverage :fault-injection
        :fd-reuse :thread-stress :server-adoption :independent-review :c1-qualification))
