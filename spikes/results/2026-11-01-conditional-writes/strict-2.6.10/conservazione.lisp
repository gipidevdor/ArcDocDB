(:FINISHED-AT-UNIVERSAL-TIME 4002510856 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((111) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002510007-command-3659-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.04539d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3654273 :STORED-BYTES 349230
 :RESULTS
 ((:PATH
   #A((122) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002510007-command-3659-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3654273 :STORED-BYTES 349230 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3654273 :UNCOMPRESSED-SHA256
    \"23358549cd5496ccfce933cd119700a6f4b7c2ab196166a77f5044de7d0b535d\"
    :COMPRESSED-BYTES 348913 :COMPRESSED-SHA256
    \"d11fb2a6c53c98e07c965ea39195e0071847791587f08dd0678f7e1ed831cd71\")))
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
  #A((111) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002510007-command-3659-0/")
  "--jobs" "4" "--finished-owner-pid" #A((4) BASE-CHAR . "3659"))
 :STARTED-AT-UNIVERSAL-TIME 4002510855)
