(:FINISHED-AT-UNIVERSAL-TIME 4000703940 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((134) BASE-CHAR
    . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-latest-ajszidm2/ArcDocDB/spikes/out/4000703908-check-55225-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.788661d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57106483 :STORED-BYTES 878113
 :RESULTS
 ((:PATH
   #A((145) BASE-CHAR
      . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-latest-ajszidm2/ArcDocDB/spikes/out/4000703908-check-55225-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144051 :STORED-BYTES 410957 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144051 :UNCOMPRESSED-SHA256
    \"1037d41bc46a921d5822e9d33b95e55e1e7f888f0ea79d13f7f7b6b71a44f122\"
    :COMPRESSED-BYTES 410639 :COMPRESSED-SHA256
    \"519aa4b8a5d49e00b5ac525908cf8364539f2a2c543baf76e9afd8cabca8de61\"))
  (:PATH
   #A((145) BASE-CHAR
      . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-latest-ajszidm2/ArcDocDB/spikes/out/4000703908-check-55225-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28962432 :STORED-BYTES 467156 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28962432 :UNCOMPRESSED-SHA256
    \"1cb0aec4553bf87434f5a026003fd426ecde9b6d9c1dce065cb189055ce08e81\"
    :COMPRESSED-BYTES 466838 :COMPRESSED-SHA256
    \"fda9fd73bb8588a21532c051df6287269792405ec5064aedd7169e178a7a70f8\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((125) BASE-CHAR
     . "/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-latest-ajszidm2/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((134) BASE-CHAR
     . "/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-latest-ajszidm2/ArcDocDB/spikes/out/4000703908-check-55225-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "55225"))
 :STARTED-AT-UNIVERSAL-TIME 4000703938)
