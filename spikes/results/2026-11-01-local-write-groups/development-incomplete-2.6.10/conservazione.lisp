(:FINISHED-AT-UNIVERSAL-TIME 4002502615 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002502389-command-76958-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.877875d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3397804 :STORED-BYTES 329780
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002502389-command-76958-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3397804 :STORED-BYTES 329780 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3397804 :UNCOMPRESSED-SHA256
    \"6a36c4933786b81de5a1a35b0defe0f858ec30f1c8eef1aa6eefd1946c0221eb\"
    :COMPRESSED-BYTES 329463 :COMPRESSED-SHA256
    \"538b9da89e3d95167c17f111ecb7da793d125fa344b0c416f409b1e72e4b878f\")))
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
  #A((112) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002502389-command-76958-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "76958"))
 :STARTED-AT-UNIVERSAL-TIME 4002502614)
