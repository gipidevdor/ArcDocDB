(:FINISHED-AT-UNIVERSAL-TIME 4001003437 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((105) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003154-command-24880-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.750819d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1512993 :STORED-BYTES 170748
 :RESULTS
 ((:PATH
   #A((116) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003154-command-24880-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1512993 :STORED-BYTES 170748 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1512993 :UNCOMPRESSED-SHA256
    \"d2deb3983a6456737ef54878f95e3314d7762d2225cfa1c296b494210d5d63a8\"
    :COMPRESSED-BYTES 170431 :COMPRESSED-SHA256
    \"7c06881229e29cbdf4a08044afdaad91357a858faf52138653073748f4338e91\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((94) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((105) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003154-command-24880-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "24880"))
 :STARTED-AT-UNIVERSAL-TIME 4001003436)
