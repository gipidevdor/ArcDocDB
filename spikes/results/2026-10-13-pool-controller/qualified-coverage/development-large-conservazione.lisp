(:FINISHED-AT-UNIVERSAL-TIME 4000908559 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((114) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-publication-staging/4000908557-86601/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.822602d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1971270 :STORED-BYTES 281427
 :RESULTS
 ((:PATH
   #A((138) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-publication-staging/4000908557-86601/development-large-1.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1971270 :STORED-BYTES 281427 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"development-large-1.lisp.gz\" :UNCOMPRESSED-BYTES 1971270
    :UNCOMPRESSED-SHA256
    \"ede3a43fb5be25b844103817000d8c14a365843dc694df2ea8d9514bfff3306d\"
    :COMPRESSED-BYTES 281097 :COMPRESSED-SHA256
    \"632c57b55168b5b0e95d5983542b480dacd3a2b5f0c61d61322453bd1fa5749b\")))
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
  #A((53) BASE-CHAR . "spikes/out/pool-publication-staging/4000908557-86601/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "86601"))
 :STARTED-AT-UNIVERSAL-TIME 4000908557)
