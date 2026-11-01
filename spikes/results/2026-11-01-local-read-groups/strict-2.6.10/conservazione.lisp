(:FINISHED-AT-UNIVERSAL-TIME 4002507325 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002506495-command-91537-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.977516d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3626093 :STORED-BYTES 345875
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002506495-command-91537-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3626093 :STORED-BYTES 345875 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3626093 :UNCOMPRESSED-SHA256
    \"7254c3daba326bf9a4ed4481e111e7efbc81a16fa0b7615576032265a89a78ec\"
    :COMPRESSED-BYTES 345558 :COMPRESSED-SHA256
    \"325775dad40d220ee3514e17e2ae2ee29a6f7590d194053693a1ed313fc3089f\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002506495-command-91537-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "91537"))
 :STARTED-AT-UNIVERSAL-TIME 4002507323)
