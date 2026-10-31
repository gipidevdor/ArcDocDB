(:FINISHED-AT-UNIVERSAL-TIME 4002472768 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((107) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/full-check/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.93453d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3282436 :STORED-BYTES 317820
 :RESULTS
 ((:PATH
   #A((118) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/full-check/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3282436 :STORED-BYTES 317820 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3282436 :UNCOMPRESSED-SHA256
    \"3d0f10915887d3bb11e99b0741e53118b2dbb0f8089540044d4a37455ae1b080\"
    :COMPRESSED-BYTES 317503 :COMPRESSED-SHA256
    \"7ffd86c22386ecca362ccb08fa0d0c63c21d5136dbf51deb3f21cfb5e1b65f9b\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/full-check/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "98772"))
 :STARTED-AT-UNIVERSAL-TIME 4002472766)
