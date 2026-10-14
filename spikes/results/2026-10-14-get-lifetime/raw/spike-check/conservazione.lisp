(:FINISHED-AT-UNIVERSAL-TIME 4000997224 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((103) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4000997190-check-85327-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.874413d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57105979 :STORED-BYTES 878121
 :RESULTS
 ((:PATH
   #A((114) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4000997190-check-85327-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144051 :STORED-BYTES 410958 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144051 :UNCOMPRESSED-SHA256
    \"011680fee6cbc2f87b0af495ab3a9c1b080c19bfa219abad2a09bce18d6e936f\"
    :COMPRESSED-BYTES 410640 :COMPRESSED-SHA256
    \"fce5ed1096dfe400fac48349acf5a95e2b994b65eaf7d4929277d32984d74f3e\"))
  (:PATH
   #A((114) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4000997190-check-85327-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28961928 :STORED-BYTES 467163 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28961928 :UNCOMPRESSED-SHA256
    \"689a7ea069b9caf7589d9328986b8e83dd25c7bd516c6301e46aa3f01e14f4ca\"
    :COMPRESSED-BYTES 466845 :COMPRESSED-SHA256
    \"68fb5246cd66d3e0390a66ffe8eec4b2366169b47136f564e19814759957843d\")))
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
  #A((103) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4000997190-check-85327-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "85327"))
 :STARTED-AT-UNIVERSAL-TIME 4000997222)
