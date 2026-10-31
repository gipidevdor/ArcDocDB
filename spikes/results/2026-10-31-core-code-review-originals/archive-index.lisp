(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
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
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/core-review-20261031/archive-input.lisp")
   :BYTES 2785 :SHA256
   "7eb8f7147bbd050b7bce517c6716d03e59ba7078a2208cffecd7447334e319d9")
  (:PATH "collection-source.lisp" :SOURCE
   #A((100) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")
  (:PATH "diagnostics/process-sample.txt" :SOURCE
   #A((44) BASE-CHAR . "/private/tmp/arcdocdb-core-review-stacks.txt") :BYTES
   22361 :SHA256
   "e91694fa05e961d77c9defcd0e43b4dce315f63041905670d116659cbc9d278f")
  (:PATH "method/archive-helper.lisp.txt" :SOURCE
   #A((46) BASE-CHAR . "/private/tmp/arcdocdb-core-review-archive.lisp") :BYTES
   1735 :SHA256
   "14eb33024eb98a94840025d7a90310b099077af270bbf85cb795f19bc1655298")
  (:PATH "method/qualified-driver.lisp.txt" :SOURCE
   #A((94) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/core-code-review.lisp")
   :BYTES 1548 :SHA256
   "09a61ae4053d5423fd4164406b092aa37a94bf12d8db3e7e9bc0bcf636f4945c")
  (:PATH "processes/full-check/conservazione.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/core-review-20261031/full-check/conservazione.lisp")
   :BYTES 1746 :SHA256
   "e565f6cf747ef548aa0531d13453207db5d17a8f3d5dd4c4fff0339ab349d56c")
  (:PATH "processes/full-check/report.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/core-review-20261031/full-check/report.lisp")
   :BYTES 317 :SHA256
   "02e24b3d5c9c51b7fc10ec93353732f981cd7f121cebd0083cd1826c1d1e30c1")
  (:PATH #A((35) BASE-CHAR . "processes/full-check/report.lisp.gz") :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/core-review-20261031/full-check/report.lisp.gz")
   :BYTES 340618 :SHA256
   "2a27365e497633cc0e81c5b8ef8753254b7019918fac410742565b347fcff5ff")
  (:PATH "processes/initial/conservazione.lisp" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/core-review-20261031/initial/conservazione.lisp")
   :BYTES 1151 :SHA256
   "dc07aa85e2eacfdbf26a4abc1cc9a42497566da1a7fbe79c49b44fcadc98d45d")
  (:PATH "processes/initial/report.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/core-review-20261031/initial/report.lisp")
   :BYTES 387179 :SHA256
   "92157cbab94a497ed32b83a925336cf41644b51ad7923bc587167550c604fbcb")
  (:PATH "processes/process-sample/conservazione.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/core-review-20261031/process-sample/conservazione.lisp")
   :BYTES 1165 :SHA256
   "87d7325e655d9da8cfe9bd763b6d7e75a5823e0f1b63abe0d909c43e83e351ee")
  (:PATH "processes/process-sample/report.lisp" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/core-review-20261031/process-sample/report.lisp")
   :BYTES 330769 :SHA256
   "16d239fd511398d15acd8ffa042b1f9b57a145a2024f3d694abe200893da89c8")
  (:PATH "processes/qualified/conservazione.lisp" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/core-review-20261031/qualified/conservazione.lisp")
   :BYTES 1155 :SHA256
   "63bc1464599fc5895f30acab05db941fa6f9a52786fed5f0eb0b0f0e3a48ef16")
  (:PATH "processes/qualified/report.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/core-review-20261031/qualified/report.lisp")
   :BYTES 387312 :SHA256
   "ec3e6d87ec6ede9230cab9f98e73efcdf09313f586ce0b479deca18844b54374"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
