(:FINISHED-AT-UNIVERSAL-TIME 4002460293 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002460281-command-26406-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.838887d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1271403 :STORED-BYTES 177998
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002460281-command-26406-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1271403 :STORED-BYTES 177998 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1271403 :UNCOMPRESSED-SHA256
    \"c27703273afcdf132be03cacbae27783d75c81873d28a348a508e3183872de5a\"
    :COMPRESSED-BYTES 177681 :COMPRESSED-SHA256
    \"a00033f714f132e9a8907b74fa0d4b23cce307ca25f0456aec295279b7bb1d1b\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002460281-command-26406-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "26406"))
 :STARTED-AT-UNIVERSAL-TIME 4002460291)
