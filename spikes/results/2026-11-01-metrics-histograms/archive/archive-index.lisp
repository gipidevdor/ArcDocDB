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
  (:LABEL "focused-269-v1" :RECORD-PATH
   #A((36) BASE-CHAR . "processes/focused-269-v1/report.lisp") :COMMAND
   (#A((40) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/bin/sbcl")
    #A((10) BASE-CHAR . "--noinform") #A((13) BASE-CHAR . "--no-userinit")
    #A((12) BASE-CHAR . "--no-sysinit") #A((8) BASE-CHAR . "--script")
    #A((58) BASE-CHAR
       . "spikes/out/metrics-histograms-20261101/verify-product.lisp")
    #A((7) BASE-CHAR . "focused") #A((6) BASE-CHAR . "269-v1"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "focused-269-v2" :RECORD-PATH
   #A((36) BASE-CHAR . "processes/focused-269-v2/report.lisp") :COMMAND
   (#A((40) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/bin/sbcl")
    #A((10) BASE-CHAR . "--noinform") #A((13) BASE-CHAR . "--no-userinit")
    #A((12) BASE-CHAR . "--no-sysinit") #A((8) BASE-CHAR . "--script")
    #A((58) BASE-CHAR
       . "spikes/out/metrics-histograms-20261101/verify-product.lisp")
    #A((7) BASE-CHAR . "focused") #A((6) BASE-CHAR . "269-v2"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "full-269-v2" :RECORD-PATH
   #A((33) BASE-CHAR . "processes/full-269-v2/report.lisp") :COMMAND
   (#A((40) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/bin/sbcl")
    #A((10) BASE-CHAR . "--noinform") #A((13) BASE-CHAR . "--no-userinit")
    #A((12) BASE-CHAR . "--no-sysinit") #A((8) BASE-CHAR . "--script")
    #A((58) BASE-CHAR
       . "spikes/out/metrics-histograms-20261101/verify-product.lisp")
    #A((4) BASE-CHAR . "full") #A((6) BASE-CHAR . "269-v2"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "audit-269-v2" :RECORD-PATH
   #A((34) BASE-CHAR . "processes/audit-269-v2/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "make")
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
  (:LABEL "history-269-v2" :RECORD-PATH
   #A((36) BASE-CHAR . "processes/history-269-v2/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "make")
    #A((45) BASE-CHAR . "SBCL=/opt/homebrew/Cellar/sbcl/2.6.9/bin/sbcl")
    #A((8) BASE-CHAR . "evidence") #A((15) BASE-CHAR . "EVIDENCE_JOBS=4"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "bench-selftest-269" :RECORD-PATH
   #A((40) BASE-CHAR . "processes/bench-selftest-269/report.lisp") :COMMAND
   (#A((12) BASE-CHAR . "/usr/bin/env")
    #A((253) BASE-CHAR
       . "ASDF_OUTPUT_TRANSLATIONS=(:output-translations ((:root :**/ :*.*.*) (\"/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/bench-selftest-269-fasl/\" :**/ :*.*.*)) :ignore-inherited-configuration)")
    #A((40) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/bin/sbcl")
    #A((10) BASE-CHAR . "--noinform") #A((13) BASE-CHAR . "--no-userinit")
    #A((12) BASE-CHAR . "--no-sysinit") #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "tools/metrics-histogram-bench.lisp")
    #A((11) BASE-CHAR . "--self-test"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "bench-negative-269" :RECORD-PATH
   #A((40) BASE-CHAR . "processes/bench-negative-269/report.lisp") :COMMAND
   (#A((12) BASE-CHAR . "/usr/bin/env")
    #A((253) BASE-CHAR
       . "ASDF_OUTPUT_TRANSLATIONS=(:output-translations ((:root :**/ :*.*.*) (\"/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/bench-negative-269-fasl/\" :**/ :*.*.*)) :ignore-inherited-configuration)")
    #A((40) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/bin/sbcl")
    #A((10) BASE-CHAR . "--noinform") #A((13) BASE-CHAR . "--no-userinit")
    #A((12) BASE-CHAR . "--no-sysinit") #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "tools/metrics-histogram-bench.lisp")
    #A((18) BASE-CHAR . "--negative-fixture"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "bench-269" :RECORD-PATH
   #A((31) BASE-CHAR . "processes/bench-269/report.lisp") :COMMAND
   (#A((12) BASE-CHAR . "/usr/bin/env")
    #A((244) BASE-CHAR
       . "ASDF_OUTPUT_TRANSLATIONS=(:output-translations ((:root :**/ :*.*.*) (\"/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/bench-269-fasl/\" :**/ :*.*.*)) :ignore-inherited-configuration)")
    #A((40) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/bin/sbcl")
    #A((10) BASE-CHAR . "--noinform") #A((13) BASE-CHAR . "--no-userinit")
    #A((12) BASE-CHAR . "--no-sysinit") #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "tools/metrics-histogram-bench.lisp")
    #A((7) BASE-CHAR . "--bench") #A((12) BASE-CHAR . "--iterations")
    #A((7) BASE-CHAR . "1000000") #A((13) BASE-CHAR . "--repetitions")
    #A((1) BASE-CHAR . "5"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "focused-2610-v1" :RECORD-PATH
   #A((37) BASE-CHAR . "processes/focused-2610-v1/report.lisp") :COMMAND
   (#A((36) BASE-CHAR . "/Users/gpicchiarelli/.local/bin/sbcl")
    #A((10) BASE-CHAR . "--noinform") #A((13) BASE-CHAR . "--no-userinit")
    #A((12) BASE-CHAR . "--no-sysinit") #A((8) BASE-CHAR . "--script")
    #A((58) BASE-CHAR
       . "spikes/out/metrics-histograms-20261101/verify-product.lisp")
    #A((7) BASE-CHAR . "focused") #A((7) BASE-CHAR . "2610-v1"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "focused-2610-v2" :RECORD-PATH
   #A((37) BASE-CHAR . "processes/focused-2610-v2/report.lisp") :COMMAND
   (#A((12) BASE-CHAR . "/usr/bin/env")
    #A((58) BASE-CHAR
       . "SBCL_HOME=/Users/gpicchiarelli/.local/sbcl/2.6.10/lib/sbcl")
    #A((36) BASE-CHAR . "/Users/gpicchiarelli/.local/bin/sbcl")
    #A((6) BASE-CHAR . "--core")
    #A((58) BASE-CHAR
       . "/Users/gpicchiarelli/.local/sbcl/2.6.10/lib/sbcl/sbcl.core")
    #A((10) BASE-CHAR . "--noinform") #A((13) BASE-CHAR . "--no-userinit")
    #A((12) BASE-CHAR . "--no-sysinit") #A((8) BASE-CHAR . "--script")
    #A((58) BASE-CHAR
       . "spikes/out/metrics-histograms-20261101/verify-product.lisp")
    #A((7) BASE-CHAR . "focused") #A((7) BASE-CHAR . "2610-v2"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "bench-2610" :RECORD-PATH
   #A((32) BASE-CHAR . "processes/bench-2610/report.lisp") :COMMAND
   (#A((12) BASE-CHAR . "/usr/bin/env")
    #A((58) BASE-CHAR
       . "SBCL_HOME=/Users/gpicchiarelli/.local/sbcl/2.6.10/lib/sbcl")
    #A((245) BASE-CHAR
       . "ASDF_OUTPUT_TRANSLATIONS=(:output-translations ((:root :**/ :*.*.*) (\"/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/bench-2610-fasl/\" :**/ :*.*.*)) :ignore-inherited-configuration)")
    #A((36) BASE-CHAR . "/Users/gpicchiarelli/.local/bin/sbcl")
    #A((6) BASE-CHAR . "--core")
    #A((58) BASE-CHAR
       . "/Users/gpicchiarelli/.local/sbcl/2.6.10/lib/sbcl/sbcl.core")
    #A((10) BASE-CHAR . "--noinform") #A((13) BASE-CHAR . "--no-userinit")
    #A((12) BASE-CHAR . "--no-sysinit") #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "tools/metrics-histogram-bench.lisp")
    #A((7) BASE-CHAR . "--bench") #A((12) BASE-CHAR . "--iterations")
    #A((7) BASE-CHAR . "1000000") #A((13) BASE-CHAR . "--repetitions")
    #A((1) BASE-CHAR . "5"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((14) BASE-CHAR . "audit-child-01") :RECORD-PATH
   #A((36) BASE-CHAR . "processes/audit-child-01/report.lisp") :COMMAND
   (#A((40) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/bin/sbcl")
    #A((10) BASE-CHAR . "--noinform") #A((13) BASE-CHAR . "--no-userinit")
    #A((12) BASE-CHAR . "--no-sysinit") #A((8) BASE-CHAR . "--script")
    #A((13) BASE-CHAR . "tools/ci.lisp") #A((9) BASE-CHAR . "self-test")
    #A((5) BASE-CHAR . "--out")
    #A((39) BASE-CHAR . "spikes/out/ci/selftest-1793535541-89784"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "ci-self-test/boundaries.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/ci-self-test/boundaries.lisp")
   :BYTES 976 :SHA256
   "45a300e40479bcaec51cae42c82b55e481861c06880c2d00527c2289c818df23")
  (:PATH "ci-self-test/conditions.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/ci-self-test/conditions.lisp")
   :BYTES 663 :SHA256
   "d209de8e93efe4255f1ae149b8e88eef50a683378263e7953917230221c9235f")
  (:PATH "ci-self-test/data.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/ci-self-test/data.lisp")
   :BYTES 3214 :SHA256
   "1b61eec62d79d44cb0543b91c83c37d8c3ef787f125208c0093df05d63717fb2")
  (:PATH "ci-self-test/measure.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/ci-self-test/measure.lisp")
   :BYTES 2041 :SHA256
   "9da2833aeafef2ba03a78ef72bc7a1976d1fba4fee3ca693aab46a6e144dcb6c")
  (:PATH "ci-self-test/publication.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/ci-self-test/publication.lisp")
   :BYTES 1181 :SHA256
   "eb5ada9bf495a2d0c4f265a3499cd941e55c4ba526c118d9091f345b46fff8fc")
  (:PATH "ci-self-test/report.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/ci-self-test/report.lisp")
   :BYTES 632 :SHA256
   "1ae97ae4103f11530749a8627e2ba2cc908579dc933ba091a1eafd94a48a5125")
  (:PATH "ci-self-test/tests.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/ci-self-test/tests.lisp")
   :BYTES 2464 :SHA256
   "07ad61e8a63c30095036caa5409937953846f61a09902a20def311c0ab969885")
  (:PATH "ci-self-test/workflow.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/ci-self-test/workflow.lisp")
   :BYTES 310 :SHA256
   "f23e28f3852503b75fcedf6218a881660f446a802dbbd7ef3bbc2ca17fe436a7")
  (:PATH "ci-self-test/workflow.lisp.gz" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/ci-self-test/workflow.lisp.gz")
   :BYTES 3383 :SHA256
   "65ef5865e2a8bcb699e2b198c990c96183d7e9da6772156178630f8e76782735")
  (:PATH "collection-manifest.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/archive-manifest.lisp")
   :BYTES 23639 :SHA256
   "db79f993397383cd0546889fe35e5a859e9d2e182ed2217d90eb09d0c9865a42")
  (:PATH "collection-source.lisp" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")
  (:PATH "expected-negative.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/expected-negative.lisp")
   :BYTES 2498 :SHA256
   "c3a21b840d02d4accedf013ec577227c2a1141743ba94dec5d29de1fbf01c899")
  (:PATH "full-tests/tests.events.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/full-tests/tests.events.lisp")
   :BYTES 318 :SHA256
   "0374e03a2368aead4cc289e296c6efc25a9e0df37523c4c32ce0ccb3dbf17a3b")
  (:PATH "full-tests/tests.events.lisp.gz" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/full-tests/tests.events.lisp.gz")
   :BYTES 153028 :SHA256
   "9b3cec705baedacbff635087339b8c997831f6c020901e26e01af95f1982eef6")
  (:PATH "full-tests/tests.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/full-tests/tests.lisp")
   :BYTES 309 :SHA256
   "8bc17d8d21816fba23e5f1c5e785f32187af2606e7df25c6001a73b3e084e051")
  (:PATH "full-tests/tests.lisp.gz" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/full-tests/tests.lisp.gz")
   :BYTES 71207 :SHA256
   "a2032835e68c727f724a551b7fd0b6ad84b32e0c7d02570123bbc0d10b8b25d5")
  (:PATH "method/packet-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/method/packet-support.lisp")
   :BYTES 2296 :SHA256
   "c836d6f7320dcac68829b41d6529c1e8bf12362c099bce147a3a2c1da8fbad4c")
  (:PATH "method/prepare-archive.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/method/prepare-archive.lisp")
   :BYTES 316 :SHA256
   "cea505d9d3cd2eb859912e9d61a39d1a000d7146fca0124bf53eeecf64215fe1")
  (:PATH "method/prepare-archive.lisp.gz" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/method/prepare-archive.lisp.gz")
   :BYTES 2997 :SHA256
   "5feedfac02d16b157f6783210ddffe25920157210382aed9c63500c7c89cf592")
  (:PATH "method/reviews.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/method/reviews.lisp")
   :BYTES 1284 :SHA256
   "bb2c92e56ea701edc57621a384b455f42336dd53c47536b85681dcfe65c2f9b2")
  (:PATH "method/verify-product.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/method/verify-product.lisp")
   :BYTES 2603 :SHA256
   "69fde36d45d10b8118d6ebf19bb91012f79b16efb2daddeeb363d764366cba6f")
  (:PATH "method/write-report.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/method/write-report.lisp")
   :BYTES 313 :SHA256
   "35834682a455f90508e7437165526480d526498bb6cee54fbfaec755444ba052")
  (:PATH "method/write-report.lisp.gz" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/method/write-report.lisp.gz")
   :BYTES 3779 :SHA256
   "af1805e0a410d8154ae44a46ebb3f999adcfb890811806039901fbab6d7ba933")
  (:PATH #A((28) BASE-CHAR . "observations/bench-2610.lisp") :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/observations/bench-2610.lisp")
   :BYTES 312 :SHA256
   "e2c6a19fd890e2526e3ffcb97d7454f930f7219ea6dcaa3463bfaf0f47e97531")
  (:PATH "observations/bench-2610.lisp.gz" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/observations/bench-2610.lisp.gz")
   :BYTES 5495 :SHA256
   "43d79f97bed9b5d44cb851ab606178e0315bd67b0fa8a98283c081dd93b58784")
  (:PATH #A((27) BASE-CHAR . "observations/bench-269.lisp") :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/observations/bench-269.lisp")
   :BYTES 311 :SHA256
   "17d7494d90ef9878510b68625ca8f234c70edc4ddf031a13a796ef898336c708")
  (:PATH "observations/bench-269.lisp.gz" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/observations/bench-269.lisp.gz")
   :BYTES 5293 :SHA256
   "eb1d1a4c13da7d2ec7f733086d530aab79505c654e8acbacac8c1e85c86ac951")
  (:PATH #A((41) BASE-CHAR . "processes/audit-269-v2/conservazione.lisp")
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/audit-269-v2/conservazione.lisp")
   :BYTES 1221 :SHA256
   "94815843695b430f873f3ab5daad700ea174e2513103073777b513b0bac83726")
  (:PATH #A((34) BASE-CHAR . "processes/audit-269-v2/report.lisp") :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/audit-269-v2/report.lisp")
   :BYTES 311 :SHA256
   "2f78a6cc6aa235bc8f07f19f1955a54d2a9640f59ddd6763b17510f0cec0bb81")
  (:PATH "processes/audit-269-v2/report.lisp.gz" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/audit-269-v2/report.lisp.gz")
   :BYTES 123501 :SHA256
   "14dc809a4de3a64283c949233fd97b7e4ade2915fbfe7fcc94767c2f9fad69e4")
  (:PATH #A((43) BASE-CHAR . "processes/audit-child-01/conservazione.lisp")
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/audit-child-01/conservazione.lisp")
   :BYTES 1177 :SHA256
   "162b8d7c57d782f575299c954e70e5306a63509f4cc881b21e22cbc4c2be83ec")
  (:PATH #A((36) BASE-CHAR . "processes/audit-child-01/report.lisp") :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/audit-child-01/report.lisp")
   :BYTES 311 :SHA256
   "9d72059ef66b74d9b0912710896d69b83c38da240d8c279ac0fc64e37105fb88")
  (:PATH "processes/audit-child-01/report.lisp.gz" :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/audit-child-01/report.lisp.gz")
   :BYTES 111887 :SHA256
   "74cee0265445762e633cd4c8e972da6737ce2e13c95f892351bcac5382bdf23a")
  (:PATH #A((39) BASE-CHAR . "processes/bench-2610/conservazione.lisp") :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/bench-2610/conservazione.lisp")
   :BYTES 1217 :SHA256
   "a5b0a2cfddc95ef0e4cfac8b0015143bad70df6540238c5de5cc402b54830d62")
  (:PATH #A((32) BASE-CHAR . "processes/bench-2610/report.lisp") :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/bench-2610/report.lisp")
   :BYTES 311 :SHA256
   "33ab85f5962b1f2a14dd181a67b698be68d709ce6da997730f380a1494eda1ae")
  (:PATH "processes/bench-2610/report.lisp.gz" :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/bench-2610/report.lisp.gz")
   :BYTES 117469 :SHA256
   "e4814f39bc7d7f3071a5e37fe45a8b917e6a98a71c208c5d56938478de727d2c")
  (:PATH #A((38) BASE-CHAR . "processes/bench-269/conservazione.lisp") :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/bench-269/conservazione.lisp")
   :BYTES 1215 :SHA256
   "0ae57b45bc58e1d11472d47c5c488e966423f53f4c158905ddfcc05f8d50d1f3")
  (:PATH #A((31) BASE-CHAR . "processes/bench-269/report.lisp") :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/bench-269/report.lisp")
   :BYTES 311 :SHA256
   "95dc645880316d6ab05d915789299d1aa12b7f420e4f23f3a1864c6449e3d0b4")
  (:PATH "processes/bench-269/report.lisp.gz" :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/bench-269/report.lisp.gz")
   :BYTES 117260 :SHA256
   "f504c57ea415529827d2acb61180ddc308b0138d0a83e82ba86eac141554799a")
  (:PATH #A((47) BASE-CHAR . "processes/bench-negative-269/conservazione.lisp")
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/bench-negative-269/conservazione.lisp")
   :BYTES 1233 :SHA256
   "01743d3c103016f100bfcd6463a634088116b9915329f2984b204c213e317da0")
  (:PATH #A((40) BASE-CHAR . "processes/bench-negative-269/report.lisp")
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/bench-negative-269/report.lisp")
   :BYTES 311 :SHA256
   "b0df0f0bc5cc47af645aaf198c0f75c5688cb05c124418f9616bb28b79987619")
  (:PATH "processes/bench-negative-269/report.lisp.gz" :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/bench-negative-269/report.lisp.gz")
   :BYTES 113124 :SHA256
   "45122c7ccbcedcf98cc094749eb77c492364d21682499b9a00c5cef1ce7c301c")
  (:PATH #A((47) BASE-CHAR . "processes/bench-selftest-269/conservazione.lisp")
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/bench-selftest-269/conservazione.lisp")
   :BYTES 1233 :SHA256
   "6361592afb50a0797ab2505d66ad7720621b0ea51f069da3ea9ed9b00c0f05ef")
  (:PATH #A((40) BASE-CHAR . "processes/bench-selftest-269/report.lisp")
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/bench-selftest-269/report.lisp")
   :BYTES 311 :SHA256
   "fb2823735fa6818e86201b1f9f06ea4c544c2bcc6a4f292bfbe7ea0446302847")
  (:PATH "processes/bench-selftest-269/report.lisp.gz" :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/bench-selftest-269/report.lisp.gz")
   :BYTES 114132 :SHA256
   "87f4a27225157ba42623e8b9568a98afa4c3e8c2d3123e9e8b45cfa50a49feac")
  (:PATH #A((44) BASE-CHAR . "processes/focused-2610-v1/conservazione.lisp")
   :SOURCE
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/focused-2610-v1/conservazione.lisp")
   :BYTES 1227 :SHA256
   "dec0f2408e6c39d02d63dea7012bbe9e001c1251399475268a15fd7bb6c32f8d")
  (:PATH #A((37) BASE-CHAR . "processes/focused-2610-v1/report.lisp") :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/focused-2610-v1/report.lisp")
   :BYTES 311 :SHA256
   "798728c88d566f7cc3be4c883999bce2866df218d82ea60eecc194cd975143e9")
  (:PATH "processes/focused-2610-v1/report.lisp.gz" :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/focused-2610-v1/report.lisp.gz")
   :BYTES 111809 :SHA256
   "40621bb26bd278b25c15b8a1c507a8029ecad8451a22a15cb92145316eba3c98")
  (:PATH #A((44) BASE-CHAR . "processes/focused-2610-v2/conservazione.lisp")
   :SOURCE
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/focused-2610-v2/conservazione.lisp")
   :BYTES 1227 :SHA256
   "43fc5f87f8ff58557dad795231ea927fe898666586a2b916d44c4f47a4c174da")
  (:PATH #A((37) BASE-CHAR . "processes/focused-2610-v2/report.lisp") :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/focused-2610-v2/report.lisp")
   :BYTES 311 :SHA256
   "8da9e67fed1d8f54f88c396a9944f09e91feab473e48f5cba2e9aad118817267")
  (:PATH "processes/focused-2610-v2/report.lisp.gz" :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/focused-2610-v2/report.lisp.gz")
   :BYTES 112382 :SHA256
   "b04d6753a24178b9abcb46eaf1abeb2cc9cbc969f419c04977eae3f855ba21f9")
  (:PATH #A((43) BASE-CHAR . "processes/focused-269-v1/conservazione.lisp")
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/focused-269-v1/conservazione.lisp")
   :BYTES 1225 :SHA256
   "34c2225a57d4303ed219ae6d760c91dc3e0ec2f6d37d77b24e160184d2399053")
  (:PATH #A((36) BASE-CHAR . "processes/focused-269-v1/report.lisp") :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/focused-269-v1/report.lisp")
   :BYTES 311 :SHA256
   "061f68a318809e22336cfe1114a17994c51bc335f1dd072809f159d29e2ab530")
  (:PATH "processes/focused-269-v1/report.lisp.gz" :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/focused-269-v1/report.lisp.gz")
   :BYTES 113776 :SHA256
   "9e90c9be18896a829a6faa934c744319316dca2f5c144a35b78be3f9a77de9bb")
  (:PATH #A((43) BASE-CHAR . "processes/focused-269-v2/conservazione.lisp")
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/focused-269-v2/conservazione.lisp")
   :BYTES 1225 :SHA256
   "c1d470ff0618be9fb4c7508500224f8fbc8b99d5f2df94825a42ea4b6fe698b8")
  (:PATH #A((36) BASE-CHAR . "processes/focused-269-v2/report.lisp") :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/focused-269-v2/report.lisp")
   :BYTES 311 :SHA256
   "4f5e8146abf423827c29c3021f0f035e8eab08c4668624bf501c0f90bb661cbe")
  (:PATH "processes/focused-269-v2/report.lisp.gz" :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/focused-269-v2/report.lisp.gz")
   :BYTES 112341 :SHA256
   "78b65fa5aef5c76dba40ce90dac788b8603d890cb8437c78a7eff36829bfaa9e")
  (:PATH #A((40) BASE-CHAR . "processes/full-269-v2/conservazione.lisp")
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/full-269-v2/conservazione.lisp")
   :BYTES 1219 :SHA256
   "77f5d4c0d91c6f4ca8746d4ab476473896b70836c7d0cf3cd19779553f148668")
  (:PATH #A((33) BASE-CHAR . "processes/full-269-v2/report.lisp") :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/full-269-v2/report.lisp")
   :BYTES 311 :SHA256
   "a1c09368f2b9a5109632e2e19ace2a18e28ab1a2fc890098e1518b6dc24d6ad2")
  (:PATH "processes/full-269-v2/report.lisp.gz" :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/full-269-v2/report.lisp.gz")
   :BYTES 168473 :SHA256
   "13ef0dadc89b1f20b1fe2b9664bd31f62246e663517e6d19a27d8ee9c536cc0b")
  (:PATH #A((43) BASE-CHAR . "processes/history-269-v2/conservazione.lisp")
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/history-269-v2/conservazione.lisp")
   :BYTES 1225 :SHA256
   "57030e7c98ef2c8bb60b8a015fdde941c3773e9fd46d094100650a979d302d9f")
  (:PATH #A((36) BASE-CHAR . "processes/history-269-v2/report.lisp") :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/history-269-v2/report.lisp")
   :BYTES 311 :SHA256
   "50d3c1d84270bac0f62cfa2fb6a6d1d2c5b8a0c64398f4f22c60d4534347fa6b")
  (:PATH "processes/history-269-v2/report.lisp.gz" :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/history-269-v2/report.lisp.gz")
   :BYTES 111972 :SHA256
   "7f752f05847dc31b124ba0535be8e91d3ec835e5ea5a297044817dff5e1abf0b")
  (:PATH #A((45) BASE-CHAR . "processes/trace-generation/conservazione.lisp")
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/trace-generation/conservazione.lisp")
   :BYTES 1229 :SHA256
   "66c6a8654aee8f0613e506ff2cce292b60f50d5a5dc2717ba773672b82f3c821")
  (:PATH #A((38) BASE-CHAR . "processes/trace-generation/report.lisp") :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/trace-generation/report.lisp")
   :BYTES 311 :SHA256
   "ede4c06116dad72c1d62802ba0b41ee24a7447533c1f794eae452d3c3a0de7d0")
  (:PATH "processes/trace-generation/report.lisp.gz" :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/processes/trace-generation/report.lisp.gz")
   :BYTES 111814 :SHA256
   "316886ab11344f8b127f47d16b2352150abe7da5173aa4f8e688e4237cf5fb9f")
  (:PATH "qualification.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/qualification.lisp")
   :BYTES 315 :SHA256
   "32ca24ea7a3da45faa398c772a752b13c6ee688fb23b9c350d2bc041316a0aa8")
  (:PATH "qualification.lisp.gz" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/qualification.lisp.gz")
   :BYTES 2444 :SHA256
   "7c7b6727173ac1a6f859a6b0a35110f874942a76910ea05b364ae94ab72043d0")
  (:PATH "spikes-check/SPK-01.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/spikes-check/SPK-01.lisp")
   :BYTES 308 :SHA256
   "01f4ac2c1f621fd117a911ca7927c00d993e349b7c73bf5aa649d6f6b44e2542")
  (:PATH "spikes-check/SPK-01.lisp.gz" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/spikes-check/SPK-01.lisp.gz")
   :BYTES 2877 :SHA256
   "68d4c6fd07a4293c7eafc3463a571a889ff8da302a7bcaae795ad3971a5384e3")
  (:PATH "spikes-check/SPK-02.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/spikes-check/SPK-02.lisp")
   :BYTES 1607 :SHA256
   "6c0787341ec9853082549fb51034c4cad39d08dcc14a555e6140cca57f4584f4")
  (:PATH "spikes-check/SPK-03.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/spikes-check/SPK-03.lisp")
   :BYTES 3660 :SHA256
   "8a2419075acc8bd506cd4f440ffa2f67b44602e4585773bd9a8798f92ce2a2f7")
  (:PATH "spikes-check/SPK-04.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/spikes-check/SPK-04.lisp")
   :BYTES 307 :SHA256
   "fd5133d140a48df7eba32510506211a30dd1ca4e59436ff621118875a0820f34")
  (:PATH "spikes-check/SPK-04.lisp.gz" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/spikes-check/SPK-04.lisp.gz")
   :BYTES 1611 :SHA256
   "d1063a3fd3dc6853474d1950c2815df30c0058c1a424c3f7a4bb5ab5fd31d65a")
  (:PATH "spikes-check/SPK-05.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/spikes-check/SPK-05.lisp")
   :BYTES 308 :SHA256
   "8eb5a89f34dca9f42f07e7ee1887cf33c56a7aa94846f63477458206c8ffdec5")
  (:PATH "spikes-check/SPK-05.lisp.gz" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/spikes-check/SPK-05.lisp.gz")
   :BYTES 1915 :SHA256
   "a2908a561366736b155dd47815c9b643b6e0044ee6f173d687da8fcc7a6a54e6")
  (:PATH "spikes-check/SPK-06.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/spikes-check/SPK-06.lisp")
   :BYTES 308 :SHA256
   "7a2e1a6e5f882bd4941487a3364dfec4e5ad299569828686f74d9eef1fa65159")
  (:PATH "spikes-check/SPK-06.lisp.gz" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/spikes-check/SPK-06.lisp.gz")
   :BYTES 4159 :SHA256
   "7fbd660d185927ecd1edbc021991cbc07fd2a694721fe686f683d6fc480110ac")
  (:PATH "spikes-check/SPK-07.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/spikes-check/SPK-07.lisp")
   :BYTES 318 :SHA256
   "3178a55faeb3723311397b7f8c2f235a13c7e3ab7db83ac0566d962d3bb7015c")
  (:PATH "spikes-check/SPK-07.lisp.gz" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/spikes-check/SPK-07.lisp.gz")
   :BYTES 411747 :SHA256
   "a72fe4f3383ba9ae951e1218edeb13408f5db98b012a5fe500b867978469c516")
  (:PATH "spikes-check/SPK-08.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/spikes-check/SPK-08.lisp")
   :BYTES 310 :SHA256
   "b0caeed2281fabcd6b87553eabce16ac87d3624291b1606ec5fd36f1270941b4")
  (:PATH "spikes-check/SPK-08.lisp.gz" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/spikes-check/SPK-08.lisp.gz")
   :BYTES 45433 :SHA256
   "fbb411c9ba2c6f75d627d5d10ca63d2cc38115e1bdb07abb2085eb265cf3b500")
  (:PATH "spikes-check/SPK-09.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/spikes-check/SPK-09.lisp")
   :BYTES 2472 :SHA256
   "786d00dd7564d4aa7d52eaaf2fffca8a072ddb1abe466fa77a15fe7e9a3174c1")
  (:PATH "spikes-check/SPK-10.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/spikes-check/SPK-10.lisp")
   :BYTES 308 :SHA256
   "f000560299e2a40789e68effe16317bbf3af3dfd6106403a11535d2bf75558dd")
  (:PATH "spikes-check/SPK-10.lisp.gz" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/spikes-check/SPK-10.lisp.gz")
   :BYTES 4297 :SHA256
   "34593f9bf5cb8f93dc18c3014342029aa7aada55efe356e4db2a2bb6e677d62d")
  (:PATH "spikes-check/SPK-11.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/spikes-check/SPK-11.lisp")
   :BYTES 308 :SHA256
   "57c9fccfc54788029976d39b118f911e4e55186a77e9fa36100c51f71df90591")
  (:PATH "spikes-check/SPK-11.lisp.gz" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/spikes-check/SPK-11.lisp.gz")
   :BYTES 7990 :SHA256
   "d676a1f78e997a198eff5b749e3c67ede278c5a61378492d69cbb5a59922c2e3")
  (:PATH "spikes-check/conservazione.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/spikes-check/conservazione.lisp")
   :BYTES 2341 :SHA256
   "82df910e0880a9d8bda933ad8499a27506713055710327062c27e9ba9f7007fe")
  (:PATH "spikes-check/report.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/spikes-check/report.lisp")
   :BYTES 318 :SHA256
   "697379e2e518a5fe6f4f61c44f787bcb129162aaf1d8dfc9dac2e77ab2abdb08")
  (:PATH "spikes-check/report.lisp.gz" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/observability-histograms/ArcDocDB/spikes/out/metrics-histograms-20261101/packet-stage/spikes-check/report.lisp.gz")
   :BYTES 483655 :SHA256
   "11438503b6fc01c7b2e09af32d852b97ef6ba4b34aade825e8341d3ce7228152"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
