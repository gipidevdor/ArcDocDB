(:FINISHED-AT-UNIVERSAL-TIME 4002453880 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((109) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002453830-check-4891-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.923766d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57238051 :STORED-BYTES 896222
 :RESULTS
 ((:PATH
   #A((120) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002453830-check-4891-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28151197 :STORED-BYTES 412059 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28151197 :UNCOMPRESSED-SHA256
    \"dc58ddd35a21c9ae2245e293c96c2531c0879070ea1004714957c4ae9d1b91db\"
    :COMPRESSED-BYTES 411741 :COMPRESSED-SHA256
    \"a7d89d476549d32b0be87ea64f54fdef8212e98c6c51a47e6be47d9abf2a99c5\"))
  (:PATH
   #A((120) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002453830-check-4891-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 29086854 :STORED-BYTES 484163 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 29086854 :UNCOMPRESSED-SHA256
    \"d49d5dabddd804d947472f0de9ce9476ca8fd8a972a3f39d0325d1d7a9855601\"
    :COMPRESSED-BYTES 483845 :COMPRESSED-SHA256
    \"3d1db6e25bd839951f0a6383679a164990fc64e52124c401f405c28720e11d92\")))
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
  #A((109) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002453830-check-4891-0/")
  "--jobs" "4" "--finished-owner-pid" #A((4) BASE-CHAR . "4891"))
 :STARTED-AT-UNIVERSAL-TIME 4002453878)
