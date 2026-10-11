(:FINISHED-AT-UNIVERSAL-TIME 4000711468 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((101) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000711436-check-60159-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.726115d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57106911 :STORED-BYTES 878165
 :RESULTS
 ((:PATH
   #A((112) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000711436-check-60159-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144119 :STORED-BYTES 410948 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144119 :UNCOMPRESSED-SHA256
    \"c9938f5cddbecd52580a08ec998134b5f3f852c3e00e72119f6eeb4603295d83\"
    :COMPRESSED-BYTES 410630 :COMPRESSED-SHA256
    \"a218e03261498a97eb3c564b34cf89d3844496a4da9631cb71fc6ef88b99192d\"))
  (:PATH
   #A((112) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000711436-check-60159-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28962792 :STORED-BYTES 467217 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28962792 :UNCOMPRESSED-SHA256
    \"464f9c07f7da38fba606ba680bf390de088e9070063aceb7cb8f5a072b51ec82\"
    :COMPRESSED-BYTES 466899 :COMPRESSED-SHA256
    \"fdcd171eaaa1c644b156ce846482bbc3b55d15baca1262f4f160a3f179e9bc54\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((92) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((101) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000711436-check-60159-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "60159"))
 :STARTED-AT-UNIVERSAL-TIME 4000711466)
