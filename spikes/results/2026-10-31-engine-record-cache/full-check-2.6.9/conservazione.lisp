(:FINISHED-AT-UNIVERSAL-TIME 4002461827 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002460721-command-33511-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.921749d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3702939 :STORED-BYTES 348494
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002460721-command-33511-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3702939 :STORED-BYTES 348494 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3702939 :UNCOMPRESSED-SHA256
    \"3184855d747c5d5f1d78efdb0c345aea379fdd529a3093454bf06af503ee22b9\"
    :COMPRESSED-BYTES 348177 :COMPRESSED-SHA256
    \"9a7ce534a7ca3794bc18d4e03ec6670d9c337c5a1dffc586a0ef678b244f6256\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((101) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((112) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002460721-command-33511-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "33511"))
 :STARTED-AT-UNIVERSAL-TIME 4002461825)
