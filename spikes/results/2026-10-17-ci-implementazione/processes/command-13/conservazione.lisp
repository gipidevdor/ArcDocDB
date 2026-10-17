(:FINISHED-AT-UNIVERSAL-TIME 4001218466 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((98) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001218308-command-3703-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.854245d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2440065 :STORED-BYTES 236587
 :RESULTS
 ((:PATH
   #A((109) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001218308-command-3703-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2440065 :STORED-BYTES 236587 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2440065 :UNCOMPRESSED-SHA256
    \"d4cc6d62dafb46e98339a526a1280f48afc53ee048fdf769908b78393c61bcdb\"
    :COMPRESSED-BYTES 236270 :COMPRESSED-SHA256
    \"f9d0455977e4a9bcd00fe1592c3a6c0b9bdd48d2a480e4d87187825dad5d2fe4\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((88) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((98) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001218308-command-3703-0/")
  "--jobs" "4" "--finished-owner-pid" #A((4) BASE-CHAR . "3703"))
 :STARTED-AT-UNIVERSAL-TIME 4001218465)
