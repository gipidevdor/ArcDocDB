(:FINISHED-AT-UNIVERSAL-TIME 4000914713 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((97) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/4000914618-command-4704-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.966087d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1849115 :STORED-BYTES 528288
 :RESULTS
 ((:PATH
   #A((108) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/4000914618-command-4704-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1849115 :STORED-BYTES 528288 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1849115 :UNCOMPRESSED-SHA256
    \"a85c72e08d27199c85a812d333b6e4eb747c7fd0a125d56d7570d6750f1e49c8\"
    :COMPRESSED-BYTES 527971 :COMPRESSED-SHA256
    \"c90a6f1a85ddadad32eb01bc4d7cb6d28b3c5efd6f6a059c6327ebbe317fa74d\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((87) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((97) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/4000914618-command-4704-0/")
  "--jobs" "4" "--finished-owner-pid" #A((4) BASE-CHAR . "4704"))
 :STARTED-AT-UNIVERSAL-TIME 4000914712)
