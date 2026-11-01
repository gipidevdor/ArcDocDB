(:FINISHED-AT-UNIVERSAL-TIME 4002503948 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002502736-command-78838-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.099577d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3837353 :STORED-BYTES 361266
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002502736-command-78838-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3837353 :STORED-BYTES 361266 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3837353 :UNCOMPRESSED-SHA256
    \"165d1ed5eadeb8d7413d70e8a15bfb22a6563f6cd32cd6b70927cf5a041e1502\"
    :COMPRESSED-BYTES 360949 :COMPRESSED-SHA256
    \"48a7bb5af74384f74c89cf4a7d511e547318fc166553cd9ecfe35cd609112f64\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002502736-command-78838-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "78838"))
 :STARTED-AT-UNIVERSAL-TIME 4002503947)
