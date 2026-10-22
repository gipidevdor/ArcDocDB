(:FINISHED-AT-UNIVERSAL-TIME 4001676975 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((99) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001676406-command-36822-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.015713d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2652225 :STORED-BYTES 260201
 :RESULTS
 ((:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001676406-command-36822-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2652225 :STORED-BYTES 260201 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2652225 :UNCOMPRESSED-SHA256
    \"b6ade67b102de66c1e168c7596b8a30bad60d88a4540b94e04e124208a714822\"
    :COMPRESSED-BYTES 259884 :COMPRESSED-SHA256
    \"c703a80042502b2b24b257952f3bfac8784dfc670d9e250cd3a12c7934906418\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001676406-command-36822-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "36822"))
 :STARTED-AT-UNIVERSAL-TIME 4001676974)
