(:FINISHED-AT-UNIVERSAL-TIME 4001076951 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((104) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/decisioni-verifica/ArcDocDB/spikes/out/4001076635-command-21532-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.891932d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1869482 :STORED-BYTES 192968
 :RESULTS
 ((:PATH
   #A((115) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/decisioni-verifica/ArcDocDB/spikes/out/4001076635-command-21532-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1869482 :STORED-BYTES 192968 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1869482 :UNCOMPRESSED-SHA256
    \"996d82a1988dd5fa3523242ca9ad0a19b0e2de4bd33e44d83f3eef080f75c515\"
    :COMPRESSED-BYTES 192651 :COMPRESSED-SHA256
    \"1e59a434d9741dac278cc6f8b19036a06e2c2848ec343b1e12e05a08dda41b65\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((93) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/decisioni-verifica/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((104) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/decisioni-verifica/ArcDocDB/spikes/out/4001076635-command-21532-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "21532"))
 :STARTED-AT-UNIVERSAL-TIME 4001076950)
