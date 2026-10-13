(:FINISHED-AT-UNIVERSAL-TIME 4000912490 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((106) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912456-check-50098-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.753513d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57106178 :STORED-BYTES 878050
 :RESULTS
 ((:PATH
   #A((117) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912456-check-50098-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144051 :STORED-BYTES 410960 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144051 :UNCOMPRESSED-SHA256
    \"e40c44831873707f9a63309aa8e8c8aebe9f30687b355b9915d38a1e74c0fcb1\"
    :COMPRESSED-BYTES 410642 :COMPRESSED-SHA256
    \"b362894300346ebfc5051513c7c2a996da7ee398197332c98b1a0fc403c8d2a9\"))
  (:PATH
   #A((117) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912456-check-50098-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28962127 :STORED-BYTES 467090 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28962127 :UNCOMPRESSED-SHA256
    \"325334c60820e207bc1a5464235df6af3c478a7541146c41c55b571f8664b125\"
    :COMPRESSED-BYTES 466772 :COMPRESSED-SHA256
    \"a475559e0db335985d355d79c1e5b21a97ede2540025aed2e549e9abf4940379\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((97) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((106) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912456-check-50098-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "50098"))
 :STARTED-AT-UNIVERSAL-TIME 4000912488)
