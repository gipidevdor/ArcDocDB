(:INDEPENDENT-CLOSURE
 (:EXIT-CODE 0 :SIGNAL NIL :LOG
  #A((109) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci-design-collection/closed-check.log")
  :RESULT
  (:SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-AUDIT :STATUS :OK :ARCHIVE
   "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/results/2026-10-16-ci-progetto/"
   :INDEXED-FILES 7 :ACTUAL-FILES 9 :INDEXED-BYTES 276158 :PROCESSES
   ((:LABEL "documentation" :RECORD-PATH "processes/documentation/report.lisp"
     :COMMAND ("make" "links" "trace") :STATUS :OK :EXIT-CODE 0
     :SOURCE-CONSISTENCY :STABLE))
   :INDEX-SHA256
   "d3d9992b8fbb828962257bc2cd330ba962152750077b489507bfd791708d3429"
   :CATALOGUE-SHA256
   "583fcaebd6b5b2011957563b97207c3dfbe617e57c7b47f5e9e016fb4f5ad520"
   :ORIGINS-COMPARED NIL :CLOSED-INVENTORY T :READ-EVAL NIL :EOF-REQUIRED T
   :LIMITS
   (:PLAIN-BYTES 1048576 :GZIP-BYTES 8388608 :PROCESS-EXPANDED-BYTES 134217728
    :ENTRIES 100000 :DIRECTORY-DEPTH 128 :DIRECTORY-ENUMERATION-NOT-PREBOUNDED
    T :PER-FILE-LOCAL-OBSERVATION T :ATOMIC-PUBLICATION NIL
    :RESULT-OR-GATE-INFERENCE NIL :MCDC-CLAIM NIL)))
 :CLEANUP-ERRORS NIL :WORKER-ERRORS (NIL NIL NIL NIL) :WORKER-COPIED-COUNTS
 (2 2 2 1) :COPY-RESULTS
 ((:STATUS :OK :ENTRY
   (:PATH "processes/documentation/report.lisp" :SOURCE
    #A((110) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001163246-command-41741-0/report.lisp")
    :BYTES 240284 :SHA256
    "5845c843c2438a4605f461d39908ba6d9c4ab34bbe8910e5a01295d3c446a9ec"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/documentation/conservazione.lisp" :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001163246-command-41741-0/conservazione.lisp")
    :BYTES 1142 :SHA256
    "dc28b342d5ff30326c84098fecc2253a41a51206451533f2b129e5aeef9b5e1e"))
  (:STATUS :OK :ENTRY
   (:PATH "review.lisp" :SOURCE
    #A((99) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci-design-input/review.lisp")
    :BYTES 1242 :SHA256
    "1bed6d758358f2081d59f672eb711b28e3ed5e66bc9dfb5891a3173a9284306d"))
  (:STATUS :OK :ENTRY
   (:PATH "summary.lisp" :SOURCE
    #A((100) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci-design-input/summary.lisp")
    :BYTES 572 :SHA256
    "92179ae41504e363fbdfc971842ec23f79913efaa16f0fb59a0464d79dcde2ee"))
  (:STATUS :OK :ENTRY
   (:PATH "report.md" :SOURCE
    #A((101) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci-design-input/report.md.txt")
    :BYTES 722 :SHA256
    "16f25efe65ba2dbdf36b1885444c8fc80e43d4e087f9dd5415d1e363b5d10afd"))
  (:STATUS :OK :ENTRY
   (:PATH "collection-manifest.lisp" :SOURCE
    #A((101) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci-design-input/manifest.lisp")
    :BYTES 928 :SHA256
    "ebab3d33d1badb0e15adfd64919c3027d4e336466f35438f333e44f5e7cd4149"))
  (:STATUS :OK :ENTRY
   (:PATH "collection-source.lisp" :SOURCE
    #A((95) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/tools/collect-command-archive.lisp")
    :BYTES 31268 :SHA256
    "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")))
 :PROCESSES
 ((:LABEL "documentation" :RECORD-PATH "processes/documentation/report.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "make") #A((5) BASE-CHAR . "links")
    #A((5) BASE-CHAR . "trace"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :PLANNED-FILES 7 :SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-COLLECTION :STATUS
 :OK :PHASE :COMPLETE :DESTINATION
 #A((99) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/results/2026-10-16-ci-progetto/")
 :OBSERVATIONS
 #A((93) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci-design-collection/")
 :WORKERS 4 :SHA-PER-COPY 3 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :COMPLETED-COMMAND-RECORDS-ONLY
  :FRESH-DESTINATION-ONLY :NO-AUTO-SIDECARS-OR-TREES
  :LOCAL-PER-FILE-OBSERVATIONS :NO-ATOMICITY-OR-AUTHENTICATION
  :NO-RESULT-OR-GATE-INFERENCE :NO-MCDC-OR-RELEASE-QUALIFICATION))
