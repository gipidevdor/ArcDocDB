(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "collector-self-test" :RECORD-PATH
   "processes/collector-self-test/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "tools/collect-command-archive.lisp")
    #A((11) BASE-CHAR . "--self-test"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-start-collector-manifest-02.lisp")
   :BYTES 2309 :SHA256
   "001f57c197c40b45d62d383e3419535ef60b5c1df82c0ea828b7b7d931121b15")
  (:PATH "collection-source.lisp" :SOURCE
   #A((95) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")
  (:PATH "processes/collector-self-test/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001079828-command-90148-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "122c63f9a871fe7c8fea74c72ef565c475fa5ea77fc1a883a1391b9537af1773")
  (:PATH "processes/collector-self-test/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001079828-command-90148-0/report.lisp")
   :BYTES 232456 :SHA256
   "67f94a3c4b4fdfefb3155a261ddc3d7a5237a8cdea1c97622c3ed29cb8ce5780")
  (:PATH "raw/CHANGELOG.md.txt" :SOURCE
   #A((73) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/CHANGELOG.md")
   :BYTES 25535 :SHA256
   "6cdb84efb5de3858083889a60d659e1543e66fbd50ee58e5e2c058ae24076183")
  (:PATH "raw/Makefile" :SOURCE
   #A((69) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/Makefile")
   :BYTES 3047 :SHA256
   "12100b0e19c59035ab2dfe10b7e2db21c842be890c7cc731059b96e27c4fa4f4")
  (:PATH "raw/arcdocdb.asd" :SOURCE
   #A((73) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/arcdocdb.asd")
   :BYTES 19321 :SHA256
   "2b069c81bd728ec946569cdfbc5d6ad650109402f3ff50e0f4e9cba8a69bc944")
  (:PATH "raw/docs/implementazione/README.md.txt" :SOURCE
   #A((91) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/README.md")
   :BYTES 12819 :SHA256
   "a25e42a07286ec9f339695e1e61da548adcdd1cc51cb060676c04a899542478b")
  (:PATH "raw/docs/implementazione/pool-prepara-risultati.md.txt" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/pool-prepara-risultati.md")
   :BYTES 9396 :SHA256
   "80ad52f09b368ee2b3a4913b9d404bf67b85f0971a0105fd473cae555d70da7e")
  (:PATH "raw/spikes/out/pool-start-collector-self-test-attempt-01.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-start-collector-self-test-attempt-01.log")
   :BYTES 224 :SHA256
   "f997551a3b42b0d5fcded03aa266bf3820493246532394d8564f215efcabe2b9")
  (:PATH "raw/spikes/out/pool-start-collector-summary.lisp" :SOURCE
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-start-collector-summary.lisp")
   :BYTES 416 :SHA256
   "55d64d8223315fc44ed3129212a7c36a8e634354e3a6e7f73292e4c4b912ffa1")
  (:PATH "raw/src/dispatch/package.lisp" :SOURCE
   #A((86) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/dispatch/package.lisp")
   :BYTES 595 :SHA256
   "6b791437e5b6c7c21dc9cf1be85b81ec0498725c307512b5978d4c8ed04e7255")
  (:PATH "raw/src/dispatch/start.lisp" :SOURCE
   #A((84) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/dispatch/start.lisp")
   :BYTES 3259 :SHA256
   "087fd623a51a89d4f5fe4d917ba7f563c8062b6e24ead3618d7f2501e0335b5d")
  (:PATH "raw/tests/scheduler/pool-start.lisp" :SOURCE
   #A((92) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/scheduler/pool-start.lisp")
   :BYTES 23464 :SHA256
   "a6647dc88a69d58437ee8d738bf14b7d2dea94f17b24067a4fb3b4532f9a0bdd")
  (:PATH "raw/tools/collect-command-archive-tests.lisp" :SOURCE
   #A((101) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tools/collect-command-archive-tests.lisp")
   :BYTES 35866 :SHA256
   "3fc2bb2bc80977957014b208be6d29d794c7272b30d0a2ffe00f15e079c9f474")
  (:PATH "raw/tools/measure-pool-start.lisp" :SOURCE
   #A((90) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tools/measure-pool-start.lisp")
   :BYTES 12728 :SHA256
   "72dad0204d67d2d2596ee60dc252f939fc1bec2b82eeac8f19854299e48e73cf"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
