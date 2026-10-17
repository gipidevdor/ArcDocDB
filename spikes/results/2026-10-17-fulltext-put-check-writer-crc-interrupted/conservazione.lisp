(:FINISHED-AT-UNIVERSAL-TIME 4001221335 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((99) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001220972-command-52326-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.752178d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2628222 :STORED-BYTES 257099
 :RESULTS
 ((:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001220972-command-52326-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2628222 :STORED-BYTES 257099 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2628222 :UNCOMPRESSED-SHA256
    \"d48326360bc54e0148c23984eaa433cfcd3d385ebec1fffd52f9c16848836af0\"
    :COMPRESSED-BYTES 256782 :COMPRESSED-SHA256
    \"dc101d4d8a456f866290bb345aa3cf0a64ca283745b4678b99f6f4f158deb525\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001220972-command-52326-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "52326"))
 :STARTED-AT-UNIVERSAL-TIME 4001221334)
