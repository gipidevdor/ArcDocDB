(:FINISHED-AT-UNIVERSAL-TIME 4002507729 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002506495-command-91536-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.021912d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3865319 :STORED-BYTES 364037
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002506495-command-91536-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3865319 :STORED-BYTES 364037 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3865319 :UNCOMPRESSED-SHA256
    \"73cd7ca8a6a2dd2398dab72717d94dad44b19f1ae99085fdaccdf3527dd78cfa\"
    :COMPRESSED-BYTES 363720 :COMPRESSED-SHA256
    \"430f0bd54c0c40c1ac1c598071999f42b58333d81778f39ee48bf5383b9cdba5\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002506495-command-91536-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "91536"))
 :STARTED-AT-UNIVERSAL-TIME 4002507727)
