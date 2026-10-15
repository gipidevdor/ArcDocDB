(:FINISHED-AT-UNIVERSAL-TIME 4001081092 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((77) BASE-CHAR
    . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001081073-command-2505-0/\")
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
  #A((67) BASE-CHAR
     . "/Users/gpicchiarelli/Documents/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((77) BASE-CHAR
     . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001081073-command-2505-0/")
  "--jobs" "4" "--finished-owner-pid" #A((4) BASE-CHAR . "2505"))
 :STARTED-AT-UNIVERSAL-TIME 4001081092)
