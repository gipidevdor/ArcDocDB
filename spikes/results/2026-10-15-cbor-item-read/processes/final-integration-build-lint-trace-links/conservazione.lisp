(:FINISHED-AT-UNIVERSAL-TIME 4001074716 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((102) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001074655-command-41141-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.762106d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1488814 :STORED-BYTES 166199
 :RESULTS
 ((:PATH
   #A((113) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001074655-command-41141-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1488814 :STORED-BYTES 166199 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1488814 :UNCOMPRESSED-SHA256
    \"211635b4fec64c18cd5e3b05a3678d547217c9050e9ee0dd2c3e1f99dcf9f8c1\"
    :COMPRESSED-BYTES 165882 :COMPRESSED-SHA256
    \"03aacff383b7dc9cb7693e0a4ea492cd3ce0589c1788c77ab5fcf4b9c82280d0\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((91) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((102) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001074655-command-41141-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "41141"))
 :STARTED-AT-UNIVERSAL-TIME 4001074715)
