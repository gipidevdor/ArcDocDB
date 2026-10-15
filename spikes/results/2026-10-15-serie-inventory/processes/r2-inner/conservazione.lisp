(:FINISHED-AT-UNIVERSAL-TIME 4001085486 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((100) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085441-command-45779-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.8872d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1916911 :STORED-BYTES 192243
 :RESULTS
 ((:PATH
   #A((111) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085441-command-45779-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1916911 :STORED-BYTES 192243 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1916911 :UNCOMPRESSED-SHA256
    \"ca64bce8229ffc955b921adfd715d1b809997239ad234753d86ae10e3ec0211d\"
    :COMPRESSED-BYTES 191926 :COMPRESSED-SHA256
    \"7e388ff4eb98261a826a7f6dfdd22da687e0df19a22592ff936f0e3e13881af2\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((89) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((100) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085441-command-45779-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "45779"))
 :STARTED-AT-UNIVERSAL-TIME 4001085484)
