(:INDEPENDENT-CLOSURE
 (:EXIT-CODE 0 :SIGNAL NIL :LOG
  #A((138) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/core-review-20261031/collection-observations/closed-check.log")
  :RESULT
  (:SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-AUDIT :STATUS :OK :ARCHIVE
   "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/results/2026-10-31-core-code-review-originals/"
   :INDEXED-FILES 14 :ACTUAL-FILES 16 :INDEXED-BYTES 1511109 :PROCESSES
   ((:LABEL "initial" :RECORD-PATH "processes/initial/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script"
      "spikes/results/2026-10-31-core-code-review/verify.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "full-check" :RECORD-PATH "processes/full-check/report.lisp"
     :COMMAND ("make" "check-core") :STATUS :OK :EXIT-CODE 0
     :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "process-sample" :RECORD-PATH
     "processes/process-sample/report.lisp" :COMMAND
     ("/usr/bin/sample" "23633" "1" "10" "-file"
      "/tmp/arcdocdb-core-review-stacks.txt")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "qualified" :RECORD-PATH "processes/qualified/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "spikes/core-code-review.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
   :INDEX-SHA256
   "a03275deb031da0c16702eacde85d1ad379de65a7acdfd3750ad5f34f7e37a39"
   :CATALOGUE-SHA256
   "6cd3e9a1ab325eb997a2a91e54ed81654ebc31785c987d63754f9fe29a4e25ac"
   :ORIGINS-COMPARED NIL :CLOSED-INVENTORY T :READ-EVAL NIL :EOF-REQUIRED T
   :LIMITS
   (:PLAIN-BYTES 1048576 :GZIP-BYTES 8388608 :PROCESS-EXPANDED-BYTES 134217728
    :ENTRIES 100000 :DIRECTORY-DEPTH 128 :DIRECTORY-ENUMERATION-NOT-PREBOUNDED
    T :PER-FILE-LOCAL-OBSERVATION T :ATOMIC-PUBLICATION NIL
    :RESULT-OR-GATE-INFERENCE NIL :MCDC-CLAIM NIL)))
 :CLEANUP-ERRORS NIL :WORKER-ERRORS (NIL NIL NIL NIL) :WORKER-COPIED-COUNTS
 (5 1 4 4) :COPY-RESULTS
 ((:STATUS :OK :ENTRY
   (:PATH "processes/initial/report.lisp" :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/core-review-20261031/initial/report.lisp")
    :BYTES 387179 :SHA256
    "92157cbab94a497ed32b83a925336cf41644b51ad7923bc587167550c604fbcb"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/initial/conservazione.lisp" :SOURCE
    #A((124) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/core-review-20261031/initial/conservazione.lisp")
    :BYTES 1151 :SHA256
    "dc07aa85e2eacfdbf26a4abc1cc9a42497566da1a7fbe79c49b44fcadc98d45d"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/full-check/report.lisp" :SOURCE
    #A((120) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/core-review-20261031/full-check/report.lisp")
    :BYTES 317 :SHA256
    "02e24b3d5c9c51b7fc10ec93353732f981cd7f121cebd0083cd1826c1d1e30c1"))
  (:STATUS :OK :ENTRY
   (:PATH #A((35) BASE-CHAR . "processes/full-check/report.lisp.gz") :SOURCE
    #A((123) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/core-review-20261031/full-check/report.lisp.gz")
    :BYTES 340618 :SHA256
    "2a27365e497633cc0e81c5b8ef8753254b7019918fac410742565b347fcff5ff"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/full-check/conservazione.lisp" :SOURCE
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/core-review-20261031/full-check/conservazione.lisp")
    :BYTES 1746 :SHA256
    "e565f6cf747ef548aa0531d13453207db5d17a8f3d5dd4c4fff0339ab349d56c"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/process-sample/report.lisp" :SOURCE
    #A((124) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/core-review-20261031/process-sample/report.lisp")
    :BYTES 330769 :SHA256
    "16d239fd511398d15acd8ffa042b1f9b57a145a2024f3d694abe200893da89c8"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/process-sample/conservazione.lisp" :SOURCE
    #A((131) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/core-review-20261031/process-sample/conservazione.lisp")
    :BYTES 1165 :SHA256
    "87d7325e655d9da8cfe9bd763b6d7e75a5823e0f1b63abe0d909c43e83e351ee"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/qualified/report.lisp" :SOURCE
    #A((119) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/core-review-20261031/qualified/report.lisp")
    :BYTES 387312 :SHA256
    "ec3e6d87ec6ede9230cab9f98e73efcdf09313f586ce0b479deca18844b54374"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/qualified/conservazione.lisp" :SOURCE
    #A((126) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/core-review-20261031/qualified/conservazione.lisp")
    :BYTES 1155 :SHA256
    "63bc1464599fc5895f30acab05db941fa6f9a52786fed5f0eb0b0f0e3a48ef16"))
  (:STATUS :OK :ENTRY
   (:PATH "method/archive-helper.lisp.txt" :SOURCE
    #A((46) BASE-CHAR . "/private/tmp/arcdocdb-core-review-archive.lisp")
    :BYTES 1735 :SHA256
    "14eb33024eb98a94840025d7a90310b099077af270bbf85cb795f19bc1655298"))
  (:STATUS :OK :ENTRY
   (:PATH "method/qualified-driver.lisp.txt" :SOURCE
    #A((94) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/core-code-review.lisp")
    :BYTES 1548 :SHA256
    "09a61ae4053d5423fd4164406b092aa37a94bf12d8db3e7e9bc0bcf636f4945c"))
  (:STATUS :OK :ENTRY
   (:PATH "diagnostics/process-sample.txt" :SOURCE
    #A((44) BASE-CHAR . "/private/tmp/arcdocdb-core-review-stacks.txt") :BYTES
    22361 :SHA256
    "e91694fa05e961d77c9defcd0e43b4dce315f63041905670d116659cbc9d278f"))
  (:STATUS :OK :ENTRY
   (:PATH "collection-manifest.lisp" :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/core-review-20261031/archive-input.lisp")
    :BYTES 2785 :SHA256
    "7eb8f7147bbd050b7bce517c6716d03e59ba7078a2208cffecd7447334e319d9"))
  (:STATUS :OK :ENTRY
   (:PATH "collection-source.lisp" :SOURCE
    #A((100) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/tools/collect-command-archive.lisp")
    :BYTES 31268 :SHA256
    "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")))
 :PROCESSES
 ((:LABEL "initial" :RECORD-PATH "processes/initial/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((54) BASE-CHAR
       . "spikes/results/2026-10-31-core-code-review/verify.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "full-check" :RECORD-PATH "processes/full-check/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "make") #A((10) BASE-CHAR . "check-core")) :STATUS :OK
   :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "process-sample" :RECORD-PATH "processes/process-sample/report.lisp"
   :COMMAND
   (#A((15) BASE-CHAR . "/usr/bin/sample") #A((5) BASE-CHAR . "23633")
    #A((1) BASE-CHAR . "1") #A((2) BASE-CHAR . "10")
    #A((5) BASE-CHAR . "-file")
    #A((36) BASE-CHAR . "/tmp/arcdocdb-core-review-stacks.txt"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "qualified" :RECORD-PATH "processes/qualified/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((28) BASE-CHAR . "spikes/core-code-review.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :PLANNED-FILES 14 :SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-COLLECTION :STATUS
 :OK :PHASE :COMPLETE :DESTINATION
 #A((119) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/results/2026-10-31-core-code-review-originals/")
 :OBSERVATIONS
 #A((122) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/core-review-20261031/collection-observations/")
 :WORKERS 4 :SHA-PER-COPY 3 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :COMPLETED-COMMAND-RECORDS-ONLY
  :FRESH-DESTINATION-ONLY :NO-AUTO-SIDECARS-OR-TREES
  :LOCAL-PER-FILE-OBSERVATIONS :NO-ATOMICITY-OR-AUTHENTICATION
  :NO-RESULT-OR-GATE-INFERENCE :NO-MCDC-OR-RELEASE-QUALIFICATION))
