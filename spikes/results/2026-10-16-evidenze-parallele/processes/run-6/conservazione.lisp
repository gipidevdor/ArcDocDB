(:FINISHED-AT-UNIVERSAL-TIME 4001156332 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((111) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001156102-command-25998-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.984902d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2213538 :STORED-BYTES 218319
 :RESULTS
 ((:PATH
   #A((122) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001156102-command-25998-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2213538 :STORED-BYTES 218319 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2213538 :UNCOMPRESSED-SHA256
    \"21da3326724ad3ce03957bea7b10d55906aa30b46e3b48a9774ee7c31fa392eb\"
    :COMPRESSED-BYTES 218002 :COMPRESSED-SHA256
    \"f343493b446a30df2aefdbff9eb202554fc3f7eca50665f49e9a7a1f06859d75\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001156102-command-25998-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "25998"))
 :STARTED-AT-UNIVERSAL-TIME 4001156330)
