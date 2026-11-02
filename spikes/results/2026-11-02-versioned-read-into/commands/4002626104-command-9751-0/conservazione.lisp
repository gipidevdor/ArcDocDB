(:FINISHED-AT-UNIVERSAL-TIME 4002627490 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((111) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002626104-command-9751-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.092291d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 4234509 :STORED-BYTES 398271
 :RESULTS
 ((:PATH
   #A((122) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002626104-command-9751-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 4234509 :STORED-BYTES 398271 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 4234509 :UNCOMPRESSED-SHA256
    \"ccc9becf0bbab5ab801e7840fd9ade46d6b456b44124726cd827f6dfc68d917a\"
    :COMPRESSED-BYTES 397954 :COMPRESSED-SHA256
    \"310c248bbf35a1269a78bedf56dacd93149d786dee33c9491dd32c44f9335b08\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002626104-command-9751-0/")
  "--jobs" "4" "--finished-owner-pid" #A((4) BASE-CHAR . "9751"))
 :STARTED-AT-UNIVERSAL-TIME 4002627488)
