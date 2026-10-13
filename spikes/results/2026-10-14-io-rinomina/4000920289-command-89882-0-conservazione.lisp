(:FINISHED-AT-UNIVERSAL-TIME 4000920324 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((97) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/io-rinomina/ArcDocDB/spikes/out/4000920289-command-89882-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.947412d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1061135 :STORED-BYTES 130140
 :RESULTS
 ((:PATH
   #A((108) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/io-rinomina/ArcDocDB/spikes/out/4000920289-command-89882-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1061135 :STORED-BYTES 130140 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1061135 :UNCOMPRESSED-SHA256
    \"e8a01f8e550aea4966308a0137a1753713ef7cbe6ceb79897c20dfd174389563\"
    :COMPRESSED-BYTES 129823 :COMPRESSED-SHA256
    \"e302450d55fbbf0c36c6b3b149ede48fdd65b2d037825b54534fd9e5020511a0\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((86) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/io-rinomina/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((97) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/io-rinomina/ArcDocDB/spikes/out/4000920289-command-89882-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "89882"))
 :STARTED-AT-UNIVERSAL-TIME 4000920323)
