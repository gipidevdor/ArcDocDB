(:FINISHED-AT-UNIVERSAL-TIME 4002627449 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((110) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002627396-check-27850-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.888583d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57238595 :STORED-BYTES 896278
 :RESULTS
 ((:PATH
   #A((121) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002627396-check-27850-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28151196 :STORED-BYTES 412049 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28151196 :UNCOMPRESSED-SHA256
    \"517bccccd63500ae7cb56a86402bea3986d3dcfcf01785d092f7a5d1d991d5a1\"
    :COMPRESSED-BYTES 411731 :COMPRESSED-SHA256
    \"c6da8913842f726e97d1a776c010906f7363c8914c918491a821140701e39688\"))
  (:PATH
   #A((121) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002627396-check-27850-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 29087399 :STORED-BYTES 484229 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 29087399 :UNCOMPRESSED-SHA256
    \"50602039b525deb7e361c0bf4ce80f123337becdf510cd6017137f2c8bb94241\"
    :COMPRESSED-BYTES 483911 :COMPRESSED-SHA256
    \"78799fd6cd534666e63d85737fabd21847507ad81fe7b7c3ee09137e3cec9d0f\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002627396-check-27850-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "27850"))
 :STARTED-AT-UNIVERSAL-TIME 4002627447)
