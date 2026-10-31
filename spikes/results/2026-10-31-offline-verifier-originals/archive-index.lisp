(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL #A((7) BASE-CHAR . "initial") :RECORD-PATH
   #A((29) BASE-CHAR . "processes/initial/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((27) BASE-CHAR . "spikes/verify-m1-check.lisp"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((9) BASE-CHAR . "focused-2") :RECORD-PATH
   #A((31) BASE-CHAR . "processes/focused-2/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((27) BASE-CHAR . "spikes/verify-m1-check.lisp"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((9) BASE-CHAR . "focused-3") :RECORD-PATH
   #A((31) BASE-CHAR . "processes/focused-3/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((27) BASE-CHAR . "spikes/verify-m1-check.lisp"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((9) BASE-CHAR . "focused-4") :RECORD-PATH
   #A((31) BASE-CHAR . "processes/focused-4/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((27) BASE-CHAR . "spikes/verify-m1-check.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((4) BASE-CHAR . "lint") :RECORD-PATH
   #A((26) BASE-CHAR . "processes/lint/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "make") #A((4) BASE-CHAR . "lint")) :STATUS :OK
   :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((9) BASE-CHAR . "focused-5") :RECORD-PATH
   #A((31) BASE-CHAR . "processes/focused-5/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((27) BASE-CHAR . "spikes/verify-m1-check.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((10) BASE-CHAR . "full-check") :RECORD-PATH
   #A((32) BASE-CHAR . "processes/full-check/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "make") #A((10) BASE-CHAR . "check-core")) :STATUS
   :FAILED :EXIT-CODE 143 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((24) BASE-CHAR . "report-isolation-failure") :RECORD-PATH
   #A((46) BASE-CHAR . "processes/report-isolation-failure/report.lisp")
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((27) BASE-CHAR . "spikes/verify-m1-check.lisp"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((29) BASE-CHAR . "report-isolation-reproduction") :RECORD-PATH
   #A((51) BASE-CHAR . "processes/report-isolation-reproduction/report.lisp")
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((27) BASE-CHAR . "spikes/verify-m1-check.lisp"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((16) BASE-CHAR . "full-check-final") :RECORD-PATH
   #A((38) BASE-CHAR . "processes/full-check-final/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "make") #A((10) BASE-CHAR . "check-core")) :STATUS
   :FAILED :EXIT-CODE 2 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((4) BASE-CHAR . "docs") :RECORD-PATH
   #A((26) BASE-CHAR . "processes/docs/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((22) BASE-CHAR . "tools/pages/build.lisp") #A((6) BASE-CHAR . "--test"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((12) BASE-CHAR . "docs-runtime") :RECORD-PATH
   #A((34) BASE-CHAR . "processes/docs-runtime/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "make") #A((18) BASE-CHAR . "docs-runtime-check")
    #A((13) BASE-CHAR . "docs-examples"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((20) BASE-CHAR . "ci-catalog-follow-up") :RECORD-PATH
   #A((42) BASE-CHAR . "processes/ci-catalog-follow-up/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "make") #A((11) BASE-CHAR . "ci-selftest")) :STATUS :OK
   :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "ci-initial-child" :RECORD-PATH
   "processes/ci-initial-child/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((13) BASE-CHAR . "tools/ci.lisp")
    #A((9) BASE-CHAR . "self-test") #A((5) BASE-CHAR . "--out")
    #A((39) BASE-CHAR . "spikes/out/ci/selftest-1793485167-19521"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/archive-input.lisp")
   :BYTES 10102 :SHA256
   "67fcb733c5fcec4c520dc11a4aa8dbe259a93b4b1ff1c330379c738c507ba1f1")
  (:PATH "collection-source.lisp" :SOURCE
   #A((100) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")
  (:PATH "diagnostics/ci-follow-up-summary.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/ci/selftest-1793485293-20722/report.lisp")
   :BYTES 632 :SHA256
   "3bf53e3748c34568e0fb83b9f6f7ed394be5c711a74ca8b7bdde88a45f49bc23")
  (:PATH "diagnostics/ci-follow-up-tests.lisp" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/ci/selftest-1793485293-20722/tests.lisp")
   :BYTES 2409 :SHA256
   "ba1c0e543638f0424a2c9f3c07cc641b5f0e776c7e036135293eebd50a169904")
  (:PATH "diagnostics/ci-initial-summary.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/ci/selftest-1793485167-19521/report.lisp")
   :BYTES 632 :SHA256
   "2510197dfa7dbbfc76bd5a67177797d5be096f547ac86d1406cfa9bd13fa0883")
  (:PATH "diagnostics/ci-initial-tests.lisp" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/ci/selftest-1793485167-19521/tests.lisp")
   :BYTES 2409 :SHA256
   "fe0de5c4158f4cd7131976214c2539209dca08f2b65909f753cb0215e8556372")
  (:PATH "method/archive-helper.lisp.txt" :SOURCE
   #A((43) BASE-CHAR . "/private/tmp/arcdocdb-verifier-archive.lisp") :BYTES
   2457 :SHA256
   "2d81029cb7f859809caf78dcf99a23677229bd7c2c508e83866f275c15186501")
  (:PATH "method/focused-driver.lisp.txt" :SOURCE
   #A((93) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/verify-m1-check.lisp")
   :BYTES 567 :SHA256
   "a98cb727e85672298fd84fe51cbca29f968c85ecb26dcef70dabadfea8e32527")
  (:PATH
   #A((49) BASE-CHAR . "processes/ci-catalog-follow-up/conservazione.lisp")
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/ci-catalog-follow-up/conservazione.lisp")
   :BYTES 1173 :SHA256
   "7a5dcaa84d8ad9b8bd33dc09d9842836eee097947e1a99c20e428722abbb765e")
  (:PATH #A((42) BASE-CHAR . "processes/ci-catalog-follow-up/report.lisp")
   :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/ci-catalog-follow-up/report.lisp")
   :BYTES 334623 :SHA256
   "7821cc4e43a4e967514df80c1583155f7635b30272aeb865e8c680eb30bb8410")
  (:PATH "processes/ci-initial-child/conservazione.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/4002473968-command-19525-0/conservazione.lisp")
   :BYTES 1147 :SHA256
   "401b18d6609ccc0dd86fbd6caaf6e1a3a387cbffe9769bc5d0efd19097f8770a")
  (:PATH "processes/ci-initial-child/report.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/4002473968-command-19525-0/report.lisp")
   :BYTES 335120 :SHA256
   "d87fe2f7ce26c629cc0c9feccaad28d737f5ffd50c0b92ce6138a4038f3b5ec0")
  (:PATH #A((41) BASE-CHAR . "processes/docs-runtime/conservazione.lisp")
   :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/docs-runtime/conservazione.lisp")
   :BYTES 1156 :SHA256
   "6d23fe952183ceef3430c69af60eee7c74fab6b5401e55bc066ab80aba65b37d")
  (:PATH #A((34) BASE-CHAR . "processes/docs-runtime/report.lisp") :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/docs-runtime/report.lisp")
   :BYTES 335089 :SHA256
   "e523b0482112cafe5932d69f0898158e2487105a7f0656414cd6021f41329d8b")
  (:PATH #A((33) BASE-CHAR . "processes/docs/conservazione.lisp") :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/docs/conservazione.lisp")
   :BYTES 1139 :SHA256
   "f716adc406632c4cab52fc1ec0d96587f4fdc2e433f5745c34991a4c96472a3f")
  (:PATH #A((26) BASE-CHAR . "processes/docs/report.lisp") :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/docs/report.lisp")
   :BYTES 338651 :SHA256
   "c557670d629a09a83f6175b143935754e86b3cb5be465310c1d02476c82e3077")
  (:PATH #A((38) BASE-CHAR . "processes/focused-2/conservazione.lisp") :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/focused-2/conservazione.lisp")
   :BYTES 1151 :SHA256
   "2f6796de0095444580e4a70ec5411f61f2b39a1ce275ada0c572994a8dced88c")
  (:PATH #A((31) BASE-CHAR . "processes/focused-2/report.lisp") :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/focused-2/report.lisp")
   :BYTES 338601 :SHA256
   "46f35b79693b9113258392e68bedb558c89590e03e420ed2c96a40a16667a1a9")
  (:PATH #A((38) BASE-CHAR . "processes/focused-3/conservazione.lisp") :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/focused-3/conservazione.lisp")
   :BYTES 1151 :SHA256
   "eac122befe72e72810145d14e64ae2e77d644510994ce861b8bf764d7336eafa")
  (:PATH #A((31) BASE-CHAR . "processes/focused-3/report.lisp") :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/focused-3/report.lisp")
   :BYTES 356771 :SHA256
   "4c39e68623bc9da7fc7fdba10898a21faa1dd127d058bd3b580da0f442d7f3aa")
  (:PATH #A((38) BASE-CHAR . "processes/focused-4/conservazione.lisp") :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/focused-4/conservazione.lisp")
   :BYTES 1150 :SHA256
   "88df9f793238bbc618fd00895779feef982f6f831e780162ded7056d22e3ff0c")
  (:PATH #A((31) BASE-CHAR . "processes/focused-4/report.lisp") :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/focused-4/report.lisp")
   :BYTES 337107 :SHA256
   "0b1eed87fb322c7426af9e5976d59bae945746dea7b14993bc5c7654908fcdf7")
  (:PATH #A((38) BASE-CHAR . "processes/focused-5/conservazione.lisp") :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/focused-5/conservazione.lisp")
   :BYTES 1151 :SHA256
   "001f80f174b368790122b5a63b9eb29c539040d8e3ef932e589d9ad2954d515c")
  (:PATH #A((31) BASE-CHAR . "processes/focused-5/report.lisp") :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/focused-5/report.lisp")
   :BYTES 337273 :SHA256
   "0ddb02b617dbfd254f02665aa164bf647350ce1dc6e04b0f0d7dc7e3e63e22e4")
  (:PATH #A((45) BASE-CHAR . "processes/full-check-final/conservazione.lisp")
   :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/full-check-final/conservazione.lisp")
   :BYTES 1756 :SHA256
   "ba31dcd60a7c758edaec38f851d3053d779a4e6bb64bbd6cc2996255c1a96912")
  (:PATH #A((38) BASE-CHAR . "processes/full-check-final/report.lisp") :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/full-check-final/report.lisp")
   :BYTES 317 :SHA256
   "095d65179998f2a4030f51632eaeb649e851645dfb33069da4dcb88cfc49004c")
  (:PATH #A((41) BASE-CHAR . "processes/full-check-final/report.lisp.gz")
   :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/full-check-final/report.lisp.gz")
   :BYTES 343271 :SHA256
   "154e971db5b314bd96e8543df24c0c68eb3e7cd7623043052fa5088a5982e585")
  (:PATH #A((39) BASE-CHAR . "processes/full-check/conservazione.lisp") :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/full-check/conservazione.lisp")
   :BYTES 1739 :SHA256
   "a2b58898270ca20a3344ca13597d5cd3575fbc3e11dc0b097cd9e3b56d7efbe0")
  (:PATH #A((32) BASE-CHAR . "processes/full-check/report.lisp") :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/full-check/report.lisp")
   :BYTES 317 :SHA256
   "94edbbd8c2af3ef771630d8975f07c72792e7b66bb0ee5a748e9a67b56308322")
  (:PATH #A((35) BASE-CHAR . "processes/full-check/report.lisp.gz") :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/full-check/report.lisp.gz")
   :BYTES 317503 :SHA256
   "7ffd86c22386ecca362ccb08fa0d0c63c21d5136dbf51deb3f21cfb5e1b65f9b")
  (:PATH #A((36) BASE-CHAR . "processes/initial/conservazione.lisp") :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/initial/conservazione.lisp")
   :BYTES 1147 :SHA256
   "36d283472cb95011586bb2891e3e9c46bfa0bfc83a3d2bd4273d5d71176d75e1")
  (:PATH #A((29) BASE-CHAR . "processes/initial/report.lisp") :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/initial/report.lisp")
   :BYTES 338953 :SHA256
   "f34d74d13e431dca233070c195d68d4175b9993c5611d0351f73dc1c246a51bd")
  (:PATH #A((33) BASE-CHAR . "processes/lint/conservazione.lisp") :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/lint/conservazione.lisp")
   :BYTES 1141 :SHA256
   "52252b2b6e76b49bcf8727af15eb0475611584322e454fca3dff9550eec73eaa")
  (:PATH #A((26) BASE-CHAR . "processes/lint/report.lisp") :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/lint/report.lisp")
   :BYTES 334434 :SHA256
   "e1ae67843d9167128c1005b86200b330015d66f82e6692102ed737b683be61cd")
  (:PATH
   #A((53) BASE-CHAR . "processes/report-isolation-failure/conservazione.lisp")
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/report-isolation-failure/conservazione.lisp")
   :BYTES 1181 :SHA256
   "33c24bda19d1f788eea507eb8416234cc5cd331435e8863099ad8d257d47f9cf")
  (:PATH #A((46) BASE-CHAR . "processes/report-isolation-failure/report.lisp")
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/report-isolation-failure/report.lisp")
   :BYTES 341928 :SHA256
   "7237c4b3a2a2b0f473c65eec36b46b603912c2001f88351c51c7bc05b5dae70a")
  (:PATH
   #A((58) BASE-CHAR
      . "processes/report-isolation-reproduction/conservazione.lisp")
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/report-isolation-reproduction/conservazione.lisp")
   :BYTES 1191 :SHA256
   "6d4c2a3569d89b3777aa7b43d23a08e220670cefbcdcf3660786703c9a4fb192")
  (:PATH
   #A((51) BASE-CHAR . "processes/report-isolation-reproduction/report.lisp")
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/verify-m1-20261031/report-isolation-reproduction/report.lisp")
   :BYTES 338172 :SHA256
   "e7430b34394e5c20d8f352dcfa5005013c3bf2930541630546798afdeeeab9fc"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
