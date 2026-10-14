(:FINISHED-AT-UNIVERSAL-TIME 4000996828 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((105) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4000996790-command-63888-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.212461d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1205959 :STORED-BYTES 133678
 :RESULTS
 ((:PATH
   #A((116) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4000996790-command-63888-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1205959 :STORED-BYTES 133678 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1205959 :UNCOMPRESSED-SHA256
    \"8e172d0031b3ae417b5062cfdbc4fbc12dc7f74f3b8dfe400b6addb4c38e21de\"
    :COMPRESSED-BYTES 133361 :COMPRESSED-SHA256
    \"035618905ecb985a25e238a7ae8b691b9ef0a2d48b80ae72dcfb99a5be8876bb\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((94) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((105) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4000996790-command-63888-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "63888"))
 :STARTED-AT-UNIVERSAL-TIME 4000996826)
