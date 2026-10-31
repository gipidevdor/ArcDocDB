(:FINISHED-AT-UNIVERSAL-TIME 4002448836 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((110) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002448789-check-44839-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.928553d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57239068 :STORED-BYTES 896261
 :RESULTS
 ((:PATH
   #A((121) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002448789-check-44839-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28151197 :STORED-BYTES 412059 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28151197 :UNCOMPRESSED-SHA256
    \"b002fa6cecdf8fcee15c9531eb84a22d82995e3c7c5057d479bb76913a43dec2\"
    :COMPRESSED-BYTES 411741 :COMPRESSED-SHA256
    \"de7442ca5b165bd57197baa226bb40e1183cb781e6f899ad96d6b1fdfeafcc29\"))
  (:PATH
   #A((121) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002448789-check-44839-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 29087871 :STORED-BYTES 484202 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 29087871 :UNCOMPRESSED-SHA256
    \"b34db4c7b263a883f4362ff62dc9c0d1fe3f6d7f24716e6cadfdadcb37d2fbbb\"
    :COMPRESSED-BYTES 483884 :COMPRESSED-SHA256
    \"1b80aa6196e498b6f6d3e309f0e0279700a6a196af3b47b6cc6bf1a7abc57b99\")))
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
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002448789-check-44839-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "44839"))
 :STARTED-AT-UNIVERSAL-TIME 4002448834)
