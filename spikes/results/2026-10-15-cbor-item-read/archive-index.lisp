(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL #A((14) BASE-CHAR . "freeze-sources") :RECORD-PATH
   "processes/freeze-sources/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((54) BASE-CHAR
       . "spikes/out/cbor-item-read-20261015/freeze-sources.lisp")))
  (:LABEL #A((30) BASE-CHAR . "initial-build-lint-trace-links") :RECORD-PATH
   "processes/initial-build-lint-trace-links/report.lisp" :STATUS :OK
   :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "make") #A((5) BASE-CHAR . "build")
    #A((4) BASE-CHAR . "lint") #A((5) BASE-CHAR . "trace")
    #A((5) BASE-CHAR . "links")))
  (:LABEL #A((15) BASE-CHAR . "bench-self-test") :RECORD-PATH
   "processes/bench-self-test/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((53) BASE-CHAR
       . "spikes/out/cbor-item-read-20261015/drivers/bench.lisp")
    #A((11) BASE-CHAR . "--self-test")))
  (:LABEL #A((15) BASE-CHAR . "audit-self-test") :RECORD-PATH
   "processes/audit-self-test/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((53) BASE-CHAR
       . "spikes/out/cbor-item-read-20261015/drivers/audit.lisp")
    #A((11) BASE-CHAR . "--self-test")))
  (:LABEL #A((18) BASE-CHAR . "mutation-self-test") :RECORD-PATH
   "processes/mutation-self-test/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((56) BASE-CHAR
       . "spikes/out/cbor-item-read-20261015/drivers/mutation.lisp")
    #A((11) BASE-CHAR . "--self-test")))
  (:LABEL #A((18) BASE-CHAR . "coverage-self-test") :RECORD-PATH
   "processes/coverage-self-test/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((11) BASE-CHAR . "--self-test")
    #A((54) BASE-CHAR
       . "spikes/out/cbor-item-read-20261015/coverage-self-test/")))
  (:LABEL #A((20) BASE-CHAR . "collection-self-test") :RECORD-PATH
   "processes/collection-self-test/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((58) BASE-CHAR
       . "spikes/out/cbor-item-read-20261015/collection/collect.lisp")
    #A((11) BASE-CHAR . "--self-test")
    #A((56) BASE-CHAR
       . "spikes/out/cbor-item-read-20261015/collection/self-test/")))
  (:LABEL #A((5) BASE-CHAR . "bench") :RECORD-PATH
   "processes/bench/report.lisp" :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY
   :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((53) BASE-CHAR
       . "spikes/out/cbor-item-read-20261015/drivers/bench.lisp")
    #A((7) BASE-CHAR . "--bench")))
  (:LABEL #A((16) BASE-CHAR . "bench-data-audit") :RECORD-PATH
   "processes/bench-data-audit/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((53) BASE-CHAR
       . "spikes/out/cbor-item-read-20261015/drivers/audit.lisp")
    #A((7) BASE-CHAR . "--bench")
    #A((112) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001074008-command-2418-0/report.lisp")
    #A((40) BASE-CHAR . "b9099dc8a8c96281063811e686deb4dcb2b1d39b")))
  (:LABEL #A((13) BASE-CHAR . "coverage-item") :RECORD-PATH
   "processes/coverage-item/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((8) BASE-CHAR . "--report")
    #A((44) BASE-CHAR . "spikes/out/cbor-item-read-20261015/coverage/")
    #A((14) BASE-CHAR . "cbor-item-read")))
  (:LABEL #A((16) BASE-CHAR . "integrated-check") :RECORD-PATH
   "processes/integrated-check/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "make") #A((10) BASE-CHAR . "check-core")))
  (:LABEL #A((17) BASE-CHAR . "mutation-campaign") :RECORD-PATH
   "processes/mutation-campaign/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((56) BASE-CHAR
       . "spikes/out/cbor-item-read-20261015/drivers/mutation.lisp")
    #A((5) BASE-CHAR . "--run")
    #A((45) BASE-CHAR . "spikes/out/cbor-item-read-20261015/mutations/")))
  (:LABEL #A((20) BASE-CHAR . "coverage-compression") :RECORD-PATH
   "processes/coverage-compression/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((27) BASE-CHAR . "tools/compact-evidence.lisp")
    #A((6) BASE-CHAR . "--root")
    #A((44) BASE-CHAR . "spikes/out/cbor-item-read-20261015/coverage/")
    #A((6) BASE-CHAR . "--jobs") #A((1) BASE-CHAR . "4")))
  (:LABEL #A((40) BASE-CHAR . "final-integration-build-lint-trace-links")
   :RECORD-PATH
   "processes/final-integration-build-lint-trace-links/report.lisp" :STATUS :OK
   :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "make") #A((5) BASE-CHAR . "build")
    #A((4) BASE-CHAR . "lint") #A((5) BASE-CHAR . "trace")
    #A((5) BASE-CHAR . "links")))
  (:LABEL #A((20) BASE-CHAR . "manifest-preparation") :RECORD-PATH
   "processes/manifest-preparation/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((66) BASE-CHAR
       . "spikes/out/cbor-item-read-20261015/collection/prepare-archive.lisp")
    #A((20) BASE-CHAR . "--integration-report")
    #A((113) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001074655-command-41141-0/report.lisp")))
  (:LABEL #A((17) BASE-CHAR . "archive-preflight") :RECORD-PATH
   "processes/archive-preflight/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((68) BASE-CHAR
       . "spikes/out/cbor-item-read-20261015/collection/preflight-archive.lisp")
    #A((10) BASE-CHAR . "--manifest")
    #A((59) BASE-CHAR
       . "spikes/out/cbor-item-read-20261015/collection/manifest.lisp")
    #A((13) BASE-CHAR . "--destination")
    #A((41) BASE-CHAR . "spikes/results/2026-10-15-cbor-item-read/")
    #A((8) BASE-CHAR . "--report")
    #A((60) BASE-CHAR
       . "spikes/out/cbor-item-read-20261015/collection/preflight.lisp")))
  (:LABEL #A((19) BASE-CHAR . "parallel-collection") :RECORD-PATH
   "processes/parallel-collection/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((58) BASE-CHAR
       . "spikes/out/cbor-item-read-20261015/collection/collect.lisp")
    #A((9) BASE-CHAR . "--collect")
    #A((59) BASE-CHAR
       . "spikes/out/cbor-item-read-20261015/collection/manifest.lisp")
    #A((41) BASE-CHAR . "spikes/results/2026-10-15-cbor-item-read/")
    #A((6) BASE-CHAR . "--jobs") #A((1) BASE-CHAR . "4")))
  (:LABEL #A((23) BASE-CHAR . "collection-data-reading") :RECORD-PATH
   "processes/collection-data-reading/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((66) BASE-CHAR
       . "spikes/out/cbor-item-read-20261015/collection/read-collection.lisp")
    #A((156) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/collection-observation-4001075012-68366-0.lisp")
    #A((145) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/closed-check-4001075074-68366-0.log")))
  (:LABEL #A((29) BASE-CHAR . "preserve-collection-originals") :RECORD-PATH
   "processes/preserve-collection-originals/report.lisp" :STATUS :OK :EXIT-CODE
   0 :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((69) BASE-CHAR
       . "spikes/out/cbor-item-read-20261015/collection/preserve-originals.lisp")
    #A((156) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/collection-observation-4001075012-68366-0.lisp")
    #A((145) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/closed-check-4001075074-68366-0.log")
    #A((113) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001075135-command-73103-0/report.lisp"))))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/manifest.lisp")
   :BYTES 76910 :SHA256
   "90e0cf845cb33fc0d67b1d573e620e6e6e4cca9510029003950af465eb7f5934")
  (:PATH "collection-source.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/collect.lisp")
   :BYTES 22602 :SHA256
   "cc472d49432b8c4b8edf2d8a5441312246a4fc05ed37128be951f2316b2e87de")
  (:PATH "processes/audit-self-test/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073958-command-98503-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "cd8fa84490106dcb7ad0c61f561334861a64fe379d60ce0a734cda39438b3153")
  (:PATH "processes/audit-self-test/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073958-command-98503-0/report.lisp")
   :BYTES 198582 :SHA256
   "56cdbd8abd419980df20de8a79fa107af691d244f79db2c74a58ff3bb253b80a")
  (:PATH "processes/bench-data-audit/conservazione.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001074123-command-8636-0/conservazione.lisp")
   :BYTES 1150 :SHA256
   "02011d795651e10141fd869765428e4aee8b37f77c4b7cf34e9df398de05ed30")
  (:PATH "processes/bench-data-audit/report.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001074123-command-8636-0/report.lisp")
   :BYTES 195079 :SHA256
   "c5a14ee6974ca54db3c2c2f0f04bdb5d7a6bf1ff138e82f09ffbd4d53152555e")
  (:PATH "processes/bench-self-test/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073958-command-98504-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "67a4f5fe720dca5f986b3360c45cfef0a02a11616c4244208d1ad87b360504cb")
  (:PATH "processes/bench-self-test/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073958-command-98504-0/report.lisp")
   :BYTES 244149 :SHA256
   "c991e393e3d6eb08b69967180a02ff27a8aee85a6fd2905ad4ec4b354922c370")
  (:PATH "processes/bench/conservazione.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001074008-command-2418-0/conservazione.lisp")
   :BYTES 1150 :SHA256
   "21c684eefc38ad526a88e4e2f1eb39bc8b506d76a377e67511eca5ddfedfec3b")
  (:PATH "processes/bench/report.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001074008-command-2418-0/report.lisp")
   :BYTES 254464 :SHA256
   "6f6e5658f9d29568dc59cb407bcbb4b4711f3d48e7f74127df29d7c26c9a8655")
  (:PATH "processes/collection-self-test/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073781-command-87262-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "8afa13d4428de7ccfd2eb0c5b3d2edb9cbdbcaa03a0f5c61ca4ca5ad1448f5fd")
  (:PATH "processes/collection-self-test/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073781-command-87262-0/report.lisp")
   :BYTES 194063 :SHA256
   "68afa4552456a08e955d5b524e126e7072763d4002c1f25066df0c9953e6e3ed")
  (:PATH "processes/coverage-compression/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001074359-command-20179-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "386b410c18fbb3ac26afabd53ae2b7a85746f06790b3e226ac6534ea40eff626")
  (:PATH "processes/coverage-compression/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001074359-command-20179-0/report.lisp")
   :BYTES 194338 :SHA256
   "40aa37b5cef87d19f479f6cbeac44880deb4d6f87b62271285f8988cdad5cab1")
  (:PATH "processes/coverage-item/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073826-command-89361-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "ae3f8e4ec83ca01ac9e24ba4d6ef7495f78bb4cd87f9396d7a7c63aa3ea8b3d4")
  (:PATH "processes/coverage-item/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073826-command-89361-0/report.lisp")
   :BYTES 195526 :SHA256
   "be48146d9a85f1dd5397ea885d09d6d6437bdbe6c63ae5e13e67497986ef17b5")
  (:PATH "processes/coverage-self-test/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073779-command-87188-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "a7b26dc4cbfcf75bf21982635192b2ffe5a9e58ec6cc594fb2c9e3d9e7317912")
  (:PATH "processes/coverage-self-test/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073779-command-87188-0/report.lisp")
   :BYTES 193273 :SHA256
   "a05394e70ab4e9c034143f37d61087a57d3a98f3de5c8139cc90a62c68d58fc5")
  (:PATH
   "processes/final-integration-build-lint-trace-links/conservazione.lisp"
   :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001074655-command-41141-0/conservazione.lisp")
   :BYTES 1735 :SHA256
   "667d6ff440705e0a653c087dba1119c9ac45b10f3939814e301b8c191ab725e9")
  (:PATH "processes/final-integration-build-lint-trace-links/report.lisp"
   :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001074655-command-41141-0/report.lisp")
   :BYTES 317 :SHA256
   "7000e90b7c93b1e52210c2725165db6b7120aaf619a0384ff3459c2581655ed9")
  (:PATH "processes/final-integration-build-lint-trace-links/report.lisp.gz"
   :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001074655-command-41141-0/report.lisp.gz")
   :BYTES 165882 :SHA256
   "03aacff383b7dc9cb7693e0a4ea492cd3ce0589c1788c77ab5fcf4b9c82280d0")
  (:PATH "processes/freeze-sources/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073636-command-77979-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "49098b4bd1ca60c3e6952e89f9b0e45db69d4fbd0d6c34250265fe41fe609ca6")
  (:PATH "processes/freeze-sources/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073636-command-77979-0/report.lisp")
   :BYTES 193182 :SHA256
   "7dc04afd7674fb2c99865ca5f610e1540c9eae4c7ebcb4d7652b498dca774bf6")
  (:PATH "processes/initial-build-lint-trace-links/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073649-command-78906-0/conservazione.lisp")
   :BYTES 1734 :SHA256
   "f1905efad8c1db5e3d6179c5eff38c0367982ff8a5fdea8de4ea2da59d637dc3")
  (:PATH "processes/initial-build-lint-trace-links/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073649-command-78906-0/report.lisp")
   :BYTES 317 :SHA256
   "5604e6cccdd35a310dfc7fd653811d96f04e1d4aa518bed609599d5d431cbb09")
  (:PATH "processes/initial-build-lint-trace-links/report.lisp.gz" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073649-command-78906-0/report.lisp.gz")
   :BYTES 165331 :SHA256
   "cbd77d16f56a4c9903ea2c62e1bab8cbbbf30b967744eb439af618d48519e3b1")
  (:PATH "processes/integrated-check/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073778-command-87117-0/conservazione.lisp")
   :BYTES 1735 :SHA256
   "3487535cf5b1c2bb76eb8dd5c59a71a5cf6a59d5968e986ad88237a50e6fd060")
  (:PATH "processes/integrated-check/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073778-command-87117-0/report.lisp")
   :BYTES 317 :SHA256
   "0db4abd2b76657a06d7c843f38c17465741459d4132b0afd98dd93545012b0ec")
  (:PATH "processes/integrated-check/report.lisp.gz" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073778-command-87117-0/report.lisp.gz")
   :BYTES 172081 :SHA256
   "82cda615ef92ad8a1cc5bd1b71d68184fa6ace31572f64dcacb0f248b972dc75")
  (:PATH "processes/mutation-campaign/conservazione.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001074008-command-2420-0/conservazione.lisp")
   :BYTES 1150 :SHA256
   "af28f1bf14f85d5c20d04ea8c5f6a2325b35d43426447ff94d4d1c4e151ec551")
  (:PATH "processes/mutation-campaign/report.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001074008-command-2420-0/report.lisp")
   :BYTES 293428 :SHA256
   "ad8adf0007bdbb67a251fc867871b9b1d28fe698fc40a7325ca2fe0b719f1320")
  (:PATH "processes/mutation-self-test/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073958-command-98508-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "467f76e98dc508312613dfc3064da738edf8101700a9bf247af752a9a9b6264a")
  (:PATH "processes/mutation-self-test/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073958-command-98508-0/report.lisp")
   :BYTES 290614 :SHA256
   "ae994132addc56ff666210df74b0c5742769b6b1c954f90da2695bd5bf262bcb")
  (:PATH "raw/collection-self-test/corrupt/collection-manifest.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/corrupt/collection-manifest.lisp")
   :BYTES 436 :SHA256
   "8382994a63ebb3d497af5622ccfe49f6ef43e610e10dd55d43909d0d8ec42f2a")
  (:PATH "raw/collection-self-test/corrupt/collection-source.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/corrupt/collection-source.lisp")
   :BYTES 22602 :SHA256
   "cc472d49432b8c4b8edf2d8a5441312246a4fc05ed37128be951f2316b2e87de")
  (:PATH "raw/collection-self-test/corrupt/processes/synthetic/report.lisp"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/corrupt/processes/synthetic/report.lisp")
   :BYTES 148 :SHA256
   "4648873d1757e47c894b7359c1685f67877133ee4baed81040b49a32b3e9062e")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file00.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/corrupt/raw/fixtures/file00.bin")
   :BYTES 17 :SHA256
   "af9dcf71a8f0e01f903c5df9e037e42e480485ad980847955bacf94985fb097a")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file01.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/corrupt/raw/fixtures/file01.bin")
   :BYTES 18 :SHA256
   "7e3725e6ac0c5befbcf909a35cf04b9842d818bb6585eeb92cf5282ebc359d1d")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file02.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/corrupt/raw/fixtures/file02.bin")
   :BYTES 19 :SHA256
   "f20dc8c1dad8dad8bc9b3e3b69fe7ebe75000c167cc6fab7697cfcfbe6be765b")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file03.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/corrupt/raw/fixtures/file03.bin")
   :BYTES 20 :SHA256
   "cdc69a0a06256e7d701b8df1035c2e162be5d6ececf2e22e69f47c4c2d4a557a")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file04.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/corrupt/raw/fixtures/file04.bin")
   :BYTES 21 :SHA256
   "4e4374a1b949247860d25de51816f9de8e65a1e0f401c6f1bd11cb2e22a187d9")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file05.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/corrupt/raw/fixtures/file05.bin")
   :BYTES 22 :SHA256
   "fa84bfdfc8b282c2a2094ebd77dd6f7d9448759760d5bb4c6bb8f0540c25e8a6")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file06.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/corrupt/raw/fixtures/file06.bin")
   :BYTES 23 :SHA256
   "c75bbdfbbfd3ec4436b2111bf5804164f661e8a7de450c3eddfb4bd41eb57ed5")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file07.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/corrupt/raw/fixtures/file07.bin")
   :BYTES 24 :SHA256
   "4704d589eae4a4a58531348f8975ad5c91d5cba375e2172a9aa0719127384651")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file08.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/corrupt/raw/fixtures/file08.bin")
   :BYTES 25 :SHA256
   "a7c3b7fa76f97f7ef9256d6576d42efda29ee5907b343114523ecffea422c5b9")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file09.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/corrupt/raw/fixtures/file09.bin")
   :BYTES 26 :SHA256
   "8c55d8e773dd6335df16763191992bcbc0c8c3f16184c5c346c4510eb91e9f75")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file10.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/corrupt/raw/fixtures/file10.bin")
   :BYTES 27 :SHA256
   "2c1f162efb9cd54db9fed48ae2d40b28d6ef24151c44951c2fd65acb4751d885")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file11.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/corrupt/raw/fixtures/file11.bin")
   :BYTES 28 :SHA256
   "9c143090c94cb1c197cb2fd19c520bcd08749d20985341d5fadd7a16246bddc6")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file12.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/corrupt/raw/fixtures/file12.bin")
   :BYTES 29 :SHA256
   "48f5e8a8415a7ae651f839f98e72b2e707ee8e879fc56f113a42c34ee8b44a55")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file13.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/corrupt/raw/fixtures/file13.bin")
   :BYTES 30 :SHA256
   "903b714efab5295fbc60b89d71af1f1cb2f37326e678dd02049544a6eea85219")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file14.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/corrupt/raw/fixtures/file14.bin")
   :BYTES 31 :SHA256
   "751505faba46064d2f78f7c2de89a58296f179dfa2cb29e50dea62a17ead0c56")
  (:PATH "raw/collection-self-test/input/duplicate.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/input/duplicate.lisp")
   :BYTES 635 :SHA256
   "023443a2e84298374b5813ad7e21eef381613eebb2df98c38dd57c8f148491eb")
  (:PATH "raw/collection-self-test/input/manifest.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/input/manifest.lisp")
   :BYTES 436 :SHA256
   "8382994a63ebb3d497af5622ccfe49f6ef43e610e10dd55d43909d0d8ec42f2a")
  (:PATH "raw/collection-self-test/input/process/report.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/input/process/report.lisp")
   :BYTES 148 :SHA256
   "71c873322e15691eb8d3f45e9d770ed27f270f7a09131b2a464c9b81344c6b59")
  (:PATH "raw/collection-self-test/input/tree/file00.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/input/tree/file00.bin")
   :BYTES 17 :SHA256
   "af9dcf71a8f0e01f903c5df9e037e42e480485ad980847955bacf94985fb097a")
  (:PATH "raw/collection-self-test/input/tree/file01.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/input/tree/file01.bin")
   :BYTES 18 :SHA256
   "7e3725e6ac0c5befbcf909a35cf04b9842d818bb6585eeb92cf5282ebc359d1d")
  (:PATH "raw/collection-self-test/input/tree/file02.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/input/tree/file02.bin")
   :BYTES 19 :SHA256
   "f20dc8c1dad8dad8bc9b3e3b69fe7ebe75000c167cc6fab7697cfcfbe6be765b")
  (:PATH "raw/collection-self-test/input/tree/file03.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/input/tree/file03.bin")
   :BYTES 20 :SHA256
   "cdc69a0a06256e7d701b8df1035c2e162be5d6ececf2e22e69f47c4c2d4a557a")
  (:PATH "raw/collection-self-test/input/tree/file04.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/input/tree/file04.bin")
   :BYTES 21 :SHA256
   "4e4374a1b949247860d25de51816f9de8e65a1e0f401c6f1bd11cb2e22a187d9")
  (:PATH "raw/collection-self-test/input/tree/file05.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/input/tree/file05.bin")
   :BYTES 22 :SHA256
   "fa84bfdfc8b282c2a2094ebd77dd6f7d9448759760d5bb4c6bb8f0540c25e8a6")
  (:PATH "raw/collection-self-test/input/tree/file06.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/input/tree/file06.bin")
   :BYTES 23 :SHA256
   "c75bbdfbbfd3ec4436b2111bf5804164f661e8a7de450c3eddfb4bd41eb57ed5")
  (:PATH "raw/collection-self-test/input/tree/file07.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/input/tree/file07.bin")
   :BYTES 24 :SHA256
   "4704d589eae4a4a58531348f8975ad5c91d5cba375e2172a9aa0719127384651")
  (:PATH "raw/collection-self-test/input/tree/file08.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/input/tree/file08.bin")
   :BYTES 25 :SHA256
   "a7c3b7fa76f97f7ef9256d6576d42efda29ee5907b343114523ecffea422c5b9")
  (:PATH "raw/collection-self-test/input/tree/file09.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/input/tree/file09.bin")
   :BYTES 26 :SHA256
   "8c55d8e773dd6335df16763191992bcbc0c8c3f16184c5c346c4510eb91e9f75")
  (:PATH "raw/collection-self-test/input/tree/file10.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/input/tree/file10.bin")
   :BYTES 27 :SHA256
   "2c1f162efb9cd54db9fed48ae2d40b28d6ef24151c44951c2fd65acb4751d885")
  (:PATH "raw/collection-self-test/input/tree/file11.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/input/tree/file11.bin")
   :BYTES 28 :SHA256
   "9c143090c94cb1c197cb2fd19c520bcd08749d20985341d5fadd7a16246bddc6")
  (:PATH "raw/collection-self-test/input/tree/file12.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/input/tree/file12.bin")
   :BYTES 29 :SHA256
   "48f5e8a8415a7ae651f839f98e72b2e707ee8e879fc56f113a42c34ee8b44a55")
  (:PATH "raw/collection-self-test/input/tree/file13.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/input/tree/file13.bin")
   :BYTES 30 :SHA256
   "903b714efab5295fbc60b89d71af1f1cb2f37326e678dd02049544a6eea85219")
  (:PATH "raw/collection-self-test/input/tree/file14.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/input/tree/file14.bin")
   :BYTES 31 :SHA256
   "751505faba46064d2f78f7c2de89a58296f179dfa2cb29e50dea62a17ead0c56")
  (:PATH "raw/collection-self-test/report.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/report.lisp")
   :BYTES 798 :SHA256
   "7b5540aeb013a36004b6730640b2c7b163db9f98d19900209ffaf115b9b20f08")
  (:PATH "raw/collection-self-test/valid/archive-index.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/valid/archive-index.lisp")
   :BYTES 6020 :SHA256
   "c3710bdc30be9c08d483050d71b8312b1ace4c26eaa698cd6ad280a125fa5461")
  (:PATH "raw/collection-self-test/valid/catalogo.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/valid/catalogo.lisp")
   :BYTES 406 :SHA256
   "fcf97730ca82ff65317fb7084168ea1cfa1648e101977c4d04d2addee51663bf")
  (:PATH "raw/collection-self-test/valid/collection-manifest.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/valid/collection-manifest.lisp")
   :BYTES 436 :SHA256
   "8382994a63ebb3d497af5622ccfe49f6ef43e610e10dd55d43909d0d8ec42f2a")
  (:PATH "raw/collection-self-test/valid/collection-source.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/valid/collection-source.lisp")
   :BYTES 22602 :SHA256
   "cc472d49432b8c4b8edf2d8a5441312246a4fc05ed37128be951f2316b2e87de")
  (:PATH "raw/collection-self-test/valid/processes/synthetic/report.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/valid/processes/synthetic/report.lisp")
   :BYTES 148 :SHA256
   "71c873322e15691eb8d3f45e9d770ed27f270f7a09131b2a464c9b81344c6b59")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file00.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/valid/raw/fixtures/file00.bin")
   :BYTES 17 :SHA256
   "af9dcf71a8f0e01f903c5df9e037e42e480485ad980847955bacf94985fb097a")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file01.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/valid/raw/fixtures/file01.bin")
   :BYTES 18 :SHA256
   "7e3725e6ac0c5befbcf909a35cf04b9842d818bb6585eeb92cf5282ebc359d1d")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file02.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/valid/raw/fixtures/file02.bin")
   :BYTES 19 :SHA256
   "f20dc8c1dad8dad8bc9b3e3b69fe7ebe75000c167cc6fab7697cfcfbe6be765b")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file03.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/valid/raw/fixtures/file03.bin")
   :BYTES 20 :SHA256
   "cdc69a0a06256e7d701b8df1035c2e162be5d6ececf2e22e69f47c4c2d4a557a")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file04.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/valid/raw/fixtures/file04.bin")
   :BYTES 21 :SHA256
   "4e4374a1b949247860d25de51816f9de8e65a1e0f401c6f1bd11cb2e22a187d9")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file05.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/valid/raw/fixtures/file05.bin")
   :BYTES 22 :SHA256
   "fa84bfdfc8b282c2a2094ebd77dd6f7d9448759760d5bb4c6bb8f0540c25e8a6")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file06.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/valid/raw/fixtures/file06.bin")
   :BYTES 23 :SHA256
   "c75bbdfbbfd3ec4436b2111bf5804164f661e8a7de450c3eddfb4bd41eb57ed5")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file07.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/valid/raw/fixtures/file07.bin")
   :BYTES 24 :SHA256
   "4704d589eae4a4a58531348f8975ad5c91d5cba375e2172a9aa0719127384651")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file08.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/valid/raw/fixtures/file08.bin")
   :BYTES 25 :SHA256
   "a7c3b7fa76f97f7ef9256d6576d42efda29ee5907b343114523ecffea422c5b9")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file09.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/valid/raw/fixtures/file09.bin")
   :BYTES 26 :SHA256
   "8c55d8e773dd6335df16763191992bcbc0c8c3f16184c5c346c4510eb91e9f75")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file10.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/valid/raw/fixtures/file10.bin")
   :BYTES 27 :SHA256
   "2c1f162efb9cd54db9fed48ae2d40b28d6ef24151c44951c2fd65acb4751d885")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file11.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/valid/raw/fixtures/file11.bin")
   :BYTES 28 :SHA256
   "9c143090c94cb1c197cb2fd19c520bcd08749d20985341d5fadd7a16246bddc6")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file12.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/valid/raw/fixtures/file12.bin")
   :BYTES 29 :SHA256
   "48f5e8a8415a7ae651f839f98e72b2e707ee8e879fc56f113a42c34ee8b44a55")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file13.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/valid/raw/fixtures/file13.bin")
   :BYTES 30 :SHA256
   "903b714efab5295fbc60b89d71af1f1cb2f37326e678dd02049544a6eea85219")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file14.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/self-test/valid/raw/fixtures/file14.bin")
   :BYTES 31 :SHA256
   "751505faba46064d2f78f7c2de89a58296f179dfa2cb29e50dea62a17ead0c56")
  (:PATH "raw/collection/append.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/append.lisp")
   :BYTES 9677 :SHA256
   "f59f7a52934c7fe6103b5047aade87214f17494e857fe35c568968c681790d81")
  (:PATH "raw/collection/build-manifest.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/build-manifest.lisp")
   :BYTES 12551 :SHA256
   "a6ce0030a4b9c12d0d38abdc179df32c3f9a427ccb617d4c8eb9ffe30e57a09d")
  (:PATH "raw/collection/closed-check-4001073788-87417-0.log" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/closed-check-4001073788-87417-0.log")
   :BYTES 958 :SHA256
   "a6f0b734e57188ecbec86750371277b745d951065d3a00974861496eb3163201")
  (:PATH "raw/collection/collect-before-date-fix.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/collect-before-date-fix.lisp")
   :BYTES 22602 :SHA256
   "ed4cadf6816c0b192d55165da0cd032db242af74173f4769a68d656050305fe5")
  (:PATH "raw/collection/collect.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/collect.lisp")
   :BYTES 22602 :SHA256
   "cc472d49432b8c4b8edf2d8a5441312246a4fc05ed37128be951f2316b2e87de")
  (:PATH "raw/collection/collection-observation-4001073784-87417-0.lisp"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/collection-observation-4001073784-87417-0.lisp")
   :BYTES 6698 :SHA256
   "40a2a7b2553211520698c802884c7cf367852ebe1d1fdce5e1b2f440c758d43a")
  (:PATH "raw/collection/collection-observation-4001073794-87417-0.lisp"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/collection-observation-4001073794-87417-0.lisp")
   :BYTES 6621 :SHA256
   "f82ca68c6a8c169196afdecd88f2dbddfe110769ccd522793d5a3306dc041d9c")
  (:PATH "raw/collection/collection-observation-4001073799-87417-0.lisp"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/collection-observation-4001073799-87417-0.lisp")
   :BYTES 560 :SHA256
   "12977de88a8b12e03616ec41cf2cc15d14d1a580f3a4c36dc896f745c9f3aadf")
  (:PATH "raw/collection/collection-observation-4001073799-87417-1.lisp"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/collection-observation-4001073799-87417-1.lisp")
   :BYTES 409 :SHA256
   "03c686ad2c2f038175070a86911eaa0c9f453b02865472cea68e07ca635cdc79")
  (:PATH "raw/collection/preflight-archive.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/preflight-archive.lisp")
   :BYTES 16434 :SHA256
   "15fd77c922172439703864389910768dd18cef0e376895c2c4db300ed9238b4f")
  (:PATH "raw/collection/preflight-before-date-fix.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/preflight-before-date-fix.lisp")
   :BYTES 16434 :SHA256
   "df37bf1e745a152d50cdbfdafefc9c4ae524bccfe1d853fd414738c3294d217a")
  (:PATH "raw/collection/prepare-archive.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/prepare-archive.lisp")
   :BYTES 5529 :SHA256
   "f8d7b8fdd7b2da39187a8318a38206419225f02265334ad4a38487a5778ea65a")
  (:PATH "raw/collection/preserve-originals.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/preserve-originals.lisp")
   :BYTES 2120 :SHA256
   "a63aae561ead1cf2dd23570050176b156976f5e9b03812fab82d5509aacabc3b")
  (:PATH "raw/collection/read-collection.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/read-collection.lisp")
   :BYTES 1824 :SHA256
   "7739a12c824027a86bb47e135fbe2c4b17278068c83d517e4e2cc75abb342083")
  (:PATH "raw/collection/record-audit-self.txt" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/record-audit-self.txt")
   :BYTES 114 :SHA256
   "457f21f4f5607bc2c8f80e2a51eabbed03f4b8c1fd2ea8aa7425befb42cc806f")
  (:PATH "raw/collection/record-bench-audit.txt" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/record-bench-audit.txt")
   :BYTES 113 :SHA256
   "b29673b18f32d5ad7c98e09d0c6f8cb482df4f3763458caa3b7efe7bccde5f05")
  (:PATH "raw/collection/record-bench-self.txt" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/record-bench-self.txt")
   :BYTES 114 :SHA256
   "0d9aaa29915041ab85549f2551e08af16c5afc8b1357ae5560fd51232eb44b19")
  (:PATH "raw/collection/record-bench.txt" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/record-bench.txt")
   :BYTES 113 :SHA256
   "cffe72902469a76ff9d3fbda61d1ececd887a08a6a2a4fcb7030d9d7a1922b3d")
  (:PATH "raw/collection/record-collector-self.txt" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/record-collector-self.txt")
   :BYTES 114 :SHA256
   "94989c18141fcacc6eb592c94eb674dd25286c2ba3b4862b1bbbc9f4b3d47908")
  (:PATH "raw/collection/record-coverage-compression.txt" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/record-coverage-compression.txt")
   :BYTES 114 :SHA256
   "f1231d6b5dd5775ab32e6748e0f5be0cbd9c1b8336f00c728d0968ea51d9df0a")
  (:PATH "raw/collection/record-coverage-self.txt" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/record-coverage-self.txt")
   :BYTES 114 :SHA256
   "3768c1608ff4403571a1fbc6854cdb2c1572c7d6aa1631da698e3b7d5d2238c9")
  (:PATH "raw/collection/record-coverage.txt" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/record-coverage.txt")
   :BYTES 114 :SHA256
   "7ae8a4ce516edc4e44f7f925bbef573fcb1134d4d99418cbdffad36b0750aa33")
  (:PATH "raw/collection/record-freeze.txt" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/record-freeze.txt")
   :BYTES 114 :SHA256
   "47f8c4f4877dacc9bdf543be1fb852be47a493cf5adda7ea03c82b1f28ddc37f")
  (:PATH "raw/collection/record-full-check.txt" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/record-full-check.txt")
   :BYTES 114 :SHA256
   "2bb802ac41ff997158e54cd669fea17d94ac408f27a9c0f01ac7a4929b3aeabb")
  (:PATH "raw/collection/record-initial-build.txt" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/record-initial-build.txt")
   :BYTES 114 :SHA256
   "feb455a9079eb5b5043784ca963fc5f7177ebc6b407df1d5805b550f2c09db94")
  (:PATH "raw/collection/record-mutation-self.txt" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/record-mutation-self.txt")
   :BYTES 114 :SHA256
   "3e9cccfaaa87a74acdf7693ce5655107c693c4775ebbed2db858c16f2947516d")
  (:PATH "raw/collection/record-mutation.txt" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/collection/record-mutation.txt")
   :BYTES 113 :SHA256
   "ed2a57bad585bf56f5235e0858ce79ae7f9d201b555834131f1a5d07ee8de3d8")
  (:PATH "raw/coverage-self-test/a3814248cd985e57c3bb71a49901ae33.html" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/coverage-self-test/a3814248cd985e57c3bb71a49901ae33.html")
   :BYTES 2837 :SHA256
   "90409bb13228d9e04fcdec9d931ea74047e79af1f1d2250dee512d4670956bae")
  (:PATH "raw/coverage-self-test/cover-index.html" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/coverage-self-test/cover-index.html")
   :BYTES 1797 :SHA256
   "67c9e0c793a262357285ea61d72322f410bea0c1c6498e1a98e2ef95c68652c8")
  (:PATH "raw/coverage-self-test/coverage-fixture.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/coverage-self-test/coverage-fixture.lisp")
   :BYTES 147 :SHA256
   "3767518fde8bde1e1286dbf663e97eac01f02e038d7f3161df436d9fd3e92559")
  (:PATH "raw/coverage/949a9f275fe32f5a5a3b7d1c0873388a.html" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/coverage/949a9f275fe32f5a5a3b7d1c0873388a.html")
   :BYTES 16786 :SHA256
   "fa4d79d83f9238d128194443b228b1fc776e97efca20e0f381786df390a5b860")
  (:PATH "raw/coverage/cover-index.html" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/coverage/cover-index.html")
   :BYTES 1754 :SHA256
   "9f8991791441f9a1df15813f0700845722538113c4305849d7514264173050db")
  (:PATH "raw/coverage/coverage-state.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/coverage/coverage-state.lisp")
   :BYTES 325 :SHA256
   "1574f1c37996344664a3663e6ae5eb9de475f312a34c1c4a3f2c220732262375")
  (:PATH "raw/coverage/coverage-state.lisp.gz" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/coverage/coverage-state.lisp.gz")
   :BYTES 428375 :SHA256
   "7a71be230fdfadbb870489487d5d929552978bf50dd24948a929c2d7c834cacf")
  (:PATH "raw/drivers/adapt-audit.error" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/adapt-audit.error")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/drivers/adapt-audit.lisp" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/adapt-audit.lisp")
   :BYTES 3322 :SHA256
   "077fed2a0ab2ce4d9ee981e38e4a52c0c26c89737059cff4cc11bd0c499b544f")
  (:PATH "raw/drivers/adapt-audit.output" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/adapt-audit.output")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/drivers/adapt-bench.error" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/adapt-bench.error")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/drivers/adapt-bench.lisp" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/adapt-bench.lisp")
   :BYTES 10663 :SHA256
   "4ddadbb9271d1b3ffde27df433b71f679657bff01259269de9e9910ad41620a2")
  (:PATH "raw/drivers/adapt-bench.output" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/adapt-bench.output")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/drivers/adapt-mutation.error" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/adapt-mutation.error")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/drivers/adapt-mutation.lisp" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/adapt-mutation.lisp")
   :BYTES 2424 :SHA256
   "f8ebc8355d1fb787dc37ae1745590669500fcee33a47325fa9aebe6f20ee9863")
  (:PATH "raw/drivers/adapt-mutation.output" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/adapt-mutation.output")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/drivers/audit-before-bench-pin-update-1cabd9a0.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/audit-before-bench-pin-update-1cabd9a0.lisp")
   :BYTES 40442 :SHA256
   "4a9b2bd371d4c576a349895c5e0f5ddb51ae467af28cdcdc5aed0dec6978c53c")
  (:PATH "raw/drivers/audit-before-declaration-selftest-fix-6cf528ab.lisp"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/audit-before-declaration-selftest-fix-6cf528ab.lisp")
   :BYTES 40442 :SHA256
   "f1d73a786da977cacc054026cfd73a297a21149fff1f2de05c89f766c28e095b")
  (:PATH "raw/drivers/audit-bench-pin-update.patch" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/audit-bench-pin-update.patch")
   :BYTES 896 :SHA256
   "0d6b3f5b3f7381806666efb7fa698c7c0fc57ea76570f723a34c18f7351d2772")
  (:PATH "raw/drivers/audit-controls.fragment.txt" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/audit-controls.fragment.txt")
   :BYTES 4465 :SHA256
   "d959d9ec5548883f87ee16b34701414e8b1f766cf50e8b0b4507245666dbdf69")
  (:PATH "raw/drivers/audit-declaration-selftest-fix.patch" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/audit-declaration-selftest-fix.patch")
   :BYTES 1219 :SHA256
   "7e097068ea3ff27bffe3c7ef533e8361c1cff76bc73d562fa6e5c2614e239dd1")
  (:PATH "raw/drivers/audit-main.fragment.txt" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/audit-main.fragment.txt")
   :BYTES 2188 :SHA256
   "a397d567e7426f5b5b5588a2739892e0a62d9662aab95148407d6364b9d79679")
  (:PATH "raw/drivers/audit-preamble.fragment.txt" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/audit-preamble.fragment.txt")
   :BYTES 870 :SHA256
   "b9754d7832d94cbd9e348cc74c21fe0ab7c1c4ad0e08f4cde3258297abf1742f")
  (:PATH "raw/drivers/audit-reference.fragment.txt" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/audit-reference.fragment.txt")
   :BYTES 750 :SHA256
   "d038ce1b150b505d9dca4a6873c03ab6006e3fabfc6378f2a55ea9fc6e4ac0d8")
  (:PATH "raw/drivers/audit-selftest.fragment.txt" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/audit-selftest.fragment.txt")
   :BYTES 8999 :SHA256
   "d58111d68f27da024f5f33c44d1d4e2b2b6210e312a0a336b0481bf9087b07c5")
  (:PATH "raw/drivers/audit-synthetic.fragment.txt" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/audit-synthetic.fragment.txt")
   :BYTES 4751 :SHA256
   "9e6a5594ed9460bcbbe09acd75869c2014debd138dafaaef058c73eb61cee5ac")
  (:PATH "raw/drivers/audit.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/audit.lisp")
   :BYTES 40425 :SHA256
   "634ceeab4a331ba40692bc2e27acc3c23dd463676e1ad6eb1b5a4840343bff45")
  (:PATH "raw/drivers/bench-before-synthetic-arity-hardening-702c8172.lisp"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/bench-before-synthetic-arity-hardening-702c8172.lisp")
   :BYTES 16862 :SHA256
   "96483a4b137a37d872db1a3744c5ae7997d114f51aa779eaa0221119a139f08f")
  (:PATH "raw/drivers/bench-synthetic-arity-hardening.patch" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/bench-synthetic-arity-hardening.patch")
   :BYTES 1804 :SHA256
   "394847393bf9318e50658bd4c6159b1f53345e393a910ea60c1f729b351ce7b5")
  (:PATH "raw/drivers/bench.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/bench.lisp")
   :BYTES 17033 :SHA256
   "588b7d4fa73cf61dc136629e53273436b698f166c68ac50047c4938573174515")
  (:PATH "raw/drivers/catalogue-audit-selftest-pin-fix.patch" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/catalogue-audit-selftest-pin-fix.patch")
   :BYTES 1261 :SHA256
   "2ca9b5f911b659a8d5118c2be6004f3a71a9f00fd2c5349150c02123a8129a03")
  (:PATH "raw/drivers/catalogue-before-audit-selftest-fix-e5461bad.lisp"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/catalogue-before-audit-selftest-fix-e5461bad.lisp")
   :BYTES 10517 :SHA256
   "7b1c43a778521bd096cfed7dc9b1c10a1d15f05fbf963f97a9c31eecf8a58b91")
  (:PATH "raw/drivers/catalogue-before-next-drain-adjustment-a1cc13f4.lisp"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/catalogue-before-next-drain-adjustment-a1cc13f4.lisp")
   :BYTES 14687 :SHA256
   "c11987b96d190ee1bdd9d64dace5accc41b948e0495a825b3273706a7ec211af")
  (:PATH "raw/drivers/catalogue-materialized.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/catalogue-materialized.lisp")
   :BYTES 10517 :SHA256
   "0dbe784fcc03e739d0577ebd5077b6ec6304ee216f60f80d412cf04f7f2c9172")
  (:PATH "raw/drivers/fixtures-and-mutations.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/fixtures-and-mutations.lisp")
   :BYTES 2670 :SHA256
   "fccacec1434ab7026c02434f4010230fd979b138fb65c1be34865d3daa7305f5")
  (:PATH "raw/drivers/materialization-history.md.txt" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/materialization-history.md")
   :BYTES 3541 :SHA256
   "9fc3461c21cedb5d7bf7a48de41bfbc45cd9ddd5ce6118f0ce1a2b06289db435")
  (:PATH "raw/drivers/materialize-2.lisp" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/materialize-2.lisp")
   :BYTES 10356 :SHA256
   "fa9690a1e52973e373225ba4ffb129bdf021baabb3a45367617a802b11901428")
  (:PATH "raw/drivers/materialize-2.output.txt" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/materialize-2.output.txt")
   :BYTES 113 :SHA256
   "e784c389cc9e771e80c771d3e36fc7274243a397e204755761e38b98325c6ad7")
  (:PATH "raw/drivers/materialize-2.stderr.txt" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/materialize-2.stderr.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/drivers/materialize-3.lisp" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/materialize-3.lisp")
   :BYTES 10355 :SHA256
   "2c52d3f276d0aec80802f0fac9aa4fc135eb06b790884f0d97f5403f7a00400b")
  (:PATH "raw/drivers/materialize-3.output.txt" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/materialize-3.output.txt")
   :BYTES 113 :SHA256
   "ebb62060bf6269b15a91eddb4de9e087dc5ff8aee2e7fcfa6dd32b894c9b04bb")
  (:PATH "raw/drivers/materialize-3.stderr.txt" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/materialize-3.stderr.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/drivers/materialize-4.lisp" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/materialize-4.lisp")
   :BYTES 10355 :SHA256
   "228c8c2bba531b800f31d91565ed58e04de375e827b7b78bff3c699e75e95e23")
  (:PATH "raw/drivers/materialize-4.output.txt" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/materialize-4.output.txt")
   :BYTES 113 :SHA256
   "6bb45572344a1adfe9b707f37f72f4bd194eea44ffeb494e0097bff001fd9824")
  (:PATH "raw/drivers/materialize-4.stderr.txt" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/materialize-4.stderr.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/drivers/materialize.lisp" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/materialize.lisp")
   :BYTES 10356 :SHA256
   "4d06a8d3841b33ae6313c994b315aba59d4eeee8e33100327eefc0fb08fc60bd")
  (:PATH "raw/drivers/materialize.output.txt" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/materialize.output.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/drivers/materialize.stderr.txt" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/materialize.stderr.txt")
   :BYTES 22741 :SHA256
   "ae770c34f7ad3af9695bedaf0c149230996b919ea1c2dbd9d3513ac741b98e01")
  (:PATH "raw/drivers/mutation-audit-selftest-pin-fix.patch" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/mutation-audit-selftest-pin-fix.patch")
   :BYTES 3233 :SHA256
   "e7e35aaad82ec58971de8160487af54a877fda745f82feff10c15230220b01a8")
  (:PATH "raw/drivers/mutation-before-audit-selftest-fix-87d1d3dc.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/mutation-before-audit-selftest-fix-87d1d3dc.lisp")
   :BYTES 55484 :SHA256
   "bfa30baeac1721e3e5443da6502498cdfedcc1a20cd66b191c86266374a2573b")
  (:PATH "raw/drivers/mutation-before-next-drain-adjustment-50a1932f.lisp"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/mutation-before-next-drain-adjustment-50a1932f.lisp")
   :BYTES 59654 :SHA256
   "a55512d4bb5b203c2ffb32339555489a572448dfdf39d797f333fd6eb87b0a98")
  (:PATH "raw/drivers/mutation-before-product.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/mutation-before-product.lisp")
   :BYTES 43443 :SHA256
   "faeb990ab76b7640d19fc045e1806b7470f5a57ae7692bc10a650bef895eb714")
  (:PATH "raw/drivers/mutation-next-drain-adjustment.patch" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/mutation-next-drain-adjustment.patch")
   :BYTES 7553 :SHA256
   "2fae8cca18aa53d32dfdcfbb61c49b55b871c0f9470c06ad720e901696e11c1b")
  (:PATH "raw/drivers/mutation.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/mutation.lisp")
   :BYTES 55484 :SHA256
   "3fa6091bc119849c5490537a6842519bd581a0597edf46b3bd57a8fad8da5638")
  (:PATH "raw/drivers/nominal-deftest-lines-before-next-drain-adjustment.txt"
   :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/nominal-deftest-lines-before-next-drain-adjustment.txt")
   :BYTES 1362 :SHA256
   "8bfe29478a6aba809b8c5c885a2f309cc17e1f80005c195283b42827650ce1e9")
  (:PATH "raw/drivers/nominal-deftest-lines.txt" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/nominal-deftest-lines.txt")
   :BYTES 1362 :SHA256
   "8bfe29478a6aba809b8c5c885a2f309cc17e1f80005c195283b42827650ce1e9")
  (:PATH "raw/drivers/nominal-whitelist-before-next-drain-adjustment.lisp"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/nominal-whitelist-before-next-drain-adjustment.lisp")
   :BYTES 2354 :SHA256
   "df753153dbbfe6beb8e35dc31425dfac7b1b5df9f2973b2dde8dad2d754af1c0")
  (:PATH "raw/drivers/nominal-whitelist.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/nominal-whitelist.lisp")
   :BYTES 2354 :SHA256
   "df753153dbbfe6beb8e35dc31425dfac7b1b5df9f2973b2dde8dad2d754af1c0")
  (:PATH "raw/drivers/prepare-cold-catalogue.error" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/prepare-cold-catalogue.error")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/drivers/prepare-cold-catalogue.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/prepare-cold-catalogue.lisp")
   :BYTES 3020 :SHA256
   "9c26629cdf64820c5e7cb18642259e4ccea4e5889f789414cf116a2d5be575ce")
  (:PATH "raw/drivers/prepare-cold-catalogue.output" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/prepare-cold-catalogue.output")
   :BYTES 1230 :SHA256
   "b62cb17a41eaf88206ab17c25ffd6b1ee045ca229463e2c8215da6f1941604eb")
  (:PATH "raw/drivers/read-drivers-syntax-2.output.txt" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/read-drivers-syntax-2.output.txt")
   :BYTES 2007 :SHA256
   "47707b663c37e92f07145a231996cd319c778482300cfacbe020389cfe0906a8")
  (:PATH "raw/drivers/read-drivers-syntax-2.stderr.txt" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/read-drivers-syntax-2.stderr.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/drivers/read-drivers-syntax-3.output.txt" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/read-drivers-syntax-3.output.txt")
   :BYTES 2007 :SHA256
   "3acb5a3f4d39c1db7af735febe3d853d23fe3a93693cd7274d3bf66e30919e6f")
  (:PATH "raw/drivers/read-drivers-syntax-3.stderr.txt" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/read-drivers-syntax-3.stderr.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/drivers/read-drivers-syntax.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/read-drivers-syntax.lisp")
   :BYTES 3074 :SHA256
   "f53edda30134a21f06133d6066fa48cc85133e0de10440fcaa30a2deac7378b3")
  (:PATH "raw/drivers/read-drivers-syntax.output.txt" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/read-drivers-syntax.output.txt")
   :BYTES 2007 :SHA256
   "116f286b6829e69d0504215798f547c3d220df45839b090b5f3a14ad530ece86")
  (:PATH "raw/drivers/read-drivers-syntax.stderr.txt" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/read-drivers-syntax.stderr.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/drivers/selftests/4001073964-worker-98654/baseline-copy/report.lisp"
   :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/selftests/4001073964-worker-98654/baseline-copy/report.lisp")
   :BYTES 522 :SHA256
   "8e41aa0deb98617bdf30eb7d2f3583add797c8e2ee5e52fcece86664b122dbc9")
  (:PATH "raw/drivers/selftests/4001073964-worker-98654/baseline-copy/test.log"
   :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/selftests/4001073964-worker-98654/baseline-copy/test.log")
   :BYTES 72 :SHA256
   "de0dbcd7f7ead42441ea8049fc98c4131badb83e7d506ec1dcbf65c5f390cf6f")
  (:PATH
   "raw/drivers/selftests/4001073964-worker-98654/baseline-transport/report.lisp"
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/selftests/4001073964-worker-98654/baseline-transport/report.lisp")
   :BYTES 537 :SHA256
   "24a37c43cc48d194b52157736d7d714a9e18675c3aea2d55c468311a886dcbf3")
  (:PATH
   "raw/drivers/selftests/4001073964-worker-98654/baseline-transport/test.log"
   :SOURCE
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/selftests/4001073964-worker-98654/baseline-transport/test.log")
   :BYTES 77 :SHA256
   "8db5a0350972541411a1e5939c72ccd8c01f29d66442dfef3cf75a6bc434356c")
  (:PATH
   "raw/drivers/selftests/4001073964-worker-98654/completion-exit/test.log"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/selftests/4001073964-worker-98654/completion-exit/test.log")
   :BYTES 96 :SHA256
   "c0320463f598c4c5f11202e542c7617c216e7be84103be16768a503c83b17a95")
  (:PATH
   "raw/drivers/selftests/4001073964-worker-98654/completion-exit/tools/cbor-item-read-isolated-build.lisp"
   :SOURCE
   #A((197) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/selftests/4001073964-worker-98654/completion-exit/tools/cbor-item-read-isolated-build.lisp")
   :BYTES 184 :SHA256
   "1e3c5ad6ead59dcacdfb02c47ce2474eb44727271c8fcd8436fefe2dde8d0b61")
  (:PATH "raw/drivers/selftests/4001073964-worker-98654/report.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/selftests/4001073964-worker-98654/report.lisp")
   :BYTES 1826 :SHA256
   "b95c758bd68ed345bee5ff2ccd1c38503102a7badd0903fa87c35be7f9a42a00")
  (:PATH "raw/drivers/selftests/4001073964-worker-98654/signal/test.log"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/selftests/4001073964-worker-98654/signal/test.log")
   :BYTES 40 :SHA256
   "52ed427bbed0c5c928fa7e029bb609e785bb3a11329b9a8110255dbeb7c5f384")
  (:PATH
   "raw/drivers/selftests/4001073964-worker-98654/signal/tools/cbor-item-read-isolated-build.lisp"
   :SOURCE
   #A((188) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/selftests/4001073964-worker-98654/signal/tools/cbor-item-read-isolated-build.lisp")
   :BYTES 142 :SHA256
   "1ee0da58fd6e1dca7befab8f13b2c7c520b79e8d12dedc4e6a3f9bb926d5628b")
  (:PATH
   "raw/drivers/selftests/4001074011-worker-2614/baseline-copy/report.lisp"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/selftests/4001074011-worker-2614/baseline-copy/report.lisp")
   :BYTES 521 :SHA256
   "f483e26cab01911400d35d1809522f4af3c61aa972986854e2504a5b33625bd8")
  (:PATH "raw/drivers/selftests/4001074011-worker-2614/baseline-copy/test.log"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/selftests/4001074011-worker-2614/baseline-copy/test.log")
   :BYTES 72 :SHA256
   "de0dbcd7f7ead42441ea8049fc98c4131badb83e7d506ec1dcbf65c5f390cf6f")
  (:PATH
   "raw/drivers/selftests/4001074011-worker-2614/baseline-transport/report.lisp"
   :SOURCE
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/selftests/4001074011-worker-2614/baseline-transport/report.lisp")
   :BYTES 536 :SHA256
   "7c877dee7c116892b575f78ed064e0b30421a681b89b668eb5ee2d035e5ac619")
  (:PATH
   "raw/drivers/selftests/4001074011-worker-2614/baseline-transport/test.log"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/selftests/4001074011-worker-2614/baseline-transport/test.log")
   :BYTES 77 :SHA256
   "8db5a0350972541411a1e5939c72ccd8c01f29d66442dfef3cf75a6bc434356c")
  (:PATH
   "raw/drivers/selftests/4001074011-worker-2614/completion-exit/test.log"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/selftests/4001074011-worker-2614/completion-exit/test.log")
   :BYTES 96 :SHA256
   "c0320463f598c4c5f11202e542c7617c216e7be84103be16768a503c83b17a95")
  (:PATH
   "raw/drivers/selftests/4001074011-worker-2614/completion-exit/tools/cbor-item-read-isolated-build.lisp"
   :SOURCE
   #A((196) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/selftests/4001074011-worker-2614/completion-exit/tools/cbor-item-read-isolated-build.lisp")
   :BYTES 184 :SHA256
   "1e3c5ad6ead59dcacdfb02c47ce2474eb44727271c8fcd8436fefe2dde8d0b61")
  (:PATH "raw/drivers/selftests/4001074011-worker-2614/report.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/selftests/4001074011-worker-2614/report.lisp")
   :BYTES 1820 :SHA256
   "11715553ebdcb215708ee6b5f6b7c353118da0122ea9d9b9797d33914cad84a6")
  (:PATH "raw/drivers/selftests/4001074011-worker-2614/signal/test.log" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/selftests/4001074011-worker-2614/signal/test.log")
   :BYTES 40 :SHA256
   "52ed427bbed0c5c928fa7e029bb609e785bb3a11329b9a8110255dbeb7c5f384")
  (:PATH
   "raw/drivers/selftests/4001074011-worker-2614/signal/tools/cbor-item-read-isolated-build.lisp"
   :SOURCE
   #A((187) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/drivers/selftests/4001074011-worker-2614/signal/tools/cbor-item-read-isolated-build.lisp")
   :BYTES 142 :SHA256
   "1ee0da58fd6e1dca7befab8f13b2c7c520b79e8d12dedc4e6a3f9bb926d5628b")
  (:PATH "raw/freeze-sources-before-character-fix.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/freeze-sources-before-character-fix.lisp")
   :BYTES 2955 :SHA256
   "d28aa863fa3fe6d74926ff4c1b693ff20ef61b39bbd69f0abf5729ac7d0f3bd8")
  (:PATH "raw/freeze-sources.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/freeze-sources.lisp")
   :BYTES 2968 :SHA256
   "38c42dd3880fea5117791a81d514076008d21a73451da9ad6ac5c01e5e749e07")
  (:PATH "raw/frozen/arcdocdb.asd" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/frozen/arcdocdb.asd")
   :BYTES 17690 :SHA256
   "1c8e2c9074fc09a9797afa43db5b19c58e22c5108ec0044e97099117386f3c35")
  (:PATH "raw/frozen/docs/implementazione/cbor-item-decisioni.md.txt" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/frozen/docs/implementazione/cbor-item-decisioni.md.txt")
   :BYTES 4547 :SHA256
   "434977651bdc2a04049a7832723a62476e32b926a3f6b91a01de33393bc82a46")
  (:PATH "raw/frozen/docs/implementazione/cbor-item-lettura.md.txt" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/frozen/docs/implementazione/cbor-item-lettura.md.txt")
   :BYTES 9491 :SHA256
   "7b35b69d93c8d8b20acf879dac313a5b75066e2ef01a14572b4d1a68a14b514c")
  (:PATH "raw/frozen/docs/implementazione/cbor-item-metodo.md.txt" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/frozen/docs/implementazione/cbor-item-metodo.md.txt")
   :BYTES 4352 :SHA256
   "567e502ab3d36a1dfbf62e9baceb4b8dffb2d81ef6a9fbfade3ce1d83c763c4d")
  (:PATH "raw/frozen/docs/implementazione/cbor-item-revisione.md.txt" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/frozen/docs/implementazione/cbor-item-revisione.md.txt")
   :BYTES 9782 :SHA256
   "08b6c42425c787c2de305eb0a814b785eeb9a098f45ce686a7e53c50f9a43c63")
  (:PATH "raw/frozen/docs/implementazione/cbor-item.md.txt" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/frozen/docs/implementazione/cbor-item.md.txt")
   :BYTES 1729 :SHA256
   "4da7c15568765c70840bec0ef6edc96373165e6fbb6b6f5e66396c16c6014972")
  (:PATH "raw/frozen/docs/tracciabilita/matrice.md.txt" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/frozen/docs/tracciabilita/matrice.md.txt")
   :BYTES 52523 :SHA256
   "8b12b6a2327ddf757c67d23b40824a743d9d8b3d84c9579185f833007171eff6")
  (:PATH "raw/frozen/docs/tracciabilita/requisiti.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/frozen/docs/tracciabilita/requisiti.lisp")
   :BYTES 42037 :SHA256
   "9dc593e7f8c685306a09aa8a9ff51b29aedc69fcb47558213229ca10df563bba")
  (:PATH "raw/frozen/snapshot-index.lisp" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/frozen/snapshot-index.lisp")
   :BYTES 4649 :SHA256
   "6049ee1c0b66885f594389d75cb9c316ac0161dd1d19196aebd04766de0b464b")
  (:PATH "raw/frozen/src/codec/cbor-float-minimal.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/frozen/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH "raw/frozen/src/codec/cbor-header.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/frozen/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH "raw/frozen/src/codec/cbor-item-read.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/frozen/src/codec/cbor-item-read.lisp")
   :BYTES 2712 :SHA256
   "9a270d6ffa0fa8145ee0d7584c7add7e94a2ed87dccbf893298baf6169b582df")
  (:PATH "raw/frozen/src/codec/cbor-minimal.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/frozen/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH "raw/frozen/src/codec/cbor-package.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/frozen/src/codec/cbor-package.lisp")
   :BYTES 773 :SHA256
   "edf654310131a02128a404e238d3f86c6a7111927929402fc08a819b5a64f8d5")
  (:PATH "raw/frozen/src/codec/cbor-scan-input.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/frozen/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH "raw/frozen/src/codec/cbor-scan-items.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/frozen/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH "raw/frozen/src/codec/cbor-scan-minimal.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/frozen/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH "raw/frozen/src/codec/cbor-scan-stack.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/frozen/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH "raw/frozen/src/codec/cbor-scan.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/frozen/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH "raw/frozen/src/codec/cbor-space.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/frozen/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH "raw/frozen/src/codec/utf8.lisp" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/frozen/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH "raw/frozen/tests/codec/cbor-item-read-support.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/frozen/tests/codec/cbor-item-read-support.lisp")
   :BYTES 6909 :SHA256
   "05831dcb6068baf2988940f675fc0dbdc7bc5ea642119a60e0c504ad00b5bdbc")
  (:PATH "raw/frozen/tests/codec/cbor-item-read-threads.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/frozen/tests/codec/cbor-item-read-threads.lisp")
   :BYTES 3871 :SHA256
   "5769d43e378179cdb7f0ddadca08b49908ef1ed8e35afdeb7064df098b5ba414")
  (:PATH "raw/frozen/tests/codec/cbor-item-read.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/frozen/tests/codec/cbor-item-read.lisp")
   :BYTES 14112 :SHA256
   "56c80aee76b46cb23c5f4eff9c28912bf54104972cc5d5b9cf1b8f5c76b3a7ad")
  (:PATH "raw/frozen/tools/foundation-coverage.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/frozen/tools/foundation-coverage.lisp")
   :BYTES 24536 :SHA256
   "18c5d21628c9ff5864996719fadeb0b1322618d9b66fc5ec946da652f86e5244")
  (:PATH "raw/integrated-spikes/SPK-01.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001074204-check-12420-0/SPK-01.lisp")
   :BYTES 27222 :SHA256
   "72ce56ed4717bfaaa7aa5fd8acaca4768a87912b3b1f56d0d8c4d7d3f4b92177")
  (:PATH "raw/integrated-spikes/SPK-02.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001074204-check-12420-0/SPK-02.lisp")
   :BYTES 1607 :SHA256
   "7377d1114e6731b6bedebefd29d2f0970becd4a9c0fc33d88d0c0753ab8c9e0a")
  (:PATH "raw/integrated-spikes/SPK-03.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001074204-check-12420-0/SPK-03.lisp")
   :BYTES 3644 :SHA256
   "614c35f0028ccc5778deea6a7a768e13528103b12e9202e57e4ad338af28d186")
  (:PATH "raw/integrated-spikes/SPK-04.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001074204-check-12420-0/SPK-04.lisp")
   :BYTES 6752 :SHA256
   "85b548d6ca22f53a0a75a76a4d0e5791e738864e9716e5791b81c8f78c196f8e")
  (:PATH "raw/integrated-spikes/SPK-05.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001074204-check-12420-0/SPK-05.lisp")
   :BYTES 10144 :SHA256
   "f502f850bac97a7311b54013aec5e16ab59772cbef2690c54a2d14fef99433b2")
  (:PATH "raw/integrated-spikes/SPK-06.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001074204-check-12420-0/SPK-06.lisp")
   :BYTES 24066 :SHA256
   "5b8827b759ed8c1b9e6077c1432fb04966b56cd6b969de1e549e6bcd2a9a593a")
  (:PATH "raw/integrated-spikes/SPK-07.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001074204-check-12420-0/SPK-07.lisp")
   :BYTES 318 :SHA256
   "d8619e5c6f9f5cdfaf46604f9558fb365c51afe859d2c4fd09ef0edc70517c78")
  (:PATH "raw/integrated-spikes/SPK-07.lisp.gz" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001074204-check-12420-0/SPK-07.lisp.gz")
   :BYTES 410676 :SHA256
   "42d458623611581094f4cfb4257f3d3466df0694f3268fa9095e655b9d32d4c2")
  (:PATH "raw/integrated-spikes/SPK-08.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001074204-check-12420-0/SPK-08.lisp")
   :BYTES 291712 :SHA256
   "fbb094bf439f70a7c13de1a949504b3722716e2785b0a0d08e7f698d26b09dfa")
  (:PATH "raw/integrated-spikes/SPK-09.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001074204-check-12420-0/SPK-09.lisp")
   :BYTES 2472 :SHA256
   "da4dc6c4c7f662b3f78e932b51662a3606779a164fb7809fd3cf10013b17d2fe")
  (:PATH "raw/integrated-spikes/SPK-10.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001074204-check-12420-0/SPK-10.lisp")
   :BYTES 22977 :SHA256
   "fffa880b3e60f855bd8ca2f36e7f9f9b6326451f36ea9ad1bd927055f5385e67")
  (:PATH "raw/integrated-spikes/conservazione.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001074204-check-12420-0/conservazione.lisp")
   :BYTES 2301 :SHA256
   "d66e02f6d7d88b5b97042b9fcbfcace99b3bf98401f663fae5f5725fbc2961bf")
  (:PATH "raw/integrated-spikes/report.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001074204-check-12420-0/report.lisp")
   :BYTES 318 :SHA256
   "b894c35d0f305fb2a1e7f0253e88460236dc9c336a6163875c6de3977b72132a")
  (:PATH "raw/integrated-spikes/report.lisp.gz" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001074204-check-12420-0/report.lisp.gz")
   :BYTES 466971 :SHA256
   "1f6b943572681f0d84869fd322dd3e9a442b8923a13f5cc1def411c60c812912")
  (:PATH "raw/mutations/0/arcdocdb.asd" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/0/arcdocdb.asd")
   :BYTES 17690 :SHA256
   "1c8e2c9074fc09a9797afa43db5b19c58e22c5108ec0044e97099117386f3c35")
  (:PATH "raw/mutations/0/src/codec/cbor-item-read.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/0/src/codec/cbor-item-read.lisp")
   :BYTES 2714 :SHA256
   "1b4986f310c728f041071aece5ca30a248961407a92462f0b81ae484fa7498ce")
  (:PATH "raw/mutations/0/test.log" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/0/test.log")
   :BYTES 38609 :SHA256
   "d8ea173b4e0a5e5a58903a85ab1657b46eba68757f697c2932c712d162a69a25")
  (:PATH "raw/mutations/0/tests/codec/cbor-item-read-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/0/tests/codec/cbor-item-read-support.lisp")
   :BYTES 6909 :SHA256
   "05831dcb6068baf2988940f675fc0dbdc7bc5ea642119a60e0c504ad00b5bdbc")
  (:PATH "raw/mutations/0/tests/codec/cbor-item-read-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/0/tests/codec/cbor-item-read-threads.lisp")
   :BYTES 3871 :SHA256
   "5769d43e378179cdb7f0ddadca08b49908ef1ed8e35afdeb7064df098b5ba414")
  (:PATH "raw/mutations/0/tests/codec/cbor-item-read.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/0/tests/codec/cbor-item-read.lisp")
   :BYTES 14112 :SHA256
   "56c80aee76b46cb23c5f4eff9c28912bf54104972cc5d5b9cf1b8f5c76b3a7ad")
  (:PATH "raw/mutations/0/tools/build.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/0/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/0/tools/cbor-item-read-isolated-build.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/0/tools/cbor-item-read-isolated-build.lisp")
   :BYTES 470 :SHA256
   "bf16c035db9a0085580113a1531e27ed3f7d4fd8665e5815478417ed5710c37d")
  (:PATH "raw/mutations/1/arcdocdb.asd" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/1/arcdocdb.asd")
   :BYTES 17690 :SHA256
   "1c8e2c9074fc09a9797afa43db5b19c58e22c5108ec0044e97099117386f3c35")
  (:PATH "raw/mutations/1/src/codec/cbor-item-read.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/1/src/codec/cbor-item-read.lisp")
   :BYTES 2689 :SHA256
   "88093381bdbf3199c2e92d3fb8f27bff7d16227cecc0e4a4f2e5536be4addde3")
  (:PATH "raw/mutations/1/test.log" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/1/test.log")
   :BYTES 38794 :SHA256
   "7919d8dc7350db534e4fd2e50336c448f1c2aa9e4a5b893ed2b673b8b741f117")
  (:PATH "raw/mutations/1/tests/codec/cbor-item-read-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/1/tests/codec/cbor-item-read-support.lisp")
   :BYTES 6909 :SHA256
   "05831dcb6068baf2988940f675fc0dbdc7bc5ea642119a60e0c504ad00b5bdbc")
  (:PATH "raw/mutations/1/tests/codec/cbor-item-read-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/1/tests/codec/cbor-item-read-threads.lisp")
   :BYTES 3871 :SHA256
   "5769d43e378179cdb7f0ddadca08b49908ef1ed8e35afdeb7064df098b5ba414")
  (:PATH "raw/mutations/1/tests/codec/cbor-item-read.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/1/tests/codec/cbor-item-read.lisp")
   :BYTES 14112 :SHA256
   "56c80aee76b46cb23c5f4eff9c28912bf54104972cc5d5b9cf1b8f5c76b3a7ad")
  (:PATH "raw/mutations/1/tools/build.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/1/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/1/tools/cbor-item-read-isolated-build.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/1/tools/cbor-item-read-isolated-build.lisp")
   :BYTES 470 :SHA256
   "626b17c28541c1a5d37fec8979fcd73e64d48f0430eafb419251d1bb7274adb8")
  (:PATH "raw/mutations/2/arcdocdb.asd" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/2/arcdocdb.asd")
   :BYTES 17690 :SHA256
   "1c8e2c9074fc09a9797afa43db5b19c58e22c5108ec0044e97099117386f3c35")
  (:PATH "raw/mutations/2/src/codec/cbor-item-read.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/2/src/codec/cbor-item-read.lisp")
   :BYTES 2763 :SHA256
   "8b1affab1bd9cef4687772029f359551a6744383a3201af02db70394f8be4ce8")
  (:PATH "raw/mutations/2/test.log" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/2/test.log")
   :BYTES 38573 :SHA256
   "bb529720f2e8a04510fd26403988bdee914d35fa1255b39c3e010447d943b4fb")
  (:PATH "raw/mutations/2/tests/codec/cbor-item-read-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/2/tests/codec/cbor-item-read-support.lisp")
   :BYTES 6909 :SHA256
   "05831dcb6068baf2988940f675fc0dbdc7bc5ea642119a60e0c504ad00b5bdbc")
  (:PATH "raw/mutations/2/tests/codec/cbor-item-read-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/2/tests/codec/cbor-item-read-threads.lisp")
   :BYTES 3871 :SHA256
   "5769d43e378179cdb7f0ddadca08b49908ef1ed8e35afdeb7064df098b5ba414")
  (:PATH "raw/mutations/2/tests/codec/cbor-item-read.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/2/tests/codec/cbor-item-read.lisp")
   :BYTES 14112 :SHA256
   "56c80aee76b46cb23c5f4eff9c28912bf54104972cc5d5b9cf1b8f5c76b3a7ad")
  (:PATH "raw/mutations/2/tools/build.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/2/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/2/tools/cbor-item-read-isolated-build.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/2/tools/cbor-item-read-isolated-build.lisp")
   :BYTES 470 :SHA256
   "025e584cb1e26a759e69dcf49d00ff07db3023b36b807788e4d685e40b4e2c0d")
  (:PATH "raw/mutations/3/arcdocdb.asd" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/3/arcdocdb.asd")
   :BYTES 17690 :SHA256
   "1c8e2c9074fc09a9797afa43db5b19c58e22c5108ec0044e97099117386f3c35")
  (:PATH "raw/mutations/3/src/codec/cbor-item-read.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/3/src/codec/cbor-item-read.lisp")
   :BYTES 2724 :SHA256
   "22dc0a0c7cefc02e5d4eb77a4c07b29cea8aad2ef8e69d541bd19122704d7f81")
  (:PATH "raw/mutations/3/test.log" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/3/test.log")
   :BYTES 38897 :SHA256
   "36ece48566a754109ec816691434dc0ff3239f7087068a217437eb90cfa612a6")
  (:PATH "raw/mutations/3/tests/codec/cbor-item-read-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/3/tests/codec/cbor-item-read-support.lisp")
   :BYTES 6909 :SHA256
   "05831dcb6068baf2988940f675fc0dbdc7bc5ea642119a60e0c504ad00b5bdbc")
  (:PATH "raw/mutations/3/tests/codec/cbor-item-read-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/3/tests/codec/cbor-item-read-threads.lisp")
   :BYTES 3871 :SHA256
   "5769d43e378179cdb7f0ddadca08b49908ef1ed8e35afdeb7064df098b5ba414")
  (:PATH "raw/mutations/3/tests/codec/cbor-item-read.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/3/tests/codec/cbor-item-read.lisp")
   :BYTES 14112 :SHA256
   "56c80aee76b46cb23c5f4eff9c28912bf54104972cc5d5b9cf1b8f5c76b3a7ad")
  (:PATH "raw/mutations/3/tools/build.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/3/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/3/tools/cbor-item-read-isolated-build.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/3/tools/cbor-item-read-isolated-build.lisp")
   :BYTES 470 :SHA256
   "bb6d501dc8e90f5579b9d5dc2665fe955f165b04ba482d3fe58cb6491953b8eb")
  (:PATH "raw/mutations/4/arcdocdb.asd" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/4/arcdocdb.asd")
   :BYTES 17690 :SHA256
   "1c8e2c9074fc09a9797afa43db5b19c58e22c5108ec0044e97099117386f3c35")
  (:PATH "raw/mutations/4/src/codec/cbor-item-read.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/4/src/codec/cbor-item-read.lisp")
   :BYTES 2724 :SHA256
   "6a75be78a71dcafe445e3d7ba2322dd88db705af2dd9f60266049fa8d0435f71")
  (:PATH "raw/mutations/4/test.log" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/4/test.log")
   :BYTES 38929 :SHA256
   "1e3e9ba46ae5a7263e0751540081915c6fa7cfc70d731a15b4c1151e2ca9b1f0")
  (:PATH "raw/mutations/4/tests/codec/cbor-item-read-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/4/tests/codec/cbor-item-read-support.lisp")
   :BYTES 6909 :SHA256
   "05831dcb6068baf2988940f675fc0dbdc7bc5ea642119a60e0c504ad00b5bdbc")
  (:PATH "raw/mutations/4/tests/codec/cbor-item-read-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/4/tests/codec/cbor-item-read-threads.lisp")
   :BYTES 3871 :SHA256
   "5769d43e378179cdb7f0ddadca08b49908ef1ed8e35afdeb7064df098b5ba414")
  (:PATH "raw/mutations/4/tests/codec/cbor-item-read.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/4/tests/codec/cbor-item-read.lisp")
   :BYTES 14112 :SHA256
   "56c80aee76b46cb23c5f4eff9c28912bf54104972cc5d5b9cf1b8f5c76b3a7ad")
  (:PATH "raw/mutations/4/tools/build.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/4/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/4/tools/cbor-item-read-isolated-build.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/4/tools/cbor-item-read-isolated-build.lisp")
   :BYTES 470 :SHA256
   "81f6d5d3b747757874eb90bb4f932ade576260a95148ad993cccb9ff0f733040")
  (:PATH "raw/mutations/5/arcdocdb.asd" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/5/arcdocdb.asd")
   :BYTES 17690 :SHA256
   "1c8e2c9074fc09a9797afa43db5b19c58e22c5108ec0044e97099117386f3c35")
  (:PATH "raw/mutations/5/src/codec/cbor-item-read.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/5/src/codec/cbor-item-read.lisp")
   :BYTES 2753 :SHA256
   "50f6af52d39bc12861502ac8fc69ffe4682b0e389f1e855fafb345ab600ce498")
  (:PATH "raw/mutations/5/test.log" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/5/test.log")
   :BYTES 39008 :SHA256
   "9f60e377260aeb3efd9d45462c19ddfc554b6139d7478e076e777a5d66507705")
  (:PATH "raw/mutations/5/tests/codec/cbor-item-read-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/5/tests/codec/cbor-item-read-support.lisp")
   :BYTES 6909 :SHA256
   "05831dcb6068baf2988940f675fc0dbdc7bc5ea642119a60e0c504ad00b5bdbc")
  (:PATH "raw/mutations/5/tests/codec/cbor-item-read-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/5/tests/codec/cbor-item-read-threads.lisp")
   :BYTES 3871 :SHA256
   "5769d43e378179cdb7f0ddadca08b49908ef1ed8e35afdeb7064df098b5ba414")
  (:PATH "raw/mutations/5/tests/codec/cbor-item-read.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/5/tests/codec/cbor-item-read.lisp")
   :BYTES 14112 :SHA256
   "56c80aee76b46cb23c5f4eff9c28912bf54104972cc5d5b9cf1b8f5c76b3a7ad")
  (:PATH "raw/mutations/5/tools/build.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/5/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/5/tools/cbor-item-read-isolated-build.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/5/tools/cbor-item-read-isolated-build.lisp")
   :BYTES 470 :SHA256
   "aef3880b914ccc9ab1fc518e5785ca6b884fff814e91da59783b5a35456bf207")
  (:PATH "raw/mutations/6/arcdocdb.asd" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/6/arcdocdb.asd")
   :BYTES 17690 :SHA256
   "1c8e2c9074fc09a9797afa43db5b19c58e22c5108ec0044e97099117386f3c35")
  (:PATH "raw/mutations/6/src/codec/cbor-item-read.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/6/src/codec/cbor-item-read.lisp")
   :BYTES 2708 :SHA256
   "21a70f7ffea8b1eedd11d13e7dff63408cade99c0a5b828634aac1505b03bf59")
  (:PATH "raw/mutations/6/test.log" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/6/test.log")
   :BYTES 39437 :SHA256
   "76e7b8bc5cc75f39b4c74399fe6013e4466bd23ee7ab851a05b136b3ec5adae9")
  (:PATH "raw/mutations/6/tests/codec/cbor-item-read-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/6/tests/codec/cbor-item-read-support.lisp")
   :BYTES 6909 :SHA256
   "05831dcb6068baf2988940f675fc0dbdc7bc5ea642119a60e0c504ad00b5bdbc")
  (:PATH "raw/mutations/6/tests/codec/cbor-item-read-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/6/tests/codec/cbor-item-read-threads.lisp")
   :BYTES 3871 :SHA256
   "5769d43e378179cdb7f0ddadca08b49908ef1ed8e35afdeb7064df098b5ba414")
  (:PATH "raw/mutations/6/tests/codec/cbor-item-read.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/6/tests/codec/cbor-item-read.lisp")
   :BYTES 14112 :SHA256
   "56c80aee76b46cb23c5f4eff9c28912bf54104972cc5d5b9cf1b8f5c76b3a7ad")
  (:PATH "raw/mutations/6/tools/build.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/6/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/6/tools/cbor-item-read-isolated-build.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/6/tools/cbor-item-read-isolated-build.lisp")
   :BYTES 470 :SHA256
   "df822c0f3a71226a39886eefe858e5f5f3811481e108ffcf493b819d8bec375a")
  (:PATH "raw/mutations/7/arcdocdb.asd" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/7/arcdocdb.asd")
   :BYTES 17690 :SHA256
   "1c8e2c9074fc09a9797afa43db5b19c58e22c5108ec0044e97099117386f3c35")
  (:PATH "raw/mutations/7/src/codec/cbor-item-read.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/7/src/codec/cbor-item-read.lisp")
   :BYTES 2794 :SHA256
   "7d5c1debf76203708838a68e3ed891ed7eb43308572b529a8fbf2e617e9995cb")
  (:PATH "raw/mutations/7/test.log" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/7/test.log")
   :BYTES 38247 :SHA256
   "ef2ca5060e4e783e5b3b26425fef1e876dcae82ff560322bb1b324f3e3dd7c06")
  (:PATH "raw/mutations/7/tests/codec/cbor-item-read-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/7/tests/codec/cbor-item-read-support.lisp")
   :BYTES 6909 :SHA256
   "05831dcb6068baf2988940f675fc0dbdc7bc5ea642119a60e0c504ad00b5bdbc")
  (:PATH "raw/mutations/7/tests/codec/cbor-item-read-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/7/tests/codec/cbor-item-read-threads.lisp")
   :BYTES 3871 :SHA256
   "5769d43e378179cdb7f0ddadca08b49908ef1ed8e35afdeb7064df098b5ba414")
  (:PATH "raw/mutations/7/tests/codec/cbor-item-read.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/7/tests/codec/cbor-item-read.lisp")
   :BYTES 14112 :SHA256
   "56c80aee76b46cb23c5f4eff9c28912bf54104972cc5d5b9cf1b8f5c76b3a7ad")
  (:PATH "raw/mutations/7/tools/build.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/7/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/7/tools/cbor-item-read-isolated-build.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/7/tools/cbor-item-read-isolated-build.lisp")
   :BYTES 470 :SHA256
   "79805872579085d16ac5b74076e287426c4813a25df7d8eb62ad111f17967530")
  (:PATH "raw/mutations/baseline/arcdocdb.asd" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/baseline/arcdocdb.asd")
   :BYTES 17690 :SHA256
   "1c8e2c9074fc09a9797afa43db5b19c58e22c5108ec0044e97099117386f3c35")
  (:PATH "raw/mutations/baseline/src/codec/cbor-item-read.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/baseline/src/codec/cbor-item-read.lisp")
   :BYTES 2712 :SHA256
   "9a270d6ffa0fa8145ee0d7584c7add7e94a2ed87dccbf893298baf6169b582df")
  (:PATH "raw/mutations/baseline/test.log" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/baseline/test.log")
   :BYTES 115751 :SHA256
   "24451b8015f0c3b1a4fe72b557a42b8a85996744b77757cc21537c6d94157ec7")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-item-read-support.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/baseline/tests/codec/cbor-item-read-support.lisp")
   :BYTES 6909 :SHA256
   "05831dcb6068baf2988940f675fc0dbdc7bc5ea642119a60e0c504ad00b5bdbc")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-item-read-threads.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/baseline/tests/codec/cbor-item-read-threads.lisp")
   :BYTES 3871 :SHA256
   "5769d43e378179cdb7f0ddadca08b49908ef1ed8e35afdeb7064df098b5ba414")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-item-read.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/baseline/tests/codec/cbor-item-read.lisp")
   :BYTES 14112 :SHA256
   "56c80aee76b46cb23c5f4eff9c28912bf54104972cc5d5b9cf1b8f5c76b3a7ad")
  (:PATH "raw/mutations/baseline/tools/build.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/baseline/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/baseline/tools/cbor-item-read-isolated-build.lisp"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/baseline/tools/cbor-item-read-isolated-build.lisp")
   :BYTES 484 :SHA256
   "e57e7db131d177f804efd224ccbc2e687889f0dee94cb3041a294c71855e721c")
  (:PATH "raw/mutations/report.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/report.lisp")
   :BYTES 96655 :SHA256
   "267e948edce9a999821c392377cc4ec55fc4500056be6c048e74ce81c75673a4")
  (:PATH "raw/precompile/cbor-item-read-before-completion.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/precompile/cbor-item-read-before-completion.lisp")
   :BYTES 14112 :SHA256
   "25ef6d8d50752a52b0b8e266e19c4cf5ddb64a807c1acbc9a22df2d24481aca3")
  (:PATH "raw/precompile/cbor-item-read-support-before-completion.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/precompile/cbor-item-read-support-before-completion.lisp")
   :BYTES 6909 :SHA256
   "05831dcb6068baf2988940f675fc0dbdc7bc5ea642119a60e0c504ad00b5bdbc")
  (:PATH "raw/precompile/read-blind-corpus.error.txt" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/precompile/read-blind-corpus.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/precompile/read-blind-corpus.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/precompile/read-blind-corpus.lisp")
   :BYTES 3141 :SHA256
   "1597d84f4b7d80510ba28f64ca197e07454f5d318e8ddcd55cae575d7f5b5d21")
  (:PATH "raw/precompile/read-blind-corpus.output.txt" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/precompile/read-blind-corpus.output.txt")
   :BYTES 535 :SHA256
   "f6041ccd599d385dd889f98d57dcf43305fdfb9fb635d55077e525baedfe1f8b")
  (:PATH "raw/precompile/root-preparation.md.txt" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/precompile/root-preparation.md.txt")
   :BYTES 1930 :SHA256
   "6e6cec6c16967a642d97a0fb7136c49ecfde1ed39dc3fa69b61b7817c9167368")
  (:PATH "raw/reader-self-test/completion-exit/isolated-build.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073853-reader-self-test-90682-0/completion-exit/isolated-build.lisp")
   :BYTES 197 :SHA256
   "1a45dcf8a6d03f1e8866e49280c6f0edb894320c90624d5620fad1e3d546cea9")
  (:PATH "raw/reader-self-test/completion-exit/stderr.log" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073853-reader-self-test-90682-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/reader-self-test/completion-exit/stdout.log" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073853-reader-self-test-90682-0/completion-exit/stdout.log")
   :BYTES 105 :SHA256
   "5e630c1b44d68ce71b27d151e76bf367e3cbd941200adc36cdd30e0fe7390531")
  (:PATH "raw/reader-self-test/report.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073853-reader-self-test-90682-0/report.lisp")
   :BYTES 1943 :SHA256
   "c95586012d818618ad26635f0767ae23c1dbe259e52fc9f509c22ad867e8c42b")
  (:PATH "raw/reader-self-test/signal/isolated-build.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073853-reader-self-test-90682-0/signal/isolated-build.lisp")
   :BYTES 247 :SHA256
   "ff5cf55dda241d32ea1b4308172c7dc526436cbf1d546e7471148cee95a873d1")
  (:PATH "raw/reader-self-test/signal/stderr.log" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073853-reader-self-test-90682-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/reader-self-test/signal/stdout.log" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073853-reader-self-test-90682-0/signal/stdout.log")
   :BYTES 126 :SHA256
   "3697c68fa71f124c8d05d8cc5d649a744586a10989eb2e67c5bdce6bfc760142")
  (:PATH "raw/results-draft.md.txt" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/results-draft.md.txt")
   :BYTES 7402 :SHA256
   "9071ef12f70a443394239bb418d14912517b3d7365a38fee45731f849da352a9")
  (:PATH "raw/review/archive-selection-reading-v2.error.txt" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/archive-selection-reading-v2.error.txt")
   :BYTES 16404 :SHA256
   "86717da127add6af7679bfc7fa8e4233e9b4c7a18205ec22d365bdf00edc7527")
  (:PATH "raw/review/archive-selection-reading-v2.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/archive-selection-reading-v2.lisp")
   :BYTES 8138 :SHA256
   "b9b09dc81728ebce607e7883263a084708ef9a2348b64d0bc354befee3f324c4")
  (:PATH "raw/review/archive-selection-reading-v2.output.txt" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/archive-selection-reading-v2.output.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/archive-selection-reading-v3.error.txt" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/archive-selection-reading-v3.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/archive-selection-reading-v3.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/archive-selection-reading-v3.lisp")
   :BYTES 8221 :SHA256
   "b8537a78c0f2319a25c58412d903fed8203d85e14051cc3d0a18aad3a2e44e2e")
  (:PATH "raw/review/archive-selection-reading-v3.output.txt" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/archive-selection-reading-v3.output.txt")
   :BYTES 6356 :SHA256
   "c979dc7d59cc83a42d863e7a3b04289eb9119dd4bc9c6cc7b535b369e38d4919")
  (:PATH "raw/review/archive-selection-reading.error.txt" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/archive-selection-reading.error.txt")
   :BYTES 16572 :SHA256
   "d498d0ec6bfc7fe5a680dbb5a1b8b7652737bceb3dd5d41a656d935a38a9e023")
  (:PATH "raw/review/archive-selection-reading.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/archive-selection-reading.lisp")
   :BYTES 7763 :SHA256
   "206b58acf9264c4125722bb5329b2bef47d989424b0ba3566e891e9c9dee84e9")
  (:PATH "raw/review/archive-selection-reading.md.txt" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/archive-selection-reading.md")
   :BYTES 4242 :SHA256
   "505c47847cc1e13e807ab35ddfe8439f17086911c3b9111f73b894ce2634b92b")
  (:PATH "raw/review/archive-selection-reading.output.txt" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/archive-selection-reading.output.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/benchmark-reading-2.error.txt" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/benchmark-reading-2.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/benchmark-reading-2.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/benchmark-reading-2.lisp")
   :BYTES 11247 :SHA256
   "76374bc61fcf8b56e2e93f1a52e4fd326175895c886e32bd7675947d46609044")
  (:PATH "raw/review/benchmark-reading-2.output.txt" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/benchmark-reading-2.output.txt")
   :BYTES 2008 :SHA256
   "1ae07b6d8c1f58653244d92271e5818a8c6c05e6905631d99ddf30f6fa610e43")
  (:PATH "raw/review/benchmark-reading.error.txt" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/benchmark-reading.error.txt")
   :BYTES 19792 :SHA256
   "703e16793ad23971480b58dfd722ca5f439491b964ea2fb1105658d21698c442")
  (:PATH "raw/review/benchmark-reading.lisp" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/benchmark-reading.lisp")
   :BYTES 11258 :SHA256
   "3fb588905dccc136aa19dceba31b441843cef8d58a247d411e41ea9595eb73bc")
  (:PATH "raw/review/benchmark-reading.md.txt" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/benchmark-reading.md")
   :BYTES 4429 :SHA256
   "9fbd465c5f2aa74c644401e92ca18fa465e151cfadd92946cce8eed6ffcdd1dd")
  (:PATH "raw/review/benchmark-reading.output.txt" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/benchmark-reading.output.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/blind-plan.md.txt" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/blind-plan.md")
   :BYTES 6147 :SHA256
   "88a4d44437fff0d591983a30d6df2cc8259cab3b59f001d434b6893b535400b2")
  (:PATH "raw/review/collection-precompile-reading.md.txt" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/collection-precompile-reading.md")
   :BYTES 7513 :SHA256
   "5c335019b20ddf663b4950c58678f3341b7ff93f3eadce9fa635ac1c2cdd68d9")
  (:PATH "raw/review/coverage-reading.error.txt" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/coverage-reading.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/coverage-reading.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/coverage-reading.lisp")
   :BYTES 15855 :SHA256
   "590f79cfca22472f838aeeecfb5a92cc52f9cc1e1925b454a0f95960a9e43a50")
  (:PATH "raw/review/coverage-reading.md.txt" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/coverage-reading.md")
   :BYTES 5757 :SHA256
   "3406104891ccbd3ba63964716755f43a3f9692a649a128bd0cd184a373691429")
  (:PATH "raw/review/coverage-reading.output.txt" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/coverage-reading.output.txt")
   :BYTES 7782 :SHA256
   "205ed962a7a8149ffd770c976e52c78af8cf51b7222d2285399b319baf7ffff9")
  (:PATH "raw/review/drivers-precompile-reading.md.txt" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/drivers-precompile-reading.md")
   :BYTES 9651 :SHA256
   "f86f79355a411abff79bf7ece7d3416eb1579e6923646a3297cb727fc2297d52")
  (:PATH "raw/review/final-integration-reading.error.txt" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/final-integration-reading.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/final-integration-reading.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/final-integration-reading.lisp")
   :BYTES 9451 :SHA256
   "b6b92c5122ea7facad356ebdb341c70380a3805b17401e2b58bb185f2bcc9256")
  (:PATH "raw/review/final-integration-reading.md.txt" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/final-integration-reading.md")
   :BYTES 4041 :SHA256
   "7f6c9f80e2ca2e135f9c685208c6c29f86013999cfb8003f66a2e1bf71dfc263")
  (:PATH "raw/review/final-integration-reading.output.txt" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/final-integration-reading.output.txt")
   :BYTES 3760 :SHA256
   "25b13595d9d6663b92657f73340f9855747328203150113c84f08c042e066404")
  (:PATH "raw/review/freeze-helper-data-reading.error.txt" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/freeze-helper-data-reading.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/freeze-helper-data-reading.output.txt" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/freeze-helper-data-reading.output.txt")
   :BYTES 935 :SHA256
   "7e0b5719e3965a29f5b815f0f4a8dc72bdf0b6275607bc88dc082059c176df92")
  (:PATH "raw/review/freeze-helper-reading.md.txt" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/freeze-helper-reading.md")
   :BYTES 3237 :SHA256
   "dec8db60cc18657d610b9f315a1321dbfeb9d3f6b91f71986ad60f99f7d702b7")
  (:PATH "raw/review/helper-form-reading.error.txt" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/helper-form-reading.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/helper-form-reading.output.txt" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/helper-form-reading.output.txt")
   :BYTES 530 :SHA256
   "9101ab090f37f55dbd4d90fd7955774c8aad0dafa81f092fcba554def83489b8")
  (:PATH "raw/review/initial-runtime-reading-v2.error.txt" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/initial-runtime-reading-v2.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/initial-runtime-reading-v2.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/initial-runtime-reading-v2.lisp")
   :BYTES 14367 :SHA256
   "a7cf17e3f2b3d6731ba1dc4519f2fa1fd7aafea7a687dd9def732941c37de49c")
  (:PATH "raw/review/initial-runtime-reading-v2.output.txt" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/initial-runtime-reading-v2.output.txt")
   :BYTES 3672 :SHA256
   "92478d2aaf4073b276ec4e4e5f5e42e54a59ace91d66b789227ac8a5f50e2ce8")
  (:PATH "raw/review/initial-runtime-reading.error.txt" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/initial-runtime-reading.error.txt")
   :BYTES 26080 :SHA256
   "c017ea08a29ad6828dfddd96f798b5145ae0632f48c57ccdf0028d5e8af9e415")
  (:PATH "raw/review/initial-runtime-reading.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/initial-runtime-reading.lisp")
   :BYTES 14331 :SHA256
   "912d26e4df771af4179ec19fe5b0fe21a4626330f73e1714a6a1897e04439a5a")
  (:PATH "raw/review/initial-runtime-reading.md.txt" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/initial-runtime-reading.md")
   :BYTES 6095 :SHA256
   "c711fdf0086007a7e409286b4f102da8a79c6bf5564d51eb42f914d697957388")
  (:PATH "raw/review/initial-runtime-reading.output.txt" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/initial-runtime-reading.output.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/inspect-initial-runtime.error.txt" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/inspect-initial-runtime.error.txt")
   :BYTES 8072 :SHA256
   "313cd4d636fd94116d6a065cd2c887cccad834900004d00c9cbac6dda723860d")
  (:PATH "raw/review/inspect-initial-runtime.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/inspect-initial-runtime.lisp")
   :BYTES 2156 :SHA256
   "fe3839677f9d4912967a83e2b9e3f44ffbe9bef4e88964c838facf77fd999960")
  (:PATH "raw/review/inspect-initial-runtime.output.txt" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/inspect-initial-runtime.output.txt")
   :BYTES 4387 :SHA256
   "1237dc4c4dc6848cf657a1a8f41cebe4af7434875bb97d17cc9d90470e559910")
  (:PATH "raw/review/integrated-reader-main.fragment.txt" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/integrated-reader-main.fragment.txt")
   :BYTES 11287 :SHA256
   "813c9a8851a2adcd5c723b0df8ddfff6d73e11916239df1d4cc5de1a59532b7a")
  (:PATH "raw/review/integrated-runtime-inventory.error.txt" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/integrated-runtime-inventory.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/integrated-runtime-inventory.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/integrated-runtime-inventory.lisp")
   :BYTES 1759 :SHA256
   "1134c1313a7c6b318ce47c60dd11a8ffa39ac47e37bf22f74ec6c25e224553d5")
  (:PATH "raw/review/integrated-runtime-inventory.output.txt" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/integrated-runtime-inventory.output.txt")
   :BYTES 2068 :SHA256
   "2b29aca4c934150daab284026360483cbd7b092e8734cbe92e1f600634de637f")
  (:PATH "raw/review/integrated-runtime-reading-v2.error.txt" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/integrated-runtime-reading-v2.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/integrated-runtime-reading-v2.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/integrated-runtime-reading-v2.lisp")
   :BYTES 21026 :SHA256
   "5f59f18703c6a0a96423c619e7edc017e2ad0106f0499f2880936eb15020eec1")
  (:PATH "raw/review/integrated-runtime-reading-v2.output.txt" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/integrated-runtime-reading-v2.output.txt")
   :BYTES 7598 :SHA256
   "98cb391699d0412d7307587a11d91acd4de675977b87402f3b37e128ab232396")
  (:PATH "raw/review/integrated-runtime-reading.error.txt" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/integrated-runtime-reading.error.txt")
   :BYTES 26252 :SHA256
   "b56061d664aa3817c436bb4e9481cbbe2a576b85c075a1699d62f6dcaac40258")
  (:PATH "raw/review/integrated-runtime-reading.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/integrated-runtime-reading.lisp")
   :BYTES 20890 :SHA256
   "51cb8d7397d549de36d9010a9cd54088102c12c6f9c7e5b8eb8351548964fb37")
  (:PATH "raw/review/integrated-runtime-reading.md.txt" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/integrated-runtime-reading.md")
   :BYTES 7375 :SHA256
   "85fab54f9f91b6ee89d93db13d9fab04c38bae9454275f83876b381271d3b2b0")
  (:PATH "raw/review/integrated-runtime-reading.output.txt" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/integrated-runtime-reading.output.txt")
   :BYTES 5660 :SHA256
   "907f6f19041001d786fec98943a83393e72d60381271eefd30f7cadc9546a5a9")
  (:PATH "raw/review/mutation-reading.error.txt" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/mutation-reading.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/mutation-reading.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/mutation-reading.lisp")
   :BYTES 22656 :SHA256
   "f79f00d92fa1c24a31722c5fb820d49a218051589b0b19c38da79b3708c18160")
  (:PATH "raw/review/mutation-reading.md.txt" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/mutation-reading.md")
   :BYTES 6997 :SHA256
   "bc05581d9eafdec4c08fea908f9f861a891ec8b581af1f0e733ef0b1c24ba276")
  (:PATH "raw/review/mutation-reading.output.txt" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/mutation-reading.output.txt")
   :BYTES 16454 :SHA256
   "619542ba919d85d3f9237231059c089708d7c7d876013ade9c1ff8e062356680")
  (:PATH "raw/review/prepare-integrated-reader.error.txt" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/prepare-integrated-reader.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/prepare-integrated-reader.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/prepare-integrated-reader.lisp")
   :BYTES 3093 :SHA256
   "7d3b99bb530859e50b8d84916e54b42de70ba850132af48d2db384714d8ff7ce")
  (:PATH "raw/review/prepare-integrated-reader.output.txt" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/prepare-integrated-reader.output.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/prepare-mutation-reading-v2.error.txt" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/prepare-mutation-reading-v2.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/prepare-mutation-reading-v2.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/prepare-mutation-reading-v2.lisp")
   :BYTES 5209 :SHA256
   "86233fe8fefe55173db48963b42ad55af25d8d562d8490749fd9997d7503a7c5")
  (:PATH "raw/review/prepare-mutation-reading-v2.output.txt" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/prepare-mutation-reading-v2.output.txt")
   :BYTES 119 :SHA256
   "9fb0682b0b02822de94ea26dfe4b09addb1a0b26305fb841fc70154bf68b7932")
  (:PATH "raw/review/prepare-mutation-reading.error.txt" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/prepare-mutation-reading.error.txt")
   :BYTES 39225 :SHA256
   "0e19b6398d33c97b251724817669fa110a45e02b9a17a219c70af977e8f5f5de")
  (:PATH "raw/review/prepare-mutation-reading.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/prepare-mutation-reading.lisp")
   :BYTES 5269 :SHA256
   "a5084ce4322ca343525f14a8ddaa305bbe0dda5101a2b44e8d92802361234049")
  (:PATH "raw/review/prepare-mutation-reading.output.txt" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/prepare-mutation-reading.output.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/read-integrated-reader-forms.error.txt" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/read-integrated-reader-forms.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/read-integrated-reader-forms.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/read-integrated-reader-forms.lisp")
   :BYTES 463 :SHA256
   "9e7f42a4fef4dbcbe6655fd1dc34d465d849b3c7cfc6363df1d9a7bbb344bce4")
  (:PATH "raw/review/read-integrated-reader-forms.output.txt" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/read-integrated-reader-forms.output.txt")
   :BYTES 53 :SHA256
   "b94c0b2a22e1062f24ea4b936a438657e9711e361596e7d0c59d31265cf6f5ee")
  (:PATH "raw/review/read-prepared-mutation-reader.error.txt" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/read-prepared-mutation-reader.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/read-prepared-mutation-reader.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/read-prepared-mutation-reader.lisp")
   :BYTES 1713 :SHA256
   "720b2b952ef4841a6a50089efdecd53b6c6e96cfa1e8f7623a077ed8f1429363")
  (:PATH "raw/review/read-prepared-mutation-reader.output.txt" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/read-prepared-mutation-reader.output.txt")
   :BYTES 219 :SHA256
   "5e7f6ff43cc510650ec5b0a5b261b876e2381e48ff2993dd6397234977cdc2df")
  (:PATH "raw/review/read-product-decisions-v2.error.txt" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/read-product-decisions-v2.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/read-product-decisions-v2.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/read-product-decisions-v2.lisp")
   :BYTES 1664 :SHA256
   "c513f83a3859ae63e99835e13a98bdf31ce6fa87fefaf57df258e77a28511e1b")
  (:PATH "raw/review/read-product-decisions-v2.output.txt" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/read-product-decisions-v2.output.txt")
   :BYTES 307 :SHA256
   "157b1252010f1d70926e59f4ea5fecab0f7a042c89ba9eda3ff764744dda4713")
  (:PATH "raw/review/read-product-decisions.error.txt" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/read-product-decisions.error.txt")
   :BYTES 3470 :SHA256
   "15e1d50bd54d50c46978c5b59051b880df36e9be81b7e4fcf7e12e42cc8fcf0c")
  (:PATH "raw/review/read-product-decisions.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/read-product-decisions.lisp")
   :BYTES 1663 :SHA256
   "355b1370ec78b35d539b34c4c6632b954f89ce2a029ba07bcdd285d0a32f21cd")
  (:PATH "raw/review/read-product-decisions.output.txt" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/read-product-decisions.output.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/root-bench-query-before-fix.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/root-bench-query-before-fix.lisp")
   :BYTES 656 :SHA256
   "0885d2a31fa399389625e99239f7f277b91eb06b7b1e81feffb4cdd38e3519b2")
  (:PATH "raw/review/root-bench-query-note.md.txt" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/root-bench-query-note.md")
   :BYTES 508 :SHA256
   "87c637379f187ee5a2840ad445596d7ec86c09c8a3a88d189e0274e9110dd0ad")
  (:PATH "raw/review/root-bench-summary.error.txt" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/root-bench-summary.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/root-bench-summary.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/root-bench-summary.lisp")
   :BYTES 972 :SHA256
   "f646915523199e5d673373bfbabb2f6e11f506b919d116fd5634dd444194a847")
  (:PATH "raw/review/root-bench-summary.output.txt" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/review/root-bench-summary.output.txt")
   :BYTES 290 :SHA256
   "71d69a18be7c75d38126acbf808fdc3bd6b5b30c23586cd988bafbddac340d83")
  (:PATH "raw/snapshot-self-test/completion-exit/isolated-build.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073853-snapshot-self-test-90652-0/completion-exit/isolated-build.lisp")
   :BYTES 199 :SHA256
   "b8bb4416a818775bae5c77341eeec2c356a2733f633ac2bc8b6ac3ff955d05e0")
  (:PATH "raw/snapshot-self-test/completion-exit/stderr.log" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073853-snapshot-self-test-90652-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/snapshot-self-test/completion-exit/stdout.log" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073853-snapshot-self-test-90652-0/completion-exit/stdout.log")
   :BYTES 107 :SHA256
   "4f22544421d9012fe132a36bf15950cd327ca959b8f9c5ef3d386e0c8b62a25c")
  (:PATH "raw/snapshot-self-test/report.lisp" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073853-snapshot-self-test-90652-0/report.lisp")
   :BYTES 1961 :SHA256
   "ef67dad38c32323779389b17ec38171502c5d272c8e34ebcc487679b75ce9e50")
  (:PATH "raw/snapshot-self-test/signal/isolated-build.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073853-snapshot-self-test-90652-0/signal/isolated-build.lisp")
   :BYTES 249 :SHA256
   "a345276e3dfe377c0bbd359793165915b1527938a65250d367ce5ac079feecc1")
  (:PATH "raw/snapshot-self-test/signal/stderr.log" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073853-snapshot-self-test-90652-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/snapshot-self-test/signal/stdout.log" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001073853-snapshot-self-test-90652-0/signal/stdout.log")
   :BYTES 128 :SHA256
   "e3502e714a0530acb1f0130c4ced4a016607bcb067e3686f6f29704db8423ea5")
  (:PATH "processes/manifest-preparation/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001074957-command-64265-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "2d62f22e93316c344f88bdd1ee9864cd6ec0b4abc91d644c5e6ce7b3536297d4")
  (:PATH "processes/manifest-preparation/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001074957-command-64265-0/report.lisp")
   :BYTES 195380 :SHA256
   "4912fa7dacfbd8ab2661039b696144194fccc34ab8c005b7a491536c3c7a5a8d")
  (:PATH "processes/archive-preflight/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001074983-command-66543-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "e2a0cfdea02d653fa2ddbc65b980a5d735f185f977d2a956fea6bf0714b66f4f")
  (:PATH "processes/archive-preflight/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001074983-command-66543-0/report.lisp")
   :BYTES 196145 :SHA256
   "79b3458d9b0d3839fc18c5ece9aaacdb3655808e31a2f35ddb1060d18a77a3ac")
  (:PATH "processes/parallel-collection/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001075009-command-68215-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "fa435bcdcb50b8cac6065682e9a8101008773f7e1c072b4b7697bb08f6104e9d")
  (:PATH "processes/parallel-collection/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001075009-command-68215-0/report.lisp")
   :BYTES 195026 :SHA256
   "d8167d8601fe3d65b88fcc9e6e248e5cd6cc884243c0f69f1a4e2e4491127ebb")
  (:PATH "processes/collection-data-reading/closed-check-original.log" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001075135-command-73103-0/closed-check-original.log")
   :BYTES 4994 :SHA256
   "b5e6feb7e6f8a28fb539858c0b3202d3bb7014c3ca0206eec349d1971f4a2fd8")
  (:PATH
   "processes/collection-data-reading/collection-observation-original.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001075135-command-73103-0/collection-observation-original.lisp")
   :BYTES 151635 :SHA256
   "9a874580eb2bc3c3ccd4600aab438f85b277b16a40658af4ee34d129d118227f")
  (:PATH "processes/collection-data-reading/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001075135-command-73103-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "85209451f1fc931fc6621e901713aef4326a8e4d054ea480b1dbbe5264e827d1")
  (:PATH "processes/collection-data-reading/preserve-originals-tool.lisp"
   :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001075135-command-73103-0/preserve-originals-tool.lisp")
   :BYTES 2120 :SHA256
   "a63aae561ead1cf2dd23570050176b156976f5e9b03812fab82d5509aacabc3b")
  (:PATH
   "processes/collection-data-reading/preserved-collection-originals.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001075135-command-73103-0/preserved-collection-originals.lisp")
   :BYTES 1610 :SHA256
   "dc7480d51cca5276b0ae29161d5f4619bebb3f4fa64ffcba2c34779c3ca52a0a")
  (:PATH "processes/collection-data-reading/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001075135-command-73103-0/report.lisp")
   :BYTES 357329 :SHA256
   "67ae9a75b927d51cf82b64b276f91a67a9856fb609db2f67a2bccfa4249562be")
  (:PATH "processes/preserve-collection-originals/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001075142-command-73323-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "f6931e987287bb22a7c532ad69f8ad7a264d4aa2d1c1b3267e62bb1bd35792a8")
  (:PATH "processes/preserve-collection-originals/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4001075142-command-73323-0/report.lisp")
   :BYTES 196760 :SHA256
   "8a8cee2b530f3827c141874ea67e8d25e590315f1bcb40b543dd5f89ad2c1e89"))
 :LIMITS
 (:SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :FASL-EXCLUDED-FROM-PUBLISHED-MUTATION-TREES
  :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
