(:FINISHED-AT-UNIVERSAL-TIME 4001077976 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((111) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001077811-command-50873-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.22134d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1773433 :STORED-BYTES 188165
 :RESULTS
 ((:PATH
   #A((122) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001077811-command-50873-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1773433 :STORED-BYTES 188165 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1773433 :UNCOMPRESSED-SHA256
    \"1edd0650cb806f70bb0795ca6220d8a2c187df996ac38b9a41538d9229a048b4\"
    :COMPRESSED-BYTES 187848 :COMPRESSED-SHA256
    \"de5d392580f8cf792c880433496541a6724dbbde09fffadd90bede7871f5fcf5\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001077811-command-50873-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "50873"))
 :STARTED-AT-UNIVERSAL-TIME 4001077975)
