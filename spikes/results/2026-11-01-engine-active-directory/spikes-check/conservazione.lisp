(:FINISHED-AT-UNIVERSAL-TIME 4002491999 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((110) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002491948-check-59734-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.809954d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57238912 :STORED-BYTES 896321
 :RESULTS
 ((:PATH
   #A((121) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002491948-check-59734-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28151197 :STORED-BYTES 412054 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28151197 :UNCOMPRESSED-SHA256
    \"486c3cc3587ac9f38d6ff35efe0f26f8009bc0af12848af832d28837f8922ee7\"
    :COMPRESSED-BYTES 411736 :COMPRESSED-SHA256
    \"cbc130360d6f42672d6331fb6935c4f7c42f187d3b95d4dad30cbdcaf2275004\"))
  (:PATH
   #A((121) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002491948-check-59734-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 29087715 :STORED-BYTES 484267 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 29087715 :UNCOMPRESSED-SHA256
    \"f04725f187e8823b13e7437b4c6379b3bc87d3b253db62d8aec2b9b755f32c50\"
    :COMPRESSED-BYTES 483949 :COMPRESSED-SHA256
    \"19b741d35b89e66a7e08c045f70fd390029eb071b523af279a63cfff7650cd73\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((101) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((110) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002491948-check-59734-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "59734"))
 :STARTED-AT-UNIVERSAL-TIME 4002491997)
