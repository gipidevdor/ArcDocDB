(:INDEPENDENT-CLOSURE
 (:EXIT-CODE 0 :SIGNAL NIL :LOG
  #A((199) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-40-gzip-budget-exact-boundary/observations/closed-check.log")
  :RESULT
  (:SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-AUDIT :STATUS :OK :ARCHIVE
   "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-40-gzip-budget-exact-boundary/archive/"
   :INDEXED-FILES 9 :ACTUAL-FILES 11 :INDEXED-BYTES 8422872 :PROCESSES
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
   "32c893da8054e4cff59f9ac0ef19788ed036dbf45ab08ffde04dfa842ffc5b58"
   :CATALOGUE-SHA256
   "09dd197a7ce231c73060c014980b116c77f816569552f2f777c06ffaf24a7652"
   :ORIGINS-COMPARED NIL :CLOSED-INVENTORY T :READ-EVAL NIL :EOF-REQUIRED T
   :LIMITS
   (:PLAIN-BYTES 1048576 :GZIP-BYTES 8388608 :PROCESS-EXPANDED-BYTES 134217728
    :ENTRIES 100000 :DIRECTORY-DEPTH 128 :DIRECTORY-ENUMERATION-NOT-PREBOUNDED
    T :PER-FILE-LOCAL-OBSERVATION T :ATOMIC-PUBLICATION NIL
    :RESULT-OR-GATE-INFERENCE NIL :MCDC-CLAIM NIL)))
 :CLEANUP-ERRORS NIL :WORKER-ERRORS (NIL NIL NIL NIL) :WORKER-COPIED-COUNTS
 (3 2 3 1) :COPY-RESULTS
 ((:STATUS :OK :ENTRY
   (:PATH #A((23) BASE-CHAR . "processes/0/report.lisp") :SOURCE
    #A((192) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-40-gzip-budget-exact-boundary/inputs/records/ok.lisp")
    :BYTES 410 :SHA256
    "47c6a080044c043439b081e8a718a0e40c7a2c820f1dfa23c4bd289533570fb0"))
  (:STATUS :OK :ENTRY
   (:PATH #A((23) BASE-CHAR . "processes/1/report.lisp") :SOURCE
    #A((196) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-40-gzip-budget-exact-boundary/inputs/records/failed.lisp")
    :BYTES 428 :SHA256
    "9f83f8ac1a1bf99e39ea6af977d8d532e82613d74103b6ae8081662f5429e3aa"))
  (:STATUS :OK :ENTRY
   (:PATH #A((23) BASE-CHAR . "processes/2/report.lisp") :SOURCE
    #A((197) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-40-gzip-budget-exact-boundary/inputs/records/changed.lisp")
    :BYTES 438 :SHA256
    "dbca9d4a05c4aac5b5523019de2c23aa35f35eb13e03cc769c0efb6d57b4d8e4"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/gzip/report.lisp" :SOURCE
    #A((201) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-40-gzip-budget-exact-boundary/inputs/records/gzip/report.lisp")
    :BYTES 310 :SHA256
    "7fffabb3167db69650d50d628155f39e98cb3e024fee539654db92821ab3e0ff"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/gzip/report.lisp.gz" :SOURCE
    #A((204) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-40-gzip-budget-exact-boundary/inputs/records/gzip/report.lisp.gz")
    :BYTES 286 :SHA256
    "aaf242eb91dbb470a65dfb76931d425e7a66f57d984a48f9704f71a46bcd13e9"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/data.gz" :SOURCE
    #A((189) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-40-gzip-budget-exact-boundary/inputs/raw/data.bin")
    :BYTES 8388608 :SHA256
    "cdddc46149beec05c8484353f3dbcb27546e6f607697131921b0c14614ae05dd"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/.hidden.txt" :SOURCE
    #A((192) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-40-gzip-budget-exact-boundary/inputs/raw/.hidden.txt")
    :BYTES 22 :SHA256
    "6e26b55a3fb204d9259a3c7e6a28b6ccae53f783ccca85f43765649ab9faebcd"))
  (:STATUS :OK :ENTRY
   (:PATH "collection-manifest.lisp" :SOURCE
    #A((197) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-40-gzip-budget-exact-boundary/inputs/config/manifest.lisp")
    :BYTES 1102 :SHA256
    "a8a94a9c1b8cc9c96963c736586073a2bc02e9dfe23275023ab1553ecc31322f"))
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
 #A((178) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-40-gzip-budget-exact-boundary/archive/")
 :OBSERVATIONS
 #A((183) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-40-gzip-budget-exact-boundary/observations/")
 :WORKERS 4 :SHA-PER-COPY 3 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :COMPLETED-COMMAND-RECORDS-ONLY
  :FRESH-DESTINATION-ONLY :NO-AUTO-SIDECARS-OR-TREES
  :LOCAL-PER-FILE-OBSERVATIONS :NO-ATOMICITY-OR-AUTHENTICATION
  :NO-RESULT-OR-GATE-INFERENCE :NO-MCDC-OR-RELEASE-QUALIFICATION))
