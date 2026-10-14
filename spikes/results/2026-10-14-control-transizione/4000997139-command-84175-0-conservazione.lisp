(:FINISHED-AT-UNIVERSAL-TIME 4000997429 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((105) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/control-transizione/ArcDocDB/spikes/out/4000997139-command-84175-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.782828d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1462671 :STORED-BYTES 164474
 :RESULTS
 ((:PATH
   #A((116) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/control-transizione/ArcDocDB/spikes/out/4000997139-command-84175-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1462671 :STORED-BYTES 164474 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1462671 :UNCOMPRESSED-SHA256
    \"fc0f0b998a5bc0b4fa8208fe4b8db6ca9d900085537d81dbc8b752ed6f2e081f\"
    :COMPRESSED-BYTES 164157 :COMPRESSED-SHA256
    \"6609be52f2ef9ddd47f1e677bd15a6040fbda7ed1701de7f97a95dac9e5b3a58\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((94) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/control-transizione/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((105) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/control-transizione/ArcDocDB/spikes/out/4000997139-command-84175-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "84175"))
 :STARTED-AT-UNIVERSAL-TIME 4000997428)
