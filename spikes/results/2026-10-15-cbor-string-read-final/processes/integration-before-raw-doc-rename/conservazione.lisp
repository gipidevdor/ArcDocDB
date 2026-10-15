(:FINISHED-AT-UNIVERSAL-TIME 4001085938 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((111) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001085841-command-55587-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.909015d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2015634 :STORED-BYTES 201113
 :RESULTS
 ((:PATH
   #A((122) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001085841-command-55587-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2015634 :STORED-BYTES 201113 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2015634 :UNCOMPRESSED-SHA256
    \"82257ee2dc564b3ae94ac9a2d8b8e43f04aefc093ed299171ff86a84b2ee80f3\"
    :COMPRESSED-BYTES 200796 :COMPRESSED-SHA256
    \"a42545addb881a8a3417227e0e7cce44646bd57305d21e2912b7a8f475d02035\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((100) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((111) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001085841-command-55587-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "55587"))
 :STARTED-AT-UNIVERSAL-TIME 4001085937)
