(:FINISHED-AT-UNIVERSAL-TIME 4000985701 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((102) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000985658-command-59509-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.761132d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1100720 :STORED-BYTES 137839
 :RESULTS
 ((:PATH
   #A((113) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000985658-command-59509-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1100720 :STORED-BYTES 137839 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1100720 :UNCOMPRESSED-SHA256
    \"afae89295c7d8d86c8e382bd620897e695d2e5b582df53d2b64d5da8299adb79\"
    :COMPRESSED-BYTES 137522 :COMPRESSED-SHA256
    \"f947867acbb149f5f0aca9235b18e2b70a5b5b8a28adca9f1538711cd883be97\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000985658-command-59509-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "59509"))
 :STARTED-AT-UNIVERSAL-TIME 4000985699)
