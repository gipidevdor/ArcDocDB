(:FINISHED-AT-UNIVERSAL-TIME 4000999733 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((105) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/control-transizione/ArcDocDB/spikes/out/4000999455-command-80563-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.73675d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1501962 :STORED-BYTES 168696
 :RESULTS
 ((:PATH
   #A((116) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/control-transizione/ArcDocDB/spikes/out/4000999455-command-80563-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1501962 :STORED-BYTES 168696 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1501962 :UNCOMPRESSED-SHA256
    \"1b9cf76179a9c5c3a8d523b4ed5cd5fe1827b96bc4375f4313f934f8ba4f700d\"
    :COMPRESSED-BYTES 168379 :COMPRESSED-SHA256
    \"b4170d7c170747a9bd4874355b8da945cbb51e3b6d9f2adda149cf9be8d3cbab\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((94) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/control-transizione/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((105) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/control-transizione/ArcDocDB/spikes/out/4000999455-command-80563-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "80563"))
 :STARTED-AT-UNIVERSAL-TIME 4000999732)
