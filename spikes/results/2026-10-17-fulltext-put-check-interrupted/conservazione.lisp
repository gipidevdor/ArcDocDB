(:FINISHED-AT-UNIVERSAL-TIME 4001220944 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((99) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001220804-command-50297-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.839333d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2594157 :STORED-BYTES 253002
 :RESULTS
 ((:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001220804-command-50297-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2594157 :STORED-BYTES 253002 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2594157 :UNCOMPRESSED-SHA256
    \"eb341e01ba62f46101ffa3128847178ae26111af307b59de06dcc4733caf0ac7\"
    :COMPRESSED-BYTES 252685 :COMPRESSED-SHA256
    \"b9d0ed44fcbe7e03e77e56d9685d5f0ea304d6c0e3b02b93c075a0d2ec12238f\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001220804-command-50297-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "50297"))
 :STARTED-AT-UNIVERSAL-TIME 4001220943)
