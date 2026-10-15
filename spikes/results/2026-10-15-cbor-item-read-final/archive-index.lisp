(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL #A((22) BASE-CHAR . "final-closed-inventory") :RECORD-PATH
   "processes/final-closed-inventory/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((32) BASE-CHAR . "tools/check-command-archive.lisp")
    #A((9) BASE-CHAR . "--archive")
    #A((41) BASE-CHAR . "spikes/results/2026-10-15-cbor-item-read/"))))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/final-manifest.lisp")
   :BYTES 949 :SHA256
   "f6fbf08f2af1d6994c0f7fa7b567fa53b94c39a4b6763bb3c271d36a61ae1e80")
  (:PATH "collection-source.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/collect.lisp")
   :BYTES 22602 :SHA256
   "cc472d49432b8c4b8edf2d8a5441312246a4fc05ed37128be951f2316b2e87de")
  (:PATH "processes/final-closed-inventory/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001075515-command-84512-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "521a5f03bed03fd061ca23c9893729119dade0d5c2994871c02bcdf6212c44d5")
  (:PATH "processes/final-closed-inventory/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001075515-command-84512-0/report.lisp")
   :BYTES 202820 :SHA256
   "ab8272f9f56ab0d1a2953585aef1b2d2fa7d3b48fec0a4cf52809ff59481424f"))
 :LIMITS
 (:SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :FASL-EXCLUDED-FROM-PUBLISHED-MUTATION-TREES
  :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
