(:FINISHED-AT-UNIVERSAL-TIME 4002450908 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002449837-command-55111-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.093845d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3687009 :STORED-BYTES 345845
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002449837-command-55111-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3687009 :STORED-BYTES 345845 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3687009 :UNCOMPRESSED-SHA256
    \"2a286f737b208dd76001d5a81ecca0826c9d3bfdbbf5f5bf987cd95f9d2b7274\"
    :COMPRESSED-BYTES 345528 :COMPRESSED-SHA256
    \"72cd074c4eb8f73c83d7e2c2c5355776cc7731bfab6ff73c5f998bd65053a883\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002449837-command-55111-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "55111"))
 :STARTED-AT-UNIVERSAL-TIME 4002450907)
