(:FINISHED-AT-UNIVERSAL-TIME 4000920484 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((97) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/io-rinomina/ArcDocDB/spikes/out/4000920449-command-90116-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.896793d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1078560 :STORED-BYTES 134314
 :RESULTS
 ((:PATH
   #A((108) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/io-rinomina/ArcDocDB/spikes/out/4000920449-command-90116-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1078560 :STORED-BYTES 134314 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1078560 :UNCOMPRESSED-SHA256
    \"9069ef2d74ce1552f44e02324e134ee679a2201e4444bc91a3b7761d50b26e01\"
    :COMPRESSED-BYTES 133997 :COMPRESSED-SHA256
    \"299bf5f9ff487fb3f803a86e2d965f1d1d8c20c3f2faebbee3a9274e1ce5ab60\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((86) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/io-rinomina/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((97) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/io-rinomina/ArcDocDB/spikes/out/4000920449-command-90116-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "90116"))
 :STARTED-AT-UNIVERSAL-TIME 4000920482)
