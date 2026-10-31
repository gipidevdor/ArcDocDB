(:FINISHED-AT-UNIVERSAL-TIME 4002435449 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((109) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002435387-check-8007-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.751717d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57252614 :STORED-BYTES 896592
 :RESULTS
 ((:PATH
   #A((120) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002435387-check-8007-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28151131 :STORED-BYTES 412079 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28151131 :UNCOMPRESSED-SHA256
    \"f76d362f821ac76624d8b845346d274ddaabbbac5fb65b2f9d0e4c598cd5fefe\"
    :COMPRESSED-BYTES 411761 :COMPRESSED-SHA256
    \"0d25e06aef03980410a0c6b3a2f38c90f60c2e9cb0a2fcaa0a7148ac421d301c\"))
  (:PATH
   #A((120) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002435387-check-8007-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 29101483 :STORED-BYTES 484513 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 29101483 :UNCOMPRESSED-SHA256
    \"96906796ad48df3a4ed9cfbc670fb6ae31441893cef50b9c3236820d2a149d43\"
    :COMPRESSED-BYTES 484195 :COMPRESSED-SHA256
    \"0ecc187c7836a64f866eec6b72f2563b5e1702c5fe98ece322e1bd0c54f14c5c\")))
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
  #A((109) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002435387-check-8007-0/")
  "--jobs" "4" "--finished-owner-pid" #A((4) BASE-CHAR . "8007"))
 :STARTED-AT-UNIVERSAL-TIME 4002435447)
