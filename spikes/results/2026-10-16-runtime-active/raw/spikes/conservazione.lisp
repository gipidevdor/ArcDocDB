(:FINISHED-AT-UNIVERSAL-TIME 4001161854 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((97) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161815-check-21102-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.7932d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57105803 :STORED-BYTES 878284
 :RESULTS
 ((:PATH
   #A((108) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161815-check-21102-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144050 :STORED-BYTES 410952 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144050 :UNCOMPRESSED-SHA256
    \"4118e27a4b428b035ce36fe6c9ce35a9974d55fbbf7689da5ec989eda5f7428d\"
    :COMPRESSED-BYTES 410634 :COMPRESSED-SHA256
    \"b29b5aa23d3c92f53e9ed73067ed1c89cfbfa881975da5c0820e3cb3bae44bab\"))
  (:PATH
   #A((108) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161815-check-21102-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28961753 :STORED-BYTES 467332 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28961753 :UNCOMPRESSED-SHA256
    \"3fec77c6edfd70907aa0c5d60239e289a0c5e4d89b25ba3256ac53a0ca29246d\"
    :COMPRESSED-BYTES 467014 :COMPRESSED-SHA256
    \"542f212d081f5bcb2b06f71fa2d8b40c6bc371f8e12f3dc4709346802b0835e2\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((88) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((97) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161815-check-21102-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "21102"))
 :STARTED-AT-UNIVERSAL-TIME 4001161851)
