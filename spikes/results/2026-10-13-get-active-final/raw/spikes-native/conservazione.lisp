(:FINISHED-AT-UNIVERSAL-TIME 4000914726 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((99) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914694-check-7379-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.754948d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57106023 :STORED-BYTES 878055
 :RESULTS
 ((:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914694-check-7379-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144118 :STORED-BYTES 410939 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144118 :UNCOMPRESSED-SHA256
    \"93d51b22e90b0997f646348835b0c605743eccd4c9afc80bba85198cc621c8c9\"
    :COMPRESSED-BYTES 410621 :COMPRESSED-SHA256
    \"b814ef17d6e0cbc8df2d24f84ae71876c61a113dc4d5b22b18e644133abb602d\"))
  (:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914694-check-7379-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28961905 :STORED-BYTES 467116 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28961905 :UNCOMPRESSED-SHA256
    \"0b1fd5067cd45ceffe07281e4d166ecae5426041f99b01f2448e488461bd07b0\"
    :COMPRESSED-BYTES 466798 :COMPRESSED-SHA256
    \"39b1510000c6974a3d777c8d9895724abfe5e0a54f0722dc91c61747eeb914d2\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((91) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((99) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914694-check-7379-0/")
  "--jobs" "4" "--finished-owner-pid" #A((4) BASE-CHAR . "7379"))
 :STARTED-AT-UNIVERSAL-TIME 4000914724)
