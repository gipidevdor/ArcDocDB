(:FINISHED-AT-UNIVERSAL-TIME 4002516031 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002515017-command-42187-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.841722d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3681090 :STORED-BYTES 351654
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002515017-command-42187-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3681090 :STORED-BYTES 351654 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3681090 :UNCOMPRESSED-SHA256
    \"e7e14562a58be2764c04454c509b68cb8396e547fc17bb96433cf4f37ec6a1dc\"
    :COMPRESSED-BYTES 351337 :COMPRESSED-SHA256
    \"698825c58bdff115fb026063105858a87a99b80861597d1d4677de417a2cb755\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/Users/gpicchiarelli/.local/sbcl/2.6.10/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((101) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((112) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002515017-command-42187-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "42187"))
 :STARTED-AT-UNIVERSAL-TIME 4002516030)
