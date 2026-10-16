(:FINISHED-AT-UNIVERSAL-TIME 4001159114 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((99) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001159089-command-40299-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.938312d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2147972 :STORED-BYTES 190832
 :RESULTS
 ((:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001159089-command-40299-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2147972 :STORED-BYTES 190832 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2147972 :UNCOMPRESSED-SHA256
    \"4f423d672923009c407740699d6354c738e239f17b0cb36b1aab05885fc4031c\"
    :COMPRESSED-BYTES 190515 :COMPRESSED-SHA256
    \"b9b8d058b919d58185005cb5eecfada87cd012da6391fcb8fb86a74a95236a85\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001159089-command-40299-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "40299"))
 :STARTED-AT-UNIVERSAL-TIME 4001159113)
