(:FINISHED-AT-UNIVERSAL-TIME 4001217402 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((111) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001217292-command-77774-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.020999d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2541897 :STORED-BYTES 240297
 :RESULTS
 ((:PATH
   #A((122) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001217292-command-77774-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2541897 :STORED-BYTES 240297 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2541897 :UNCOMPRESSED-SHA256
    \"11df32e2c440c2a7282ccbdb70edb27ba8b52a4774b973cbf6f3691d272aac09\"
    :COMPRESSED-BYTES 239980 :COMPRESSED-SHA256
    \"4985878f86ee49c01466196d6b9de0e786a9b1e26852e44e844de0f4a2c360c4\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001217292-command-77774-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "77774"))
 :STARTED-AT-UNIVERSAL-TIME 4001217400)
