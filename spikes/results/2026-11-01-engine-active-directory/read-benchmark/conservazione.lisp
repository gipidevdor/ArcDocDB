(:FINISHED-AT-UNIVERSAL-TIME 4002492502 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002492485-command-60767-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.74961d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1671323 :STORED-BYTES 199039
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002492485-command-60767-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1671323 :STORED-BYTES 199039 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1671323 :UNCOMPRESSED-SHA256
    \"8bc62fe1ff02ea1de5b7e3ea82e47d8922ce3b900702b2df4bcff91c41178ee5\"
    :COMPRESSED-BYTES 198722 :COMPRESSED-SHA256
    \"f4c597ebf5e60376aa8f906341dbcc3a57ebe8baf99b8e18efc955bdcbbab798\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002492485-command-60767-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "60767"))
 :STARTED-AT-UNIVERSAL-TIME 4002492500)
