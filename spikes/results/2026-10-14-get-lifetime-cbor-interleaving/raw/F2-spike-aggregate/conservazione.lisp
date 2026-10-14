(:FINISHED-AT-UNIVERSAL-TIME 4001000428 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((103) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001000396-check-98622-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.640329d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57106094 :STORED-BYTES 878073
 :RESULTS
 ((:PATH
   #A((114) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001000396-check-98622-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144051 :STORED-BYTES 410958 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144051 :UNCOMPRESSED-SHA256
    \"b4f6a04f9beba0a15983fec2b473d4b6b5dcada64296a1e70d24f94fe4bbc3cc\"
    :COMPRESSED-BYTES 410640 :COMPRESSED-SHA256
    \"61b400f2eb272a7b53da3d9612fd3b5071681d546e724055f6f25fb8be99bb11\"))
  (:PATH
   #A((114) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001000396-check-98622-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28962043 :STORED-BYTES 467115 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28962043 :UNCOMPRESSED-SHA256
    \"40b3d7a24a63b97ed21dc67efa09363aa32b5488636946dffef7c3dee16d5996\"
    :COMPRESSED-BYTES 466797 :COMPRESSED-SHA256
    \"52c09af37129637eeada0623700ed1e45173f3621461b9221b296713d184588f\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001000396-check-98622-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "98622"))
 :STARTED-AT-UNIVERSAL-TIME 4001000426)
