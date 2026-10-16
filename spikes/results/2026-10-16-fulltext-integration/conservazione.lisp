(:FINISHED-AT-UNIVERSAL-TIME 4001157115 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((99) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001157014-command-74810-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.876435d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2199120 :STORED-BYTES 218060
 :RESULTS
 ((:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001157014-command-74810-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2199120 :STORED-BYTES 218060 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2199120 :UNCOMPRESSED-SHA256
    \"0be8c93d7dbb491c9ea4013adf5c52d0f995a3918aa715e74a5c1a65d23d79ff\"
    :COMPRESSED-BYTES 217743 :COMPRESSED-SHA256
    \"bacd4058767d99d2aec0c0746d4843b197000da013608a03213fc74f9f910120\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((88) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((99) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001157014-command-74810-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "74810"))
 :STARTED-AT-UNIVERSAL-TIME 4001157114)
