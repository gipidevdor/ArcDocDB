(:schema-version 1 :kind :local-static-reading :date "2026-10-15"
 :author :implementing-agent :independent nil :qualification nil
 :scope ("src/recovery-archive/read.lisp" "src/recovery-archive/build.lisp")
 :observations ((:authority "UUID dal controller, tutti i byte copiati; header dal medesimo FD prima del corpo.")
                (:eof "EOF fisico attestato resta precondizione; scanner riceve file-size=size e versione effettiva.")
                (:bounds "Preflight byte/range/trasferimento e budget scanner/replay prima di I/O; loop corpo limitato.")
                (:failure "Condizioni originali propagate; nessun fallback, scrittura, risultato parziale o troncatura."))
 :open (:functional-cases :fault-injection :independent-review :new-api-c1))
