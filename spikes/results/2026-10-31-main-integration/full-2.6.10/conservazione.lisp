(:FINISHED-AT-UNIVERSAL-TIME 4002435506 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((111) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002434616-command-3502-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.013752d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3444569 :STORED-BYTES 332718
 :RESULTS
 ((:PATH
   #A((122) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002434616-command-3502-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3444569 :STORED-BYTES 332718 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3444569 :UNCOMPRESSED-SHA256
    \"0184d9e8b46312ddffac9e332373aa45ce687a9b231a8790e13c36527574bf20\"
    :COMPRESSED-BYTES 332401 :COMPRESSED-SHA256
    \"e0285c8bed4804246e92c0b48a7e13cdd80980b35cdd911029571b85f2d0e256\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/Users/gpicchiarelli/.local/sbcl/2.6.10/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((101) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((111) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002434616-command-3502-0/")
  "--jobs" "4" "--finished-owner-pid" #A((4) BASE-CHAR . "3502"))
 :STARTED-AT-UNIVERSAL-TIME 4002435504)
