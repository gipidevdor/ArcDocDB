(:FINISHED-AT-UNIVERSAL-TIME 4001086192 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((100) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085707-command-52310-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.954484d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2014637 :STORED-BYTES 207399
 :RESULTS
 ((:PATH
   #A((111) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085707-command-52310-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2014637 :STORED-BYTES 207399 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2014637 :UNCOMPRESSED-SHA256
    \"106e705f30957418713860113ee7ff680149fd84defc4665a7777df39fc23de7\"
    :COMPRESSED-BYTES 207082 :COMPRESSED-SHA256
    \"447b3e43c86716b12700e21e762a816c9ff4ecc39f614eb35eebce25545acfde\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085707-command-52310-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "52310"))
 :STARTED-AT-UNIVERSAL-TIME 4001086190)
