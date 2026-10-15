(:FINISHED-AT-UNIVERSAL-TIME 4001073461 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((95) BASE-CHAR
    . \"/private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/4001073020-command-38577-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.865852d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1510366 :STORED-BYTES 171456
 :RESULTS
 ((:PATH
   #A((106) BASE-CHAR
      . \"/private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/4001073020-command-38577-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1510366 :STORED-BYTES 171456 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1510366 :UNCOMPRESSED-SHA256
    \"78a383872970da17698462a2f8b4653772be0b7a0cb9f5359bb0bc3aa2df72cf\"
    :COMPRESSED-BYTES 171139 :COMPRESSED-SHA256
    \"fba71fabd6e0daa76e7f394980b1f7641e2496ce350a8b8a94b9c82503e058c7\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((84) BASE-CHAR
     . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/tools/compact-evidence.lisp")
  "--root"
  #A((95) BASE-CHAR
     . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/4001073020-command-38577-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "38577"))
 :STARTED-AT-UNIVERSAL-TIME 4001073460)
