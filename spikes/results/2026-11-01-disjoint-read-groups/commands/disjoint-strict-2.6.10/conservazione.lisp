(:FINISHED-AT-UNIVERSAL-TIME 4002541760 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((108) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/disjoint-strict-2.6.10/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.029828d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3923387 :STORED-BYTES 375053
 :RESULTS
 ((:PATH
   #A((119) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/disjoint-strict-2.6.10/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3923387 :STORED-BYTES 375053 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3923387 :UNCOMPRESSED-SHA256
    \"f357c8275270389915ee84fdbe95bc5853abe6bdbba44f7daeba03d3fb793177\"
    :COMPRESSED-BYTES 374736 :COMPRESSED-SHA256
    \"b3ec3664587ac60b3a6383192b357728d36ace2fe6e5427562de59b459d89b64\")))
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
  #A((108) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/disjoint-strict-2.6.10/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "13518"))
 :STARTED-AT-UNIVERSAL-TIME 4002541759)
