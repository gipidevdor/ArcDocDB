(:FINISHED-AT-UNIVERSAL-TIME 4001085810 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((99) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001085323-command-41709-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.754785d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2033694 :STORED-BYTES 209297
 :RESULTS
 ((:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001085323-command-41709-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2033694 :STORED-BYTES 209297 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2033694 :UNCOMPRESSED-SHA256
    \"e83c4459a7faf57043ea5f0fa58ca737ecffde8637595a8f0b6c3bf4e91de6bd\"
    :COMPRESSED-BYTES 208980 :COMPRESSED-SHA256
    \"0c63eecae357f227c0926da207d7d63b4e92e0358ad09a525271efd1f4749347\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001085323-command-41709-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "41709"))
 :STARTED-AT-UNIVERSAL-TIME 4001085809)
