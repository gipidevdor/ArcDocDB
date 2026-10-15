(:FINISHED-AT-UNIVERSAL-TIME 4001073393 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((114) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073363-command-61212-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.926558d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1214653 :STORED-BYTES 131203
 :RESULTS
 ((:PATH
   #A((125) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073363-command-61212-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1214653 :STORED-BYTES 131203 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1214653 :UNCOMPRESSED-SHA256
    \"c6b5c977c54921e68cdf9f57178f032554f917bf03bc3792070eef7502e0d082\"
    :COMPRESSED-BYTES 130886 :COMPRESSED-SHA256
    \"3f97b2b234102f5e7cf1c1326ef7fee0e04515d10b07d261f05033bc40a879e6\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073363-command-61212-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "61212"))
 :STARTED-AT-UNIVERSAL-TIME 4001073392)
