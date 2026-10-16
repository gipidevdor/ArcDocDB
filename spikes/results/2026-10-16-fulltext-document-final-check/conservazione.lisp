(:FINISHED-AT-UNIVERSAL-TIME 4001164622 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((99) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001164038-command-64164-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.795642d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2501977 :STORED-BYTES 245758
 :RESULTS
 ((:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001164038-command-64164-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2501977 :STORED-BYTES 245758 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2501977 :UNCOMPRESSED-SHA256
    \"9fb4c506092a8e91db8d370c2b624cf98320fba8fe00e3cd02c8725c01aa1e40\"
    :COMPRESSED-BYTES 245441 :COMPRESSED-SHA256
    \"7e8f9ced7351352926532bdda3ca740af727a94130e4261109685bde4abfe3f0\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001164038-command-64164-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "64164"))
 :STARTED-AT-UNIVERSAL-TIME 4001164621)
