(:FINISHED-AT-UNIVERSAL-TIME 4002450870 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((110) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002450819-check-72259-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.800418d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57238263 :STORED-BYTES 896099
 :RESULTS
 ((:PATH
   #A((121) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002450819-check-72259-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28151197 :STORED-BYTES 412058 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28151197 :UNCOMPRESSED-SHA256
    \"f25bd45fe21ac0524e942c1f866ef3fdba3ea46ef9db27b5c284f9ed603407c3\"
    :COMPRESSED-BYTES 411740 :COMPRESSED-SHA256
    \"dfc53d66566f8e3aa9c56622d7431c0e6ff559435016f00d3d06b4c47471aee3\"))
  (:PATH
   #A((121) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002450819-check-72259-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 29087066 :STORED-BYTES 484041 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 29087066 :UNCOMPRESSED-SHA256
    \"eec2845353ef86f509b38f497627c2153b40ea821765996731944c5c37943afc\"
    :COMPRESSED-BYTES 483723 :COMPRESSED-SHA256
    \"04ab7d237621c4484ac917bb2d6cd7abd3448438de131c61b2076e29faed80fa\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002450819-check-72259-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "72259"))
 :STARTED-AT-UNIVERSAL-TIME 4002450868)
