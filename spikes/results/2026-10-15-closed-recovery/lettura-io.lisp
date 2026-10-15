(:schema-version 1 :kind :local-static-reading :date "2026-10-15"
 :author :implementing-agent :independent nil :qualification nil
 :source-before "7ac016c4" :scope ("src/recovery-closed/read.lisp")
 :observations ((:rule "COD-25: la chiamata I/O precede il controllo puro del suo ritorno.")
                (:order "Header letto una volta prima del corpo; corpo solo fino a P.")
                (:compatibility "Stesse API, condizioni, frontiere e ordine degli effetti."))
 :limits (:static-inspection-only :no-functional-execution :dedicated-cases-open))
