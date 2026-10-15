(:FINISHED-AT-UNIVERSAL-TIME 4001077895 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((104) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/decisioni-verifica/ArcDocDB/spikes/out/4001077549-command-45633-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.786368d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1905509 :STORED-BYTES 195798
 :RESULTS
 ((:PATH
   #A((115) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/decisioni-verifica/ArcDocDB/spikes/out/4001077549-command-45633-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1905509 :STORED-BYTES 195798 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1905509 :UNCOMPRESSED-SHA256
    \"e272828a662f87d95bb50e2e4bacfabc41e5081986654c71d6d769da53ef4c8a\"
    :COMPRESSED-BYTES 195481 :COMPRESSED-SHA256
    \"1073705e312705e0010761618e0e60750c2c3488577689d1e9e115696e46d224\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((93) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/decisioni-verifica/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((104) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/decisioni-verifica/ArcDocDB/spikes/out/4001077549-command-45633-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "45633"))
 :STARTED-AT-UNIVERSAL-TIME 4001077894)
