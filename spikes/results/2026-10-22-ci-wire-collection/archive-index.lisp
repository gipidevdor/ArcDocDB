(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "collection" :RECORD-PATH "processes/collection/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "tools/collect-command-archive.lisp")
    #A((9) BASE-CHAR . "--collect")
    #A((45) BASE-CHAR . "spikes/out/ci-wire-conservation/manifest.lisp")
    #A((43) BASE-CHAR . "spikes/results/2026-10-22-ci-wire-processi/")
    #A((14) BASE-CHAR . "--observations")
    #A((30) BASE-CHAR . "spikes/out/ci-wire-collection/")
    #A((6) BASE-CHAR . "--jobs") #A((1) BASE-CHAR . "4"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "trace-links" :RECORD-PATH "processes/trace-links/report.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "make") #A((5) BASE-CHAR . "trace")
    #A((5) BASE-CHAR . "links"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "catalog" :RECORD-PATH "processes/catalog/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((25) BASE-CHAR . "tools/check-evidence.lisp")
    #A((9) BASE-CHAR . "--catalog")
    #A((56) BASE-CHAR
       . "spikes/results/2026-10-22-ci-wire-processi/catalogo.lisp")
    #A((21) BASE-CHAR . "--temporary-directory")
    #A((33) BASE-CHAR . "spikes/out/ci-wire-catalog-check/"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-conservation/receipt-manifest.lisp")
   :BYTES 1648 :SHA256
   "99f89a6955ed3af833bfb53fa27fc9986bfd5d37923c156611441db6b5d87b43")
  (:PATH "collection-source.lisp" :SOURCE
   #A((95) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")
  (:PATH "processes/catalog/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001676247-command-35519-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "1001f7da8e742cad2e1c24081e81c1ec9ac05492b00e98a26695912ed68369aa")
  (:PATH "processes/catalog/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001676247-command-35519-0/report.lisp")
   :BYTES 263471 :SHA256
   "3a51dd18c9adf8caf1480e43454c8f7170651db0973d362e94687a2a8e81ba30")
  (:PATH "processes/collection/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001676161-command-34369-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "4c05e6a8abfc591911fa94e0d74995d00e28bc2cb4bd8aac6240ba8ccc0b8f5e")
  (:PATH "processes/collection/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001676161-command-34369-0/report.lisp")
   :BYTES 297328 :SHA256
   "01cb07249dfa2fc1c1a35bb6887dcaeb87779e7f486d9ef7992895e0eb29994a")
  (:PATH "processes/trace-links/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001676247-command-35520-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "3ded83fb533ef52c6f5be109b0af137cf0d24c16e42c306a4a448cd6e3099cbf")
  (:PATH "processes/trace-links/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001676247-command-35520-0/report.lisp")
   :BYTES 263132 :SHA256
   "e5d153b4e44829004887b3ea3f0aa5857cc5e9c5c3d16d54fab21f80d06845f5")
  (:PATH "raw/collection/closed-check.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-collection/closed-check.log")
   :BYTES 3144 :SHA256
   "e1aa75e23576171630df9c4234075679e8f2d8c36a62993099e784cf26263823")
  (:PATH "raw/collection/report.lisp" :SOURCE
   #A((102) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-collection/report.lisp")
   :BYTES 36990 :SHA256
   "7fe0ef7f6bafdc875d28aeb4d54610778e40e2ad0b93ed57a98c170dfed955ed"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
