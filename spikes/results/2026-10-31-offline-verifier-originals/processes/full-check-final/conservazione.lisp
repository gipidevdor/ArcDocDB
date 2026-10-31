(:FINISHED-AT-UNIVERSAL-TIME 4002474025 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((113) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/full-check-final/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.054745d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3544972 :STORED-BYTES 343588
 :RESULTS
 ((:PATH
   #A((124) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/full-check-final/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3544972 :STORED-BYTES 343588 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3544972 :UNCOMPRESSED-SHA256
    \"b771c8c01b8face4e532330ea90f442f239b0774e97028c9fa330961e502985b\"
    :COMPRESSED-BYTES 343271 :COMPRESSED-SHA256
    \"154e971db5b314bd96e8543df24c0c68eb3e7cd7623043052fa5088a5982e585\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((36) BASE-CHAR . "/Users/gpicchiarelli/.local/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((93) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((113) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/full-check-final/")
  "--jobs" "4" "--finished-owner-pid" #A((3) BASE-CHAR . "229"))
 :STARTED-AT-UNIVERSAL-TIME 4002474024)
