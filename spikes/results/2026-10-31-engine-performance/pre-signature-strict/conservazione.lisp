(:FINISHED-AT-UNIVERSAL-TIME 4002452590 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002452342-command-90722-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.944168d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3299405 :STORED-BYTES 318560
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002452342-command-90722-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3299405 :STORED-BYTES 318560 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3299405 :UNCOMPRESSED-SHA256
    \"31cdabe25a550d48aebe3a825b09d20c6edd4e7161320edabae40f151112aede\"
    :COMPRESSED-BYTES 318243 :COMPRESSED-SHA256
    \"46992a394f794db2b600a8def510043b51a346892cf4e61fe715df3f9b92ef8d\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002452342-command-90722-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "90722"))
 :STARTED-AT-UNIVERSAL-TIME 4002452588)
