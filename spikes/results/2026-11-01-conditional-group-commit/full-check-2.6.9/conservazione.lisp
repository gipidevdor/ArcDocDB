(:FINISHED-AT-UNIVERSAL-TIME 4002516493 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002515017-command-42186-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.139329d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3919291 :STORED-BYTES 369939
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002515017-command-42186-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3919291 :STORED-BYTES 369939 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3919291 :UNCOMPRESSED-SHA256
    \"815e803c8f88349068bcb8847150dd69601fba783d76ca03d7c2e498fc0bb7be\"
    :COMPRESSED-BYTES 369622 :COMPRESSED-SHA256
    \"d1be111d009e2a3a5ad4a3308c241dc5f82f30fc6938d20c0391b31605e8ad0f\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002515017-command-42186-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "42186"))
 :STARTED-AT-UNIVERSAL-TIME 4002516491)
