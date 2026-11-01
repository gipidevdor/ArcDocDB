(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "trace-generation" :RECORD-PATH
   #A((38) BASE-CHAR . "processes/trace-generation/report.lisp") :COMMAND
   (#A((40) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/bin/sbcl")
    #A((10) BASE-CHAR . "--noinform") #A((13) BASE-CHAR . "--no-userinit")
    #A((12) BASE-CHAR . "--no-sysinit") #A((8) BASE-CHAR . "--script")
    #A((22) BASE-CHAR . "tools/check-trace.lisp")
    #A((7) BASE-CHAR . "--write"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "full" :RECORD-PATH #A((26) BASE-CHAR . "processes/full/report.lisp")
   :COMMAND
   (#A((40) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/bin/sbcl")
    #A((10) BASE-CHAR . "--noinform") #A((13) BASE-CHAR . "--no-userinit")
    #A((12) BASE-CHAR . "--no-sysinit") #A((8) BASE-CHAR . "--script")
    #A((57) BASE-CHAR
       . "spikes/out/metrics-main-merge-20261101/verify-merged.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "audit" :RECORD-PATH
   #A((27) BASE-CHAR . "processes/audit/report.lisp") :COMMAND
   (#A((12) BASE-CHAR . "/usr/bin/env")
    #A((240) BASE-CHAR
       . "ASDF_OUTPUT_TRANSLATIONS=(:output-translations ((:root :**/ :*.*.*) (\"/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-main-merge-20261101/audit-fasl/\" :**/ :*.*.*)) :ignore-inherited-configuration)")
    #A((4) BASE-CHAR . "make")
    #A((45) BASE-CHAR . "SBCL=/opt/homebrew/Cellar/sbcl/2.6.9/bin/sbcl")
    #A((11) BASE-CHAR . "legal-check") #A((4) BASE-CHAR . "lint")
    #A((13) BASE-CHAR . "lint-selftest")
    #A((23) BASE-CHAR . "record-command-selftest")
    #A((26) BASE-CHAR . "snapshot-mutation-selftest")
    #A((24) BASE-CHAR . "reader-mutation-selftest") #A((5) BASE-CHAR . "trace")
    #A((5) BASE-CHAR . "links") #A((14) BASE-CHAR . "fulltext-check")
    #A((17) BASE-CHAR . "evidence-selftest")
    #A((12) BASE-CHAR . "spikes-check") #A((11) BASE-CHAR . "ci-selftest"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "evidence" :RECORD-PATH
   #A((30) BASE-CHAR . "processes/evidence/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "make")
    #A((45) BASE-CHAR . "SBCL=/opt/homebrew/Cellar/sbcl/2.6.9/bin/sbcl")
    #A((15) BASE-CHAR . "EVIDENCE_JOBS=4") #A((8) BASE-CHAR . "evidence"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "primary-before" :RECORD-PATH
   #A((36) BASE-CHAR . "processes/primary-before/report.lisp") :COMMAND
   (#A((7) BASE-CHAR . "python3")
    #A((62) BASE-CHAR
       . "spikes/out/metrics-main-merge-20261101/primary-preservation.py")
    #A((6) BASE-CHAR . "before")
    #A((40) BASE-CHAR . "dd755e0080242e36a6cda1182117e3cddb230319"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "primary-ff" :RECORD-PATH
   #A((32) BASE-CHAR . "processes/primary-ff/report.lisp") :COMMAND
   (#A((3) BASE-CHAR . "git") #A((2) BASE-CHAR . "-C")
    #A((39) BASE-CHAR . "/Users/gpicchiarelli/Documents/ArcDocDB")
    #A((5) BASE-CHAR . "merge") #A((9) BASE-CHAR . "--ff-only")
    #A((7) BASE-CHAR . "--quiet")
    #A((40) BASE-CHAR . "dd755e0080242e36a6cda1182117e3cddb230319"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "primary-after" :RECORD-PATH
   #A((35) BASE-CHAR . "processes/primary-after/report.lisp") :COMMAND
   (#A((7) BASE-CHAR . "python3")
    #A((62) BASE-CHAR
       . "spikes/out/metrics-main-merge-20261101/primary-preservation.py")
    #A((5) BASE-CHAR . "after")
    #A((40) BASE-CHAR . "dd755e0080242e36a6cda1182117e3cddb230319"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-main-merge-20261101/manifest.lisp")
   :BYTES 9341 :SHA256
   "429e9da3d64d667094e2ea3194ac7966d3fd0800250a7ef44fd25a0980aab4a7")
  (:PATH "collection-source.lisp" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31300 :SHA256
   "ea7f7011519a7c24d379c086ae74ccd5aec3650eddb943633952d55d9d3e4e96")
  (:PATH "full-tests/tests.events.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-main-merge-20261101/stage/full-tests/tests.events.lisp")
   :BYTES 318 :SHA256
   "c1469207ce17b82bc208974fb7507a7061f0a31804fa92baea4f995a267b6c30")
  (:PATH "full-tests/tests.events.lisp.gz" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-main-merge-20261101/stage/full-tests/tests.events.lisp.gz")
   :BYTES 159446 :SHA256
   "a728aa5fc5faaa3ff98eac6e27265c5ba375315014ae5b61c87daa9978de5142")
  (:PATH "full-tests/tests.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-main-merge-20261101/stage/full-tests/tests.lisp")
   :BYTES 309 :SHA256
   "d239597ca63364e47d610c86bbdf93140f28527a6c8a0ae02dafe601dd5658ab")
  (:PATH "full-tests/tests.lisp.gz" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-main-merge-20261101/stage/full-tests/tests.lisp.gz")
   :BYTES 74011 :SHA256
   "2a1b7c6bd9bf6e68755c72861f56f32871dfedc032fd653dce5ec6a3a3ebf700")
  (:PATH "method/method.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-main-merge-20261101/stage/method/method.lisp")
   :BYTES 1186 :SHA256
   "65a0c01adb8db7b3019b40bcada022d5c17ffe2aec49a31aed38e83dc889ff73")
  (:PATH "method/packet-support.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-main-merge-20261101/stage/method/packet-support.lisp")
   :BYTES 2296 :SHA256
   "c836d6f7320dcac68829b41d6529c1e8bf12362c099bce147a3a2c1da8fbad4c")
  (:PATH "method/prepare-results.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-main-merge-20261101/stage/method/prepare-results.lisp")
   :BYTES 316 :SHA256
   "3f7ea57abe13ef35fb4f8831bae6bf4681daec29eceefcd12e4beeb989216268")
  (:PATH "method/prepare-results.lisp.gz" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-main-merge-20261101/stage/method/prepare-results.lisp.gz")
   :BYTES 2285 :SHA256
   "0fa93b63cb67b9b68ac3e23293ea4c73eac4ce4e0bf1dec1c9818f40e8e2837d")
  (:PATH "method/primary-preservation.py" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-main-merge-20261101/stage/method/primary-preservation.py")
   :BYTES 2931 :SHA256
   "f2b4132285990adf86cd17175ab96740a9cc8a775dd0291f5034cf3b3c3c2edd")
  (:PATH "method/verify-merged.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-main-merge-20261101/stage/method/verify-merged.lisp")
   :BYTES 2026 :SHA256
   "18084f4de505c6f0e02c1421c095575054c7b1a79d2a3c8448defa8098d7dfb4")
  (:PATH "primary/after.json" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-main-merge-20261101/stage/primary/after.json")
   :BYTES 275 :SHA256
   "748a8fee9d19e66901559fc559330fa49560d50ee0a53c97ad4be7c67bb8f18b")
  (:PATH "primary/before.json" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-main-merge-20261101/stage/primary/before.json")
   :BYTES 308 :SHA256
   "36758ac0c6dab45b197d25edc5db2558cf6be02b636d2a6c738fca8cb13c13c9")
  (:PATH "primary/before.json.gz" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-main-merge-20261101/stage/primary/before.json.gz")
   :BYTES 8185 :SHA256
   "320532ffe04ec74e5bfa61a4b71c2b594c850cf58734db7992b4bff24d09014e")
  (:PATH #A((34) BASE-CHAR . "processes/audit/conservazione.lisp") :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-main-merge-20261101/stage/processes/audit/conservazione.lisp")
   :BYTES 1207 :SHA256
   "7827be4636914491e67f8a5dcc4e4faa619ec186f97b0169947b62e32dfe31d0")
  (:PATH #A((27) BASE-CHAR . "processes/audit/report.lisp") :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-main-merge-20261101/stage/processes/audit/report.lisp")
   :BYTES 311 :SHA256
   "d517347215e1d572396ba3f2a33aa7c13687f53bcd881465668ce0e07bfde6f4")
  (:PATH "processes/audit/report.lisp.gz" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-main-merge-20261101/stage/processes/audit/report.lisp.gz")
   :BYTES 127273 :SHA256
   "f32078092cb04868c347490adcae697bf543e8ea7f8d9dc2e91b3620cfe0c517")
  (:PATH #A((37) BASE-CHAR . "processes/evidence/conservazione.lisp") :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-main-merge-20261101/stage/processes/evidence/conservazione.lisp")
   :BYTES 1213 :SHA256
   "8b2d35da51a610b0eb0475c4c07b05affe71a0c47c325c6db4a31b6458f0f8d7")
  (:PATH #A((30) BASE-CHAR . "processes/evidence/report.lisp") :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-main-merge-20261101/stage/processes/evidence/report.lisp")
   :BYTES 311 :SHA256
   "ae476a2756217976d0b44e26e9c243b90e5b02309d045ca5d6e33d3ce5806c1b")
  (:PATH "processes/evidence/report.lisp.gz" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-main-merge-20261101/stage/processes/evidence/report.lisp.gz")
   :BYTES 115398 :SHA256
   "4b5d89353edd8656581dbdd81d2e00765729acb9c6734a7ff01b4c64c140cdbc")
  (:PATH #A((33) BASE-CHAR . "processes/full/conservazione.lisp") :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-main-merge-20261101/stage/processes/full/conservazione.lisp")
   :BYTES 1205 :SHA256
   "d1086e28caf2d0a37ef6058dfcbf858a0a5ebf3c28560cca50ed96dc775f690c")
  (:PATH #A((26) BASE-CHAR . "processes/full/report.lisp") :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-main-merge-20261101/stage/processes/full/report.lisp")
   :BYTES 311 :SHA256
   "44db53c168b26e376d13042f260697269fdc5533c7c6439acd436c6429263cd5")
  (:PATH "processes/full/report.lisp.gz" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-main-merge-20261101/stage/processes/full/report.lisp.gz")
   :BYTES 174576 :SHA256
   "ca49ef3874ec8278b25c257dfdbbcbf14ac030e004a36ca2f53bd8f9bcd5c12f")
  (:PATH #A((42) BASE-CHAR . "processes/primary-after/conservazione.lisp")
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-main-merge-20261101/stage/processes/primary-after/conservazione.lisp")
   :BYTES 1223 :SHA256
   "6ada1854d39c347cc97f52d5bf35d10ae4dc292e164bdd8642a1f78b05981572")
  (:PATH #A((35) BASE-CHAR . "processes/primary-after/report.lisp") :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-main-merge-20261101/stage/processes/primary-after/report.lisp")
   :BYTES 311 :SHA256
   "fd6b41556331d3ededac8c709d309752b0005b617f920433983438a5184f1ceb")
  (:PATH "processes/primary-after/report.lisp.gz" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-main-merge-20261101/stage/processes/primary-after/report.lisp.gz")
   :BYTES 115108 :SHA256
   "d9370ad6efb5443b7aef197e9798632b01e5bf2ceb570bf10b52ecea99c350ba")
  (:PATH #A((43) BASE-CHAR . "processes/primary-before/conservazione.lisp")
   :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-main-merge-20261101/stage/processes/primary-before/conservazione.lisp")
   :BYTES 1225 :SHA256
   "6918e0bf844f2df3f71377a988503a3a66a5a6d6225f3bb279305f7a99dbd3cf")
  (:PATH #A((36) BASE-CHAR . "processes/primary-before/report.lisp") :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-main-merge-20261101/stage/processes/primary-before/report.lisp")
   :BYTES 311 :SHA256
   "91fd420047d0fa61c881ec430b24aeeb5055e1f4d311de553e705c08f1c7154d")
  (:PATH "processes/primary-before/report.lisp.gz" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-main-merge-20261101/stage/processes/primary-before/report.lisp.gz")
   :BYTES 115075 :SHA256
   "3193ba58a3c0a5934d41cdc9bc8bed1cf4a1791a04f51940cded3f0ecda60947")
  (:PATH #A((39) BASE-CHAR . "processes/primary-ff/conservazione.lisp") :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-main-merge-20261101/stage/processes/primary-ff/conservazione.lisp")
   :BYTES 1217 :SHA256
   "a3ebc1b0d7906c19f4342c41212182982b570535d0ebf30055e27b3f774cc937")
  (:PATH #A((32) BASE-CHAR . "processes/primary-ff/report.lisp") :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-main-merge-20261101/stage/processes/primary-ff/report.lisp")
   :BYTES 311 :SHA256
   "cf20a92706e4e566a2b9a3bdfe501c958bd80bf74788fb071937dd50a51e2b58")
  (:PATH "processes/primary-ff/report.lisp.gz" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-main-merge-20261101/stage/processes/primary-ff/report.lisp.gz")
   :BYTES 115026 :SHA256
   "918699560abc758c02ffb33188649f1a3d5929155bd0908abd18f272f78710f3")
  (:PATH #A((45) BASE-CHAR . "processes/trace-generation/conservazione.lisp")
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-main-merge-20261101/stage/processes/trace-generation/conservazione.lisp")
   :BYTES 1229 :SHA256
   "ee6050da70438eb6e5b3133e9d0df7a246ba0eb1b73ddfaad4ea7ccda92dc29a")
  (:PATH #A((38) BASE-CHAR . "processes/trace-generation/report.lisp") :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-main-merge-20261101/stage/processes/trace-generation/report.lisp")
   :BYTES 311 :SHA256
   "53e63153f970457b3e02ea34cd8098f680464db406a35b523bd677193eee6d68")
  (:PATH "processes/trace-generation/report.lisp.gz" :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-main-merge-20261101/stage/processes/trace-generation/report.lisp.gz")
   :BYTES 117370 :SHA256
   "e83c50668159e5e3ae0ee9d2b7561f17d402bdf786ed7981e5dd0fb3109858ab")
  (:PATH "qualification.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-main-merge-20261101/stage/qualification.lisp")
   :BYTES 1412 :SHA256
   "732385dff2db9ef46a3de9a1674d72722067728f5903a873681a497c7b0c009e"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
