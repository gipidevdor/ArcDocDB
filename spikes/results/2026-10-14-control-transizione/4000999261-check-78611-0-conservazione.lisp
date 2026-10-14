(:FINISHED-AT-UNIVERSAL-TIME 4000999296 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((103) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/control-transizione/ArcDocDB/spikes/out/4000999261-check-78611-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.649452d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57106256 :STORED-BYTES 878083
 :RESULTS
 ((:PATH
   #A((114) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/control-transizione/ArcDocDB/spikes/out/4000999261-check-78611-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144051 :STORED-BYTES 410959 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144051 :UNCOMPRESSED-SHA256
    \"e2722943596acf7b02d386de3288c25b941003459d6392056c44087aaffa1b60\"
    :COMPRESSED-BYTES 410641 :COMPRESSED-SHA256
    \"5433da14a3dfbcbed64ac3cb7d0c12dbcf66b3a1dc7cb1cfbd0ddb925e001ea0\"))
  (:PATH
   #A((114) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/control-transizione/ArcDocDB/spikes/out/4000999261-check-78611-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28962205 :STORED-BYTES 467124 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28962205 :UNCOMPRESSED-SHA256
    \"f2e62c63adcef301fe2c9d0e2cc9c187f8f726eda696a9f4769d58090425b1b5\"
    :COMPRESSED-BYTES 466806 :COMPRESSED-SHA256
    \"dfd9af1446a6cc3299ce689f6accfc04e96512ce2748f80e6b1fb9dc248f88ab\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((94) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/control-transizione/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((103) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/control-transizione/ArcDocDB/spikes/out/4000999261-check-78611-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "78611"))
 :STARTED-AT-UNIVERSAL-TIME 4000999294)
