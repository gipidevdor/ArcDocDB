(:FINISHED-AT-UNIVERSAL-TIME 4002432498 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((110) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002432441-check-91461-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.744814d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57227820 :STORED-BYTES 894251
 :RESULTS
 ((:PATH
   #A((121) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002432441-check-91461-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28151131 :STORED-BYTES 412079 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28151131 :UNCOMPRESSED-SHA256
    \"064b9d55a029c1ff3c3b3d6bc17ea8eacc2339ed3efda6188363244f48c6fd40\"
    :COMPRESSED-BYTES 411761 :COMPRESSED-SHA256
    \"cf68645faa9c995ec3941d311146218568c7ea908bafcbe34d25816a300f70fe\"))
  (:PATH
   #A((121) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002432441-check-91461-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 29076689 :STORED-BYTES 482172 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 29076689 :UNCOMPRESSED-SHA256
    \"5ed7b754d70f226437bc84e33f435e01ce589086049dc294f132f2b27da7d5e0\"
    :COMPRESSED-BYTES 481854 :COMPRESSED-SHA256
    \"ac74f715761f086d6838a9655d85c5905e820caeda9934d8646b26a3d929fd46\")))
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
  #A((110) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002432441-check-91461-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "91461"))
 :STARTED-AT-UNIVERSAL-TIME 4002432496)
