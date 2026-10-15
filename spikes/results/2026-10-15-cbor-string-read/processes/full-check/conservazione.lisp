(:FINISHED-AT-UNIVERSAL-TIME 4001085630 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((111) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001085107-command-33694-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.799277d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2028151 :STORED-BYTES 207158
 :RESULTS
 ((:PATH
   #A((122) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001085107-command-33694-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2028151 :STORED-BYTES 207158 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2028151 :UNCOMPRESSED-SHA256
    \"02a9e9b84a9770a644dbef8570b0344ab214e3e0430136f07b3684893158012e\"
    :COMPRESSED-BYTES 206841 :COMPRESSED-SHA256
    \"2b967acb602c23d4cb861a79b6a099a2b8db03863c43c715f0169678e951e522\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((100) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((111) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001085107-command-33694-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "33694"))
 :STARTED-AT-UNIVERSAL-TIME 4001085628)
