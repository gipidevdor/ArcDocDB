(:FINISHED-AT-UNIVERSAL-TIME 4000717397 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((98) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/get-directory/ArcDocDB/spikes/out/4000717359-command-7601-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 0 :WALL-SECONDS 1.0d-6
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 0 :STORED-BYTES 0 :RESULTS NIL
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((88) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-directory/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((98) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-directory/ArcDocDB/spikes/out/4000717359-command-7601-0/")
  "--jobs" "4" "--finished-owner-pid" #A((4) BASE-CHAR . "7601"))
 :STARTED-AT-UNIVERSAL-TIME 4000717396)
