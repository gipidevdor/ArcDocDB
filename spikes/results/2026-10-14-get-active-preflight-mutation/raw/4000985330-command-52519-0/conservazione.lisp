(:FINISHED-AT-UNIVERSAL-TIME 4000985433 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((106) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/4000985330-command-52519-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.938549d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2041456 :STORED-BYTES 591991
 :RESULTS
 ((:PATH
   #A((117) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/4000985330-command-52519-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2041456 :STORED-BYTES 591991 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2041456 :UNCOMPRESSED-SHA256
    \"c5bcc29938047165d4484136ed6645b7d988a071d133c19b93bc4328f468fac1\"
    :COMPRESSED-BYTES 591674 :COMPRESSED-SHA256
    \"d951263282472a76f8dc70631d11fb8ce52ffb2818fad7a54e5f3884d37f4bd2\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/4000985330-command-52519-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "52519"))
 :STARTED-AT-UNIVERSAL-TIME 4000985431)
