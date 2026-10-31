(:FINISHED-AT-UNIVERSAL-TIME 4002474728 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002474222-command-23050-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.967529d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3384859 :STORED-BYTES 326060
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002474222-command-23050-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3384859 :STORED-BYTES 326060 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3384859 :UNCOMPRESSED-SHA256
    \"9f1dfb02cf89dc216e94c67822feb5f770b061006eb7cc3cc5f6f962cacc954f\"
    :COMPRESSED-BYTES 325743 :COMPRESSED-SHA256
    \"4ac29c0b5513a4202c4d10687cae1e5d4d7484c9d39b67125612fbf42d099af4\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002474222-command-23050-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "23050"))
 :STARTED-AT-UNIVERSAL-TIME 4002474727)
