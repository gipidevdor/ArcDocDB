(:FINISHED-AT-UNIVERSAL-TIME 4001161857 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((98) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161322-command-5473-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.970905d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2447956 :STORED-BYTES 235143
 :RESULTS
 ((:PATH
   #A((109) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161322-command-5473-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2447956 :STORED-BYTES 235143 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2447956 :UNCOMPRESSED-SHA256
    \"2d1393c67963b50e5f06caeb53563f2bb16525ab796faabf66394f383c82bacf\"
    :COMPRESSED-BYTES 234826 :COMPRESSED-SHA256
    \"cc1c7363fd955f45fb8e992cfe7878a75932ffeb094dcd9fba09425b45f6a568\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((88) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((98) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161322-command-5473-0/")
  "--jobs" "4" "--finished-owner-pid" #A((4) BASE-CHAR . "5473"))
 :STARTED-AT-UNIVERSAL-TIME 4001161855)
