(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "collector" :RECORD-PATH "command/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "tools/collect-command-archive.lisp")
    #A((9) BASE-CHAR . "--collect")
    #A((58) BASE-CHAR
       . "spikes/out/creazione-relativa-publication/manifest-R2.lisp")
    #A((48) BASE-CHAR . "spikes/results/2026-10-22-io-creazione-relativa/")
    #A((14) BASE-CHAR . "--observations")
    #A((44) BASE-CHAR . "spikes/out/creazione-relativa-collection-R1/")
    #A((6) BASE-CHAR . "--jobs") #A((1) BASE-CHAR . "4"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "closed-check.log" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-collection-R1/closed-check.log")
   :BYTES 1917 :SHA256
   "95fddeca11dee9b0973034d4ce7b51890bcc18988022a246607b160959b26fb1")
  (:PATH "collection-manifest.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/collection-manifest.lisp")
   :BYTES 1203 :SHA256
   "ed69e29c742a6a9c92a25caf360ab5d4421a4dfa8932106e150bb109da5cc256")
  (:PATH "collection-source.lisp" :SOURCE
   #A((103) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")
  (:PATH "collection.lisp" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-collection-R1/report.lisp")
   :BYTES 33672 :SHA256
   "cf9691087fc626cb7936ee7a04f06f47656af35af05719e1187d7b530c15f293")
  (:PATH "command/conservazione.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-collection-command-R1/conservazione.lisp")
   :BYTES 1196 :SHA256
   "0583449d9ab974469c5781e407670dbeba9cdf38cdd8d0a229a18efc20713aa6")
  (:PATH "command/report.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-collection-command-R1/report.lisp")
   :BYTES 297188 :SHA256
   "a91a2cee237bfdc9cc873f0ca0d84db5d22a6197d6bc3b42a5076817d69f8076")
  (:PATH "preparation-summary.txt" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/manifest-builder-R2.stdout.txt")
   :BYTES 40 :SHA256
   "c25b49408c72d25c79cfcd87fec8f838002821a82f6164b9d17003c0b2d21726"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
