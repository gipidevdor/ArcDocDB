(:FINISHED-AT-UNIVERSAL-TIME 4002474745 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002474222-command-23051-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.078821d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3582972 :STORED-BYTES 339147
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002474222-command-23051-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3582972 :STORED-BYTES 339147 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3582972 :UNCOMPRESSED-SHA256
    \"a5694957a426f8a1fe07f3bf8d58b3cdc0e8d234acd662d286e3b2d30153c996\"
    :COMPRESSED-BYTES 338830 :COMPRESSED-SHA256
    \"9f1dacccbae017d368d010cc95fab4ce03e32ac6358822904743fb850911a4d7\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002474222-command-23051-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "23051"))
 :STARTED-AT-UNIVERSAL-TIME 4002474744)
