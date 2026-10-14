(:FINISHED-AT-UNIVERSAL-TIME 4000984610 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((98) BASE-CHAR
    . \"/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/spikes/out/4000984350-command-38940-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.816774d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1137543 :STORED-BYTES 143714
 :RESULTS
 ((:PATH
   #A((109) BASE-CHAR
      . \"/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/spikes/out/4000984350-command-38940-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1137543 :STORED-BYTES 143714 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1137543 :UNCOMPRESSED-SHA256
    \"94c30f9f4861eb2868143f94ba37a28a294e8f3fa689ccad7660c105d9d18b7e\"
    :COMPRESSED-BYTES 143397 :COMPRESSED-SHA256
    \"a71457fe09a5a3e36965f033dce8f4f58f3bd10981c87135a55713b197156ede\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((87) BASE-CHAR
     . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/tools/compact-evidence.lisp")
  "--root"
  #A((98) BASE-CHAR
     . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/spikes/out/4000984350-command-38940-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "38940"))
 :STARTED-AT-UNIVERSAL-TIME 4000984609)
