(:FINISHED-AT-UNIVERSAL-TIME 4000918982 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((102) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000918941-command-85849-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.960322d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1050740 :STORED-BYTES 133199
 :RESULTS
 ((:PATH
   #A((113) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000918941-command-85849-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1050740 :STORED-BYTES 133199 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1050740 :UNCOMPRESSED-SHA256
    \"d9c4cad5d8971aeb4985c77ccafa7642e5d007fa447e425f0b5946a10ed26412\"
    :COMPRESSED-BYTES 132882 :COMPRESSED-SHA256
    \"ffa0608a89a5c3ebe3df9e025c1d4a4012dadcfb0a5f190103dcd958306b4f98\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000918941-command-85849-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "85849"))
 :STARTED-AT-UNIVERSAL-TIME 4000918980)
