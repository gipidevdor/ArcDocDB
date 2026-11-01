(:FINISHED-AT-UNIVERSAL-TIME 4002541729 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((105) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/disjoint-full-2.6.9/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.89392d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 4035257 :STORED-BYTES 380413
 :RESULTS
 ((:PATH
   #A((116) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/disjoint-full-2.6.9/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 4035257 :STORED-BYTES 380413 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 4035257 :UNCOMPRESSED-SHA256
    \"aaf9d2acb415601601df086a7f5bd31377a9ef1afd0b4b1b78f3eab612b0b21a\"
    :COMPRESSED-BYTES 380096 :COMPRESSED-SHA256
    \"b656f56c1531c9bcaa934d67a0df3779988aa9eb1eb453f25c2c0bf915f55c7c\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((101) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((105) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/disjoint-full-2.6.9/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "13503"))
 :STARTED-AT-UNIVERSAL-TIME 4002541728)
