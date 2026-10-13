(:FINISHED-AT-UNIVERSAL-TIME 4000919342 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((97) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/io-rinomina/ArcDocDB/spikes/out/4000919308-command-88181-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.9652d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1060271 :STORED-BYTES 130249
 :RESULTS
 ((:PATH
   #A((108) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/io-rinomina/ArcDocDB/spikes/out/4000919308-command-88181-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1060271 :STORED-BYTES 130249 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1060271 :UNCOMPRESSED-SHA256
    \"00ec35134ce4819eed1a3c48a42a982e54797034957bcff6366ff6bad5e6e0af\"
    :COMPRESSED-BYTES 129932 :COMPRESSED-SHA256
    \"d301920a3942fe0dc7fcbb945d2b69fe421eb0e63739efb393a84ea51ee0b291\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((86) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/io-rinomina/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((97) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/io-rinomina/ArcDocDB/spikes/out/4000919308-command-88181-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "88181"))
 :STARTED-AT-UNIVERSAL-TIME 4000919341)
