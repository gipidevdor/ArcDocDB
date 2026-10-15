(:FINISHED-AT-UNIVERSAL-TIME 4001078980 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((114) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-publication-staging/4001078977-75907/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 2.784928d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3218392 :STORED-BYTES 460454
 :RESULTS
 ((:PATH
   #A((138) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-publication-staging/4001078977-75907/development-large-1.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3218392 :STORED-BYTES 460454 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"development-large-1.lisp.gz\" :UNCOMPRESSED-BYTES 3218392
    :UNCOMPRESSED-SHA256
    \"efaea5241ca8569b1794ca777aa5f7bcd88667ee9887ab85654613bb35495b4a\"
    :COMPRESSED-BYTES 460124 :COMPRESSED-SHA256
    \"0a267b4e66c952079f7e5bf7b842353d490c7496ca37f3827ff7768664e35a23\")))
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
  #A((53) BASE-CHAR . "spikes/out/pool-publication-staging/4001078977-75907/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "75907"))
 :STARTED-AT-UNIVERSAL-TIME 4001078977)
