(:FINISHED-AT-UNIVERSAL-TIME 4001155322 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((98) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001155214-command-8037-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.841662d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2001572 :STORED-BYTES 204414
 :RESULTS
 ((:PATH
   #A((109) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001155214-command-8037-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2001572 :STORED-BYTES 204414 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2001572 :UNCOMPRESSED-SHA256
    \"772ef6efe8d5e96b5a7ce27ac156fa809ebfbb8f6c45c18171ac900560a8a3b2\"
    :COMPRESSED-BYTES 204097 :COMPRESSED-SHA256
    \"3786be4bb310cebaadf88ccc69ef4ddbf6709788d5d50a87da12fef3beb0bb2f\")))
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
  #A((98) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001155214-command-8037-0/")
  "--jobs" "4" "--finished-owner-pid" #A((4) BASE-CHAR . "8037"))
 :STARTED-AT-UNIVERSAL-TIME 4001155320)
