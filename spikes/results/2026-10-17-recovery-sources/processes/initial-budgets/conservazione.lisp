(:FINISHED-AT-UNIVERSAL-TIME 4001217328 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((99) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217279-command-77284-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.800297d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2398783 :STORED-BYTES 228510
 :RESULTS
 ((:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217279-command-77284-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2398783 :STORED-BYTES 228510 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2398783 :UNCOMPRESSED-SHA256
    \"2a28786e09da2d0537c5c87dc6ef0a149a7aae1777a1abd0f365be270f3b3ed1\"
    :COMPRESSED-BYTES 228193 :COMPRESSED-SHA256
    \"1ca1be09c5626cb19f783da2b23639f8624928ad47982470cd6247d94c2f2555\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217279-command-77284-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "77284"))
 :STARTED-AT-UNIVERSAL-TIME 4001217327)
