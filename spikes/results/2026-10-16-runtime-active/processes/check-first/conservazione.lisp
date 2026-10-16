(:FINISHED-AT-UNIVERSAL-TIME 4001161271 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((97) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161245-command-519-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.847369d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2022807 :STORED-BYTES 183084
 :RESULTS
 ((:PATH
   #A((108) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161245-command-519-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2022807 :STORED-BYTES 183084 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2022807 :UNCOMPRESSED-SHA256
    \"52ddf9e5dd65fcbad02b287e736b02bc3753a58912318beabcc9e9ac6964290e\"
    :COMPRESSED-BYTES 182767 :COMPRESSED-SHA256
    \"dbb86bcd5d7d0c0f8d500e9af5f6f8b43533e8c986e51d956a81b8a2ff156541\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((88) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((97) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161245-command-519-0/")
  "--jobs" "4" "--finished-owner-pid" #A((3) BASE-CHAR . "519"))
 :STARTED-AT-UNIVERSAL-TIME 4001161270)
