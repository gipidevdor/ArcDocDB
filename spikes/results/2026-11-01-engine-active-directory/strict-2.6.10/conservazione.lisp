(:FINISHED-AT-UNIVERSAL-TIME 4002491652 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002490826-command-53800-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.054846d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3557699 :STORED-BYTES 337943
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002490826-command-53800-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3557699 :STORED-BYTES 337943 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3557699 :UNCOMPRESSED-SHA256
    \"1b44682fbe3b6c956b7db0f54aa0f45209fa500ce6933812fc3af995e90fba0a\"
    :COMPRESSED-BYTES 337626 :COMPRESSED-SHA256
    \"c4dcadb60884e228400c4f452ebe5cef38c478c0a0b94e3f547908c08af49e1a\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/Users/gpicchiarelli/.local/sbcl/2.6.10/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((101) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((112) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002490826-command-53800-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "53800"))
 :STARTED-AT-UNIVERSAL-TIME 4002491650)
