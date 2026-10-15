(:FINISHED-AT-UNIVERSAL-TIME 4001075206 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((101) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/active-verifica/ArcDocDB/spikes/out/4001074903-command-61181-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.79128d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1685450 :STORED-BYTES 181535
 :RESULTS
 ((:PATH
   #A((112) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/active-verifica/ArcDocDB/spikes/out/4001074903-command-61181-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1685450 :STORED-BYTES 181535 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1685450 :UNCOMPRESSED-SHA256
    \"c1dc9b3bbc16b416ec071f4d6bc6e0513ca4627d23a38c5ca4f951f6e7c35e8d\"
    :COMPRESSED-BYTES 181218 :COMPRESSED-SHA256
    \"d3cb03c898b59d9f5a77fa63556dd7d3bb8e8334da8dc3d5a67862cb7d88536e\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((90) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/active-verifica/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((101) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/active-verifica/ArcDocDB/spikes/out/4001074903-command-61181-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "61181"))
 :STARTED-AT-UNIVERSAL-TIME 4001075205)
