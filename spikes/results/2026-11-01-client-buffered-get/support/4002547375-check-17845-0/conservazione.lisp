(:FINISHED-AT-UNIVERSAL-TIME 4002547425 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((110) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002547375-check-17845-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.723314d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57238498 :STORED-BYTES 896182
 :RESULTS
 ((:PATH
   #A((121) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002547375-check-17845-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28151197 :STORED-BYTES 412052 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28151197 :UNCOMPRESSED-SHA256
    \"0da07069d0f828e95cbcf7ed75732a7fee785d5a21f81351df3e136340c365ed\"
    :COMPRESSED-BYTES 411734 :COMPRESSED-SHA256
    \"fc97d172c56d0a26c78d5d64fc07ada8aaaca89eb3b72cd32f24aeef3fff954e\"))
  (:PATH
   #A((121) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002547375-check-17845-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 29087301 :STORED-BYTES 484130 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 29087301 :UNCOMPRESSED-SHA256
    \"6452f7047c5a6074c445ffcf2304e4c17207c935710124fb9956bb8bdffbfccb\"
    :COMPRESSED-BYTES 483812 :COMPRESSED-SHA256
    \"63152f56c4ec5cf955de1e8922c63af9ca4bdbc66d38232922957442cb074a33\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002547375-check-17845-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "17845"))
 :STARTED-AT-UNIVERSAL-TIME 4002547423)
