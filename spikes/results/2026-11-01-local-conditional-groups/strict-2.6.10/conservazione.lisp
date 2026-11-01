(:FINISHED-AT-UNIVERSAL-TIME 4002521976 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002521007-command-41517-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.885462d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3719980 :STORED-BYTES 354241
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002521007-command-41517-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3719980 :STORED-BYTES 354241 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3719980 :UNCOMPRESSED-SHA256
    \"22e44c0182fc874ac17a455bfe3d21c9b9002d0ec58142126469cbdd7ef476cd\"
    :COMPRESSED-BYTES 353924 :COMPRESSED-SHA256
    \"5852b1e4e49f1c27401d600df2991d48ce33a8b480ae7bf152a4f5cc6dc4e232\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002521007-command-41517-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "41517"))
 :STARTED-AT-UNIVERSAL-TIME 4002521974)
