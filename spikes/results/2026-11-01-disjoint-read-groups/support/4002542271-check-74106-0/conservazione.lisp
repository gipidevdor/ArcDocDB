(:FINISHED-AT-UNIVERSAL-TIME 4002542321 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((110) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002542271-check-74106-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.902406d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57238668 :STORED-BYTES 896554
 :RESULTS
 ((:PATH
   #A((121) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002542271-check-74106-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28151197 :STORED-BYTES 412053 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28151197 :UNCOMPRESSED-SHA256
    \"7020701b0ed48dc41dfdc69bb58717c625cc891710970fcbf00d83861d9791f3\"
    :COMPRESSED-BYTES 411735 :COMPRESSED-SHA256
    \"f0c0d85762e7ac849fc812b3d5102da8effc43218ea2f5559fc06f2907eb5c61\"))
  (:PATH
   #A((121) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002542271-check-74106-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 29087471 :STORED-BYTES 484501 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 29087471 :UNCOMPRESSED-SHA256
    \"d1091f28a3333d433b1debe84426522e49420511001f6e84ec9472e4e1a41c69\"
    :COMPRESSED-BYTES 484183 :COMPRESSED-SHA256
    \"0b2019d5e4ee5e2db461c7cc23eab24d2ee08851a391021914b18d9b819ca49d\")))
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
  #A((110) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002542271-check-74106-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "74106"))
 :STARTED-AT-UNIVERSAL-TIME 4002542319)
