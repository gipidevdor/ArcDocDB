(:FINISHED-AT-UNIVERSAL-TIME 4000708784 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((142) BASE-CHAR
    . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB/spikes/out/worker-series-coverage-bundle/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.601693d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1924099 :STORED-BYTES 255197
 :RESULTS
 ((:PATH
   #A((162) BASE-CHAR
      . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB/spikes/out/worker-series-coverage-bundle/coverage-bundle.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1924099 :STORED-BYTES 255197 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"coverage-bundle.lisp.gz\" :UNCOMPRESSED-BYTES 1924099 :UNCOMPRESSED-SHA256
    \"f7179cb0a4955b1429d5a058a730f24c0df04e380bc8573e940d1f42ae0fa682\"
    :COMPRESSED-BYTES 254871 :COMPRESSED-SHA256
    \"156d343df1be4d2ee26bc51b133972578294ec29055e037b4d5a2b634c48be77\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((128) BASE-CHAR
     . "/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB/tools/compact-evidence.lisp")
  "--root" #A((41) BASE-CHAR . "spikes/out/worker-series-coverage-bundle/")
  "--jobs" "4" "--finished-owner-pid" #A((4) BASE-CHAR . "4826"))
 :STARTED-AT-UNIVERSAL-TIME 4000708782)
