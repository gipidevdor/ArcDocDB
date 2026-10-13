(:FINISHED-AT-UNIVERSAL-TIME 4000914693 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((99) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000914659-check-6225-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 2.008198d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57106140 :STORED-BYTES 878033
 :RESULTS
 ((:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000914659-check-6225-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144119 :STORED-BYTES 410940 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144119 :UNCOMPRESSED-SHA256
    \"7bafd7ca775c48d9d12073355d61546912a419e5f2cf667db3c318da90a4f216\"
    :COMPRESSED-BYTES 410622 :COMPRESSED-SHA256
    \"2232c5fad2f709ab403aa2cccb13265efd47d1a4da246a7facaac5a55dd2e588\"))
  (:PATH
   #A((110) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000914659-check-6225-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28962021 :STORED-BYTES 467093 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28962021 :UNCOMPRESSED-SHA256
    \"98487c10f8aad878b6df0f8f038219bc1e37e20646d04139ff2b155050826f86\"
    :COMPRESSED-BYTES 466775 :COMPRESSED-SHA256
    \"fc220c3b9138a4f26fc0c3fe965fb654ebc7c1b8d7f74f9de647ea7501e0bdda\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((91) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((99) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000914659-check-6225-0/")
  "--jobs" "4" "--finished-owner-pid" #A((4) BASE-CHAR . "6225"))
 :STARTED-AT-UNIVERSAL-TIME 4000914691)
