(:FINISHED-AT-UNIVERSAL-TIME 4002530650 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((109) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/unix-latency-full-2.6.9/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.148642d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 4002361 :STORED-BYTES 377208
 :RESULTS
 ((:PATH
   #A((120) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/unix-latency-full-2.6.9/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 4002361 :STORED-BYTES 377208 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 4002361 :UNCOMPRESSED-SHA256
    \"67969d9ec052cb0bfcf9d496f161703d079a7b3b20a64451b3204bb93d6e0749\"
    :COMPRESSED-BYTES 376891 :COMPRESSED-SHA256
    \"f89a44153848d78f79ac46fe2656116e418692ce68756ec3cd64b8d818f79a9c\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/unix-latency-full-2.6.9/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "39096"))
 :STARTED-AT-UNIVERSAL-TIME 4002530649)
