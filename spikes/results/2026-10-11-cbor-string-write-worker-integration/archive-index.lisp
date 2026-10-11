(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "workerIntegratedCheck" :RECORD-PATH
   "processes/workerIntegratedCheck/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core")))
  (:LABEL "previousFinalClosedAudit" :RECORD-PATH
   "processes/previousFinalClosedAudit/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((32) BASE-CHAR . "tools/check-command-archive.lisp")
    #A((9) BASE-CHAR . "--archive")
    #A((50) BASE-CHAR . "spikes/results/2026-10-11-cbor-string-write-final/")))
  (:LABEL #A((16) BASE-CHAR . "workerCollection") :RECORD-PATH
   "processes/workerCollection/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((36) BASE-CHAR . "spikes/out/header-write/collect.lisp")
    #A((9) BASE-CHAR . "--collect")
    #A((81) BASE-CHAR
       . "spikes/out/cbor-string-write-worker-integration-20261011/collection-manifest.lisp")
    #A((63) BASE-CHAR
       . "spikes/results/2026-10-11-cbor-string-write-worker-integration/")))
  (:LABEL #A((11) BASE-CHAR . "workerLinks") :RECORD-PATH
   "processes/workerLinks/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "make") #A((5) BASE-CHAR . "links"))))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-worker-integration-20261011/collection-manifest.lisp")
   :BYTES 1212 :SHA256
   "35493b1ee3a0e14560458fc9cc79676d995eafb5486ac74628fe44cc4c2300bb")
  (:PATH "collection-source.lisp" :SOURCE
   #A((101) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/header-write/collect.lisp")
   :BYTES 9677 :SHA256
   "f59f7a52934c7fe6103b5047aade87214f17494e857fe35c568968c681790d81")
  (:PATH "processes/previousFinalClosedAudit/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000711235-command-56488-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "2c8fbdc964a8d314bf5458009cc2aed37b92b0dd0a90d7049a9dbe15c918abdc")
  (:PATH "processes/previousFinalClosedAudit/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000711235-command-56488-0/report.lisp")
   :BYTES 136418 :SHA256
   "cf533bd00ccc0be7ae5c8f89dd9f54ffe598072e98f09bf92654cb265ebba78d")
  (:PATH "processes/workerIntegratedCheck/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000711291-command-57732-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "7ce2996f0766cbd8bb979991b17a06dfaf124b0afe4c682d1ca1e40ede91552d")
  (:PATH "processes/workerIntegratedCheck/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000711291-command-57732-0/report.lisp")
   :BYTES 671661 :SHA256
   "aa1a41a5e66d7d5c5f2fe96268336cae01a0a76540e180005bd1e735c7b06233")
  (:PATH "raw/integrated-spikes/SPK-01.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000711436-check-60159-0/SPK-01.lisp")
   :BYTES 27228 :SHA256
   "9d6ac4548ac26242964d238078b132bdb2efc5b59feea32892ba5e52a1dc22a9")
  (:PATH "raw/integrated-spikes/SPK-02.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000711436-check-60159-0/SPK-02.lisp")
   :BYTES 1607 :SHA256
   "c1898c807f22d1d33bc9d285cdec6b0f508eec9cf30263dee424a96d3c3e0ab2")
  (:PATH "raw/integrated-spikes/SPK-03.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000711436-check-60159-0/SPK-03.lisp")
   :BYTES 3646 :SHA256
   "d88319b67b1eb0a60bd0f039a225837c7f60f1c7244c273bdbf0b0272c065794")
  (:PATH "raw/integrated-spikes/SPK-04.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000711436-check-60159-0/SPK-04.lisp")
   :BYTES 6752 :SHA256
   "d054c1aefd3924087e960f4d8c1290c2f6a2c43ed8aff77cebbafb52c3b01539")
  (:PATH "raw/integrated-spikes/SPK-05.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000711436-check-60159-0/SPK-05.lisp")
   :BYTES 10171 :SHA256
   "53ba25eb57e90061638c2c9b9be31cd04c295ac1cb8a89e2a3b16f028325e446")
  (:PATH "raw/integrated-spikes/SPK-06.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000711436-check-60159-0/SPK-06.lisp")
   :BYTES 24152 :SHA256
   "092d944873c23cb7b9b6a5c8cbd1a5e3ee6d5105a0b51fdf0a188d61fda7ec3e")
  (:PATH "raw/integrated-spikes/SPK-07.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000711436-check-60159-0/SPK-07.lisp")
   :BYTES 318 :SHA256
   "36882a09a6d8ad786c1fb6c27695a475e94f8248cb94a290463146ea9e518039")
  (:PATH "raw/integrated-spikes/SPK-07.lisp.gz" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000711436-check-60159-0/SPK-07.lisp.gz")
   :BYTES 410630 :SHA256
   "a218e03261498a97eb3c564b34cf89d3844496a4da9631cb71fc6ef88b99192d")
  (:PATH "raw/integrated-spikes/SPK-08.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000711436-check-60159-0/SPK-08.lisp")
   :BYTES 292334 :SHA256
   "11ffda341f6e59fc1ed4ff945805e4b7063a1bf38a97472f6a80b4652207d08c")
  (:PATH "raw/integrated-spikes/SPK-09.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000711436-check-60159-0/SPK-09.lisp")
   :BYTES 2472 :SHA256
   "3840967516e05f2df3ceda8b88c0c6885d0198a15690b2cb70f7b8b8efd070bb")
  (:PATH "raw/integrated-spikes/SPK-10.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000711436-check-60159-0/SPK-10.lisp")
   :BYTES 22977 :SHA256
   "56676a508aa60a9529396003eb4e21339e9f7e911ce961fcfdf3eb4bfc6c5875")
  (:PATH "raw/integrated-spikes/conservazione.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000711436-check-60159-0/conservazione.lisp")
   :BYTES 2306 :SHA256
   "0132201efb0a670802827dd0915cd33787783a799b8ab2c7b32e5e78067b1d55")
  (:PATH "raw/integrated-spikes/report.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000711436-check-60159-0/report.lisp")
   :BYTES 318 :SHA256
   "ab73cbb8c424e2807a0028aed3633b299a734244bd41e33f66e81f469ba4bc52")
  (:PATH "raw/integrated-spikes/report.lisp.gz" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000711436-check-60159-0/report.lisp.gz")
   :BYTES 466899 :SHA256
   "fdcd171eaaa1c644b156ce846482bbc3b55d15baca1262f4f160a3f179e9bc54")
  (:PATH "raw/setup/integrated-arcdocdb.asd.txt" :SOURCE
   #A((77) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/arcdocdb.asd")
   :BYTES 11267 :SHA256
   "91c878c64508aa4eb623ecaeb996aeba36e527b2e807eab3a120957f2f9cd463")
  (:PATH "raw/setup/integrated-coverage.lisp.txt" :SOURCE
   #A((95) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/tools/foundation-coverage.lisp")
   :BYTES 12819 :SHA256
   "61407c521d6ecbbbf1b431ba835afb8efd3d055497f935440caa3a9cb28abe44")
  (:PATH "raw/setup/results.md.txt" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/docs/implementazione/cbor-stringhe-risultati.md")
   :BYTES 7409 :SHA256
   "1e8478ba374aa6a85c460a01304109c4ba7dbc0879ecfd54828baf8eca858668")
  (:PATH "processes/workerCollection/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000711534-command-62597-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "84cc3a32af82391774058c3d22931035f75bb13d4d87c23b013c9ebaf42c3f05")
  (:PATH "processes/workerCollection/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000711534-command-62597-0/report.lisp")
   :BYTES 135844 :SHA256
   "3f5a72c55c392e05990325c3288baa10da68b8a541c4c9dceefba870e1a6f6ea")
  (:PATH "processes/workerLinks/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000711572-command-63489-0/conservazione.lisp")
   :BYTES 1155 :SHA256
   "6c4470f88e66c9e1bf8458cdffd6a841c99457ea71274ea17ec0255c49d20017")
  (:PATH "processes/workerLinks/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000711572-command-63489-0/report.lisp")
   :BYTES 135449 :SHA256
   "ba1a51976da6e6cf424f9453b8bc9bf271d3e6a7ff1da894fe1a94f64776db4f"))
 :LIMITS
 (:SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :FASL-EXCLUDED-FROM-PUBLISHED-MUTATION-TREES
  :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
