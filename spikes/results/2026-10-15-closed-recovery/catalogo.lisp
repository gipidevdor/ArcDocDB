(:SCHEMA-VERSION 1 :KIND :EVIDENCE-CATALOG :DATE "2026-10-15" :ENTRIES
 ((:KIND :LOCAL-STATIC-READING :ARTIFACT "lettura-prima.lisp" :VARIANT
   :AUTHORITY-AND-BOUNDARIES)
  (:KIND :LOCAL-STATIC-READING :ARTIFACT "lettura-seconda.lisp" :VARIANT
   :RESOLUTION-AND-PUBLICATION)
  (:KIND :LOCAL-STATIC-READING :ARTIFACT "finding-budget.lisp" :VARIANT
   :COMMON-PREFLIGHT-UPPER-BOUND)
  (:KIND :STATIC-TRACE-WRITE :ARTIFACT
   #A((22) BASE-CHAR . "matrice-scrittura.lisp") :PROCESS-ARTIFACT
   #A((36) BASE-CHAR . "matrice-scrittura-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :COMPILE-ONLY :ARTIFACT
   #A((26) BASE-CHAR . "compilazione-iniziale.lisp") :PROCESS-ARTIFACT
   #A((40) BASE-CHAR . "compilazione-iniziale-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-LINT :ARTIFACT #A((19) BASE-CHAR . "stile-iniziale.lisp")
   :PROCESS-ARTIFACT #A((33) BASE-CHAR . "stile-iniziale-conservazione.lisp")
   :VARIANT :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-LINKS :ARTIFACT
   #A((26) BASE-CHAR . "collegamenti-iniziali.lisp") :PROCESS-ARTIFACT
   #A((40) BASE-CHAR . "collegamenti-iniziali-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
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
  (:KIND :BYTE-RETENTION-AUDIT :ARTIFACT "audit-iniziale-byte.lisp" :VARIANT
   :ORIGINAL-BYTE-COMPARISON)
  (:KIND :SOURCE-SUPPORT :ARTIFACT "audit-iniziale-sorgente.lisp" :VARIANT
   :VERBATIM-SOURCE-TEXT)))
