(:FINISHED-AT-UNIVERSAL-TIME 4002496199 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002494981-command-65370-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.093525d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3799897 :STORED-BYTES 356613
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002494981-command-65370-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3799897 :STORED-BYTES 356613 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3799897 :UNCOMPRESSED-SHA256
    \"064f2b72da5755817509e3a08581f7004648624a9f84d50bc7d0afbfd574c8cf\"
    :COMPRESSED-BYTES 356296 :COMPRESSED-SHA256
    \"a25164c0370fba5d1a0de7fe0a6cc39d59361a9ddad775d036268ff428734e2a\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002494981-command-65370-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "65370"))
 :STARTED-AT-UNIVERSAL-TIME 4002496197)
