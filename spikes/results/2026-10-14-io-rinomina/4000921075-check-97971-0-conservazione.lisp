(:FINISHED-AT-UNIVERSAL-TIME 4000921110 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((95) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/io-rinomina/ArcDocDB/spikes/out/4000921075-check-97971-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.661767d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57106091 :STORED-BYTES 878040
 :RESULTS
 ((:PATH
   #A((106) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/io-rinomina/ArcDocDB/spikes/out/4000921075-check-97971-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144051 :STORED-BYTES 410957 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144051 :UNCOMPRESSED-SHA256
    \"50bb4962231bb5df5a8dc4d465b2aa842d1bd21da96c8e2b78013817a02d4c01\"
    :COMPRESSED-BYTES 410639 :COMPRESSED-SHA256
    \"499b2cc6d0e29faf66abc44851b710410399663cd020357adf20311b1fcf9e92\"))
  (:PATH
   #A((106) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/io-rinomina/ArcDocDB/spikes/out/4000921075-check-97971-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28962040 :STORED-BYTES 467083 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28962040 :UNCOMPRESSED-SHA256
    \"0af2cbabbb92c92b2ac3f9b8cdbfebaeebb7d18d46a5eadae85e16f0e0c55eee\"
    :COMPRESSED-BYTES 466765 :COMPRESSED-SHA256
    \"618c96a95fc821da1f12095df4541abf499c5318ab4de823c105b6fb55155d27\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((86) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/io-rinomina/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((95) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/io-rinomina/ArcDocDB/spikes/out/4000921075-check-97971-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "97971"))
 :STARTED-AT-UNIVERSAL-TIME 4000921107)
