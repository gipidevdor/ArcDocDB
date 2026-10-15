(:FINISHED-AT-UNIVERSAL-TIME 4001077166 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((99) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001077106-command-35002-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.8153d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1718464 :STORED-BYTES 181899
 :RESULTS
 ((:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001077106-command-35002-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1718464 :STORED-BYTES 181899 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1718464 :UNCOMPRESSED-SHA256
    \"67ba4ddc83a678ed85984b28b4bf350d9e112b0c097195be33bcdd3ec3189671\"
    :COMPRESSED-BYTES 181582 :COMPRESSED-SHA256
    \"dce340a4bbe3085c0645fb1db8c9550db9c4711b5a17b57ed791c72b0dc3f68b\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001077106-command-35002-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "35002"))
 :STARTED-AT-UNIVERSAL-TIME 4001077165)
