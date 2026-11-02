(:FINISHED-AT-UNIVERSAL-TIME 4002636832 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002635437-command-80909-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.042615d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 4267508 :STORED-BYTES 399862
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002635437-command-80909-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 4267508 :STORED-BYTES 399862 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 4267508 :UNCOMPRESSED-SHA256
    \"2a789c5bcb24909f845068a6552f6a0309fe69cf813fad4399039ed96a26218f\"
    :COMPRESSED-BYTES 399545 :COMPRESSED-SHA256
    \"f7578300641cc24969a665d0a89260a18baa89c00adbf33939d827450e00a011\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002635437-command-80909-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "80909"))
 :STARTED-AT-UNIVERSAL-TIME 4002636830)
