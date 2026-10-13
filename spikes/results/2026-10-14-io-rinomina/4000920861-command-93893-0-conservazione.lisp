(:FINISHED-AT-UNIVERSAL-TIME 4000921111 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((97) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/io-rinomina/ArcDocDB/spikes/out/4000920861-command-93893-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.90972d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1121276 :STORED-BYTES 140915
 :RESULTS
 ((:PATH
   #A((108) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/io-rinomina/ArcDocDB/spikes/out/4000920861-command-93893-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1121276 :STORED-BYTES 140915 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1121276 :UNCOMPRESSED-SHA256
    \"cb4aa6020dc0e383470a6f54501a2f0dd89b59b5ed70ca26209acda4b62bf4d7\"
    :COMPRESSED-BYTES 140598 :COMPRESSED-SHA256
    \"3a40941c4aec1b7c920207d20a39c99214699937a8c40b65e30e970d71175521\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((86) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/io-rinomina/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((97) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/io-rinomina/ArcDocDB/spikes/out/4000920861-command-93893-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "93893"))
 :STARTED-AT-UNIVERSAL-TIME 4000921110)
