(:FINISHED-AT-UNIVERSAL-TIME 4002472821 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((110) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002472809-command-173-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.81132d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1309967 :STORED-BYTES 180946
 :RESULTS
 ((:PATH
   #A((121) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002472809-command-173-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1309967 :STORED-BYTES 180946 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1309967 :UNCOMPRESSED-SHA256
    \"a420a24a9a52e03bbd4ebdaf31e18e4eb9616a817ee2bdb78a4247f3c8efd11d\"
    :COMPRESSED-BYTES 180629 :COMPRESSED-SHA256
    \"4009809532a2d94f8ffe9b059e41ec5bd2eb4e11b50ccdb9b446b9e83cb1fe3d\")))
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
  #A((110) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002472809-command-173-0/")
  "--jobs" "4" "--finished-owner-pid" #A((3) BASE-CHAR . "173"))
 :STARTED-AT-UNIVERSAL-TIME 4002472820)
