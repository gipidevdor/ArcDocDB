(:FINISHED-AT-UNIVERSAL-TIME 4002632603 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((110) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002632555-check-56995-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.764316d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57238541 :STORED-BYTES 896124
 :RESULTS
 ((:PATH
   #A((121) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002632555-check-56995-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28151197 :STORED-BYTES 412054 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28151197 :UNCOMPRESSED-SHA256
    \"a2637ba650afd19ef3c6d6054c955de4bb5d5ba206ed6dfff8aff65dfa1b39ff\"
    :COMPRESSED-BYTES 411736 :COMPRESSED-SHA256
    \"abfd8758abdb8762c59adc421b555e1f9c1c6eaac11eb0610e1c45a616de1cd1\"))
  (:PATH
   #A((121) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002632555-check-56995-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 29087344 :STORED-BYTES 484070 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 29087344 :UNCOMPRESSED-SHA256
    \"8af7dfd31d8d5331a6e3833fb2442ccf80581534d6c5121deeda1515d24712e7\"
    :COMPRESSED-BYTES 483752 :COMPRESSED-SHA256
    \"33d52b44e22b3add2688412647a98756e7fab4d13d79cba2b9737768581f5a90\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002632555-check-56995-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "56995"))
 :STARTED-AT-UNIVERSAL-TIME 4002632600)
