(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "combined-tests" :RECORD-PATH "processes/combined-tests/report.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "make") #A((4) BASE-CHAR . "test")
    #A((4) BASE-CHAR . "lint") #A((5) BASE-CHAR . "trace")
    #A((5) BASE-CHAR . "links"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "coverage-tool-self-test" :RECORD-PATH
   "processes/coverage-tool-self-test/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((11) BASE-CHAR . "--self-test")
    #A((48) BASE-CHAR . "spikes/out/directory-id-coverage-tool-self-test/"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "README.md" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-closed-publication/README.txt")
   :BYTES 2019 :SHA256
   "718c5986367d5bcd6c9df1b06bc8fcfe3fad516a8a89cce40eb645ebad0b3135")
  (:PATH "collection-manifest.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-closed-publication/manifest.lisp")
   :BYTES 4539 :SHA256
   "f0b520d6edd7f5ca0695f8c20b2106bac3775b0f511bf9a18c2babe1d112c4bb")
  (:PATH "collection-source.lisp" :SOURCE
   #A((95) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")
  (:PATH "processes/combined-tests/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001156257-command-30765-0/conservazione.lisp")
   :BYTES 1721 :SHA256
   "d0e0ed3b14f5a5204e502e66bf3b777097e11c656450d1e72380b2276c87fc7d")
  (:PATH "processes/combined-tests/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001156257-command-30765-0/report.lisp")
   :BYTES 317 :SHA256
   "2582df894ccee12544ca0128ed4e62d601bafc07b71a3abc11cac51adb27c418")
  (:PATH "processes/combined-tests/report.lisp.gz" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001156257-command-30765-0/report.lisp.gz")
   :BYTES 213754 :SHA256
   "42c141d3506e73a0b63c5d2842afd26d77ffa5f8a11300ae00d0a21660e94951")
  (:PATH "processes/coverage-tool-self-test/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001156257-command-30806-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "ad05d12649e1192f98d7271533e6879adfc69daeaa9f65b68dee3423cd670d8d")
  (:PATH "processes/coverage-tool-self-test/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001156257-command-30806-0/report.lisp")
   :BYTES 218937 :SHA256
   "68fec99d0b2fe548b0b7bf99d7efe865977b33b2fc80a4bd788c28d5312d1ec2")
  (:PATH "raw/audit/closed-integration-summary.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-audit/closed-integration-summary.lisp")
   :BYTES 261 :SHA256
   "088a29782a39b69eef866814471f5d895c7836422c1388b0152a4f0b9e5d2212")
  (:PATH "raw/audit/coverage-tool-self-summary.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-audit/coverage-tool-self-summary.lisp")
   :BYTES 250 :SHA256
   "f09612b5a7451ea9ddf35dfc2357453be3d9b2095309ac783cb90af34486d2b2")
  (:PATH "raw/audit/read-check.lisp.txt" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-audit/read-check.lisp")
   :BYTES 1621 :SHA256
   "30792f85951186eae59c1c7276673447c6e49e64a9a74a8da26dffdb8c52020e")
  (:PATH "raw/code-comparison.txt" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-closed-publication/code-comparison.txt")
   :BYTES 319 :SHA256
   "8f88b18ac3d71c83df0cd60e9b5c9d7a8c3395ea2cbedd19997e4c235db76303")
  (:PATH "raw/coverage-tool-self-test/21574f6cbaf64c007bb599790ae9d199.html"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-coverage-tool-self-test/21574f6cbaf64c007bb599790ae9d199.html")
   :BYTES 2828 :SHA256
   "0dd88f812d074523ac40d97071e162516880e1b1f8766e64a38169fc164a3abc")
  (:PATH "raw/coverage-tool-self-test/cover-index.html" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-coverage-tool-self-test/cover-index.html")
   :BYTES 1788 :SHA256
   "d5e3e201f6dc87863781186ad46858329890336064c96bd53bd8da92ffd73c6a")
  (:PATH "raw/coverage-tool-self-test/coverage-fixture.lisp.txt" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-coverage-tool-self-test/coverage-fixture.lisp")
   :BYTES 147 :SHA256
   "3767518fde8bde1e1286dbf663e97eac01f02e038d7f3161df436d9fd3e92559")
  (:PATH "raw/verified/CHANGELOG.md.txt" :SOURCE
   #A((73) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/CHANGELOG.md")
   :BYTES 30145 :SHA256
   "bbd671a2435ea96d5916559b41e36a0ee57726b1e69569b504e18af37cf335be")
  (:PATH "raw/verified/arcdocdb.asd.txt" :SOURCE
   #A((73) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/arcdocdb.asd")
   :BYTES 20826 :SHA256
   "602a01aff89ac8998a85df816365d2de694cabfcfb64de5a433a334e04cb096e")
  (:PATH "raw/verified/docs/implementazione/id-directory-recovery.md.txt"
   :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/id-directory-recovery.md")
   :BYTES 9163 :SHA256
   "b567c9f31e8fd5272a1cd701e44f4f4376f859305f86cde6d5822f63aecfda2a")
  (:PATH "raw/verified/src/recovery/inventory-directory-id.lisp.txt" :SOURCE
   #A((101) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/inventory-directory-id.lisp")
   :BYTES 1869 :SHA256
   "20b78e7ad2f6d2bc75b5a7f77470383943989bf2b041a66e454b1f131a34e6d2")
  (:PATH "raw/verified/src/recovery/inventory-id.lisp.txt" :SOURCE
   #A((91) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/inventory-id.lisp")
   :BYTES 3569 :SHA256
   "4d0681d4021f24df8d134df9a72790c25099889594224f3d9fa78e1f662babf7")
  (:PATH "raw/verified/src/recovery/manifest-package.lisp.txt" :SOURCE
   #A((95) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/manifest-package.lisp")
   :BYTES 1534 :SHA256
   "834398fe14d84559654f83cd7b422a2a38674cbf5449f0bd381aebd711ef0fa0")
  (:PATH "raw/verified/tests/recovery/inventory-directory-id.lisp.txt" :SOURCE
   #A((103) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/recovery/inventory-directory-id.lisp")
   :BYTES 14266 :SHA256
   "87740363f797bc2e46f4d4999c98800a9ceecd58e8f772dea65d1466b6b3661e")
  (:PATH "raw/verified/tests/vertical/method.md.txt" :SOURCE
   #A((85) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/vertical/method.md")
   :BYTES 5414 :SHA256
   "7615a1d6687d2c4ff573a5644a84183845bc5d115bf3292eebf0ce74f0ac899d")
  (:PATH "raw/verified/tests/vertical/scenarios.lisp.txt" :SOURCE
   #A((90) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/vertical/scenarios.lisp")
   :BYTES 5923 :SHA256
   "59e7d98ea2dce103d22ed87377654fc3c22cda92f0f8063db5fbadf022e0fffe")
  (:PATH "raw/verified/tests/vertical/support.lisp.txt" :SOURCE
   #A((88) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/vertical/support.lisp")
   :BYTES 13839 :SHA256
   "e429d35024a76e5422c65e2738aad30163b68e1c98434296354ec3c5a1b13689")
  (:PATH "raw/verified/tools/foundation-coverage.lisp.txt" :SOURCE
   #A((91) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tools/foundation-coverage.lisp")
   :BYTES 29016 :SHA256
   "981b0f9b7c17e612d23628be8be7682dd794f4ac52b2bd139fe32799e536bf14")
  (:PATH "raw/verified/tools/foundation-mutation.lisp.txt" :SOURCE
   #A((91) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tools/foundation-mutation.lisp")
   :BYTES 43698 :SHA256
   "e0e7816fbb233bc82c0308f1137b6c421eae671adf6cd12fcccd91b3dd6b1e9a"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
