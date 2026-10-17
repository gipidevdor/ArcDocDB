(:FINISHED-AT-UNIVERSAL-TIME 4001222106 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((99) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001221586-command-68690-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.92928d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2629634 :STORED-BYTES 257429
 :RESULTS
 ((:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001221586-command-68690-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2629634 :STORED-BYTES 257429 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2629634 :UNCOMPRESSED-SHA256
    \"5ed5b77f4d868c51e194d2eb2ad3c6f07e12863d5e6ea304c5a043e21c0b59af\"
    :COMPRESSED-BYTES 257112 :COMPRESSED-SHA256
    \"a637226e3eb17c4f2997c3a9ffff063d032eba7b03ce6fd23b718f3e9aaf0bdb\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001221586-command-68690-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "68690"))
 :STARTED-AT-UNIVERSAL-TIME 4001222105)
