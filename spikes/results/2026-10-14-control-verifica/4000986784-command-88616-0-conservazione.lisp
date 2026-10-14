(:FINISHED-AT-UNIVERSAL-TIME 4000987063 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((102) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/4000986784-command-88616-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.90085d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1303475 :STORED-BYTES 153620
 :RESULTS
 ((:PATH
   #A((113) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/4000986784-command-88616-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1303475 :STORED-BYTES 153620 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1303475 :UNCOMPRESSED-SHA256
    \"3a70e1a958b62a3741c66cf56f0fcf446ca168536b9aaff573250f073e946d87\"
    :COMPRESSED-BYTES 153303 :COMPRESSED-SHA256
    \"2854f9547600d5237adf5cb80b447df1ae0f3687ea59fd35d9321a4e44572611\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((91) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((102) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/4000986784-command-88616-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "88616"))
 :STARTED-AT-UNIVERSAL-TIME 4000987062)
