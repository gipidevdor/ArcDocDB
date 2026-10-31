(:FINISHED-AT-UNIVERSAL-TIME 4002439102 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((110) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002439051-check-54263-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.710781d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57239960 :STORED-BYTES 896395
 :RESULTS
 ((:PATH
   #A((121) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002439051-check-54263-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28151197 :STORED-BYTES 412057 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28151197 :UNCOMPRESSED-SHA256
    \"4de3c50b313e4af8bda5a1ec64475ac3738bb09ff62be1740aa540bd47c662ad\"
    :COMPRESSED-BYTES 411739 :COMPRESSED-SHA256
    \"c482276e24c6ed86db6e459a79eb42f3b5bd8a64cbf75f03a7ff1af50e7263c6\"))
  (:PATH
   #A((121) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002439051-check-54263-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 29088763 :STORED-BYTES 484338 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 29088763 :UNCOMPRESSED-SHA256
    \"b8f503b4f2b853c1d5edecd0a10e429d63a21dbd70b3bf9a7ad2aa2092b79b8d\"
    :COMPRESSED-BYTES 484020 :COMPRESSED-SHA256
    \"403c4b0bb075322f5b5662588ad4dcbe0b9164503a18f1351fd660c4ae9f3194\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002439051-check-54263-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "54263"))
 :STARTED-AT-UNIVERSAL-TIME 4002439099)
