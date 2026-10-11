(:FINISHED-AT-UNIVERSAL-TIME 4000709461 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((140) BASE-CHAR
    . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/spikes/out/4000709427-check-16929-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.747578d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57107117 :STORED-BYTES 878403
 :RESULTS
 ((:PATH
   #A((151) BASE-CHAR
      . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/spikes/out/4000709427-check-16929-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144051 :STORED-BYTES 410957 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144051 :UNCOMPRESSED-SHA256
    \"cbd262f7b89c48454235b01d14875c86ae40095502b76f72c4ab3cd80a3fb934\"
    :COMPRESSED-BYTES 410639 :COMPRESSED-SHA256
    \"7178ccd5e38e78170bed61e8ea12c012c316b5ae0c408717cbece58ceace601e\"))
  (:PATH
   #A((151) BASE-CHAR
      . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/spikes/out/4000709427-check-16929-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28963066 :STORED-BYTES 467446 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28963066 :UNCOMPRESSED-SHA256
    \"4d4c8fac9d375441ed01a607d1f4758abfebaeafb14e543da9e13f9de282f1bc\"
    :COMPRESSED-BYTES 467128 :COMPRESSED-SHA256
    \"baf10338cb79ccd855fb026b23fd832f988d402fc99c6110c8fa053a688539ed\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((131) BASE-CHAR
     . "/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((140) BASE-CHAR
     . "/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/spikes/out/4000709427-check-16929-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "16929"))
 :STARTED-AT-UNIVERSAL-TIME 4000709459)
