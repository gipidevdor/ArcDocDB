(:FINISHED-AT-UNIVERSAL-TIME 4000905500 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((108) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/get-outcome-verification/ArcDocDB/spikes/out/4000905466-check-31061-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.690727d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57106307 :STORED-BYTES 877976
 :RESULTS
 ((:PATH
   #A((119) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/get-outcome-verification/ArcDocDB/spikes/out/4000905466-check-31061-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144119 :STORED-BYTES 410937 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144119 :UNCOMPRESSED-SHA256
    \"257b8514d9c50a25de333ac05df61b3dfdc6398885308a3b26bc475b9d3f3aa8\"
    :COMPRESSED-BYTES 410619 :COMPRESSED-SHA256
    \"dc3e235bbe1d8fd8a161b59d766e50471df546e48a858b99585bc7fd5c441b92\"))
  (:PATH
   #A((119) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/get-outcome-verification/ArcDocDB/spikes/out/4000905466-check-31061-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28962188 :STORED-BYTES 467039 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28962188 :UNCOMPRESSED-SHA256
    \"65a461d351b07737eadb9983c25dcaa5d38a3c9fa70fdce67a435718c8caebed\"
    :COMPRESSED-BYTES 466721 :COMPRESSED-SHA256
    \"73b08c625ac752f4dbaab997bcdff81b732cb68a7298e5645c22746a8558b135\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/get-outcome-verification/ArcDocDB/spikes/out/4000905466-check-31061-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "31061"))
 :STARTED-AT-UNIVERSAL-TIME 4000905498)
