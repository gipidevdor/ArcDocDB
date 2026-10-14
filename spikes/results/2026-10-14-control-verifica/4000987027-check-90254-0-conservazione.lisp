(:FINISHED-AT-UNIVERSAL-TIME 4000987061 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((100) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/4000987027-check-90254-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.996454d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57106026 :STORED-BYTES 878270
 :RESULTS
 ((:PATH
   #A((111) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/4000987027-check-90254-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144051 :STORED-BYTES 410960 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144051 :UNCOMPRESSED-SHA256
    \"67bb8f7fee711b4b84db753ac7cc2522313cd31699fd5d06876724e64db17ae5\"
    :COMPRESSED-BYTES 410642 :COMPRESSED-SHA256
    \"89e3244ff4c85f84a84258ded8d20ea4d0e43863c1af46591ebac2ce9d28f87f\"))
  (:PATH
   #A((111) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/4000987027-check-90254-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28961975 :STORED-BYTES 467310 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28961975 :UNCOMPRESSED-SHA256
    \"a0af1717ec643fe7d66c922aebaa6812f8574b711fdbb87daeba4ada8fdc5432\"
    :COMPRESSED-BYTES 466992 :COMPRESSED-SHA256
    \"c316271a6da5d8df43bd3237dc1ce07e0ccf683a62c8f461ed5d917c78cf5922\")))
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
  #A((100) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/control-verifica/ArcDocDB/spikes/out/4000987027-check-90254-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "90254"))
 :STARTED-AT-UNIVERSAL-TIME 4000987059)
