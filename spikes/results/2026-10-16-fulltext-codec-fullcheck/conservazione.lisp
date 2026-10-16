(:FINISHED-AT-UNIVERSAL-TIME 4001160348 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((99) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001159869-command-51101-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.952022d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2414253 :STORED-BYTES 237842
 :RESULTS
 ((:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001159869-command-51101-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2414253 :STORED-BYTES 237842 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2414253 :UNCOMPRESSED-SHA256
    \"670bbc5eab614bfaa6aa421088dced59def3b3f4f9a6044b3e0689ad809874df\"
    :COMPRESSED-BYTES 237525 :COMPRESSED-SHA256
    \"937ae9524438171da63e5cbe3753d4c9aa16d668d6b7b9430b76b59ec4d9534e\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((88) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((99) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001159869-command-51101-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "51101"))
 :STARTED-AT-UNIVERSAL-TIME 4001160346)
