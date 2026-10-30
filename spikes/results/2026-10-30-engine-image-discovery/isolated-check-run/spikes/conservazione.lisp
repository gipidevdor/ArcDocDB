(:FINISHED-AT-UNIVERSAL-TIME 4002382380 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((132) BASE-CHAR
    . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-discovery-validation-8wxi1u6o/spikes/out/4002382331-check-60603-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.733909d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57243170 :STORED-BYTES 897369
 :RESULTS
 ((:PATH
   #A((143) BASE-CHAR
      . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-discovery-validation-8wxi1u6o/spikes/out/4002382331-check-60603-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28151293 :STORED-BYTES 412108 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28151293 :UNCOMPRESSED-SHA256
    \"664a46bd66d0e3b3fabd3c7c779c4d8cb6882573dc9fe6ffd9da3b84af96b4f6\"
    :COMPRESSED-BYTES 411790 :COMPRESSED-SHA256
    \"06ec358a43a8ceb9b851e7552365bbaabb99601e7d3fb9305290d295962b7821\"))
  (:PATH
   #A((143) BASE-CHAR
      . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-discovery-validation-8wxi1u6o/spikes/out/4002382331-check-60603-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 29091877 :STORED-BYTES 485261 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 29091877 :UNCOMPRESSED-SHA256
    \"18d504ed53520c7ed0a4dd07fde79927d2de60f12d2b46fe148833421f3514f3\"
    :COMPRESSED-BYTES 484943 :COMPRESSED-SHA256
    \"f7f1e00b79e581b5ea5c0d6001362ba1c814f7ac4979c640b9dc52ad9e9c5ab0\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((123) BASE-CHAR
     . "/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-discovery-validation-8wxi1u6o/tools/compact-evidence.lisp")
  "--root"
  #A((132) BASE-CHAR
     . "/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-discovery-validation-8wxi1u6o/spikes/out/4002382331-check-60603-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "60603"))
 :STARTED-AT-UNIVERSAL-TIME 4002382377)
