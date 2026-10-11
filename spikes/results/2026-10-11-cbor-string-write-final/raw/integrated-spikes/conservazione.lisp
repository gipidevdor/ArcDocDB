(:FINISHED-AT-UNIVERSAL-TIME 4000710882 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((101) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000710848-check-49601-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.760688d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57106851 :STORED-BYTES 878287
 :RESULTS
 ((:PATH
   #A((112) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000710848-check-49601-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144118 :STORED-BYTES 410946 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144118 :UNCOMPRESSED-SHA256
    \"1be6500aea4aa542fd02284b673b96c37f4afd1d47a69ccc7736da5141c0593f\"
    :COMPRESSED-BYTES 410628 :COMPRESSED-SHA256
    \"538e940750c98c6b4e74dc3626a19c057e360fe19511dd6ff186b42d6579790e\"))
  (:PATH
   #A((112) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000710848-check-49601-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28962733 :STORED-BYTES 467341 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28962733 :UNCOMPRESSED-SHA256
    \"5ef97f933545f7a8ca9b53cad4cc51339553998e8b8f20a32fb5af2c5753824b\"
    :COMPRESSED-BYTES 467023 :COMPRESSED-SHA256
    \"658174cd3dfe3a89b32a51e837ca61368781da53ed3efb46e00dae96b7f63521\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((92) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((101) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000710848-check-49601-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "49601"))
 :STARTED-AT-UNIVERSAL-TIME 4000710880)
