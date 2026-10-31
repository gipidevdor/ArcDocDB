(:FINISHED-AT-UNIVERSAL-TIME 4002475979 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((110) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002475927-check-59558-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.888172d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57239918 :STORED-BYTES 896330
 :RESULTS
 ((:PATH
   #A((121) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002475927-check-59558-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28151197 :STORED-BYTES 412053 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28151197 :UNCOMPRESSED-SHA256
    \"ed1dd3240648ef8bc239aa19fbe5b39493a538b74a830f9cb8fb584cd943fe4a\"
    :COMPRESSED-BYTES 411735 :COMPRESSED-SHA256
    \"c56a36544c52ceab500f18eaea1ec589d79a7399d2d8bc165a1697fec367cf21\"))
  (:PATH
   #A((121) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002475927-check-59558-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 29088721 :STORED-BYTES 484277 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 29088721 :UNCOMPRESSED-SHA256
    \"d843816fdfc513d299f7fc44df81a0dc8fedc8fd7f6a42fa97460ebc70b279d0\"
    :COMPRESSED-BYTES 483959 :COMPRESSED-SHA256
    \"a1b3aa3c0c0c523da8c08aba419e9904d5fc0c389c521e72f6d28aba917306f1\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002475927-check-59558-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "59558"))
 :STARTED-AT-UNIVERSAL-TIME 4002475977)
