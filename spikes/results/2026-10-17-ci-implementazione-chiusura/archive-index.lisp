(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "collection-producer" :RECORD-PATH "collection-producer/report.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "tools/collect-command-archive.lisp")
    #A((9) BASE-CHAR . "--collect")
    #A((35) BASE-CHAR . "spikes/out/ci/receipt-manifest.lisp")
    #A((54) BASE-CHAR
       . "spikes/results/2026-10-17-ci-implementazione-raccolta/")
    #A((14) BASE-CHAR . "--observations")
    #A((35) BASE-CHAR . "spikes/out/ci/receipt-observations/")
    #A((6) BASE-CHAR . "--jobs") #A((1) BASE-CHAR . "4"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "documentation-failed" :RECORD-PATH
   "documentation-failed/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "make") #A((5) BASE-CHAR . "links")
    #A((5) BASE-CHAR . "trace"))
   :STATUS :FAILED :EXIT-CODE 2 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "documentation-final" :RECORD-PATH "documentation-final/report.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "make") #A((5) BASE-CHAR . "links")
    #A((5) BASE-CHAR . "trace"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((94) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/final-manifest.lisp")
   :BYTES 1841 :SHA256
   "a49e299a97526b5bbff8cb7e4c27f031cee8c7d139e6ca3777e739a3ae6c4f39")
  (:PATH "collection-producer/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001219614-command-30536-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "bf7777d50e28d3a93aee1b7ff781ba2a53fcddb3ede5c7a20a109fd73a1a0049")
  (:PATH "collection-producer/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001219614-command-30536-0/report.lisp")
   :BYTES 253194 :SHA256
   "1efdccfdeed52521e535a8604955fed3408c40bee9db8b5a79e6ed4875737fbe")
  (:PATH "collection-source.lisp" :SOURCE
   #A((95) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")
  (:PATH "collection/closed-check.log" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/receipt-observations/closed-check.log")
   :BYTES 1433 :SHA256
   "8b29958545903431f31af8860c9c44c2df3636dc6367e8bbeca10e916a453b22")
  (:PATH "collection/report.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/receipt-observations/report.lisp")
   :BYTES 6320 :SHA256
   "6e14bf1605787a058f72e6e3a712bae8a53b2d5e6e119bc61987e627ebeb534e")
  (:PATH "documentation-failed/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001219695-command-31289-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "757d0870171507b008902c9678c14c6806288301696d5157a5399815fb0ad853")
  (:PATH "documentation-failed/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001219695-command-31289-0/report.lisp")
   :BYTES 248205 :SHA256
   "5db7091d14bf64795bfbff791e40aae8bfa8a6d2d448969d636ca69580d0508f")
  (:PATH "documentation-final/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001219736-command-31589-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "5c0fdd8c30202c69504f93a9d1c7c78317263ed5ab120290c3c0a679d50d2734")
  (:PATH "documentation-final/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001219736-command-31589-0/report.lisp")
   :BYTES 247123 :SHA256
   "2d86c5ccc5ffa49aafe6ce371733e9bf03a44269f9d6d6161c28565df3f494a4")
  (:PATH "handoff.lisp" :SOURCE
   #A((99) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/handoff-observation.lisp")
   :BYTES 1118 :SHA256
   "a956abb381d06f5e299ef14c4a093e5cff8c3dbdc9519a970d59d76584126882"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
