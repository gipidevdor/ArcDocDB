(:FINISHED-AT-UNIVERSAL-TIME 4001074131 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((111) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001074077-check-6016-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 3.385607d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57106730 :STORED-BYTES 878508
 :RESULTS
 ((:PATH
   #A((122) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001074077-check-6016-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144052 :STORED-BYTES 410958 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144052 :UNCOMPRESSED-SHA256
    \"d5226d390c2fc85959972283585049face32fcd334178134b5fd5dbb4cfc746b\"
    :COMPRESSED-BYTES 410640 :COMPRESSED-SHA256
    \"868054b05c9e701e00673468984dc7f67531e33e9aba9ea11eb7c043031c8232\"))
  (:PATH
   #A((122) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001074077-check-6016-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28962678 :STORED-BYTES 467550 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28962678 :UNCOMPRESSED-SHA256
    \"3d390eeeb11dda23e8e1dacb0eccf4779b42b6de3e82851a5fddd3eeee9b62f8\"
    :COMPRESSED-BYTES 467232 :COMPRESSED-SHA256
    \"d19d6964f90d3212e021e5fef0dcef1a48238cc5e99b0dfd786df19e4211a44e\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((103) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((111) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001074077-check-6016-0/")
  "--jobs" "4" "--finished-owner-pid" #A((4) BASE-CHAR . "6016"))
 :STARTED-AT-UNIVERSAL-TIME 4001074127)
