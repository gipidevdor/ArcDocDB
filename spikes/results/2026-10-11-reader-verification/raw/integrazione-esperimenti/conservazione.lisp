(:FINISHED-AT-UNIVERSAL-TIME 4000708397 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((103) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/reader-verification/ArcDocDB/spikes/out/4000708366-check-83851-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.751599d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57106076 :STORED-BYTES 878079
 :RESULTS
 ((:PATH
   #A((114) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/reader-verification/ArcDocDB/spikes/out/4000708366-check-83851-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144051 :STORED-BYTES 410959 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144051 :UNCOMPRESSED-SHA256
    \"ddb2b5b04f4b700c5f5acdc13c35cc36eca4c0f0c05af89706655c815cc80135\"
    :COMPRESSED-BYTES 410641 :COMPRESSED-SHA256
    \"709b2716282e366acdffd7869d8b28c3ec2bf87f6e55f9771483e3f7a489ada8\"))
  (:PATH
   #A((114) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/reader-verification/ArcDocDB/spikes/out/4000708366-check-83851-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28962025 :STORED-BYTES 467120 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28962025 :UNCOMPRESSED-SHA256
    \"f6b147ac44e8f8379d6a18ed799e748eb70ac4b0c277d16f7416585e76661b0d\"
    :COMPRESSED-BYTES 466802 :COMPRESSED-SHA256
    \"c4d53563b119445594ba204c9e6152192b8f90dfe58d7d6921b481bac524cf50\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((94) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/reader-verification/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((103) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/reader-verification/ArcDocDB/spikes/out/4000708366-check-83851-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "83851"))
 :STARTED-AT-UNIVERSAL-TIME 4000708395)
