(:FINISHED-AT-UNIVERSAL-TIME 4001218478 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((96) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001218444-check-7044-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.842537d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57106100 :STORED-BYTES 878229
 :RESULTS
 ((:PATH
   #A((107) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001218444-check-7044-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144119 :STORED-BYTES 410939 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144119 :UNCOMPRESSED-SHA256
    \"2793624ada44ea5e5836b5ece01cf97a9662c19636da0ef295d6edab9f8c1267\"
    :COMPRESSED-BYTES 410621 :COMPRESSED-SHA256
    \"661db6f4215d1d2f5f663be60a211463ca5a4c7b756bb92a1e3c93fa1af55410\"))
  (:PATH
   #A((107) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001218444-check-7044-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28961981 :STORED-BYTES 467290 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28961981 :UNCOMPRESSED-SHA256
    \"76108c94bbc5996765bd65dca65e739cf37cd86c17c41983301d6cb1b43be833\"
    :COMPRESSED-BYTES 466972 :COMPRESSED-SHA256
    \"a9ac1e99592e9cd3968323b912b59648edc88db35f987e4c2cc1ab79d5bf1849\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001218444-check-7044-0/")
  "--jobs" "4" "--finished-owner-pid" #A((4) BASE-CHAR . "7044"))
 :STARTED-AT-UNIVERSAL-TIME 4001218476)
