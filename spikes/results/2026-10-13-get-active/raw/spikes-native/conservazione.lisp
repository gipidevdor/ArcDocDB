(:FINISHED-AT-UNIVERSAL-TIME 4000910797 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((107) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910766-check-14613-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.744019d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57106816 :STORED-BYTES 878341
 :RESULTS
 ((:PATH
   #A((118) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910766-check-14613-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144051 :STORED-BYTES 410963 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144051 :UNCOMPRESSED-SHA256
    \"72f1d588598fba648b1781d8c122d8afff5038b27f00f64bdbbc63582294aa1e\"
    :COMPRESSED-BYTES 410645 :COMPRESSED-SHA256
    \"0ec3c44df723e03205412842e39b1cd7cd8cb243431911b78bc6ed5c159bc91e\"))
  (:PATH
   #A((118) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910766-check-14613-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28962765 :STORED-BYTES 467378 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28962765 :UNCOMPRESSED-SHA256
    \"a7a375df6f6f05a8084e5dc6732543ad1d4aea7829e43b82a5f7a94c71e7efac\"
    :COMPRESSED-BYTES 467060 :COMPRESSED-SHA256
    \"a4f4a36342381446c6baab40a7c25c566e0b427256ddee687f6a6ec0c0ce2f44\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((98) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((107) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910766-check-14613-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "14613"))
 :STARTED-AT-UNIVERSAL-TIME 4000910795)
