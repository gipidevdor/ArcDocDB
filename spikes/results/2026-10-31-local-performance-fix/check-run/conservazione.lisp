(:FINISHED-AT-UNIVERSAL-TIME 4002432556 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002431729-command-84446-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.948068d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3290739 :STORED-BYTES 319404
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002431729-command-84446-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3290739 :STORED-BYTES 319404 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3290739 :UNCOMPRESSED-SHA256
    \"44d6d8a511b4fba6e8fa881260f893cd9fec531c980117a7a7b3b541a4694ce6\"
    :COMPRESSED-BYTES 319087 :COMPRESSED-SHA256
    \"d0210f4a2b1c912c87012edfe8310bbe02b94cf6b65cec63d57b566a83cffb53\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002431729-command-84446-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "84446"))
 :STARTED-AT-UNIVERSAL-TIME 4002432555)
