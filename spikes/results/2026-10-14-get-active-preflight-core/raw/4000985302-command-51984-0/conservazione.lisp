(:FINISHED-AT-UNIVERSAL-TIME 4000985558 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((106) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/4000985302-command-51984-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.800369d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1137235 :STORED-BYTES 143780
 :RESULTS
 ((:PATH
   #A((117) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/4000985302-command-51984-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1137235 :STORED-BYTES 143780 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1137235 :UNCOMPRESSED-SHA256
    \"89ef215707f45315693b5da10fd465f5257ed19a1718ee524ab04487c4b551e4\"
    :COMPRESSED-BYTES 143463 :COMPRESSED-SHA256
    \"def2e7349caf1b6acf8ffab227701009ec5d2aa00f8de6dcad6529c78d359dcd\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((95) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((106) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/4000985302-command-51984-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "51984"))
 :STARTED-AT-UNIVERSAL-TIME 4000985557)
