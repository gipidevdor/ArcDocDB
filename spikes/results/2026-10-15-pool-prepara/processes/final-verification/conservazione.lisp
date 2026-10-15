(:FINISHED-AT-UNIVERSAL-TIME 4001079416 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((99) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001079172-command-83983-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.895057d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1887182 :STORED-BYTES 193041
 :RESULTS
 ((:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001079172-command-83983-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1887182 :STORED-BYTES 193041 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1887182 :UNCOMPRESSED-SHA256
    \"faa682f9522b878b1171f0514cd65c5f049968bb0f58d193d1a3c012dc90d1f2\"
    :COMPRESSED-BYTES 192724 :COMPRESSED-SHA256
    \"0f13eb214c0c81b937278fe0c467f16a1b51a484c101cd3c687110c53dabef16\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((88) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((99) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001079172-command-83983-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "83983"))
 :STARTED-AT-UNIVERSAL-TIME 4001079414)
