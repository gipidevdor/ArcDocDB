(:FINISHED-AT-UNIVERSAL-TIME 4002461873 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002461830-command-74570-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 3.570057d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 4278801 :STORED-BYTES 370308
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002461830-command-74570-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 4278801 :STORED-BYTES 370308 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 4278801 :UNCOMPRESSED-SHA256
    \"854a2f2fcc34457df2bc372c17936607b001a03c5a42abd093169fb2638db1fe\"
    :COMPRESSED-BYTES 369991 :COMPRESSED-SHA256
    \"a5894bf160bdbf2673c42753231e18b35e369f348b54fa075bae545c7ec9e69c\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/Users/gpicchiarelli/.local/sbcl/2.6.10/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((101) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((112) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002461830-command-74570-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "74570"))
 :STARTED-AT-UNIVERSAL-TIME 4002461869)
