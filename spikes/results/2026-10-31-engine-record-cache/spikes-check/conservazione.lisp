(:FINISHED-AT-UNIVERSAL-TIME 4002461791 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((110) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002461742-check-72932-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.779494d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57238775 :STORED-BYTES 896359
 :RESULTS
 ((:PATH
   #A((121) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002461742-check-72932-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28151197 :STORED-BYTES 412055 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28151197 :UNCOMPRESSED-SHA256
    \"e6b791a0e15d5bc430d7c1de45252e23e00ad3c5e393bc0bb27ddf28856b69fa\"
    :COMPRESSED-BYTES 411737 :COMPRESSED-SHA256
    \"22f529f98c0b5c79ef2269b71a0acba881866c70497142ce9e7b9f7231a88f74\"))
  (:PATH
   #A((121) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002461742-check-72932-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 29087578 :STORED-BYTES 484304 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 29087578 :UNCOMPRESSED-SHA256
    \"9470ae1094a38da860e3e4f7984da125f487196391a6539ea9cfb0c5059f4393\"
    :COMPRESSED-BYTES 483986 :COMPRESSED-SHA256
    \"a8828b5c767231b51b5171c344e9d04baad55b15bb9337ab4a8d8b37bda2cb26\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002461742-check-72932-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "72932"))
 :STARTED-AT-UNIVERSAL-TIME 4002461789)
