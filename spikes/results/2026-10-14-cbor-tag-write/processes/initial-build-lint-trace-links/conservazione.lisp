(:FINISHED-AT-UNIVERSAL-TIME 4000996702 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((102) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996656-command-60753-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.930953d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1274223 :STORED-BYTES 149364
 :RESULTS
 ((:PATH
   #A((113) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996656-command-60753-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1274223 :STORED-BYTES 149364 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1274223 :UNCOMPRESSED-SHA256
    \"07e10b78fa463a9c88284093d4a8d513d68ea7c13a33f9834e5a7e9a6615bcf5\"
    :COMPRESSED-BYTES 149047 :COMPRESSED-SHA256
    \"43185e975389a26efc85c75d9d8a2a77db42642104c5e077a3d18d27aea26ede\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996656-command-60753-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "60753"))
 :STARTED-AT-UNIVERSAL-TIME 4000996700)
