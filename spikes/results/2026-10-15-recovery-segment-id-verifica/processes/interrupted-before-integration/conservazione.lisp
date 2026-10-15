(:FINISHED-AT-UNIVERSAL-TIME 4001085283 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((99) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001085243-command-38399-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.245322d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1840543 :STORED-BYTES 175712
 :RESULTS
 ((:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001085243-command-38399-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1840543 :STORED-BYTES 175712 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1840543 :UNCOMPRESSED-SHA256
    \"6c563122b93b0207427547f11a7977e72d214142a69f0555e1900a0c8f74c7ed\"
    :COMPRESSED-BYTES 175395 :COMPRESSED-SHA256
    \"93323fba7251227fff02f68d483239d791fe7d2666ced43f5e19bfed80b2126b\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001085243-command-38399-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "38399"))
 :STARTED-AT-UNIVERSAL-TIME 4001085281)
