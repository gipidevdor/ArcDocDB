(:FINISHED-AT-UNIVERSAL-TIME 4002475623 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002474800-command-31436-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.822632d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3546003 :STORED-BYTES 336426
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002474800-command-31436-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3546003 :STORED-BYTES 336426 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3546003 :UNCOMPRESSED-SHA256
    \"2805d03ae25cbb67e0073bd2cbc58c8a2247a1cc6ba12188cf2bf9012cb95a61\"
    :COMPRESSED-BYTES 336109 :COMPRESSED-SHA256
    \"4d4d5227ec86f6e6289afd87c4272a99aa81302b6d12a0582c022d0c4e9ed89e\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002474800-command-31436-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "31436"))
 :STARTED-AT-UNIVERSAL-TIME 4002475622)
