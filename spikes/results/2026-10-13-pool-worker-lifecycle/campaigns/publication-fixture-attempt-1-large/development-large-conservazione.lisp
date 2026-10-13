(:FINISHED-AT-UNIVERSAL-TIME 4000911350 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((114) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-publication-staging/4000911348-22259/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.977325d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1049500 :STORED-BYTES 1752
 :RESULTS
 ((:PATH
   #A((138) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-publication-staging/4000911348-22259/development-large-1.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1049500 :STORED-BYTES 1752 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"development-large-1.lisp.gz\" :UNCOMPRESSED-BYTES 1049500
    :UNCOMPRESSED-SHA256
    \"c8decfcbc6000f1cefb711c80a6cfdc8671307469aa8e0d45d0aa45d04817146\"
    :COMPRESSED-BYTES 1424 :COMPRESSED-SHA256
    \"be20108cea8d7500c515206c4de4d60f870a54fbe3b7282423d818581be35b04\")))
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
  #A((53) BASE-CHAR . "spikes/out/pool-publication-staging/4000911348-22259/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "22259"))
 :STARTED-AT-UNIVERSAL-TIME 4000911348)
