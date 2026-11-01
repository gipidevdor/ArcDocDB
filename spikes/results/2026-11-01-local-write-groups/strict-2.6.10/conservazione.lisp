(:FINISHED-AT-UNIVERSAL-TIME 4002503559 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002502736-command-78840-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.839567d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3596427 :STORED-BYTES 342831
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002502736-command-78840-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3596427 :STORED-BYTES 342831 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3596427 :UNCOMPRESSED-SHA256
    \"a5fe10e5c85926ad14bf1c0111c8f028f2bac4677e5f73763640fb9ccedc909d\"
    :COMPRESSED-BYTES 342514 :COMPRESSED-SHA256
    \"3682c70b153abb4f62ca23a995ff673f44def3efe55bba5607950ba2ad11cf54\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002502736-command-78840-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "78840"))
 :STARTED-AT-UNIVERSAL-TIME 4002503558)
