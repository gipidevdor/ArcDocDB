(:DIAGNOSTIC
 #A((219) BASE-CHAR
    . "Raccolta rifiutata :COPIED-BYTES: /Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-48-corrupt-copy-retains-failure/archive/raw/data.bin.")
 :REASON :COPIED-BYTES :CLEANUP-ERRORS NIL :WORKER-ERRORS (NIL NIL NIL NIL)
 :WORKER-COPIED-COUNTS (2 3 3 1) :COPY-RESULTS
 ((:STATUS :OK :ENTRY
   (:PATH #A((23) BASE-CHAR . "processes/0/report.lisp") :SOURCE
    #A((186) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-48-corrupt-copy-retains-failure/inputs/records/ok.lisp")
    :BYTES 410 :SHA256
    "47c6a080044c043439b081e8a718a0e40c7a2c820f1dfa23c4bd289533570fb0"))
  (:STATUS :OK :ENTRY
   (:PATH #A((23) BASE-CHAR . "processes/1/report.lisp") :SOURCE
    #A((190) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-48-corrupt-copy-retains-failure/inputs/records/failed.lisp")
    :BYTES 428 :SHA256
    "9f83f8ac1a1bf99e39ea6af977d8d532e82613d74103b6ae8081662f5429e3aa"))
  (:STATUS :OK :ENTRY
   (:PATH #A((23) BASE-CHAR . "processes/2/report.lisp") :SOURCE
    #A((191) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-48-corrupt-copy-retains-failure/inputs/records/changed.lisp")
    :BYTES 438 :SHA256
    "dbca9d4a05c4aac5b5523019de2c23aa35f35eb13e03cc769c0efb6d57b4d8e4"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/gzip/report.lisp" :SOURCE
    #A((195) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-48-corrupt-copy-retains-failure/inputs/records/gzip/report.lisp")
    :BYTES 310 :SHA256
    "7fffabb3167db69650d50d628155f39e98cb3e024fee539654db92821ab3e0ff"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/gzip/report.lisp.gz" :SOURCE
    #A((198) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-48-corrupt-copy-retains-failure/inputs/records/gzip/report.lisp.gz")
    :BYTES 286 :SHA256
    "aaf242eb91dbb470a65dfb76931d425e7a66f57d984a48f9704f71a46bcd13e9"))
  (:STATUS :FAILED :REASON :COPIED-BYTES :DETAIL
   #A((184) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-48-corrupt-copy-retains-failure/archive/raw/data.bin"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/.hidden.txt" :SOURCE
    #A((186) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-48-corrupt-copy-retains-failure/inputs/raw/.hidden.txt")
    :BYTES 22 :SHA256
    "6e26b55a3fb204d9259a3c7e6a28b6ccae53f783ccca85f43765649ab9faebcd"))
  (:STATUS :OK :ENTRY
   (:PATH "collection-manifest.lisp" :SOURCE
    #A((191) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-48-corrupt-copy-retains-failure/inputs/config/manifest.lisp")
    :BYTES 1106 :SHA256
    "bbe12f9f2b5e73effe20cb4422b1393ec8dece401bee283b5426d0416e200fc2"))
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
 :FAILED :PHASE :JOINED :DESTINATION
 #A((172) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-48-corrupt-copy-retains-failure/archive/")
 :OBSERVATIONS
 #A((177) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-48-corrupt-copy-retains-failure/observations/")
 :WORKERS 4 :SHA-PER-COPY 3 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :COMPLETED-COMMAND-RECORDS-ONLY
  :FRESH-DESTINATION-ONLY :NO-AUTO-SIDECARS-OR-TREES
  :LOCAL-PER-FILE-OBSERVATIONS :NO-ATOMICITY-OR-AUTHENTICATION
  :NO-RESULT-OR-GATE-INFERENCE :NO-MCDC-OR-RELEASE-QUALIFICATION))
