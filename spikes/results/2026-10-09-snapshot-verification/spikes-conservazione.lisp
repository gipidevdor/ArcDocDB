(:FINISHED-AT-UNIVERSAL-TIME 4000702899 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((105) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/4000702864-check-41850-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.933823d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57106931 :STORED-BYTES 878349
 :RESULTS
 ((:PATH
   #A((116) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/4000702864-check-41850-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144119 :STORED-BYTES 410942 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144119 :UNCOMPRESSED-SHA256
    \"70c16935358b8f6eda43c5f449e04270f0584eeef78f1d80b25298ca9b0bec27\"
    :COMPRESSED-BYTES 410624 :COMPRESSED-SHA256
    \"189c7c9f8c164787b36caaf933c1ea5a742be04e674c7c5a4af329b8ae20c78e\"))
  (:PATH
   #A((116) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/4000702864-check-41850-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28962812 :STORED-BYTES 467407 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28962812 :UNCOMPRESSED-SHA256
    \"43cf5183fbac62f0dfb7817b951e2529877035d41f972dfc922115891edf06d5\"
    :COMPRESSED-BYTES 467089 :COMPRESSED-SHA256
    \"1528eed5b82e1825e35d9912735774beb270928f878b36c2710d4febe36f95cd\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((96) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((105) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB/spikes/out/4000702864-check-41850-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "41850"))
 :STARTED-AT-UNIVERSAL-TIME 4000702896)
