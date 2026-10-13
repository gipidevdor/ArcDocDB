(:FINISHED-AT-UNIVERSAL-TIME 4000917947 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((114) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-publication-staging/4000917944-71109/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 2.26791d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2307763 :STORED-BYTES 327367
 :RESULTS
 ((:PATH
   #A((138) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-publication-staging/4000917944-71109/development-large-1.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2307763 :STORED-BYTES 327367 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"development-large-1.lisp.gz\" :UNCOMPRESSED-BYTES 2307763
    :UNCOMPRESSED-SHA256
    \"ac2b99750036b6201c569296da5ed0e615231c0fab956dc1d9dd3a60118ec046\"
    :COMPRESSED-BYTES 327037 :COMPRESSED-SHA256
    \"05d0cc8066d3245b7e92394d82ce09968830b5d2dc1c7474abaf1b77ca970e85\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((88) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((53) BASE-CHAR . "spikes/out/pool-publication-staging/4000917944-71109/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "71109"))
 :STARTED-AT-UNIVERSAL-TIME 4000917944)
