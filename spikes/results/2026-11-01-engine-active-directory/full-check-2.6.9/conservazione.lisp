(:FINISHED-AT-UNIVERSAL-TIME 4002492033 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002490826-command-53801-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.028913d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3796994 :STORED-BYTES 356052
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002490826-command-53801-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3796994 :STORED-BYTES 356052 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3796994 :UNCOMPRESSED-SHA256
    \"b98ef28c497c178fa61961dd2bdd4d99c8f44e0afcc2a6fb5f60216016927f5d\"
    :COMPRESSED-BYTES 355735 :COMPRESSED-SHA256
    \"dbabf4c7e7f81018984b502245c3cd49ca68256bbc30a21173527bbcca0aa9c7\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((101) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((112) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002490826-command-53801-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "53801"))
 :STARTED-AT-UNIVERSAL-TIME 4002492032)
