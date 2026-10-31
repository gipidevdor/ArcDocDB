(:FINISHED-AT-UNIVERSAL-TIME 4002434609 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((111) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002434375-command-2919-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.140124d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3236442 :STORED-BYTES 310813
 :RESULTS
 ((:PATH
   #A((122) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002434375-command-2919-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3236442 :STORED-BYTES 310813 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3236442 :UNCOMPRESSED-SHA256
    \"ceba93008658f29a96c7be747fd8a57f8d3692eadfa4d8b9e8c78b8554be24f4\"
    :COMPRESSED-BYTES 310496 :COMPRESSED-SHA256
    \"19f9a1107d9ecac68a66b23c552bba755ae6ce987213e2ff64d5472da817eae1\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/Users/gpicchiarelli/.local/sbcl/2.6.10/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((101) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((111) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002434375-command-2919-0/")
  "--jobs" "4" "--finished-owner-pid" #A((4) BASE-CHAR . "2919"))
 :STARTED-AT-UNIVERSAL-TIME 4002434607)
