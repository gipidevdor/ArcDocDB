(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "generic-span" :RECORD-PATH
   #A((33) BASE-CHAR . "commands/generic-span/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((42) BASE-CHAR . "spikes/out/lean-key-preparation-bench.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "typed-vector" :RECORD-PATH
   #A((33) BASE-CHAR . "commands/typed-vector/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((42) BASE-CHAR . "spikes/out/lean-key-preparation-bench.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "interrupted-full-check" :RECORD-PATH
   #A((43) BASE-CHAR . "commands/interrupted-full-check/report.lisp") :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :STATUS :FAILED :EXIT-CODE 137 :SOURCE-CONSISTENCY :CHANGED))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((78) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/lean-rejected/manifest.lisp")
   :BYTES 1760 :SHA256
   "53289904d44d6a89b7c4ded86192f1e510a2707f7afd728d54d151cdce6509de")
  (:PATH "collection-source.lisp" :SOURCE
   #A((74) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31300 :SHA256
   "ea7f7011519a7c24d379c086ae74ccd5aec3650eddb943633952d55d9d3e4e96")
  (:PATH #A((33) BASE-CHAR . "commands/generic-span/report.lisp") :SOURCE
   #A((89) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4003041360-command-27148-0/report.lisp")
   :BYTES 377319 :SHA256
   "aa752fcb8c52b0335f4025c469c9bf973a138e136975efc7bad841d94b73d022")
  (:PATH #A((43) BASE-CHAR . "commands/interrupted-full-check/report.lisp")
   :SOURCE
   #A((89) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4003041340-command-25932-0/report.lisp")
   :BYTES 317 :SHA256
   "e45bb1ab867da79fbf3f7e9b7299043552220976567d373f75b8110a04ab2532")
  (:PATH "commands/interrupted-full-check/report.lisp.gz" :SOURCE
   #A((92) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4003041340-command-25932-0/report.lisp.gz")
   :BYTES 366377 :SHA256
   "08d6ccb4c8d38671557031175499042ff3cf1f2ec296888723af2991004d7359")
  (:PATH #A((33) BASE-CHAR . "commands/typed-vector/report.lisp") :SOURCE
   #A((89) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4003041556-command-31458-0/report.lisp")
   :BYTES 377330 :SHA256
   "aa336441ea30b31387fd0a99439812c5194c4fef41c16f8f762534f25550957b")
  (:PATH "source/bench.lisp" :SOURCE
   #A((75) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/lean-rejected/bench.lisp")
   :BYTES 4156 :SHA256
   "e0e80c650e37871a63fa65ceef09daf79b8d6b858e52a0d1146fcd4161d5e696")
  (:PATH "source/mismatch-read-group-wire.lisp.source" :SOURCE
   #A((101) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/lean-rejected/mismatch-read-group-wire.lisp.source")
   :BYTES 10943 :SHA256
   "06ae85ef5469afa584385755d028eefa692a246a0c466c3a8e7f40eea596d9b5")
  (:PATH "source/typed-read-group-wire.lisp.source" :SOURCE
   #A((98) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/lean-rejected/typed-read-group-wire.lisp.source")
   :BYTES 11413 :SHA256
   "800a120e18a9d87b8071c44d8f678fd2907ade099f1162f4abdf25c89e2abbb1"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
