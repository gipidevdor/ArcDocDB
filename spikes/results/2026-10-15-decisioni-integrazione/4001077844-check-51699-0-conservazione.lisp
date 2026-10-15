(:FINISHED-AT-UNIVERSAL-TIME 4001077893 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((102) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/decisioni-verifica/ArcDocDB/spikes/out/4001077844-check-51699-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.833643d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57107119 :STORED-BYTES 878611
 :RESULTS
 ((:PATH
   #A((113) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/decisioni-verifica/ArcDocDB/spikes/out/4001077844-check-51699-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144052 :STORED-BYTES 410963 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144052 :UNCOMPRESSED-SHA256
    \"0f90866b0c3af55e02bb8b61f92d81f9f317ed4276e626f04292c5443a2b7e76\"
    :COMPRESSED-BYTES 410645 :COMPRESSED-SHA256
    \"14ee2e13a23b05b45188c2fe48ab10db00d52141b7cba9cdba8820f79f4346f4\"))
  (:PATH
   #A((113) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/decisioni-verifica/ArcDocDB/spikes/out/4001077844-check-51699-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28963067 :STORED-BYTES 467648 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28963067 :UNCOMPRESSED-SHA256
    \"a634f3ef26c16a8604a812b267cfab1c3d709e5e03086c1e7e1cbe1857ce9bb6\"
    :COMPRESSED-BYTES 467330 :COMPRESSED-SHA256
    \"4176e4847ace24ffad8da14956bb62d5b53840c5887f7f0feeb428c1d554f932\")))
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
  #A((102) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/decisioni-verifica/ArcDocDB/spikes/out/4001077844-check-51699-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "51699"))
 :STARTED-AT-UNIVERSAL-TIME 4001077891)
