(:FINISHED-AT-UNIVERSAL-TIME 4000984890 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((99) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4000984849-command-45285-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.877596d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1093635 :STORED-BYTES 138134
 :RESULTS
 ((:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4000984849-command-45285-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1093635 :STORED-BYTES 138134 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1093635 :UNCOMPRESSED-SHA256
    \"bda64fa90f4f20a2d8496f5fc730908e5880e8648a0d4f2d58697c47f3f43f5c\"
    :COMPRESSED-BYTES 137817 :COMPRESSED-SHA256
    \"37eaea74c9832fc447e8e7d86210534cf247fbb39e3aa75e03fdd3da7caf703f\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4000984849-command-45285-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "45285"))
 :STARTED-AT-UNIVERSAL-TIME 4000984888)
