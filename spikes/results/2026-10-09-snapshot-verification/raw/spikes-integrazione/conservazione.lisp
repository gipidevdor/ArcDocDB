(:FINISHED-AT-UNIVERSAL-TIME 4000703698 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((105) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/4000703663-check-51770-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.819506d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57106916 :STORED-BYTES 878445
 :RESULTS
 ((:PATH
   #A((116) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/4000703663-check-51770-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144118 :STORED-BYTES 410943 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144118 :UNCOMPRESSED-SHA256
    \"6feba72c9e4ecbb01a475a0f023cebec5cc4e0ac2f4a0594110cff9091ea0c86\"
    :COMPRESSED-BYTES 410625 :COMPRESSED-SHA256
    \"e994a459733749ef5cd29ce175845d08c6c41b8e4dec46619e7d478b2faa81ff\"))
  (:PATH
   #A((116) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/4000703663-check-51770-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28962798 :STORED-BYTES 467502 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28962798 :UNCOMPRESSED-SHA256
    \"1d58a02929eeac1a07836494e2529fcdfed0e1a82fd408d3fe418731e4db5e02\"
    :COMPRESSED-BYTES 467184 :COMPRESSED-SHA256
    \"020a00ce535fcb43c447070ee69dcd88f5a26cb7f81104ac54f1ea122e0f4c04\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((96) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((105) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/4000703663-check-51770-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "51770"))
 :STARTED-AT-UNIVERSAL-TIME 4000703696)
