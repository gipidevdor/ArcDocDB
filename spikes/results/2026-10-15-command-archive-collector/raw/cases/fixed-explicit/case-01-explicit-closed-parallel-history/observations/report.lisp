(:INDEPENDENT-CLOSURE
 (:EXIT-CODE 0 :SIGNAL NIL :LOG
  #A((205) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/observations/closed-check.log")
  :RESULT
  (:SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-AUDIT :STATUS :OK :ARCHIVE
   "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/archive/"
   :INDEXED-FILES 9 :ACTUAL-FILES 11 :INDEXED-BYTES 34276 :PROCESSES
   ((:LABEL "process-0" :RECORD-PATH "processes/0/report.lisp" :COMMAND
     ("fixture" "ok" "literal argument") :STATUS :OK :EXIT-CODE 0
     :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "process-1" :RECORD-PATH "processes/1/report.lisp" :COMMAND
     ("fixture" "failed" "literal argument") :STATUS :FAILED :EXIT-CODE NIL
     :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "process-2" :RECORD-PATH "processes/2/report.lisp" :COMMAND
     ("fixture" "changed" "literal argument") :STATUS :SOURCE-CHANGED
     :EXIT-CODE 0 :SOURCE-CONSISTENCY :CHANGED)
    (:LABEL "gzip-failed" :RECORD-PATH "processes/gzip/report.lisp" :COMMAND
     ("fixture" "compressed-failed" "literal argument") :STATUS :FAILED
     :EXIT-CODE 7 :SOURCE-CONSISTENCY :STABLE))
   :INDEX-SHA256
   "9eaf906a58700747afa3df1c7825311f830febe96074734572f96046b6bf4f50"
   :CATALOGUE-SHA256
   "f6527083ffdb5487230058ce974563e3fc8dceda6b84300832cb13dcfd0367c4"
   :ORIGINS-COMPARED NIL :CLOSED-INVENTORY T :READ-EVAL NIL :EOF-REQUIRED T
   :LIMITS
   (:PLAIN-BYTES 1048576 :GZIP-BYTES 8388608 :PROCESS-EXPANDED-BYTES 134217728
    :ENTRIES 100000 :DIRECTORY-DEPTH 128 :DIRECTORY-ENUMERATION-NOT-PREBOUNDED
    T :PER-FILE-LOCAL-OBSERVATION T :ATOMIC-PUBLICATION NIL
    :RESULT-OR-GATE-INFERENCE NIL :MCDC-CLAIM NIL)))
 :CLEANUP-ERRORS NIL :WORKER-ERRORS (NIL NIL NIL NIL) :WORKER-COPIED-COUNTS
 (3 2 2 2) :COPY-RESULTS
 ((:STATUS :OK :ENTRY
   (:PATH #A((23) BASE-CHAR . "processes/0/report.lisp") :SOURCE
    #A((198) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/inputs/records/ok.lisp")
    :BYTES 410 :SHA256
    "47c6a080044c043439b081e8a718a0e40c7a2c820f1dfa23c4bd289533570fb0"))
  (:STATUS :OK :ENTRY
   (:PATH #A((23) BASE-CHAR . "processes/1/report.lisp") :SOURCE
    #A((202) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/inputs/records/failed.lisp")
    :BYTES 428 :SHA256
    "9f83f8ac1a1bf99e39ea6af977d8d532e82613d74103b6ae8081662f5429e3aa"))
  (:STATUS :OK :ENTRY
   (:PATH #A((23) BASE-CHAR . "processes/2/report.lisp") :SOURCE
    #A((203) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/inputs/records/changed.lisp")
    :BYTES 438 :SHA256
    "dbca9d4a05c4aac5b5523019de2c23aa35f35eb13e03cc769c0efb6d57b4d8e4"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/gzip/report.lisp" :SOURCE
    #A((207) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/inputs/records/gzip/report.lisp")
    :BYTES 310 :SHA256
    "7fffabb3167db69650d50d628155f39e98cb3e024fee539654db92821ab3e0ff"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/gzip/report.lisp.gz" :SOURCE
    #A((210) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/inputs/records/gzip/report.lisp.gz")
    :BYTES 286 :SHA256
    "aaf242eb91dbb470a65dfb76931d425e7a66f57d984a48f9704f71a46bcd13e9"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/data.bin" :SOURCE
    #A((195) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/inputs/raw/data.bin")
    :BYTES 5 :SHA256
    "45f46e8a9e33fa1fecb517abc6a0a63c35ef9bc1920018acf9d65d2a9f3a1fcc"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/.hidden.txt" :SOURCE
    #A((198) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/inputs/raw/.hidden.txt")
    :BYTES 22 :SHA256
    "6e26b55a3fb204d9259a3c7e6a28b6ccae53f783ccca85f43765649ab9faebcd"))
  (:STATUS :OK :ENTRY
   (:PATH "collection-manifest.lisp" :SOURCE
    #A((203) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/inputs/config/manifest.lisp")
    :BYTES 1109 :SHA256
    "3558429deabdcbc734b8e900dc2256e55f9eb6cc766f70f5fd5778305b737f0b"))
  (:STATUS :OK :ENTRY
   (:PATH "collection-source.lisp" :SOURCE
    #A((107) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/collect-command-archive.lisp")
    :BYTES 31268 :SHA256
    "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")))
 :PROCESSES
 ((:LABEL #A((9) BASE-CHAR . "process-0") :RECORD-PATH
   #A((23) BASE-CHAR . "processes/0/report.lisp") :COMMAND
   ("fixture" "ok" "literal argument") :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((9) BASE-CHAR . "process-1") :RECORD-PATH
   #A((23) BASE-CHAR . "processes/1/report.lisp") :COMMAND
   ("fixture" "failed" "literal argument") :STATUS :FAILED :EXIT-CODE NIL
   :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((9) BASE-CHAR . "process-2") :RECORD-PATH
   #A((23) BASE-CHAR . "processes/2/report.lisp") :COMMAND
   ("fixture" "changed" "literal argument") :STATUS :SOURCE-CHANGED :EXIT-CODE
   0 :SOURCE-CONSISTENCY :CHANGED)
  (:LABEL "gzip-failed" :RECORD-PATH "processes/gzip/report.lisp" :COMMAND
   ("fixture" "compressed-failed" "literal argument") :STATUS :FAILED
   :EXIT-CODE 7 :SOURCE-CONSISTENCY :STABLE))
 :PLANNED-FILES 9 :SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-COLLECTION :STATUS
 :OK :PHASE :COMPLETE :DESTINATION
 #A((184) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/archive/")
 :OBSERVATIONS
 #A((189) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/observations/")
 :WORKERS 4 :SHA-PER-COPY 3 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :COMPLETED-COMMAND-RECORDS-ONLY
  :FRESH-DESTINATION-ONLY :NO-AUTO-SIDECARS-OR-TREES
  :LOCAL-PER-FILE-OBSERVATIONS :NO-ATOMICITY-OR-AUTHENTICATION
  :NO-RESULT-OR-GATE-INFERENCE :NO-MCDC-OR-RELEASE-QUALIFICATION))
