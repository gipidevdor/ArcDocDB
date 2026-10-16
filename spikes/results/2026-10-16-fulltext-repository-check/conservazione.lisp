(:FINISHED-AT-UNIVERSAL-TIME 4001156932 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((99) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001156364-command-34977-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 2.861822d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2084242 :STORED-BYTES 216810
 :RESULTS
 ((:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001156364-command-34977-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2084242 :STORED-BYTES 216810 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2084242 :UNCOMPRESSED-SHA256
    \"725cfe2f5a4a16a22e2f9fc2941f2c56792674b89718bff40c160dbc9be7c4b7\"
    :COMPRESSED-BYTES 216493 :COMPRESSED-SHA256
    \"1e4bbce2104fdd83111b03f6a655f533d76983c1a658faabe03fc7b0d6abccd9\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB/spikes/out/4001156364-command-34977-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "34977"))
 :STARTED-AT-UNIVERSAL-TIME 4001156928)
