(:FINISHED-AT-UNIVERSAL-TIME 4000715827 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((101) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715792-check-78683-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.930197d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57107124 :STORED-BYTES 878455
 :RESULTS
 ((:PATH
   #A((112) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715792-check-78683-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144119 :STORED-BYTES 410946 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144119 :UNCOMPRESSED-SHA256
    \"de87131944e53deb332bacfad8fb419e23243b6f8db19735a395c3d42864cb18\"
    :COMPRESSED-BYTES 410628 :COMPRESSED-SHA256
    \"975aab8e47798b2c294e814d40159528f0d0e623734c7f4ee62c5f4e194898df\"))
  (:PATH
   #A((112) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715792-check-78683-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28963005 :STORED-BYTES 467509 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28963005 :UNCOMPRESSED-SHA256
    \"c3360f7c96243df75b7ae16b02c132c3ea3d54b80464f21c620471233de19f67\"
    :COMPRESSED-BYTES 467191 :COMPRESSED-SHA256
    \"75e2a85a55a8d6156f857ec0dd87f84a834d16098a25fc992ebdd568ccc6f216\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((92) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((101) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715792-check-78683-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "78683"))
 :STARTED-AT-UNIVERSAL-TIME 4000715825)
