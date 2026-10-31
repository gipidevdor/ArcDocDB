(:FINISHED-AT-UNIVERSAL-TIME 4002437394 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((110) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002437342-check-26148-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.747666d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57241167 :STORED-BYTES 896501
 :RESULTS
 ((:PATH
   #A((121) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002437342-check-26148-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28151197 :STORED-BYTES 412057 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28151197 :UNCOMPRESSED-SHA256
    \"a2703390808af89d69c78d717eafd680d838f312cd805596a4395939a7181de4\"
    :COMPRESSED-BYTES 411739 :COMPRESSED-SHA256
    \"818fabc9caeba042189c7faac080f5de224f38dd45ce93819846dabfca2165dc\"))
  (:PATH
   #A((121) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002437342-check-26148-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 29089970 :STORED-BYTES 484444 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 29089970 :UNCOMPRESSED-SHA256
    \"b06291ef39371f610048215f5c0c174aff3a82bc0da304b946d3fd80be7c4acd\"
    :COMPRESSED-BYTES 484126 :COMPRESSED-SHA256
    \"5f99361b73ced65378c6c2bf8c4bb14f94e8bc3db77bd2391bac81d0229f938d\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002437342-check-26148-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "26148"))
 :STARTED-AT-UNIVERSAL-TIME 4002437391)
