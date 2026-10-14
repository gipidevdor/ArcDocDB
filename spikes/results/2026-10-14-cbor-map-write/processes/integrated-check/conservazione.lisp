(:FINISHED-AT-UNIVERSAL-TIME 4000986337 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((102) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986074-command-71976-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.89248d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1143722 :STORED-BYTES 144416
 :RESULTS
 ((:PATH
   #A((113) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986074-command-71976-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1143722 :STORED-BYTES 144416 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1143722 :UNCOMPRESSED-SHA256
    \"361d94bedc8178ff9db91dd8b157ac8fbce8c76708704f1c863d687a61e2b993\"
    :COMPRESSED-BYTES 144099 :COMPRESSED-SHA256
    \"69c311e9cdf6527c4a029ca3c9ba152e537ffd16e0105e61cd123953dc00b660\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((91) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((102) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986074-command-71976-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "71976"))
 :STARTED-AT-UNIVERSAL-TIME 4000986335)
