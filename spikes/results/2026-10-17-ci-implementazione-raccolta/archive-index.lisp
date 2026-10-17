(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "preparation" :RECORD-PATH "preparation/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((46) BASE-CHAR . "spikes/out/ci/prepare-integration-archive.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "producer" :RECORD-PATH "producer/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "tools/collect-command-archive.lisp")
    #A((9) BASE-CHAR . "--collect")
    #A((35) BASE-CHAR . "spikes/out/ci/archive-manifest.lisp")
    #A((45) BASE-CHAR . "spikes/results/2026-10-17-ci-implementazione/")
    #A((14) BASE-CHAR . "--observations")
    #A((38) BASE-CHAR . "spikes/out/ci/collection-observations/")
    #A((6) BASE-CHAR . "--jobs") #A((1) BASE-CHAR . "4"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((96) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/receipt-manifest.lisp")
   :BYTES 1329 :SHA256
   "343b65d8dae82692e73476c2bc3956aa9838c039dbbb99ee3fa12ecf95fa08af")
  (:PATH "collection-source.lisp" :SOURCE
   #A((95) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")
  (:PATH "collection/closed-check.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/collection-observations/closed-check.log")
   :BYTES 6642 :SHA256
   "d2c7d0052e28de382a1a840985d304caaf8cd36e359b9360cc89fe0191f9fe01")
  (:PATH "collection/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/collection-observations/report.lisp")
   :BYTES 62390 :SHA256
   "b12d9f4332ef031cd71a6a7834d10ef95c92fc9bad144fc55e13cb3aa9360221")
  (:PATH "counts.lisp" :SOURCE
   #A((97) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/collection-counts.lisp")
   :BYTES 737 :SHA256
   "c0ef7c1a505a559fceaefb45c3cb0eeda00e4e4cda2c6f82bcfbe18a63985265")
  (:PATH "preparation/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001219369-command-23210-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "d3ec8d0025eac40ec88455c9b93b936f1f4d027a9b1608af77be162713094a62")
  (:PATH "preparation/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001219369-command-23210-0/report.lisp")
   :BYTES 247608 :SHA256
   "a7016ada18a7eebb9848cbb6f40a21eae551ae32ab34df9d09481502fec6a03d")
  (:PATH "producer/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001219456-command-25399-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "23baeb136695224ae470cbce660e6e26a01a3cbc629a698975ec6cd4ef101a71")
  (:PATH "producer/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001219456-command-25399-0/report.lisp")
   :BYTES 303828 :SHA256
   "52bc6f79aa777aa122f3d50d3226f77968d24f64aeb9c1a9ca3d51104fdc65bf"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
