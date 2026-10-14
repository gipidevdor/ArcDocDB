(:FINISHED-AT-UNIVERSAL-TIME 4000999298 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((105) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/control-transizione/ArcDocDB/spikes/out/4000999014-command-74836-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.839015d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1494573 :STORED-BYTES 167598
 :RESULTS
 ((:PATH
   #A((116) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/control-transizione/ArcDocDB/spikes/out/4000999014-command-74836-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1494573 :STORED-BYTES 167598 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1494573 :UNCOMPRESSED-SHA256
    \"b7aa8f75fc696deb03a26e4d6633baae1da1c8aa71a944efd9ea8d59c6a45c10\"
    :COMPRESSED-BYTES 167281 :COMPRESSED-SHA256
    \"68e1199907b81e5c57a93b30f1e23680964f2e4afb78efcb5c8928aa48c2ca3d\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((94) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/control-transizione/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((105) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/control-transizione/ArcDocDB/spikes/out/4000999014-command-74836-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "74836"))
 :STARTED-AT-UNIVERSAL-TIME 4000999297)
