(:FINISHED-AT-UNIVERSAL-TIME 4001073739 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((102) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073649-command-78906-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.52042d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1483301 :STORED-BYTES 165648
 :RESULTS
 ((:PATH
   #A((113) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073649-command-78906-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1483301 :STORED-BYTES 165648 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1483301 :UNCOMPRESSED-SHA256
    \"32479786b8402bc840f422943c750b23e4f3fd351f3f7babaebd0febead18905\"
    :COMPRESSED-BYTES 165331 :COMPRESSED-SHA256
    \"cbd77d16f56a4c9903ea2c62e1bab8cbbbf30b967744eb439af618d48519e3b1\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((91) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((102) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073649-command-78906-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "78906"))
 :STARTED-AT-UNIVERSAL-TIME 4001073737)
