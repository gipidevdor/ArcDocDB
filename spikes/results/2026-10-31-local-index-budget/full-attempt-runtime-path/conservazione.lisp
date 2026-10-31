(:FINISHED-AT-UNIVERSAL-TIME 4002436534 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002436096-command-14293-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.09884d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3519508 :STORED-BYTES 327851
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002436096-command-14293-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3519508 :STORED-BYTES 327851 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3519508 :UNCOMPRESSED-SHA256
    \"ee5fc300ad4a303b061f0b83c806eb5a79961846770c3aad63d1232a9f55cb4a\"
    :COMPRESSED-BYTES 327534 :COMPRESSED-SHA256
    \"32103f2afa4e0607eebd08b2233df9c8621cb90b474af191ec82eee6def44458\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002436096-command-14293-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "14293"))
 :STARTED-AT-UNIVERSAL-TIME 4002436532)
