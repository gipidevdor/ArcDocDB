(:FINISHED-AT-UNIVERSAL-TIME 4000987547 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((102) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/4000987101-command-91562-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.454258d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1193768 :STORED-BYTES 115307
 :RESULTS
 ((:PATH
   #A((113) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/4000987101-command-91562-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1193768 :STORED-BYTES 115307 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1193768 :UNCOMPRESSED-SHA256
    \"3c59dca6731cf75429e2b8d6bed458d704ab41b989c5462dedf5b43227d90845\"
    :COMPRESSED-BYTES 114990 :COMPRESSED-SHA256
    \"6d5e8e3e9a2b5f4efe740e598374fe0e15149ac5799527afd8f7a1acf81e3275\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((91) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((102) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/4000987101-command-91562-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "91562"))
 :STARTED-AT-UNIVERSAL-TIME 4000987545)
