(:FINISHED-AT-UNIVERSAL-TIME 4001076292 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((99) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001075987-command-94133-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.869514d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1685570 :STORED-BYTES 182665
 :RESULTS
 ((:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001075987-command-94133-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1685570 :STORED-BYTES 182665 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1685570 :UNCOMPRESSED-SHA256
    \"234669ab282b2d98d190deb311ae7850b1d6219dd70813379d33d0fd90cf902c\"
    :COMPRESSED-BYTES 182348 :COMPRESSED-SHA256
    \"e5d5936f9fc4e49dc65f2df1fbf53f3a8064c3af7eeedc8d9b001e562b20f2d4\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001075987-command-94133-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "94133"))
 :STARTED-AT-UNIVERSAL-TIME 4001076291)
