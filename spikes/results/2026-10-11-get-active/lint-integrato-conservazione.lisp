(:FINISHED-AT-UNIVERSAL-TIME 4000713920 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((96) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/get-active/ArcDocDB/spikes/out/4000713916-command-25433-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 0 :WALL-SECONDS 2.0d-6
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 0 :STORED-BYTES 0 :RESULTS NIL
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((85) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-active/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((96) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-active/ArcDocDB/spikes/out/4000713916-command-25433-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "25433"))
 :STARTED-AT-UNIVERSAL-TIME 4000713919)
