(:FINISHED-AT-UNIVERSAL-TIME 4000908262 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((98) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/get-controller/ArcDocDB/spikes/out/4000908226-check-81446-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.904846d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57106326 :STORED-BYTES 878260
 :RESULTS
 ((:PATH
   #A((109) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/get-controller/ArcDocDB/spikes/out/4000908226-check-81446-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144051 :STORED-BYTES 410961 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144051 :UNCOMPRESSED-SHA256
    \"e2b71ca87e140e768b70b1c3aa3cb87a8f97964f7c19423e203055fb3bcffec6\"
    :COMPRESSED-BYTES 410643 :COMPRESSED-SHA256
    \"3d89d04eca7935ce675ff9c2d126e97a56fe94fa99470e43b75d17c330498e8f\"))
  (:PATH
   #A((109) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/get-controller/ArcDocDB/spikes/out/4000908226-check-81446-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28962275 :STORED-BYTES 467299 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28962275 :UNCOMPRESSED-SHA256
    \"f0f7340f1130f3412a11d0a91867519e70fa2507ae76feab8457b53ccb0ce95f\"
    :COMPRESSED-BYTES 466981 :COMPRESSED-SHA256
    \"b3750439ede62911c035c52c242d9bc227d8aa9dd155dbe6c5315862e4d8af30\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((89) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-controller/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((98) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-controller/ArcDocDB/spikes/out/4000908226-check-81446-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "81446"))
 :STARTED-AT-UNIVERSAL-TIME 4000908260)
