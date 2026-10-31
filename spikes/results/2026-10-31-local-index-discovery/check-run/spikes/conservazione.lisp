(:FINISHED-AT-UNIVERSAL-TIME 4002424519 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((110) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002424468-check-44536-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.954425d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57238199 :STORED-BYTES 896156
 :RESULTS
 ((:PATH
   #A((121) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002424468-check-44536-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28151197 :STORED-BYTES 412057 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28151197 :UNCOMPRESSED-SHA256
    \"814e78825085a8721928891f8766ab9bd684f4402ed4ac116c68324592a74102\"
    :COMPRESSED-BYTES 411739 :COMPRESSED-SHA256
    \"0111ab592e65af4084ff57188940cf9803a19a82d52af30fc4ce7157d2eb5417\"))
  (:PATH
   #A((121) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002424468-check-44536-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 29087002 :STORED-BYTES 484099 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 29087002 :UNCOMPRESSED-SHA256
    \"a9d89050e8a39ee2a09c233ff6c9f484dd64d53391bc14908d3f599153c389de\"
    :COMPRESSED-BYTES 483781 :COMPRESSED-SHA256
    \"c0789655ecd3fc53dbb9070e979f0b83f2b76a6af911c4e5cc161e8ac7c0258d\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002424468-check-44536-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "44536"))
 :STARTED-AT-UNIVERSAL-TIME 4002424517)
