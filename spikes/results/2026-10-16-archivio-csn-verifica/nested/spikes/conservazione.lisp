(:FINISHED-AT-UNIVERSAL-TIME 4001157289 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((105) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001157242-check-81390-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 2.468613d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57106773 :STORED-BYTES 878605
 :RESULTS
 ((:PATH
   #A((116) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001157242-check-81390-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144052 :STORED-BYTES 410955 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144052 :UNCOMPRESSED-SHA256
    \"12eb6d8c68bd7fd0e2aa85faae135a5bb14d1e343e5fd4d7f52f81cd0a5d667f\"
    :COMPRESSED-BYTES 410637 :COMPRESSED-SHA256
    \"f98adead5491ceeedbe333124ff286fc86c3d9d0e5e9209eb4374ca7f7cbf783\"))
  (:PATH
   #A((116) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001157242-check-81390-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28962721 :STORED-BYTES 467650 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28962721 :UNCOMPRESSED-SHA256
    \"eba592063d4e4e306beb0ea39c97f88eb9c25dd86d856956977a8b6d1a00abcc\"
    :COMPRESSED-BYTES 467332 :COMPRESSED-SHA256
    \"232a2281bbd860fcb611362aa017c3fdb117b62e808e36bf18e848b60c4c6e86\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((96) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((105) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001157242-check-81390-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "81390"))
 :STARTED-AT-UNIVERSAL-TIME 4001157286)
