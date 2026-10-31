(:FINISHED-AT-UNIVERSAL-TIME 4002476014 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002474800-command-31437-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.017535d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3785202 :STORED-BYTES 354579
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002474800-command-31437-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3785202 :STORED-BYTES 354579 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3785202 :UNCOMPRESSED-SHA256
    \"79f88bcda6c571426e90a956f08d78d0b91b557224cff344e8679583ff343214\"
    :COMPRESSED-BYTES 354262 :COMPRESSED-SHA256
    \"b18e5f45435f48a2d2f4f7b59d9c41f5a8e6ba4283228381420a9f96be828410\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002474800-command-31437-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "31437"))
 :STARTED-AT-UNIVERSAL-TIME 4002476012)
