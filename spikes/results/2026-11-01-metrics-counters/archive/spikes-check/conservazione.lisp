(:FINISHED-AT-UNIVERSAL-TIME 4002528715 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((108) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/4002528658-check-35152-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.674608d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57237538 :STORED-BYTES 896126
 :RESULTS
 ((:PATH
   #A((119) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/4002528658-check-35152-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28151129 :STORED-BYTES 412068 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28151129 :UNCOMPRESSED-SHA256
    \"1abefac0d2f5e06546b124329dbb5d59cd05c8857a30113034d2bb6bd055b1ce\"
    :COMPRESSED-BYTES 411750 :COMPRESSED-SHA256
    \"c4f43437935fc3f160ef3763b86109c2f24aedc63bdf633e872348a4afede8d5\"))
  (:PATH
   #A((119) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/4002528658-check-35152-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 29086409 :STORED-BYTES 484058 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 29086409 :UNCOMPRESSED-SHA256
    \"9fdf02533090dfc9b7abbfb8eb53f6dcd152ff3a2db1c079679b03b439e0fb58\"
    :COMPRESSED-BYTES 483740 :COMPRESSED-SHA256
    \"6d839f65bf537826441d4ee2815f3fbf7c7c3c058f09142f2507f4769a2bab98\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((99) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((108) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/4002528658-check-35152-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "35152"))
 :STARTED-AT-UNIVERSAL-TIME 4002528713)
