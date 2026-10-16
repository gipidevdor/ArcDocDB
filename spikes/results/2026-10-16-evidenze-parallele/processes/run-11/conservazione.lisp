(:FINISHED-AT-UNIVERSAL-TIME 4001157303 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((111) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001157172-command-78589-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.814797d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2186422 :STORED-BYTES 213565
 :RESULTS
 ((:PATH
   #A((122) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001157172-command-78589-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2186422 :STORED-BYTES 213565 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2186422 :UNCOMPRESSED-SHA256
    \"a558a6bc0b69fb8610dcb06d0a75fcc976ba97287913e78affe5baea8ba45904\"
    :COMPRESSED-BYTES 213248 :COMPRESSED-SHA256
    \"245ca602a10d2dfb09d68bed1921d8fedc8cdf4e0885d88b59b059ce9a765afa\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001157172-command-78589-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "78589"))
 :STARTED-AT-UNIVERSAL-TIME 4001157302)
