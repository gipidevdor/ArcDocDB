(:FINISHED-AT-UNIVERSAL-TIME 4000997226 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((105) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4000996928-command-75705-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.951672d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1325180 :STORED-BYTES 156683
 :RESULTS
 ((:PATH
   #A((116) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4000996928-command-75705-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1325180 :STORED-BYTES 156683 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1325180 :UNCOMPRESSED-SHA256
    \"032d4eb6b99c1ec93a8ff8946bf9a036e0124a2d27ffb8c5fe21cb9d9d164971\"
    :COMPRESSED-BYTES 156366 :COMPRESSED-SHA256
    \"7c628589809769d4646cd45042447db850a4c4235665e1f692b433d3ade77f66\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((94) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((105) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4000996928-command-75705-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "75705"))
 :STARTED-AT-UNIVERSAL-TIME 4000997225)
