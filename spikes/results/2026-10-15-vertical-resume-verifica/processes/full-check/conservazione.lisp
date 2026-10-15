(:FINISHED-AT-UNIVERSAL-TIME 4001082974 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((98) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001082477-command-7214-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.808825d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2008680 :STORED-BYTES 206687
 :RESULTS
 ((:PATH
   #A((109) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001082477-command-7214-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2008680 :STORED-BYTES 206687 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2008680 :UNCOMPRESSED-SHA256
    \"512ffef3282e007ac2c5dad8eb091477753b11700eb1899db5709c5ade4fd48b\"
    :COMPRESSED-BYTES 206370 :COMPRESSED-SHA256
    \"92ff7df05b334df14ff362630802f4c5bfc58e4a4028a89253bd46c7ebf8b40c\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((88) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((98) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001082477-command-7214-0/")
  "--jobs" "4" "--finished-owner-pid" #A((4) BASE-CHAR . "7214"))
 :STARTED-AT-UNIVERSAL-TIME 4001082973)
