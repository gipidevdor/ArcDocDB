(:FINISHED-AT-UNIVERSAL-TIME 4001237709 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((99) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001237079-command-78685-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.001235d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2652222 :STORED-BYTES 260330
 :RESULTS
 ((:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001237079-command-78685-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2652222 :STORED-BYTES 260330 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2652222 :UNCOMPRESSED-SHA256
    \"0077b35dbccc520e46928d4348803b53e97492757883c4c1c7f38e85bf058dd3\"
    :COMPRESSED-BYTES 260013 :COMPRESSED-SHA256
    \"e7bcbda0109673ae67640d83d95397a836cab2c83345d4b2c184658e5a3b660f\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001237079-command-78685-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "78685"))
 :STARTED-AT-UNIVERSAL-TIME 4001237707)
