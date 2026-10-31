(:FINISHED-AT-UNIVERSAL-TIME 4002437430 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002436632-command-18955-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.983441d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3580477 :STORED-BYTES 336794
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002436632-command-18955-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3580477 :STORED-BYTES 336794 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3580477 :UNCOMPRESSED-SHA256
    \"9afd84f40d5f0226746eca0aef8cea1af88cef95c6f9d19e33716dd375f3ec23\"
    :COMPRESSED-BYTES 336477 :COMPRESSED-SHA256
    \"c07777baf906fd9f346ebe9550d360d2c4357df506d0a76894d58770ba8aa2fd\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002436632-command-18955-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "18955"))
 :STARTED-AT-UNIVERSAL-TIME 4002437428)
