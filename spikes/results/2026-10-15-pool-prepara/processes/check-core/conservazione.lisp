(:FINISHED-AT-UNIVERSAL-TIME 4001078515 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((99) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001078210-command-63054-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.928454d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1764660 :STORED-BYTES 189497
 :RESULTS
 ((:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001078210-command-63054-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1764660 :STORED-BYTES 189497 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1764660 :UNCOMPRESSED-SHA256
    \"4287e0b6de2fdc76a4e8f7cde10b5fe8b915a7b8f04caafc4663eac47fe9183f\"
    :COMPRESSED-BYTES 189180 :COMPRESSED-SHA256
    \"257c7c109c5af261747202f148dc3c261c35464464ac7478be141026c1e6fb82\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001078210-command-63054-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "63054"))
 :STARTED-AT-UNIVERSAL-TIME 4001078513)
