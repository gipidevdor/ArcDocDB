(:FINISHED-AT-UNIVERSAL-TIME 4002495801 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002494981-command-65372-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.914983d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3560270 :STORED-BYTES 338474
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002494981-command-65372-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3560270 :STORED-BYTES 338474 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3560270 :UNCOMPRESSED-SHA256
    \"fa340903ed57f18c6b264e9db6bf21ef9226eb605090ad5f8d257364a6082628\"
    :COMPRESSED-BYTES 338157 :COMPRESSED-SHA256
    \"721a0fe6fffeea85202679b75f9dbecab896d5edc479e83185ef1ad5dfc6c301\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002494981-command-65372-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "65372"))
 :STARTED-AT-UNIVERSAL-TIME 4002495800)
