(:FINISHED-AT-UNIVERSAL-TIME 4000712404 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((98) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/4000712370-check-83287-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 2.177538d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57106209 :STORED-BYTES 878170
 :RESULTS
 ((:PATH
   #A((109) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/4000712370-check-83287-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144119 :STORED-BYTES 410933 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144119 :UNCOMPRESSED-SHA256
    \"81186b68ff6ebf1213d08a70c1eb57f7f9ff76232837acf05179bbfe4b70a45e\"
    :COMPRESSED-BYTES 410615 :COMPRESSED-SHA256
    \"e5c68e80024fa5432e35bb20c0a3cb6899b8b11c948d48c633a52b2d5c1d71b4\"))
  (:PATH
   #A((109) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/4000712370-check-83287-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28962090 :STORED-BYTES 467237 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28962090 :UNCOMPRESSED-SHA256
    \"c910fd3248b651f49325e66bc5dae2fa55417aefbe7e1e9d6ab9b2e7ae1005b8\"
    :COMPRESSED-BYTES 466919 :COMPRESSED-SHA256
    \"6a07092b6a53ce50b35fbc4c4bd27a356a1d6f6ea6eeff9cb6739efcb86170c6\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((89) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((98) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/4000712370-check-83287-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "83287"))
 :STARTED-AT-UNIVERSAL-TIME 4000712401)
