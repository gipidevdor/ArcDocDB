(:FINISHED-AT-UNIVERSAL-TIME 4002382039 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((134) BASE-CHAR
    . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-discovery-validation-8wxi1u6o/spikes/out/4002381737-command-53903-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.03418d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3384894 :STORED-BYTES 317482
 :RESULTS
 ((:PATH
   #A((145) BASE-CHAR
      . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-discovery-validation-8wxi1u6o/spikes/out/4002381737-command-53903-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3384894 :STORED-BYTES 317482 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3384894 :UNCOMPRESSED-SHA256
    \"c0faf53df2295b95ed5b28c3352479d51a648b8b82fdca12a06dec3b5245a173\"
    :COMPRESSED-BYTES 317165 :COMPRESSED-SHA256
    \"993d4bce917f1859b5dcbe34c86e70d0b9fa4a7fff74a5ce8b24138df3b9a974\")))
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
  #A((134) BASE-CHAR
     . "/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-discovery-validation-8wxi1u6o/spikes/out/4002381737-command-53903-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "53903"))
 :STARTED-AT-UNIVERSAL-TIME 4002382037)
