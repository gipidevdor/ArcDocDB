(:FINISHED-AT-UNIVERSAL-TIME 4001078647 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((99) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001078597-command-72887-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.772113d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1860939 :STORED-BYTES 190417
 :RESULTS
 ((:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001078597-command-72887-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1860939 :STORED-BYTES 190417 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1860939 :UNCOMPRESSED-SHA256
    \"a8ae09aea502370094f9d4bbcb3f3f05157c8e17a02980510853f91a84bd131c\"
    :COMPRESSED-BYTES 190100 :COMPRESSED-SHA256
    \"ba46ce282b7c314e1ff043360670db1785e895827b04488a5cf8310592b47ffa\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((88) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((99) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001078597-command-72887-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "72887"))
 :STARTED-AT-UNIVERSAL-TIME 4001078645)
