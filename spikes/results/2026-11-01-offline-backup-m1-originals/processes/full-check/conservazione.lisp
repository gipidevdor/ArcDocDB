(:FINISHED-AT-UNIVERSAL-TIME 4002527856 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((107) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/full-check/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.861808d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3806024 :STORED-BYTES 370215
 :RESULTS
 ((:PATH
   #A((118) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/full-check/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3806024 :STORED-BYTES 370215 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3806024 :UNCOMPRESSED-SHA256
    \"44ca5c71c34a5121e87ff071e7213060530e51121cf6565f91c95aa40752219d\"
    :COMPRESSED-BYTES 369898 :COMPRESSED-SHA256
    \"adbd7033cfe16bec91e33af456640af7b0f869f98d79cdbfdb14e3cb266315ba\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((36) BASE-CHAR . "/Users/gpicchiarelli/.local/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((93) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((107) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/full-check/")
  "--jobs" "4" "--finished-owner-pid" #A((4) BASE-CHAR . "8446"))
 :STARTED-AT-UNIVERSAL-TIME 4002527855)
