(:FINISHED-AT-UNIVERSAL-TIME 4001155340 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((101) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154827-command-95398-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.966189d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2242609 :STORED-BYTES 222128
 :RESULTS
 ((:PATH
   #A((112) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154827-command-95398-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2242609 :STORED-BYTES 222128 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2242609 :UNCOMPRESSED-SHA256
    \"b43f66657802f381966b1b1438234c6d382531a4c12ffe01bf0ad2e86ebfb817\"
    :COMPRESSED-BYTES 221811 :COMPRESSED-SHA256
    \"05af37ca2fef1bb5079f3937ec091b583e595b628158be31bcaf46238cf87c67\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((90) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((101) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154827-command-95398-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "95398"))
 :STARTED-AT-UNIVERSAL-TIME 4001155339)
