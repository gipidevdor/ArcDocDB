(:FINISHED-AT-UNIVERSAL-TIME 4001078552 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((111) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078089-command-58445-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.893096d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1800155 :STORED-BYTES 190821
 :RESULTS
 ((:PATH
   #A((122) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078089-command-58445-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1800155 :STORED-BYTES 190821 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1800155 :UNCOMPRESSED-SHA256
    \"7f904e4b6e72c3bb85aad2770dbf40e2d4286cb9a4fed17a8315ff3020f38751\"
    :COMPRESSED-BYTES 190504 :COMPRESSED-SHA256
    \"559f6c96926ebe07e4cf1be3cc5b8a38698d69dc3c6ed6ba5dafcac5d80037ca\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078089-command-58445-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "58445"))
 :STARTED-AT-UNIVERSAL-TIME 4001078551)
