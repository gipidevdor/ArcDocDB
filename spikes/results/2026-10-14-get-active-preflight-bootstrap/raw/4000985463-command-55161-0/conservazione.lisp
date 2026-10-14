(:FINISHED-AT-UNIVERSAL-TIME 4000985565 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((106) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/4000985463-command-55161-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.97019d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1982255 :STORED-BYTES 565575
 :RESULTS
 ((:PATH
   #A((117) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/4000985463-command-55161-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1982255 :STORED-BYTES 565575 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1982255 :UNCOMPRESSED-SHA256
    \"4440536920983972909f764cbf91fe46d6749805785e3cf4611d569b5f78cad2\"
    :COMPRESSED-BYTES 565258 :COMPRESSED-SHA256
    \"3001e3ff996d50571c8cc9b287ae98760190d88b8b8fa116ec52eb202ee257b2\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((95) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((106) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/4000985463-command-55161-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "55161"))
 :STARTED-AT-UNIVERSAL-TIME 4000985564)
