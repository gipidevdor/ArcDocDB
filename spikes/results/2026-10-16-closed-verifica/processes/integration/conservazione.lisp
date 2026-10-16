(:FINISHED-AT-UNIVERSAL-TIME 4001155502 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((101) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001155392-command-13478-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.892729d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2173969 :STORED-BYTES 212929
 :RESULTS
 ((:PATH
   #A((112) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001155392-command-13478-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2173969 :STORED-BYTES 212929 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 2173969 :UNCOMPRESSED-SHA256
    \"d12288a4a79078edb4193f70c46f781b9c85a8756e69f51f482cdf5478c3e943\"
    :COMPRESSED-BYTES 212612 :COMPRESSED-SHA256
    \"a3078ad3945ff2e6eeda09bf0cc60ea94cca11bbc7ec102b6e52f6c62d00cede\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((90) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((101) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001155392-command-13478-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "13478"))
 :STARTED-AT-UNIVERSAL-TIME 4001155501)
