(:FINISHED-AT-UNIVERSAL-TIME 4000911894 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((114) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-publication-staging/4000911891-27462/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 2.233414d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3170578 :STORED-BYTES 303881
 :RESULTS
 ((:PATH
   #A((138) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-publication-staging/4000911891-27462/development-large-1.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2121078 :STORED-BYTES 302125 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"development-large-1.lisp.gz\" :UNCOMPRESSED-BYTES 2121078
    :UNCOMPRESSED-SHA256
    \"49dd51d5e53d2497a747bc56806870fcbb2629cd9d67e81a9f3df71b72c2bc59\"
    :COMPRESSED-BYTES 301795 :COMPRESSED-SHA256
    \"c85e4f5380e6a3d0041d56f265afcba8fd91d2d5da7a49a5bbdb58f4f3b02735\"))
  (:PATH
   #A((138) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-publication-staging/4000911891-27462/development-large-2.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1049500 :STORED-BYTES 1756 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"development-large-2.lisp.gz\" :UNCOMPRESSED-BYTES 1049500
    :UNCOMPRESSED-SHA256
    \"0fc733f8de0f6d551f8ea9e4f4247a761ba3e786942cb41f0f03f30d74a5f545\"
    :COMPRESSED-BYTES 1428 :COMPRESSED-SHA256
    \"a0f1b0d26f42a5f5f6e62faffbba7abdea54b2e02ecfbb1cc37e815d76f88f4d\")))
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
  #A((53) BASE-CHAR . "spikes/out/pool-publication-staging/4000911891-27462/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "27462"))
 :STARTED-AT-UNIVERSAL-TIME 4000911891)
