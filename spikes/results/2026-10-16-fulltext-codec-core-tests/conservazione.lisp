(:FINISHED-AT-UNIVERSAL-TIME 4001159345 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((99) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001159325-command-44370-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.743551d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1705971 :STORED-BYTES 159274
 :RESULTS
 ((:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001159325-command-44370-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1705971 :STORED-BYTES 159274 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1705971 :UNCOMPRESSED-SHA256
    \"59d046bce4c84e920a747f3ff4afecee0b5b4972b343ee630bad7dfc40aa5f96\"
    :COMPRESSED-BYTES 158957 :COMPRESSED-SHA256
    \"c252dfdad8be682ec1283b78a7eac78f65b42a132347feca5dcfb541b50e1a7b\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001159325-command-44370-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "44370"))
 :STARTED-AT-UNIVERSAL-TIME 4001159344)
