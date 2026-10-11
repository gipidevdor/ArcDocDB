(:FINISHED-AT-UNIVERSAL-TIME 4000703358 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((101) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703323-check-48171-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.853995d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57107631 :STORED-BYTES 878585
 :RESULTS
 ((:PATH
   #A((112) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703323-check-48171-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144119 :STORED-BYTES 410945 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144119 :UNCOMPRESSED-SHA256
    \"c056f44e85a59d75339e72b4a55d58c169bc4ce8f7dd4f254014e9e0cadb217f\"
    :COMPRESSED-BYTES 410627 :COMPRESSED-SHA256
    \"aa243a009efae688cfcff55dee2f1f255dfe7f1cb20a472fcf81fc354890862c\"))
  (:PATH
   #A((112) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703323-check-48171-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28963512 :STORED-BYTES 467640 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28963512 :UNCOMPRESSED-SHA256
    \"f7240a51b049911b43214a5db2444d7efc9643232a27ff3dcb49a5229fb37372\"
    :COMPRESSED-BYTES 467322 :COMPRESSED-SHA256
    \"e195dccd9006fe6aa7754cd8c302f7ed2a823db63f77438f8b59b586e4df7eab\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((92) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((101) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703323-check-48171-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "48171"))
 :STARTED-AT-UNIVERSAL-TIME 4000703356)
