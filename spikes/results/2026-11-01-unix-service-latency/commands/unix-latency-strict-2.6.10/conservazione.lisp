(:FINISHED-AT-UNIVERSAL-TIME 4002530266 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/unix-latency-strict-2.6.10/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.938287d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3764610 :STORED-BYTES 359068
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/unix-latency-strict-2.6.10/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3764610 :STORED-BYTES 359068 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3764610 :UNCOMPRESSED-SHA256
    \"d472d1921ac4a72eb1279b5f19b2625b6b49cd2636fa898cc6dac78d6bebfadd\"
    :COMPRESSED-BYTES 358751 :COMPRESSED-SHA256
    \"11edb3bee2ba9e16840c66f04edc013bfb27787f0e3bc52fcdc1a06797f3b4f3\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/unix-latency-strict-2.6.10/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "39097"))
 :STARTED-AT-UNIVERSAL-TIME 4002530265)
