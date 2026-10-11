(:FINISHED-AT-UNIVERSAL-TIME 4000711647 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((100) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/get-verification/ArcDocDB/spikes/out/4000711614-check-64659-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.73075d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57105963 :STORED-BYTES 878044
 :RESULTS
 ((:PATH
   #A((111) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/get-verification/ArcDocDB/spikes/out/4000711614-check-64659-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144051 :STORED-BYTES 410955 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144051 :UNCOMPRESSED-SHA256
    \"ab7260339f1c5503d4dc2b6e47a6e4e3bef846a4b1fcfa5371527fee988e86e2\"
    :COMPRESSED-BYTES 410637 :COMPRESSED-SHA256
    \"39b6a03d773c1ffca0436bc92ff22c6fc92a623c16198e4decebef42017de573\"))
  (:PATH
   #A((111) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/get-verification/ArcDocDB/spikes/out/4000711614-check-64659-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28961912 :STORED-BYTES 467089 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28961912 :UNCOMPRESSED-SHA256
    \"60db08e099d8f4491b76d535be83de0ae1744ee052de8c98819a3832c3754efd\"
    :COMPRESSED-BYTES 466771 :COMPRESSED-SHA256
    \"c9f149d9a80b01161f787122d0727e83a1de9695b04d35a1ca97c145c29e815a\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((91) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-verification/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((100) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-verification/ArcDocDB/spikes/out/4000711614-check-64659-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "64659"))
 :STARTED-AT-UNIVERSAL-TIME 4000711645)
