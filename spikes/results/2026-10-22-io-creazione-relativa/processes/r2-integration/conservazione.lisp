(:FINISHED-AT-UNIVERSAL-TIME 4001676287 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((102) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-R2/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.927931d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2632267 :STORED-BYTES 249513
 :RESULTS
 ((:PATH
   #A((113) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-R2/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2632267 :STORED-BYTES 249513 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2632267 :UNCOMPRESSED-SHA256
    \"8086e922c9e871997798fa501737c21a237c53278ba4f88fd30ab3b2597269a2\"
    :COMPRESSED-BYTES 249196 :COMPRESSED-SHA256
    \"2063defea19757db78dd8bb915fdd8d43a1dc66fb0aa156a883cb327c50f9bac\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((96) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((102) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-R2/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "34419"))
 :STARTED-AT-UNIVERSAL-TIME 4001676286)
