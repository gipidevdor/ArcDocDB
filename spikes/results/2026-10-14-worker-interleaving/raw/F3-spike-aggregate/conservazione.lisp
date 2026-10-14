(:FINISHED-AT-UNIVERSAL-TIME 4001003435 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((103) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003403-check-31002-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.568652d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57106093 :STORED-BYTES 878128
 :RESULTS
 ((:PATH
   #A((114) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003403-check-31002-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144051 :STORED-BYTES 410959 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144051 :UNCOMPRESSED-SHA256
    \"50dd0e760649368a2b13c7a4455238f232b00ac85fe8431aa3122a4c43373b77\"
    :COMPRESSED-BYTES 410641 :COMPRESSED-SHA256
    \"47132726dc62f8dd94e13f701331ce9ced738b9c4382bb030d556a74e4dd8153\"))
  (:PATH
   #A((114) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003403-check-31002-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28962042 :STORED-BYTES 467169 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28962042 :UNCOMPRESSED-SHA256
    \"33aa57e766334914f51bbf52af350792f72f7c10754eda1dac73399add178cbd\"
    :COMPRESSED-BYTES 466851 :COMPRESSED-SHA256
    \"faa23c4863e11c4c55c1b9ca21573466680faf68afd066c4e22ced3eec382309\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003403-check-31002-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "31002"))
 :STARTED-AT-UNIVERSAL-TIME 4001003433)
