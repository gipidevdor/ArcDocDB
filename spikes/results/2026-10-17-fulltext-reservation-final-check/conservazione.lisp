(:FINISHED-AT-UNIVERSAL-TIME 4001218446 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((99) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001217692-command-85631-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.008511d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2516655 :STORED-BYTES 248380
 :RESULTS
 ((:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001217692-command-85631-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2516655 :STORED-BYTES 248380 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2516655 :UNCOMPRESSED-SHA256
    \"36d0381fcfdf1eedd60e6552adb7359fc3adffa72776cdab4e8d80c20b59403a\"
    :COMPRESSED-BYTES 248063 :COMPRESSED-SHA256
    \"59946c6c2f9dfd86ac7756de718f80bb2f16cff55e266f415049bf0675847214\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001217692-command-85631-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "85631"))
 :STARTED-AT-UNIVERSAL-TIME 4001218444)
