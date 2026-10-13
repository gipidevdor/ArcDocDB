(:FINISHED-AT-UNIVERSAL-TIME 4000913958 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((114) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-publication-staging/4000913955-86114/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 2.165666d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2206461 :STORED-BYTES 313883
 :RESULTS
 ((:PATH
   #A((138) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-publication-staging/4000913955-86114/development-large-1.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2206461 :STORED-BYTES 313883 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"development-large-1.lisp.gz\" :UNCOMPRESSED-BYTES 2206461
    :UNCOMPRESSED-SHA256
    \"137a6863c4d1b48806f939e85acebb96144c6b63e350a478073deca9f6a88907\"
    :COMPRESSED-BYTES 313553 :COMPRESSED-SHA256
    \"610ce8547fb0c5447c24676a3e22d9427682ecc474c48db2fb5689c31076b60c\")))
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
  #A((53) BASE-CHAR . "spikes/out/pool-publication-staging/4000913955-86114/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "86114"))
 :STARTED-AT-UNIVERSAL-TIME 4000913955)
