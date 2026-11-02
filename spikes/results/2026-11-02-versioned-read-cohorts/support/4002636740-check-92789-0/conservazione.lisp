(:FINISHED-AT-UNIVERSAL-TIME 4002636792 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((110) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002636740-check-92789-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.843978d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57238574 :STORED-BYTES 896333
 :RESULTS
 ((:PATH
   #A((121) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002636740-check-92789-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28151197 :STORED-BYTES 412054 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28151197 :UNCOMPRESSED-SHA256
    \"9825f660e0cb5590df712ebb40c0cd045c673ccf3dbd2782d1de1a42c1bcd1e8\"
    :COMPRESSED-BYTES 411736 :COMPRESSED-SHA256
    \"9682569c9d3c1253b115425a4280cf49475cd41b7775c1d25d8c32ecbd7ea43d\"))
  (:PATH
   #A((121) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002636740-check-92789-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 29087377 :STORED-BYTES 484279 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 29087377 :UNCOMPRESSED-SHA256
    \"1a9ac266d063af39e126485c3ccf48285c49485bea8bfc50c1973cc2a3116fe7\"
    :COMPRESSED-BYTES 483961 :COMPRESSED-SHA256
    \"9494eb46efb58ee4fd662180c372eb8b3c794dae60a5f7066d8ac9f831b287fb\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002636740-check-92789-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "92789"))
 :STARTED-AT-UNIVERSAL-TIME 4002636790)
