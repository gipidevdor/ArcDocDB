(:FINISHED-AT-UNIVERSAL-TIME 4002553783 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((110) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002553736-check-70020-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.810969d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57238036 :STORED-BYTES 896215
 :RESULTS
 ((:PATH
   #A((121) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002553736-check-70020-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28151197 :STORED-BYTES 412053 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28151197 :UNCOMPRESSED-SHA256
    \"73cc0c9153b51a6f15c93be55db92f2586fce99602b9e075036872b57dd87f05\"
    :COMPRESSED-BYTES 411735 :COMPRESSED-SHA256
    \"bb49fd741ed84e4380b474a49342f25c1d17b943d2892fcdf2d9953027b31228\"))
  (:PATH
   #A((121) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002553736-check-70020-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 29086839 :STORED-BYTES 484162 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 29086839 :UNCOMPRESSED-SHA256
    \"e163f94c24ced4fbd91cef0090a7ea49c597a527661906bf47e72b30981f0232\"
    :COMPRESSED-BYTES 483844 :COMPRESSED-SHA256
    \"723e4358a377702f9ed384caabd8aae41a99f0ae3253c689e327c39d9f891f28\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002553736-check-70020-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "70020"))
 :STARTED-AT-UNIVERSAL-TIME 4002553781)
