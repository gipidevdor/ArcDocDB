(:FINISHED-AT-UNIVERSAL-TIME 4001155903 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((111) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001155836-command-20347-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.861199d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2007326 :STORED-BYTES 202881
 :RESULTS
 ((:PATH
   #A((122) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001155836-command-20347-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2007326 :STORED-BYTES 202881 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2007326 :UNCOMPRESSED-SHA256
    \"16ed3240c080c06ac8d76b003193f4db48966ab20cf117c52c191178a7a6fdbb\"
    :COMPRESSED-BYTES 202564 :COMPRESSED-SHA256
    \"6b1a096b5f3824bd5005f08ec45f97a319a3a1be4a907eff800cfd281bcf20c7\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((100) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((111) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001155836-command-20347-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "20347"))
 :STARTED-AT-UNIVERSAL-TIME 4001155902)
