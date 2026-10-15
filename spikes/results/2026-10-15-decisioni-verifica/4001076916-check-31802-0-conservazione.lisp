(:FINISHED-AT-UNIVERSAL-TIME 4001076949 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((102) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/decisioni-verifica/ArcDocDB/spikes/out/4001076916-check-31802-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.923052d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57106172 :STORED-BYTES 878120
 :RESULTS
 ((:PATH
   #A((113) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/decisioni-verifica/ArcDocDB/spikes/out/4001076916-check-31802-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144051 :STORED-BYTES 410961 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144051 :UNCOMPRESSED-SHA256
    \"d7cd8191a606e2367b13ddea337802c8c8803188372e2eb1ed4295fda985ed5c\"
    :COMPRESSED-BYTES 410643 :COMPRESSED-SHA256
    \"4a9367f0e5a1c13fc83ed2aa3c0433c16aa29f6b63944b1fe363e97509438670\"))
  (:PATH
   #A((113) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/decisioni-verifica/ArcDocDB/spikes/out/4001076916-check-31802-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28962121 :STORED-BYTES 467159 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28962121 :UNCOMPRESSED-SHA256
    \"e2a3a97323804c51198ab9c1675dfe0139ebc76d29d3d6c587e414cfb8978ae2\"
    :COMPRESSED-BYTES 466841 :COMPRESSED-SHA256
    \"d69c3963b3ebc355959d886602a97d32c0b5bc09abe1a03328f9991823c77cfc\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((93) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/decisioni-verifica/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((102) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/decisioni-verifica/ArcDocDB/spikes/out/4001076916-check-31802-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "31802"))
 :STARTED-AT-UNIVERSAL-TIME 4001076947)
