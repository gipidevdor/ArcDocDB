(:FINISHED-AT-UNIVERSAL-TIME 4000706475 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((102) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/reader-verification/ArcDocDB/spikes/out/4000706439-check-3775-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 2.62269d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57106294 :STORED-BYTES 878071
 :RESULTS
 ((:PATH
   #A((113) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/reader-verification/ArcDocDB/spikes/out/4000706439-check-3775-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144119 :STORED-BYTES 410935 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144119 :UNCOMPRESSED-SHA256
    \"deecec002f9ed1e09df9ba9fdb2206a93be904eb22c4136096b73cf398a0abf8\"
    :COMPRESSED-BYTES 410617 :COMPRESSED-SHA256
    \"08cbaed90b550cef5f6589836a8e3749aaff13844ac0ba5b4b54871b34dd1243\"))
  (:PATH
   #A((113) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/reader-verification/ArcDocDB/spikes/out/4000706439-check-3775-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28962175 :STORED-BYTES 467136 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28962175 :UNCOMPRESSED-SHA256
    \"27477ddeac95e5e4ea8b0e34ec10f81806118503b2834c9690058a7dbb6c55fb\"
    :COMPRESSED-BYTES 466818 :COMPRESSED-SHA256
    \"cdd305a2457b2a2a7f21e579c0d52968f67c15d836caf9b22417ea0ced2031f0\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((94) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/reader-verification/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((102) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/reader-verification/ArcDocDB/spikes/out/4000706439-check-3775-0/")
  "--jobs" "4" "--finished-owner-pid" #A((4) BASE-CHAR . "3775"))
 :STARTED-AT-UNIVERSAL-TIME 4000706471)
