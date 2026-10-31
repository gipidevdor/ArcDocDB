(:FINISHED-AT-UNIVERSAL-TIME 4002448711 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002448108-command-31083-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.998057d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3454254 :STORED-BYTES 328286
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002448108-command-31083-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3454254 :STORED-BYTES 328286 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3454254 :UNCOMPRESSED-SHA256
    \"4aaaa75610a83f721452e764a85e2709c91d86ea19a5b5b9d1afe4ca595b7581\"
    :COMPRESSED-BYTES 327969 :COMPRESSED-SHA256
    \"35317d1b0795b2bdcd59cb022d83158ed9847ecffdd7577def60b65e53118043\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/Users/gpicchiarelli/.local/sbcl/2.6.10/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((101) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((112) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002448108-command-31083-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "31083"))
 :STARTED-AT-UNIVERSAL-TIME 4002448710)
