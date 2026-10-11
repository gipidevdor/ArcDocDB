(:FINISHED-AT-UNIVERSAL-TIME 4000704499 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((101) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000704462-check-62024-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 2.042699d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57107079 :STORED-BYTES 878326
 :RESULTS
 ((:PATH
   #A((112) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000704462-check-62024-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144216 :STORED-BYTES 410978 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144216 :UNCOMPRESSED-SHA256
    \"d4c4a575e0a7a29b04349e0f1ea7d569ccee687e7d3013da9295207228f0e537\"
    :COMPRESSED-BYTES 410660 :COMPRESSED-SHA256
    \"855dbddf0ca0607048d029efaf5b75ea3bda810551a806d62e3cc95cfbd17d1c\"))
  (:PATH
   #A((112) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000704462-check-62024-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28962863 :STORED-BYTES 467348 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28962863 :UNCOMPRESSED-SHA256
    \"6b625c26284a29034db5296387c03c19c50460c433b4281d045ec6dfe62fd759\"
    :COMPRESSED-BYTES 467030 :COMPRESSED-SHA256
    \"ef1c51df7cea7df63068613575a54d6c3aa14c1dec010396422d0a67491b9126\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((92) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((101) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000704462-check-62024-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "62024"))
 :STARTED-AT-UNIVERSAL-TIME 4000704497)
