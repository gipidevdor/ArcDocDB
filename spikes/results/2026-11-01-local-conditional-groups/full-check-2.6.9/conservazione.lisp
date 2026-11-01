(:FINISHED-AT-UNIVERSAL-TIME 4002522349 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002521007-command-41519-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.06625d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3958647 :STORED-BYTES 372581
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002521007-command-41519-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3958647 :STORED-BYTES 372581 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3958647 :UNCOMPRESSED-SHA256
    \"50e7106efe86822c4148f764ce8306243429fd99c9c4f6ec6627ec93517ecae5\"
    :COMPRESSED-BYTES 372264 :COMPRESSED-SHA256
    \"78b1964890ee89b26c19b642a9f23827006411454b9af919c5f2b9f5988d544d\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002521007-command-41519-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "41519"))
 :STARTED-AT-UNIVERSAL-TIME 4002522348)
