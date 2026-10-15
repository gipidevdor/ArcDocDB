(:FINISHED-AT-UNIVERSAL-TIME 4001086680 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((111) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001086588-command-70257-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.861881d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1984636 :STORED-BYTES 200635
 :RESULTS
 ((:PATH
   #A((122) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001086588-command-70257-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1984636 :STORED-BYTES 200635 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1984636 :UNCOMPRESSED-SHA256
    \"5b8708cee72be663395cc5831794c76e9519d0bfb96e6ff080bf08771dc24b2a\"
    :COMPRESSED-BYTES 200318 :COMPRESSED-SHA256
    \"124522e57ec27d91526cbab5014693dcf9a37d404f57e45cb2189a0e59a7742b\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001086588-command-70257-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "70257"))
 :STARTED-AT-UNIVERSAL-TIME 4001086679)
