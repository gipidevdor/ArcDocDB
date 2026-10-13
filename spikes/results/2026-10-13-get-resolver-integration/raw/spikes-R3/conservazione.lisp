(:FINISHED-AT-UNIVERSAL-TIME 4000906496 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((108) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/get-outcome-verification/ArcDocDB/spikes/out/4000906465-check-40616-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.549215d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57106164 :STORED-BYTES 878075
 :RESULTS
 ((:PATH
   #A((119) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/get-outcome-verification/ArcDocDB/spikes/out/4000906465-check-40616-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144119 :STORED-BYTES 410936 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144119 :UNCOMPRESSED-SHA256
    \"9ab910e0d681640ea5da87e7aaa046e41b902add64abaf5b402f3dbfcde00e73\"
    :COMPRESSED-BYTES 410618 :COMPRESSED-SHA256
    \"e0eb907859fa87ebda97de88da927c9dab57a0371c455286f0e12aeb0a76c0b3\"))
  (:PATH
   #A((119) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/get-outcome-verification/ArcDocDB/spikes/out/4000906465-check-40616-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28962045 :STORED-BYTES 467139 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28962045 :UNCOMPRESSED-SHA256
    \"3bb04857fdd6ec932971214d2dfddbb4bc56d17c3fba78792cf565be2e8801f5\"
    :COMPRESSED-BYTES 466821 :COMPRESSED-SHA256
    \"18d7693065ad4b8cd9c77bcee3bab86ef1fc7faeab8a7d597fcf21ef347daa8c\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((99) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-outcome-verification/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((108) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-outcome-verification/ArcDocDB/spikes/out/4000906465-check-40616-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "40616"))
 :STARTED-AT-UNIVERSAL-TIME 4000906494)
