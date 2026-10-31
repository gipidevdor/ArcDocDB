(:FINISHED-AT-UNIVERSAL-TIME 4002448873 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002447917-command-27851-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.002598d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3686854 :STORED-BYTES 345779
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002447917-command-27851-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3686854 :STORED-BYTES 345779 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3686854 :UNCOMPRESSED-SHA256
    \"8fc23dd2c3a42d1778eeaa50a6c504890b7eb6124825311394bb80bea0bc7e55\"
    :COMPRESSED-BYTES 345462 :COMPRESSED-SHA256
    \"7f1abb93e919416173c3a78d4c157ec59c20bac98ab697f589a220e281dbd1d9\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002447917-command-27851-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "27851"))
 :STARTED-AT-UNIVERSAL-TIME 4002448871)
