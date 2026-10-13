(:FINISHED-AT-UNIVERSAL-TIME 4000922846 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((97) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/io-rinomina/ArcDocDB/spikes/out/4000922580-command-18971-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.932551d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1133129 :STORED-BYTES 143211
 :RESULTS
 ((:PATH
   #A((108) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/io-rinomina/ArcDocDB/spikes/out/4000922580-command-18971-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1133129 :STORED-BYTES 143211 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1133129 :UNCOMPRESSED-SHA256
    \"a158a00d92ef5e2c82dd8143a632f2db5536b3a42e6e4da6f779247ef866ef06\"
    :COMPRESSED-BYTES 142894 :COMPRESSED-SHA256
    \"d02d23ee2300a31f141f5dd34e00727424b63080dfed884f48f272eb3cd43064\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/io-rinomina/ArcDocDB/spikes/out/4000922580-command-18971-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "18971"))
 :STARTED-AT-UNIVERSAL-TIME 4000922844)
