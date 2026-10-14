(:FINISHED-AT-UNIVERSAL-TIME 4000985972 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((102) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/4000985697-command-60562-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.994915d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1299826 :STORED-BYTES 152902
 :RESULTS
 ((:PATH
   #A((113) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/4000985697-command-60562-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1299826 :STORED-BYTES 152902 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1299826 :UNCOMPRESSED-SHA256
    \"a696487b20115d5b95106ae9970e874888866a27d89aa24fd3c4e052a8551ea4\"
    :COMPRESSED-BYTES 152585 :COMPRESSED-SHA256
    \"24845ec3e21477b962e4eeb0945a07aa8c26c01b80e5c30432b54452d2511f36\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((91) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((102) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/4000985697-command-60562-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "60562"))
 :STARTED-AT-UNIVERSAL-TIME 4000985971)
