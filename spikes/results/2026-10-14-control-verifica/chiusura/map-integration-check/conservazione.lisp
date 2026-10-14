(:FINISHED-AT-UNIVERSAL-TIME 4000989776 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((102) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/4000989501-command-53422-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.90417d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1310251 :STORED-BYTES 154743
 :RESULTS
 ((:PATH
   #A((113) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/4000989501-command-53422-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1310251 :STORED-BYTES 154743 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1310251 :UNCOMPRESSED-SHA256
    \"1812d87e90cf3f41f7716149092c022638118afbce491643336a15e875aa7ac0\"
    :COMPRESSED-BYTES 154426 :COMPRESSED-SHA256
    \"000bb39b6bb92f1a72b0dbf8f4d6f92345009c7079278e469a76a5a6d4912802\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/4000989501-command-53422-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "53422"))
 :STARTED-AT-UNIVERSAL-TIME 4000989775)
