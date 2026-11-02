(:FINISHED-AT-UNIVERSAL-TIME 4002632641 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002631245-command-28116-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.008754d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 4235250 :STORED-BYTES 398520
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002631245-command-28116-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 4235250 :STORED-BYTES 398520 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 4235250 :UNCOMPRESSED-SHA256
    \"445e0f42f69f0728b6cc71b4700ffe43d8cdf61582d9e0f3bdebb3833cb402e3\"
    :COMPRESSED-BYTES 398203 :COMPRESSED-SHA256
    \"631a3946cc4c342e3b17d78a0b9afcb984f56304256570d827eefbe667674e34\")))
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
  #A((112) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002631245-command-28116-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "28116"))
 :STARTED-AT-UNIVERSAL-TIME 4002632640)
