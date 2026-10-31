(:FINISHED-AT-UNIVERSAL-TIME 4002461156 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((109) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/core-review-20261031/full-check/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.819687d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3518130 :STORED-BYTES 340935
 :RESULTS
 ((:PATH
   #A((120) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/core-review-20261031/full-check/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3518130 :STORED-BYTES 340935 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3518130 :UNCOMPRESSED-SHA256
    \"f246982351f1d99720354f499f6a19be4adbdeb666296c061bec6c5b3d64b4bf\"
    :COMPRESSED-BYTES 340618 :COMPRESSED-SHA256
    \"2a27365e497633cc0e81c5b8ef8753254b7019918fac410742565b347fcff5ff\")))
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
  #A((109) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/core-review-20261031/full-check/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "23563"))
 :STARTED-AT-UNIVERSAL-TIME 4002461155)
