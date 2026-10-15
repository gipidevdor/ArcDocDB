(:SCHEMA-VERSION 1 :KIND :INDEPENDENT-COMMAND-ARCHIVE-RUNTIME-READING :STATUS
 :OK :CHECKS 1694 :SELF-TEST
 (:STATUS :OK :CASES 59 :CHECKS 2807 :FAILED-CASES 0) :POSITIVE
 (:CASE "explicit-closed-parallel-history" :INDEXED-FILES 9 :ACTUAL-FILES 11
  :WORKERS 4 :WORKER-COUNTS (3 2 2 2) :PROCESSES 4 :WHOLE-BYTE-COMPARISONS 9
  :CLOSED-INVENTORY T)
 :ACCESSORY
 (:CASE "accessory-compressed-record-retained-with-payload" :INDEXED-FILES 9
  :ACTUAL-FILES 11 :WORKERS 4 :WORKER-COUNTS (3 2 3 1) :PROCESSES 3
  :WHOLE-BYTE-COMPARISONS 9 :CLOSED-INVENTORY T)
 :FULL-CHECK
 (:NESTED-WRAPPER NIL :ALL-OK-LINES 1657 :ALL-OK-UNIQUE T :NON-SMOKE-LINES 1655
  :NOMINAL-COUNT 1651 :NOMINAL-UNIQUE T :SMOKE-COUNT 2 :LINTER-FIXTURE-COUNT 4
  :LINTER-FIXTURES
  ("ok    qualified-reader.lisp: COD-34"
   "ok    keyword-barrier.lisp: nessuna violazione"
   "ok    good.lisp: nessuna violazione"
   "ok    bad.lisp: COD-02 COD-03 COD-12 COD-20 COD-22 COD-34 COD-43 COD-50")
  :LINT "237 file, 0 violazioni" :TRACE
  "122 requisiti, 65 invarianti, 13 scenari FI, 52 ADR: 0 errori" :LINKS
  "476 file, 3199 link controllati, 0 rotti" :EVIDENCE
  (:STATUS :OK :CATALOGS 123 :ARTIFACT-REFERENCES 3565 :STORED-FILES 42702
   :STORED-BYTES 1138547016 :LIMITS
   (:STRUCTURE-PRESENCE-SIZE-AND-COMPRESSED-INTEGRITY
    :NO-RESULT-REINTERPRETATION))
  :SPIKES 10 :SPIKE-MODE :CHECK-ONLY)
 :HISTORICAL-ATTEMPTS
 ((:WRAPPER
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001077810-command-50855-0/report.lisp")
   :STATUS :FAILED :EXIT-CODE 1 :DIAGNOSTIC NIL :SUMMARY
   (:STATUS :FAILED :CASES 59 :CHECKS 984 :FAILED-CASES 48))
  (:WRAPPER
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001077811-command-50873-0/report.lisp")
   :STATUS :FAILED :EXIT-CODE 2 :DIAGNOSTIC NIL :SUMMARY
   (:STATUS :FAILED :CASES 59 :CHECKS 984 :FAILED-CASES 48)))
 :PHYSICAL-FILES-OBSERVED 251 :SHA-AND-METADATA-BEFORE-AFTER :STABLE
 :OBSERVATIONS
 ((:PATH
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001077810-command-50855-0/report.lisp")
   :BYTES 202295 :SHA256
   "87cecea6f6f213743d66687b0ff976277a71fc4dbea49b635a05a9eed3b7b896"
   :WRITE-DATE 4001077891)
  (:PATH
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001077811-command-50873-0/report.lisp")
   :BYTES 317 :SHA256
   "e20127e6307324f128dc57faf8e385c5f31f1c23641d7cc34394f0532906ce5c"
   :WRITE-DATE 4001077975)
  (:PATH
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001077811-command-50873-0/report.lisp.gz")
   :BYTES 187848 :SHA256
   "de5d392580f8cf792c880433496541a6724dbbde09fffadd90bede7871f5fcf5"
   :WRITE-DATE 4001077975)
  (:PATH
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078088-command-58422-0/report.lisp")
   :BYTES 228434 :SHA256
   "bda5c3e13e3cff52a5b902e5dfb4ef60bea3f9c79b320f60887bbd2759c67fc0"
   :WRITE-DATE 4001078264)
  (:PATH
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078089-command-58445-0/report.lisp")
   :BYTES 317 :SHA256
   "bb419d34dccad1e84c0c79b2fdbaa9691ab1728518b9318df259e80338714945"
   :WRITE-DATE 4001078552)
  (:PATH
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078089-command-58445-0/report.lisp.gz")
   :BYTES 190504 :SHA256
   "559f6c96926ebe07e4cf1be3cc5b8a38698d69dc3c6ed6ba5dafcac5d80037ca"
   :WRITE-DATE 4001078552)
  (:PATH
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078518-check-71652-0/SPK-01.lisp")
   :BYTES 27228 :SHA256
   "1fe9513853e108d8e3f510c6879e51004ed9dcca104341cade88196a0fb80d9c"
   :WRITE-DATE 4001078523)
  (:PATH
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078518-check-71652-0/SPK-02.lisp")
   :BYTES 1607 :SHA256
   "923b5781e88a4c7a957937fdda416ccd823cd4e5c0903a4283da2309f6885a55"
   :WRITE-DATE 4001078524)
  (:PATH
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078518-check-71652-0/SPK-03.lisp")
   :BYTES 3662 :SHA256
   "0323a987152b6c4250925de881d92e6dbbdfcf0c8ea103375b9e866ce70be437"
   :WRITE-DATE 4001078524)
  (:PATH
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078518-check-71652-0/SPK-04.lisp")
   :BYTES 6752 :SHA256
   "34fafcd5b88193ab4ee465f5eaf786dcd46604d271c93a966ed59c41b56efc97"
   :WRITE-DATE 4001078525)
  (:PATH
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078518-check-71652-0/SPK-05.lisp")
   :BYTES 10170 :SHA256
   "4213bb0b7e9b1b6d39883eceeac0a9b633ca03788367e51a860ee75e6515c9c3"
   :WRITE-DATE 4001078527)
  (:PATH
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078518-check-71652-0/SPK-06.lisp")
   :BYTES 24102 :SHA256
   "e017dc6cb21d80f011d82f6d13facdbe45827542edbc657981a79d6533f54c71"
   :WRITE-DATE 4001078528)
  (:PATH
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078518-check-71652-0/SPK-07.lisp")
   :BYTES 318 :SHA256
   "1260d44173bc8a038c4652faf25e274c95e6eb3ed416b1b9c516d0a8f816e93f"
   :WRITE-DATE 4001078549)
  (:PATH
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078518-check-71652-0/SPK-07.lisp.gz")
   :BYTES 410640 :SHA256
   "36fad39af9bccf6041103dbb2890282b9d805113a0bf387d0a82903a5047821f"
   :WRITE-DATE 4001078549)
  (:PATH
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078518-check-71652-0/SPK-08.lisp")
   :BYTES 291712 :SHA256
   "45c3b8b63112c95e826408ecde4454357704ec499e6c1e3d339bec24d71b5455"
   :WRITE-DATE 4001078541)
  (:PATH
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078518-check-71652-0/SPK-09.lisp")
   :BYTES 2472 :SHA256
   "37507dc98bbef117ddb7959a7917fd7fdd314bbfce3b8c8dbb3be3af9bfc705a"
   :WRITE-DATE 4001078543)
  (:PATH
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078518-check-71652-0/SPK-10.lisp")
   :BYTES 22977 :SHA256
   "858206221b957c5d5cd3f4cdc9c68dfab573afaa70e0bb4600d046c74ba33ff0"
   :WRITE-DATE 4001078547)
  (:PATH
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078518-check-71652-0/report.lisp")
   :BYTES 318 :SHA256
   "709c017a43830edfb94bfe30d6cbc732e2739acc4ab6023420733f804c93f1a7"
   :WRITE-DATE 4001078549)
  (:PATH
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078518-check-71652-0/report.lisp.gz")
   :BYTES 466677 :SHA256
   "5e81c64016abcd032a0f0c17c3b67beea4394239cbac53613ba4ebc0f2d2002e"
   :WRITE-DATE 4001078549)
  (:PATH
   #A((202) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/archive/archive-index.lisp")
   :BYTES 4429 :SHA256
   "9eaf906a58700747afa3df1c7825311f830febe96074734572f96046b6bf4f50"
   :WRITE-DATE 4001078094)
  (:PATH
   #A((208) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/archive/collection-manifest.lisp")
   :BYTES 1109 :SHA256
   "3558429deabdcbc734b8e900dc2256e55f9eb6cc766f70f5fd5778305b737f0b"
   :WRITE-DATE 4001078094)
  (:PATH
   #A((206) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/archive/collection-source.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e"
   :WRITE-DATE 4001078094)
  (:PATH
   #A((207) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/archive/processes/0/report.lisp")
   :BYTES 410 :SHA256
   "47c6a080044c043439b081e8a718a0e40c7a2c820f1dfa23c4bd289533570fb0"
   :WRITE-DATE 4001078093)
  (:PATH
   #A((207) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/archive/processes/1/report.lisp")
   :BYTES 428 :SHA256
   "9f83f8ac1a1bf99e39ea6af977d8d532e82613d74103b6ae8081662f5429e3aa"
   :WRITE-DATE 4001078093)
  (:PATH
   #A((207) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/archive/processes/2/report.lisp")
   :BYTES 438 :SHA256
   "dbca9d4a05c4aac5b5523019de2c23aa35f35eb13e03cc769c0efb6d57b4d8e4"
   :WRITE-DATE 4001078093)
  (:PATH
   #A((210) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/archive/processes/gzip/report.lisp")
   :BYTES 310 :SHA256
   "7fffabb3167db69650d50d628155f39e98cb3e024fee539654db92821ab3e0ff"
   :WRITE-DATE 4001078093)
  (:PATH
   #A((213) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/archive/processes/gzip/report.lisp.gz")
   :BYTES 286 :SHA256
   "aaf242eb91dbb470a65dfb76931d425e7a66f57d984a48f9704f71a46bcd13e9"
   :WRITE-DATE 4001078093)
  (:PATH
   #A((199) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/archive/raw/.hidden.txt")
   :BYTES 22 :SHA256
   "6e26b55a3fb204d9259a3c7e6a28b6ccae53f783ccca85f43765649ab9faebcd"
   :WRITE-DATE 4001078093)
  (:PATH
   #A((196) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/archive/raw/data.bin")
   :BYTES 5 :SHA256
   "45f46e8a9e33fa1fecb517abc6a0a63c35ef9bc1920018acf9d65d2a9f3a1fcc"
   :WRITE-DATE 4001078093)
  (:PATH
   #A((192) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/case-result.lisp")
   :BYTES 461 :SHA256
   "83a751f7ed864fa97a8937f9ad115de6daaf67427af8cc9e2190247815947689"
   :WRITE-DATE 4001078099)
  (:PATH
   #A((206) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/independent-recheck.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
   :WRITE-DATE 4001078097)
  (:PATH
   #A((207) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/independent-recheck.stdout.lisp")
   :BYTES 1556 :SHA256
   "3a0f7a755ecd40e3e5cfd37bad4567eba6f278475ab83e9511cacbbc11d79be0"
   :WRITE-DATE 4001078099)
  (:PATH
   #A((203) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/inputs/config/manifest.lisp")
   :BYTES 1109 :SHA256
   "3558429deabdcbc734b8e900dc2256e55f9eb6cc766f70f5fd5778305b737f0b"
   :WRITE-DATE 4001078091)
  (:PATH
   #A((198) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/inputs/raw/.hidden.txt")
   :BYTES 22 :SHA256
   "6e26b55a3fb204d9259a3c7e6a28b6ccae53f783ccca85f43765649ab9faebcd"
   :WRITE-DATE 4001078091)
  (:PATH
   #A((195) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/inputs/raw/data.bin")
   :BYTES 5 :SHA256
   "45f46e8a9e33fa1fecb517abc6a0a63c35ef9bc1920018acf9d65d2a9f3a1fcc"
   :WRITE-DATE 4001078091)
  (:PATH
   #A((203) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/inputs/records/changed.lisp")
   :BYTES 438 :SHA256
   "dbca9d4a05c4aac5b5523019de2c23aa35f35eb13e03cc769c0efb6d57b4d8e4"
   :WRITE-DATE 4001078090)
  (:PATH
   #A((202) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/inputs/records/failed.lisp")
   :BYTES 428 :SHA256
   "9f83f8ac1a1bf99e39ea6af977d8d532e82613d74103b6ae8081662f5429e3aa"
   :WRITE-DATE 4001078090)
  (:PATH
   #A((207) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/inputs/records/gzip/report.lisp")
   :BYTES 310 :SHA256
   "7fffabb3167db69650d50d628155f39e98cb3e024fee539654db92821ab3e0ff"
   :WRITE-DATE 4001078091)
  (:PATH
   #A((210) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/inputs/records/gzip/report.lisp.gz")
   :BYTES 286 :SHA256
   "aaf242eb91dbb470a65dfb76931d425e7a66f57d984a48f9704f71a46bcd13e9"
   :WRITE-DATE 4001078091)
  (:PATH
   #A((198) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/inputs/records/ok.lisp")
   :BYTES 410 :SHA256
   "47c6a080044c043439b081e8a718a0e40c7a2c820f1dfa23c4bd289533570fb0"
   :WRITE-DATE 4001078090)
  (:PATH
   #A((205) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/observations/closed-check.log")
   :BYTES 1556 :SHA256
   "3a0f7a755ecd40e3e5cfd37bad4567eba6f278475ab83e9511cacbbc11d79be0"
   :WRITE-DATE 4001078096)
  (:PATH
   #A((200) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/observations/report.lisp")
   :BYTES 7267 :SHA256
   "b22a6c6fca2df0149ed9028104afcd1678e18c12ef885e1f5c40b18911686df3"
   :WRITE-DATE 4001078096)
  (:PATH
   #A((174) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-02-schema-version/case-result.lisp")
   :BYTES 430 :SHA256
   "376de283858782ceaad5cd3519a609b7d9c3833fb993b1db818d749602be14bb"
   :WRITE-DATE 4001078101)
  (:PATH
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-03-manifest-kind/case-result.lisp")
   :BYTES 428 :SHA256
   "562f9d8e5911b15c99c20b40478366aab50b0908496608915c80138010493ad2"
   :WRITE-DATE 4001078103)
  (:PATH
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-04-date-format/case-result.lisp")
   :BYTES 424 :SHA256
   "046683d938abee495e135776cf5727080ed1405db762b61049bfd76b4b59cb14"
   :WRITE-DATE 4001078105)
  (:PATH
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-05-unknown-trees/case-result.lisp")
   :BYTES 389 :SHA256
   "d7873b5742a32efd12945c5457bb9a766a5255a10c9f501a2d294005ccbf84c6"
   :WRITE-DATE 4001078106)
  (:PATH
   #A((182) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-06-duplicate-manifest-key/case-result.lisp")
   :BYTES 414 :SHA256
   "4b15ec35fe6e36bc7140b2aca1a5b485e0b3786839c35bf5d6d9962522d203aa"
   :WRITE-DATE 4001078108)
  (:PATH
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-07-relative-target/case-result.lisp")
   :BYTES 435 :SHA256
   "537df24e18ed5f54ee85d382d50b6e0be0d3bc6ae3ec5f5ff3313042a1371a26"
   :WRITE-DATE 4001078111)
  (:PATH
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-08-relative-target/case-result.lisp")
   :BYTES 435 :SHA256
   "1dc981e12dcdb0ccb76d18caf0d6958912e8d1df82b196c08028b7b439ccc1e0"
   :WRITE-DATE 4001078114)
  (:PATH
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-09-relative-target/case-result.lisp")
   :BYTES 421 :SHA256
   "85644ab23ee187016de137b6cca71978238c34c0e8efb6b0a693bb1beb222f83"
   :WRITE-DATE 4001078116)
  (:PATH
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-10-relative-target/case-result.lisp")
   :BYTES 423 :SHA256
   "ea8fb7e4e81202435a67ec50b08ee2919fb6903be91b82b94593d699d83f7304"
   :WRITE-DATE 4001078118)
  (:PATH
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-11-relative-target/case-result.lisp")
   :BYTES 424 :SHA256
   "4c46501aa5569d8d8c5af38b612a793a859205241122349d3b7a0bae21556ff9"
   :WRITE-DATE 4001078121)
  (:PATH
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-12-relative-target/case-result.lisp")
   :BYTES 404 :SHA256
   "c22b58a817fea92ae18218bc411b1b2b03d1271ae4e93326ae97258d9ea8cfc4"
   :WRITE-DATE 4001078123)
  (:PATH
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-13-reserved-target/case-result.lisp")
   :BYTES 414 :SHA256
   "da325ebbc8755c3ba9913817721cbea9f45e8956ec43c07f588e7caa9f58b1f2"
   :WRITE-DATE 4001078125)
  (:PATH
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-14-reserved-target/case-result.lisp")
   :BYTES 409 :SHA256
   "fd5b0f71f9285cc2a320c3a934aae7ab513fecf248a9f37149eaa56940b92923"
   :WRITE-DATE 4001078128)
  (:PATH
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-15-reserved-target/case-result.lisp")
   :BYTES 420 :SHA256
   "7426f7231685380ba8034ec607bd33c5eeb6ab9acdb143527e533db85ada1788"
   :WRITE-DATE 4001078130)
  (:PATH
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-16-reserved-target/case-result.lisp")
   :BYTES 418 :SHA256
   "b19a3a164e3082c26a042e90c65ddc45573b98ede8a46bd19624b5e5320b6a4f"
   :WRITE-DATE 4001078132)
  (:PATH
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-17-duplicate-target/case-result.lisp")
   :BYTES 407 :SHA256
   "3f011208cf92fe14f5d8065b35edc09a66bfb61cf2d050a3abb1ffb1c7d4219d"
   :WRITE-DATE 4001078134)
  (:PATH
   #A((184) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-18-file-directory-collision/case-result.lisp")
   :BYTES 432 :SHA256
   "0010bfb8a193495f92e753c1239069192ab75abdc63498c8ae6e89c35376c73b"
   :WRITE-DATE 4001078137)
  (:PATH
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-19-unknown-file-field/case-result.lisp")
   :BYTES 403 :SHA256
   "37c467edd9f06079f026a7b3fa1101d847ad46ea0c28a0cd0395db8e840fd72c"
   :WRITE-DATE 4001078139)
  (:PATH
   #A((181) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-20-unknown-process-field/case-result.lisp")
   :BYTES 407 :SHA256
   "4f24b13f55ee2fa90198e59b218a1fa6632101c6a76c3d7a7b2ce8de7c110390"
   :WRITE-DATE 4001078143)
  (:PATH
   #A((181) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-21-invalid-process-label/case-result.lisp")
   :BYTES 418 :SHA256
   "4f6b5f66040924b65a94e1ec031b251b7274d8c443089a077c2635bd2eb72a65"
   :WRITE-DATE 4001078147)
  (:PATH
   #A((181) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-22-invalid-process-label/case-result.lisp")
   :BYTES 412 :SHA256
   "44c0ae9b602e32e9f050e323e645b370b69aa24f778f201787a37782098ee062"
   :WRITE-DATE 4001078150)
  (:PATH
   #A((183) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-23-duplicate-process-label/case-result.lisp")
   :BYTES 422 :SHA256
   "f474a0d68748073a0a1c5af42b604c2cae8dc9684c5a022a85c1bd68262b9ef6"
   :WRITE-DATE 4001078154)
  (:PATH
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-24-record-not-in-files/case-result.lisp")
   :BYTES 434 :SHA256
   "21e9c6b999bb9636bdb6ddb43132dd81ab0971e18902b9b497f6046dedfc1d0a"
   :WRITE-DATE 4001078157)
  (:PATH
   #A((184) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-25-duplicate-process-record/case-result.lisp")
   :BYTES 437 :SHA256
   "a136468aa9377f8d81927f3d138c639654318cea0afb21daadcf6695a0481951"
   :WRITE-DATE 4001078160)
  (:PATH
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-26-wrong-record-kind/case-result.lisp")
   :BYTES 427 :SHA256
   "9202995af091a61d073bd97fd6bd9c0241146b6b32dc8fe3fba96e36afb3d464"
   :WRITE-DATE 4001078163)
  (:PATH
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-27-nonterminal-record/case-result.lisp")
   :BYTES 438 :SHA256
   "69630261a43472c2eaf8ef8491dd87d7bc83f9193cf6193964e7348ab047757d"
   :WRITE-DATE 4001078167)
  (:PATH
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-28-nonterminal-record/case-result.lisp")
   :BYTES 438 :SHA256
   "38b33ac5fc908f578c63e5c31bdd3c8dcd5e2a3d609a9694ccad28c509c0def3"
   :WRITE-DATE 4001078170)
  (:PATH
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-29-unfinished-record/case-result.lisp")
   :BYTES 436 :SHA256
   "9f42bf836dcfa253415434ee98cf970009eec30b5d7974eaf283b652ed4be1f7"
   :WRITE-DATE 4001078173)
  (:PATH
   #A((183) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-30-invalid-record-metadata/case-result.lisp")
   :BYTES 460 :SHA256
   "48ec904ff1059959715fc49588873479f7c43d30a5a6964d2e94b988db2a6bde"
   :WRITE-DATE 4001078176)
  (:PATH
   #A((180) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-31-ok-with-failing-exit/case-result.lisp")
   :BYTES 416 :SHA256
   "57cc7c5035a79105004db94d6648a56a1aab5558e94d3ad1422c3aa977f6b2cb"
   :WRITE-DATE 4001078180)
  (:PATH
   #A((182) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-32-ok-with-changed-source/case-result.lisp")
   :BYTES 420 :SHA256
   "c18e3dff02715b4f963d3b4353886dda7700daaa8f5c8c14253669418b43868f"
   :WRITE-DATE 4001078184)
  (:PATH
   #A((190) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-33-explicit-gzip-payload-required/case-result.lisp")
   :BYTES 731 :SHA256
   "3d09b89ac6c08e4dcfb11bc49b7c91a636991baccba4650011883fdbf27b0c05"
   :WRITE-DATE 4001078187)
  (:PATH
   #A((208) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-34-accessory-descriptor-also-needs-explicit-payload/case-result.lisp")
   :BYTES 785 :SHA256
   "9c8f76dd03c2959e0176cf56b17268015a16ecf0baaaad08c12fe94af2c9122a"
   :WRITE-DATE 4001078190)
  (:PATH
   #A((219) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-35-accessory-compressed-record-retained-with-payload/archive/archive-index.lisp")
   :BYTES 4375 :SHA256
   "3798e6cd249d7bbac9b4e299ffc2906e6ed4b1189b65f44889d846764bf836e0"
   :WRITE-DATE 4001078194)
  (:PATH
   #A((225) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-35-accessory-compressed-record-retained-with-payload/archive/collection-manifest.lisp")
   :BYTES 1059 :SHA256
   "cf85ef10ac44c32b4701ef9eafb2fc87ca6fcabe944181f98f5917ebf74ccfbd"
   :WRITE-DATE 4001078193)
  (:PATH
   #A((223) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-35-accessory-compressed-record-retained-with-payload/archive/collection-source.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e"
   :WRITE-DATE 4001078193)
  (:PATH
   #A((224) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-35-accessory-compressed-record-retained-with-payload/archive/processes/0/report.lisp")
   :BYTES 410 :SHA256
   "47c6a080044c043439b081e8a718a0e40c7a2c820f1dfa23c4bd289533570fb0"
   :WRITE-DATE 4001078192)
  (:PATH
   #A((224) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-35-accessory-compressed-record-retained-with-payload/archive/processes/1/report.lisp")
   :BYTES 428 :SHA256
   "9f83f8ac1a1bf99e39ea6af977d8d532e82613d74103b6ae8081662f5429e3aa"
   :WRITE-DATE 4001078192)
  (:PATH
   #A((224) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-35-accessory-compressed-record-retained-with-payload/archive/processes/2/report.lisp")
   :BYTES 438 :SHA256
   "dbca9d4a05c4aac5b5523019de2c23aa35f35eb13e03cc769c0efb6d57b4d8e4"
   :WRITE-DATE 4001078192)
  (:PATH
   #A((227) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-35-accessory-compressed-record-retained-with-payload/archive/processes/gzip/report.lisp")
   :BYTES 310 :SHA256
   "7fffabb3167db69650d50d628155f39e98cb3e024fee539654db92821ab3e0ff"
   :WRITE-DATE 4001078193)
  (:PATH
   #A((230) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-35-accessory-compressed-record-retained-with-payload/archive/processes/gzip/report.lisp.gz")
   :BYTES 286 :SHA256
   "aaf242eb91dbb470a65dfb76931d425e7a66f57d984a48f9704f71a46bcd13e9"
   :WRITE-DATE 4001078193)
  (:PATH
   #A((216) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-35-accessory-compressed-record-retained-with-payload/archive/raw/.hidden.txt")
   :BYTES 22 :SHA256
   "6e26b55a3fb204d9259a3c7e6a28b6ccae53f783ccca85f43765649ab9faebcd"
   :WRITE-DATE 4001078193)
  (:PATH
   #A((213) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-35-accessory-compressed-record-retained-with-payload/archive/raw/data.bin")
   :BYTES 5 :SHA256
   "45f46e8a9e33fa1fecb517abc6a0a63c35ef9bc1920018acf9d65d2a9f3a1fcc"
   :WRITE-DATE 4001078193)
  (:PATH
   #A((209) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-35-accessory-compressed-record-retained-with-payload/case-result.lisp")
   :BYTES 387 :SHA256
   "17bc6c3c15e77b544d6b3ddd4615b5d628a1adf3be5b3bbfc51ccd66374965e0"
   :WRITE-DATE 4001078196)
  (:PATH
   #A((220) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-35-accessory-compressed-record-retained-with-payload/inputs/config/manifest.lisp")
   :BYTES 1059 :SHA256
   "cf85ef10ac44c32b4701ef9eafb2fc87ca6fcabe944181f98f5917ebf74ccfbd"
   :WRITE-DATE 4001078191)
  (:PATH
   #A((215) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-35-accessory-compressed-record-retained-with-payload/inputs/raw/.hidden.txt")
   :BYTES 22 :SHA256
   "6e26b55a3fb204d9259a3c7e6a28b6ccae53f783ccca85f43765649ab9faebcd"
   :WRITE-DATE 4001078191)
  (:PATH
   #A((212) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-35-accessory-compressed-record-retained-with-payload/inputs/raw/data.bin")
   :BYTES 5 :SHA256
   "45f46e8a9e33fa1fecb517abc6a0a63c35ef9bc1920018acf9d65d2a9f3a1fcc"
   :WRITE-DATE 4001078191)
  (:PATH
   #A((220) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-35-accessory-compressed-record-retained-with-payload/inputs/records/changed.lisp")
   :BYTES 438 :SHA256
   "dbca9d4a05c4aac5b5523019de2c23aa35f35eb13e03cc769c0efb6d57b4d8e4"
   :WRITE-DATE 4001078190)
  (:PATH
   #A((219) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-35-accessory-compressed-record-retained-with-payload/inputs/records/failed.lisp")
   :BYTES 428 :SHA256
   "9f83f8ac1a1bf99e39ea6af977d8d532e82613d74103b6ae8081662f5429e3aa"
   :WRITE-DATE 4001078190)
  (:PATH
   #A((224) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-35-accessory-compressed-record-retained-with-payload/inputs/records/gzip/report.lisp")
   :BYTES 310 :SHA256
   "7fffabb3167db69650d50d628155f39e98cb3e024fee539654db92821ab3e0ff"
   :WRITE-DATE 4001078191)
  (:PATH
   #A((227) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-35-accessory-compressed-record-retained-with-payload/inputs/records/gzip/report.lisp.gz")
   :BYTES 286 :SHA256
   "aaf242eb91dbb470a65dfb76931d425e7a66f57d984a48f9704f71a46bcd13e9"
   :WRITE-DATE 4001078190)
  (:PATH
   #A((215) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-35-accessory-compressed-record-retained-with-payload/inputs/records/ok.lisp")
   :BYTES 410 :SHA256
   "47c6a080044c043439b081e8a718a0e40c7a2c820f1dfa23c4bd289533570fb0"
   :WRITE-DATE 4001078190)
  (:PATH
   #A((222) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-35-accessory-compressed-record-retained-with-payload/observations/closed-check.log")
   :BYTES 1383 :SHA256
   "fa9b49d9f9a85e2d64039d6f89531d54a5af790bfafde8152f024d2c1ab689f7"
   :WRITE-DATE 4001078195)
  (:PATH
   #A((217) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-35-accessory-compressed-record-retained-with-payload/observations/report.lisp")
   :BYTES 7085 :SHA256
   "2144a25d74ebe126e386daaf5e1cac703066209caab5a0947fa95b5146887e14"
   :WRITE-DATE 4001078195)
  (:PATH
   #A((193) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-36-gzip-target-must-match-descriptor/case-result.lisp")
   :BYTES 740 :SHA256
   "9022a1c81f1557eb440c4c3b593e810894db6d6dae22ccebb563488f15b9aa97"
   :WRITE-DATE 4001078199)
  (:PATH
   #A((184) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-37-descriptor-hash-mismatch/case-result.lisp")
   :BYTES 872 :SHA256
   "8c60a3242ad4352eef0ae0da036c3f84d1c55ef8029286791c7c3c3e684c58ad"
   :WRITE-DATE 4001078202)
  (:PATH
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-38-source-leaf-symlink/case-result.lisp")
   :BYTES 628 :SHA256
   "43c793b7730d843174afa0de0bc5993b2988b1edcfedf0f76650610484915997"
   :WRITE-DATE 4001078204)
  (:PATH
   #A((191) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-39-plain-budget-exact-boundary/archive/raw/data.bin")
   :BYTES 1048576 :SHA256
   "b6ed6d55500a071044b173c0cdce6f2e622420ebe016b88df4b63a091c63e84c"
   :WRITE-DATE 4001078206)
  (:PATH
   #A((187) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-39-plain-budget-exact-boundary/case-result.lisp")
   :BYTES 347 :SHA256
   "52263a8679e459613af5f97af24be2c737e338251ebb5fb56ef14de280c7ef4c"
   :WRITE-DATE 4001078210)
  (:PATH
   #A((190) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-39-plain-budget-exact-boundary/inputs/raw/data.bin")
   :BYTES 1048576 :SHA256
   "b6ed6d55500a071044b173c0cdce6f2e622420ebe016b88df4b63a091c63e84c"
   :WRITE-DATE 4001078204)
  (:PATH
   #A((189) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-40-gzip-budget-exact-boundary/archive/raw/data.gz")
   :BYTES 8388608 :SHA256
   "cdddc46149beec05c8484353f3dbcb27546e6f607697131921b0c14614ae05dd"
   :WRITE-DATE 4001078214)
  (:PATH
   #A((186) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-40-gzip-budget-exact-boundary/case-result.lisp")
   :BYTES 344 :SHA256
   "a3c5108bc865022be47849d5d84deb4294bd873c937d10f9e3272420b18991d6"
   :WRITE-DATE 4001078218)
  (:PATH
   #A((189) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-40-gzip-budget-exact-boundary/inputs/raw/data.bin")
   :BYTES 8388608 :SHA256
   "cdddc46149beec05c8484353f3dbcb27546e6f607697131921b0c14614ae05dd"
   :WRITE-DATE 4001078210)
  (:PATH
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-41-plain-budget-over/case-result.lisp")
   :BYTES 418 :SHA256
   "da172b09cde75062c269e146849bb199f9b737330163974341b521db8add0aa4"
   :WRITE-DATE 4001078221)
  (:PATH
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-42-gzip-budget-over/case-result.lisp")
   :BYTES 415 :SHA256
   "3860ad87496a7348d467e51a31ea239d0a50f245ad931b0b3070e14e3fc8aaf3"
   :WRITE-DATE 4001078223)
  (:PATH
   #A((198) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-43-existing-destination-never-overwritten/case-result.lisp")
   :BYTES 634 :SHA256
   "ddb7eb4449eecc2aed2ab0ed78c8f239e5bb0b3e2ae19ffbae2f97a460a9e1ae"
   :WRITE-DATE 4001078225)
  (:PATH
   #A((199) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-44-existing-observations-never-overwritten/case-result.lisp")
   :BYTES 644 :SHA256
   "5c59fca139bf400f61698ff5880b13984f52ce502c20519f831b912786fe11d2"
   :WRITE-DATE 4001078227)
  (:PATH
   #A((192) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-45-destination-observations-overlap/case-result.lisp")
   :BYTES 467 :SHA256
   "9e0564e37f65ff1e408603a1d3fbcbdd2d72d94f141f9a42f6cb0f73bd3609ad"
   :WRITE-DATE 4001078229)
  (:PATH
   #A((192) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-46-destination-observations-overlap/case-result.lisp")
   :BYTES 467 :SHA256
   "79f7cd0532189c6b743979f5b1694771bb94c21dbcad2fabd7d96b9ed6e0e4e6"
   :WRITE-DATE 4001078231)
  (:PATH
   #A((192) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-47-destination-observations-overlap/case-result.lisp")
   :BYTES 467 :SHA256
   "4bb3077411dc54edb0ad739c1ea6076c6712d468a0973968c1be1437ec931384"
   :WRITE-DATE 4001078233)
  (:PATH
   #A((188) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-48-corrupt-copy-retains-failure/case-result.lisp")
   :BYTES 598 :SHA256
   "33b19f335b20364815c344f6703b4c68733c55a36fe460fb658481ba93d9f0c4"
   :WRITE-DATE 4001078238)
  (:PATH
   #A((196) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-48-corrupt-copy-retains-failure/observations/report.lisp")
   :BYTES 5513 :SHA256
   "0a54ca25efdba1a052f78a9174111dad15f7482f21664710592760879def8d04"
   :WRITE-DATE 4001078237)
  (:PATH
   #A((189) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-49-source-change-retains-failure/case-result.lisp")
   :BYTES 604 :SHA256
   "f0326f6b943dda31c9e19dc9819b3a705f8e9045e372131644e63bf2e1181de4"
   :WRITE-DATE 4001078243)
  (:PATH
   #A((197) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-49-source-change-retains-failure/observations/report.lisp")
   :BYTES 5528 :SHA256
   "1fd596e931ae919004dc2d4ef9aca311ecae6d8487edba9effa01a8723a5ffba"
   :WRITE-DATE 4001078242)
  (:PATH
   #A((213) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-50-unindexed-extra-rejected-by-final-checker/archive/.unindexed-extra.bin")
   :BYTES 2 :SHA256
   "39fd47ddacec9ce0f0a5397d7c528baa728ec2e58898da7cae2456a1397621df"
   :WRITE-DATE 4001078247)
  (:PATH
   #A((201) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-50-unindexed-extra-rejected-by-final-checker/case-result.lisp")
   :BYTES 981 :SHA256
   "603e765372131f843b497a4171a58c94456a68a994b9d1915e62f02c1025da61"
   :WRITE-DATE 4001078250)
  (:PATH
   #A((214) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-50-unindexed-extra-rejected-by-final-checker/observations/closed-check.log")
   :BYTES 161 :SHA256
   "36c547965bf7e5fb5aac2991d98c4e6f27d0783eb616501721e8f35c9202c18e"
   :WRITE-DATE 4001078249)
  (:PATH
   #A((209) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-50-unindexed-extra-rejected-by-final-checker/observations/report.lisp")
   :BYTES 5791 :SHA256
   "11af25aac61852178f5e2a72a57f0dab135a54f3ac5d08d75c423f0fd5664017"
   :WRITE-DATE 4001078249)
  (:PATH
   #A((187) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-51-manifest-read-eval-disabled/case-result.lisp")
   :BYTES 775 :SHA256
   "3533ac12f2158f67b6e231530dad94d703078f68c958bc7598398f0989ba31b9"
   :WRITE-DATE 4001078252)
  (:PATH
   #A((181) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-52-manifest-eof-required/case-result.lisp")
   :BYTES 398 :SHA256
   "11d47f47f8c8e05f4c225461e57405d9413a6a33af1f2b42e02e23aaec160476"
   :WRITE-DATE 4001078254)
  (:PATH
   #A((185) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-53-record-read-eval-disabled/case-result.lisp")
   :BYTES 764 :SHA256
   "b3ba6eccbd7d97218471b22a4c8f45d7752763c6143f19722ab33a6f0f92f6e3"
   :WRITE-DATE 4001078256)
  (:PATH
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-54-record-eof-required/case-result.lisp")
   :BYTES 394 :SHA256
   "f38bb3e2baec476cd0a62c4d27a133fa10b0de8c8d6b452f89e1cd006f1bd7c1"
   :WRITE-DATE 4001078259)
  (:PATH
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-55-cli-arguments/case-result.lisp")
   :BYTES 267 :SHA256
   "0159b9967795d3456cc885374840ee47fb31d11fe1c578a898395d88268dcbc2"
   :WRITE-DATE 4001078260)
  (:PATH
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-56-cli-arguments/case-result.lisp")
   :BYTES 267 :SHA256
   "0a0e0bf799501d9309f432998434aca7214b7e20834ff72910b6d3b81f0acf0a"
   :WRITE-DATE 4001078260)
  (:PATH
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-57-cli-arguments/case-result.lisp")
   :BYTES 267 :SHA256
   "f34e896e86f642b3fd1c985e8238691345c82e40ee9d950e799f300772ac9c5b"
   :WRITE-DATE 4001078261)
  (:PATH
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-58-cli-arguments/case-result.lisp")
   :BYTES 267 :SHA256
   "4691dd4988e3b7b866b2a2e10178eb074d27e0d6191e6a209f09ac3ad3b142db"
   :WRITE-DATE 4001078261)
  (:PATH
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-59-cli-arguments/case-result.lisp")
   :BYTES 267 :SHA256
   "5171e5c24431fb63a2a63a313a2e387597d21623bd24d83d3b3ba7b81dff9518"
   :WRITE-DATE 4001078262)
  (:PATH
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/self-test-report.lisp")
   :BYTES 28759 :SHA256
   "dd03612e092444df2f040bf700069982d5579bf6d3f6f0fbd0e833b83501c036"
   :WRITE-DATE 4001078262)
  (:PATH
   #A((194) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-01-explicit-closed-parallel-history/case-result.lisp")
   :BYTES 407 :SHA256
   "20ac8f7b25b0f6396d35a61077f54edc4449d19cc392823d31de6c31927863e6"
   :WRITE-DATE 4001077814)
  (:PATH
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-02-schema-version/case-result.lisp")
   :BYTES 406 :SHA256
   "87ff57c26425524bd8f31a11856aa9f022fb1079375752754e27d8fc63512e61"
   :WRITE-DATE 4001077815)
  (:PATH
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-03-manifest-kind/case-result.lisp")
   :BYTES 404 :SHA256
   "0dd8581ea268df0f42050f3b9cac35415bab87e636e787118ee0f675836588fe"
   :WRITE-DATE 4001077816)
  (:PATH
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-04-date-format/case-result.lisp")
   :BYTES 400 :SHA256
   "a74cee7d05d34f02ada2d04b550e832983c8c26955149bbdc3f89f280e0df373"
   :WRITE-DATE 4001077817)
  (:PATH
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-05-unknown-trees/case-result.lisp")
   :BYTES 399 :SHA256
   "888537a037d417755e6ccd82249900315688c1739330eb37702230c21087941c"
   :WRITE-DATE 4001077819)
  (:PATH
   #A((184) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-06-duplicate-manifest-key/case-result.lisp")
   :BYTES 422 :SHA256
   "cd1d70d41d8b35d9e5d75515a5a359a67ef6be087e37883161a64c0bcbe8dafd"
   :WRITE-DATE 4001077820)
  (:PATH
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-07-relative-target/case-result.lisp")
   :BYTES 405 :SHA256
   "ef5eacea0a7e812d3d01de9a8f24f8ef8673a5a374a78869fe4efb04ba8a19b1"
   :WRITE-DATE 4001077822)
  (:PATH
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-08-relative-target/case-result.lisp")
   :BYTES 405 :SHA256
   "2cc4590a0fb3de0c78425ba8a74ff07bf1561299868c4444d19ec588cf7d6796"
   :WRITE-DATE 4001077824)
  (:PATH
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-09-relative-target/case-result.lisp")
   :BYTES 405 :SHA256
   "4a2d8fa3da0da53972926c4004e85e0818f79f2efe245c401dfc7766b981abfe"
   :WRITE-DATE 4001077826)
  (:PATH
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-10-relative-target/case-result.lisp")
   :BYTES 406 :SHA256
   "26852bdc1244861ee13bde8fac6934f38e6473ca735cc9cd36ebc0bf5315011e"
   :WRITE-DATE 4001077829)
  (:PATH
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-11-relative-target/case-result.lisp")
   :BYTES 406 :SHA256
   "939e2112614d408d9e0f7a1ce776e009b37fdef3aded241d6cac17dc6364f4b4"
   :WRITE-DATE 4001077831)
  (:PATH
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-12-relative-target/case-result.lisp")
   :BYTES 406 :SHA256
   "3c4fd559662e31b39c30c8d9b2022817b6240085777f2f4a7edd7e97090c3bb3"
   :WRITE-DATE 4001077834)
  (:PATH
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-13-reserved-target/case-result.lisp")
   :BYTES 409 :SHA256
   "2e3e941881aa7a0c0e6542737d42d4e8c9c9439006f8173ab8b06e1aaa9b379e"
   :WRITE-DATE 4001077835)
  (:PATH
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-14-reserved-target/case-result.lisp")
   :BYTES 409 :SHA256
   "ebcfc57b2eba6c86cb426c12fcc8060a00ecf1241393e042ed0bf6c2cd5b4461"
   :WRITE-DATE 4001077836)
  (:PATH
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-15-reserved-target/case-result.lisp")
   :BYTES 409 :SHA256
   "8c02400c9d28d790842c1d70adad6fd7f8628d6a066395dacfde7521fa7c4207"
   :WRITE-DATE 4001077837)
  (:PATH
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-16-reserved-target/case-result.lisp")
   :BYTES 409 :SHA256
   "f784f95bb67e73a3ff8f0d3c5b50e5758f497069ecdef73e5ecec43cb969d6a9"
   :WRITE-DATE 4001077839)
  (:PATH
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-17-duplicate-target/case-result.lisp")
   :BYTES 413 :SHA256
   "99cada29e4cba2c0c871e85d83c28f19f32febee610c0bf51d441674801f230b"
   :WRITE-DATE 4001077840)
  (:PATH
   #A((186) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-18-file-directory-collision/case-result.lisp")
   :BYTES 426 :SHA256
   "23bebcd58c02ec16dd46fafe493010fde94e4f1b72df098d319ef9fca31412bc"
   :WRITE-DATE 4001077841)
  (:PATH
   #A((180) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-19-unknown-file-field/case-result.lisp")
   :BYTES 410 :SHA256
   "772292311cf44d791eceeae2cf17b446bacc957ddc0d628dcf0acd5dd6bc1409"
   :WRITE-DATE 4001077842)
  (:PATH
   #A((183) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-20-unknown-process-field/case-result.lisp")
   :BYTES 416 :SHA256
   "7f2131d1accb7fc0793e4b7c1e54049dc3e7e6064a7df6cfe5d5c0f35dfcc44a"
   :WRITE-DATE 4001077843)
  (:PATH
   #A((183) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-21-invalid-process-label/case-result.lisp")
   :BYTES 419 :SHA256
   "40b1ab323f5e3b066a48c858fe558c2fa9f21b3981ccefd90c46f704a5a3f622"
   :WRITE-DATE 4001077845)
  (:PATH
   #A((183) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-22-invalid-process-label/case-result.lisp")
   :BYTES 419 :SHA256
   "1a0be218f1d0cb53edfbbbea6bb248cd9c0dc9b8d169cf1f5a3cea5afc5e6bb5"
   :WRITE-DATE 4001077846)
  (:PATH
   #A((185) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-23-duplicate-process-label/case-result.lisp")
   :BYTES 423 :SHA256
   "78cf214d1b47f62aa1206f2c8f60934e52b6aedb2aa44cdf4b498b3fbe067391"
   :WRITE-DATE 4001077847)
  (:PATH
   #A((181) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-24-record-not-in-files/case-result.lisp")
   :BYTES 416 :SHA256
   "5ed637b3d8a6a189a8a980df20d3c97d9e7df40e364d394cabc3dd79480e0f8e"
   :WRITE-DATE 4001077848)
  (:PATH
   #A((186) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-25-duplicate-process-record/case-result.lisp")
   :BYTES 426 :SHA256
   "e4bd525dff7d12663ec7e227601e2b6bc00447effd861818f983449b4a859ca8"
   :WRITE-DATE 4001077849)
  (:PATH
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-26-wrong-record-kind/case-result.lisp")
   :BYTES 412 :SHA256
   "9f45a3373dddae06f660c30706ac91f0cbe4a2e57d3c3a68823a9594da826e8b"
   :WRITE-DATE 4001077850)
  (:PATH
   #A((180) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-27-nonterminal-record/case-result.lisp")
   :BYTES 419 :SHA256
   "e0eb52e6d30def9a55f3a7751631a3e5b90b603c08a17be70c41d3ef8ea19c66"
   :WRITE-DATE 4001077852)
  (:PATH
   #A((180) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-28-nonterminal-record/case-result.lisp")
   :BYTES 419 :SHA256
   "088362600895a67f3bdeb3d977e60eb5784d7aa0e66753b28da12c1f96def630"
   :WRITE-DATE 4001077853)
  (:PATH
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-29-unfinished-record/case-result.lisp")
   :BYTES 417 :SHA256
   "952b392e97c6d7cf35ffe8dfd1175b9b84e6cc626566b7bb692971e796dec17e"
   :WRITE-DATE 4001077854)
  (:PATH
   #A((185) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-30-invalid-record-metadata/case-result.lisp")
   :BYTES 427 :SHA256
   "ded4b8148f301637d104bbad5a84ee6dd986f924a94a53e0cc52147e52204877"
   :WRITE-DATE 4001077855)
  (:PATH
   #A((182) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-31-ok-with-failing-exit/case-result.lisp")
   :BYTES 421 :SHA256
   "752f0a7ac9d23bcc646030332888f99abe5e791d5f304bc6a05e4f640f706e60"
   :WRITE-DATE 4001077857)
  (:PATH
   #A((184) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-32-ok-with-changed-source/case-result.lisp")
   :BYTES 425 :SHA256
   "692b2345d85d821424e75e001506736f0d0d7bb56abf4f17ebc9d2911d2a6edd"
   :WRITE-DATE 4001077858)
  (:PATH
   #A((192) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-33-explicit-gzip-payload-required/case-result.lisp")
   :BYTES 438 :SHA256
   "d0f4a7ee53811021813aa3fcc301f54c67ae12ebf4a40dd6698954ca0eae94be"
   :WRITE-DATE 4001077861)
  (:PATH
   #A((210) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-34-accessory-descriptor-also-needs-explicit-payload/case-result.lisp")
   :BYTES 475 :SHA256
   "91ba800bd66898f7cde4368e6136d8f5a254e2b2e7c187641682b469fe1f3228"
   :WRITE-DATE 4001077862)
  (:PATH
   #A((211) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-35-accessory-compressed-record-retained-with-payload/case-result.lisp")
   :BYTES 443 :SHA256
   "2948ad500d7568f9cca48067530dc44f2568878094be82335dda097574cc05e2"
   :WRITE-DATE 4001077864)
  (:PATH
   #A((195) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-36-gzip-target-must-match-descriptor/case-result.lisp")
   :BYTES 444 :SHA256
   "7acde4e4333b82aa84857faee116c3429a299d50b63c8687475e770ec1e6729f"
   :WRITE-DATE 4001077865)
  (:PATH
   #A((186) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-37-descriptor-hash-mismatch/case-result.lisp")
   :BYTES 426 :SHA256
   "5ec35f623a6b790ad431fd0e1cc945edf28a778420240e69ebb700de0ad7fe5a"
   :WRITE-DATE 4001077867)
  (:PATH
   #A((181) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-38-source-leaf-symlink/case-result.lisp")
   :BYTES 420 :SHA256
   "d194040e0eeafb65aaa8d5af81bf5b6f6746780697e2cf8105581e1112662686"
   :WRITE-DATE 4001077868)
  (:PATH
   #A((189) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-39-plain-budget-exact-boundary/case-result.lisp")
   :BYTES 398 :SHA256
   "c0758ce53b47f77a21dda6d643c7e86c4e766be31b06d9f71ecca3ea0d0d849a"
   :WRITE-DATE 4001077869)
  (:PATH
   #A((188) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-40-gzip-budget-exact-boundary/case-result.lisp")
   :BYTES 396 :SHA256
   "ba8affd1a405d100f63d3abc0601d3af79dc18f9a6dbe8feeb2598f597a615a2"
   :WRITE-DATE 4001077871)
  (:PATH
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-41-plain-budget-over/case-result.lisp")
   :BYTES 409 :SHA256
   "3da2e8544cc672d343891323d0db663b3e7a1c21f1b6e8ab4f06ba4361fef2a1"
   :WRITE-DATE 4001077872)
  (:PATH
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-42-gzip-budget-over/case-result.lisp")
   :BYTES 407 :SHA256
   "6de1ed9883219f27460065617f006232c6827dcf6a394f8552c2ce3aa2cc7c8f"
   :WRITE-DATE 4001077874)
  (:PATH
   #A((200) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-43-existing-destination-never-overwritten/case-result.lisp")
   :BYTES 461 :SHA256
   "e4fcb86513f3eb6d7a43f9a1c9e5c0e431cb7f0a9e0dfb305c83d3f4f84e4552"
   :WRITE-DATE 4001077875)
  (:PATH
   #A((201) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-44-existing-observations-never-overwritten/case-result.lisp")
   :BYTES 464 :SHA256
   "33e235b973576784ea239315f9a72d086a625c1b17062b21d5407ce550b548df"
   :WRITE-DATE 4001077876)
  (:PATH
   #A((194) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-45-destination-observations-overlap/case-result.lisp")
   :BYTES 440 :SHA256
   "7129fbea3e087df6d2cd6ee5c54c4a3758e3fc7c1ddfa523c9f4df89487cc150"
   :WRITE-DATE 4001077877)
  (:PATH
   #A((194) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-46-destination-observations-overlap/case-result.lisp")
   :BYTES 440 :SHA256
   "737a685790f00dedcda2c6e88dabdabb7b6bcfbdd333f71e63ca936b96080b9f"
   :WRITE-DATE 4001077878)
  (:PATH
   #A((194) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-47-destination-observations-overlap/case-result.lisp")
   :BYTES 440 :SHA256
   "64c679e1e9bee3a1a8658cdb0b7ed0fbe7b151eeb2ebd50479d841f794a17641"
   :WRITE-DATE 4001077879)
  (:PATH
   #A((190) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-48-corrupt-copy-retains-failure/case-result.lisp")
   :BYTES 432 :SHA256
   "bc524a33502a3da107b941219d8c175e35ef0a37011c91ddb2b8d48f10a4556f"
   :WRITE-DATE 4001077881)
  (:PATH
   #A((191) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-49-source-change-retains-failure/case-result.lisp")
   :BYTES 436 :SHA256
   "a0efee3510fe96dc87c777bfe557080d7e9f5ef0db2437bf8feda269dc393929"
   :WRITE-DATE 4001077881)
  (:PATH
   #A((203) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-50-unindexed-extra-rejected-by-final-checker/case-result.lisp")
   :BYTES 458 :SHA256
   "56b5afe6f15eacab124fc4968240f06c028aa2cfeabe9cf21e466502fdc3609c"
   :WRITE-DATE 4001077882)
  (:PATH
   #A((189) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-51-manifest-read-eval-disabled/case-result.lisp")
   :BYTES 428 :SHA256
   "98c255b6d0e8b9bc2582d810f6aab9c0b64ca99e710f0e254bf7ab75e2e178ea"
   :WRITE-DATE 4001077884)
  (:PATH
   #A((183) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-52-manifest-eof-required/case-result.lisp")
   :BYTES 416 :SHA256
   "160623c97fc3df724668ddbe1a90ed43c6e0becdad736e3b09907b6dfe470f2f"
   :WRITE-DATE 4001077885)
  (:PATH
   #A((187) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-53-record-read-eval-disabled/case-result.lisp")
   :BYTES 424 :SHA256
   "f80870c67fde4eee72918329bc743e7d70f4c3301a2a4936c04ba3a98b44da4d"
   :WRITE-DATE 4001077886)
  (:PATH
   #A((181) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-54-record-eof-required/case-result.lisp")
   :BYTES 412 :SHA256
   "015d3d591bd7ec45433f8df8a8669fdab672e1a2de2f2dc1f5d8555ea2be2683"
   :WRITE-DATE 4001077887)
  (:PATH
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-55-cli-arguments/case-result.lisp")
   :BYTES 269 :SHA256
   "925f36989ef4132a9739cafcd7e4321916dee850c85be47f538ac02173d4a105"
   :WRITE-DATE 4001077887)
  (:PATH
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-56-cli-arguments/case-result.lisp")
   :BYTES 269 :SHA256
   "a8d076a41587c79d569ab2660fb7688f3853fcd17289ef211f93d0b11984b277"
   :WRITE-DATE 4001077888)
  (:PATH
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-57-cli-arguments/case-result.lisp")
   :BYTES 269 :SHA256
   "f6525d1db2eb80695c8a5c3e95d6cf9116da3f71f42f758cd352b6e390ac1b4c"
   :WRITE-DATE 4001077889)
  (:PATH
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-58-cli-arguments/case-result.lisp")
   :BYTES 269 :SHA256
   "f957597886a2dfed980680f3d69380f0896bdd9739407e90f076bdaf276d3b25"
   :WRITE-DATE 4001077889)
  (:PATH
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-59-cli-arguments/case-result.lisp")
   :BYTES 269 :SHA256
   "93ec06cc0514a259f82fbcfc6eb53179b688a0f1c88447d5dd995b9e89b84044"
   :WRITE-DATE 4001077890)
  (:PATH
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/self-test-report.lisp")
   :BYTES 25000 :SHA256
   "fc29ef8504c3fb7152a31cf0b886e58f289f752d386a88ed84a1a23f91bbb768"
   :WRITE-DATE 4001077890)
  (:PATH
   #A((184) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-01-explicit-closed-parallel-history/case-result.lisp")
   :BYTES 406 :SHA256
   "32e0c2970b819e431640042f31af531bbc335ef716edd92bb8c4906a7b47d8b1"
   :WRITE-DATE 4001077908)
  (:PATH
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-02-schema-version/case-result.lisp")
   :BYTES 405 :SHA256
   "e200fa74a4ed9b9683bc7f95710a2e6ce7f241682b095190c1437603f73e58aa"
   :WRITE-DATE 4001077909)
  (:PATH
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-03-manifest-kind/case-result.lisp")
   :BYTES 403 :SHA256
   "e0d4b1495213545f5278c72c6e5e217fe0b4311163a046de04b774f35f2f8e8f"
   :WRITE-DATE 4001077910)
  (:PATH
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-04-date-format/case-result.lisp")
   :BYTES 399 :SHA256
   "71a08597d4d6d6c0137f9fa85347f697695ff8f92327a7f0505975304c60bd29"
   :WRITE-DATE 4001077911)
  (:PATH
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-05-unknown-trees/case-result.lisp")
   :BYTES 398 :SHA256
   "d30f93bdc3ecdb088d948be3ab0b41a7046922c3f33132610aaa6d4a6480c802"
   :WRITE-DATE 4001077912)
  (:PATH
   #A((174) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-06-duplicate-manifest-key/case-result.lisp")
   :BYTES 421 :SHA256
   "83321691d8789d4b78a6b138765bb18d88c4b421968e176659b4b94c1588d8ee"
   :WRITE-DATE 4001077913)
  (:PATH
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-07-relative-target/case-result.lisp")
   :BYTES 404 :SHA256
   "4203254a1b10cef75a7c1a26f3f85ca71be92795a8c51a3328b77590c0233e7c"
   :WRITE-DATE 4001077915)
  (:PATH
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-08-relative-target/case-result.lisp")
   :BYTES 404 :SHA256
   "91911bc9fcc2581ed924a09f144f73b39a1cc6cddce5ae7abe3b60bffc72476f"
   :WRITE-DATE 4001077917)
  (:PATH
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-09-relative-target/case-result.lisp")
   :BYTES 404 :SHA256
   "81823a5700b69070ffa699310373f2b7fbddc8e79c1e3b9357a4b6959f37d886"
   :WRITE-DATE 4001077918)
  (:PATH
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-10-relative-target/case-result.lisp")
   :BYTES 405 :SHA256
   "b2953c1d77e934f82ad3df29f5e70411c77db4b7e1fa88f68febceb64bf544e3"
   :WRITE-DATE 4001077920)
  (:PATH
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-11-relative-target/case-result.lisp")
   :BYTES 405 :SHA256
   "2b21bfa733f75409c6fa5c7a58aa2d43c974735de72462e75b05955a284365a1"
   :WRITE-DATE 4001077922)
  (:PATH
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-12-relative-target/case-result.lisp")
   :BYTES 405 :SHA256
   "31bc3a9aee9f4898311e2aff4d215d91268aa57b66b44338e1c7f2833371d604"
   :WRITE-DATE 4001077924)
  (:PATH
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-13-reserved-target/case-result.lisp")
   :BYTES 408 :SHA256
   "6c539c6c4ae22beaaa8f6a476cb33441910fc64b2d2e43828abc5812b6136466"
   :WRITE-DATE 4001077925)
  (:PATH
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-14-reserved-target/case-result.lisp")
   :BYTES 408 :SHA256
   "e2f91b1dc6f792432be10aa3cf652ccd6d6aa401ca3264db8eab0bcf130d6772"
   :WRITE-DATE 4001077927)
  (:PATH
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-15-reserved-target/case-result.lisp")
   :BYTES 408 :SHA256
   "5d8c1ce79734148363a688d4347b7f6a41b74eeefa5fcbded19ae53dbfcf33da"
   :WRITE-DATE 4001077928)
  (:PATH
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-16-reserved-target/case-result.lisp")
   :BYTES 408 :SHA256
   "32ce4e03412b275c181b7e217de1707f874d49afdd81bb87d60292822b0301bb"
   :WRITE-DATE 4001077929)
  (:PATH
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-17-duplicate-target/case-result.lisp")
   :BYTES 412 :SHA256
   "2fbfc963c0de8989a5ca356610bb5ffea2fb915b515e4de1c060becc0ebcd0e0"
   :WRITE-DATE 4001077930)
  (:PATH
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-18-file-directory-collision/case-result.lisp")
   :BYTES 425 :SHA256
   "569c2bb9fe21372449dd975fa273dad8de8936f7f6592441d618a06dcc70d071"
   :WRITE-DATE 4001077931)
  (:PATH
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-19-unknown-file-field/case-result.lisp")
   :BYTES 409 :SHA256
   "8e29e9a5814469a75cf2eb2b63a724295e66c55290f6d5653120abbeb4075172"
   :WRITE-DATE 4001077932)
  (:PATH
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-20-unknown-process-field/case-result.lisp")
   :BYTES 415 :SHA256
   "dae4107cd0d160bf04d7b737cdb7c3b2bf8d614fb5ad3df4883f08be3b50d915"
   :WRITE-DATE 4001077933)
  (:PATH
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-21-invalid-process-label/case-result.lisp")
   :BYTES 418 :SHA256
   "14178884570de69b2478f3e062faa997b6248d14bd84fd9d4bd45de16d15121d"
   :WRITE-DATE 4001077934)
  (:PATH
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-22-invalid-process-label/case-result.lisp")
   :BYTES 418 :SHA256
   "059ffad36ad39adbd8a2f90d530c590e0871ba426eae3e4452330a62c95ca632"
   :WRITE-DATE 4001077936)
  (:PATH
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-23-duplicate-process-label/case-result.lisp")
   :BYTES 422 :SHA256
   "d0c68e901fdaece25842347bdb5e70bf5a019fe3f4d6c549dcd61e03c8c952b2"
   :WRITE-DATE 4001077937)
  (:PATH
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-24-record-not-in-files/case-result.lisp")
   :BYTES 415 :SHA256
   "42116ea5ed7df6b2cc895e8ac5e73094794855d02bb972be97f49e45be033736"
   :WRITE-DATE 4001077938)
  (:PATH
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-25-duplicate-process-record/case-result.lisp")
   :BYTES 425 :SHA256
   "5a5dd9dc9b59530114901c7a9497efea51129dd560466b1b5dfeb32a6101315b"
   :WRITE-DATE 4001077939)
  (:PATH
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-26-wrong-record-kind/case-result.lisp")
   :BYTES 411 :SHA256
   "91f9f4f885808d4473fd121d9eb41546779693d562f281d59ad6ad152351b75d"
   :WRITE-DATE 4001077940)
  (:PATH
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-27-nonterminal-record/case-result.lisp")
   :BYTES 418 :SHA256
   "5ecb9f98bd101e44e2fe3140f80e00d2910cdb89152937f0535ea0af438ab7c8"
   :WRITE-DATE 4001077941)
  (:PATH
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-28-nonterminal-record/case-result.lisp")
   :BYTES 418 :SHA256
   "99ee39297b19520d8ef4e6e9df1c33f4b72ec623815b5442024fe1a7ca24e27d"
   :WRITE-DATE 4001077942)
  (:PATH
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-29-unfinished-record/case-result.lisp")
   :BYTES 416 :SHA256
   "ae6f32ff459e3532f08e9762d225a870485d743c56504441d29540a87690ce47"
   :WRITE-DATE 4001077943)
  (:PATH
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-30-invalid-record-metadata/case-result.lisp")
   :BYTES 426 :SHA256
   "15aa2a50d78d6c81c4559979b95cc40e771089fb4d18d81864485670276dbe40"
   :WRITE-DATE 4001077944)
  (:PATH
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-31-ok-with-failing-exit/case-result.lisp")
   :BYTES 420 :SHA256
   "f9d9fc758312c02a52663391888f65d5d2b5aee3108f857a41e128142b5f28bf"
   :WRITE-DATE 4001077945)
  (:PATH
   #A((174) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-32-ok-with-changed-source/case-result.lisp")
   :BYTES 424 :SHA256
   "952d0df554b99b301cb3873cb09d2e045311d0d371b63bdfb9ec30c7884b9aae"
   :WRITE-DATE 4001077946)
  (:PATH
   #A((182) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-33-explicit-gzip-payload-required/case-result.lisp")
   :BYTES 437 :SHA256
   "6d589afe4902cd3656877f24eaf81062e81189a26fda2629f7a75b7eeb97a15a"
   :WRITE-DATE 4001077947)
  (:PATH
   #A((200) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-34-accessory-descriptor-also-needs-explicit-payload/case-result.lisp")
   :BYTES 474 :SHA256
   "1b4353770e9c334c924e5f8705a149d31ad2bcae101ac6807b86ace1c6d2a3ad"
   :WRITE-DATE 4001077948)
  (:PATH
   #A((201) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-35-accessory-compressed-record-retained-with-payload/case-result.lisp")
   :BYTES 442 :SHA256
   "4b00eb470d861b8d2edcc0ee5de77bd537b2c4588507f078b86fd02e3900464f"
   :WRITE-DATE 4001077949)
  (:PATH
   #A((185) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-36-gzip-target-must-match-descriptor/case-result.lisp")
   :BYTES 443 :SHA256
   "26dc1a2f5221c2ae4b4b2abe374caee143a3430acdec35d78279b68aab1fe354"
   :WRITE-DATE 4001077950)
  (:PATH
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-37-descriptor-hash-mismatch/case-result.lisp")
   :BYTES 425 :SHA256
   "3749ccc01967b9c23af4e3df666fa1df8105b30d2ea84d490c08ad91abe5673c"
   :WRITE-DATE 4001077951)
  (:PATH
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-38-source-leaf-symlink/case-result.lisp")
   :BYTES 419 :SHA256
   "bbb8425a16859c502f186e808d7addcce193db16610156dddb8d4f9f1c0b0aa3"
   :WRITE-DATE 4001077952)
  (:PATH
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-39-plain-budget-exact-boundary/case-result.lisp")
   :BYTES 397 :SHA256
   "25ed82d62db095aabe4bb20290e5130a5472887e580248cb60f86fc2e700ea29"
   :WRITE-DATE 4001077953)
  (:PATH
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-40-gzip-budget-exact-boundary/case-result.lisp")
   :BYTES 395 :SHA256
   "1dbaf3ce232691e2b0733136798bd3b506d89807b15a8d8313c56cf820382aa6"
   :WRITE-DATE 4001077954)
  (:PATH
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-41-plain-budget-over/case-result.lisp")
   :BYTES 408 :SHA256
   "36d95630004e234548f39a92330976fc1b4d7a6471f919552ce248e4749a1a11"
   :WRITE-DATE 4001077955)
  (:PATH
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-42-gzip-budget-over/case-result.lisp")
   :BYTES 406 :SHA256
   "a80da23d721c5081fdc6a3c2d68a9a32237f0c60c1cce30e95788a1f214e5fd0"
   :WRITE-DATE 4001077957)
  (:PATH
   #A((190) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-43-existing-destination-never-overwritten/case-result.lisp")
   :BYTES 460 :SHA256
   "d6b640aa626c97d05491ded0e6e9651b1802feb18760c2da6dde1110c1bae704"
   :WRITE-DATE 4001077958)
  (:PATH
   #A((191) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-44-existing-observations-never-overwritten/case-result.lisp")
   :BYTES 463 :SHA256
   "ad513ae7051cea877f638bb3480589e10aa11ce5df2d241088d51bbba906866a"
   :WRITE-DATE 4001077959)
  (:PATH
   #A((184) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-45-destination-observations-overlap/case-result.lisp")
   :BYTES 439 :SHA256
   "eb468762b1021074888472f339e8bd02cb1eff7786e96ce50933659844cc5372"
   :WRITE-DATE 4001077960)
  (:PATH
   #A((184) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-46-destination-observations-overlap/case-result.lisp")
   :BYTES 439 :SHA256
   "95cc0fe00705fd10a894a1af710d7e8ed045940f75326120ce45ddaa2092b7bd"
   :WRITE-DATE 4001077961)
  (:PATH
   #A((184) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-47-destination-observations-overlap/case-result.lisp")
   :BYTES 439 :SHA256
   "f8de42188f181bfe71c3e988bf41af99ffb3005be77fe65ebd6f44c3a730741c"
   :WRITE-DATE 4001077962)
  (:PATH
   #A((180) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-48-corrupt-copy-retains-failure/case-result.lisp")
   :BYTES 431 :SHA256
   "a5d2bbe2176cc01a837abfe85882cd88a3e914f05000110a1d243ff2df7f4a78"
   :WRITE-DATE 4001077963)
  (:PATH
   #A((181) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-49-source-change-retains-failure/case-result.lisp")
   :BYTES 435 :SHA256
   "1fbcfd0777a11a9ee52ba6209627bb4fb181e5b9904ccd22bf62f1a5252dcd62"
   :WRITE-DATE 4001077965)
  (:PATH
   #A((193) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-50-unindexed-extra-rejected-by-final-checker/case-result.lisp")
   :BYTES 457 :SHA256
   "d8c531ad31f47375b7f0e0e714a40e3d9fdd76bfc70d5117af559051187ba8ae"
   :WRITE-DATE 4001077966)
  (:PATH
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-51-manifest-read-eval-disabled/case-result.lisp")
   :BYTES 427 :SHA256
   "76361b372c73fc8b6382b7ae9fa903a38a430ca2d85f65fc829ad471c842e6cb"
   :WRITE-DATE 4001077967)
  (:PATH
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-52-manifest-eof-required/case-result.lisp")
   :BYTES 415 :SHA256
   "336395005be397dbabcb1c19ebf1eb0dea9318ae6d12ef53f4eeeebab6644860"
   :WRITE-DATE 4001077968)
  (:PATH
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-53-record-read-eval-disabled/case-result.lisp")
   :BYTES 423 :SHA256
   "e4ee5d82e9bb07daf1702af321c58f78cd1c76f95c549a43bf94a551f7f2df73"
   :WRITE-DATE 4001077969)
  (:PATH
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-54-record-eof-required/case-result.lisp")
   :BYTES 411 :SHA256
   "6fb58b98d1996f67ac43177f5803d33d2d40aa271f5105ea5a2894fa16f5f660"
   :WRITE-DATE 4001077970)
  (:PATH
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-55-cli-arguments/case-result.lisp")
   :BYTES 268 :SHA256
   "57878a8c06746c30780e9249dab79a296c2370ecabfdd25453422fdb11bfd8aa"
   :WRITE-DATE 4001077971)
  (:PATH
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-56-cli-arguments/case-result.lisp")
   :BYTES 268 :SHA256
   "e047ee17a0286e81868588857374a2ea6033756211dc0e3c70a593ad411ddd31"
   :WRITE-DATE 4001077971)
  (:PATH
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-57-cli-arguments/case-result.lisp")
   :BYTES 268 :SHA256
   "f25728ecfb35e2b22269c5dc9ce2d1c762d85f4592baf78079612a8525bbeaaf"
   :WRITE-DATE 4001077972)
  (:PATH
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-58-cli-arguments/case-result.lisp")
   :BYTES 268 :SHA256
   "c584f3f1a94b3ed6a48dff05031adb69714514a76ff6b99b51bf92396496b2ce"
   :WRITE-DATE 4001077973)
  (:PATH
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-59-cli-arguments/case-result.lisp")
   :BYTES 268 :SHA256
   "566b98e6d8495cf0a2393879bcf21fce0a6f1c63edfe242742d7b8565a670a79"
   :WRITE-DATE 4001077973)
  (:PATH
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/self-test-report.lisp")
   :BYTES 24940 :SHA256
   "1b5b02a419a0cf955a0141e33b6915c7ed725ecf79aae7af7cc7040a79d41843"
   :WRITE-DATE 4001077973)
  (:PATH
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e"
   :WRITE-DATE 4001078051))
 :LIMITS
 (:DATA-ONLY :READ-EVAL-NIL :EOF-FOR-RECORDS :NO-RUNTIME-REPETITION
  :FIXTURE-ASSERTIONS-PLUS-FOUR-POSITIVE-WORKER-COUNTERS
  :NO-CORE-PARALLELISM-CLAIM :NO-THROUGHPUT-CLAIM :NO-C1-COVERAGE-CLAIM
  :LINT-TRACE-LINKS-STRUCTURAL-EVIDENCE-CHECKS :SPIKES-CHECK-NOT-BENCHMARK
  :HISTORICAL-FAILURES-PRESERVED :ONE-EXPLICIT-NESTED-COMMAND-WRAPPER))
