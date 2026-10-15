(:FINISHED-AT-UNIVERSAL-TIME 4001073977 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((99) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/active-verifica/ArcDocDB/spikes/out/4001073912-check-95806-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 2.803253d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57106642 :STORED-BYTES 878379
 :RESULTS
 ((:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/active-verifica/ArcDocDB/spikes/out/4001073912-check-95806-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144120 :STORED-BYTES 410935 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144120 :UNCOMPRESSED-SHA256
    \"598a692efa60a60d3cd6de71bd0e4736cdd9eacf75a02ebb818cde0a1376dd5b\"
    :COMPRESSED-BYTES 410617 :COMPRESSED-SHA256
    \"4fc92bc4c0aa1c56afa1c6e5ae9d471cf8d44e61fbdd2b6073267f66f6a26443\"))
  (:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/active-verifica/ArcDocDB/spikes/out/4001073912-check-95806-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28962522 :STORED-BYTES 467444 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28962522 :UNCOMPRESSED-SHA256
    \"6ffa653111ec1c6a8c35fc992dcdc8b6d7a6224011b60677c2d2bab8826e4cbb\"
    :COMPRESSED-BYTES 467126 :COMPRESSED-SHA256
    \"7c68a9a3c3675accda894b88e64710d6931d86b99653b21c6af90f47a0401512\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((90) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/active-verifica/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((99) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/active-verifica/ArcDocDB/spikes/out/4001073912-check-95806-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "95806"))
 :STARTED-AT-UNIVERSAL-TIME 4001073974)
