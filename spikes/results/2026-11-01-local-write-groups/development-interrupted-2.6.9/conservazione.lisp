(:FINISHED-AT-UNIVERSAL-TIME 4002502642 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002502389-command-76956-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.051637d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3599606 :STORED-BYTES 343309
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002502389-command-76956-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3599606 :STORED-BYTES 343309 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3599606 :UNCOMPRESSED-SHA256
    \"d1109c69d172a6878a59fab093c82cc963065d6622688dfc23154e2a6b7e5b70\"
    :COMPRESSED-BYTES 342992 :COMPRESSED-SHA256
    \"b28d9162dd3ef9fbdf1924b6d87118b17b6d85a10a2359c01df6544c98255826\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002502389-command-76956-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "76956"))
 :STARTED-AT-UNIVERSAL-TIME 4002502641)
