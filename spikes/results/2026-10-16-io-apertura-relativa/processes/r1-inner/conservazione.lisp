(:FINISHED-AT-UNIVERSAL-TIME 4001155579 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((103) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155048-command-2425-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.979005d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2061562 :STORED-BYTES 212642
 :RESULTS
 ((:PATH
   #A((114) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155048-command-2425-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2061562 :STORED-BYTES 212642 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2061562 :UNCOMPRESSED-SHA256
    \"d84fb9217cc4696d621a595bda4ca2ed6578bd0b473f7aebfe942527d1ec9b9a\"
    :COMPRESSED-BYTES 212325 :COMPRESSED-SHA256
    \"fb30b6c998936b0a932af4f4446b882688e9bc4bc538d0a0aca8d013de2a6b32\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((93) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((103) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155048-command-2425-0/")
  "--jobs" "4" "--finished-owner-pid" #A((4) BASE-CHAR . "2425"))
 :STARTED-AT-UNIVERSAL-TIME 4001155578)
