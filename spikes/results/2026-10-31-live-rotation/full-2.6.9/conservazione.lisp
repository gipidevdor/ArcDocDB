(:FINISHED-AT-UNIVERSAL-TIME 4002439143 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002438328-command-39981-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.042722d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3592834 :STORED-BYTES 337965
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002438328-command-39981-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3592834 :STORED-BYTES 337965 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3592834 :UNCOMPRESSED-SHA256
    \"3bf9e15b0846e850d737a4268834d3c5a9b8388a256845f213b3b8e6a659dc77\"
    :COMPRESSED-BYTES 337648 :COMPRESSED-SHA256
    \"36682756682168737e3794622a4156091324e7b16748fb0973e78b634a36ee3c\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((101) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((112) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002438328-command-39981-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "39981"))
 :STARTED-AT-UNIVERSAL-TIME 4002439141)
