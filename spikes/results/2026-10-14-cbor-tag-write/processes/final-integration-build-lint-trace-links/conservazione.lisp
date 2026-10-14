(:FINISHED-AT-UNIVERSAL-TIME 4000998007 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((101) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000997959-command-5777-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.791874d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1312918 :STORED-BYTES 153443
 :RESULTS
 ((:PATH
   #A((112) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000997959-command-5777-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1312918 :STORED-BYTES 153443 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1312918 :UNCOMPRESSED-SHA256
    \"ced71ec929d71fe5907e153fac31c17930870e615feaa6d078bc784b928efc4a\"
    :COMPRESSED-BYTES 153126 :COMPRESSED-SHA256
    \"b48199c6a94f1eb3713d1142e4c4ebce6b6e5b8f61f87830b1fafdf5f71d9e63\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((91) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((101) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000997959-command-5777-0/")
  "--jobs" "4" "--finished-owner-pid" #A((4) BASE-CHAR . "5777"))
 :STARTED-AT-UNIVERSAL-TIME 4000998006)
