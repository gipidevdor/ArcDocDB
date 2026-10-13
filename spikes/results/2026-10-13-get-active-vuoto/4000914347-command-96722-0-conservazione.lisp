(:FINISHED-AT-UNIVERSAL-TIME 4000914371 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((98) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/4000914347-command-96722-0/\")
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
  #A((87) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((98) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/4000914347-command-96722-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "96722"))
 :STARTED-AT-UNIVERSAL-TIME 4000914371)
