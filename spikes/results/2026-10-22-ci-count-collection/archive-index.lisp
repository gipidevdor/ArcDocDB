(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "collection" :RECORD-PATH "processes/collection/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "tools/collect-command-archive.lisp")
    #A((9) BASE-CHAR . "--collect")
    #A((46) BASE-CHAR . "spikes/out/ci-count-conservation/manifest.lisp")
    #A((48) BASE-CHAR . "spikes/results/2026-10-22-ci-count-availability/")
    #A((14) BASE-CHAR . "--observations")
    #A((31) BASE-CHAR . "spikes/out/ci-count-collection/")
    #A((6) BASE-CHAR . "--jobs") #A((1) BASE-CHAR . "4"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "trace-links" :RECORD-PATH "processes/trace-links/report.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "make") #A((5) BASE-CHAR . "trace")
    #A((5) BASE-CHAR . "links"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "catalog" :RECORD-PATH "processes/catalog/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((25) BASE-CHAR . "tools/check-evidence.lisp")
    #A((9) BASE-CHAR . "--catalog")
    #A((61) BASE-CHAR
       . "spikes/results/2026-10-22-ci-count-availability/catalogo.lisp")
    #A((21) BASE-CHAR . "--temporary-directory")
    #A((34) BASE-CHAR . "spikes/out/ci-count-catalog-check/"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-count-conservation/receipt-manifest.lisp")
   :BYTES 1650 :SHA256
   "6594cc2725efc77f5886365f7e39f136c86fdbf559357e374353dd0a454bf2b5")
  (:PATH "collection-source.lisp" :SOURCE
   #A((95) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")
  (:PATH "processes/catalog/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001677028-command-46869-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "359132eba5f77fe3d03e6ab5d8b753bd6669feb43a81c8d8c84b390232e496ed")
  (:PATH "processes/catalog/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001677028-command-46869-0/report.lisp")
   :BYTES 263480 :SHA256
   "c56878ce455633461d0101edca969e6f215001c79a56e83af19b60ebba0898bc")
  (:PATH "processes/collection/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001677004-command-46254-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "5adee9fb0d00c27ca773cb5170d332cd6a598b13dc7c4f509d470c040a38e7c9")
  (:PATH "processes/collection/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001677004-command-46254-0/report.lisp")
   :BYTES 272668 :SHA256
   "c4041b6cc916c61a2b3d6a1f733d7cc2c06bcfeab84f6c0457d937fd08011cb4")
  (:PATH "processes/trace-links/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001677028-command-46868-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "e8b48cb16c13b91fbfd31f43467ec4b7900525738c5de6adc30fbe67b69a15af")
  (:PATH "processes/trace-links/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001677028-command-46868-0/report.lisp")
   :BYTES 263130 :SHA256
   "8d497871952886431b19307e621f694b8c1fcd65655736d7c8f7e6457e9de5e8")
  (:PATH "raw/collection/closed-check.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-count-collection/closed-check.log")
   :BYTES 1511 :SHA256
   "21e77a55b48ea4c41c40abe522b3a2dec0cfb96e524c69a2e58f10fcfc8c36c8")
  (:PATH "raw/collection/report.lisp" :SOURCE
   #A((103) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-count-collection/report.lisp")
   :BYTES 10108 :SHA256
   "343631531f14259e94bb33bd98b1f49a622b7448816d23e7977909b188965abe"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
