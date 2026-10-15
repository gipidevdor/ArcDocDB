(:FINISHED-AT-UNIVERSAL-TIME 4001074253 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((102) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073778-command-87117-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.121992d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1526243 :STORED-BYTES 172398
 :RESULTS
 ((:PATH
   #A((113) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073778-command-87117-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1526243 :STORED-BYTES 172398 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1526243 :UNCOMPRESSED-SHA256
    \"0c813dc703c063f82fccbd5d3e95ac501a0441bcea35b4fc1292f405ec10560b\"
    :COMPRESSED-BYTES 172081 :COMPRESSED-SHA256
    \"82cda615ef92ad8a1cc5bd1b71d68184fa6ace31572f64dcacb0f248b972dc75\")))
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
  #A((102) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073778-command-87117-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "87117"))
 :STARTED-AT-UNIVERSAL-TIME 4001074252)
