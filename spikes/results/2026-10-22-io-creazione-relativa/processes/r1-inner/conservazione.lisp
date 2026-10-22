(:FINISHED-AT-UNIVERSAL-TIME 4001238027 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((107) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237419-command-89011-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.106953d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2695661 :STORED-BYTES 259928
 :RESULTS
 ((:PATH
   #A((118) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237419-command-89011-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2695661 :STORED-BYTES 259928 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2695661 :UNCOMPRESSED-SHA256
    \"2791dd545482249774a62b7fa022664de0e0a74f48cbd53b687cd00248544720\"
    :COMPRESSED-BYTES 259611 :COMPRESSED-SHA256
    \"92ac0538b395095d70061aa5fecc638e2688cd3da98751e27d1aee8cdc7654e9\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((96) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((107) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237419-command-89011-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "89011"))
 :STARTED-AT-UNIVERSAL-TIME 4001238026)
