(:FINISHED-AT-UNIVERSAL-TIME 4002511238 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((111) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002510007-command-3660-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.118577d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3893227 :STORED-BYTES 367566
 :RESULTS
 ((:PATH
   #A((122) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002510007-command-3660-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3893227 :STORED-BYTES 367566 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3893227 :UNCOMPRESSED-SHA256
    \"e1f36afcedfbc6bc3de14b7725dcbcfba8dbe7375c62f928062150505755e961\"
    :COMPRESSED-BYTES 367249 :COMPRESSED-SHA256
    \"bc818893c548eb28c7fa52601b5304f9aa3bfbaea97f67448e9d22adf9e8b923\")))
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
  #A((111) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002510007-command-3660-0/")
  "--jobs" "4" "--finished-owner-pid" #A((4) BASE-CHAR . "3660"))
 :STARTED-AT-UNIVERSAL-TIME 4002511236)
