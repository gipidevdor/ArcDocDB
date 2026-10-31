(:FINISHED-AT-UNIVERSAL-TIME 4002436522 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002436097-command-14302-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.019278d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3358996 :STORED-BYTES 319823
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002436097-command-14302-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3358996 :STORED-BYTES 319823 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3358996 :UNCOMPRESSED-SHA256
    \"873036de70128f74e82c56af821e02a628cea76a2bf6a8b42fb943d137a653da\"
    :COMPRESSED-BYTES 319506 :COMPRESSED-SHA256
    \"40033dacaffce62f3f20d4db75d484e645e4a147b85f6072fea0949cdb49f2a3\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/Users/gpicchiarelli/.local/sbcl/2.6.10/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((101) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((112) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002436097-command-14302-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "14302"))
 :STARTED-AT-UNIVERSAL-TIME 4002436521)
