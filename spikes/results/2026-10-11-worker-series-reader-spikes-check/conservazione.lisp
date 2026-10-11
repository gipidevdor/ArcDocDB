(:FINISHED-AT-UNIVERSAL-TIME 4000710425 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((147) BASE-CHAR
    . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710392-check-37003-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.97619d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57107338 :STORED-BYTES 878248
 :RESULTS
 ((:PATH
   #A((158) BASE-CHAR
      . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710392-check-37003-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144051 :STORED-BYTES 410955 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144051 :UNCOMPRESSED-SHA256
    \"6553a9b348ea4bdd3fbc55b580ad530627e820b022e53d4bca403f59e8460fb5\"
    :COMPRESSED-BYTES 410637 :COMPRESSED-SHA256
    \"f46a15b8049102865eb81b1b423d5565ae9146c4ea18ff316939049708f8fb38\"))
  (:PATH
   #A((158) BASE-CHAR
      . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710392-check-37003-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28963287 :STORED-BYTES 467293 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28963287 :UNCOMPRESSED-SHA256
    \"4ff7c1d268fe0ae8d4973e4ed3d963d0ab89721f7db85f710d411abb5352de1f\"
    :COMPRESSED-BYTES 466975 :COMPRESSED-SHA256
    \"1f7bce366d109ace2bb2f7f019589c42414b5b43142091a65d3ba9da58e974b6\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((138) BASE-CHAR
     . "/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((147) BASE-CHAR
     . "/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710392-check-37003-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "37003"))
 :STARTED-AT-UNIVERSAL-TIME 4000710423)
