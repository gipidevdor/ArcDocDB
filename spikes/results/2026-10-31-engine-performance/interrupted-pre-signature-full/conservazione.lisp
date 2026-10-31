(:FINISHED-AT-UNIVERSAL-TIME 4002452590 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002452336-command-90621-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.025275d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3465203 :STORED-BYTES 325720
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002452336-command-90621-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3465203 :STORED-BYTES 325720 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3465203 :UNCOMPRESSED-SHA256
    \"68e210ea3ac7cd3b97974de3a02de1c8472152e2bfa1a394f44a5e9ccd3e1956\"
    :COMPRESSED-BYTES 325403 :COMPRESSED-SHA256
    \"ac4af1fb8f8d64afb7dc36ca0668f5aed6731bffba216b2ab1aa3cd98cfc7bf9\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002452336-command-90621-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "90621"))
 :STARTED-AT-UNIVERSAL-TIME 4002452588)
