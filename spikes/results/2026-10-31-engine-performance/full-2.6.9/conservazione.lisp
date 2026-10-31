(:FINISHED-AT-UNIVERSAL-TIME 4002453920 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002452829-command-95340-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.959618d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3694962 :STORED-BYTES 346684
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002452829-command-95340-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3694962 :STORED-BYTES 346684 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3694962 :UNCOMPRESSED-SHA256
    \"beb122076e3d77ef024959066dc6671e49c102b08b5d4fcb915df75c92978ca3\"
    :COMPRESSED-BYTES 346367 :COMPRESSED-SHA256
    \"7c05f957777bb1d5fd15a55afa6c181fa3525bda5bba65cb943f74aec413939a\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002452829-command-95340-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "95340"))
 :STARTED-AT-UNIVERSAL-TIME 4002453919)
