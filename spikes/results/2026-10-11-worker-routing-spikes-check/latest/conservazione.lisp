(:FINISHED-AT-UNIVERSAL-TIME 4000713832 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((135) BASE-CHAR
    . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/4000713800-check-18712-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.625595d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57107277 :STORED-BYTES 878592
 :RESULTS
 ((:PATH
   #A((146) BASE-CHAR
      . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/4000713800-check-18712-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144118 :STORED-BYTES 410936 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144118 :UNCOMPRESSED-SHA256
    \"29ce654b8228df480dec1d2512b119bb6b9f8cf9b8238ced5737026441e0764e\"
    :COMPRESSED-BYTES 410618 :COMPRESSED-SHA256
    \"72e8474a695ff17d01be6ba2aa63babdd81aedcf3e025d8f809cd13b2a4d25b3\"))
  (:PATH
   #A((146) BASE-CHAR
      . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/4000713800-check-18712-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28963159 :STORED-BYTES 467656 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28963159 :UNCOMPRESSED-SHA256
    \"0a9f5d17432feccaa0bc2f6293cffa7f0d51e9ec5fe0bc36922b09a6530aa1bd\"
    :COMPRESSED-BYTES 467338 :COMPRESSED-SHA256
    \"2a4508105dd659c3733dd5574050c4a13a5e6e55efe2e7a1197b7adbf0e6f71f\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((126) BASE-CHAR
     . "/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((135) BASE-CHAR
     . "/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/4000713800-check-18712-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "18712"))
 :STARTED-AT-UNIVERSAL-TIME 4000713830)
