(:FINISHED-AT-UNIVERSAL-TIME 4001156077 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((111) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001156028-command-24549-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.990094d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1963867 :STORED-BYTES 193961
 :RESULTS
 ((:PATH
   #A((122) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001156028-command-24549-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1963867 :STORED-BYTES 193961 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1963867 :UNCOMPRESSED-SHA256
    \"0f1e93eb6c5ccb9a449c366a461fe9330fe1414a21901a9cb58efda77ec5ff2b\"
    :COMPRESSED-BYTES 193644 :COMPRESSED-SHA256
    \"10df463d912756315c62c9c9fe6976c93376cded9c10381a55aea8e33c12dee1\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001156028-command-24549-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "24549"))
 :STARTED-AT-UNIVERSAL-TIME 4001156076)
