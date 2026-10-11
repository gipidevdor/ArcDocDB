(:FINISHED-AT-UNIVERSAL-TIME 4000716196 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((97) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/get-directory/ArcDocDB/spikes/out/4000716161-check-87667-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.709082d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57106217 :STORED-BYTES 878102
 :RESULTS
 ((:PATH
   #A((108) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/get-directory/ArcDocDB/spikes/out/4000716161-check-87667-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144119 :STORED-BYTES 410951 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144119 :UNCOMPRESSED-SHA256
    \"b490842b4db59bb54052d5de3332fd8675b605cff254bf62c34da1c5953f1ba2\"
    :COMPRESSED-BYTES 410633 :COMPRESSED-SHA256
    \"5414c2a47e9c3da5b8c957e417c76f8e2df73e4b78231f3d4d9186ea9d245fc2\"))
  (:PATH
   #A((108) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/get-directory/ArcDocDB/spikes/out/4000716161-check-87667-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28962098 :STORED-BYTES 467151 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28962098 :UNCOMPRESSED-SHA256
    \"cd9f975ff0f060dd0845f4effbfbb9dc33612d6bd4b1a462765e4bed1f2256fb\"
    :COMPRESSED-BYTES 466833 :COMPRESSED-SHA256
    \"e7adba86e206afdaecccc38ec96f184b1033bc0423dea97a11ad1deb8fa91bfa\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((88) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-directory/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((97) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-directory/ArcDocDB/spikes/out/4000716161-check-87667-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "87667"))
 :STARTED-AT-UNIVERSAL-TIME 4000716194)
