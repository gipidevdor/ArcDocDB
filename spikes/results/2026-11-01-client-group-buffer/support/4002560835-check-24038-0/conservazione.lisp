(:FINISHED-AT-UNIVERSAL-TIME 4002560892 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((110) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002560835-check-24038-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 2.004115d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57238491 :STORED-BYTES 896693
 :RESULTS
 ((:PATH
   #A((121) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002560835-check-24038-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28151197 :STORED-BYTES 412056 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28151197 :UNCOMPRESSED-SHA256
    \"838c4de26ce732b7cef5eb4dd8e259249090a5df50f456db0bff7656ae066584\"
    :COMPRESSED-BYTES 411738 :COMPRESSED-SHA256
    \"d2109866eb40807fd7815898cbd927b85c3eb1238fca233e3e059ebd704b87a4\"))
  (:PATH
   #A((121) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002560835-check-24038-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 29087294 :STORED-BYTES 484637 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 29087294 :UNCOMPRESSED-SHA256
    \"792303ea83365139aab43c8d3994a1d5d50bfd617f5a896bd0197a29633ecaba\"
    :COMPRESSED-BYTES 484319 :COMPRESSED-SHA256
    \"ac33cb642e0dce5c53d40624c781bdc863ed11eab8186a73aba222665d5f3194\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((101) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((110) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002560835-check-24038-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "24038"))
 :STARTED-AT-UNIVERSAL-TIME 4002560890)
