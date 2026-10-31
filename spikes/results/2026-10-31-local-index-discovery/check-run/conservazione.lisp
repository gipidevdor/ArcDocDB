(:FINISHED-AT-UNIVERSAL-TIME 4002424554 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002423884-command-37082-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 1.090241d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3410364 :STORED-BYTES 322233
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002423884-command-37082-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3410364 :STORED-BYTES 322233 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3410364 :UNCOMPRESSED-SHA256
    \"cb87e0b967ed5111394d8756214f69635866d76cc66d885281a98ae8b7c1fa04\"
    :COMPRESSED-BYTES 321916 :COMPRESSED-SHA256
    \"d68fd315610b409a42c39964345d34ac8cf440cf8c75d1e05bdd6bd139146eb7\")))
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
  #A((112) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002423884-command-37082-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "37082"))
 :STARTED-AT-UNIVERSAL-TIME 4002424553)
