(:FINISHED-AT-UNIVERSAL-TIME 4002438789 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002438329-command-39987-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.047055d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3371365 :STORED-BYTES 320954
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002438329-command-39987-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3371365 :STORED-BYTES 320954 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3371365 :UNCOMPRESSED-SHA256
    \"e4e24727bb39f5c680a001952ed3ac9f2aeb378028ca2b9c6999f620826e21fe\"
    :COMPRESSED-BYTES 320637 :COMPRESSED-SHA256
    \"f0be4cc5277ee7a20e8702899140cebd7ca2fec40417d2693843ddc8c6aa9fcf\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002438329-command-39987-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "39987"))
 :STARTED-AT-UNIVERSAL-TIME 4002438787)
