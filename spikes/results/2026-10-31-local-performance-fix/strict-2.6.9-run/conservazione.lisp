(:FINISHED-AT-UNIVERSAL-TIME 4002432081 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002431729-command-84408-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.863572d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3353194 :STORED-BYTES 311915
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002431729-command-84408-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3353194 :STORED-BYTES 311915 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3353194 :UNCOMPRESSED-SHA256
    \"9e172ddef969ac85d6654b85022c59f6a6a9f01c884bf754e98a5fca3d46c6e9\"
    :COMPRESSED-BYTES 311598 :COMPRESSED-SHA256
    \"b93376264064d3ab817523d9ca01f8dc19df580b469f310f6224b2ffcb43f816\")))
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
  #A((112) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002431729-command-84408-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "84408"))
 :STARTED-AT-UNIVERSAL-TIME 4002432079)
