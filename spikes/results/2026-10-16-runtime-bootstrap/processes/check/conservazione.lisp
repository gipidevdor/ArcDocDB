(:FINISHED-AT-UNIVERSAL-TIME 4001159346 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((99) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001158861-command-38214-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.883528d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2422707 :STORED-BYTES 233395
 :RESULTS
 ((:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001158861-command-38214-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2422707 :STORED-BYTES 233395 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2422707 :UNCOMPRESSED-SHA256
    \"3f049731b7fca051facfbd76814ff5882a40ad67558c46d94d151335fb97ebad\"
    :COMPRESSED-BYTES 233078 :COMPRESSED-SHA256
    \"7eac1c872b9247b739b1fa62bfef33bb3ad219844e69ad15f3f7eb8aca6e7444\")))
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
  #A((99) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001158861-command-38214-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "38214"))
 :STARTED-AT-UNIVERSAL-TIME 4001159345)
