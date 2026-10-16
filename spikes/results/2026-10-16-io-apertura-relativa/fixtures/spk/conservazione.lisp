(:FINISHED-AT-UNIVERSAL-TIME 4001155577 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((102) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155543-check-16824-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.746413d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57106105 :STORED-BYTES 878150
 :RESULTS
 ((:PATH
   #A((113) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155543-check-16824-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144051 :STORED-BYTES 410961 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144051 :UNCOMPRESSED-SHA256
    \"ef77cf8581027e9cc6406e2d146204f0da386e48fade621cfd34de7599c3fee3\"
    :COMPRESSED-BYTES 410643 :COMPRESSED-SHA256
    \"c706241c6e9479a0882c44f9e5a4653ee663f84853340a38668bf94f5360982a\"))
  (:PATH
   #A((113) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155543-check-16824-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28962054 :STORED-BYTES 467189 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28962054 :UNCOMPRESSED-SHA256
    \"35db84f04e4b49eda74271c092fcc0ea2a85ce2e5caeead65868af44e6b5f80f\"
    :COMPRESSED-BYTES 466871 :COMPRESSED-SHA256
    \"4ab8bc83f3c4a90d47cd046b34200e46c1495124633e16b43ff7913816416c2b\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((93) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((102) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155543-check-16824-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "16824"))
 :STARTED-AT-UNIVERSAL-TIME 4001155574)
