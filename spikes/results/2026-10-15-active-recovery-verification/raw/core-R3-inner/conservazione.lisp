(:FINISHED-AT-UNIVERSAL-TIME 4001074135 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((114) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073651-command-78980-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.328301d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1552246 :STORED-BYTES 173108
 :RESULTS
 ((:PATH
   #A((125) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073651-command-78980-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1552246 :STORED-BYTES 173108 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1552246 :UNCOMPRESSED-SHA256
    \"16f02f52f08230ca2ca7b41554e27255df8bdf779b6cb341f42eeb67bcb9c264\"
    :COMPRESSED-BYTES 172791 :COMPRESSED-SHA256
    \"b2421bab7646de4b62794d3e52cb29b7df6a626f547c62d1abaa72c0d466fffa\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073651-command-78980-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "78980"))
 :STARTED-AT-UNIVERSAL-TIME 4001074133)
