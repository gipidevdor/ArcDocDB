(:FINISHED-AT-UNIVERSAL-TIME 4000916977 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((100) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000916943-check-58072-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.728463d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57106007 :STORED-BYTES 877971
 :RESULTS
 ((:PATH
   #A((111) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000916943-check-58072-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144051 :STORED-BYTES 410956 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144051 :UNCOMPRESSED-SHA256
    \"0751682f010f0133d8a7ce8a2b59365b2f42ebe46d4ecac4bd8e0edb3579e278\"
    :COMPRESSED-BYTES 410638 :COMPRESSED-SHA256
    \"6b5e046baaca93db29cb5c58f1f65b9ea162555816b5713427beb5a76cb12d4f\"))
  (:PATH
   #A((111) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000916943-check-58072-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28961956 :STORED-BYTES 467015 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28961956 :UNCOMPRESSED-SHA256
    \"c60d37606cd569c1a0e1a4a5dab79b1782f1938c8537cb6a0af95ca8af67f915\"
    :COMPRESSED-BYTES 466697 :COMPRESSED-SHA256
    \"ca10ccf7ace60f945de71f76ce336845f8c3cc1198b0134532c06711cf770cc5\")))
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
  #A((100) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000916943-check-58072-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "58072"))
 :STARTED-AT-UNIVERSAL-TIME 4000916975)
