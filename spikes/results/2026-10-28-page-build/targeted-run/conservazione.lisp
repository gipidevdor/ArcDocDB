(:FINISHED-AT-UNIVERSAL-TIME 4002197443 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((71) BASE-CHAR
    . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/page-build-targeted/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.844434d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1088545 :STORED-BYTES 138339
 :RESULTS
 ((:PATH
   #A((82) BASE-CHAR
      . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/page-build-targeted/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1088545 :STORED-BYTES 138339 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1088545 :UNCOMPRESSED-SHA256
    \"b3ee496dfabd9115528dc1dd8d799f42eb4a338a6b4c9c28b7238c3d482d7c34\"
    :COMPRESSED-BYTES 138022 :COMPRESSED-SHA256
    \"b65c55e64f92f7e98bdcbec31f1fbb8c7e5d58026cb34756f990699d77ceef42\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((67) BASE-CHAR
     . "/Users/gpicchiarelli/Documents/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((71) BASE-CHAR
     . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/page-build-targeted/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "28885"))
 :STARTED-AT-UNIVERSAL-TIME 4002197441)
