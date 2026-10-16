(:FINISHED-AT-UNIVERSAL-TIME 4001155110 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((96) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001155075-check-3491-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.9044d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57106046 :STORED-BYTES 878198
 :RESULTS
 ((:PATH
   #A((107) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001155075-check-3491-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144119 :STORED-BYTES 410936 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144119 :UNCOMPRESSED-SHA256
    \"0eb83f2b8c7f091fbe5e3ec16ad2d90b5bdece6987f70aed73a5c6d4d4d4968a\"
    :COMPRESSED-BYTES 410618 :COMPRESSED-SHA256
    \"569589c9a387cc3821fe9506da849c6f974e2cb09fc8ab94da4c1e0ee3e82301\"))
  (:PATH
   #A((107) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001155075-check-3491-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28961927 :STORED-BYTES 467262 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28961927 :UNCOMPRESSED-SHA256
    \"fb7b9eddc48edc057b092422b3b884258113df8070c7f2ee8a43cbdacaf8881f\"
    :COMPRESSED-BYTES 466944 :COMPRESSED-SHA256
    \"8b174db7b22fd073f0153c0f7e3e117c50f20569c5d0a3d358c63734d3106e83\")))
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
  #A((96) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001155075-check-3491-0/")
  "--jobs" "4" "--finished-owner-pid" #A((4) BASE-CHAR . "3491"))
 :STARTED-AT-UNIVERSAL-TIME 4001155108)
