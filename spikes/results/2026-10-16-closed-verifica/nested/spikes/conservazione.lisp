(:FINISHED-AT-UNIVERSAL-TIME 4001155338 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((99) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001155304-check-11298-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.781089d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57105790 :STORED-BYTES 878136
 :RESULTS
 ((:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001155304-check-11298-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144050 :STORED-BYTES 410959 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144050 :UNCOMPRESSED-SHA256
    \"97876d5dc629734f2982d5ea3cc1718d5b92dbf9f5da7b5ffde1c14568f68f5d\"
    :COMPRESSED-BYTES 410641 :COMPRESSED-SHA256
    \"95e325bf36f6c4f017cfdad4e02aad0b350ce0dbdd2f3e1112ac15ee34367e60\"))
  (:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001155304-check-11298-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28961740 :STORED-BYTES 467177 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28961740 :UNCOMPRESSED-SHA256
    \"616dde1e4ea9444c54d7484fad8bf179eb2ff06b6cc15af58e0a83ecd7006a9f\"
    :COMPRESSED-BYTES 466859 :COMPRESSED-SHA256
    \"e10c835d72c73dc2834c2cdfc2e8107a2370d46ff8aa71636daa73e7107bf456\")))
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
  #A((99) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001155304-check-11298-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "11298"))
 :STARTED-AT-UNIVERSAL-TIME 4001155336)
