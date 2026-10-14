(:SCHEMA-VERSION 1 :KIND :EVIDENCE-CATALOG :DATE "2026-10-14" :ENTRIES
 ((:KIND :LOCAL-STATIC-READING :ARTIFACT "lettura-prima.lisp" :VARIANT
   :AUTHORITY-AND-RESOLUTION)
  (:KIND :LOCAL-STATIC-READING :ARTIFACT "lettura-seconda.lisp" :VARIANT
   :OWNERSHIP-AND-PUBLICATION)
  (:KIND :COMPILE-ONLY :ARTIFACT
   #A((26) BASE-CHAR . "compilazione-iniziale.lisp") :PROCESS-ARTIFACT
   #A((40) BASE-CHAR . "compilazione-iniziale-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-TRACE-WRITE :ARTIFACT
   #A((22) BASE-CHAR . "matrice-scrittura.lisp") :PROCESS-ARTIFACT
   #A((36) BASE-CHAR . "matrice-scrittura-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :COMPILE-ONLY :ARTIFACT
   #A((24) BASE-CHAR . "compilazione-finale.lisp") :PROCESS-ARTIFACT
   #A((38) BASE-CHAR . "compilazione-finale-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
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
  (:KIND :STATIC-EVIDENCE :ARTIFACT #A((13) BASE-CHAR . "evidenze.lisp")
   :PROCESS-ARTIFACT #A((27) BASE-CHAR . "evidenze-conservazione.lisp")
   :VARIANT :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :SOURCE-SUPPORT :ARTIFACT "raccolta-sorgente.lisp" :VARIANT
   :VERBATIM-SOURCE-TEXT)
  (:KIND :SOURCE-SUPPORT :ARTIFACT "compilazione-sorgente.lisp" :VARIANT
   :VERBATIM-SOURCE-TEXT)
  (:KIND :SOURCE-SUPPORT :ARTIFACT "disassemblato-sorgente.lisp" :VARIANT
   :VERBATIM-SOURCE-TEXT)
  (:KIND :BYTE-RETENTION-AUDIT :ARTIFACT "audit-byte.lisp" :VARIANT
   :ORIGINAL-BYTE-COMPARISON)
  (:KIND :SOURCE-SUPPORT :ARTIFACT "audit-sorgente.lisp" :VARIANT
   :VERBATIM-SOURCE-TEXT)
  (:KIND :STATIC-EVIDENCE :ARTIFACT #A((20) BASE-CHAR . "evidenze-finali.lisp")
   :PROCESS-ARTIFACT #A((34) BASE-CHAR . "evidenze-finali-conservazione.lisp")
   :VARIANT :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :BYTE-RETENTION-AUDIT :ARTIFACT "audit-finale-byte.lisp" :VARIANT
   :ORIGINAL-BYTE-COMPARISON)
  (:KIND :SOURCE-SUPPORT :ARTIFACT "audit-finale-sorgente.lisp" :VARIANT
   :VERBATIM-SOURCE-TEXT)
  (:KIND :COMPILE-ONLY :ARTIFACT
   #A((27) BASE-CHAR . "compilazione-integrata.lisp") :PROCESS-ARTIFACT
   #A((41) BASE-CHAR . "compilazione-integrata-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-TRACE :ARTIFACT
   #A((28) BASE-CHAR . "tracciabilita-integrata.lisp") :PROCESS-ARTIFACT
   #A((42) BASE-CHAR . "tracciabilita-integrata-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-LINKS :ARTIFACT
   #A((27) BASE-CHAR . "collegamenti-integrati.lisp") :PROCESS-ARTIFACT
   #A((41) BASE-CHAR . "collegamenti-integrati-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-EVIDENCE :ARTIFACT
   #A((23) BASE-CHAR . "evidenze-integrate.lisp") :PROCESS-ARTIFACT
   #A((37) BASE-CHAR . "evidenze-integrate-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :BYTE-RETENTION-AUDIT :ARTIFACT "audit-integrazione-byte.lisp"
   :VARIANT :ORIGINAL-BYTE-COMPARISON)
  (:KIND :SOURCE-SUPPORT :ARTIFACT "audit-integrazione-sorgente.lisp" :VARIANT
   :VERBATIM-SOURCE-TEXT)))
