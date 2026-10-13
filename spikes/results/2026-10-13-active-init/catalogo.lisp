(:SCHEMA-VERSION 1 :KIND :EVIDENCE-CATALOG :DATE "2026-10-13" :PATH-BASE
 "spikes/results/2026-10-13-active-init/" :ENTRIES
 ((:KIND :LOCAL-STATIC-READING :ARTIFACT "lettura-prima.lisp" :VARIANT
   :AUTHOR-LOCAL)
  (:KIND :LOCAL-STATIC-READING :ARTIFACT "lettura-seconda.lisp" :VARIANT
   :AUTHOR-LOCAL)
  (:KIND :COMPILE-ONLY :ARTIFACT
   #A((26) BASE-CHAR . "compilazione-iniziale.lisp") :PROCESS-ARTIFACT
   #A((40) BASE-CHAR . "compilazione-iniziale-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-LINT :ARTIFACT #A((18) BASE-CHAR . "lint-iniziale.lisp")
   :PROCESS-ARTIFACT #A((32) BASE-CHAR . "lint-iniziale-conservazione.lisp")
   :VARIANT :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-TRACE :ARTIFACT
   #A((27) BASE-CHAR . "tracciabilita-iniziale.lisp") :PROCESS-ARTIFACT
   #A((41) BASE-CHAR . "tracciabilita-iniziale-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-LINKS :ARTIFACT
   #A((26) BASE-CHAR . "collegamenti-iniziali.lisp") :PROCESS-ARTIFACT
   #A((40) BASE-CHAR . "collegamenti-iniziali-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :SOURCE-SUPPORT :ARTIFACT "raccolta-sorgente.lisp" :VARIANT
   :VERBATIM-SOURCE-TEXT)
  (:KIND :SOURCE-SUPPORT :ARTIFACT "compilazione-sorgente.lisp" :VARIANT
   :VERBATIM-SOURCE-TEXT)
  (:KIND :SOURCE-SUPPORT :ARTIFACT "disassemblato-sorgente.lisp" :VARIANT
   :VERBATIM-SOURCE-TEXT)
  (:KIND :STATIC-DISASSEMBLY :ARTIFACT
   #A((27) BASE-CHAR . "disassemblato-iniziale.lisp") :PROCESS-ARTIFACT
   #A((41) BASE-CHAR . "disassemblato-iniziale-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :SOURCE-SUPPORT :ARTIFACT "ricostruzione-iniziale.lisp" :VARIANT
   :INITIAL-SOURCE-DIFF-BEFORE-REBASE)
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
  (:KIND :STATIC-EVIDENCE :ARTIFACT
   #A((23) BASE-CHAR . "evidenze-integrate.lisp") :PROCESS-ARTIFACT
   #A((37) BASE-CHAR . "evidenze-integrate-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-DISASSEMBLY :ARTIFACT
   #A((28) BASE-CHAR . "disassemblato-integrato.lisp") :PROCESS-ARTIFACT
   #A((42) BASE-CHAR . "disassemblato-integrato-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :BYTE-RETENTION-AUDIT :ARTIFACT "audit-byte.lisp" :VARIANT
   :ORIGINAL-BYTE-COMPARISON)
  (:KIND :SOURCE-SUPPORT :ARTIFACT "audit-sorgente.lisp" :VARIANT
   :VERBATIM-SOURCE-TEXT)
  (:KIND :STATIC-EVIDENCE :ARTIFACT #A((20) BASE-CHAR . "evidenze-finali.lisp")
   :PROCESS-ARTIFACT #A((34) BASE-CHAR . "evidenze-finali-conservazione.lisp")
   :VARIANT :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-LINKS :ARTIFACT
   #A((24) BASE-CHAR . "collegamenti-finali.lisp") :PROCESS-ARTIFACT
   #A((38) BASE-CHAR . "collegamenti-finali-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :BYTE-RETENTION-AUDIT :ARTIFACT "audit-finale-byte.lisp" :VARIANT
   :ORIGINAL-BYTE-COMPARISON)
  (:KIND :SOURCE-SUPPORT :ARTIFACT "audit-finale-sorgente.lisp" :VARIANT
   :VERBATIM-SOURCE-TEXT)
  (:KIND :COMPILE-ONLY :ARTIFACT #A((23) BASE-CHAR . "compilazione-fonti.lisp")
   :PROCESS-ARTIFACT
   #A((37) BASE-CHAR . "compilazione-fonti-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-LINT :ARTIFACT #A((16) BASE-CHAR . "stile-fonti.lisp")
   :PROCESS-ARTIFACT #A((30) BASE-CHAR . "stile-fonti-conservazione.lisp")
   :VARIANT :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-TRACE :ARTIFACT
   #A((24) BASE-CHAR . "tracciabilita-fonti.lisp") :PROCESS-ARTIFACT
   #A((38) BASE-CHAR . "tracciabilita-fonti-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-LINKS :ARTIFACT #A((23) BASE-CHAR . "collegamenti-fonti.lisp")
   :PROCESS-ARTIFACT
   #A((37) BASE-CHAR . "collegamenti-fonti-conservazione.lisp") :VARIANT
   :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :STATIC-EVIDENCE :ARTIFACT #A((19) BASE-CHAR . "evidenze-fonti.lisp")
   :PROCESS-ARTIFACT #A((33) BASE-CHAR . "evidenze-fonti-conservazione.lisp")
   :VARIANT :SOURCE-SNAPSHOT-IN-RECORD)
  (:KIND :BYTE-RETENTION-AUDIT :ARTIFACT "audit-integrazione-byte.lisp"
   :VARIANT :ORIGINAL-BYTE-COMPARISON)
  (:KIND :SOURCE-SUPPORT :ARTIFACT "audit-integrazione-sorgente.lisp" :VARIANT
   :VERBATIM-SOURCE-TEXT)))
