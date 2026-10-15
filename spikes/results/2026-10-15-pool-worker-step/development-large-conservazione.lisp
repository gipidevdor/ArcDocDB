(:FINISHED-AT-UNIVERSAL-TIME 4001073915 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((114) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-publication-staging/4001073911-76029/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 2.9041d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2998203 :STORED-BYTES 429123
 :RESULTS
 ((:PATH
   #A((138) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-publication-staging/4001073911-76029/development-large-1.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2998203 :STORED-BYTES 429123 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"development-large-1.lisp.gz\" :UNCOMPRESSED-BYTES 2998203
    :UNCOMPRESSED-SHA256
    \"d952f027c0607260b26b440fa7abc9dffa3a3e5385c32b7dc7c6b8116e504f5e\"
    :COMPRESSED-BYTES 428793 :COMPRESSED-SHA256
    \"93a15b0efb02409cbe5320f19a20d4a0dfd3a69499c6f97229c722fc53a48fc5\")))
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
  #A((53) BASE-CHAR . "spikes/out/pool-publication-staging/4001073911-76029/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "76029"))
 :STARTED-AT-UNIVERSAL-TIME 4001073912)
