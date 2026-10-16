(:FINISHED-AT-UNIVERSAL-TIME 4001157001 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((111) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001156462-command-39221-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.946856d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2245720 :STORED-BYTES 222019
 :RESULTS
 ((:PATH
   #A((122) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001156462-command-39221-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2245720 :STORED-BYTES 222019 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2245720 :UNCOMPRESSED-SHA256
    \"5b657b6897158836e74075282f69bf5535687ab8a19a42bfddc00698e77750d3\"
    :COMPRESSED-BYTES 221702 :COMPRESSED-SHA256
    \"1279ed67060600be620c9332e3c445473abe8b788e4359d6847ac6603a7a04fc\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001156462-command-39221-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "39221"))
 :STARTED-AT-UNIVERSAL-TIME 4001157000)
