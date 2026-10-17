(:FINISHED-AT-UNIVERSAL-TIME 4001217606 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((99) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217447-command-80269-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 2.014367d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2473275 :STORED-BYTES 243174
 :RESULTS
 ((:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217447-command-80269-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2473275 :STORED-BYTES 243174 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2473275 :UNCOMPRESSED-SHA256
    \"0ca53991a28c8e4010ea59f246d27c9a5c3b073579e2efe39bfddee2a6c11a9f\"
    :COMPRESSED-BYTES 242857 :COMPRESSED-SHA256
    \"383b73393b5929488c499f54a29d504325e9d1747a7371923e348b7c792d4a16\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217447-command-80269-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "80269"))
 :STARTED-AT-UNIVERSAL-TIME 4001217603)
