(:FINISHED-AT-UNIVERSAL-TIME 4001160929 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((99) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001160410-command-64733-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.856242d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2465271 :STORED-BYTES 241905
 :RESULTS
 ((:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001160410-command-64733-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2465271 :STORED-BYTES 241905 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2465271 :UNCOMPRESSED-SHA256
    \"9081570bd7e53fcf236488cb420a2819c95c93ff9d47d6189651f20a0eaaf758\"
    :COMPRESSED-BYTES 241588 :COMPRESSED-SHA256
    \"da1b99db634782ce3366cedd03da965c8e137fdb094c67c43321a19afe9d6d63\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001160410-command-64733-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "64733"))
 :STARTED-AT-UNIVERSAL-TIME 4001160928)
