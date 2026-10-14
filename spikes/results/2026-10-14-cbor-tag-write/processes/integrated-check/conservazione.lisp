(:FINISHED-AT-UNIVERSAL-TIME 4000997139 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((102) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996821-command-64571-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.046001d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1317223 :STORED-BYTES 156200
 :RESULTS
 ((:PATH
   #A((113) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996821-command-64571-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1317223 :STORED-BYTES 156200 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1317223 :UNCOMPRESSED-SHA256
    \"8e11cffc17e0cae1190528f784b39a273794f9b81c39973ca6cb16a3e903a61b\"
    :COMPRESSED-BYTES 155883 :COMPRESSED-SHA256
    \"ea6dfba8f9ff33deb170259ae1e49417c028f3101de60dc10edc04b731e03158\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((91) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((102) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996821-command-64571-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "64571"))
 :STARTED-AT-UNIVERSAL-TIME 4000997138)
