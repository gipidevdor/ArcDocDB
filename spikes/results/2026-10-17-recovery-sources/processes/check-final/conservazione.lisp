(:FINISHED-AT-UNIVERSAL-TIME 4001218481 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((99) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217731-command-86347-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.932272d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2600537 :STORED-BYTES 252646
 :RESULTS
 ((:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217731-command-86347-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2600537 :STORED-BYTES 252646 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2600537 :UNCOMPRESSED-SHA256
    \"0e7fffb2e36871c9f65be45a139e2f0bf62f6bfeb56cf12903b20dea9acd5805\"
    :COMPRESSED-BYTES 252329 :COMPRESSED-SHA256
    \"779955c0e717f624f8b0eb0f0b54cc02a3e581040d5a34e0ae97dc7afec02785\")))
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
  #A((99) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217731-command-86347-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "86347"))
 :STARTED-AT-UNIVERSAL-TIME 4001218479)
