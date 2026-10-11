(:SCHEMA-VERSION 1 :KIND :EVIDENCE-CATALOG :DATE "2026-10-11" :PATH-BASE
 "spikes/results/2026-10-11-get-resolver/" :ENTRIES
 ((:KIND :LOCAL-STATIC-READING :ARTIFACT "lettura-prima.lisp" :VARIANT
   :AUTHOR-LOCAL)
  (:KIND :LOCAL-STATIC-READING :ARTIFACT "lettura-seconda.lisp" :VARIANT
   :AUTHOR-LOCAL)
  (:KIND :COMPILE-ONLY :ARTIFACT
   #A((34) BASE-CHAR . "compilazione-iniziale-fallita.lisp") :PROCESS-ARTIFACT
   #A((48) BASE-CHAR . "compilazione-iniziale-fallita-conservazione.lisp")
   :VARIANT :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-CHECK :ARTIFACT #A((18) BASE-CHAR . "lint-iniziale.lisp")
   :PROCESS-ARTIFACT #A((32) BASE-CHAR . "lint-iniziale-conservazione.lisp")
   :VARIANT :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :COMPILE-ONLY :ARTIFACT
   #A((31) BASE-CHAR . "compilazione-asdf-corretta.lisp") :PROCESS-ARTIFACT
   #A((45) BASE-CHAR . "compilazione-asdf-corretta-conservazione.lisp")
   :VARIANT :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :COMPILE-ONLY :ARTIFACT
   #A((34) BASE-CHAR . "compilazione-header-traversal.lisp") :PROCESS-ARTIFACT
   #A((48) BASE-CHAR . "compilazione-header-traversal-conservazione.lisp")
   :VARIANT :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-INSPECTION :ARTIFACT
   #A((27) BASE-CHAR . "disassemblato-iniziale.lisp") :PROCESS-ARTIFACT
   #A((41) BASE-CHAR . "disassemblato-iniziale-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :COMPILE-ONLY :ARTIFACT
   #A((32) BASE-CHAR . "compilazione-documentazione.lisp") :PROCESS-ARTIFACT
   #A((46) BASE-CHAR . "compilazione-documentazione-conservazione.lisp")
   :VARIANT :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-CHECK :ARTIFACT
   #A((24) BASE-CHAR . "lint-documentazione.lisp") :PROCESS-ARTIFACT
   #A((38) BASE-CHAR . "lint-documentazione-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-CHECK :ARTIFACT
   #A((25) BASE-CHAR . "trace-documentazione.lisp") :PROCESS-ARTIFACT
   #A((39) BASE-CHAR . "trace-documentazione-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-CHECK :ARTIFACT
   #A((25) BASE-CHAR . "links-documentazione.lisp") :PROCESS-ARTIFACT
   #A((39) BASE-CHAR . "links-documentazione-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :SOURCE-SUPPORT :ARTIFACT "raccolta-sorgente.lisp" :VARIANT
   :VERBATIM-SOURCE-TEXT)
  (:KIND :SOURCE-SUPPORT :ARTIFACT "compilazione-sorgente.lisp" :VARIANT
   :VERBATIM-SOURCE-TEXT)
  (:KIND :SOURCE-SUPPORT :ARTIFACT "disassemblato-sorgente.lisp" :VARIANT
   :VERBATIM-SOURCE-TEXT)
  (:KIND :COMPILE-ONLY :ARTIFACT #A((23) BASE-CHAR . "compilazione-final.lisp")
   :PROCESS-ARTIFACT
   #A((37) BASE-CHAR . "compilazione-final-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-CHECK :ARTIFACT #A((15) BASE-CHAR . "lint-final.lisp")
   :PROCESS-ARTIFACT #A((29) BASE-CHAR . "lint-final-conservazione.lisp")
   :VARIANT :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-CHECK :ARTIFACT #A((16) BASE-CHAR . "trace-final.lisp")
   :PROCESS-ARTIFACT #A((30) BASE-CHAR . "trace-final-conservazione.lisp")
   :VARIANT :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-CHECK :ARTIFACT #A((16) BASE-CHAR . "links-final.lisp")
   :PROCESS-ARTIFACT #A((30) BASE-CHAR . "links-final-conservazione.lisp")
   :VARIANT :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-INSPECTION :ARTIFACT
   #A((24) BASE-CHAR . "disassemblato-final.lisp") :PROCESS-ARTIFACT
   #A((38) BASE-CHAR . "disassemblato-final-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-CHECK :ARTIFACT
   #A((32) BASE-CHAR . "evidence-prima-integrazione.lisp") :PROCESS-ARTIFACT
   #A((46) BASE-CHAR . "evidence-prima-integrazione-conservazione.lisp")
   :VARIANT :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :COMPILE-ONLY :ARTIFACT
   #A((30) BASE-CHAR . "compilazione-integrazione.lisp") :PROCESS-ARTIFACT
   #A((44) BASE-CHAR . "compilazione-integrazione-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-CHECK :ARTIFACT #A((22) BASE-CHAR . "lint-integrazione.lisp")
   :PROCESS-ARTIFACT
   #A((36) BASE-CHAR . "lint-integrazione-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-CHECK :ARTIFACT #A((23) BASE-CHAR . "trace-integrazione.lisp")
   :PROCESS-ARTIFACT
   #A((37) BASE-CHAR . "trace-integrazione-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-CHECK :ARTIFACT #A((23) BASE-CHAR . "links-integrazione.lisp")
   :PROCESS-ARTIFACT
   #A((37) BASE-CHAR . "links-integrazione-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-INSPECTION :ARTIFACT
   #A((31) BASE-CHAR . "disassemblato-integrazione.lisp") :PROCESS-ARTIFACT
   #A((45) BASE-CHAR . "disassemblato-integrazione-conservazione.lisp")
   :VARIANT :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-CHECK :ARTIFACT
   #A((26) BASE-CHAR . "evidence-integrazione.lisp") :PROCESS-ARTIFACT
   #A((40) BASE-CHAR . "evidence-integrazione-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :BYTE-RETENTION-AUDIT :ARTIFACT "audit-byte.lisp" :VARIANT
   :ORIGINAL-BYTE-COMPARISON)
  (:KIND :SOURCE-SUPPORT :ARTIFACT "audit-sorgente.lisp" :VARIANT
   :VERBATIM-SOURCE-TEXT)
  (:KIND :BYTE-RETENTION-AUDIT :ARTIFACT "audit-byte-final.lisp" :VARIANT
   :ORIGINAL-BYTE-COMPARISON)
  (:KIND :SOURCE-SUPPORT :ARTIFACT "audit-sorgente-final.lisp" :VARIANT
   :VERBATIM-SOURCE-TEXT)))
