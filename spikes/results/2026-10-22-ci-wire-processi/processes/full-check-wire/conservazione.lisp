(:FINISHED-AT-UNIVERSAL-TIME 4001237019 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((99) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001236478-command-63957-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.971228d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2652291 :STORED-BYTES 260206
 :RESULTS
 ((:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001236478-command-63957-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2652291 :STORED-BYTES 260206 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2652291 :UNCOMPRESSED-SHA256
    \"373a3ccb50ac451801fd8dbb6347d51ddf6c5b5e232cc13493738f091201fa78\"
    :COMPRESSED-BYTES 259889 :COMPRESSED-SHA256
    \"2e0d98a287286211f6122c0389e9a29a49c11c6017c8ac2a89a55d65b1fa1a8b\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001236478-command-63957-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "63957"))
 :STARTED-AT-UNIVERSAL-TIME 4001237018)
