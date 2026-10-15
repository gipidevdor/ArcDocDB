(:FINISHED-AT-UNIVERSAL-TIME 4001076426 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((99) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001076369-command-11162-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.842822d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1684430 :STORED-BYTES 179503
 :RESULTS
 ((:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001076369-command-11162-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1684430 :STORED-BYTES 179503 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1684430 :UNCOMPRESSED-SHA256
    \"c0860bd81319d6af4cd237e4e0737e76535025f2e8101ea2c50ed2c3c3ae7946\"
    :COMPRESSED-BYTES 179186 :COMPRESSED-SHA256
    \"c0260e368b3a490bdd6f49f28185592c531265c3d0ad6fa221c5ce7a333d75e5\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001076369-command-11162-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "11162"))
 :STARTED-AT-UNIVERSAL-TIME 4001076425)
