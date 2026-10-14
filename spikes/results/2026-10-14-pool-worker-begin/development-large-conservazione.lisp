(:FINISHED-AT-UNIVERSAL-TIME 4000996603 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((114) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-publication-staging/4000996600-48581/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 2.42476d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2770929 :STORED-BYTES 396155
 :RESULTS
 ((:PATH
   #A((138) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-publication-staging/4000996600-48581/development-large-1.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2770929 :STORED-BYTES 396155 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"development-large-1.lisp.gz\" :UNCOMPRESSED-BYTES 2770929
    :UNCOMPRESSED-SHA256
    \"2a9e78be5b78e1972366cdd16a57a209de7cb202d2a319f649e361203a70fbbb\"
    :COMPRESSED-BYTES 395825 :COMPRESSED-SHA256
    \"13cc0e9eb8368009c50ab59b61696917e648d6ea60532ccd97af5a4ce9802cc6\")))
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
  #A((53) BASE-CHAR . "spikes/out/pool-publication-staging/4000996600-48581/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "48581"))
 :STARTED-AT-UNIVERSAL-TIME 4000996600)
