(:FINISHED-AT-UNIVERSAL-TIME 4001163132 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((99) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001163107-command-40055-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.316989d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1775850 :STORED-BYTES 164532
 :RESULTS
 ((:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001163107-command-40055-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1775850 :STORED-BYTES 164532 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1775850 :UNCOMPRESSED-SHA256
    \"ee5d3c88af9c52bea3d8447f6602be71de796e11af0767c5c4ee027cbaead40a\"
    :COMPRESSED-BYTES 164215 :COMPRESSED-SHA256
    \"18f089b7ec7dfe0a237f86e7593088ee428a2a8ed08110ce85f4b7bbaef321ac\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001163107-command-40055-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "40055"))
 :STARTED-AT-UNIVERSAL-TIME 4001163131)
