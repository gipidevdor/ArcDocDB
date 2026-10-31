(:FINISHED-AT-UNIVERSAL-TIME 4002450550 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002449849-command-55356-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.859391d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3454458 :STORED-BYTES 328269
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002449849-command-55356-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3454458 :STORED-BYTES 328269 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3454458 :UNCOMPRESSED-SHA256
    \"e4c556fda3ccf345248d72d4fa222db7de7a1100c58f4e8cdefb576198fa5e82\"
    :COMPRESSED-BYTES 327952 :COMPRESSED-SHA256
    \"23173b5e66b2384b0087d2009f0421482e3056043e5936d06daddce1b037dd46\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002449849-command-55356-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "55356"))
 :STARTED-AT-UNIVERSAL-TIME 4002450549)
