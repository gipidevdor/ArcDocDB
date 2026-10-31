(:FINISHED-AT-UNIVERSAL-TIME 4002435197 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((111) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002434786-command-3726-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.975377d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3520747 :STORED-BYTES 326301
 :RESULTS
 ((:PATH
   #A((122) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002434786-command-3726-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3520747 :STORED-BYTES 326301 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3520747 :UNCOMPRESSED-SHA256
    \"f6a8c850cc604040120aa8368629eb1cbce465c9a499af19d33206fd931b372d\"
    :COMPRESSED-BYTES 325984 :COMPRESSED-SHA256
    \"8feced45e23bcbb7c66bacc8474870f97936d7498a29b3d8ac0c532ba21cc6a4\")))
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
  #A((111) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002434786-command-3726-0/")
  "--jobs" "4" "--finished-owner-pid" #A((4) BASE-CHAR . "3726"))
 :STARTED-AT-UNIVERSAL-TIME 4002435196)
