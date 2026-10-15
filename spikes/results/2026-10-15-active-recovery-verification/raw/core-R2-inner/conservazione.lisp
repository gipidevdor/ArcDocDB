(:FINISHED-AT-UNIVERSAL-TIME 4001073557 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((114) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073535-command-71009-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.775727d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1236588 :STORED-BYTES 132912
 :RESULTS
 ((:PATH
   #A((125) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073535-command-71009-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1236588 :STORED-BYTES 132912 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1236588 :UNCOMPRESSED-SHA256
    \"48d5b696d8461e21a01bbf7984439697c31006277b34d03f6c9400d7aba4a671\"
    :COMPRESSED-BYTES 132595 :COMPRESSED-SHA256
    \"b1cea78577e8bbc9dc7e621267347cb24f15c2072e6133c1ebf15d4ae3aca8c7\")))
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
  #A((114) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073535-command-71009-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "71009"))
 :STARTED-AT-UNIVERSAL-TIME 4001073556)
