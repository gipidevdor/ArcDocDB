(:FINISHED-AT-UNIVERSAL-TIME 4001156391 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((99) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001156257-command-30765-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.813819d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2173119 :STORED-BYTES 214071
 :RESULTS
 ((:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001156257-command-30765-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2173119 :STORED-BYTES 214071 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2173119 :UNCOMPRESSED-SHA256
    \"ee3c088030271208e35bdaebd96fac604453424a97a6c1ec15f8ae47d76ac570\"
    :COMPRESSED-BYTES 213754 :COMPRESSED-SHA256
    \"42c141d3506e73a0b63c5d2842afd26d77ffa5f8a11300ae00d0a21660e94951\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001156257-command-30765-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "30765"))
 :STARTED-AT-UNIVERSAL-TIME 4001156389)
