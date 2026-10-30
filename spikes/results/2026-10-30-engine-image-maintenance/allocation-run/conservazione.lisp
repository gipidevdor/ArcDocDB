(:FINISHED-AT-UNIVERSAL-TIME 4002376516 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((87) BASE-CHAR
    . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/engine-image-maintenance-allocation/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 0 :WALL-SECONDS 1.0d-6
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 0 :STORED-BYTES 0 :RESULTS NIL
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((36) BASE-CHAR . "/Users/gpicchiarelli/.local/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((67) BASE-CHAR
     . "/Users/gpicchiarelli/Documents/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((87) BASE-CHAR
     . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/engine-image-maintenance-allocation/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "19144"))
 :STARTED-AT-UNIVERSAL-TIME 4002376516)
