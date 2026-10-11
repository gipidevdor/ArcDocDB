(:FINISHED-AT-UNIVERSAL-TIME 4000553519 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((131) BASE-CHAR
    . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-main-bixfp9ek/ArcDocDB/spikes/out/4000553486-check-9838-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.623279d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57106373 :STORED-BYTES 878363
 :RESULTS
 ((:PATH
   #A((142) BASE-CHAR
      . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-main-bixfp9ek/ArcDocDB/spikes/out/4000553486-check-9838-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144119 :STORED-BYTES 410960 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144119 :UNCOMPRESSED-SHA256
    \"f7141cb050a0192aa81199f394c83aef7f4b8e1752d585c065fe13947b2cabc0\"
    :COMPRESSED-BYTES 410642 :COMPRESSED-SHA256
    \"0ceda42df1e911865809defdd4684ab0cca668bcb64d9ab2648ecbc0f491871a\"))
  (:PATH
   #A((142) BASE-CHAR
      . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-main-bixfp9ek/ArcDocDB/spikes/out/4000553486-check-9838-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28962254 :STORED-BYTES 467403 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28962254 :UNCOMPRESSED-SHA256
    \"b4db92ef7c3db8ca5ea2b71ef33ec93c9f9d52bd8dc784b9af21eca20b5166d8\"
    :COMPRESSED-BYTES 467085 :COMPRESSED-SHA256
    \"ae91605b3308cd6ce183d3e8442602437b62175fe0efdc65aa97b845591d53b0\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((123) BASE-CHAR
     . "/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-main-bixfp9ek/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((131) BASE-CHAR
     . "/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-main-bixfp9ek/ArcDocDB/spikes/out/4000553486-check-9838-0/")
  "--jobs" "4" "--finished-owner-pid" #A((4) BASE-CHAR . "9838"))
 :STARTED-AT-UNIVERSAL-TIME 4000553517)
