(:FINISHED-AT-UNIVERSAL-TIME 4001161515 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((99) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001161033-command-95948-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.828935d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2465268 :STORED-BYTES 241870
 :RESULTS
 ((:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001161033-command-95948-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2465268 :STORED-BYTES 241870 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2465268 :UNCOMPRESSED-SHA256
    \"d7ce26561492a00facfc02859acde887a6e65010ea85a1be39ced2aea780e379\"
    :COMPRESSED-BYTES 241553 :COMPRESSED-SHA256
    \"4b89041257fec72d2599d00a562f1b8655fa3f0b35322903f244c28a686a2503\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((88) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((99) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001161033-command-95948-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "95948"))
 :STARTED-AT-UNIVERSAL-TIME 4001161514)
