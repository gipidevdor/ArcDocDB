(:INDEPENDENT-CLOSURE
 (:EXIT-CODE 0 :SIGNAL NIL :LOG
  #A((108) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-count-collection/closed-check.log")
  :RESULT
  (:SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-AUDIT :STATUS :OK :ARCHIVE
   "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-22-ci-count-availability/"
   :INDEXED-FILES 20 :ACTUAL-FILES 22 :INDEXED-BYTES 895251 :PROCESSES
   ((:LABEL "before" :RECORD-PATH "processes/before/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/ci.lisp" "self-test" "--out" "spikes/out/ci-count-before")
     :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "after" :RECORD-PATH "processes/after/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/ci.lisp" "self-test" "--out" "spikes/out/ci-count-after")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "full-check" :RECORD-PATH "processes/full-check/report.lisp"
     :COMMAND
     ("/Applications/Xcode.app/Contents/Developer/usr/bin/make" "check-core")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
   :INDEX-SHA256
   "8fbcc2ef7e8b6f6b639801da7b8285efbbb2633729bc8abcb7e4d3b85f0d749e"
   :CATALOGUE-SHA256
   "6ef053eb452c05a6db1797f81a1f59a947afa9c2cda81beec1477d2abf2e7d61"
   :ORIGINS-COMPARED NIL :CLOSED-INVENTORY T :READ-EVAL NIL :EOF-REQUIRED T
   :LIMITS
   (:PLAIN-BYTES 1048576 :GZIP-BYTES 8388608 :PROCESS-EXPANDED-BYTES 134217728
    :ENTRIES 100000 :DIRECTORY-DEPTH 128 :DIRECTORY-ENUMERATION-NOT-PREBOUNDED
    T :PER-FILE-LOCAL-OBSERVATION T :ATOMIC-PUBLICATION NIL
    :RESULT-OR-GATE-INFERENCE NIL :MCDC-CLAIM NIL)))
 :CLEANUP-ERRORS NIL :WORKER-ERRORS (NIL NIL NIL NIL) :WORKER-COPIED-COUNTS
 (6 7 6 1) :COPY-RESULTS
 ((:STATUS :OK :ENTRY
   (:PATH "processes/before/report.lisp" :SOURCE
    #A((110) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001676362-command-36453-0/report.lisp")
    :BYTES 263783 :SHA256
    "67b4c605657b46c12ba37490fe16de1b6b0c1f0eaa6b57020b4a886f76c34853"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/before/conservazione.lisp" :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001676362-command-36453-0/conservazione.lisp")
    :BYTES 1142 :SHA256
    "e649b1094846b1ee61d1bdc19680f2963214f904d7e27d0e0cf6c99524c2f0d3"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/after/report.lisp" :SOURCE
    #A((110) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001676555-command-37887-0/report.lisp")
    :BYTES 263778 :SHA256
    "e204134a1d52bd57e9b24156b44a061e400430039ec54b4e9248786774ceb0a2"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/after/conservazione.lisp" :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001676555-command-37887-0/conservazione.lisp")
    :BYTES 1141 :SHA256
    "d194ae07c1c7639af20fc62acf1165a89bb64bbddc32b0c8ceb1e067af29e32e"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/full-check/report.lisp" :SOURCE
    #A((110) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001676406-command-36822-0/report.lisp")
    :BYTES 317 :SHA256
    "16e7f83d2c0a19a4f4f6d0ffaaf55a1a6207752d6bc2a69e70246d0bc28c2242"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/full-check/report.lisp.gz" :SOURCE
    #A((113) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001676406-command-36822-0/report.lisp.gz")
    :BYTES 259884 :SHA256
    "c703a80042502b2b24b257952f3bfac8784dfc670d9e250cd3a12c7934906418"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/full-check/conservazione.lisp" :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001676406-command-36822-0/conservazione.lisp")
    :BYTES 1721 :SHA256
    "d6931b5eb6af3afc262ab2312b63d5ec63b7a66910f74588b5a7010a69e9193f"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/before/report.lisp" :SOURCE
    #A((99) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-count-before/report.lisp")
    :BYTES 548 :SHA256
    "a221e268ba18dcc86e6b8ec804898270e369519e5e963aff98540cb9c220e299"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/before/boundaries.lisp" :SOURCE
    #A((103) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-count-before/boundaries.lisp")
    :BYTES 914 :SHA256
    "977f55be76150ffb7aaa86ee6a188e59e445b26abf9c75065bc8f5b4284f5b40"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/after/report.lisp" :SOURCE
    #A((98) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-count-after/report.lisp")
    :BYTES 548 :SHA256
    "3a8642d30065daf195fd73a4630062762762133e18bc099b2781fc80bc13d35e"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/after/boundaries.lisp" :SOURCE
    #A((102) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-count-after/boundaries.lisp")
    :BYTES 914 :SHA256
    "b4a90356b0131ee2672a0777509a5483e592f019cc44b3fa8ce5907d58624927"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/sources/after/tools/ci/producer.lisp" :SOURCE
    #A((130) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-count-conservation/sources/after/tools/ci/producer.lisp")
    :BYTES 15256 :SHA256
    "7b4cbb68f5c1010855f9c7fc9f1958ea1381a9595cabc2145ce5ef89de953069"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/sources/after/tools/ci/self-test.lisp" :SOURCE
    #A((131) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-count-conservation/sources/after/tools/ci/self-test.lisp")
    :BYTES 13082 :SHA256
    "97889f1198762ba73bb0aeaace879b03884ca7ad6f72c581725e5199aeda50e8"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/sources/before/tools/ci/producer.lisp" :SOURCE
    #A((131) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-count-conservation/sources/before/tools/ci/producer.lisp")
    :BYTES 15250 :SHA256
    "3d346de332e9991a83289d2c9ad752a30b9b79696adccdcc90d44446335ac183"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/sources/before/tools/ci/self-test.lisp" :SOURCE
    #A((132) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-count-conservation/sources/before/tools/ci/self-test.lisp")
    :BYTES 13082 :SHA256
    "97889f1198762ba73bb0aeaace879b03884ca7ad6f72c581725e5199aeda50e8"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/source-commits.txt" :SOURCE
    #A((112) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-count-conservation/source-commits.txt")
    :BYTES 95 :SHA256
    "a2af21beacabe8e7bfc7e624d8800efbf8df18831a51449df86fe88e00a78780"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/preregistered.md.txt" :SOURCE
    #A((114) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-count-conservation/preregistered.md.txt")
    :BYTES 4383 :SHA256
    "8d27e8baa9af3843eb04ed6d46415d0971a3e5df3d865f38aae2d9e760d915c2"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/method.md.txt" :SOURCE
    #A((101) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/ci-wire-processi.md")
    :BYTES 4839 :SHA256
    "0d86b94c444b4a71ca2b34b3fff1225fd1cec962f569a901069a736ed6e4a97c"))
  (:STATUS :OK :ENTRY
   (:PATH "collection-manifest.lisp" :SOURCE
    #A((107) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-count-conservation/manifest.lisp")
    :BYTES 3306 :SHA256
    "ef50f584aa037e4650e8c18a0e4b4dba59a776a339a28f4c682fc9b91471ca2c"))
  (:STATUS :OK :ENTRY
   (:PATH "collection-source.lisp" :SOURCE
    #A((95) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tools/collect-command-archive.lisp")
    :BYTES 31268 :SHA256
    "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")))
 :PROCESSES
 ((:LABEL "before" :RECORD-PATH "processes/before/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((13) BASE-CHAR . "tools/ci.lisp")
    #A((9) BASE-CHAR . "self-test") #A((5) BASE-CHAR . "--out")
    #A((26) BASE-CHAR . "spikes/out/ci-count-before"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "after" :RECORD-PATH "processes/after/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((13) BASE-CHAR . "tools/ci.lisp")
    #A((9) BASE-CHAR . "self-test") #A((5) BASE-CHAR . "--out")
    #A((25) BASE-CHAR . "spikes/out/ci-count-after"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "full-check" :RECORD-PATH "processes/full-check/report.lisp" :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :PLANNED-FILES 20 :SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-COLLECTION :STATUS
 :OK :PHASE :COMPLETE :DESTINATION
 #A((109) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-22-ci-count-availability/")
 :OBSERVATIONS
 #A((92) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-count-collection/")
 :WORKERS 4 :SHA-PER-COPY 3 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :COMPLETED-COMMAND-RECORDS-ONLY
  :FRESH-DESTINATION-ONLY :NO-AUTO-SIDECARS-OR-TREES
  :LOCAL-PER-FILE-OBSERVATIONS :NO-ATOMICITY-OR-AUTHENTICATION
  :NO-RESULT-OR-GATE-INFERENCE :NO-MCDC-OR-RELEASE-QUALIFICATION))
