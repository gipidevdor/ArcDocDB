(:FINISHED-AT-UNIVERSAL-TIME 4001217260 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((99) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217236-command-75881-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.895716d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1405357 :STORED-BYTES 158565
 :RESULTS
 ((:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217236-command-75881-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1405357 :STORED-BYTES 158565 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1405357 :UNCOMPRESSED-SHA256
    \"7c6f24ff7d01e7f51cae6b769510cb6877cf35bc5ac385089debab85bc93ee59\"
    :COMPRESSED-BYTES 158248 :COMPRESSED-SHA256
    \"16718437431558784b0209b0a23e4d7b6ea02789ecad68c7345039856f82fb47\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217236-command-75881-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "75881"))
 :STARTED-AT-UNIVERSAL-TIME 4001217259)
