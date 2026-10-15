(:schema-version 1 :kind :local-static-reading :date "2026-10-15"
 :author :implementing-agent :independent nil :qualification nil
 :scope ("src/recovery-closed/read.lisp" "src/recovery-closed/verify.lisp" "src/recovery-closed/build.lisp")
 :observations ((:authority "P e stato dal CONTROL canonico, header dallo stesso FD con UUID/ID completi, incluso zero.")
                (:boundary "Nessuna ipotesi EOF, scanner TAIL o lettura oltre P; writer richiede lotti interi esatti.")
                (:budgets "Capacità, alias, backend, range e configurazione prima di I/O; record prima del workspace.")
                (:compaction "Verificatore integrale canonico, sole cornici ordinarie e header riverificato in memoria.")
                (:ownership "Scratch esclusivo, risultato senza buffer/workspace e dipendenze aperte al ritorno."))
 :open (:functional-cases :fault-injection :independent-review :new-api-c1))
