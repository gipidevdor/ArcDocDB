(:FINISHED-AT-UNIVERSAL-TIME 4002567031 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((110) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002566979-check-12049-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.738642d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57238409 :STORED-BYTES 896233
 :RESULTS
 ((:PATH
   #A((121) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002566979-check-12049-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28151197 :STORED-BYTES 412051 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28151197 :UNCOMPRESSED-SHA256
    \"bcaa78433c0f85302c54c0978143998a8fe47bae76c3df33c2f4c062d99208f9\"
    :COMPRESSED-BYTES 411733 :COMPRESSED-SHA256
    \"c0ee44777bfbb5c60f7d813b925e465ee394c038618555266313ee7c678d7e1d\"))
  (:PATH
   #A((121) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002566979-check-12049-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 29087212 :STORED-BYTES 484182 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 29087212 :UNCOMPRESSED-SHA256
    \"f4f6c52454c2b5924da01e0d69ba95ce53bfe6f5aca91faec58ece27d69c1aa5\"
    :COMPRESSED-BYTES 483864 :COMPRESSED-SHA256
    \"6a4deef6305dcc8d42f32accbbc4256779d841ad5171dbcbfd00b0cca9a1bca4\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002566979-check-12049-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "12049"))
 :STARTED-AT-UNIVERSAL-TIME 4002567029)
