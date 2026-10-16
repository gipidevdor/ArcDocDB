(:FINISHED-AT-UNIVERSAL-TIME 4001157056 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((104) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001156949-command-71223-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.936506d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2176434 :STORED-BYTES 214349
 :RESULTS
 ((:PATH
   #A((115) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001156949-command-71223-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2176434 :STORED-BYTES 214349 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2176434 :UNCOMPRESSED-SHA256
    \"a9d856ed0bf5b216aa3ff3ff5e84be66af3c75a7ed5b7cc23a0eea05bc847bf3\"
    :COMPRESSED-BYTES 214032 :COMPRESSED-SHA256
    \"0138c11b4340ae2b790d98a8fe00bf41094edde1b3bcacaac6ba153231c1f9c7\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((93) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((104) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001156949-command-71223-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "71223"))
 :STARTED-AT-UNIVERSAL-TIME 4001157055)
