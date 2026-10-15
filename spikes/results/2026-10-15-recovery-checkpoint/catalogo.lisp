(:SCHEMA-VERSION 1 :KIND :EVIDENCE-CATALOG :DATE "2026-10-15" :ENTRIES
 ((:KIND :LOCAL-STATIC-READING :ARTIFACT "lettura-prima.lisp" :VARIANT
   :AUTHORITY-AND-BUDGETS)
  (:KIND :LOCAL-STATIC-READING :ARTIFACT "lettura-seconda.lisp" :VARIANT
   :ENCODING-AND-PUBLICATION)
  (:KIND :STATIC-TRACE-WRITE :ARTIFACT
   #A((22) BASE-CHAR . "matrice-scrittura.lisp") :PROCESS-ARTIFACT
   #A((36) BASE-CHAR . "matrice-scrittura-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :COMPILE-ONLY :ARTIFACT
   #A((25) BASE-CHAR . "compilazione-fallita.lisp") :PROCESS-ARTIFACT
   #A((39) BASE-CHAR . "compilazione-fallita-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-LINT :ARTIFACT #A((19) BASE-CHAR . "stile-iniziale.lisp")
   :PROCESS-ARTIFACT #A((33) BASE-CHAR . "stile-iniziale-conservazione.lisp")
   :VARIANT :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :COMPILE-ONLY :ARTIFACT #A((17) BASE-CHAR . "compilazione.lisp")
   :PROCESS-ARTIFACT #A((31) BASE-CHAR . "compilazione-conservazione.lisp")
   :VARIANT :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-LINT :ARTIFACT #A((10) BASE-CHAR . "stile.lisp")
   :PROCESS-ARTIFACT #A((24) BASE-CHAR . "stile-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-TRACE :ARTIFACT #A((18) BASE-CHAR . "tracciabilita.lisp")
   :PROCESS-ARTIFACT #A((32) BASE-CHAR . "tracciabilita-conservazione.lisp")
   :VARIANT :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-LINKS :ARTIFACT #A((17) BASE-CHAR . "collegamenti.lisp")
   :PROCESS-ARTIFACT #A((31) BASE-CHAR . "collegamenti-conservazione.lisp")
   :VARIANT :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-DISASSEMBLY :ARTIFACT
   #A((18) BASE-CHAR . "disassemblato.lisp") :PROCESS-ARTIFACT
   #A((32) BASE-CHAR . "disassemblato-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :SOURCE-SUPPORT :ARTIFACT "raccolta-sorgente.lisp" :VARIANT
   :VERBATIM-SOURCE-TEXT)
  (:KIND :SOURCE-SUPPORT :ARTIFACT "compilazione-sorgente.lisp" :VARIANT
   :VERBATIM-SOURCE-TEXT)
  (:KIND :SOURCE-SUPPORT :ARTIFACT "disassemblato-sorgente.lisp" :VARIANT
   :VERBATIM-SOURCE-TEXT)
  (:KIND :BYTE-RETENTION-AUDIT :ARTIFACT "audit-integrazione-byte.lisp"
   :VARIANT :ORIGINAL-BYTE-COMPARISON)
  (:KIND :SOURCE-SUPPORT :ARTIFACT "audit-integrazione-sorgente.lisp" :VARIANT
   :VERBATIM-SOURCE-TEXT)
  (:KIND :STATIC-EVIDENCE :ARTIFACT #A((13) BASE-CHAR . "evidenze.lisp")
   :PROCESS-ARTIFACT #A((27) BASE-CHAR . "evidenze-conservazione.lisp")
   :VARIANT :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :BYTE-RETENTION-AUDIT :ARTIFACT "audit-finale-byte.lisp" :VARIANT
   :ORIGINAL-BYTE-COMPARISON)
  (:KIND :SOURCE-SUPPORT :ARTIFACT "audit-finale-sorgente.lisp" :VARIANT
   :VERBATIM-SOURCE-TEXT)
  (:KIND :COMPILE-ONLY :ARTIFACT
   #A((27) BASE-CHAR . "compilazione-integrata.lisp") :PROCESS-ARTIFACT
   #A((41) BASE-CHAR . "compilazione-integrata-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-LINT :ARTIFACT #A((20) BASE-CHAR . "stile-integrato.lisp")
   :PROCESS-ARTIFACT #A((34) BASE-CHAR . "stile-integrato-conservazione.lisp")
   :VARIANT :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-TRACE :ARTIFACT
   #A((28) BASE-CHAR . "tracciabilita-integrata.lisp") :PROCESS-ARTIFACT
   #A((42) BASE-CHAR . "tracciabilita-integrata-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-LINKS :ARTIFACT
   #A((27) BASE-CHAR . "collegamenti-integrati.lisp") :PROCESS-ARTIFACT
   #A((41) BASE-CHAR . "collegamenti-integrati-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :BYTE-RETENTION-AUDIT :ARTIFACT "audit-merge-byte.lisp" :VARIANT
   :ORIGINAL-BYTE-COMPARISON)
  (:KIND :SOURCE-SUPPORT :ARTIFACT "audit-merge-sorgente.lisp" :VARIANT
   :VERBATIM-SOURCE-TEXT)))
