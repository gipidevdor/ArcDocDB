(:FINISHED-AT-UNIVERSAL-TIME 4000921798 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((97) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/io-rinomina/ArcDocDB/spikes/out/4000921558-command-98947-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.712197d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1121265 :STORED-BYTES 140899
 :RESULTS
 ((:PATH
   #A((108) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/io-rinomina/ArcDocDB/spikes/out/4000921558-command-98947-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1121265 :STORED-BYTES 140899 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1121265 :UNCOMPRESSED-SHA256
    \"41a4c0383456318f5974f478d90c71ad198bd277e00291f72ef2fe146391a170\"
    :COMPRESSED-BYTES 140582 :COMPRESSED-SHA256
    \"38cca09c3f9bb2995c24d640c4e50b8f27573df68937ccd5226f1d8a56f16530\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/io-rinomina/ArcDocDB/spikes/out/4000921558-command-98947-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "98947"))
 :STARTED-AT-UNIVERSAL-TIME 4000921797)
