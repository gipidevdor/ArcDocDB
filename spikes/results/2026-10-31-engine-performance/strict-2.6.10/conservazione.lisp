(:FINISHED-AT-UNIVERSAL-TIME 4002453539 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002452829-command-95357-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.796057d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 3460172 :STORED-BYTES 328891
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002452829-command-95357-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 3460172 :STORED-BYTES 328891 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 3460172 :UNCOMPRESSED-SHA256
    \"0154fa411fe0bccd7f460b08b094a4314ad93ee19df6ec5d3629b874cf7bcea7\"
    :COMPRESSED-BYTES 328574 :COMPRESSED-SHA256
    \"827d3359454aa49b144559200f2dc7b66ec188d6757dc572b82d3ebd3c53f451\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/Users/gpicchiarelli/.local/sbcl/2.6.10/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((101) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((112) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002452829-command-95357-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "95357"))
 :STARTED-AT-UNIVERSAL-TIME 4002453537)
