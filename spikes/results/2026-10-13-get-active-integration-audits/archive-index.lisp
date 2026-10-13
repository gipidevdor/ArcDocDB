(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "archive-audit-command" :RECORD-PATH
   "raw/archive-audit-command/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((8) BASE-CHAR . "--script")
    #A((46) BASE-CHAR . "spikes/out/active-publication-audit/audit.lisp")
    #A((49) BASE-CHAR . "spikes/out/active-publication/final-manifest.lisp")
    #A((49) BASE-CHAR . "spikes/results/2026-10-13-get-active-integration/")
    #A((49) BASE-CHAR . "spikes/out/active-publication-audit/contract.lisp")
    #A((69) BASE-CHAR
       . "spikes/out/active-publication-audit/integration-archive-audit-R1.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "archive-collector-command" :RECORD-PATH
   "raw/archive-collector-command/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((42) BASE-CHAR . "spikes/out/active-publication/collect.lisp")
    #A((49) BASE-CHAR . "spikes/out/active-publication/final-manifest.lisp")
    #A((49) BASE-CHAR . "spikes/results/2026-10-13-get-active-integration/"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "README.md" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-integration-audit-sidecar/README-template.txt")
   :BYTES 2205 :SHA256
   "b15e631666e70e4975fe968031aff744768dd8c45552954d1d66b17fc677c6a0")
  (:PATH "collection-manifest.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-integration-audit-sidecar/manifest.lisp")
   :BYTES 824 :SHA256
   "8fa8873929c5a836f33155a583a0439f0efbcaa4d448f3cf9800a8e90a1cf34f")
  (:PATH "collection-source.txt" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-publication/collect.lisp")
   :BYTES 16793 :SHA256
   "64724e5e99686930aeac8b39664274f6e665b4acb56ea87a7d4e62f1fa0ee79d")
  (:PATH "raw/archive-audit-command/conservazione.lisp" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000913439-command-75858-0/conservazione.lisp")
   :BYTES 1171 :SHA256
   "9d1ef01ffe07f0c074ba143489446cbbf41268bb4740766e06c051c322f98bcd")
  (:PATH "raw/archive-audit-command/report.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000913439-command-75858-0/report.lisp")
   :BYTES 162201 :SHA256
   "32bd6dddd39670f7456939e6eee60251e74c00f52e2e61f49aa503aafd5f9b08")
  (:PATH "raw/archive-collector-command/conservazione.lisp" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912988-command-63343-0/conservazione.lisp")
   :BYTES 1171 :SHA256
   "ce65eda0111f278d01cc050ab683a5431212ecedfddf20a215c40ee18512955c")
  (:PATH "raw/archive-collector-command/report.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912988-command-63343-0/report.lisp")
   :BYTES 162123 :SHA256
   "d53d680113198a2880ccf414eb322565f8c9349c52edfcd3d9eb2a7d1e6cea57")
  (:PATH "raw/publication-audit/audit-original.lisp.txt" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-publication-audit/audit-original.lisp.txt")
   :BYTES 20061 :SHA256
   "dee576bed743f096a52b16539febf57b5899808ca2c29bb587393196f44c1ce4")
  (:PATH "raw/publication-audit/audit.lisp" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-publication-audit/audit.lisp")
   :BYTES 20060 :SHA256
   "b4c7af36c501647ecdca81b0a9ac314ed76d8c8bd6f8f5d50a5d1c6c411a46d9")
  (:PATH "raw/publication-audit/contract-original.lisp.txt" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-publication-audit/contract-original.lisp.txt")
   :BYTES 1950 :SHA256
   "c444256c7fafedbb0bce96bb341ac223cef960ecedc223bb4154919374fbb091")
  (:PATH "raw/publication-audit/contract.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-publication-audit/contract.lisp")
   :BYTES 1531 :SHA256
   "dfbea6978e0c4228b0277e37116d6cdf58529892946d423004ff0b35f367e25f")
  (:PATH "raw/publication-audit/integration-archive-audit-R1.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-publication-audit/integration-archive-audit-R1.lisp")
   :BYTES 162306 :SHA256
   "dca98a772374556020b4e51f97ffd2a1f4b8837ab178d927d6de49c843f837cd")
  (:PATH "raw/publication-audit/integration-archive-command-R1.stderr" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-publication-audit/integration-archive-command-R1.stderr")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/publication-audit/integration-archive-command-R1.stdout" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-publication-audit/integration-archive-command-R1.stdout")
   :BYTES 415 :SHA256
   "cbc4ee03558bb57fc7f9bc6d8d5ff25aa8527292d3999e4a4057bc880259dc49")
  (:PATH "sidecar-audit-contract.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-integration-audit-sidecar/contract.lisp")
   :BYTES 534 :SHA256
   "a65a3227f82e58ba87de7715385c7038b1fc999ed7549435a5486c98a545fca9")
  (:PATH "sidecar-audit-source.txt" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-integration-audit-sidecar/audit.lisp")
   :BYTES 20060 :SHA256
   "b4c7af36c501647ecdca81b0a9ac314ed76d8c8bd6f8f5d50a5d1c6c411a46d9"))
 :LIMITS
 (:COMPLETE-EXPLICIT-GROUPS :RAW-FASL-PRESERVED-AS-DATA :SOURCE-AND-COPY-SHA256
  :LOSSLESS-GZIP-FOR-LARGE-RAW :NO-RESULT-PROMOTION))
