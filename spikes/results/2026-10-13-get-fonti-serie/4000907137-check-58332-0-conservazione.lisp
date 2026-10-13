(:FINISHED-AT-UNIVERSAL-TIME 4000907170 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((98) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/get-controller/ArcDocDB/spikes/out/4000907137-check-58332-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.81129d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57106665 :STORED-BYTES 878398
 :RESULTS
 ((:PATH
   #A((109) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/get-controller/ArcDocDB/spikes/out/4000907137-check-58332-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144119 :STORED-BYTES 410932 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144119 :UNCOMPRESSED-SHA256
    \"e46eff6602fa55d0d84c50113caa773bf1cf66dfcf5bdf0d576b83beb5389d50\"
    :COMPRESSED-BYTES 410614 :COMPRESSED-SHA256
    \"b6915ed034ba4d2c98dfbcda1b8c05a80fb505cfc8f09a37347f4c09f118c149\"))
  (:PATH
   #A((109) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/get-controller/ArcDocDB/spikes/out/4000907137-check-58332-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28962546 :STORED-BYTES 467466 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28962546 :UNCOMPRESSED-SHA256
    \"2526b33b73e4cb84aa4d4c47db3dfa261748c03b59fbd734e773e1e318b1de44\"
    :COMPRESSED-BYTES 467148 :COMPRESSED-SHA256
    \"c43b27e185ee9ee593040a2501d4168bb0b31054e533ea7ad530efbf5dce9e98\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((89) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-controller/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((98) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-controller/ArcDocDB/spikes/out/4000907137-check-58332-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "58332"))
 :STARTED-AT-UNIVERSAL-TIME 4000907168)
