(:FINISHED-AT-UNIVERSAL-TIME 4002524341 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((108) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/4002524294-check-89377-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.696454d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57237525 :STORED-BYTES 896038
 :RESULTS
 ((:PATH
   #A((119) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/4002524294-check-89377-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28151129 :STORED-BYTES 412065 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28151129 :UNCOMPRESSED-SHA256
    \"bd17fb4be4af7ce8f4e760913ddbae47320a19e77d9315bd15b49c7de0df7d1d\"
    :COMPRESSED-BYTES 411747 :COMPRESSED-SHA256
    \"a72fe4f3383ba9ae951e1218edeb13408f5db98b012a5fe500b867978469c516\"))
  (:PATH
   #A((119) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/4002524294-check-89377-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 29086396 :STORED-BYTES 483973 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 29086396 :UNCOMPRESSED-SHA256
    \"752072d25ba59da0acfba5ba9f1204b4f3406981a28d5d6ca7384eeaa11ad919\"
    :COMPRESSED-BYTES 483655 :COMPRESSED-SHA256
    \"11438503b6fc01c7b2e09af32d852b97ef6ba4b34aade825e8341d3ce7228152\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((99) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((108) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/4002524294-check-89377-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "89377"))
 :STARTED-AT-UNIVERSAL-TIME 4002524339)
