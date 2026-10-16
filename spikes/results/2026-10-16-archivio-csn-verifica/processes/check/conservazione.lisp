(:FINISHED-AT-UNIVERSAL-TIME 4001157291 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((107) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001156715-command-58097-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.755983d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2387878 :STORED-BYTES 229831
 :RESULTS
 ((:PATH
   #A((118) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001156715-command-58097-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2387878 :STORED-BYTES 229831 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2387878 :UNCOMPRESSED-SHA256
    \"085ff75cbdb6b344eecd1463277b7195c14ad7540401e40554368bfc3a1e6d6a\"
    :COMPRESSED-BYTES 229514 :COMPRESSED-SHA256
    \"809a1191678a26623eecde2dd338b4ca5294f2c77306b1d9098a51525a98e54d\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((96) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((107) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001156715-command-58097-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "58097"))
 :STARTED-AT-UNIVERSAL-TIME 4001157290)
