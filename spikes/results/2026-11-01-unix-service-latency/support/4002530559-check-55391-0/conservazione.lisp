(:FINISHED-AT-UNIVERSAL-TIME 4002530611 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((110) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002530559-check-55391-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.873926d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57238357 :STORED-BYTES 896110
 :RESULTS
 ((:PATH
   #A((121) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002530559-check-55391-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28151197 :STORED-BYTES 412053 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28151197 :UNCOMPRESSED-SHA256
    \"dda5bb07f0116210aebd5ba77bcd5bf385bbd44453747015e1e464fbe5c0f3e4\"
    :COMPRESSED-BYTES 411735 :COMPRESSED-SHA256
    \"59460a9a13d067083558ca7360a9f217dde136cf30eb012789b61057741777c7\"))
  (:PATH
   #A((121) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002530559-check-55391-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 29087160 :STORED-BYTES 484057 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 29087160 :UNCOMPRESSED-SHA256
    \"ead9fb440ed0e5eddd0dce6c200a684a80c4e34919b7101e73084006943a8dba\"
    :COMPRESSED-BYTES 483739 :COMPRESSED-SHA256
    \"f6598ec10ac7adb43277b5461be399c5d2dda5c5c2e5205ebe08b2f8c2f62f4f\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002530559-check-55391-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "55391"))
 :STARTED-AT-UNIVERSAL-TIME 4002530609)
