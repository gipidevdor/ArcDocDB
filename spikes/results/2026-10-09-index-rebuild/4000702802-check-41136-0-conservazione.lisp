(:FINISHED-AT-UNIVERSAL-TIME 4000702834 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((104) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/indice-ricostruzione/ArcDocDB/spikes/out/4000702802-check-41136-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.870527d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57114282 :STORED-BYTES 878836
 :RESULTS
 ((:PATH
   #A((115) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/indice-ricostruzione/ArcDocDB/spikes/out/4000702802-check-41136-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144119 :STORED-BYTES 410945 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144119 :UNCOMPRESSED-SHA256
    \"6b5746f9e3bd8017e90cdc6f26b6f13573051772f3ada576817687b5ab7b65c6\"
    :COMPRESSED-BYTES 410627 :COMPRESSED-SHA256
    \"59b720959e3b60c548820d054f77e44d9816d32e6031f54045f7aa427f1bc1e5\"))
  (:PATH
   #A((115) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/indice-ricostruzione/ArcDocDB/spikes/out/4000702802-check-41136-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28970163 :STORED-BYTES 467891 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28970163 :UNCOMPRESSED-SHA256
    \"f3b9be82efba7ef479275f533eda8c1b3b269df3420bb311a6ee805eba1d5842\"
    :COMPRESSED-BYTES 467573 :COMPRESSED-SHA256
    \"b1d5cfcffcffcb448c9b0c5c09d1b1c9102cf13f35c2b682cf33cfa324b9253b\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((95) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/indice-ricostruzione/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((104) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/indice-ricostruzione/ArcDocDB/spikes/out/4000702802-check-41136-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "41136"))
 :STARTED-AT-UNIVERSAL-TIME 4000702832)
