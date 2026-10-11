(:FINISHED-AT-UNIVERSAL-TIME 4000705360 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((101) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000705323-check-76861-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 2.034812d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57106801 :STORED-BYTES 878396
 :RESULTS
 ((:PATH
   #A((112) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000705323-check-76861-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144119 :STORED-BYTES 410948 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144119 :UNCOMPRESSED-SHA256
    \"399053cb4adca7c5beddacd82efecf1a537dcd49c39f85e90764a2b4590120e9\"
    :COMPRESSED-BYTES 410630 :COMPRESSED-SHA256
    \"aeac6fd7efd44e5bb878f6e7507a10e52cfdfcff4c03fc76f3efd3dd90d41fa1\"))
  (:PATH
   #A((112) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000705323-check-76861-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28962682 :STORED-BYTES 467448 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28962682 :UNCOMPRESSED-SHA256
    \"94e0117a984f9579ba23122b79306ed9e348e0e2854db26ddaf97bc6de1f1a59\"
    :COMPRESSED-BYTES 467130 :COMPRESSED-SHA256
    \"68461220c3f84bb4a62224c39e84c806d62330deeba4efd00214a2ae8f2c93ed\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000705323-check-76861-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "76861"))
 :STARTED-AT-UNIVERSAL-TIME 4000705357)
