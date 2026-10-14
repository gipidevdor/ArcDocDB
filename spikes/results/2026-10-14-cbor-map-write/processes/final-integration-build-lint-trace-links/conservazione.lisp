(:FINISHED-AT-UNIVERSAL-TIME 4000987930 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((102) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000987886-command-16580-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.807852d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1108645 :STORED-BYTES 139067
 :RESULTS
 ((:PATH
   #A((113) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000987886-command-16580-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1108645 :STORED-BYTES 139067 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1108645 :UNCOMPRESSED-SHA256
    \"078cec8b82800583c4ad35908b3b0e3f42674dac0035dee38d8cafd24dd315b0\"
    :COMPRESSED-BYTES 138750 :COMPRESSED-SHA256
    \"1e383482c9124a160f8105faf2530fdfea346ed944612439c22312c4c5b0b496\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((91) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((102) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000987886-command-16580-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "16580"))
 :STARTED-AT-UNIVERSAL-TIME 4000987928)
