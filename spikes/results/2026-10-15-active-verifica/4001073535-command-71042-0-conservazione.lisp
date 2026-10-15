(:FINISHED-AT-UNIVERSAL-TIME 4001073981 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((101) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/active-verifica/ArcDocDB/spikes/out/4001073535-command-71042-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.241323d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1681877 :STORED-BYTES 180748
 :RESULTS
 ((:PATH
   #A((112) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/active-verifica/ArcDocDB/spikes/out/4001073535-command-71042-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1681877 :STORED-BYTES 180748 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1681877 :UNCOMPRESSED-SHA256
    \"5ae551d2504318635186913cfca6edace14a66af72a97402bbf0fb433c439298\"
    :COMPRESSED-BYTES 180431 :COMPRESSED-SHA256
    \"af6ed35284837f18a0b24555d7d307c39a9b00bc2c1c366b4f3af6024c7c6389\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/active-verifica/ArcDocDB/spikes/out/4001073535-command-71042-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "71042"))
 :STARTED-AT-UNIVERSAL-TIME 4001073979)
