(:FINISHED-AT-UNIVERSAL-TIME 4001155487 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((111) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001155302-command-11195-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.84195d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2041479 :STORED-BYTES 208781
 :RESULTS
 ((:PATH
   #A((122) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001155302-command-11195-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2041479 :STORED-BYTES 208781 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2041479 :UNCOMPRESSED-SHA256
    \"b27b6cdf9314585787978adadc72a863544065b8126fab64bd0131c7f04fbddb\"
    :COMPRESSED-BYTES 208464 :COMPRESSED-SHA256
    \"be8baa71010afbe18591133a68e08bfca0d2dadb55d7f7f9b5da501f2d3805bd\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((100) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((111) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001155302-command-11195-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "11195"))
 :STARTED-AT-UNIVERSAL-TIME 4001155486)
