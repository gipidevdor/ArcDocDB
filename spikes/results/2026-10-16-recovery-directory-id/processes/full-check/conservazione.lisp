(:FINISHED-AT-UNIVERSAL-TIME 4001155112 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((99) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001154602-command-91340-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.859215d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2059363 :STORED-BYTES 212660
 :RESULTS
 ((:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001154602-command-91340-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2059363 :STORED-BYTES 212660 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2059363 :UNCOMPRESSED-SHA256
    \"99661fed70815e2de1a5be4d184200655ec1e61c5ec4a764b2de5a666baf3ddc\"
    :COMPRESSED-BYTES 212343 :COMPRESSED-SHA256
    \"6496ef4a4ca110d8baeedbc3d0adb853ca90cd8550125f7d55bf5b0a94e2ef3f\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((88) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((99) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001154602-command-91340-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "91340"))
 :STARTED-AT-UNIVERSAL-TIME 4001155111)
