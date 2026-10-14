(:FINISHED-AT-UNIVERSAL-TIME 4001000430 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((105) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001000168-command-92151-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.793804d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1366326 :STORED-BYTES 161322
 :RESULTS
 ((:PATH
   #A((116) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001000168-command-92151-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1366326 :STORED-BYTES 161322 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1366326 :UNCOMPRESSED-SHA256
    \"7e67eed949569aa27ee6d662b3f08086280ab091b1d5ab19dce6ee32d422b360\"
    :COMPRESSED-BYTES 161005 :COMPRESSED-SHA256
    \"6b167742a8ca39f668d763cec2bdacc56547cc36903ac9d5f7d806a7d0e49c84\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((94) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((105) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001000168-command-92151-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "92151"))
 :STARTED-AT-UNIVERSAL-TIME 4001000429)
