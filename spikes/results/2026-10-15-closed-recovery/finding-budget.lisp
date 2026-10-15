(:schema-version 1 :kind :local-static-reading :date "2026-10-15"
 :author :implementing-agent :independent nil :qualification nil
 :source-before "fa2747f2" :finding :byte-budget-upper-bound
 :source-paths ("src/recovery-closed/read.lisp" "src/storage/compaction-scan.lisp")
 :observation "Il preflight iniziale accetta bytes oltre segment-max; il codec compaction lo rifiuta dopo I/O."
 :resolution "Preflight comune: segment-header-bytes <= bytes <= segment-max-bytes prima di leggere l'origine."
 :limits (:static-inspection-only :no-functional-execution :dedicated-cases-open))
