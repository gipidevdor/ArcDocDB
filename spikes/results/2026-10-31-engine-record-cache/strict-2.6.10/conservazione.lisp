(:FINISHED-AT-UNIVERSAL-TIME 4002461459 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002460722-command-33588-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.838851d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3467800 :STORED-BYTES 330663
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002460722-command-33588-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3467800 :STORED-BYTES 330663 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3467800 :UNCOMPRESSED-SHA256
    \"bc2723c78c37d28dbf71cd29ae292da8591896e2d84fd555d4cb8ad40e57f1ca\"
    :COMPRESSED-BYTES 330346 :COMPRESSED-SHA256
    \"222f3ee647f3e55b0108acb039ae5274b5dfcd14e06f7f73153d31a1c1ebaf31\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002460722-command-33588-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "33588"))
 :STARTED-AT-UNIVERSAL-TIME 4002461458)
