(:FINISHED-AT-UNIVERSAL-TIME 4002567067 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002565740-command-81365-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.81147d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 4223027 :STORED-BYTES 397875
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002565740-command-81365-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 4223027 :STORED-BYTES 397875 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 4223027 :UNCOMPRESSED-SHA256
    \"83dfae7749afb5f51ef57d0a6ac67edfca4a657f84d539112a462e52315b5d91\"
    :COMPRESSED-BYTES 397558 :COMPRESSED-SHA256
    \"70060080718cf2b6b9fd3cb16b24b6e93e142ceac1bf4b0146c8211578bd98ce\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002565740-command-81365-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "81365"))
 :STARTED-AT-UNIVERSAL-TIME 4002567066)
