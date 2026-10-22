(:FINISHED-AT-UNIVERSAL-TIME 4001678246 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((102) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-R4/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.976381d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2641563 :STORED-BYTES 250565
 :RESULTS
 ((:PATH
   #A((113) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-R4/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2641563 :STORED-BYTES 250565 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2641563 :UNCOMPRESSED-SHA256
    \"7a5db41ff98ffcf36a63dde3d037a9681e68e06ce42e35e806a88c3cf391ac88\"
    :COMPRESSED-BYTES 250248 :COMPRESSED-SHA256
    \"84a24f31aa3575131caf45f7e091174e949fd47d5c6d9bdfa1edc2171f2b45a7\")))
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
  #A((102) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-R4/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "50009"))
 :STARTED-AT-UNIVERSAL-TIME 4001678244)
