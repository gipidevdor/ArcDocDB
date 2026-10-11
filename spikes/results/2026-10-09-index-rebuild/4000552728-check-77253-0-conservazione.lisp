(:FINISHED-AT-UNIVERSAL-TIME 4000552762 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((104) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/indice-ricostruzione/ArcDocDB/spikes/out/4000552728-check-77253-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.827481d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57106154 :STORED-BYTES 878122
 :RESULTS
 ((:PATH
   #A((115) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/indice-ricostruzione/ArcDocDB/spikes/out/4000552728-check-77253-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144119 :STORED-BYTES 410944 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144119 :UNCOMPRESSED-SHA256
    \"76253001170edaa1e318476c88ad25471d3badad2215d3ec67a5bcad103c1925\"
    :COMPRESSED-BYTES 410626 :COMPRESSED-SHA256
    \"12e8f4200b7bcf3cf23f5bd04bf9662960b311f19d27cc40189e8cb426c408b1\"))
  (:PATH
   #A((115) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/indice-ricostruzione/ArcDocDB/spikes/out/4000552728-check-77253-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28962035 :STORED-BYTES 467178 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28962035 :UNCOMPRESSED-SHA256
    \"681fea98853f9d93880493a09ba79c8eccbef18ad026653d08287bfd38158e5a\"
    :COMPRESSED-BYTES 466860 :COMPRESSED-SHA256
    \"1fa6f1cf702afcfe5baafdd8739db381f841a1c1259fadf29a8e72f3b6f4da3b\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((95) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/indice-ricostruzione/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((104) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/indice-ricostruzione/ArcDocDB/spikes/out/4000552728-check-77253-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "77253"))
 :STARTED-AT-UNIVERSAL-TIME 4000552760)
