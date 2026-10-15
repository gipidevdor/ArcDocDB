(:FINISHED-AT-UNIVERSAL-TIME 4001073528 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((99) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001073480-command-67324-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.870131d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1475596 :STORED-BYTES 166037
 :RESULTS
 ((:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001073480-command-67324-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1475596 :STORED-BYTES 166037 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1475596 :UNCOMPRESSED-SHA256
    \"40c4ec178f906c9f5e6ea19508638e33d3df0f44ca0bca726467e7888425f316\"
    :COMPRESSED-BYTES 165720 :COMPRESSED-SHA256
    \"e6286a238a42bfdb96849cb93b2f9f6781477165e816e10acd6924e10a425e65\")))
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
  #A((99) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001073480-command-67324-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "67324"))
 :STARTED-AT-UNIVERSAL-TIME 4001073526)
