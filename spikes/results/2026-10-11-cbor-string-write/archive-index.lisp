(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL #A((6) BASE-CHAR . "freeze") :RECORD-PATH
   "processes/freeze/report.lisp" :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY
   :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((49) BASE-CHAR . "spikes/out/cbor-string-write-20261011/freeze.lisp")))
  (:LABEL #A((11) BASE-CHAR . "preliminary") :RECORD-PATH
   "processes/preliminary/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "make") #A((4) BASE-CHAR . "test")
    #A((4) BASE-CHAR . "lint") #A((5) BASE-CHAR . "trace")))
  (:LABEL #A((14) BASE-CHAR . "benchAuditSelf") :RECORD-PATH
   "processes/benchAuditSelf/report.lisp" :STATUS :FAILED :EXIT-CODE 1
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "tools/cbor-string-write-audit.lisp")
    #A((11) BASE-CHAR . "--self-test")))
  (:LABEL #A((12) BASE-CHAR . "coverageSelf") :RECORD-PATH
   "processes/coverageSelf/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((11) BASE-CHAR . "--self-test")
    #A((52) BASE-CHAR
       . "spikes/out/cbor-string-write-coverage-self-20261011/")))
  (:LABEL #A((12) BASE-CHAR . "mutationSelf") :RECORD-PATH
   "processes/mutationSelf/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((37) BASE-CHAR . "tools/cbor-string-write-mutation.lisp")
    #A((11) BASE-CHAR . "--self-test")))
  (:LABEL #A((19) BASE-CHAR . "benchAuditSelfRetry") :RECORD-PATH
   "processes/benchAuditSelfRetry/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "tools/cbor-string-write-audit.lisp")
    #A((11) BASE-CHAR . "--self-test")))
  (:LABEL #A((13) BASE-CHAR . "dataAuditSelf") :RECORD-PATH
   "processes/dataAuditSelf/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((53) BASE-CHAR
       . "spikes/out/cbor-string-write-20261011/data-audit.lisp")
    #A((11) BASE-CHAR . "--self-test")
    #A((54) BASE-CHAR
       . "spikes/out/cbor-string-write-20261011/audit-self-test/")))
  (:LABEL #A((9) BASE-CHAR . "benchSelf") :RECORD-PATH
   "processes/benchSelf/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "tools/cbor-string-write-bench.lisp")
    #A((11) BASE-CHAR . "--self-test")))
  (:LABEL #A((9) BASE-CHAR . "benchmark") :RECORD-PATH
   "processes/benchmark/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "tools/cbor-string-write-bench.lisp")
    #A((7) BASE-CHAR . "--bench")))
  (:LABEL #A((8) BASE-CHAR . "coverage") :RECORD-PATH
   "processes/coverage/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((8) BASE-CHAR . "--report")
    #A((47) BASE-CHAR . "spikes/out/cbor-string-write-coverage-20261011/")
    #A((17) BASE-CHAR . "cbor-string-write")))
  (:LABEL #A((9) BASE-CHAR . "mutations") :RECORD-PATH
   "processes/mutations/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((37) BASE-CHAR . "tools/cbor-string-write-mutation.lisp")
    #A((5) BASE-CHAR . "--run")
    #A((48) BASE-CHAR . "spikes/out/cbor-string-write-mutations-20261011/")))
  (:LABEL #A((14) BASE-CHAR . "benchmarkAudit") :RECORD-PATH
   "processes/benchmarkAudit/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "tools/cbor-string-write-audit.lisp")
    #A((7) BASE-CHAR . "--bench")
    #A((113) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708804-command-7496-0/report.lisp")))
  (:LABEL #A((13) BASE-CHAR . "coverageAudit") :RECORD-PATH
   "processes/coverageAudit/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((53) BASE-CHAR
       . "spikes/out/cbor-string-write-20261011/data-audit.lisp")
    #A((10) BASE-CHAR . "--coverage")
    #A((113) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708897-command-8699-0/report.lisp")
    #A((47) BASE-CHAR . "spikes/out/cbor-string-write-coverage-20261011/")))
  (:LABEL #A((13) BASE-CHAR . "mutationAudit") :RECORD-PATH
   "processes/mutationAudit/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((53) BASE-CHAR
       . "spikes/out/cbor-string-write-20261011/data-audit.lisp")
    #A((11) BASE-CHAR . "--mutations")
    #A((113) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708897-command-8701-0/report.lisp")
    #A((48) BASE-CHAR . "spikes/out/cbor-string-write-mutations-20261011/")))
  (:LABEL #A((13) BASE-CHAR . "outCompaction") :RECORD-PATH
   "processes/outCompaction/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((27) BASE-CHAR . "tools/compact-evidence.lisp")
    #A((6) BASE-CHAR . "--root") #A((11) BASE-CHAR . "spikes/out/")
    #A((6) BASE-CHAR . "--jobs") #A((1) BASE-CHAR . "4"))))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/collection-manifest.lisp")
   :BYTES 4599 :SHA256
   "dcd62ed48b04ef80e29513e1dfc1be5f14618a431e49208a8672e689ad150a1a")
  (:PATH "collection-source.lisp" :SOURCE
   #A((101) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/header-write/collect.lisp")
   :BYTES 9677 :SHA256
   "f59f7a52934c7fe6103b5047aade87214f17494e857fe35c568968c681790d81")
  (:PATH "processes/benchAuditSelf/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708581-command-2576-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "26b44cc36f847ffc5f4c9999a9422438d3e601461b2a8b33db7aef337857523f")
  (:PATH "processes/benchAuditSelf/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708581-command-2576-0/report.lisp")
   :BYTES 127203 :SHA256
   "0b99a04e228d8dd58b277d06cda5a5fded1002c964440b10cee6885b100b9231")
  (:PATH "processes/benchAuditSelfRetry/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708787-command-7053-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "a9a9ad6c501245fd40283a0d0197e2032f5de07b1feb3b097fe0dd4ac9cd47df")
  (:PATH "processes/benchAuditSelfRetry/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708787-command-7053-0/report.lisp")
   :BYTES 129988 :SHA256
   "f874a5ae4ea6a0f7a4c7afeac1e7f84fd4e508568988557fbb3d270f172b431b")
  (:PATH "processes/benchSelf/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708787-command-7056-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "71a824c06595cee2ddfdfa56258611a059f7ede8b1cd64fd208e5bfe2b2734bb")
  (:PATH "processes/benchSelf/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708787-command-7056-0/report.lisp")
   :BYTES 154866 :SHA256
   "a750981ccfd0744b7203f71c52d919f3a9845250863a33eb1c1685953704197a")
  (:PATH "processes/benchmark/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708804-command-7496-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "e8b4dcd15149fae6ea5587a4cfbc7269c644452d3adf3ddb1cfd9d2c9786ce03")
  (:PATH "processes/benchmark/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708804-command-7496-0/report.lisp")
   :BYTES 654034 :SHA256
   "9fb205681abf9b324bf392eb56348c4484941a849035b18d827994f7c60dde59")
  (:PATH "processes/benchmarkAudit/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708897-command-8700-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "9e488bf55cc556bd67c33340f5e4976831d38e308c4544f1bfe2a16c86486690")
  (:PATH "processes/benchmarkAudit/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708897-command-8700-0/report.lisp")
   :BYTES 128115 :SHA256
   "5bbde54e9e7fe84956bdc1109f5376e0bb24922e039dd26d0ffbc4fb8f6f0ee4")
  (:PATH "processes/coverage/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708897-command-8699-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "09d47c9cc07e04f77a65cce009d28eee3e8ee8204357c999c10523e015cee21b")
  (:PATH "processes/coverage/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708897-command-8699-0/report.lisp")
   :BYTES 128831 :SHA256
   "02cbeee40530ec73e7f1bdded9fdad0b9fda2a5bbf1022c9b8b23dfb1ab5e3e1")
  (:PATH "processes/coverageAudit/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708950-command-9144-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "aac085a20aac51e09a523b2225a1bb263e0277b2349626b9e032a436896dbd86")
  (:PATH "processes/coverageAudit/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708950-command-9144-0/report.lisp")
   :BYTES 126825 :SHA256
   "2ff3bbb33cc3afaa0f5b920c311ebf3c74c77a7c59e884ff8544141057457ae4")
  (:PATH "processes/coverageSelf/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708581-command-2577-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "ecde8d4b028672c5c3ce043c5a9c6d235946106650418ce65ca7e7a80f507a35")
  (:PATH "processes/coverageSelf/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708581-command-2577-0/report.lisp")
   :BYTES 126558 :SHA256
   "4a3f40b5da6c59fc1548642031418ba75f31992b195d69708fc3745b6b8ed7e7")
  (:PATH "processes/dataAuditSelf/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708787-command-7054-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "fcda93b4d2750a0b45550b3ac2183f60962388a60ecba1be4ab12a5ebf71b6f0")
  (:PATH "processes/dataAuditSelf/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708787-command-7054-0/report.lisp")
   :BYTES 126703 :SHA256
   "4567ccd7cba75ec34ed2e34e27d06ea1cb014955c8bd6679b40c3c44dbccf646")
  (:PATH "processes/freeze/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708567-command-1439-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "37003d8eb6fe0cbcb7774bbd2569e1c8c98af9518fecf786dda270dd54a5b542")
  (:PATH "processes/freeze/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708567-command-1439-0/report.lisp")
   :BYTES 126461 :SHA256
   "6ffd0ca84f9d08055a40fd47ed30e3975a75a3646b12d33a1e89212e30f29e07")
  (:PATH "processes/mutationAudit/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000709011-command-9525-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "9f65428faf91b3c5b22806c7c97f7faa932e3f39929ff5d7034e8b32b5d76d82")
  (:PATH "processes/mutationAudit/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000709011-command-9525-0/report.lisp")
   :BYTES 126831 :SHA256
   "d43f148d4c6dd83c116f652ee4decc9679db008915f298faeafe01f1720432a6")
  (:PATH "processes/mutationSelf/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708581-command-2578-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "f29a3b8385940a4ec5d2be9ee2ad595ca0af2c89f051dd9e4cf2f9babccf9be0")
  (:PATH "processes/mutationSelf/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708581-command-2578-0/report.lisp")
   :BYTES 175007 :SHA256
   "c004d19c058bb08e36a3b90c768fb4952744f0928c834c6671bf51bb5aca3f40")
  (:PATH "processes/mutations/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708897-command-8701-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "d308615e2a9c2e583be0e4c07e22c5c40430d1d29ec52c5d7b5d1753db41904d")
  (:PATH "processes/mutations/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708897-command-8701-0/report.lisp")
   :BYTES 178040 :SHA256
   "4b6999d8356bb1e014b46faaee1f2dd043c96de2cafcbcdec1a201de12a9baa0")
  (:PATH "processes/outCompaction/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000709092-command-12371-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "68177e60d7fe6713acebce295465b04f1e329aee0a719350630f162c4ae56f1d")
  (:PATH "processes/outCompaction/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000709092-command-12371-0/report.lisp")
   :BYTES 127637 :SHA256
   "905713a0742163323a99dc35146651210f537b9056cb8a1796c7a83a3f2cd3e7")
  (:PATH "processes/preliminary/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708581-command-2575-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "1c9fc73cc55d63d707dd7f3017fa3e4e391835ded3f0535d719e69ce57c8cfe8")
  (:PATH "processes/preliminary/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708581-command-2575-0/report.lisp")
   :BYTES 469735 :SHA256
   "e6e296b96ad73d5c6234d609269065dfbbdcbf50d8407991525202ab47d82b70")
  (:PATH
   "raw/4000708582-cbor-string-write-worker-self-test-2724/baseline-copy/report.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708582-cbor-string-write-worker-self-test-2724/baseline-copy/report.lisp")
   :BYTES 508 :SHA256
   "67e629dab8b432877a95db1437d2ef5677c014bd535f4fdd3b091728483cdeef")
  (:PATH
   "raw/4000708582-cbor-string-write-worker-self-test-2724/baseline-copy/test.log"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708582-cbor-string-write-worker-self-test-2724/baseline-copy/test.log")
   :BYTES 72 :SHA256
   "de0dbcd7f7ead42441ea8049fc98c4131badb83e7d506ec1dcbf65c5f390cf6f")
  (:PATH
   "raw/4000708582-cbor-string-write-worker-self-test-2724/baseline-transport/report.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708582-cbor-string-write-worker-self-test-2724/baseline-transport/report.lisp")
   :BYTES 523 :SHA256
   "dc8341f8e61e84395a6b2b2aa44cb6b37e7726aa3dd282dd16058aec62bd87d0")
  (:PATH
   "raw/4000708582-cbor-string-write-worker-self-test-2724/baseline-transport/test.log"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708582-cbor-string-write-worker-self-test-2724/baseline-transport/test.log")
   :BYTES 77 :SHA256
   "8db5a0350972541411a1e5939c72ccd8c01f29d66442dfef3cf75a6bc434356c")
  (:PATH
   "raw/4000708582-cbor-string-write-worker-self-test-2724/completion-exit/test.log"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708582-cbor-string-write-worker-self-test-2724/completion-exit/test.log")
   :BYTES 96 :SHA256
   "c0320463f598c4c5f11202e542c7617c216e7be84103be16768a503c83b17a95")
  (:PATH
   "raw/4000708582-cbor-string-write-worker-self-test-2724/completion-exit/tools/cbor-string-write-isolated-build.lisp"
   :SOURCE
   #A((186) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708582-cbor-string-write-worker-self-test-2724/completion-exit/tools/cbor-string-write-isolated-build.lisp")
   :BYTES 184 :SHA256
   "1e3c5ad6ead59dcacdfb02c47ce2474eb44727271c8fcd8436fefe2dde8d0b61")
  (:PATH "raw/4000708582-cbor-string-write-worker-self-test-2724/report.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708582-cbor-string-write-worker-self-test-2724/report.lisp")
   :BYTES 1751 :SHA256
   "421d75e80619b006a0c856766e4f38d049c3f655b92c79a93ecc93605bb6cbc3")
  (:PATH
   "raw/4000708582-cbor-string-write-worker-self-test-2724/signal/test.log"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708582-cbor-string-write-worker-self-test-2724/signal/test.log")
   :BYTES 40 :SHA256
   "52ed427bbed0c5c928fa7e029bb609e785bb3a11329b9a8110255dbeb7c5f384")
  (:PATH
   "raw/4000708582-cbor-string-write-worker-self-test-2724/signal/tools/cbor-string-write-isolated-build.lisp"
   :SOURCE
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708582-cbor-string-write-worker-self-test-2724/signal/tools/cbor-string-write-isolated-build.lisp")
   :BYTES 142 :SHA256
   "1ee0da58fd6e1dca7befab8f13b2c7c520b79e8d12dedc4e6a3f9bb926d5628b")
  (:PATH
   "raw/4000708899-cbor-string-write-worker-self-test-8780/baseline-copy/report.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708899-cbor-string-write-worker-self-test-8780/baseline-copy/report.lisp")
   :BYTES 508 :SHA256
   "01e1f224bb5dd0fee17d79b082c9af591911f46e8bd4179cb58a325406cb8389")
  (:PATH
   "raw/4000708899-cbor-string-write-worker-self-test-8780/baseline-copy/test.log"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708899-cbor-string-write-worker-self-test-8780/baseline-copy/test.log")
   :BYTES 72 :SHA256
   "de0dbcd7f7ead42441ea8049fc98c4131badb83e7d506ec1dcbf65c5f390cf6f")
  (:PATH
   "raw/4000708899-cbor-string-write-worker-self-test-8780/baseline-transport/report.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708899-cbor-string-write-worker-self-test-8780/baseline-transport/report.lisp")
   :BYTES 523 :SHA256
   "e26413777abd3e257e29a390139df4c761615e9dd001753184c2686821fa0588")
  (:PATH
   "raw/4000708899-cbor-string-write-worker-self-test-8780/baseline-transport/test.log"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708899-cbor-string-write-worker-self-test-8780/baseline-transport/test.log")
   :BYTES 77 :SHA256
   "8db5a0350972541411a1e5939c72ccd8c01f29d66442dfef3cf75a6bc434356c")
  (:PATH
   "raw/4000708899-cbor-string-write-worker-self-test-8780/completion-exit/test.log"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708899-cbor-string-write-worker-self-test-8780/completion-exit/test.log")
   :BYTES 96 :SHA256
   "c0320463f598c4c5f11202e542c7617c216e7be84103be16768a503c83b17a95")
  (:PATH
   "raw/4000708899-cbor-string-write-worker-self-test-8780/completion-exit/tools/cbor-string-write-isolated-build.lisp"
   :SOURCE
   #A((186) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708899-cbor-string-write-worker-self-test-8780/completion-exit/tools/cbor-string-write-isolated-build.lisp")
   :BYTES 184 :SHA256
   "1e3c5ad6ead59dcacdfb02c47ce2474eb44727271c8fcd8436fefe2dde8d0b61")
  (:PATH "raw/4000708899-cbor-string-write-worker-self-test-8780/report.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708899-cbor-string-write-worker-self-test-8780/report.lisp")
   :BYTES 1751 :SHA256
   "f9ac2e9f9d0080c590b5d918218fde25f31b52bafa2e82ae4dd690399de900e4")
  (:PATH
   "raw/4000708899-cbor-string-write-worker-self-test-8780/signal/test.log"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708899-cbor-string-write-worker-self-test-8780/signal/test.log")
   :BYTES 40 :SHA256
   "52ed427bbed0c5c928fa7e029bb609e785bb3a11329b9a8110255dbeb7c5f384")
  (:PATH
   "raw/4000708899-cbor-string-write-worker-self-test-8780/signal/tools/cbor-string-write-isolated-build.lisp"
   :SOURCE
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000708899-cbor-string-write-worker-self-test-8780/signal/tools/cbor-string-write-isolated-build.lisp")
   :BYTES 142 :SHA256
   "1ee0da58fd6e1dca7befab8f13b2c7c520b79e8d12dedc4e6a3f9bb926d5628b")
  (:PATH "raw/cbor-string-write-20261011/audit-accessor-setter-fix.diff"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/audit-accessor-setter-fix.diff")
   :BYTES 1129 :SHA256
   "da8140aefd1299f4094d8703c613cf2f29354f06487e651ab93ea8f22bf301b2")
  (:PATH "raw/cbor-string-write-20261011/audit-accessor-setter-fix.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/audit-accessor-setter-fix.lisp")
   :BYTES 1279 :SHA256
   "f45dd12fe07e768c0609177e90a199e34724ecb13e676dee2fe615a80d4ba799")
  (:PATH "raw/cbor-string-write-20261011/audit-after-setter-fix.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/audit-after-setter-fix.lisp")
   :BYTES 36579 :SHA256
   "b50c9b6bb4199271caf7dea07c2650f3abd9c377f9e71a6313a059402a1adb6f")
  (:PATH "raw/cbor-string-write-20261011/audit-coverage.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/audit-coverage.lisp")
   :BYTES 15479 :SHA256
   "ba25364d47c0a16651a7dfc3b610d4429acb1308b4c541c294472bf08878472a")
  (:PATH "raw/cbor-string-write-20261011/audit-mutations.lisp" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/audit-mutations.lisp")
   :BYTES 25530 :SHA256
   "34a0873d547ea9655a87f5e167c898684f48f56e9eaf56f0c8db9e3f445c967d")
  (:PATH
   "raw/cbor-string-write-20261011/audit-self-test/bench-arity-checker.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/audit-self-test/bench-arity-checker.lisp")
   :BYTES 506754 :SHA256
   "63b88aa43248533788f11dcf80e8337b6ae5efb7534182570cdd9c007c4006f4")
  (:PATH "raw/cbor-string-write-20261011/audit-self-test/bench-arity.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/audit-self-test/bench-arity.lisp")
   :BYTES 506747 :SHA256
   "9b770fe782d125dca22e04b441804816c91477324c088098b57f564145277b40")
  (:PATH "raw/cbor-string-write-20261011/audit-self-test/bench-full-bytes.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/audit-self-test/bench-full-bytes.lisp")
   :BYTES 506625 :SHA256
   "29e483433276254ab14a74b31b541422c1a3594cec5adced4050f4fb650509a3")
  (:PATH "raw/cbor-string-write-20261011/audit-self-test/bench-good.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/audit-self-test/bench-good.lisp")
   :BYTES 75 :SHA256
   "52e42789276d7dd8345c8e8d8d4d6ec8e1ce4d25e5e5ca43967fbe0e87bf1299")
  (:PATH "raw/cbor-string-write-20261011/audit-self-test/bench-heap.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/audit-self-test/bench-heap.lisp")
   :BYTES 506745 :SHA256
   "7d1f84c63ebb91fdc27116187164c1821ca905d33455225ae3aa17f36ede96c5")
  (:PATH
   "raw/cbor-string-write-20261011/audit-self-test/bench-positive-control.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/audit-self-test/bench-positive-control.lisp")
   :BYTES 506750 :SHA256
   "d037b1775b64270792145c8ea1d0ebb896519c7eeac339a0d5c48458504ec9e3")
  (:PATH "raw/cbor-string-write-20261011/audit-self-test/bench-sink.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/audit-self-test/bench-sink.lisp")
   :BYTES 506745 :SHA256
   "c7ca553fc889508ff92aa5c95591a7b481c3fc962ade3ec8a8f47ddd0d76611c")
  (:PATH "raw/cbor-string-write-20261011/audit-self-test/bench-stability.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/audit-self-test/bench-stability.lisp")
   :BYTES 506751 :SHA256
   "b55d8e0b19c06d15045b8a4bbd4c805413cd72a16a9b39e22d842ec1a643241d")
  (:PATH "raw/cbor-string-write-20261011/audit-self-test/coverage-gap-map.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/audit-self-test/coverage-gap-map.lisp")
   :BYTES 81 :SHA256
   "b1679ff9a0db2fcd3c069347d98e760dbfba651f59e605de06fbe21fe64377c8")
  (:PATH "raw/cbor-string-write-20261011/audit-self-test/coverage-good.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/audit-self-test/coverage-good.lisp")
   :BYTES 78 :SHA256
   "e6d890f8ef672aef35032a545aca9322d673dcf62c42dfb9db07ad4740531d74")
  (:PATH
   "raw/cbor-string-write-20261011/audit-self-test/coverage-html-implicit-row-end.lisp"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/audit-self-test/coverage-html-implicit-row-end.lisp")
   :BYTES 96 :SHA256
   "22372146cbb89af05321a480fb0f37818d7d82a6fb45a0a6b4a42adf2a74fd78")
  (:PATH
   "raw/cbor-string-write-20261011/audit-self-test/coverage-invalid-bit.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/audit-self-test/coverage-invalid-bit.lisp")
   :BYTES 86 :SHA256
   "f8f0d4842e751c6181a066ba2803cf48df6bda1ebe042dd237d1bb32554b5905")
  (:PATH "raw/cbor-string-write-20261011/audit-self-test/mutants-baseline.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/audit-self-test/mutants-baseline.lisp")
   :BYTES 3220 :SHA256
   "a6e4dbf55fdd4146c4635ee659f067b16261ea3db802216477b7ad8013031eab")
  (:PATH "raw/cbor-string-write-20261011/audit-self-test/mutants-catalog.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/audit-self-test/mutants-catalog.lisp")
   :BYTES 3155 :SHA256
   "18774afa06d81f3f1ae6938ba48d5cdacec6871ffc40a32494e51ec732ab0248")
  (:PATH "raw/cbor-string-write-20261011/audit-self-test/mutants-good.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/audit-self-test/mutants-good.lisp")
   :BYTES 77 :SHA256
   "ff42fc9ba44c6dc1af16a6a667f9f9c5b92d046e013d7217e5d473ec958ebb0d")
  (:PATH "raw/cbor-string-write-20261011/audit-self-test/mutants-invalid.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/audit-self-test/mutants-invalid.lisp")
   :BYTES 3218 :SHA256
   "eef7c410ec72837a06d46fc6d19d2194bbf41e84cc3c65cfd63fa0af26ba6b1e")
  (:PATH "raw/cbor-string-write-20261011/audit-self-test/mutants-signal.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/audit-self-test/mutants-signal.lisp")
   :BYTES 3216 :SHA256
   "d342d69b16c2f240f2cfed7670e45006818ae7f012a7e737d2cd3586edfde197")
  (:PATH "raw/cbor-string-write-20261011/audit-self-test/mutants-survived.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/audit-self-test/mutants-survived.lisp")
   :BYTES 3220 :SHA256
   "5df6329083cfacca3bae9d545e3e977416bfd6202b3ae9639ef25468a3d0df45")
  (:PATH "raw/cbor-string-write-20261011/audit-self-test/process-after.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/audit-self-test/process-after.lisp")
   :BYTES 403 :SHA256
   "f970b7c170dc30364c841d59912df31d1774782a3fd75a61cd3ea51b20a8e34c")
  (:PATH "raw/cbor-string-write-20261011/audit-self-test/process-blob.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/audit-self-test/process-blob.lisp")
   :BYTES 463 :SHA256
   "d860e7b289814867ea153f76484b54121569494dfc250a4bdb642665830c7c8c")
  (:PATH "raw/cbor-string-write-20261011/audit-self-test/process-changed.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/audit-self-test/process-changed.lisp")
   :BYTES 506 :SHA256
   "1f768dfbc454782b3d4c1196e14012188884064a086eec0a5141d2c77392da59")
  (:PATH "raw/cbor-string-write-20261011/audit-self-test/process-exit.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/audit-self-test/process-exit.lisp")
   :BYTES 502 :SHA256
   "19965b12be474c164a79dec5eafc1f06347d0285c8c7fd6bc8e4e93817e352ad")
  (:PATH "raw/cbor-string-write-20261011/audit-self-test/process-good.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/audit-self-test/process-good.lisp")
   :BYTES 77 :SHA256
   "152e3c960a5574b593858f64f430d2693a01d134a86c5acb6af2df86f5f5208d")
  (:PATH "raw/cbor-string-write-20261011/audit-self-test/process-status.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/audit-self-test/process-status.lisp")
   :BYTES 508 :SHA256
   "323bcda229e2e10ed691d51676b7432bf0715d4ed750dfea4b6f9d74a893bfc6")
  (:PATH "raw/cbor-string-write-20261011/audit-self-test/reader-20.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/audit-self-test/reader-20.lisp")
   :BYTES 105 :SHA256
   "54468b20f9009a6a867a0ee0276c401f9cb67852930ecb41724e8cc875ad7f19")
  (:PATH "raw/cbor-string-write-20261011/audit-self-test/reader-21.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/audit-self-test/reader-21.lisp")
   :BYTES 107 :SHA256
   "d68b6b9eba93afb912980909882b5f1bf693aa4176c29d898c0847c5fde5bf32")
  (:PATH "raw/cbor-string-write-20261011/audit-self-test/reader-22.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/audit-self-test/reader-22.lisp")
   :BYTES 107 :SHA256
   "1989b08a19814b8ddb57b3dfcc67f2c6e21b75bdf1526b8e9390130a1897dc4d")
  (:PATH "raw/cbor-string-write-20261011/audit-self-test/reader-23.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/audit-self-test/reader-23.lisp")
   :BYTES 104 :SHA256
   "0816328496015124fe120bfb33a799cace4828dd47140c1e7462926e0b1c72dc")
  (:PATH "raw/cbor-string-write-20261011/audit-self-test/report.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/audit-self-test/report.lisp")
   :BYTES 2093 :SHA256
   "89c916f41056c879f7d3e35ec53354215d349c1b482f1c8218e674cd1fba5398")
  (:PATH
   "raw/cbor-string-write-20261011/audit-self-test/substitution-duplicate.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/audit-self-test/substitution-duplicate.lisp")
   :BYTES 88 :SHA256
   "981f02be835f32ffed988ffc98b31b5fcafe36867fba774bf6dc93e071c326ea")
  (:PATH
   "raw/cbor-string-write-20261011/audit-self-test/substitution-good.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/audit-self-test/substitution-good.lisp")
   :BYTES 83 :SHA256
   "d2d4b315a4555e23e7d1234fd2c13829b26113ac7bd30c7e35dfb8fc10921d20")
  (:PATH "raw/cbor-string-write-20261011/audit-self-test/unknown-preamble.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/audit-self-test/unknown-preamble.lisp")
   :BYTES 81 :SHA256
   "3c5cc14c419d6865d7268701289bb4d756904644bc40ae3b0d273620bb3a1040")
  (:PATH "raw/cbor-string-write-20261011/campaign-commands.txt" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/campaign-commands.txt")
   :BYTES 6334 :SHA256
   "baccb9ed90b66ed9f1e3e7b391e2add5d29b1538754508d2aa9b2235807958fc")
  (:PATH "raw/cbor-string-write-20261011/collection-manifest.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/collection-manifest.lisp")
   :BYTES 4599 :SHA256
   "dcd62ed48b04ef80e29513e1dfc1be5f14618a431e49208a8672e689ad150a1a")
  (:PATH "raw/cbor-string-write-20261011/data-audit.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/data-audit.lisp")
   :BYTES 37343 :SHA256
   "481bdba2ebfc47e1acdbcdf920fca492e817840b1c33f656bfd2324bf4f1effb")
  (:PATH "raw/cbor-string-write-20261011/freeze-manifest.lisp" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/freeze-manifest.lisp")
   :BYTES 4663 :SHA256
   "f66fb443e8f46d83db3c53e00b05db91020edef86c995cb8f9ace67995300fd5")
  (:PATH "raw/cbor-string-write-20261011/freeze.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/freeze.lisp")
   :BYTES 2278 :SHA256
   "e43f78f73b1395996ee1745b95433cdc91a4e24fff1f3741a4fc19c7c396a1a5")
  (:PATH "raw/cbor-string-write-20261011/frozen/arcdocdb.asd" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/frozen/arcdocdb.asd")
   :BYTES 10009 :SHA256
   "508589c8856d6734ea0a1433e32d06de0f2819705c00da8398ed7da55dd74fa4")
  (:PATH
   "raw/cbor-string-write-20261011/frozen/docs/implementazione/cbor-stringhe-decisioni.md.txt"
   :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/frozen/docs/implementazione/cbor-stringhe-decisioni.md.txt")
   :BYTES 2402 :SHA256
   "e85d368d8176c2f19100dd2e2cc4cb771b1f7f70e63b4154a8fea49db3e464f8")
  (:PATH
   "raw/cbor-string-write-20261011/frozen/docs/implementazione/cbor-stringhe-lettura.md.txt"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/frozen/docs/implementazione/cbor-stringhe-lettura.md.txt")
   :BYTES 12103 :SHA256
   "be23c861ec5897317084149a7d6b295746764f853152fc592bf528ef01d8d0ea")
  (:PATH
   "raw/cbor-string-write-20261011/frozen/docs/implementazione/cbor-stringhe-metodo.md.txt"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/frozen/docs/implementazione/cbor-stringhe-metodo.md.txt")
   :BYTES 4363 :SHA256
   "bc590f1bec8fd237b050d75202bd16a1c97fef17f2f07e676c7fdf7d816225f5")
  (:PATH
   "raw/cbor-string-write-20261011/frozen/docs/implementazione/cbor-stringhe-revisione.md.txt"
   :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/frozen/docs/implementazione/cbor-stringhe-revisione.md.txt")
   :BYTES 6773 :SHA256
   "980de0f0b19ef1901c3970b87eb8c26f74c659f43c99f4dbb76a2ccbf1d5704f")
  (:PATH
   "raw/cbor-string-write-20261011/frozen/docs/implementazione/cbor-stringhe.md.txt"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/frozen/docs/implementazione/cbor-stringhe.md.txt")
   :BYTES 2413 :SHA256
   "d2079d7e90ae98e53307fe46f336a6cf98a012efae82a02f24ecc475cc482939")
  (:PATH
   "raw/cbor-string-write-20261011/frozen/docs/tracciabilita/matrice.md.txt"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/frozen/docs/tracciabilita/matrice.md.txt")
   :BYTES 48230 :SHA256
   "5a930e90b88e687720ab493bf1ad86f0f4b08883437d4dd0aefb15d7592e8975")
  (:PATH
   "raw/cbor-string-write-20261011/frozen/docs/tracciabilita/requisiti.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/frozen/docs/tracciabilita/requisiti.lisp")
   :BYTES 38983 :SHA256
   "1b6616f571fb632da5ce7bb06fed8824a091e2c965854dd2dfda976a8e518fb7")
  (:PATH "raw/cbor-string-write-20261011/frozen/src/codec/cbor-package.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/frozen/src/codec/cbor-package.lisp")
   :BYTES 579 :SHA256
   "f599073f7a2f085715caa30c78eaeda1a2feee7fed97f4fd33207e45c93455a1")
  (:PATH "raw/cbor-string-write-20261011/frozen/src/codec/cbor-scan-input.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/frozen/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH
   "raw/cbor-string-write-20261011/frozen/src/codec/cbor-string-write.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/frozen/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727")
  (:PATH "raw/cbor-string-write-20261011/frozen/src/codec/cbor-write.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/frozen/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/cbor-string-write-20261011/frozen/src/codec/utf8.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/frozen/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH
   "raw/cbor-string-write-20261011/frozen/tests/codec/cbor-string-write-support.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/frozen/tests/codec/cbor-string-write-support.lisp")
   :BYTES 6829 :SHA256
   "611ec1d825855d9df27988821ee45f0ecf81fbd3128a38df6ee5c727551cd9f2")
  (:PATH
   "raw/cbor-string-write-20261011/frozen/tests/codec/cbor-string-write-threads.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/frozen/tests/codec/cbor-string-write-threads.lisp")
   :BYTES 3311 :SHA256
   "d45b4dda658a96b9af9051b152df2b17859aecdbb9131505d1a2689b27ffb88a")
  (:PATH
   "raw/cbor-string-write-20261011/frozen/tests/codec/cbor-string-write.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/frozen/tests/codec/cbor-string-write.lisp")
   :BYTES 15883 :SHA256
   "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115")
  (:PATH
   "raw/cbor-string-write-20261011/frozen/tools/cbor-string-write-audit.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/frozen/tools/cbor-string-write-audit.lisp")
   :BYTES 36226 :SHA256
   "c4a1ba541137a5c8232d41794666d03f3d5be69e551d9e3eb28ba117bcfb873e")
  (:PATH
   "raw/cbor-string-write-20261011/frozen/tools/cbor-string-write-bench.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/frozen/tools/cbor-string-write-bench.lisp")
   :BYTES 12808 :SHA256
   "f6a47428f8e782f315a2ad65d6d93eade61cfaea5e6d53d473a2444dc50c12d1")
  (:PATH
   "raw/cbor-string-write-20261011/frozen/tools/cbor-string-write-mutation.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/frozen/tools/cbor-string-write-mutation.lisp")
   :BYTES 31378 :SHA256
   "728267de39955274067e88c5e7c8448ae549cdfe4481364b39c4667f8258929f")
  (:PATH "raw/cbor-string-write-20261011/frozen/tools/foundation-coverage.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/frozen/tools/foundation-coverage.lisp")
   :BYTES 11265 :SHA256
   "b3d33b592fcea8ffa8142bb3c449acd2ceeba072ed37da1bdd2eaa2e1818c39e")
  (:PATH "raw/cbor-string-write-20261011/manifest.lisp" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/manifest.lisp")
   :BYTES 1806 :SHA256
   "64b1dd4ef606656234bf674fdd793f36793abe8443f5af3016cdfd7e44c9a6d0")
  (:PATH "raw/cbor-string-write-20261011/read-report.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/read-report.lisp")
   :BYTES 1771 :SHA256
   "a4f54634aaeff4ea4f7322ef92296b6fdc2a187131545cffa7892105dcd37923")
  (:PATH "raw/cbor-string-write-20261011/reading-data-draft.md.txt" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/reading-data-draft.md.txt")
   :BYTES 15203 :SHA256
   "c80f857486b704612f74e26a0098e5e082bedbc55dceaf3999f2be4be7602545")
  (:PATH "raw/cbor-string-write-20261011/reading-data-reader-attempts.md.txt"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-20261011/reading-data-reader-attempts.md.txt")
   :BYTES 5516 :SHA256
   "72fe09a0957a7e3ff0f77568e57cb3a3a5239b73c788e77af0757b8829283228")
  (:PATH "raw/cbor-string-write-coverage-20261011/cover-index.html" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-coverage-20261011/cover-index.html")
   :BYTES 1761 :SHA256
   "595735d989c609554db3838279ea1ffb9a1ece6169cf9ee38da32b9fa5c048f1")
  (:PATH "raw/cbor-string-write-coverage-20261011/coverage-state.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-coverage-20261011/coverage-state.lisp")
   :BYTES 325 :SHA256
   "6ba2ac9daebfebcf90ff059fcf7e9d2e70bab8ddb6d4cd60dd52a32284f169d5")
  (:PATH "raw/cbor-string-write-coverage-20261011/coverage-state.lisp.gz"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-coverage-20261011/coverage-state.lisp.gz")
   :BYTES 206921 :SHA256
   "38a88ca1032a873128561f43befce41330aed862cc1aba288f090fcabb9f73f8")
  (:PATH
   "raw/cbor-string-write-coverage-20261011/de5dd74a96006e359337b0ce64959b64.html"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-coverage-20261011/de5dd74a96006e359337b0ce64959b64.html")
   :BYTES 45172 :SHA256
   "b2fb630ef91c4dc12507e3c8715c905eed9a5316c3e80a90d1e2520a4ae7a1c4")
  (:PATH
   "raw/cbor-string-write-coverage-self-20261011/5b30ee7e4035d4076c0f82fda666b441.html"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-coverage-self-20261011/5b30ee7e4035d4076c0f82fda666b441.html")
   :BYTES 2836 :SHA256
   "79647ce6c5e180680a4bc5d17f0136582f89da34e5d4425a26ccd16eadb67063")
  (:PATH "raw/cbor-string-write-coverage-self-20261011/cover-index.html"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-coverage-self-20261011/cover-index.html")
   :BYTES 1796 :SHA256
   "d54a137deda02370293158fdba4f845bb717f356c9d4fbaf7f10492a3647ff1b")
  (:PATH "raw/cbor-string-write-coverage-self-20261011/coverage-fixture.fasl"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-coverage-self-20261011/coverage-fixture.fasl")
   :BYTES 1615 :SHA256
   "b981e75bd4044d08add79bd5ae36430d8cdbd4fd6c5d16b972520aae40056694")
  (:PATH "raw/cbor-string-write-coverage-self-20261011/coverage-fixture.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-coverage-self-20261011/coverage-fixture.lisp")
   :BYTES 147 :SHA256
   "3767518fde8bde1e1286dbf663e97eac01f02e038d7f3161df436d9fd3e92559")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/cache/build.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/cache/build.lisp")
   :BYTES 4966 :SHA256
   "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/cache/clock.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/cache/clock.lisp")
   :BYTES 2952 :SHA256
   "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/cache/core.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/cache/core.lisp")
   :BYTES 3503 :SHA256
   "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/cache/package.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/cache/package.lisp")
   :BYTES 758 :SHA256
   "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/cache/read.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/cache/read.lisp")
   :BYTES 6220 :SHA256
   "bf2232802b2f3648514dfb76f20e571797f981ebb3138f79fc1b42477df045e8")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/cache/types.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/cache/types.lisp")
   :BYTES 2448 :SHA256
   "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/cache/write.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/cache/write.lisp")
   :BYTES 5481 :SHA256
   "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/codec/cbor-float-minimal.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/codec/cbor-header.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/codec/cbor-minimal.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/codec/cbor-package.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/codec/cbor-package.lisp")
   :BYTES 579 :SHA256
   "f599073f7a2f085715caa30c78eaeda1a2feee7fed97f4fd33207e45c93455a1")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/codec/cbor-scan-input.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/codec/cbor-scan-items.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/codec/cbor-scan-minimal.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/codec/cbor-scan-stack.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/codec/cbor-scan.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/codec/cbor-space.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/codec/cbor-string-write.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/codec/cbor-string-write.lisp")
   :BYTES 7741 :SHA256
   "75690eb98593d4acb17e82da9fd4472afaa84ef1bf93ec1e14999291792b7c2f")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/codec/cbor-write.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/codec/package.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/codec/utf8.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/csn/package.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/csn/package.lisp")
   :BYTES 441 :SHA256
   "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/csn/registry.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/csn/registry.lisp")
   :BYTES 12139 :SHA256
   "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/epochs/core.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/epochs/core.lisp")
   :BYTES 5909 :SHA256
   "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/epochs/package.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/epochs/package.lisp")
   :BYTES 779 :SHA256
   "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/epochs/read.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/epochs/read.lisp")
   :BYTES 3240 :SHA256
   "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/epochs/reclaim.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/epochs/reclaim.lisp")
   :BYTES 6373 :SHA256
   "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/epochs/retire.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/epochs/retire.lisp")
   :BYTES 5858 :SHA256
   "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/epochs/types.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/epochs/types.lisp")
   :BYTES 5304 :SHA256
   "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/execution/handoff.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/execution/handoff.lisp")
   :BYTES 7394 :SHA256
   "ee90c809ef51134efa21e08b819e5530304efaf9f9e26b63c7e4afbf6d48e607")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/execution/package.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/execution/package.lisp")
   :BYTES 1157 :SHA256
   "bbe8cdb6f7e74d7139f5e472a915cc74b43e34bd27ecac1c5fd364f723a2a643")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/execution/queue.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/execution/queue.lisp")
   :BYTES 5374 :SHA256
   "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/execution/ready-recycle.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/execution/ready-recycle.lisp")
   :BYTES 3387 :SHA256
   "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/execution/ready-types.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/execution/ready-types.lisp")
   :BYTES 5248 :SHA256
   "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/execution/ready.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/execution/ready.lisp")
   :BYTES 6635 :SHA256
   "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/execution/worker-boundary.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/execution/worker-boundary.lisp")
   :BYTES 2309 :SHA256
   "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/execution/worker-claim.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/execution/worker-claim.lisp")
   :BYTES 6401 :SHA256
   "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/execution/worker-run.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/execution/worker-run.lisp")
   :BYTES 5124 :SHA256
   "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/execution/worker-types.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/execution/worker-types.lisp")
   :BYTES 8461 :SHA256
   "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/execution/writer.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/execution/writer.lisp")
   :BYTES 6484 :SHA256
   "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/foundation/batch.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/foundation/binary.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/foundation/conditions.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/foundation/crc32c.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/foundation/package.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/foundation/record.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/index/core.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/index/core.lisp")
   :BYTES 2959 :SHA256
   "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/index/package.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/index/package.lisp")
   :BYTES 727 :SHA256
   "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/index/primary-arena.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/index/primary-arena.lisp")
   :BYTES 3485 :SHA256
   "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/index/primary-build.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/index/primary-build.lisp")
   :BYTES 4794 :SHA256
   "c38c654fd9fb4b1022c1b927cc956fc6e4fcfb4e6546241abab0ef1d2250982e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/index/primary-core.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/index/primary-core.lisp")
   :BYTES 4211 :SHA256
   "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/index/primary-directory.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/index/primary-directory.lisp")
   :BYTES 8114 :SHA256
   "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/index/primary-package.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/index/primary-package.lisp")
   :BYTES 1389 :SHA256
   "de63b143381f1d044df8f8f5545ac4230e1e6e3631ad015b5c4841ced70ecf8d")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/index/primary-probe.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/index/primary-probe.lisp")
   :BYTES 5936 :SHA256
   "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/index/primary-read.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/index/primary-read.lisp")
   :BYTES 3575 :SHA256
   "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/index/primary-relocate.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/index/primary-relocate.lisp")
   :BYTES 4073 :SHA256
   "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/index/primary-types.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/index/primary-types.lisp")
   :BYTES 3827 :SHA256
   "8fac31490331dcff794cedae79c3b9028922e18741c99d04404203f08ec3dcec")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/index/primary-write.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/index/primary-write.lisp")
   :BYTES 7061 :SHA256
   "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/index/read.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/index/read.lisp")
   :BYTES 3030 :SHA256
   "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/index/rebuild-budget.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/index/rebuild-budget.lisp")
   :BYTES 3593 :SHA256
   "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/index/rebuild-copy.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/index/rebuild-copy.lisp")
   :BYTES 4027 :SHA256
   "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/index/rebuild-scan.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/index/rebuild-scan.lisp")
   :BYTES 5002 :SHA256
   "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/index/rebuild.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/index/rebuild.lisp")
   :BYTES 2872 :SHA256
   "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/index/relocate.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/index/relocate.lisp")
   :BYTES 2383 :SHA256
   "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/index/types.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/index/types.lisp")
   :BYTES 2434 :SHA256
   "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/index/validation.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/index/validation.lisp")
   :BYTES 3930 :SHA256
   "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/index/write.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/index/write.lisp")
   :BYTES 4784 :SHA256
   "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/io/flush.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/io/flush.lisp")
   :BYTES 1569 :SHA256
   "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/io/lifecycle.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/io/lifecycle.lisp")
   :BYTES 4536 :SHA256
   "baa1f763fe0f394a14d381b753dcb1be1e90eb03eaff5d6469465b5d4eca015f")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/io/native.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/io/native.lisp")
   :BYTES 5026 :SHA256
   "b8cf3ce1ff7b4fa9def8a602ab768c0e9a321f8d6cdce6e5b2b7ded2fe3d97dd")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/io/package.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/io/package.lisp")
   :BYTES 592 :SHA256
   "118eba04ab2aa87a2d86e0b0269dbeacaa485457acebbc12c57317ae465a89c0")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/io/transfer.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/io/transfer.lisp")
   :BYTES 5051 :SHA256
   "3748328cf85e1c007900a63bdd0f159f38a8d7cd3577c92c56fc68692b9b7bcf")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/io/types.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/io/types.lisp")
   :BYTES 4143 :SHA256
   "50c7eeea91af232fca7103ce5a25535958d73836f01cb45a20c7120b88b1336b")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/mvcc/package.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/mvcc/package.lisp")
   :BYTES 833 :SHA256
   "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/mvcc/snapshots-core.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/mvcc/snapshots-core.lisp")
   :BYTES 7622 :SHA256
   "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/mvcc/snapshots-csn.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/mvcc/snapshots-csn.lisp")
   :BYTES 2725 :SHA256
   "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/mvcc/snapshots-lifecycle.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/mvcc/snapshots-lifecycle.lisp")
   :BYTES 6609 :SHA256
   "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/mvcc/snapshots-read.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/mvcc/snapshots-read.lisp")
   :BYTES 6651 :SHA256
   "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/mvcc/snapshots-register.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/mvcc/snapshots-register.lisp")
   :BYTES 6654 :SHA256
   "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/mvcc/snapshots-types.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/mvcc/snapshots-types.lisp")
   :BYTES 3817 :SHA256
   "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/mvcc/types.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/mvcc/types.lisp")
   :BYTES 471 :SHA256
   "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/package.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/read/core.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/read/core.lisp")
   :BYTES 3846 :SHA256
   "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/read/package.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/read/package.lisp")
   :BYTES 831 :SHA256
   "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/read/task.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/read/task.lisp")
   :BYTES 5073 :SHA256
   "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/read/types.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/read/types.lisp")
   :BYTES 2358 :SHA256
   "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/recovery/decisions-build.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/recovery/decisions-build.lisp")
   :BYTES 11857 :SHA256
   "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/recovery/decisions-package.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/recovery/decisions-package.lisp")
   :BYTES 818 :SHA256
   "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/recovery/decisions-query.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/recovery/decisions-query.lisp")
   :BYTES 4525 :SHA256
   "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/recovery/decisions-radix.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/recovery/decisions-radix.lisp")
   :BYTES 11061 :SHA256
   "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/recovery/decisions-sort.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/recovery/decisions-sort.lisp")
   :BYTES 7654 :SHA256
   "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/recovery/decisions-types.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/recovery/decisions-types.lisp")
   :BYTES 2056 :SHA256
   "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/recovery/inventory-build.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/recovery/inventory-build.lisp")
   :BYTES 9592 :SHA256
   "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/recovery/inventory-query.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/recovery/inventory-query.lisp")
   :BYTES 2100 :SHA256
   "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/recovery/inventory-types.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/recovery/inventory-types.lisp")
   :BYTES 2392 :SHA256
   "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/recovery/manifest-build.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/recovery/manifest-build.lisp")
   :BYTES 10251 :SHA256
   "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/recovery/manifest-decode.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/recovery/manifest-decode.lisp")
   :BYTES 6160 :SHA256
   "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/recovery/manifest-fold.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/recovery/manifest-fold.lisp")
   :BYTES 7068 :SHA256
   "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/recovery/manifest-package.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/recovery/manifest-package.lisp")
   :BYTES 1372 :SHA256
   "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/recovery/manifest-query.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/recovery/manifest-query.lisp")
   :BYTES 3582 :SHA256
   "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/recovery/manifest-types.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/recovery/manifest-types.lisp")
   :BYTES 3345 :SHA256
   "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/recovery/package.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/recovery/package.lisp")
   :BYTES 927 :SHA256
   "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/recovery/scan.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/recovery/scan.lisp")
   :BYTES 12829 :SHA256
   "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/series/events.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/series/events.lisp")
   :BYTES 9566 :SHA256
   "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/series/io-events.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/series/io-events.lisp")
   :BYTES 5385 :SHA256
   "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/series/ownership.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/series/ownership.lisp")
   :BYTES 8810 :SHA256
   "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/series/package.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/series/package.lisp")
   :BYTES 1392 :SHA256
   "7433162105df63d324141167e6dcf6bfee74611aa1cf7291cc6c92f41f3c7408")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/series/publication.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/series/publication.lisp")
   :BYTES 6094 :SHA256
   "288cb3fa41fad76a0e6919dfa0b2fce2beef15f5880129393bee35bc8795c762")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/series/query.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/series/query.lisp")
   :BYTES 3600 :SHA256
   "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/series/retirement.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/series/retirement.lisp")
   :BYTES 4634 :SHA256
   "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/series/types.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/series/types.lisp")
   :BYTES 3316 :SHA256
   "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/storage/compaction-scan.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/storage/compaction-scan.lisp")
   :BYTES 5510 :SHA256
   "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/storage/control-payload.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/storage/control-payload.lisp")
   :BYTES 6273 :SHA256
   "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/storage/formats.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/storage/formats.lisp")
   :BYTES 3841 :SHA256
   "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/storage/log-header.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/storage/log-header.lisp")
   :BYTES 3947 :SHA256
   "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/storage/package.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/storage/package.lisp")
   :BYTES 1079 :SHA256
   "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/storage/payload-record.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/storage/payload-record.lisp")
   :BYTES 3641 :SHA256
   "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/storage/payload-write.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/storage/payload-write.lisp")
   :BYTES 5239 :SHA256
   "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/src/storage/segment-header.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/storage/segment-header.lisp")
   :BYTES 5517 :SHA256
   "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/wal/builder.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/wal/builder.lisp")
   :BYTES 8445 :SHA256
   "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/wal/csn.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/wal/csn.lisp")
   :BYTES 9577 :SHA256
   "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/wal/executor.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/wal/executor.lisp")
   :BYTES 6023 :SHA256
   "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/wal/group.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/wal/group.lisp")
   :BYTES 6305 :SHA256
   "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/wal/package.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/wal/package.lisp")
   :BYTES 1774 :SHA256
   "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/src/wal/types.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/src/wal/types.lisp")
   :BYTES 5420 :SHA256
   "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/test.log" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/test.log")
   :BYTES 21543 :SHA256
   "738d5101d456da02ed6c6169c337d7af221edf63821db574e8a6eef2ca5d6bfe")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/codec/cbor-header.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/codec/cbor-header.lisp")
   :BYTES 10773 :SHA256
   "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/codec/cbor-minimal-edges.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/codec/cbor-minimal-edges.lisp")
   :BYTES 1613 :SHA256
   "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/codec/cbor-minimal-scan-support.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/codec/cbor-minimal-scan-support.lisp")
   :BYTES 8363 :SHA256
   "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/codec/cbor-minimal-scan-threads.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/codec/cbor-minimal-scan-threads.lisp")
   :BYTES 4547 :SHA256
   "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/codec/cbor-minimal-scan.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/codec/cbor-minimal-scan.lisp")
   :BYTES 19217 :SHA256
   "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/codec/cbor-minimal-support.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/codec/cbor-minimal-support.lisp")
   :BYTES 8620 :SHA256
   "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/codec/cbor-minimal-threads.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/codec/cbor-minimal-threads.lisp")
   :BYTES 3799 :SHA256
   "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/codec/cbor-minimal.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/codec/cbor-minimal.lisp")
   :BYTES 12604 :SHA256
   "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/codec/cbor-string-write-support.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/codec/cbor-string-write-support.lisp")
   :BYTES 6829 :SHA256
   "611ec1d825855d9df27988821ee45f0ecf81fbd3128a38df6ee5c727551cd9f2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/codec/cbor-string-write-threads.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/codec/cbor-string-write-threads.lisp")
   :BYTES 3311 :SHA256
   "d45b4dda658a96b9af9051b152df2b17859aecdbb9131505d1a2689b27ffb88a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/codec/cbor-string-write.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/codec/cbor-string-write.lisp")
   :BYTES 15883 :SHA256
   "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/codec/cbor-structure-support.lisp"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/codec/cbor-structure-threads.lisp"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/codec/cbor-structure-threads.lisp")
   :BYTES 4305 :SHA256
   "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/codec/cbor-structure.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/codec/cbor-structure.lisp")
   :BYTES 22968 :SHA256
   "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/codec/cbor-support.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/codec/cbor-threads.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/codec/cbor-threads.lisp")
   :BYTES 3683 :SHA256
   "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/codec/cbor-write-roundtrip.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/codec/cbor-write-roundtrip.lisp")
   :BYTES 901 :SHA256
   "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/codec/cbor-write-support.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/codec/cbor-write-support.lisp")
   :BYTES 4768 :SHA256
   "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/codec/cbor-write-threads.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/codec/cbor-write-threads.lisp")
   :BYTES 3813 :SHA256
   "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/codec/cbor-write.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/codec/cbor-write.lisp")
   :BYTES 9822 :SHA256
   "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/tests/codec/support.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/codec/support.lisp")
   :BYTES 5807 :SHA256
   "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/tests/codec/threads.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/codec/threads.lisp")
   :BYTES 3111 :SHA256
   "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/tests/codec/utf8.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/codec/utf8.lisp")
   :BYTES 12892 :SHA256
   "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/tests/csn/registry.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/csn/registry.lisp")
   :BYTES 19411 :SHA256
   "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/tests/csn/support.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/csn/support.lisp")
   :BYTES 11407 :SHA256
   "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/tests/csn/threads.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/csn/threads.lisp")
   :BYTES 10525 :SHA256
   "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/execution/handoff.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/execution/handoff.lisp")
   :BYTES 33278 :SHA256
   "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/execution/queue.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/execution/queue.lisp")
   :BYTES 12894 :SHA256
   "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/execution/ready-recycle.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/execution/ready-recycle.lisp")
   :BYTES 30075 :SHA256
   "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/execution/ready.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/execution/ready.lisp")
   :BYTES 33555 :SHA256
   "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/execution/support.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/execution/support.lisp")
   :BYTES 4469 :SHA256
   "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/execution/threads.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/execution/threads.lisp")
   :BYTES 14622 :SHA256
   "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/execution/worker.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/execution/worker.lisp")
   :BYTES 59783 :SHA256
   "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/foundation/batch.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/foundation/batch.lisp")
   :BYTES 5185 :SHA256
   "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/foundation/binary.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/foundation/binary.lisp")
   :BYTES 3721 :SHA256
   "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/foundation/record.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/foundation/record.lisp")
   :BYTES 14950 :SHA256
   "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/foundation/support.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/index/primary-support.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/index/primary-support.lisp")
   :BYTES 13938 :SHA256
   "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/index/primary-threads.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/index/primary-threads.lisp")
   :BYTES 13744 :SHA256
   "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/tests/index/primary.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/index/primary.lisp")
   :BYTES 30166 :SHA256
   "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/tests/index/rebuild.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/index/rebuild.lisp")
   :BYTES 32112 :SHA256
   "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/index/slot-support.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/index/slot-support.lisp")
   :BYTES 12800 :SHA256
   "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/index/slot-threads.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/index/slot-threads.lisp")
   :BYTES 11698 :SHA256
   "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/tests/index/slots.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/index/slots.lisp")
   :BYTES 26420 :SHA256
   "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/tests/io/native.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/io/native.lisp")
   :BYTES 6207 :SHA256
   "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/tests/io/support.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/io/support.lisp")
   :BYTES 2951 :SHA256
   "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/tests/io/transfer.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/io/transfer.lisp")
   :BYTES 11847 :SHA256
   "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/lint-fixtures/bad.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/lint-fixtures/bad.lisp")
   :BYTES 1587 :SHA256
   "ac8912ce6cc1101f2ebc305a50c0565879547b527d7ca0aeac900ee06bf26652")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/lint-fixtures/good.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/lint-fixtures/good.lisp")
   :BYTES 671 :SHA256
   "05ce84f8fd12d9af48252601bcc92d6d60335b53f39b01a9fe2697c4bdaa8cee")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/lint-fixtures/keyword-barrier.lisp"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/lint-fixtures/keyword-barrier.lisp")
   :BYTES 199 :SHA256
   "e26dab117e9526ace35bb45b92f977065d33fcc4404c40fd4fc3c77749689a96")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/lint-fixtures/qualified-reader.lisp"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/lint-fixtures/qualified-reader.lisp")
   :BYTES 152 :SHA256
   "835229bdc1a0ed0c08511cd6121e1f1bc4284da2cfba951b72cd1a74a6040d35")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/tests/mvcc/capture.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/mvcc/capture.lisp")
   :BYTES 16356 :SHA256
   "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/tests/mvcc/lifecycle.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/mvcc/lifecycle.lisp")
   :BYTES 23964 :SHA256
   "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/tests/mvcc/support.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/mvcc/support.lisp")
   :BYTES 5931 :SHA256
   "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/recovery/corruption.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/recovery/corruption.lisp")
   :BYTES 7106 :SHA256
   "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/recovery/decisions-audit.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/recovery/decisions-audit.lisp")
   :BYTES 14971 :SHA256
   "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/recovery/decisions-radix.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/recovery/decisions-radix.lisp")
   :BYTES 27851 :SHA256
   "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/recovery/decisions-support.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/recovery/decisions-support.lisp")
   :BYTES 6797 :SHA256
   "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/recovery/decisions.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/recovery/decisions.lisp")
   :BYTES 19149 :SHA256
   "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/recovery/inventory-support.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/recovery/inventory-support.lisp")
   :BYTES 8083 :SHA256
   "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/recovery/inventory.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/recovery/inventory.lisp")
   :BYTES 14479 :SHA256
   "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/recovery/manifest-audit.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/recovery/manifest-audit.lisp")
   :BYTES 17670 :SHA256
   "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/recovery/manifest-support.lisp"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/recovery/manifest-support.lisp")
   :BYTES 9769 :SHA256
   "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/recovery/manifest.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/recovery/manifest.lisp")
   :BYTES 13799 :SHA256
   "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/tests/recovery/scan.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/recovery/scan.lisp")
   :BYTES 16966 :SHA256
   "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/recovery/support.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/recovery/support.lisp")
   :BYTES 5957 :SHA256
   "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/series/boundaries.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/series/boundaries.lisp")
   :BYTES 5802 :SHA256
   "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/series/controller.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/series/controller.lisp")
   :BYTES 60484 :SHA256
   "4bea80eb231575f48b208ddb57af6a11706481e0ec755b084f6cd4b6fd0481a1")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/tests/series/support.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/series/support.lisp")
   :BYTES 16885 :SHA256
   "8821ae9e002941eff8ea3ae7dbfc727cb6874b68d2d1ef85af668eb2d34a0c0c")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/tests/series/threads.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/series/threads.lisp")
   :BYTES 19694 :SHA256
   "bbea64d207d14698b39ab0f8ded03db11bab09955d3f66705c23d69c09aefc8e")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/tests/smoke.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/smoke.lisp")
   :BYTES 735 :SHA256
   "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/storage/compaction-scan.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/storage/compaction-scan.lisp")
   :BYTES 16196 :SHA256
   "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/storage/control-payload.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/storage/control-payload.lisp")
   :BYTES 12651 :SHA256
   "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/storage/log-header.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/storage/log-header.lisp")
   :BYTES 11969 :SHA256
   "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/storage/segment-header.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/storage/segment-header.lisp")
   :BYTES 4149 :SHA256
   "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/storage/support.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/storage/support.lisp")
   :BYTES 4029 :SHA256
   "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/tests/wal/builder.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/wal/builder.lisp")
   :BYTES 4000 :SHA256
   "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tests/wal/csn-threads.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/wal/csn-threads.lisp")
   :BYTES 12114 :SHA256
   "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/tests/wal/csn.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/wal/csn.lisp")
   :BYTES 34661 :SHA256
   "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/tests/wal/fault.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/wal/fault.lisp")
   :BYTES 7614 :SHA256
   "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/tests/wal/group.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/wal/group.lisp")
   :BYTES 5524 :SHA256
   "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/tests/wal/native.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/wal/native.lisp")
   :BYTES 2567 :SHA256
   "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/tests/wal/support.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tests/wal/support.lisp")
   :BYTES 1951 :SHA256
   "90a47539e5e2898c0a08059207f30bb5551e7ca8fc166f8f6ce7b95afa757295")
  (:PATH "raw/cbor-string-write-mutations-20261011/0/tools/build.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/0/tools/cbor-string-write-isolated-build.lisp"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/0/tools/cbor-string-write-isolated-build.lisp")
   :BYTES 478 :SHA256
   "30ff38194e7e250eca760daaece548a9c6bcc6291c1284d7640b36728f86b351")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/cache/build.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/cache/build.lisp")
   :BYTES 4966 :SHA256
   "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/cache/clock.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/cache/clock.lisp")
   :BYTES 2952 :SHA256
   "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/cache/core.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/cache/core.lisp")
   :BYTES 3503 :SHA256
   "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/cache/package.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/cache/package.lisp")
   :BYTES 758 :SHA256
   "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/cache/read.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/cache/read.lisp")
   :BYTES 6220 :SHA256
   "bf2232802b2f3648514dfb76f20e571797f981ebb3138f79fc1b42477df045e8")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/cache/types.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/cache/types.lisp")
   :BYTES 2448 :SHA256
   "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/cache/write.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/cache/write.lisp")
   :BYTES 5481 :SHA256
   "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/codec/cbor-float-minimal.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/codec/cbor-header.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/codec/cbor-minimal.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/codec/cbor-package.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/codec/cbor-package.lisp")
   :BYTES 579 :SHA256
   "f599073f7a2f085715caa30c78eaeda1a2feee7fed97f4fd33207e45c93455a1")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/codec/cbor-scan-input.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/codec/cbor-scan-items.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/codec/cbor-scan-minimal.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/codec/cbor-scan-stack.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/codec/cbor-scan.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/codec/cbor-space.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/codec/cbor-string-write.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/codec/cbor-string-write.lisp")
   :BYTES 7820 :SHA256
   "8f30d4e1986233b0e27ccf05dda7e6c69b80efe7673f04c6e2f79ea2f20af2fd")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/codec/cbor-write.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/codec/package.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/codec/utf8.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/csn/package.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/csn/package.lisp")
   :BYTES 441 :SHA256
   "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/csn/registry.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/csn/registry.lisp")
   :BYTES 12139 :SHA256
   "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/epochs/core.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/epochs/core.lisp")
   :BYTES 5909 :SHA256
   "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/epochs/package.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/epochs/package.lisp")
   :BYTES 779 :SHA256
   "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/epochs/read.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/epochs/read.lisp")
   :BYTES 3240 :SHA256
   "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/epochs/reclaim.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/epochs/reclaim.lisp")
   :BYTES 6373 :SHA256
   "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/epochs/retire.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/epochs/retire.lisp")
   :BYTES 5858 :SHA256
   "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/epochs/types.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/epochs/types.lisp")
   :BYTES 5304 :SHA256
   "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/execution/handoff.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/execution/handoff.lisp")
   :BYTES 7394 :SHA256
   "ee90c809ef51134efa21e08b819e5530304efaf9f9e26b63c7e4afbf6d48e607")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/execution/package.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/execution/package.lisp")
   :BYTES 1157 :SHA256
   "bbe8cdb6f7e74d7139f5e472a915cc74b43e34bd27ecac1c5fd364f723a2a643")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/execution/queue.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/execution/queue.lisp")
   :BYTES 5374 :SHA256
   "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/execution/ready-recycle.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/execution/ready-recycle.lisp")
   :BYTES 3387 :SHA256
   "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/execution/ready-types.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/execution/ready-types.lisp")
   :BYTES 5248 :SHA256
   "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/execution/ready.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/execution/ready.lisp")
   :BYTES 6635 :SHA256
   "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/execution/worker-boundary.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/execution/worker-boundary.lisp")
   :BYTES 2309 :SHA256
   "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/execution/worker-claim.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/execution/worker-claim.lisp")
   :BYTES 6401 :SHA256
   "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/execution/worker-run.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/execution/worker-run.lisp")
   :BYTES 5124 :SHA256
   "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/execution/worker-types.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/execution/worker-types.lisp")
   :BYTES 8461 :SHA256
   "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/execution/writer.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/execution/writer.lisp")
   :BYTES 6484 :SHA256
   "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/foundation/batch.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/foundation/binary.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/foundation/conditions.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/foundation/crc32c.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/foundation/package.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/foundation/record.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/index/core.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/index/core.lisp")
   :BYTES 2959 :SHA256
   "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/index/package.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/index/package.lisp")
   :BYTES 727 :SHA256
   "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/index/primary-arena.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/index/primary-arena.lisp")
   :BYTES 3485 :SHA256
   "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/index/primary-build.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/index/primary-build.lisp")
   :BYTES 4794 :SHA256
   "c38c654fd9fb4b1022c1b927cc956fc6e4fcfb4e6546241abab0ef1d2250982e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/index/primary-core.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/index/primary-core.lisp")
   :BYTES 4211 :SHA256
   "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/index/primary-directory.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/index/primary-directory.lisp")
   :BYTES 8114 :SHA256
   "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/index/primary-package.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/index/primary-package.lisp")
   :BYTES 1389 :SHA256
   "de63b143381f1d044df8f8f5545ac4230e1e6e3631ad015b5c4841ced70ecf8d")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/index/primary-probe.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/index/primary-probe.lisp")
   :BYTES 5936 :SHA256
   "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/index/primary-read.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/index/primary-read.lisp")
   :BYTES 3575 :SHA256
   "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/index/primary-relocate.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/index/primary-relocate.lisp")
   :BYTES 4073 :SHA256
   "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/index/primary-types.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/index/primary-types.lisp")
   :BYTES 3827 :SHA256
   "8fac31490331dcff794cedae79c3b9028922e18741c99d04404203f08ec3dcec")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/index/primary-write.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/index/primary-write.lisp")
   :BYTES 7061 :SHA256
   "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/index/read.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/index/read.lisp")
   :BYTES 3030 :SHA256
   "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/index/rebuild-budget.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/index/rebuild-budget.lisp")
   :BYTES 3593 :SHA256
   "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/index/rebuild-copy.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/index/rebuild-copy.lisp")
   :BYTES 4027 :SHA256
   "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/index/rebuild-scan.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/index/rebuild-scan.lisp")
   :BYTES 5002 :SHA256
   "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/index/rebuild.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/index/rebuild.lisp")
   :BYTES 2872 :SHA256
   "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/index/relocate.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/index/relocate.lisp")
   :BYTES 2383 :SHA256
   "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/index/types.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/index/types.lisp")
   :BYTES 2434 :SHA256
   "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/index/validation.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/index/validation.lisp")
   :BYTES 3930 :SHA256
   "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/index/write.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/index/write.lisp")
   :BYTES 4784 :SHA256
   "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/io/flush.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/io/flush.lisp")
   :BYTES 1569 :SHA256
   "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/io/lifecycle.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/io/lifecycle.lisp")
   :BYTES 4536 :SHA256
   "baa1f763fe0f394a14d381b753dcb1be1e90eb03eaff5d6469465b5d4eca015f")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/io/native.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/io/native.lisp")
   :BYTES 5026 :SHA256
   "b8cf3ce1ff7b4fa9def8a602ab768c0e9a321f8d6cdce6e5b2b7ded2fe3d97dd")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/io/package.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/io/package.lisp")
   :BYTES 592 :SHA256
   "118eba04ab2aa87a2d86e0b0269dbeacaa485457acebbc12c57317ae465a89c0")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/io/transfer.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/io/transfer.lisp")
   :BYTES 5051 :SHA256
   "3748328cf85e1c007900a63bdd0f159f38a8d7cd3577c92c56fc68692b9b7bcf")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/io/types.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/io/types.lisp")
   :BYTES 4143 :SHA256
   "50c7eeea91af232fca7103ce5a25535958d73836f01cb45a20c7120b88b1336b")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/mvcc/package.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/mvcc/package.lisp")
   :BYTES 833 :SHA256
   "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/mvcc/snapshots-core.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/mvcc/snapshots-core.lisp")
   :BYTES 7622 :SHA256
   "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/mvcc/snapshots-csn.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/mvcc/snapshots-csn.lisp")
   :BYTES 2725 :SHA256
   "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/mvcc/snapshots-lifecycle.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/mvcc/snapshots-lifecycle.lisp")
   :BYTES 6609 :SHA256
   "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/mvcc/snapshots-read.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/mvcc/snapshots-read.lisp")
   :BYTES 6651 :SHA256
   "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/mvcc/snapshots-register.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/mvcc/snapshots-register.lisp")
   :BYTES 6654 :SHA256
   "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/mvcc/snapshots-types.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/mvcc/snapshots-types.lisp")
   :BYTES 3817 :SHA256
   "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/mvcc/types.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/mvcc/types.lisp")
   :BYTES 471 :SHA256
   "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/package.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/read/core.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/read/core.lisp")
   :BYTES 3846 :SHA256
   "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/read/package.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/read/package.lisp")
   :BYTES 831 :SHA256
   "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/read/task.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/read/task.lisp")
   :BYTES 5073 :SHA256
   "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/read/types.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/read/types.lisp")
   :BYTES 2358 :SHA256
   "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/recovery/decisions-build.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/recovery/decisions-build.lisp")
   :BYTES 11857 :SHA256
   "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/recovery/decisions-package.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/recovery/decisions-package.lisp")
   :BYTES 818 :SHA256
   "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/recovery/decisions-query.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/recovery/decisions-query.lisp")
   :BYTES 4525 :SHA256
   "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/recovery/decisions-radix.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/recovery/decisions-radix.lisp")
   :BYTES 11061 :SHA256
   "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/recovery/decisions-sort.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/recovery/decisions-sort.lisp")
   :BYTES 7654 :SHA256
   "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/recovery/decisions-types.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/recovery/decisions-types.lisp")
   :BYTES 2056 :SHA256
   "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/recovery/inventory-build.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/recovery/inventory-build.lisp")
   :BYTES 9592 :SHA256
   "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/recovery/inventory-query.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/recovery/inventory-query.lisp")
   :BYTES 2100 :SHA256
   "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/recovery/inventory-types.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/recovery/inventory-types.lisp")
   :BYTES 2392 :SHA256
   "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/recovery/manifest-build.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/recovery/manifest-build.lisp")
   :BYTES 10251 :SHA256
   "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/recovery/manifest-decode.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/recovery/manifest-decode.lisp")
   :BYTES 6160 :SHA256
   "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/recovery/manifest-fold.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/recovery/manifest-fold.lisp")
   :BYTES 7068 :SHA256
   "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/recovery/manifest-package.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/recovery/manifest-package.lisp")
   :BYTES 1372 :SHA256
   "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/recovery/manifest-query.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/recovery/manifest-query.lisp")
   :BYTES 3582 :SHA256
   "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/recovery/manifest-types.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/recovery/manifest-types.lisp")
   :BYTES 3345 :SHA256
   "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/recovery/package.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/recovery/package.lisp")
   :BYTES 927 :SHA256
   "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/recovery/scan.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/recovery/scan.lisp")
   :BYTES 12829 :SHA256
   "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/series/events.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/series/events.lisp")
   :BYTES 9566 :SHA256
   "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/series/io-events.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/series/io-events.lisp")
   :BYTES 5385 :SHA256
   "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/series/ownership.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/series/ownership.lisp")
   :BYTES 8810 :SHA256
   "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/series/package.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/series/package.lisp")
   :BYTES 1392 :SHA256
   "7433162105df63d324141167e6dcf6bfee74611aa1cf7291cc6c92f41f3c7408")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/series/publication.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/series/publication.lisp")
   :BYTES 6094 :SHA256
   "288cb3fa41fad76a0e6919dfa0b2fce2beef15f5880129393bee35bc8795c762")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/series/query.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/series/query.lisp")
   :BYTES 3600 :SHA256
   "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/series/retirement.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/series/retirement.lisp")
   :BYTES 4634 :SHA256
   "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/series/types.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/series/types.lisp")
   :BYTES 3316 :SHA256
   "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/storage/compaction-scan.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/storage/compaction-scan.lisp")
   :BYTES 5510 :SHA256
   "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/storage/control-payload.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/storage/control-payload.lisp")
   :BYTES 6273 :SHA256
   "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/storage/formats.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/storage/formats.lisp")
   :BYTES 3841 :SHA256
   "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/storage/log-header.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/storage/log-header.lisp")
   :BYTES 3947 :SHA256
   "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/storage/package.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/storage/package.lisp")
   :BYTES 1079 :SHA256
   "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/storage/payload-record.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/storage/payload-record.lisp")
   :BYTES 3641 :SHA256
   "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/storage/payload-write.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/storage/payload-write.lisp")
   :BYTES 5239 :SHA256
   "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/src/storage/segment-header.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/storage/segment-header.lisp")
   :BYTES 5517 :SHA256
   "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/wal/builder.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/wal/builder.lisp")
   :BYTES 8445 :SHA256
   "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/wal/csn.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/wal/csn.lisp")
   :BYTES 9577 :SHA256
   "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/wal/executor.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/wal/executor.lisp")
   :BYTES 6023 :SHA256
   "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/wal/group.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/wal/group.lisp")
   :BYTES 6305 :SHA256
   "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/wal/package.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/wal/package.lisp")
   :BYTES 1774 :SHA256
   "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/src/wal/types.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/src/wal/types.lisp")
   :BYTES 5420 :SHA256
   "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/test.log" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/test.log")
   :BYTES 21660 :SHA256
   "e229dfbb33f4c5c0e08e132a092d87651921d19f93df4ca0849612319ec8ef13")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/codec/cbor-header.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/codec/cbor-header.lisp")
   :BYTES 10773 :SHA256
   "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/codec/cbor-minimal-edges.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/codec/cbor-minimal-edges.lisp")
   :BYTES 1613 :SHA256
   "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/codec/cbor-minimal-scan-support.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/codec/cbor-minimal-scan-support.lisp")
   :BYTES 8363 :SHA256
   "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/codec/cbor-minimal-scan-threads.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/codec/cbor-minimal-scan-threads.lisp")
   :BYTES 4547 :SHA256
   "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/codec/cbor-minimal-scan.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/codec/cbor-minimal-scan.lisp")
   :BYTES 19217 :SHA256
   "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/codec/cbor-minimal-support.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/codec/cbor-minimal-support.lisp")
   :BYTES 8620 :SHA256
   "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/codec/cbor-minimal-threads.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/codec/cbor-minimal-threads.lisp")
   :BYTES 3799 :SHA256
   "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/codec/cbor-minimal.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/codec/cbor-minimal.lisp")
   :BYTES 12604 :SHA256
   "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/codec/cbor-string-write-support.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/codec/cbor-string-write-support.lisp")
   :BYTES 6829 :SHA256
   "611ec1d825855d9df27988821ee45f0ecf81fbd3128a38df6ee5c727551cd9f2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/codec/cbor-string-write-threads.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/codec/cbor-string-write-threads.lisp")
   :BYTES 3311 :SHA256
   "d45b4dda658a96b9af9051b152df2b17859aecdbb9131505d1a2689b27ffb88a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/codec/cbor-string-write.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/codec/cbor-string-write.lisp")
   :BYTES 15883 :SHA256
   "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/codec/cbor-structure-support.lisp"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/codec/cbor-structure-threads.lisp"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/codec/cbor-structure-threads.lisp")
   :BYTES 4305 :SHA256
   "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/codec/cbor-structure.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/codec/cbor-structure.lisp")
   :BYTES 22968 :SHA256
   "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/codec/cbor-support.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/codec/cbor-threads.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/codec/cbor-threads.lisp")
   :BYTES 3683 :SHA256
   "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/codec/cbor-write-roundtrip.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/codec/cbor-write-roundtrip.lisp")
   :BYTES 901 :SHA256
   "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/codec/cbor-write-support.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/codec/cbor-write-support.lisp")
   :BYTES 4768 :SHA256
   "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/codec/cbor-write-threads.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/codec/cbor-write-threads.lisp")
   :BYTES 3813 :SHA256
   "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/codec/cbor-write.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/codec/cbor-write.lisp")
   :BYTES 9822 :SHA256
   "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/tests/codec/support.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/codec/support.lisp")
   :BYTES 5807 :SHA256
   "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/tests/codec/threads.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/codec/threads.lisp")
   :BYTES 3111 :SHA256
   "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/tests/codec/utf8.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/codec/utf8.lisp")
   :BYTES 12892 :SHA256
   "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/tests/csn/registry.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/csn/registry.lisp")
   :BYTES 19411 :SHA256
   "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/tests/csn/support.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/csn/support.lisp")
   :BYTES 11407 :SHA256
   "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/tests/csn/threads.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/csn/threads.lisp")
   :BYTES 10525 :SHA256
   "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/execution/handoff.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/execution/handoff.lisp")
   :BYTES 33278 :SHA256
   "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/execution/queue.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/execution/queue.lisp")
   :BYTES 12894 :SHA256
   "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/execution/ready-recycle.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/execution/ready-recycle.lisp")
   :BYTES 30075 :SHA256
   "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/execution/ready.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/execution/ready.lisp")
   :BYTES 33555 :SHA256
   "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/execution/support.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/execution/support.lisp")
   :BYTES 4469 :SHA256
   "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/execution/threads.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/execution/threads.lisp")
   :BYTES 14622 :SHA256
   "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/execution/worker.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/execution/worker.lisp")
   :BYTES 59783 :SHA256
   "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/foundation/batch.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/foundation/batch.lisp")
   :BYTES 5185 :SHA256
   "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/foundation/binary.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/foundation/binary.lisp")
   :BYTES 3721 :SHA256
   "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/foundation/record.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/foundation/record.lisp")
   :BYTES 14950 :SHA256
   "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/foundation/support.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/index/primary-support.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/index/primary-support.lisp")
   :BYTES 13938 :SHA256
   "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/index/primary-threads.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/index/primary-threads.lisp")
   :BYTES 13744 :SHA256
   "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/tests/index/primary.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/index/primary.lisp")
   :BYTES 30166 :SHA256
   "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/tests/index/rebuild.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/index/rebuild.lisp")
   :BYTES 32112 :SHA256
   "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/index/slot-support.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/index/slot-support.lisp")
   :BYTES 12800 :SHA256
   "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/index/slot-threads.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/index/slot-threads.lisp")
   :BYTES 11698 :SHA256
   "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/tests/index/slots.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/index/slots.lisp")
   :BYTES 26420 :SHA256
   "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/tests/io/native.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/io/native.lisp")
   :BYTES 6207 :SHA256
   "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/tests/io/support.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/io/support.lisp")
   :BYTES 2951 :SHA256
   "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/tests/io/transfer.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/io/transfer.lisp")
   :BYTES 11847 :SHA256
   "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/lint-fixtures/bad.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/lint-fixtures/bad.lisp")
   :BYTES 1587 :SHA256
   "ac8912ce6cc1101f2ebc305a50c0565879547b527d7ca0aeac900ee06bf26652")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/lint-fixtures/good.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/lint-fixtures/good.lisp")
   :BYTES 671 :SHA256
   "05ce84f8fd12d9af48252601bcc92d6d60335b53f39b01a9fe2697c4bdaa8cee")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/lint-fixtures/keyword-barrier.lisp"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/lint-fixtures/keyword-barrier.lisp")
   :BYTES 199 :SHA256
   "e26dab117e9526ace35bb45b92f977065d33fcc4404c40fd4fc3c77749689a96")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/lint-fixtures/qualified-reader.lisp"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/lint-fixtures/qualified-reader.lisp")
   :BYTES 152 :SHA256
   "835229bdc1a0ed0c08511cd6121e1f1bc4284da2cfba951b72cd1a74a6040d35")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/tests/mvcc/capture.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/mvcc/capture.lisp")
   :BYTES 16356 :SHA256
   "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/tests/mvcc/lifecycle.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/mvcc/lifecycle.lisp")
   :BYTES 23964 :SHA256
   "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/tests/mvcc/support.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/mvcc/support.lisp")
   :BYTES 5931 :SHA256
   "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/recovery/corruption.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/recovery/corruption.lisp")
   :BYTES 7106 :SHA256
   "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/recovery/decisions-audit.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/recovery/decisions-audit.lisp")
   :BYTES 14971 :SHA256
   "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/recovery/decisions-radix.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/recovery/decisions-radix.lisp")
   :BYTES 27851 :SHA256
   "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/recovery/decisions-support.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/recovery/decisions-support.lisp")
   :BYTES 6797 :SHA256
   "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/recovery/decisions.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/recovery/decisions.lisp")
   :BYTES 19149 :SHA256
   "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/recovery/inventory-support.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/recovery/inventory-support.lisp")
   :BYTES 8083 :SHA256
   "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/recovery/inventory.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/recovery/inventory.lisp")
   :BYTES 14479 :SHA256
   "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/recovery/manifest-audit.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/recovery/manifest-audit.lisp")
   :BYTES 17670 :SHA256
   "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/recovery/manifest-support.lisp"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/recovery/manifest-support.lisp")
   :BYTES 9769 :SHA256
   "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/recovery/manifest.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/recovery/manifest.lisp")
   :BYTES 13799 :SHA256
   "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/tests/recovery/scan.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/recovery/scan.lisp")
   :BYTES 16966 :SHA256
   "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/recovery/support.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/recovery/support.lisp")
   :BYTES 5957 :SHA256
   "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/series/boundaries.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/series/boundaries.lisp")
   :BYTES 5802 :SHA256
   "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/series/controller.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/series/controller.lisp")
   :BYTES 60484 :SHA256
   "4bea80eb231575f48b208ddb57af6a11706481e0ec755b084f6cd4b6fd0481a1")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/tests/series/support.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/series/support.lisp")
   :BYTES 16885 :SHA256
   "8821ae9e002941eff8ea3ae7dbfc727cb6874b68d2d1ef85af668eb2d34a0c0c")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/tests/series/threads.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/series/threads.lisp")
   :BYTES 19694 :SHA256
   "bbea64d207d14698b39ab0f8ded03db11bab09955d3f66705c23d69c09aefc8e")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/tests/smoke.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/smoke.lisp")
   :BYTES 735 :SHA256
   "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/storage/compaction-scan.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/storage/compaction-scan.lisp")
   :BYTES 16196 :SHA256
   "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/storage/control-payload.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/storage/control-payload.lisp")
   :BYTES 12651 :SHA256
   "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/storage/log-header.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/storage/log-header.lisp")
   :BYTES 11969 :SHA256
   "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/storage/segment-header.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/storage/segment-header.lisp")
   :BYTES 4149 :SHA256
   "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/storage/support.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/storage/support.lisp")
   :BYTES 4029 :SHA256
   "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/tests/wal/builder.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/wal/builder.lisp")
   :BYTES 4000 :SHA256
   "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tests/wal/csn-threads.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/wal/csn-threads.lisp")
   :BYTES 12114 :SHA256
   "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/tests/wal/csn.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/wal/csn.lisp")
   :BYTES 34661 :SHA256
   "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/tests/wal/fault.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/wal/fault.lisp")
   :BYTES 7614 :SHA256
   "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/tests/wal/group.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/wal/group.lisp")
   :BYTES 5524 :SHA256
   "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/tests/wal/native.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/wal/native.lisp")
   :BYTES 2567 :SHA256
   "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/tests/wal/support.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tests/wal/support.lisp")
   :BYTES 1951 :SHA256
   "90a47539e5e2898c0a08059207f30bb5551e7ca8fc166f8f6ce7b95afa757295")
  (:PATH "raw/cbor-string-write-mutations-20261011/1/tools/build.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/1/tools/cbor-string-write-isolated-build.lisp"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/1/tools/cbor-string-write-isolated-build.lisp")
   :BYTES 478 :SHA256
   "b2d001d46927712a1ce44a8e2279c779c0acf58d9e938da2da021fcf25003f7c")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/cache/build.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/cache/build.lisp")
   :BYTES 4966 :SHA256
   "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/cache/clock.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/cache/clock.lisp")
   :BYTES 2952 :SHA256
   "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/cache/core.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/cache/core.lisp")
   :BYTES 3503 :SHA256
   "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/cache/package.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/cache/package.lisp")
   :BYTES 758 :SHA256
   "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/cache/read.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/cache/read.lisp")
   :BYTES 6220 :SHA256
   "bf2232802b2f3648514dfb76f20e571797f981ebb3138f79fc1b42477df045e8")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/cache/types.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/cache/types.lisp")
   :BYTES 2448 :SHA256
   "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/cache/write.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/cache/write.lisp")
   :BYTES 5481 :SHA256
   "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/codec/cbor-float-minimal.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/codec/cbor-header.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/codec/cbor-minimal.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/codec/cbor-package.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/codec/cbor-package.lisp")
   :BYTES 579 :SHA256
   "f599073f7a2f085715caa30c78eaeda1a2feee7fed97f4fd33207e45c93455a1")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/codec/cbor-scan-input.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/codec/cbor-scan-items.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/codec/cbor-scan-minimal.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/codec/cbor-scan-stack.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/codec/cbor-scan.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/codec/cbor-space.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/codec/cbor-string-write.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/codec/cbor-string-write.lisp")
   :BYTES 7743 :SHA256
   "57efab6ab8206f3a41283e358b6257bf8d0294cebbccc18837dbd7eaaa18da8b")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/codec/cbor-write.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/codec/package.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/codec/utf8.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/csn/package.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/csn/package.lisp")
   :BYTES 441 :SHA256
   "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/csn/registry.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/csn/registry.lisp")
   :BYTES 12139 :SHA256
   "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/epochs/core.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/epochs/core.lisp")
   :BYTES 5909 :SHA256
   "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/epochs/package.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/epochs/package.lisp")
   :BYTES 779 :SHA256
   "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/epochs/read.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/epochs/read.lisp")
   :BYTES 3240 :SHA256
   "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/epochs/reclaim.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/epochs/reclaim.lisp")
   :BYTES 6373 :SHA256
   "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/epochs/retire.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/epochs/retire.lisp")
   :BYTES 5858 :SHA256
   "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/epochs/types.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/epochs/types.lisp")
   :BYTES 5304 :SHA256
   "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/execution/handoff.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/execution/handoff.lisp")
   :BYTES 7394 :SHA256
   "ee90c809ef51134efa21e08b819e5530304efaf9f9e26b63c7e4afbf6d48e607")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/execution/package.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/execution/package.lisp")
   :BYTES 1157 :SHA256
   "bbe8cdb6f7e74d7139f5e472a915cc74b43e34bd27ecac1c5fd364f723a2a643")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/execution/queue.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/execution/queue.lisp")
   :BYTES 5374 :SHA256
   "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/execution/ready-recycle.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/execution/ready-recycle.lisp")
   :BYTES 3387 :SHA256
   "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/execution/ready-types.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/execution/ready-types.lisp")
   :BYTES 5248 :SHA256
   "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/execution/ready.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/execution/ready.lisp")
   :BYTES 6635 :SHA256
   "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/execution/worker-boundary.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/execution/worker-boundary.lisp")
   :BYTES 2309 :SHA256
   "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/execution/worker-claim.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/execution/worker-claim.lisp")
   :BYTES 6401 :SHA256
   "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/execution/worker-run.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/execution/worker-run.lisp")
   :BYTES 5124 :SHA256
   "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/execution/worker-types.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/execution/worker-types.lisp")
   :BYTES 8461 :SHA256
   "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/execution/writer.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/execution/writer.lisp")
   :BYTES 6484 :SHA256
   "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/foundation/batch.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/foundation/binary.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/foundation/conditions.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/foundation/crc32c.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/foundation/package.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/foundation/record.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/index/core.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/index/core.lisp")
   :BYTES 2959 :SHA256
   "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/index/package.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/index/package.lisp")
   :BYTES 727 :SHA256
   "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/index/primary-arena.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/index/primary-arena.lisp")
   :BYTES 3485 :SHA256
   "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/index/primary-build.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/index/primary-build.lisp")
   :BYTES 4794 :SHA256
   "c38c654fd9fb4b1022c1b927cc956fc6e4fcfb4e6546241abab0ef1d2250982e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/index/primary-core.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/index/primary-core.lisp")
   :BYTES 4211 :SHA256
   "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/index/primary-directory.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/index/primary-directory.lisp")
   :BYTES 8114 :SHA256
   "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/index/primary-package.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/index/primary-package.lisp")
   :BYTES 1389 :SHA256
   "de63b143381f1d044df8f8f5545ac4230e1e6e3631ad015b5c4841ced70ecf8d")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/index/primary-probe.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/index/primary-probe.lisp")
   :BYTES 5936 :SHA256
   "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/index/primary-read.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/index/primary-read.lisp")
   :BYTES 3575 :SHA256
   "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/index/primary-relocate.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/index/primary-relocate.lisp")
   :BYTES 4073 :SHA256
   "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/index/primary-types.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/index/primary-types.lisp")
   :BYTES 3827 :SHA256
   "8fac31490331dcff794cedae79c3b9028922e18741c99d04404203f08ec3dcec")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/index/primary-write.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/index/primary-write.lisp")
   :BYTES 7061 :SHA256
   "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/index/read.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/index/read.lisp")
   :BYTES 3030 :SHA256
   "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/index/rebuild-budget.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/index/rebuild-budget.lisp")
   :BYTES 3593 :SHA256
   "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/index/rebuild-copy.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/index/rebuild-copy.lisp")
   :BYTES 4027 :SHA256
   "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/index/rebuild-scan.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/index/rebuild-scan.lisp")
   :BYTES 5002 :SHA256
   "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/index/rebuild.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/index/rebuild.lisp")
   :BYTES 2872 :SHA256
   "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/index/relocate.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/index/relocate.lisp")
   :BYTES 2383 :SHA256
   "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/index/types.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/index/types.lisp")
   :BYTES 2434 :SHA256
   "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/index/validation.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/index/validation.lisp")
   :BYTES 3930 :SHA256
   "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/index/write.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/index/write.lisp")
   :BYTES 4784 :SHA256
   "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/io/flush.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/io/flush.lisp")
   :BYTES 1569 :SHA256
   "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/io/lifecycle.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/io/lifecycle.lisp")
   :BYTES 4536 :SHA256
   "baa1f763fe0f394a14d381b753dcb1be1e90eb03eaff5d6469465b5d4eca015f")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/io/native.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/io/native.lisp")
   :BYTES 5026 :SHA256
   "b8cf3ce1ff7b4fa9def8a602ab768c0e9a321f8d6cdce6e5b2b7ded2fe3d97dd")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/io/package.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/io/package.lisp")
   :BYTES 592 :SHA256
   "118eba04ab2aa87a2d86e0b0269dbeacaa485457acebbc12c57317ae465a89c0")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/io/transfer.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/io/transfer.lisp")
   :BYTES 5051 :SHA256
   "3748328cf85e1c007900a63bdd0f159f38a8d7cd3577c92c56fc68692b9b7bcf")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/io/types.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/io/types.lisp")
   :BYTES 4143 :SHA256
   "50c7eeea91af232fca7103ce5a25535958d73836f01cb45a20c7120b88b1336b")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/mvcc/package.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/mvcc/package.lisp")
   :BYTES 833 :SHA256
   "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/mvcc/snapshots-core.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/mvcc/snapshots-core.lisp")
   :BYTES 7622 :SHA256
   "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/mvcc/snapshots-csn.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/mvcc/snapshots-csn.lisp")
   :BYTES 2725 :SHA256
   "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/mvcc/snapshots-lifecycle.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/mvcc/snapshots-lifecycle.lisp")
   :BYTES 6609 :SHA256
   "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/mvcc/snapshots-read.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/mvcc/snapshots-read.lisp")
   :BYTES 6651 :SHA256
   "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/mvcc/snapshots-register.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/mvcc/snapshots-register.lisp")
   :BYTES 6654 :SHA256
   "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/mvcc/snapshots-types.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/mvcc/snapshots-types.lisp")
   :BYTES 3817 :SHA256
   "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/mvcc/types.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/mvcc/types.lisp")
   :BYTES 471 :SHA256
   "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/package.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/read/core.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/read/core.lisp")
   :BYTES 3846 :SHA256
   "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/read/package.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/read/package.lisp")
   :BYTES 831 :SHA256
   "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/read/task.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/read/task.lisp")
   :BYTES 5073 :SHA256
   "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/read/types.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/read/types.lisp")
   :BYTES 2358 :SHA256
   "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/recovery/decisions-build.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/recovery/decisions-build.lisp")
   :BYTES 11857 :SHA256
   "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/recovery/decisions-package.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/recovery/decisions-package.lisp")
   :BYTES 818 :SHA256
   "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/recovery/decisions-query.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/recovery/decisions-query.lisp")
   :BYTES 4525 :SHA256
   "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/recovery/decisions-radix.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/recovery/decisions-radix.lisp")
   :BYTES 11061 :SHA256
   "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/recovery/decisions-sort.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/recovery/decisions-sort.lisp")
   :BYTES 7654 :SHA256
   "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/recovery/decisions-types.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/recovery/decisions-types.lisp")
   :BYTES 2056 :SHA256
   "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/recovery/inventory-build.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/recovery/inventory-build.lisp")
   :BYTES 9592 :SHA256
   "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/recovery/inventory-query.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/recovery/inventory-query.lisp")
   :BYTES 2100 :SHA256
   "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/recovery/inventory-types.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/recovery/inventory-types.lisp")
   :BYTES 2392 :SHA256
   "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/recovery/manifest-build.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/recovery/manifest-build.lisp")
   :BYTES 10251 :SHA256
   "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/recovery/manifest-decode.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/recovery/manifest-decode.lisp")
   :BYTES 6160 :SHA256
   "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/recovery/manifest-fold.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/recovery/manifest-fold.lisp")
   :BYTES 7068 :SHA256
   "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/recovery/manifest-package.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/recovery/manifest-package.lisp")
   :BYTES 1372 :SHA256
   "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/recovery/manifest-query.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/recovery/manifest-query.lisp")
   :BYTES 3582 :SHA256
   "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/recovery/manifest-types.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/recovery/manifest-types.lisp")
   :BYTES 3345 :SHA256
   "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/recovery/package.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/recovery/package.lisp")
   :BYTES 927 :SHA256
   "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/recovery/scan.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/recovery/scan.lisp")
   :BYTES 12829 :SHA256
   "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/series/events.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/series/events.lisp")
   :BYTES 9566 :SHA256
   "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/series/io-events.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/series/io-events.lisp")
   :BYTES 5385 :SHA256
   "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/series/ownership.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/series/ownership.lisp")
   :BYTES 8810 :SHA256
   "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/series/package.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/series/package.lisp")
   :BYTES 1392 :SHA256
   "7433162105df63d324141167e6dcf6bfee74611aa1cf7291cc6c92f41f3c7408")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/series/publication.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/series/publication.lisp")
   :BYTES 6094 :SHA256
   "288cb3fa41fad76a0e6919dfa0b2fce2beef15f5880129393bee35bc8795c762")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/series/query.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/series/query.lisp")
   :BYTES 3600 :SHA256
   "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/series/retirement.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/series/retirement.lisp")
   :BYTES 4634 :SHA256
   "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/series/types.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/series/types.lisp")
   :BYTES 3316 :SHA256
   "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/storage/compaction-scan.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/storage/compaction-scan.lisp")
   :BYTES 5510 :SHA256
   "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/storage/control-payload.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/storage/control-payload.lisp")
   :BYTES 6273 :SHA256
   "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/storage/formats.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/storage/formats.lisp")
   :BYTES 3841 :SHA256
   "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/storage/log-header.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/storage/log-header.lisp")
   :BYTES 3947 :SHA256
   "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/storage/package.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/storage/package.lisp")
   :BYTES 1079 :SHA256
   "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/storage/payload-record.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/storage/payload-record.lisp")
   :BYTES 3641 :SHA256
   "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/storage/payload-write.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/storage/payload-write.lisp")
   :BYTES 5239 :SHA256
   "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/src/storage/segment-header.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/storage/segment-header.lisp")
   :BYTES 5517 :SHA256
   "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/wal/builder.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/wal/builder.lisp")
   :BYTES 8445 :SHA256
   "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/wal/csn.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/wal/csn.lisp")
   :BYTES 9577 :SHA256
   "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/wal/executor.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/wal/executor.lisp")
   :BYTES 6023 :SHA256
   "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/wal/group.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/wal/group.lisp")
   :BYTES 6305 :SHA256
   "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/wal/package.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/wal/package.lisp")
   :BYTES 1774 :SHA256
   "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/src/wal/types.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/src/wal/types.lisp")
   :BYTES 5420 :SHA256
   "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/test.log" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/test.log")
   :BYTES 21798 :SHA256
   "90d379786fd9937af2bd95f59368c5459b6669f09daf270f646e5601884b9aa2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/codec/cbor-header.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/codec/cbor-header.lisp")
   :BYTES 10773 :SHA256
   "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/codec/cbor-minimal-edges.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/codec/cbor-minimal-edges.lisp")
   :BYTES 1613 :SHA256
   "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/codec/cbor-minimal-scan-support.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/codec/cbor-minimal-scan-support.lisp")
   :BYTES 8363 :SHA256
   "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/codec/cbor-minimal-scan-threads.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/codec/cbor-minimal-scan-threads.lisp")
   :BYTES 4547 :SHA256
   "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/codec/cbor-minimal-scan.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/codec/cbor-minimal-scan.lisp")
   :BYTES 19217 :SHA256
   "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/codec/cbor-minimal-support.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/codec/cbor-minimal-support.lisp")
   :BYTES 8620 :SHA256
   "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/codec/cbor-minimal-threads.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/codec/cbor-minimal-threads.lisp")
   :BYTES 3799 :SHA256
   "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/codec/cbor-minimal.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/codec/cbor-minimal.lisp")
   :BYTES 12604 :SHA256
   "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/codec/cbor-string-write-support.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/codec/cbor-string-write-support.lisp")
   :BYTES 6829 :SHA256
   "611ec1d825855d9df27988821ee45f0ecf81fbd3128a38df6ee5c727551cd9f2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/codec/cbor-string-write-threads.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/codec/cbor-string-write-threads.lisp")
   :BYTES 3311 :SHA256
   "d45b4dda658a96b9af9051b152df2b17859aecdbb9131505d1a2689b27ffb88a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/codec/cbor-string-write.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/codec/cbor-string-write.lisp")
   :BYTES 15883 :SHA256
   "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/codec/cbor-structure-support.lisp"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/codec/cbor-structure-threads.lisp"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/codec/cbor-structure-threads.lisp")
   :BYTES 4305 :SHA256
   "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/codec/cbor-structure.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/codec/cbor-structure.lisp")
   :BYTES 22968 :SHA256
   "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/codec/cbor-support.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/codec/cbor-threads.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/codec/cbor-threads.lisp")
   :BYTES 3683 :SHA256
   "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/codec/cbor-write-roundtrip.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/codec/cbor-write-roundtrip.lisp")
   :BYTES 901 :SHA256
   "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/codec/cbor-write-support.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/codec/cbor-write-support.lisp")
   :BYTES 4768 :SHA256
   "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/codec/cbor-write-threads.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/codec/cbor-write-threads.lisp")
   :BYTES 3813 :SHA256
   "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/codec/cbor-write.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/codec/cbor-write.lisp")
   :BYTES 9822 :SHA256
   "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/tests/codec/support.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/codec/support.lisp")
   :BYTES 5807 :SHA256
   "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/tests/codec/threads.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/codec/threads.lisp")
   :BYTES 3111 :SHA256
   "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/tests/codec/utf8.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/codec/utf8.lisp")
   :BYTES 12892 :SHA256
   "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/tests/csn/registry.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/csn/registry.lisp")
   :BYTES 19411 :SHA256
   "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/tests/csn/support.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/csn/support.lisp")
   :BYTES 11407 :SHA256
   "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/tests/csn/threads.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/csn/threads.lisp")
   :BYTES 10525 :SHA256
   "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/execution/handoff.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/execution/handoff.lisp")
   :BYTES 33278 :SHA256
   "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/execution/queue.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/execution/queue.lisp")
   :BYTES 12894 :SHA256
   "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/execution/ready-recycle.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/execution/ready-recycle.lisp")
   :BYTES 30075 :SHA256
   "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/execution/ready.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/execution/ready.lisp")
   :BYTES 33555 :SHA256
   "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/execution/support.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/execution/support.lisp")
   :BYTES 4469 :SHA256
   "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/execution/threads.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/execution/threads.lisp")
   :BYTES 14622 :SHA256
   "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/execution/worker.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/execution/worker.lisp")
   :BYTES 59783 :SHA256
   "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/foundation/batch.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/foundation/batch.lisp")
   :BYTES 5185 :SHA256
   "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/foundation/binary.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/foundation/binary.lisp")
   :BYTES 3721 :SHA256
   "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/foundation/record.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/foundation/record.lisp")
   :BYTES 14950 :SHA256
   "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/foundation/support.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/index/primary-support.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/index/primary-support.lisp")
   :BYTES 13938 :SHA256
   "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/index/primary-threads.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/index/primary-threads.lisp")
   :BYTES 13744 :SHA256
   "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/tests/index/primary.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/index/primary.lisp")
   :BYTES 30166 :SHA256
   "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/tests/index/rebuild.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/index/rebuild.lisp")
   :BYTES 32112 :SHA256
   "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/index/slot-support.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/index/slot-support.lisp")
   :BYTES 12800 :SHA256
   "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/index/slot-threads.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/index/slot-threads.lisp")
   :BYTES 11698 :SHA256
   "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/tests/index/slots.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/index/slots.lisp")
   :BYTES 26420 :SHA256
   "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/tests/io/native.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/io/native.lisp")
   :BYTES 6207 :SHA256
   "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/tests/io/support.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/io/support.lisp")
   :BYTES 2951 :SHA256
   "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/tests/io/transfer.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/io/transfer.lisp")
   :BYTES 11847 :SHA256
   "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/lint-fixtures/bad.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/lint-fixtures/bad.lisp")
   :BYTES 1587 :SHA256
   "ac8912ce6cc1101f2ebc305a50c0565879547b527d7ca0aeac900ee06bf26652")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/lint-fixtures/good.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/lint-fixtures/good.lisp")
   :BYTES 671 :SHA256
   "05ce84f8fd12d9af48252601bcc92d6d60335b53f39b01a9fe2697c4bdaa8cee")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/lint-fixtures/keyword-barrier.lisp"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/lint-fixtures/keyword-barrier.lisp")
   :BYTES 199 :SHA256
   "e26dab117e9526ace35bb45b92f977065d33fcc4404c40fd4fc3c77749689a96")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/lint-fixtures/qualified-reader.lisp"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/lint-fixtures/qualified-reader.lisp")
   :BYTES 152 :SHA256
   "835229bdc1a0ed0c08511cd6121e1f1bc4284da2cfba951b72cd1a74a6040d35")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/tests/mvcc/capture.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/mvcc/capture.lisp")
   :BYTES 16356 :SHA256
   "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/tests/mvcc/lifecycle.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/mvcc/lifecycle.lisp")
   :BYTES 23964 :SHA256
   "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/tests/mvcc/support.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/mvcc/support.lisp")
   :BYTES 5931 :SHA256
   "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/recovery/corruption.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/recovery/corruption.lisp")
   :BYTES 7106 :SHA256
   "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/recovery/decisions-audit.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/recovery/decisions-audit.lisp")
   :BYTES 14971 :SHA256
   "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/recovery/decisions-radix.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/recovery/decisions-radix.lisp")
   :BYTES 27851 :SHA256
   "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/recovery/decisions-support.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/recovery/decisions-support.lisp")
   :BYTES 6797 :SHA256
   "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/recovery/decisions.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/recovery/decisions.lisp")
   :BYTES 19149 :SHA256
   "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/recovery/inventory-support.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/recovery/inventory-support.lisp")
   :BYTES 8083 :SHA256
   "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/recovery/inventory.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/recovery/inventory.lisp")
   :BYTES 14479 :SHA256
   "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/recovery/manifest-audit.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/recovery/manifest-audit.lisp")
   :BYTES 17670 :SHA256
   "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/recovery/manifest-support.lisp"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/recovery/manifest-support.lisp")
   :BYTES 9769 :SHA256
   "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/recovery/manifest.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/recovery/manifest.lisp")
   :BYTES 13799 :SHA256
   "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/tests/recovery/scan.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/recovery/scan.lisp")
   :BYTES 16966 :SHA256
   "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/recovery/support.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/recovery/support.lisp")
   :BYTES 5957 :SHA256
   "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/series/boundaries.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/series/boundaries.lisp")
   :BYTES 5802 :SHA256
   "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/series/controller.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/series/controller.lisp")
   :BYTES 60484 :SHA256
   "4bea80eb231575f48b208ddb57af6a11706481e0ec755b084f6cd4b6fd0481a1")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/tests/series/support.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/series/support.lisp")
   :BYTES 16885 :SHA256
   "8821ae9e002941eff8ea3ae7dbfc727cb6874b68d2d1ef85af668eb2d34a0c0c")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/tests/series/threads.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/series/threads.lisp")
   :BYTES 19694 :SHA256
   "bbea64d207d14698b39ab0f8ded03db11bab09955d3f66705c23d69c09aefc8e")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/tests/smoke.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/smoke.lisp")
   :BYTES 735 :SHA256
   "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/storage/compaction-scan.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/storage/compaction-scan.lisp")
   :BYTES 16196 :SHA256
   "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/storage/control-payload.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/storage/control-payload.lisp")
   :BYTES 12651 :SHA256
   "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/storage/log-header.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/storage/log-header.lisp")
   :BYTES 11969 :SHA256
   "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/storage/segment-header.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/storage/segment-header.lisp")
   :BYTES 4149 :SHA256
   "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/storage/support.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/storage/support.lisp")
   :BYTES 4029 :SHA256
   "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/tests/wal/builder.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/wal/builder.lisp")
   :BYTES 4000 :SHA256
   "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tests/wal/csn-threads.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/wal/csn-threads.lisp")
   :BYTES 12114 :SHA256
   "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/tests/wal/csn.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/wal/csn.lisp")
   :BYTES 34661 :SHA256
   "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/tests/wal/fault.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/wal/fault.lisp")
   :BYTES 7614 :SHA256
   "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/tests/wal/group.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/wal/group.lisp")
   :BYTES 5524 :SHA256
   "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/tests/wal/native.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/wal/native.lisp")
   :BYTES 2567 :SHA256
   "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/tests/wal/support.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tests/wal/support.lisp")
   :BYTES 1951 :SHA256
   "90a47539e5e2898c0a08059207f30bb5551e7ca8fc166f8f6ce7b95afa757295")
  (:PATH "raw/cbor-string-write-mutations-20261011/2/tools/build.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/2/tools/cbor-string-write-isolated-build.lisp"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/2/tools/cbor-string-write-isolated-build.lisp")
   :BYTES 478 :SHA256
   "f75b65d1d1da933849213cfb7e5ed6564b810d480caf53dfa6fcacfeeb40776e")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/cache/build.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/cache/build.lisp")
   :BYTES 4966 :SHA256
   "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/cache/clock.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/cache/clock.lisp")
   :BYTES 2952 :SHA256
   "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/cache/core.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/cache/core.lisp")
   :BYTES 3503 :SHA256
   "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/cache/package.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/cache/package.lisp")
   :BYTES 758 :SHA256
   "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/cache/read.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/cache/read.lisp")
   :BYTES 6220 :SHA256
   "bf2232802b2f3648514dfb76f20e571797f981ebb3138f79fc1b42477df045e8")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/cache/types.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/cache/types.lisp")
   :BYTES 2448 :SHA256
   "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/cache/write.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/cache/write.lisp")
   :BYTES 5481 :SHA256
   "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/codec/cbor-float-minimal.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/codec/cbor-header.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/codec/cbor-minimal.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/codec/cbor-package.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/codec/cbor-package.lisp")
   :BYTES 579 :SHA256
   "f599073f7a2f085715caa30c78eaeda1a2feee7fed97f4fd33207e45c93455a1")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/codec/cbor-scan-input.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/codec/cbor-scan-items.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/codec/cbor-scan-minimal.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/codec/cbor-scan-stack.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/codec/cbor-scan.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/codec/cbor-space.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/codec/cbor-string-write.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/codec/cbor-string-write.lisp")
   :BYTES 7726 :SHA256
   "22447c2e4c9222896ca66fccb17b22fa58b5dad3b173817c7f57e59dc8808a94")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/codec/cbor-write.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/codec/package.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/codec/utf8.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/csn/package.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/csn/package.lisp")
   :BYTES 441 :SHA256
   "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/csn/registry.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/csn/registry.lisp")
   :BYTES 12139 :SHA256
   "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/epochs/core.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/epochs/core.lisp")
   :BYTES 5909 :SHA256
   "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/epochs/package.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/epochs/package.lisp")
   :BYTES 779 :SHA256
   "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/epochs/read.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/epochs/read.lisp")
   :BYTES 3240 :SHA256
   "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/epochs/reclaim.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/epochs/reclaim.lisp")
   :BYTES 6373 :SHA256
   "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/epochs/retire.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/epochs/retire.lisp")
   :BYTES 5858 :SHA256
   "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/epochs/types.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/epochs/types.lisp")
   :BYTES 5304 :SHA256
   "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/execution/handoff.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/execution/handoff.lisp")
   :BYTES 7394 :SHA256
   "ee90c809ef51134efa21e08b819e5530304efaf9f9e26b63c7e4afbf6d48e607")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/execution/package.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/execution/package.lisp")
   :BYTES 1157 :SHA256
   "bbe8cdb6f7e74d7139f5e472a915cc74b43e34bd27ecac1c5fd364f723a2a643")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/execution/queue.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/execution/queue.lisp")
   :BYTES 5374 :SHA256
   "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/execution/ready-recycle.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/execution/ready-recycle.lisp")
   :BYTES 3387 :SHA256
   "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/execution/ready-types.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/execution/ready-types.lisp")
   :BYTES 5248 :SHA256
   "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/execution/ready.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/execution/ready.lisp")
   :BYTES 6635 :SHA256
   "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/execution/worker-boundary.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/execution/worker-boundary.lisp")
   :BYTES 2309 :SHA256
   "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/execution/worker-claim.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/execution/worker-claim.lisp")
   :BYTES 6401 :SHA256
   "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/execution/worker-run.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/execution/worker-run.lisp")
   :BYTES 5124 :SHA256
   "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/execution/worker-types.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/execution/worker-types.lisp")
   :BYTES 8461 :SHA256
   "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/execution/writer.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/execution/writer.lisp")
   :BYTES 6484 :SHA256
   "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/foundation/batch.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/foundation/binary.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/foundation/conditions.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/foundation/crc32c.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/foundation/package.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/foundation/record.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/index/core.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/index/core.lisp")
   :BYTES 2959 :SHA256
   "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/index/package.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/index/package.lisp")
   :BYTES 727 :SHA256
   "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/index/primary-arena.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/index/primary-arena.lisp")
   :BYTES 3485 :SHA256
   "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/index/primary-build.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/index/primary-build.lisp")
   :BYTES 4794 :SHA256
   "c38c654fd9fb4b1022c1b927cc956fc6e4fcfb4e6546241abab0ef1d2250982e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/index/primary-core.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/index/primary-core.lisp")
   :BYTES 4211 :SHA256
   "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/index/primary-directory.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/index/primary-directory.lisp")
   :BYTES 8114 :SHA256
   "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/index/primary-package.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/index/primary-package.lisp")
   :BYTES 1389 :SHA256
   "de63b143381f1d044df8f8f5545ac4230e1e6e3631ad015b5c4841ced70ecf8d")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/index/primary-probe.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/index/primary-probe.lisp")
   :BYTES 5936 :SHA256
   "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/index/primary-read.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/index/primary-read.lisp")
   :BYTES 3575 :SHA256
   "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/index/primary-relocate.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/index/primary-relocate.lisp")
   :BYTES 4073 :SHA256
   "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/index/primary-types.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/index/primary-types.lisp")
   :BYTES 3827 :SHA256
   "8fac31490331dcff794cedae79c3b9028922e18741c99d04404203f08ec3dcec")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/index/primary-write.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/index/primary-write.lisp")
   :BYTES 7061 :SHA256
   "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/index/read.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/index/read.lisp")
   :BYTES 3030 :SHA256
   "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/index/rebuild-budget.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/index/rebuild-budget.lisp")
   :BYTES 3593 :SHA256
   "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/index/rebuild-copy.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/index/rebuild-copy.lisp")
   :BYTES 4027 :SHA256
   "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/index/rebuild-scan.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/index/rebuild-scan.lisp")
   :BYTES 5002 :SHA256
   "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/index/rebuild.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/index/rebuild.lisp")
   :BYTES 2872 :SHA256
   "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/index/relocate.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/index/relocate.lisp")
   :BYTES 2383 :SHA256
   "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/index/types.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/index/types.lisp")
   :BYTES 2434 :SHA256
   "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/index/validation.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/index/validation.lisp")
   :BYTES 3930 :SHA256
   "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/index/write.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/index/write.lisp")
   :BYTES 4784 :SHA256
   "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/io/flush.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/io/flush.lisp")
   :BYTES 1569 :SHA256
   "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/io/lifecycle.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/io/lifecycle.lisp")
   :BYTES 4536 :SHA256
   "baa1f763fe0f394a14d381b753dcb1be1e90eb03eaff5d6469465b5d4eca015f")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/io/native.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/io/native.lisp")
   :BYTES 5026 :SHA256
   "b8cf3ce1ff7b4fa9def8a602ab768c0e9a321f8d6cdce6e5b2b7ded2fe3d97dd")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/io/package.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/io/package.lisp")
   :BYTES 592 :SHA256
   "118eba04ab2aa87a2d86e0b0269dbeacaa485457acebbc12c57317ae465a89c0")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/io/transfer.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/io/transfer.lisp")
   :BYTES 5051 :SHA256
   "3748328cf85e1c007900a63bdd0f159f38a8d7cd3577c92c56fc68692b9b7bcf")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/io/types.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/io/types.lisp")
   :BYTES 4143 :SHA256
   "50c7eeea91af232fca7103ce5a25535958d73836f01cb45a20c7120b88b1336b")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/mvcc/package.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/mvcc/package.lisp")
   :BYTES 833 :SHA256
   "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/mvcc/snapshots-core.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/mvcc/snapshots-core.lisp")
   :BYTES 7622 :SHA256
   "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/mvcc/snapshots-csn.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/mvcc/snapshots-csn.lisp")
   :BYTES 2725 :SHA256
   "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/mvcc/snapshots-lifecycle.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/mvcc/snapshots-lifecycle.lisp")
   :BYTES 6609 :SHA256
   "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/mvcc/snapshots-read.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/mvcc/snapshots-read.lisp")
   :BYTES 6651 :SHA256
   "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/mvcc/snapshots-register.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/mvcc/snapshots-register.lisp")
   :BYTES 6654 :SHA256
   "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/mvcc/snapshots-types.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/mvcc/snapshots-types.lisp")
   :BYTES 3817 :SHA256
   "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/mvcc/types.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/mvcc/types.lisp")
   :BYTES 471 :SHA256
   "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/package.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/read/core.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/read/core.lisp")
   :BYTES 3846 :SHA256
   "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/read/package.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/read/package.lisp")
   :BYTES 831 :SHA256
   "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/read/task.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/read/task.lisp")
   :BYTES 5073 :SHA256
   "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/read/types.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/read/types.lisp")
   :BYTES 2358 :SHA256
   "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/recovery/decisions-build.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/recovery/decisions-build.lisp")
   :BYTES 11857 :SHA256
   "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/recovery/decisions-package.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/recovery/decisions-package.lisp")
   :BYTES 818 :SHA256
   "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/recovery/decisions-query.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/recovery/decisions-query.lisp")
   :BYTES 4525 :SHA256
   "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/recovery/decisions-radix.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/recovery/decisions-radix.lisp")
   :BYTES 11061 :SHA256
   "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/recovery/decisions-sort.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/recovery/decisions-sort.lisp")
   :BYTES 7654 :SHA256
   "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/recovery/decisions-types.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/recovery/decisions-types.lisp")
   :BYTES 2056 :SHA256
   "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/recovery/inventory-build.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/recovery/inventory-build.lisp")
   :BYTES 9592 :SHA256
   "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/recovery/inventory-query.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/recovery/inventory-query.lisp")
   :BYTES 2100 :SHA256
   "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/recovery/inventory-types.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/recovery/inventory-types.lisp")
   :BYTES 2392 :SHA256
   "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/recovery/manifest-build.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/recovery/manifest-build.lisp")
   :BYTES 10251 :SHA256
   "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/recovery/manifest-decode.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/recovery/manifest-decode.lisp")
   :BYTES 6160 :SHA256
   "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/recovery/manifest-fold.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/recovery/manifest-fold.lisp")
   :BYTES 7068 :SHA256
   "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/recovery/manifest-package.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/recovery/manifest-package.lisp")
   :BYTES 1372 :SHA256
   "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/recovery/manifest-query.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/recovery/manifest-query.lisp")
   :BYTES 3582 :SHA256
   "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/recovery/manifest-types.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/recovery/manifest-types.lisp")
   :BYTES 3345 :SHA256
   "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/recovery/package.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/recovery/package.lisp")
   :BYTES 927 :SHA256
   "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/recovery/scan.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/recovery/scan.lisp")
   :BYTES 12829 :SHA256
   "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/series/events.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/series/events.lisp")
   :BYTES 9566 :SHA256
   "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/series/io-events.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/series/io-events.lisp")
   :BYTES 5385 :SHA256
   "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/series/ownership.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/series/ownership.lisp")
   :BYTES 8810 :SHA256
   "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/series/package.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/series/package.lisp")
   :BYTES 1392 :SHA256
   "7433162105df63d324141167e6dcf6bfee74611aa1cf7291cc6c92f41f3c7408")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/series/publication.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/series/publication.lisp")
   :BYTES 6094 :SHA256
   "288cb3fa41fad76a0e6919dfa0b2fce2beef15f5880129393bee35bc8795c762")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/series/query.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/series/query.lisp")
   :BYTES 3600 :SHA256
   "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/series/retirement.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/series/retirement.lisp")
   :BYTES 4634 :SHA256
   "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/series/types.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/series/types.lisp")
   :BYTES 3316 :SHA256
   "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/storage/compaction-scan.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/storage/compaction-scan.lisp")
   :BYTES 5510 :SHA256
   "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/storage/control-payload.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/storage/control-payload.lisp")
   :BYTES 6273 :SHA256
   "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/storage/formats.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/storage/formats.lisp")
   :BYTES 3841 :SHA256
   "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/storage/log-header.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/storage/log-header.lisp")
   :BYTES 3947 :SHA256
   "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/storage/package.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/storage/package.lisp")
   :BYTES 1079 :SHA256
   "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/storage/payload-record.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/storage/payload-record.lisp")
   :BYTES 3641 :SHA256
   "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/storage/payload-write.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/storage/payload-write.lisp")
   :BYTES 5239 :SHA256
   "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/src/storage/segment-header.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/storage/segment-header.lisp")
   :BYTES 5517 :SHA256
   "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/wal/builder.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/wal/builder.lisp")
   :BYTES 8445 :SHA256
   "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/wal/csn.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/wal/csn.lisp")
   :BYTES 9577 :SHA256
   "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/wal/executor.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/wal/executor.lisp")
   :BYTES 6023 :SHA256
   "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/wal/group.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/wal/group.lisp")
   :BYTES 6305 :SHA256
   "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/wal/package.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/wal/package.lisp")
   :BYTES 1774 :SHA256
   "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/src/wal/types.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/src/wal/types.lisp")
   :BYTES 5420 :SHA256
   "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/test.log" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/test.log")
   :BYTES 21787 :SHA256
   "e8bdeb42672e7e0e92d145fb07baaf7fa59bc648ae4d78a2eabd2a484d178134")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/codec/cbor-header.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/codec/cbor-header.lisp")
   :BYTES 10773 :SHA256
   "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/codec/cbor-minimal-edges.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/codec/cbor-minimal-edges.lisp")
   :BYTES 1613 :SHA256
   "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/codec/cbor-minimal-scan-support.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/codec/cbor-minimal-scan-support.lisp")
   :BYTES 8363 :SHA256
   "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/codec/cbor-minimal-scan-threads.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/codec/cbor-minimal-scan-threads.lisp")
   :BYTES 4547 :SHA256
   "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/codec/cbor-minimal-scan.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/codec/cbor-minimal-scan.lisp")
   :BYTES 19217 :SHA256
   "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/codec/cbor-minimal-support.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/codec/cbor-minimal-support.lisp")
   :BYTES 8620 :SHA256
   "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/codec/cbor-minimal-threads.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/codec/cbor-minimal-threads.lisp")
   :BYTES 3799 :SHA256
   "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/codec/cbor-minimal.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/codec/cbor-minimal.lisp")
   :BYTES 12604 :SHA256
   "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/codec/cbor-string-write-support.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/codec/cbor-string-write-support.lisp")
   :BYTES 6829 :SHA256
   "611ec1d825855d9df27988821ee45f0ecf81fbd3128a38df6ee5c727551cd9f2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/codec/cbor-string-write-threads.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/codec/cbor-string-write-threads.lisp")
   :BYTES 3311 :SHA256
   "d45b4dda658a96b9af9051b152df2b17859aecdbb9131505d1a2689b27ffb88a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/codec/cbor-string-write.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/codec/cbor-string-write.lisp")
   :BYTES 15883 :SHA256
   "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/codec/cbor-structure-support.lisp"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/codec/cbor-structure-threads.lisp"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/codec/cbor-structure-threads.lisp")
   :BYTES 4305 :SHA256
   "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/codec/cbor-structure.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/codec/cbor-structure.lisp")
   :BYTES 22968 :SHA256
   "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/codec/cbor-support.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/codec/cbor-threads.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/codec/cbor-threads.lisp")
   :BYTES 3683 :SHA256
   "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/codec/cbor-write-roundtrip.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/codec/cbor-write-roundtrip.lisp")
   :BYTES 901 :SHA256
   "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/codec/cbor-write-support.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/codec/cbor-write-support.lisp")
   :BYTES 4768 :SHA256
   "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/codec/cbor-write-threads.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/codec/cbor-write-threads.lisp")
   :BYTES 3813 :SHA256
   "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/codec/cbor-write.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/codec/cbor-write.lisp")
   :BYTES 9822 :SHA256
   "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/tests/codec/support.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/codec/support.lisp")
   :BYTES 5807 :SHA256
   "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/tests/codec/threads.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/codec/threads.lisp")
   :BYTES 3111 :SHA256
   "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/tests/codec/utf8.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/codec/utf8.lisp")
   :BYTES 12892 :SHA256
   "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/tests/csn/registry.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/csn/registry.lisp")
   :BYTES 19411 :SHA256
   "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/tests/csn/support.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/csn/support.lisp")
   :BYTES 11407 :SHA256
   "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/tests/csn/threads.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/csn/threads.lisp")
   :BYTES 10525 :SHA256
   "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/execution/handoff.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/execution/handoff.lisp")
   :BYTES 33278 :SHA256
   "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/execution/queue.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/execution/queue.lisp")
   :BYTES 12894 :SHA256
   "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/execution/ready-recycle.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/execution/ready-recycle.lisp")
   :BYTES 30075 :SHA256
   "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/execution/ready.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/execution/ready.lisp")
   :BYTES 33555 :SHA256
   "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/execution/support.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/execution/support.lisp")
   :BYTES 4469 :SHA256
   "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/execution/threads.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/execution/threads.lisp")
   :BYTES 14622 :SHA256
   "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/execution/worker.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/execution/worker.lisp")
   :BYTES 59783 :SHA256
   "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/foundation/batch.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/foundation/batch.lisp")
   :BYTES 5185 :SHA256
   "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/foundation/binary.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/foundation/binary.lisp")
   :BYTES 3721 :SHA256
   "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/foundation/record.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/foundation/record.lisp")
   :BYTES 14950 :SHA256
   "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/foundation/support.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/index/primary-support.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/index/primary-support.lisp")
   :BYTES 13938 :SHA256
   "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/index/primary-threads.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/index/primary-threads.lisp")
   :BYTES 13744 :SHA256
   "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/tests/index/primary.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/index/primary.lisp")
   :BYTES 30166 :SHA256
   "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/tests/index/rebuild.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/index/rebuild.lisp")
   :BYTES 32112 :SHA256
   "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/index/slot-support.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/index/slot-support.lisp")
   :BYTES 12800 :SHA256
   "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/index/slot-threads.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/index/slot-threads.lisp")
   :BYTES 11698 :SHA256
   "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/tests/index/slots.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/index/slots.lisp")
   :BYTES 26420 :SHA256
   "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/tests/io/native.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/io/native.lisp")
   :BYTES 6207 :SHA256
   "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/tests/io/support.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/io/support.lisp")
   :BYTES 2951 :SHA256
   "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/tests/io/transfer.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/io/transfer.lisp")
   :BYTES 11847 :SHA256
   "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/lint-fixtures/bad.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/lint-fixtures/bad.lisp")
   :BYTES 1587 :SHA256
   "ac8912ce6cc1101f2ebc305a50c0565879547b527d7ca0aeac900ee06bf26652")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/lint-fixtures/good.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/lint-fixtures/good.lisp")
   :BYTES 671 :SHA256
   "05ce84f8fd12d9af48252601bcc92d6d60335b53f39b01a9fe2697c4bdaa8cee")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/lint-fixtures/keyword-barrier.lisp"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/lint-fixtures/keyword-barrier.lisp")
   :BYTES 199 :SHA256
   "e26dab117e9526ace35bb45b92f977065d33fcc4404c40fd4fc3c77749689a96")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/lint-fixtures/qualified-reader.lisp"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/lint-fixtures/qualified-reader.lisp")
   :BYTES 152 :SHA256
   "835229bdc1a0ed0c08511cd6121e1f1bc4284da2cfba951b72cd1a74a6040d35")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/tests/mvcc/capture.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/mvcc/capture.lisp")
   :BYTES 16356 :SHA256
   "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/tests/mvcc/lifecycle.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/mvcc/lifecycle.lisp")
   :BYTES 23964 :SHA256
   "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/tests/mvcc/support.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/mvcc/support.lisp")
   :BYTES 5931 :SHA256
   "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/recovery/corruption.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/recovery/corruption.lisp")
   :BYTES 7106 :SHA256
   "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/recovery/decisions-audit.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/recovery/decisions-audit.lisp")
   :BYTES 14971 :SHA256
   "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/recovery/decisions-radix.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/recovery/decisions-radix.lisp")
   :BYTES 27851 :SHA256
   "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/recovery/decisions-support.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/recovery/decisions-support.lisp")
   :BYTES 6797 :SHA256
   "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/recovery/decisions.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/recovery/decisions.lisp")
   :BYTES 19149 :SHA256
   "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/recovery/inventory-support.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/recovery/inventory-support.lisp")
   :BYTES 8083 :SHA256
   "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/recovery/inventory.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/recovery/inventory.lisp")
   :BYTES 14479 :SHA256
   "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/recovery/manifest-audit.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/recovery/manifest-audit.lisp")
   :BYTES 17670 :SHA256
   "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/recovery/manifest-support.lisp"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/recovery/manifest-support.lisp")
   :BYTES 9769 :SHA256
   "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/recovery/manifest.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/recovery/manifest.lisp")
   :BYTES 13799 :SHA256
   "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/tests/recovery/scan.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/recovery/scan.lisp")
   :BYTES 16966 :SHA256
   "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/recovery/support.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/recovery/support.lisp")
   :BYTES 5957 :SHA256
   "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/series/boundaries.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/series/boundaries.lisp")
   :BYTES 5802 :SHA256
   "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/series/controller.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/series/controller.lisp")
   :BYTES 60484 :SHA256
   "4bea80eb231575f48b208ddb57af6a11706481e0ec755b084f6cd4b6fd0481a1")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/tests/series/support.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/series/support.lisp")
   :BYTES 16885 :SHA256
   "8821ae9e002941eff8ea3ae7dbfc727cb6874b68d2d1ef85af668eb2d34a0c0c")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/tests/series/threads.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/series/threads.lisp")
   :BYTES 19694 :SHA256
   "bbea64d207d14698b39ab0f8ded03db11bab09955d3f66705c23d69c09aefc8e")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/tests/smoke.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/smoke.lisp")
   :BYTES 735 :SHA256
   "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/storage/compaction-scan.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/storage/compaction-scan.lisp")
   :BYTES 16196 :SHA256
   "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/storage/control-payload.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/storage/control-payload.lisp")
   :BYTES 12651 :SHA256
   "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/storage/log-header.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/storage/log-header.lisp")
   :BYTES 11969 :SHA256
   "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/storage/segment-header.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/storage/segment-header.lisp")
   :BYTES 4149 :SHA256
   "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/storage/support.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/storage/support.lisp")
   :BYTES 4029 :SHA256
   "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/tests/wal/builder.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/wal/builder.lisp")
   :BYTES 4000 :SHA256
   "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tests/wal/csn-threads.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/wal/csn-threads.lisp")
   :BYTES 12114 :SHA256
   "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/tests/wal/csn.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/wal/csn.lisp")
   :BYTES 34661 :SHA256
   "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/tests/wal/fault.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/wal/fault.lisp")
   :BYTES 7614 :SHA256
   "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/tests/wal/group.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/wal/group.lisp")
   :BYTES 5524 :SHA256
   "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/tests/wal/native.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/wal/native.lisp")
   :BYTES 2567 :SHA256
   "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/tests/wal/support.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tests/wal/support.lisp")
   :BYTES 1951 :SHA256
   "90a47539e5e2898c0a08059207f30bb5551e7ca8fc166f8f6ce7b95afa757295")
  (:PATH "raw/cbor-string-write-mutations-20261011/3/tools/build.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/3/tools/cbor-string-write-isolated-build.lisp"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/3/tools/cbor-string-write-isolated-build.lisp")
   :BYTES 478 :SHA256
   "4242c9fccf178cc3068cfd6cd9220d5799b222d03dffb3483324e5a21990ee72")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/cache/build.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/cache/build.lisp")
   :BYTES 4966 :SHA256
   "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/cache/clock.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/cache/clock.lisp")
   :BYTES 2952 :SHA256
   "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/cache/core.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/cache/core.lisp")
   :BYTES 3503 :SHA256
   "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/cache/package.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/cache/package.lisp")
   :BYTES 758 :SHA256
   "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/cache/read.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/cache/read.lisp")
   :BYTES 6220 :SHA256
   "bf2232802b2f3648514dfb76f20e571797f981ebb3138f79fc1b42477df045e8")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/cache/types.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/cache/types.lisp")
   :BYTES 2448 :SHA256
   "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/cache/write.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/cache/write.lisp")
   :BYTES 5481 :SHA256
   "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/codec/cbor-float-minimal.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/codec/cbor-header.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/codec/cbor-minimal.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/codec/cbor-package.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/codec/cbor-package.lisp")
   :BYTES 579 :SHA256
   "f599073f7a2f085715caa30c78eaeda1a2feee7fed97f4fd33207e45c93455a1")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/codec/cbor-scan-input.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/codec/cbor-scan-items.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/codec/cbor-scan-minimal.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/codec/cbor-scan-stack.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/codec/cbor-scan.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/codec/cbor-space.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/codec/cbor-string-write.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/codec/cbor-string-write.lisp")
   :BYTES 7725 :SHA256
   "f131649d6ec6ff2308aa28ce7da468c80e1fce4ad45971a0092112c4c26b5172")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/codec/cbor-write.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/codec/package.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/codec/utf8.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/csn/package.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/csn/package.lisp")
   :BYTES 441 :SHA256
   "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/csn/registry.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/csn/registry.lisp")
   :BYTES 12139 :SHA256
   "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/epochs/core.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/epochs/core.lisp")
   :BYTES 5909 :SHA256
   "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/epochs/package.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/epochs/package.lisp")
   :BYTES 779 :SHA256
   "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/epochs/read.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/epochs/read.lisp")
   :BYTES 3240 :SHA256
   "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/epochs/reclaim.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/epochs/reclaim.lisp")
   :BYTES 6373 :SHA256
   "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/epochs/retire.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/epochs/retire.lisp")
   :BYTES 5858 :SHA256
   "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/epochs/types.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/epochs/types.lisp")
   :BYTES 5304 :SHA256
   "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/execution/handoff.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/execution/handoff.lisp")
   :BYTES 7394 :SHA256
   "ee90c809ef51134efa21e08b819e5530304efaf9f9e26b63c7e4afbf6d48e607")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/execution/package.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/execution/package.lisp")
   :BYTES 1157 :SHA256
   "bbe8cdb6f7e74d7139f5e472a915cc74b43e34bd27ecac1c5fd364f723a2a643")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/execution/queue.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/execution/queue.lisp")
   :BYTES 5374 :SHA256
   "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/execution/ready-recycle.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/execution/ready-recycle.lisp")
   :BYTES 3387 :SHA256
   "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/execution/ready-types.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/execution/ready-types.lisp")
   :BYTES 5248 :SHA256
   "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/execution/ready.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/execution/ready.lisp")
   :BYTES 6635 :SHA256
   "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/execution/worker-boundary.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/execution/worker-boundary.lisp")
   :BYTES 2309 :SHA256
   "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/execution/worker-claim.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/execution/worker-claim.lisp")
   :BYTES 6401 :SHA256
   "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/execution/worker-run.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/execution/worker-run.lisp")
   :BYTES 5124 :SHA256
   "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/execution/worker-types.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/execution/worker-types.lisp")
   :BYTES 8461 :SHA256
   "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/execution/writer.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/execution/writer.lisp")
   :BYTES 6484 :SHA256
   "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/foundation/batch.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/foundation/binary.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/foundation/conditions.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/foundation/crc32c.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/foundation/package.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/foundation/record.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/index/core.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/index/core.lisp")
   :BYTES 2959 :SHA256
   "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/index/package.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/index/package.lisp")
   :BYTES 727 :SHA256
   "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/index/primary-arena.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/index/primary-arena.lisp")
   :BYTES 3485 :SHA256
   "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/index/primary-build.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/index/primary-build.lisp")
   :BYTES 4794 :SHA256
   "c38c654fd9fb4b1022c1b927cc956fc6e4fcfb4e6546241abab0ef1d2250982e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/index/primary-core.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/index/primary-core.lisp")
   :BYTES 4211 :SHA256
   "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/index/primary-directory.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/index/primary-directory.lisp")
   :BYTES 8114 :SHA256
   "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/index/primary-package.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/index/primary-package.lisp")
   :BYTES 1389 :SHA256
   "de63b143381f1d044df8f8f5545ac4230e1e6e3631ad015b5c4841ced70ecf8d")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/index/primary-probe.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/index/primary-probe.lisp")
   :BYTES 5936 :SHA256
   "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/index/primary-read.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/index/primary-read.lisp")
   :BYTES 3575 :SHA256
   "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/index/primary-relocate.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/index/primary-relocate.lisp")
   :BYTES 4073 :SHA256
   "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/index/primary-types.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/index/primary-types.lisp")
   :BYTES 3827 :SHA256
   "8fac31490331dcff794cedae79c3b9028922e18741c99d04404203f08ec3dcec")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/index/primary-write.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/index/primary-write.lisp")
   :BYTES 7061 :SHA256
   "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/index/read.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/index/read.lisp")
   :BYTES 3030 :SHA256
   "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/index/rebuild-budget.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/index/rebuild-budget.lisp")
   :BYTES 3593 :SHA256
   "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/index/rebuild-copy.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/index/rebuild-copy.lisp")
   :BYTES 4027 :SHA256
   "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/index/rebuild-scan.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/index/rebuild-scan.lisp")
   :BYTES 5002 :SHA256
   "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/index/rebuild.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/index/rebuild.lisp")
   :BYTES 2872 :SHA256
   "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/index/relocate.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/index/relocate.lisp")
   :BYTES 2383 :SHA256
   "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/index/types.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/index/types.lisp")
   :BYTES 2434 :SHA256
   "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/index/validation.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/index/validation.lisp")
   :BYTES 3930 :SHA256
   "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/index/write.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/index/write.lisp")
   :BYTES 4784 :SHA256
   "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/io/flush.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/io/flush.lisp")
   :BYTES 1569 :SHA256
   "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/io/lifecycle.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/io/lifecycle.lisp")
   :BYTES 4536 :SHA256
   "baa1f763fe0f394a14d381b753dcb1be1e90eb03eaff5d6469465b5d4eca015f")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/io/native.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/io/native.lisp")
   :BYTES 5026 :SHA256
   "b8cf3ce1ff7b4fa9def8a602ab768c0e9a321f8d6cdce6e5b2b7ded2fe3d97dd")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/io/package.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/io/package.lisp")
   :BYTES 592 :SHA256
   "118eba04ab2aa87a2d86e0b0269dbeacaa485457acebbc12c57317ae465a89c0")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/io/transfer.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/io/transfer.lisp")
   :BYTES 5051 :SHA256
   "3748328cf85e1c007900a63bdd0f159f38a8d7cd3577c92c56fc68692b9b7bcf")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/io/types.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/io/types.lisp")
   :BYTES 4143 :SHA256
   "50c7eeea91af232fca7103ce5a25535958d73836f01cb45a20c7120b88b1336b")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/mvcc/package.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/mvcc/package.lisp")
   :BYTES 833 :SHA256
   "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/mvcc/snapshots-core.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/mvcc/snapshots-core.lisp")
   :BYTES 7622 :SHA256
   "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/mvcc/snapshots-csn.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/mvcc/snapshots-csn.lisp")
   :BYTES 2725 :SHA256
   "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/mvcc/snapshots-lifecycle.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/mvcc/snapshots-lifecycle.lisp")
   :BYTES 6609 :SHA256
   "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/mvcc/snapshots-read.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/mvcc/snapshots-read.lisp")
   :BYTES 6651 :SHA256
   "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/mvcc/snapshots-register.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/mvcc/snapshots-register.lisp")
   :BYTES 6654 :SHA256
   "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/mvcc/snapshots-types.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/mvcc/snapshots-types.lisp")
   :BYTES 3817 :SHA256
   "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/mvcc/types.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/mvcc/types.lisp")
   :BYTES 471 :SHA256
   "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/package.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/read/core.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/read/core.lisp")
   :BYTES 3846 :SHA256
   "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/read/package.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/read/package.lisp")
   :BYTES 831 :SHA256
   "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/read/task.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/read/task.lisp")
   :BYTES 5073 :SHA256
   "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/read/types.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/read/types.lisp")
   :BYTES 2358 :SHA256
   "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/recovery/decisions-build.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/recovery/decisions-build.lisp")
   :BYTES 11857 :SHA256
   "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/recovery/decisions-package.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/recovery/decisions-package.lisp")
   :BYTES 818 :SHA256
   "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/recovery/decisions-query.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/recovery/decisions-query.lisp")
   :BYTES 4525 :SHA256
   "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/recovery/decisions-radix.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/recovery/decisions-radix.lisp")
   :BYTES 11061 :SHA256
   "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/recovery/decisions-sort.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/recovery/decisions-sort.lisp")
   :BYTES 7654 :SHA256
   "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/recovery/decisions-types.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/recovery/decisions-types.lisp")
   :BYTES 2056 :SHA256
   "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/recovery/inventory-build.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/recovery/inventory-build.lisp")
   :BYTES 9592 :SHA256
   "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/recovery/inventory-query.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/recovery/inventory-query.lisp")
   :BYTES 2100 :SHA256
   "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/recovery/inventory-types.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/recovery/inventory-types.lisp")
   :BYTES 2392 :SHA256
   "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/recovery/manifest-build.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/recovery/manifest-build.lisp")
   :BYTES 10251 :SHA256
   "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/recovery/manifest-decode.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/recovery/manifest-decode.lisp")
   :BYTES 6160 :SHA256
   "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/recovery/manifest-fold.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/recovery/manifest-fold.lisp")
   :BYTES 7068 :SHA256
   "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/recovery/manifest-package.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/recovery/manifest-package.lisp")
   :BYTES 1372 :SHA256
   "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/recovery/manifest-query.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/recovery/manifest-query.lisp")
   :BYTES 3582 :SHA256
   "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/recovery/manifest-types.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/recovery/manifest-types.lisp")
   :BYTES 3345 :SHA256
   "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/recovery/package.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/recovery/package.lisp")
   :BYTES 927 :SHA256
   "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/recovery/scan.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/recovery/scan.lisp")
   :BYTES 12829 :SHA256
   "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/series/events.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/series/events.lisp")
   :BYTES 9566 :SHA256
   "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/series/io-events.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/series/io-events.lisp")
   :BYTES 5385 :SHA256
   "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/series/ownership.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/series/ownership.lisp")
   :BYTES 8810 :SHA256
   "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/series/package.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/series/package.lisp")
   :BYTES 1392 :SHA256
   "7433162105df63d324141167e6dcf6bfee74611aa1cf7291cc6c92f41f3c7408")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/series/publication.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/series/publication.lisp")
   :BYTES 6094 :SHA256
   "288cb3fa41fad76a0e6919dfa0b2fce2beef15f5880129393bee35bc8795c762")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/series/query.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/series/query.lisp")
   :BYTES 3600 :SHA256
   "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/series/retirement.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/series/retirement.lisp")
   :BYTES 4634 :SHA256
   "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/series/types.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/series/types.lisp")
   :BYTES 3316 :SHA256
   "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/storage/compaction-scan.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/storage/compaction-scan.lisp")
   :BYTES 5510 :SHA256
   "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/storage/control-payload.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/storage/control-payload.lisp")
   :BYTES 6273 :SHA256
   "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/storage/formats.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/storage/formats.lisp")
   :BYTES 3841 :SHA256
   "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/storage/log-header.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/storage/log-header.lisp")
   :BYTES 3947 :SHA256
   "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/storage/package.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/storage/package.lisp")
   :BYTES 1079 :SHA256
   "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/storage/payload-record.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/storage/payload-record.lisp")
   :BYTES 3641 :SHA256
   "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/storage/payload-write.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/storage/payload-write.lisp")
   :BYTES 5239 :SHA256
   "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/src/storage/segment-header.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/storage/segment-header.lisp")
   :BYTES 5517 :SHA256
   "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/wal/builder.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/wal/builder.lisp")
   :BYTES 8445 :SHA256
   "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/wal/csn.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/wal/csn.lisp")
   :BYTES 9577 :SHA256
   "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/wal/executor.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/wal/executor.lisp")
   :BYTES 6023 :SHA256
   "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/wal/group.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/wal/group.lisp")
   :BYTES 6305 :SHA256
   "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/wal/package.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/wal/package.lisp")
   :BYTES 1774 :SHA256
   "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/src/wal/types.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/src/wal/types.lisp")
   :BYTES 5420 :SHA256
   "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/test.log" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/test.log")
   :BYTES 32931 :SHA256
   "ba16ce6132b8d8c9f0b15abb17207690f984a150d2e9c2b9eb5646ee39bf748c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/codec/cbor-header.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/codec/cbor-header.lisp")
   :BYTES 10773 :SHA256
   "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/codec/cbor-minimal-edges.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/codec/cbor-minimal-edges.lisp")
   :BYTES 1613 :SHA256
   "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/codec/cbor-minimal-scan-support.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/codec/cbor-minimal-scan-support.lisp")
   :BYTES 8363 :SHA256
   "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/codec/cbor-minimal-scan-threads.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/codec/cbor-minimal-scan-threads.lisp")
   :BYTES 4547 :SHA256
   "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/codec/cbor-minimal-scan.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/codec/cbor-minimal-scan.lisp")
   :BYTES 19217 :SHA256
   "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/codec/cbor-minimal-support.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/codec/cbor-minimal-support.lisp")
   :BYTES 8620 :SHA256
   "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/codec/cbor-minimal-threads.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/codec/cbor-minimal-threads.lisp")
   :BYTES 3799 :SHA256
   "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/codec/cbor-minimal.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/codec/cbor-minimal.lisp")
   :BYTES 12604 :SHA256
   "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/codec/cbor-string-write-support.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/codec/cbor-string-write-support.lisp")
   :BYTES 6829 :SHA256
   "611ec1d825855d9df27988821ee45f0ecf81fbd3128a38df6ee5c727551cd9f2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/codec/cbor-string-write-threads.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/codec/cbor-string-write-threads.lisp")
   :BYTES 3311 :SHA256
   "d45b4dda658a96b9af9051b152df2b17859aecdbb9131505d1a2689b27ffb88a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/codec/cbor-string-write.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/codec/cbor-string-write.lisp")
   :BYTES 15883 :SHA256
   "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/codec/cbor-structure-support.lisp"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/codec/cbor-structure-threads.lisp"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/codec/cbor-structure-threads.lisp")
   :BYTES 4305 :SHA256
   "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/codec/cbor-structure.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/codec/cbor-structure.lisp")
   :BYTES 22968 :SHA256
   "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/codec/cbor-support.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/codec/cbor-threads.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/codec/cbor-threads.lisp")
   :BYTES 3683 :SHA256
   "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/codec/cbor-write-roundtrip.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/codec/cbor-write-roundtrip.lisp")
   :BYTES 901 :SHA256
   "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/codec/cbor-write-support.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/codec/cbor-write-support.lisp")
   :BYTES 4768 :SHA256
   "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/codec/cbor-write-threads.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/codec/cbor-write-threads.lisp")
   :BYTES 3813 :SHA256
   "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/codec/cbor-write.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/codec/cbor-write.lisp")
   :BYTES 9822 :SHA256
   "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/tests/codec/support.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/codec/support.lisp")
   :BYTES 5807 :SHA256
   "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/tests/codec/threads.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/codec/threads.lisp")
   :BYTES 3111 :SHA256
   "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/tests/codec/utf8.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/codec/utf8.lisp")
   :BYTES 12892 :SHA256
   "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/tests/csn/registry.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/csn/registry.lisp")
   :BYTES 19411 :SHA256
   "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/tests/csn/support.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/csn/support.lisp")
   :BYTES 11407 :SHA256
   "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/tests/csn/threads.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/csn/threads.lisp")
   :BYTES 10525 :SHA256
   "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/execution/handoff.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/execution/handoff.lisp")
   :BYTES 33278 :SHA256
   "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/execution/queue.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/execution/queue.lisp")
   :BYTES 12894 :SHA256
   "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/execution/ready-recycle.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/execution/ready-recycle.lisp")
   :BYTES 30075 :SHA256
   "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/execution/ready.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/execution/ready.lisp")
   :BYTES 33555 :SHA256
   "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/execution/support.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/execution/support.lisp")
   :BYTES 4469 :SHA256
   "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/execution/threads.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/execution/threads.lisp")
   :BYTES 14622 :SHA256
   "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/execution/worker.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/execution/worker.lisp")
   :BYTES 59783 :SHA256
   "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/foundation/batch.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/foundation/batch.lisp")
   :BYTES 5185 :SHA256
   "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/foundation/binary.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/foundation/binary.lisp")
   :BYTES 3721 :SHA256
   "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/foundation/record.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/foundation/record.lisp")
   :BYTES 14950 :SHA256
   "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/foundation/support.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/index/primary-support.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/index/primary-support.lisp")
   :BYTES 13938 :SHA256
   "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/index/primary-threads.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/index/primary-threads.lisp")
   :BYTES 13744 :SHA256
   "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/tests/index/primary.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/index/primary.lisp")
   :BYTES 30166 :SHA256
   "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/tests/index/rebuild.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/index/rebuild.lisp")
   :BYTES 32112 :SHA256
   "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/index/slot-support.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/index/slot-support.lisp")
   :BYTES 12800 :SHA256
   "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/index/slot-threads.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/index/slot-threads.lisp")
   :BYTES 11698 :SHA256
   "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/tests/index/slots.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/index/slots.lisp")
   :BYTES 26420 :SHA256
   "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/tests/io/native.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/io/native.lisp")
   :BYTES 6207 :SHA256
   "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/tests/io/support.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/io/support.lisp")
   :BYTES 2951 :SHA256
   "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/tests/io/transfer.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/io/transfer.lisp")
   :BYTES 11847 :SHA256
   "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/lint-fixtures/bad.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/lint-fixtures/bad.lisp")
   :BYTES 1587 :SHA256
   "ac8912ce6cc1101f2ebc305a50c0565879547b527d7ca0aeac900ee06bf26652")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/lint-fixtures/good.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/lint-fixtures/good.lisp")
   :BYTES 671 :SHA256
   "05ce84f8fd12d9af48252601bcc92d6d60335b53f39b01a9fe2697c4bdaa8cee")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/lint-fixtures/keyword-barrier.lisp"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/lint-fixtures/keyword-barrier.lisp")
   :BYTES 199 :SHA256
   "e26dab117e9526ace35bb45b92f977065d33fcc4404c40fd4fc3c77749689a96")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/lint-fixtures/qualified-reader.lisp"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/lint-fixtures/qualified-reader.lisp")
   :BYTES 152 :SHA256
   "835229bdc1a0ed0c08511cd6121e1f1bc4284da2cfba951b72cd1a74a6040d35")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/tests/mvcc/capture.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/mvcc/capture.lisp")
   :BYTES 16356 :SHA256
   "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/tests/mvcc/lifecycle.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/mvcc/lifecycle.lisp")
   :BYTES 23964 :SHA256
   "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/tests/mvcc/support.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/mvcc/support.lisp")
   :BYTES 5931 :SHA256
   "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/recovery/corruption.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/recovery/corruption.lisp")
   :BYTES 7106 :SHA256
   "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/recovery/decisions-audit.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/recovery/decisions-audit.lisp")
   :BYTES 14971 :SHA256
   "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/recovery/decisions-radix.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/recovery/decisions-radix.lisp")
   :BYTES 27851 :SHA256
   "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/recovery/decisions-support.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/recovery/decisions-support.lisp")
   :BYTES 6797 :SHA256
   "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/recovery/decisions.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/recovery/decisions.lisp")
   :BYTES 19149 :SHA256
   "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/recovery/inventory-support.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/recovery/inventory-support.lisp")
   :BYTES 8083 :SHA256
   "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/recovery/inventory.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/recovery/inventory.lisp")
   :BYTES 14479 :SHA256
   "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/recovery/manifest-audit.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/recovery/manifest-audit.lisp")
   :BYTES 17670 :SHA256
   "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/recovery/manifest-support.lisp"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/recovery/manifest-support.lisp")
   :BYTES 9769 :SHA256
   "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/recovery/manifest.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/recovery/manifest.lisp")
   :BYTES 13799 :SHA256
   "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/tests/recovery/scan.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/recovery/scan.lisp")
   :BYTES 16966 :SHA256
   "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/recovery/support.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/recovery/support.lisp")
   :BYTES 5957 :SHA256
   "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/series/boundaries.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/series/boundaries.lisp")
   :BYTES 5802 :SHA256
   "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/series/controller.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/series/controller.lisp")
   :BYTES 60484 :SHA256
   "4bea80eb231575f48b208ddb57af6a11706481e0ec755b084f6cd4b6fd0481a1")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/tests/series/support.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/series/support.lisp")
   :BYTES 16885 :SHA256
   "8821ae9e002941eff8ea3ae7dbfc727cb6874b68d2d1ef85af668eb2d34a0c0c")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/tests/series/threads.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/series/threads.lisp")
   :BYTES 19694 :SHA256
   "bbea64d207d14698b39ab0f8ded03db11bab09955d3f66705c23d69c09aefc8e")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/tests/smoke.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/smoke.lisp")
   :BYTES 735 :SHA256
   "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/storage/compaction-scan.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/storage/compaction-scan.lisp")
   :BYTES 16196 :SHA256
   "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/storage/control-payload.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/storage/control-payload.lisp")
   :BYTES 12651 :SHA256
   "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/storage/log-header.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/storage/log-header.lisp")
   :BYTES 11969 :SHA256
   "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/storage/segment-header.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/storage/segment-header.lisp")
   :BYTES 4149 :SHA256
   "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/storage/support.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/storage/support.lisp")
   :BYTES 4029 :SHA256
   "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/tests/wal/builder.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/wal/builder.lisp")
   :BYTES 4000 :SHA256
   "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tests/wal/csn-threads.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/wal/csn-threads.lisp")
   :BYTES 12114 :SHA256
   "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/tests/wal/csn.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/wal/csn.lisp")
   :BYTES 34661 :SHA256
   "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/tests/wal/fault.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/wal/fault.lisp")
   :BYTES 7614 :SHA256
   "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/tests/wal/group.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/wal/group.lisp")
   :BYTES 5524 :SHA256
   "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/tests/wal/native.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/wal/native.lisp")
   :BYTES 2567 :SHA256
   "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/tests/wal/support.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tests/wal/support.lisp")
   :BYTES 1951 :SHA256
   "90a47539e5e2898c0a08059207f30bb5551e7ca8fc166f8f6ce7b95afa757295")
  (:PATH "raw/cbor-string-write-mutations-20261011/4/tools/build.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/4/tools/cbor-string-write-isolated-build.lisp"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/4/tools/cbor-string-write-isolated-build.lisp")
   :BYTES 478 :SHA256
   "a576ffa2214837e81c490e8db7cc1543cf328745d971c16452502a28b3afc019")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/cache/build.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/cache/build.lisp")
   :BYTES 4966 :SHA256
   "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/cache/clock.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/cache/clock.lisp")
   :BYTES 2952 :SHA256
   "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/cache/core.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/cache/core.lisp")
   :BYTES 3503 :SHA256
   "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/cache/package.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/cache/package.lisp")
   :BYTES 758 :SHA256
   "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/cache/read.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/cache/read.lisp")
   :BYTES 6220 :SHA256
   "bf2232802b2f3648514dfb76f20e571797f981ebb3138f79fc1b42477df045e8")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/cache/types.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/cache/types.lisp")
   :BYTES 2448 :SHA256
   "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/cache/write.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/cache/write.lisp")
   :BYTES 5481 :SHA256
   "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/codec/cbor-float-minimal.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/codec/cbor-header.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/codec/cbor-minimal.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/codec/cbor-package.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/codec/cbor-package.lisp")
   :BYTES 579 :SHA256
   "f599073f7a2f085715caa30c78eaeda1a2feee7fed97f4fd33207e45c93455a1")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/codec/cbor-scan-input.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/codec/cbor-scan-items.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/codec/cbor-scan-minimal.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/codec/cbor-scan-stack.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/codec/cbor-scan.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/codec/cbor-space.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/codec/cbor-string-write.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/codec/cbor-string-write.lisp")
   :BYTES 7743 :SHA256
   "446ead9a413ab619c8d04abe5d68d907163a672acbb76bca53de84dde3ad6f35")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/codec/cbor-write.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/codec/package.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/codec/utf8.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/csn/package.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/csn/package.lisp")
   :BYTES 441 :SHA256
   "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/csn/registry.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/csn/registry.lisp")
   :BYTES 12139 :SHA256
   "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/epochs/core.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/epochs/core.lisp")
   :BYTES 5909 :SHA256
   "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/epochs/package.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/epochs/package.lisp")
   :BYTES 779 :SHA256
   "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/epochs/read.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/epochs/read.lisp")
   :BYTES 3240 :SHA256
   "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/epochs/reclaim.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/epochs/reclaim.lisp")
   :BYTES 6373 :SHA256
   "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/epochs/retire.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/epochs/retire.lisp")
   :BYTES 5858 :SHA256
   "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/epochs/types.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/epochs/types.lisp")
   :BYTES 5304 :SHA256
   "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/execution/handoff.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/execution/handoff.lisp")
   :BYTES 7394 :SHA256
   "ee90c809ef51134efa21e08b819e5530304efaf9f9e26b63c7e4afbf6d48e607")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/execution/package.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/execution/package.lisp")
   :BYTES 1157 :SHA256
   "bbe8cdb6f7e74d7139f5e472a915cc74b43e34bd27ecac1c5fd364f723a2a643")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/execution/queue.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/execution/queue.lisp")
   :BYTES 5374 :SHA256
   "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/execution/ready-recycle.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/execution/ready-recycle.lisp")
   :BYTES 3387 :SHA256
   "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/execution/ready-types.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/execution/ready-types.lisp")
   :BYTES 5248 :SHA256
   "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/execution/ready.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/execution/ready.lisp")
   :BYTES 6635 :SHA256
   "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/execution/worker-boundary.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/execution/worker-boundary.lisp")
   :BYTES 2309 :SHA256
   "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/execution/worker-claim.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/execution/worker-claim.lisp")
   :BYTES 6401 :SHA256
   "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/execution/worker-run.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/execution/worker-run.lisp")
   :BYTES 5124 :SHA256
   "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/execution/worker-types.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/execution/worker-types.lisp")
   :BYTES 8461 :SHA256
   "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/execution/writer.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/execution/writer.lisp")
   :BYTES 6484 :SHA256
   "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/foundation/batch.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/foundation/binary.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/foundation/conditions.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/foundation/crc32c.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/foundation/package.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/foundation/record.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/index/core.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/index/core.lisp")
   :BYTES 2959 :SHA256
   "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/index/package.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/index/package.lisp")
   :BYTES 727 :SHA256
   "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/index/primary-arena.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/index/primary-arena.lisp")
   :BYTES 3485 :SHA256
   "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/index/primary-build.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/index/primary-build.lisp")
   :BYTES 4794 :SHA256
   "c38c654fd9fb4b1022c1b927cc956fc6e4fcfb4e6546241abab0ef1d2250982e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/index/primary-core.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/index/primary-core.lisp")
   :BYTES 4211 :SHA256
   "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/index/primary-directory.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/index/primary-directory.lisp")
   :BYTES 8114 :SHA256
   "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/index/primary-package.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/index/primary-package.lisp")
   :BYTES 1389 :SHA256
   "de63b143381f1d044df8f8f5545ac4230e1e6e3631ad015b5c4841ced70ecf8d")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/index/primary-probe.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/index/primary-probe.lisp")
   :BYTES 5936 :SHA256
   "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/index/primary-read.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/index/primary-read.lisp")
   :BYTES 3575 :SHA256
   "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/index/primary-relocate.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/index/primary-relocate.lisp")
   :BYTES 4073 :SHA256
   "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/index/primary-types.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/index/primary-types.lisp")
   :BYTES 3827 :SHA256
   "8fac31490331dcff794cedae79c3b9028922e18741c99d04404203f08ec3dcec")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/index/primary-write.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/index/primary-write.lisp")
   :BYTES 7061 :SHA256
   "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/index/read.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/index/read.lisp")
   :BYTES 3030 :SHA256
   "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/index/rebuild-budget.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/index/rebuild-budget.lisp")
   :BYTES 3593 :SHA256
   "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/index/rebuild-copy.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/index/rebuild-copy.lisp")
   :BYTES 4027 :SHA256
   "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/index/rebuild-scan.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/index/rebuild-scan.lisp")
   :BYTES 5002 :SHA256
   "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/index/rebuild.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/index/rebuild.lisp")
   :BYTES 2872 :SHA256
   "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/index/relocate.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/index/relocate.lisp")
   :BYTES 2383 :SHA256
   "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/index/types.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/index/types.lisp")
   :BYTES 2434 :SHA256
   "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/index/validation.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/index/validation.lisp")
   :BYTES 3930 :SHA256
   "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/index/write.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/index/write.lisp")
   :BYTES 4784 :SHA256
   "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/io/flush.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/io/flush.lisp")
   :BYTES 1569 :SHA256
   "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/io/lifecycle.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/io/lifecycle.lisp")
   :BYTES 4536 :SHA256
   "baa1f763fe0f394a14d381b753dcb1be1e90eb03eaff5d6469465b5d4eca015f")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/io/native.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/io/native.lisp")
   :BYTES 5026 :SHA256
   "b8cf3ce1ff7b4fa9def8a602ab768c0e9a321f8d6cdce6e5b2b7ded2fe3d97dd")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/io/package.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/io/package.lisp")
   :BYTES 592 :SHA256
   "118eba04ab2aa87a2d86e0b0269dbeacaa485457acebbc12c57317ae465a89c0")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/io/transfer.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/io/transfer.lisp")
   :BYTES 5051 :SHA256
   "3748328cf85e1c007900a63bdd0f159f38a8d7cd3577c92c56fc68692b9b7bcf")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/io/types.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/io/types.lisp")
   :BYTES 4143 :SHA256
   "50c7eeea91af232fca7103ce5a25535958d73836f01cb45a20c7120b88b1336b")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/mvcc/package.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/mvcc/package.lisp")
   :BYTES 833 :SHA256
   "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/mvcc/snapshots-core.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/mvcc/snapshots-core.lisp")
   :BYTES 7622 :SHA256
   "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/mvcc/snapshots-csn.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/mvcc/snapshots-csn.lisp")
   :BYTES 2725 :SHA256
   "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/mvcc/snapshots-lifecycle.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/mvcc/snapshots-lifecycle.lisp")
   :BYTES 6609 :SHA256
   "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/mvcc/snapshots-read.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/mvcc/snapshots-read.lisp")
   :BYTES 6651 :SHA256
   "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/mvcc/snapshots-register.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/mvcc/snapshots-register.lisp")
   :BYTES 6654 :SHA256
   "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/mvcc/snapshots-types.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/mvcc/snapshots-types.lisp")
   :BYTES 3817 :SHA256
   "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/mvcc/types.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/mvcc/types.lisp")
   :BYTES 471 :SHA256
   "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/package.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/read/core.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/read/core.lisp")
   :BYTES 3846 :SHA256
   "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/read/package.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/read/package.lisp")
   :BYTES 831 :SHA256
   "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/read/task.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/read/task.lisp")
   :BYTES 5073 :SHA256
   "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/read/types.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/read/types.lisp")
   :BYTES 2358 :SHA256
   "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/recovery/decisions-build.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/recovery/decisions-build.lisp")
   :BYTES 11857 :SHA256
   "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/recovery/decisions-package.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/recovery/decisions-package.lisp")
   :BYTES 818 :SHA256
   "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/recovery/decisions-query.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/recovery/decisions-query.lisp")
   :BYTES 4525 :SHA256
   "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/recovery/decisions-radix.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/recovery/decisions-radix.lisp")
   :BYTES 11061 :SHA256
   "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/recovery/decisions-sort.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/recovery/decisions-sort.lisp")
   :BYTES 7654 :SHA256
   "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/recovery/decisions-types.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/recovery/decisions-types.lisp")
   :BYTES 2056 :SHA256
   "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/recovery/inventory-build.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/recovery/inventory-build.lisp")
   :BYTES 9592 :SHA256
   "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/recovery/inventory-query.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/recovery/inventory-query.lisp")
   :BYTES 2100 :SHA256
   "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/recovery/inventory-types.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/recovery/inventory-types.lisp")
   :BYTES 2392 :SHA256
   "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/recovery/manifest-build.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/recovery/manifest-build.lisp")
   :BYTES 10251 :SHA256
   "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/recovery/manifest-decode.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/recovery/manifest-decode.lisp")
   :BYTES 6160 :SHA256
   "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/recovery/manifest-fold.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/recovery/manifest-fold.lisp")
   :BYTES 7068 :SHA256
   "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/recovery/manifest-package.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/recovery/manifest-package.lisp")
   :BYTES 1372 :SHA256
   "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/recovery/manifest-query.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/recovery/manifest-query.lisp")
   :BYTES 3582 :SHA256
   "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/recovery/manifest-types.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/recovery/manifest-types.lisp")
   :BYTES 3345 :SHA256
   "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/recovery/package.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/recovery/package.lisp")
   :BYTES 927 :SHA256
   "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/recovery/scan.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/recovery/scan.lisp")
   :BYTES 12829 :SHA256
   "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/series/events.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/series/events.lisp")
   :BYTES 9566 :SHA256
   "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/series/io-events.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/series/io-events.lisp")
   :BYTES 5385 :SHA256
   "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/series/ownership.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/series/ownership.lisp")
   :BYTES 8810 :SHA256
   "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/series/package.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/series/package.lisp")
   :BYTES 1392 :SHA256
   "7433162105df63d324141167e6dcf6bfee74611aa1cf7291cc6c92f41f3c7408")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/series/publication.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/series/publication.lisp")
   :BYTES 6094 :SHA256
   "288cb3fa41fad76a0e6919dfa0b2fce2beef15f5880129393bee35bc8795c762")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/series/query.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/series/query.lisp")
   :BYTES 3600 :SHA256
   "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/series/retirement.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/series/retirement.lisp")
   :BYTES 4634 :SHA256
   "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/series/types.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/series/types.lisp")
   :BYTES 3316 :SHA256
   "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/storage/compaction-scan.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/storage/compaction-scan.lisp")
   :BYTES 5510 :SHA256
   "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/storage/control-payload.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/storage/control-payload.lisp")
   :BYTES 6273 :SHA256
   "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/storage/formats.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/storage/formats.lisp")
   :BYTES 3841 :SHA256
   "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/storage/log-header.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/storage/log-header.lisp")
   :BYTES 3947 :SHA256
   "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/storage/package.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/storage/package.lisp")
   :BYTES 1079 :SHA256
   "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/storage/payload-record.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/storage/payload-record.lisp")
   :BYTES 3641 :SHA256
   "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/storage/payload-write.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/storage/payload-write.lisp")
   :BYTES 5239 :SHA256
   "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/src/storage/segment-header.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/storage/segment-header.lisp")
   :BYTES 5517 :SHA256
   "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/wal/builder.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/wal/builder.lisp")
   :BYTES 8445 :SHA256
   "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/wal/csn.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/wal/csn.lisp")
   :BYTES 9577 :SHA256
   "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/wal/executor.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/wal/executor.lisp")
   :BYTES 6023 :SHA256
   "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/wal/group.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/wal/group.lisp")
   :BYTES 6305 :SHA256
   "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/wal/package.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/wal/package.lisp")
   :BYTES 1774 :SHA256
   "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/src/wal/types.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/src/wal/types.lisp")
   :BYTES 5420 :SHA256
   "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/test.log" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/test.log")
   :BYTES 32433 :SHA256
   "23a8fb3920efb725591a9f155b47cf28254b66225023d2cd47f01d18014c111f")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/codec/cbor-header.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/codec/cbor-header.lisp")
   :BYTES 10773 :SHA256
   "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/codec/cbor-minimal-edges.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/codec/cbor-minimal-edges.lisp")
   :BYTES 1613 :SHA256
   "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/codec/cbor-minimal-scan-support.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/codec/cbor-minimal-scan-support.lisp")
   :BYTES 8363 :SHA256
   "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/codec/cbor-minimal-scan-threads.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/codec/cbor-minimal-scan-threads.lisp")
   :BYTES 4547 :SHA256
   "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/codec/cbor-minimal-scan.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/codec/cbor-minimal-scan.lisp")
   :BYTES 19217 :SHA256
   "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/codec/cbor-minimal-support.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/codec/cbor-minimal-support.lisp")
   :BYTES 8620 :SHA256
   "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/codec/cbor-minimal-threads.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/codec/cbor-minimal-threads.lisp")
   :BYTES 3799 :SHA256
   "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/codec/cbor-minimal.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/codec/cbor-minimal.lisp")
   :BYTES 12604 :SHA256
   "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/codec/cbor-string-write-support.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/codec/cbor-string-write-support.lisp")
   :BYTES 6829 :SHA256
   "611ec1d825855d9df27988821ee45f0ecf81fbd3128a38df6ee5c727551cd9f2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/codec/cbor-string-write-threads.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/codec/cbor-string-write-threads.lisp")
   :BYTES 3311 :SHA256
   "d45b4dda658a96b9af9051b152df2b17859aecdbb9131505d1a2689b27ffb88a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/codec/cbor-string-write.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/codec/cbor-string-write.lisp")
   :BYTES 15883 :SHA256
   "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/codec/cbor-structure-support.lisp"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/codec/cbor-structure-threads.lisp"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/codec/cbor-structure-threads.lisp")
   :BYTES 4305 :SHA256
   "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/codec/cbor-structure.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/codec/cbor-structure.lisp")
   :BYTES 22968 :SHA256
   "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/codec/cbor-support.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/codec/cbor-threads.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/codec/cbor-threads.lisp")
   :BYTES 3683 :SHA256
   "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/codec/cbor-write-roundtrip.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/codec/cbor-write-roundtrip.lisp")
   :BYTES 901 :SHA256
   "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/codec/cbor-write-support.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/codec/cbor-write-support.lisp")
   :BYTES 4768 :SHA256
   "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/codec/cbor-write-threads.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/codec/cbor-write-threads.lisp")
   :BYTES 3813 :SHA256
   "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/codec/cbor-write.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/codec/cbor-write.lisp")
   :BYTES 9822 :SHA256
   "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/tests/codec/support.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/codec/support.lisp")
   :BYTES 5807 :SHA256
   "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/tests/codec/threads.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/codec/threads.lisp")
   :BYTES 3111 :SHA256
   "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/tests/codec/utf8.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/codec/utf8.lisp")
   :BYTES 12892 :SHA256
   "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/tests/csn/registry.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/csn/registry.lisp")
   :BYTES 19411 :SHA256
   "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/tests/csn/support.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/csn/support.lisp")
   :BYTES 11407 :SHA256
   "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/tests/csn/threads.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/csn/threads.lisp")
   :BYTES 10525 :SHA256
   "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/execution/handoff.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/execution/handoff.lisp")
   :BYTES 33278 :SHA256
   "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/execution/queue.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/execution/queue.lisp")
   :BYTES 12894 :SHA256
   "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/execution/ready-recycle.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/execution/ready-recycle.lisp")
   :BYTES 30075 :SHA256
   "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/execution/ready.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/execution/ready.lisp")
   :BYTES 33555 :SHA256
   "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/execution/support.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/execution/support.lisp")
   :BYTES 4469 :SHA256
   "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/execution/threads.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/execution/threads.lisp")
   :BYTES 14622 :SHA256
   "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/execution/worker.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/execution/worker.lisp")
   :BYTES 59783 :SHA256
   "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/foundation/batch.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/foundation/batch.lisp")
   :BYTES 5185 :SHA256
   "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/foundation/binary.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/foundation/binary.lisp")
   :BYTES 3721 :SHA256
   "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/foundation/record.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/foundation/record.lisp")
   :BYTES 14950 :SHA256
   "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/foundation/support.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/index/primary-support.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/index/primary-support.lisp")
   :BYTES 13938 :SHA256
   "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/index/primary-threads.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/index/primary-threads.lisp")
   :BYTES 13744 :SHA256
   "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/tests/index/primary.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/index/primary.lisp")
   :BYTES 30166 :SHA256
   "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/tests/index/rebuild.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/index/rebuild.lisp")
   :BYTES 32112 :SHA256
   "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/index/slot-support.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/index/slot-support.lisp")
   :BYTES 12800 :SHA256
   "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/index/slot-threads.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/index/slot-threads.lisp")
   :BYTES 11698 :SHA256
   "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/tests/index/slots.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/index/slots.lisp")
   :BYTES 26420 :SHA256
   "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/tests/io/native.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/io/native.lisp")
   :BYTES 6207 :SHA256
   "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/tests/io/support.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/io/support.lisp")
   :BYTES 2951 :SHA256
   "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/tests/io/transfer.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/io/transfer.lisp")
   :BYTES 11847 :SHA256
   "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/lint-fixtures/bad.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/lint-fixtures/bad.lisp")
   :BYTES 1587 :SHA256
   "ac8912ce6cc1101f2ebc305a50c0565879547b527d7ca0aeac900ee06bf26652")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/lint-fixtures/good.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/lint-fixtures/good.lisp")
   :BYTES 671 :SHA256
   "05ce84f8fd12d9af48252601bcc92d6d60335b53f39b01a9fe2697c4bdaa8cee")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/lint-fixtures/keyword-barrier.lisp"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/lint-fixtures/keyword-barrier.lisp")
   :BYTES 199 :SHA256
   "e26dab117e9526ace35bb45b92f977065d33fcc4404c40fd4fc3c77749689a96")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/lint-fixtures/qualified-reader.lisp"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/lint-fixtures/qualified-reader.lisp")
   :BYTES 152 :SHA256
   "835229bdc1a0ed0c08511cd6121e1f1bc4284da2cfba951b72cd1a74a6040d35")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/tests/mvcc/capture.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/mvcc/capture.lisp")
   :BYTES 16356 :SHA256
   "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/tests/mvcc/lifecycle.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/mvcc/lifecycle.lisp")
   :BYTES 23964 :SHA256
   "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/tests/mvcc/support.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/mvcc/support.lisp")
   :BYTES 5931 :SHA256
   "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/recovery/corruption.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/recovery/corruption.lisp")
   :BYTES 7106 :SHA256
   "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/recovery/decisions-audit.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/recovery/decisions-audit.lisp")
   :BYTES 14971 :SHA256
   "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/recovery/decisions-radix.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/recovery/decisions-radix.lisp")
   :BYTES 27851 :SHA256
   "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/recovery/decisions-support.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/recovery/decisions-support.lisp")
   :BYTES 6797 :SHA256
   "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/recovery/decisions.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/recovery/decisions.lisp")
   :BYTES 19149 :SHA256
   "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/recovery/inventory-support.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/recovery/inventory-support.lisp")
   :BYTES 8083 :SHA256
   "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/recovery/inventory.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/recovery/inventory.lisp")
   :BYTES 14479 :SHA256
   "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/recovery/manifest-audit.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/recovery/manifest-audit.lisp")
   :BYTES 17670 :SHA256
   "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/recovery/manifest-support.lisp"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/recovery/manifest-support.lisp")
   :BYTES 9769 :SHA256
   "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/recovery/manifest.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/recovery/manifest.lisp")
   :BYTES 13799 :SHA256
   "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/tests/recovery/scan.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/recovery/scan.lisp")
   :BYTES 16966 :SHA256
   "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/recovery/support.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/recovery/support.lisp")
   :BYTES 5957 :SHA256
   "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/series/boundaries.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/series/boundaries.lisp")
   :BYTES 5802 :SHA256
   "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/series/controller.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/series/controller.lisp")
   :BYTES 60484 :SHA256
   "4bea80eb231575f48b208ddb57af6a11706481e0ec755b084f6cd4b6fd0481a1")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/tests/series/support.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/series/support.lisp")
   :BYTES 16885 :SHA256
   "8821ae9e002941eff8ea3ae7dbfc727cb6874b68d2d1ef85af668eb2d34a0c0c")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/tests/series/threads.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/series/threads.lisp")
   :BYTES 19694 :SHA256
   "bbea64d207d14698b39ab0f8ded03db11bab09955d3f66705c23d69c09aefc8e")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/tests/smoke.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/smoke.lisp")
   :BYTES 735 :SHA256
   "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/storage/compaction-scan.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/storage/compaction-scan.lisp")
   :BYTES 16196 :SHA256
   "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/storage/control-payload.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/storage/control-payload.lisp")
   :BYTES 12651 :SHA256
   "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/storage/log-header.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/storage/log-header.lisp")
   :BYTES 11969 :SHA256
   "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/storage/segment-header.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/storage/segment-header.lisp")
   :BYTES 4149 :SHA256
   "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/storage/support.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/storage/support.lisp")
   :BYTES 4029 :SHA256
   "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/tests/wal/builder.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/wal/builder.lisp")
   :BYTES 4000 :SHA256
   "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tests/wal/csn-threads.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/wal/csn-threads.lisp")
   :BYTES 12114 :SHA256
   "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/tests/wal/csn.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/wal/csn.lisp")
   :BYTES 34661 :SHA256
   "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/tests/wal/fault.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/wal/fault.lisp")
   :BYTES 7614 :SHA256
   "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/tests/wal/group.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/wal/group.lisp")
   :BYTES 5524 :SHA256
   "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/tests/wal/native.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/wal/native.lisp")
   :BYTES 2567 :SHA256
   "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/tests/wal/support.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tests/wal/support.lisp")
   :BYTES 1951 :SHA256
   "90a47539e5e2898c0a08059207f30bb5551e7ca8fc166f8f6ce7b95afa757295")
  (:PATH "raw/cbor-string-write-mutations-20261011/5/tools/build.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/5/tools/cbor-string-write-isolated-build.lisp"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/5/tools/cbor-string-write-isolated-build.lisp")
   :BYTES 478 :SHA256
   "b529ef56f6308ad944557a2b698edfde06523ee566abb9f926b864561ac83cc7")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/cache/build.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/cache/build.lisp")
   :BYTES 4966 :SHA256
   "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/cache/clock.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/cache/clock.lisp")
   :BYTES 2952 :SHA256
   "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/cache/core.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/cache/core.lisp")
   :BYTES 3503 :SHA256
   "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/cache/package.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/cache/package.lisp")
   :BYTES 758 :SHA256
   "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/cache/read.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/cache/read.lisp")
   :BYTES 6220 :SHA256
   "bf2232802b2f3648514dfb76f20e571797f981ebb3138f79fc1b42477df045e8")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/cache/types.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/cache/types.lisp")
   :BYTES 2448 :SHA256
   "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/cache/write.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/cache/write.lisp")
   :BYTES 5481 :SHA256
   "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/codec/cbor-float-minimal.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/codec/cbor-header.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/codec/cbor-minimal.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/codec/cbor-package.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/codec/cbor-package.lisp")
   :BYTES 579 :SHA256
   "f599073f7a2f085715caa30c78eaeda1a2feee7fed97f4fd33207e45c93455a1")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/codec/cbor-scan-input.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/codec/cbor-scan-items.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/codec/cbor-scan-minimal.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/codec/cbor-scan-stack.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/codec/cbor-scan.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/codec/cbor-space.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/codec/cbor-string-write.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/codec/cbor-string-write.lisp")
   :BYTES 7735 :SHA256
   "435e8207bd5bced681c5c7d74c429537bf513d55ba689014fd9795fba37cdc91")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/codec/cbor-write.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/codec/package.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/codec/utf8.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/csn/package.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/csn/package.lisp")
   :BYTES 441 :SHA256
   "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/csn/registry.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/csn/registry.lisp")
   :BYTES 12139 :SHA256
   "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/epochs/core.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/epochs/core.lisp")
   :BYTES 5909 :SHA256
   "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/epochs/package.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/epochs/package.lisp")
   :BYTES 779 :SHA256
   "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/epochs/read.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/epochs/read.lisp")
   :BYTES 3240 :SHA256
   "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/epochs/reclaim.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/epochs/reclaim.lisp")
   :BYTES 6373 :SHA256
   "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/epochs/retire.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/epochs/retire.lisp")
   :BYTES 5858 :SHA256
   "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/epochs/types.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/epochs/types.lisp")
   :BYTES 5304 :SHA256
   "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/execution/handoff.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/execution/handoff.lisp")
   :BYTES 7394 :SHA256
   "ee90c809ef51134efa21e08b819e5530304efaf9f9e26b63c7e4afbf6d48e607")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/execution/package.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/execution/package.lisp")
   :BYTES 1157 :SHA256
   "bbe8cdb6f7e74d7139f5e472a915cc74b43e34bd27ecac1c5fd364f723a2a643")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/execution/queue.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/execution/queue.lisp")
   :BYTES 5374 :SHA256
   "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/execution/ready-recycle.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/execution/ready-recycle.lisp")
   :BYTES 3387 :SHA256
   "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/execution/ready-types.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/execution/ready-types.lisp")
   :BYTES 5248 :SHA256
   "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/execution/ready.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/execution/ready.lisp")
   :BYTES 6635 :SHA256
   "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/execution/worker-boundary.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/execution/worker-boundary.lisp")
   :BYTES 2309 :SHA256
   "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/execution/worker-claim.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/execution/worker-claim.lisp")
   :BYTES 6401 :SHA256
   "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/execution/worker-run.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/execution/worker-run.lisp")
   :BYTES 5124 :SHA256
   "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/execution/worker-types.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/execution/worker-types.lisp")
   :BYTES 8461 :SHA256
   "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/execution/writer.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/execution/writer.lisp")
   :BYTES 6484 :SHA256
   "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/foundation/batch.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/foundation/binary.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/foundation/conditions.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/foundation/crc32c.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/foundation/package.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/foundation/record.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/index/core.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/index/core.lisp")
   :BYTES 2959 :SHA256
   "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/index/package.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/index/package.lisp")
   :BYTES 727 :SHA256
   "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/index/primary-arena.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/index/primary-arena.lisp")
   :BYTES 3485 :SHA256
   "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/index/primary-build.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/index/primary-build.lisp")
   :BYTES 4794 :SHA256
   "c38c654fd9fb4b1022c1b927cc956fc6e4fcfb4e6546241abab0ef1d2250982e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/index/primary-core.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/index/primary-core.lisp")
   :BYTES 4211 :SHA256
   "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/index/primary-directory.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/index/primary-directory.lisp")
   :BYTES 8114 :SHA256
   "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/index/primary-package.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/index/primary-package.lisp")
   :BYTES 1389 :SHA256
   "de63b143381f1d044df8f8f5545ac4230e1e6e3631ad015b5c4841ced70ecf8d")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/index/primary-probe.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/index/primary-probe.lisp")
   :BYTES 5936 :SHA256
   "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/index/primary-read.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/index/primary-read.lisp")
   :BYTES 3575 :SHA256
   "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/index/primary-relocate.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/index/primary-relocate.lisp")
   :BYTES 4073 :SHA256
   "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/index/primary-types.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/index/primary-types.lisp")
   :BYTES 3827 :SHA256
   "8fac31490331dcff794cedae79c3b9028922e18741c99d04404203f08ec3dcec")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/index/primary-write.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/index/primary-write.lisp")
   :BYTES 7061 :SHA256
   "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/index/read.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/index/read.lisp")
   :BYTES 3030 :SHA256
   "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/index/rebuild-budget.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/index/rebuild-budget.lisp")
   :BYTES 3593 :SHA256
   "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/index/rebuild-copy.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/index/rebuild-copy.lisp")
   :BYTES 4027 :SHA256
   "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/index/rebuild-scan.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/index/rebuild-scan.lisp")
   :BYTES 5002 :SHA256
   "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/index/rebuild.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/index/rebuild.lisp")
   :BYTES 2872 :SHA256
   "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/index/relocate.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/index/relocate.lisp")
   :BYTES 2383 :SHA256
   "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/index/types.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/index/types.lisp")
   :BYTES 2434 :SHA256
   "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/index/validation.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/index/validation.lisp")
   :BYTES 3930 :SHA256
   "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/index/write.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/index/write.lisp")
   :BYTES 4784 :SHA256
   "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/io/flush.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/io/flush.lisp")
   :BYTES 1569 :SHA256
   "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/io/lifecycle.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/io/lifecycle.lisp")
   :BYTES 4536 :SHA256
   "baa1f763fe0f394a14d381b753dcb1be1e90eb03eaff5d6469465b5d4eca015f")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/io/native.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/io/native.lisp")
   :BYTES 5026 :SHA256
   "b8cf3ce1ff7b4fa9def8a602ab768c0e9a321f8d6cdce6e5b2b7ded2fe3d97dd")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/io/package.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/io/package.lisp")
   :BYTES 592 :SHA256
   "118eba04ab2aa87a2d86e0b0269dbeacaa485457acebbc12c57317ae465a89c0")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/io/transfer.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/io/transfer.lisp")
   :BYTES 5051 :SHA256
   "3748328cf85e1c007900a63bdd0f159f38a8d7cd3577c92c56fc68692b9b7bcf")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/io/types.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/io/types.lisp")
   :BYTES 4143 :SHA256
   "50c7eeea91af232fca7103ce5a25535958d73836f01cb45a20c7120b88b1336b")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/mvcc/package.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/mvcc/package.lisp")
   :BYTES 833 :SHA256
   "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/mvcc/snapshots-core.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/mvcc/snapshots-core.lisp")
   :BYTES 7622 :SHA256
   "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/mvcc/snapshots-csn.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/mvcc/snapshots-csn.lisp")
   :BYTES 2725 :SHA256
   "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/mvcc/snapshots-lifecycle.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/mvcc/snapshots-lifecycle.lisp")
   :BYTES 6609 :SHA256
   "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/mvcc/snapshots-read.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/mvcc/snapshots-read.lisp")
   :BYTES 6651 :SHA256
   "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/mvcc/snapshots-register.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/mvcc/snapshots-register.lisp")
   :BYTES 6654 :SHA256
   "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/mvcc/snapshots-types.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/mvcc/snapshots-types.lisp")
   :BYTES 3817 :SHA256
   "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/mvcc/types.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/mvcc/types.lisp")
   :BYTES 471 :SHA256
   "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/package.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/read/core.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/read/core.lisp")
   :BYTES 3846 :SHA256
   "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/read/package.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/read/package.lisp")
   :BYTES 831 :SHA256
   "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/read/task.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/read/task.lisp")
   :BYTES 5073 :SHA256
   "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/read/types.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/read/types.lisp")
   :BYTES 2358 :SHA256
   "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/recovery/decisions-build.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/recovery/decisions-build.lisp")
   :BYTES 11857 :SHA256
   "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/recovery/decisions-package.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/recovery/decisions-package.lisp")
   :BYTES 818 :SHA256
   "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/recovery/decisions-query.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/recovery/decisions-query.lisp")
   :BYTES 4525 :SHA256
   "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/recovery/decisions-radix.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/recovery/decisions-radix.lisp")
   :BYTES 11061 :SHA256
   "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/recovery/decisions-sort.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/recovery/decisions-sort.lisp")
   :BYTES 7654 :SHA256
   "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/recovery/decisions-types.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/recovery/decisions-types.lisp")
   :BYTES 2056 :SHA256
   "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/recovery/inventory-build.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/recovery/inventory-build.lisp")
   :BYTES 9592 :SHA256
   "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/recovery/inventory-query.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/recovery/inventory-query.lisp")
   :BYTES 2100 :SHA256
   "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/recovery/inventory-types.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/recovery/inventory-types.lisp")
   :BYTES 2392 :SHA256
   "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/recovery/manifest-build.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/recovery/manifest-build.lisp")
   :BYTES 10251 :SHA256
   "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/recovery/manifest-decode.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/recovery/manifest-decode.lisp")
   :BYTES 6160 :SHA256
   "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/recovery/manifest-fold.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/recovery/manifest-fold.lisp")
   :BYTES 7068 :SHA256
   "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/recovery/manifest-package.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/recovery/manifest-package.lisp")
   :BYTES 1372 :SHA256
   "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/recovery/manifest-query.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/recovery/manifest-query.lisp")
   :BYTES 3582 :SHA256
   "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/recovery/manifest-types.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/recovery/manifest-types.lisp")
   :BYTES 3345 :SHA256
   "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/recovery/package.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/recovery/package.lisp")
   :BYTES 927 :SHA256
   "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/recovery/scan.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/recovery/scan.lisp")
   :BYTES 12829 :SHA256
   "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/series/events.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/series/events.lisp")
   :BYTES 9566 :SHA256
   "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/series/io-events.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/series/io-events.lisp")
   :BYTES 5385 :SHA256
   "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/series/ownership.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/series/ownership.lisp")
   :BYTES 8810 :SHA256
   "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/series/package.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/series/package.lisp")
   :BYTES 1392 :SHA256
   "7433162105df63d324141167e6dcf6bfee74611aa1cf7291cc6c92f41f3c7408")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/series/publication.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/series/publication.lisp")
   :BYTES 6094 :SHA256
   "288cb3fa41fad76a0e6919dfa0b2fce2beef15f5880129393bee35bc8795c762")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/series/query.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/series/query.lisp")
   :BYTES 3600 :SHA256
   "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/series/retirement.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/series/retirement.lisp")
   :BYTES 4634 :SHA256
   "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/series/types.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/series/types.lisp")
   :BYTES 3316 :SHA256
   "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/storage/compaction-scan.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/storage/compaction-scan.lisp")
   :BYTES 5510 :SHA256
   "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/storage/control-payload.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/storage/control-payload.lisp")
   :BYTES 6273 :SHA256
   "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/storage/formats.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/storage/formats.lisp")
   :BYTES 3841 :SHA256
   "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/storage/log-header.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/storage/log-header.lisp")
   :BYTES 3947 :SHA256
   "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/storage/package.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/storage/package.lisp")
   :BYTES 1079 :SHA256
   "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/storage/payload-record.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/storage/payload-record.lisp")
   :BYTES 3641 :SHA256
   "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/storage/payload-write.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/storage/payload-write.lisp")
   :BYTES 5239 :SHA256
   "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/src/storage/segment-header.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/storage/segment-header.lisp")
   :BYTES 5517 :SHA256
   "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/wal/builder.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/wal/builder.lisp")
   :BYTES 8445 :SHA256
   "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/wal/csn.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/wal/csn.lisp")
   :BYTES 9577 :SHA256
   "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/wal/executor.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/wal/executor.lisp")
   :BYTES 6023 :SHA256
   "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/wal/group.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/wal/group.lisp")
   :BYTES 6305 :SHA256
   "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/wal/package.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/wal/package.lisp")
   :BYTES 1774 :SHA256
   "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/src/wal/types.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/src/wal/types.lisp")
   :BYTES 5420 :SHA256
   "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/test.log" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/test.log")
   :BYTES 22579 :SHA256
   "de714dba4931e3f234410a228c5dede4421b8a0e355280d177a9b785bf161b9a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/codec/cbor-header.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/codec/cbor-header.lisp")
   :BYTES 10773 :SHA256
   "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/codec/cbor-minimal-edges.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/codec/cbor-minimal-edges.lisp")
   :BYTES 1613 :SHA256
   "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/codec/cbor-minimal-scan-support.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/codec/cbor-minimal-scan-support.lisp")
   :BYTES 8363 :SHA256
   "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/codec/cbor-minimal-scan-threads.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/codec/cbor-minimal-scan-threads.lisp")
   :BYTES 4547 :SHA256
   "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/codec/cbor-minimal-scan.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/codec/cbor-minimal-scan.lisp")
   :BYTES 19217 :SHA256
   "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/codec/cbor-minimal-support.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/codec/cbor-minimal-support.lisp")
   :BYTES 8620 :SHA256
   "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/codec/cbor-minimal-threads.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/codec/cbor-minimal-threads.lisp")
   :BYTES 3799 :SHA256
   "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/codec/cbor-minimal.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/codec/cbor-minimal.lisp")
   :BYTES 12604 :SHA256
   "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/codec/cbor-string-write-support.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/codec/cbor-string-write-support.lisp")
   :BYTES 6829 :SHA256
   "611ec1d825855d9df27988821ee45f0ecf81fbd3128a38df6ee5c727551cd9f2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/codec/cbor-string-write-threads.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/codec/cbor-string-write-threads.lisp")
   :BYTES 3311 :SHA256
   "d45b4dda658a96b9af9051b152df2b17859aecdbb9131505d1a2689b27ffb88a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/codec/cbor-string-write.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/codec/cbor-string-write.lisp")
   :BYTES 15883 :SHA256
   "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/codec/cbor-structure-support.lisp"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/codec/cbor-structure-threads.lisp"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/codec/cbor-structure-threads.lisp")
   :BYTES 4305 :SHA256
   "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/codec/cbor-structure.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/codec/cbor-structure.lisp")
   :BYTES 22968 :SHA256
   "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/codec/cbor-support.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/codec/cbor-threads.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/codec/cbor-threads.lisp")
   :BYTES 3683 :SHA256
   "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/codec/cbor-write-roundtrip.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/codec/cbor-write-roundtrip.lisp")
   :BYTES 901 :SHA256
   "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/codec/cbor-write-support.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/codec/cbor-write-support.lisp")
   :BYTES 4768 :SHA256
   "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/codec/cbor-write-threads.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/codec/cbor-write-threads.lisp")
   :BYTES 3813 :SHA256
   "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/codec/cbor-write.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/codec/cbor-write.lisp")
   :BYTES 9822 :SHA256
   "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/tests/codec/support.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/codec/support.lisp")
   :BYTES 5807 :SHA256
   "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/tests/codec/threads.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/codec/threads.lisp")
   :BYTES 3111 :SHA256
   "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/tests/codec/utf8.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/codec/utf8.lisp")
   :BYTES 12892 :SHA256
   "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/tests/csn/registry.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/csn/registry.lisp")
   :BYTES 19411 :SHA256
   "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/tests/csn/support.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/csn/support.lisp")
   :BYTES 11407 :SHA256
   "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/tests/csn/threads.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/csn/threads.lisp")
   :BYTES 10525 :SHA256
   "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/execution/handoff.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/execution/handoff.lisp")
   :BYTES 33278 :SHA256
   "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/execution/queue.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/execution/queue.lisp")
   :BYTES 12894 :SHA256
   "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/execution/ready-recycle.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/execution/ready-recycle.lisp")
   :BYTES 30075 :SHA256
   "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/execution/ready.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/execution/ready.lisp")
   :BYTES 33555 :SHA256
   "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/execution/support.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/execution/support.lisp")
   :BYTES 4469 :SHA256
   "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/execution/threads.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/execution/threads.lisp")
   :BYTES 14622 :SHA256
   "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/execution/worker.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/execution/worker.lisp")
   :BYTES 59783 :SHA256
   "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/foundation/batch.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/foundation/batch.lisp")
   :BYTES 5185 :SHA256
   "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/foundation/binary.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/foundation/binary.lisp")
   :BYTES 3721 :SHA256
   "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/foundation/record.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/foundation/record.lisp")
   :BYTES 14950 :SHA256
   "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/foundation/support.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/index/primary-support.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/index/primary-support.lisp")
   :BYTES 13938 :SHA256
   "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/index/primary-threads.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/index/primary-threads.lisp")
   :BYTES 13744 :SHA256
   "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/tests/index/primary.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/index/primary.lisp")
   :BYTES 30166 :SHA256
   "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/tests/index/rebuild.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/index/rebuild.lisp")
   :BYTES 32112 :SHA256
   "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/index/slot-support.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/index/slot-support.lisp")
   :BYTES 12800 :SHA256
   "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/index/slot-threads.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/index/slot-threads.lisp")
   :BYTES 11698 :SHA256
   "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/tests/index/slots.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/index/slots.lisp")
   :BYTES 26420 :SHA256
   "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/tests/io/native.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/io/native.lisp")
   :BYTES 6207 :SHA256
   "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/tests/io/support.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/io/support.lisp")
   :BYTES 2951 :SHA256
   "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/tests/io/transfer.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/io/transfer.lisp")
   :BYTES 11847 :SHA256
   "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/lint-fixtures/bad.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/lint-fixtures/bad.lisp")
   :BYTES 1587 :SHA256
   "ac8912ce6cc1101f2ebc305a50c0565879547b527d7ca0aeac900ee06bf26652")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/lint-fixtures/good.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/lint-fixtures/good.lisp")
   :BYTES 671 :SHA256
   "05ce84f8fd12d9af48252601bcc92d6d60335b53f39b01a9fe2697c4bdaa8cee")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/lint-fixtures/keyword-barrier.lisp"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/lint-fixtures/keyword-barrier.lisp")
   :BYTES 199 :SHA256
   "e26dab117e9526ace35bb45b92f977065d33fcc4404c40fd4fc3c77749689a96")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/lint-fixtures/qualified-reader.lisp"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/lint-fixtures/qualified-reader.lisp")
   :BYTES 152 :SHA256
   "835229bdc1a0ed0c08511cd6121e1f1bc4284da2cfba951b72cd1a74a6040d35")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/tests/mvcc/capture.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/mvcc/capture.lisp")
   :BYTES 16356 :SHA256
   "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/tests/mvcc/lifecycle.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/mvcc/lifecycle.lisp")
   :BYTES 23964 :SHA256
   "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/tests/mvcc/support.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/mvcc/support.lisp")
   :BYTES 5931 :SHA256
   "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/recovery/corruption.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/recovery/corruption.lisp")
   :BYTES 7106 :SHA256
   "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/recovery/decisions-audit.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/recovery/decisions-audit.lisp")
   :BYTES 14971 :SHA256
   "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/recovery/decisions-radix.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/recovery/decisions-radix.lisp")
   :BYTES 27851 :SHA256
   "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/recovery/decisions-support.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/recovery/decisions-support.lisp")
   :BYTES 6797 :SHA256
   "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/recovery/decisions.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/recovery/decisions.lisp")
   :BYTES 19149 :SHA256
   "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/recovery/inventory-support.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/recovery/inventory-support.lisp")
   :BYTES 8083 :SHA256
   "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/recovery/inventory.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/recovery/inventory.lisp")
   :BYTES 14479 :SHA256
   "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/recovery/manifest-audit.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/recovery/manifest-audit.lisp")
   :BYTES 17670 :SHA256
   "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/recovery/manifest-support.lisp"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/recovery/manifest-support.lisp")
   :BYTES 9769 :SHA256
   "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/recovery/manifest.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/recovery/manifest.lisp")
   :BYTES 13799 :SHA256
   "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/tests/recovery/scan.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/recovery/scan.lisp")
   :BYTES 16966 :SHA256
   "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/recovery/support.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/recovery/support.lisp")
   :BYTES 5957 :SHA256
   "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/series/boundaries.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/series/boundaries.lisp")
   :BYTES 5802 :SHA256
   "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/series/controller.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/series/controller.lisp")
   :BYTES 60484 :SHA256
   "4bea80eb231575f48b208ddb57af6a11706481e0ec755b084f6cd4b6fd0481a1")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/tests/series/support.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/series/support.lisp")
   :BYTES 16885 :SHA256
   "8821ae9e002941eff8ea3ae7dbfc727cb6874b68d2d1ef85af668eb2d34a0c0c")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/tests/series/threads.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/series/threads.lisp")
   :BYTES 19694 :SHA256
   "bbea64d207d14698b39ab0f8ded03db11bab09955d3f66705c23d69c09aefc8e")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/tests/smoke.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/smoke.lisp")
   :BYTES 735 :SHA256
   "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/storage/compaction-scan.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/storage/compaction-scan.lisp")
   :BYTES 16196 :SHA256
   "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/storage/control-payload.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/storage/control-payload.lisp")
   :BYTES 12651 :SHA256
   "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/storage/log-header.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/storage/log-header.lisp")
   :BYTES 11969 :SHA256
   "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/storage/segment-header.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/storage/segment-header.lisp")
   :BYTES 4149 :SHA256
   "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/storage/support.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/storage/support.lisp")
   :BYTES 4029 :SHA256
   "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/tests/wal/builder.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/wal/builder.lisp")
   :BYTES 4000 :SHA256
   "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tests/wal/csn-threads.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/wal/csn-threads.lisp")
   :BYTES 12114 :SHA256
   "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/tests/wal/csn.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/wal/csn.lisp")
   :BYTES 34661 :SHA256
   "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/tests/wal/fault.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/wal/fault.lisp")
   :BYTES 7614 :SHA256
   "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/tests/wal/group.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/wal/group.lisp")
   :BYTES 5524 :SHA256
   "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/tests/wal/native.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/wal/native.lisp")
   :BYTES 2567 :SHA256
   "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/tests/wal/support.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tests/wal/support.lisp")
   :BYTES 1951 :SHA256
   "90a47539e5e2898c0a08059207f30bb5551e7ca8fc166f8f6ce7b95afa757295")
  (:PATH "raw/cbor-string-write-mutations-20261011/6/tools/build.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/6/tools/cbor-string-write-isolated-build.lisp"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/6/tools/cbor-string-write-isolated-build.lisp")
   :BYTES 478 :SHA256
   "2ab95dd203af4ceb9b8b03c3d91965224f7c054b771a4cab796517460274bc94")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/cache/build.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/cache/build.lisp")
   :BYTES 4966 :SHA256
   "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/cache/clock.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/cache/clock.lisp")
   :BYTES 2952 :SHA256
   "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/cache/core.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/cache/core.lisp")
   :BYTES 3503 :SHA256
   "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/cache/package.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/cache/package.lisp")
   :BYTES 758 :SHA256
   "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/cache/read.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/cache/read.lisp")
   :BYTES 6220 :SHA256
   "bf2232802b2f3648514dfb76f20e571797f981ebb3138f79fc1b42477df045e8")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/cache/types.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/cache/types.lisp")
   :BYTES 2448 :SHA256
   "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/cache/write.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/cache/write.lisp")
   :BYTES 5481 :SHA256
   "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/codec/cbor-float-minimal.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/codec/cbor-header.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/codec/cbor-minimal.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/codec/cbor-package.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/codec/cbor-package.lisp")
   :BYTES 579 :SHA256
   "f599073f7a2f085715caa30c78eaeda1a2feee7fed97f4fd33207e45c93455a1")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/codec/cbor-scan-input.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/codec/cbor-scan-items.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/codec/cbor-scan-minimal.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/codec/cbor-scan-stack.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/codec/cbor-scan.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/codec/cbor-space.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/codec/cbor-string-write.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/codec/cbor-string-write.lisp")
   :BYTES 7749 :SHA256
   "ee81be30b2ae69f443b7e4da53f85b8f91631b25a49c20be8804621ea9f12478")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/codec/cbor-write.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/codec/package.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/codec/utf8.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/csn/package.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/csn/package.lisp")
   :BYTES 441 :SHA256
   "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/csn/registry.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/csn/registry.lisp")
   :BYTES 12139 :SHA256
   "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/epochs/core.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/epochs/core.lisp")
   :BYTES 5909 :SHA256
   "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/epochs/package.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/epochs/package.lisp")
   :BYTES 779 :SHA256
   "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/epochs/read.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/epochs/read.lisp")
   :BYTES 3240 :SHA256
   "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/epochs/reclaim.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/epochs/reclaim.lisp")
   :BYTES 6373 :SHA256
   "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/epochs/retire.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/epochs/retire.lisp")
   :BYTES 5858 :SHA256
   "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/epochs/types.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/epochs/types.lisp")
   :BYTES 5304 :SHA256
   "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/execution/handoff.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/execution/handoff.lisp")
   :BYTES 7394 :SHA256
   "ee90c809ef51134efa21e08b819e5530304efaf9f9e26b63c7e4afbf6d48e607")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/execution/package.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/execution/package.lisp")
   :BYTES 1157 :SHA256
   "bbe8cdb6f7e74d7139f5e472a915cc74b43e34bd27ecac1c5fd364f723a2a643")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/execution/queue.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/execution/queue.lisp")
   :BYTES 5374 :SHA256
   "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/execution/ready-recycle.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/execution/ready-recycle.lisp")
   :BYTES 3387 :SHA256
   "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/execution/ready-types.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/execution/ready-types.lisp")
   :BYTES 5248 :SHA256
   "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/execution/ready.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/execution/ready.lisp")
   :BYTES 6635 :SHA256
   "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/execution/worker-boundary.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/execution/worker-boundary.lisp")
   :BYTES 2309 :SHA256
   "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/execution/worker-claim.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/execution/worker-claim.lisp")
   :BYTES 6401 :SHA256
   "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/execution/worker-run.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/execution/worker-run.lisp")
   :BYTES 5124 :SHA256
   "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/execution/worker-types.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/execution/worker-types.lisp")
   :BYTES 8461 :SHA256
   "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/execution/writer.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/execution/writer.lisp")
   :BYTES 6484 :SHA256
   "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/foundation/batch.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/foundation/binary.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/foundation/conditions.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/foundation/crc32c.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/foundation/package.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/foundation/record.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/index/core.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/index/core.lisp")
   :BYTES 2959 :SHA256
   "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/index/package.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/index/package.lisp")
   :BYTES 727 :SHA256
   "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/index/primary-arena.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/index/primary-arena.lisp")
   :BYTES 3485 :SHA256
   "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/index/primary-build.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/index/primary-build.lisp")
   :BYTES 4794 :SHA256
   "c38c654fd9fb4b1022c1b927cc956fc6e4fcfb4e6546241abab0ef1d2250982e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/index/primary-core.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/index/primary-core.lisp")
   :BYTES 4211 :SHA256
   "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/index/primary-directory.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/index/primary-directory.lisp")
   :BYTES 8114 :SHA256
   "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/index/primary-package.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/index/primary-package.lisp")
   :BYTES 1389 :SHA256
   "de63b143381f1d044df8f8f5545ac4230e1e6e3631ad015b5c4841ced70ecf8d")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/index/primary-probe.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/index/primary-probe.lisp")
   :BYTES 5936 :SHA256
   "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/index/primary-read.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/index/primary-read.lisp")
   :BYTES 3575 :SHA256
   "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/index/primary-relocate.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/index/primary-relocate.lisp")
   :BYTES 4073 :SHA256
   "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/index/primary-types.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/index/primary-types.lisp")
   :BYTES 3827 :SHA256
   "8fac31490331dcff794cedae79c3b9028922e18741c99d04404203f08ec3dcec")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/index/primary-write.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/index/primary-write.lisp")
   :BYTES 7061 :SHA256
   "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/index/read.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/index/read.lisp")
   :BYTES 3030 :SHA256
   "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/index/rebuild-budget.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/index/rebuild-budget.lisp")
   :BYTES 3593 :SHA256
   "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/index/rebuild-copy.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/index/rebuild-copy.lisp")
   :BYTES 4027 :SHA256
   "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/index/rebuild-scan.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/index/rebuild-scan.lisp")
   :BYTES 5002 :SHA256
   "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/index/rebuild.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/index/rebuild.lisp")
   :BYTES 2872 :SHA256
   "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/index/relocate.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/index/relocate.lisp")
   :BYTES 2383 :SHA256
   "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/index/types.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/index/types.lisp")
   :BYTES 2434 :SHA256
   "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/index/validation.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/index/validation.lisp")
   :BYTES 3930 :SHA256
   "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/index/write.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/index/write.lisp")
   :BYTES 4784 :SHA256
   "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/io/flush.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/io/flush.lisp")
   :BYTES 1569 :SHA256
   "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/io/lifecycle.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/io/lifecycle.lisp")
   :BYTES 4536 :SHA256
   "baa1f763fe0f394a14d381b753dcb1be1e90eb03eaff5d6469465b5d4eca015f")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/io/native.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/io/native.lisp")
   :BYTES 5026 :SHA256
   "b8cf3ce1ff7b4fa9def8a602ab768c0e9a321f8d6cdce6e5b2b7ded2fe3d97dd")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/io/package.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/io/package.lisp")
   :BYTES 592 :SHA256
   "118eba04ab2aa87a2d86e0b0269dbeacaa485457acebbc12c57317ae465a89c0")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/io/transfer.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/io/transfer.lisp")
   :BYTES 5051 :SHA256
   "3748328cf85e1c007900a63bdd0f159f38a8d7cd3577c92c56fc68692b9b7bcf")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/io/types.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/io/types.lisp")
   :BYTES 4143 :SHA256
   "50c7eeea91af232fca7103ce5a25535958d73836f01cb45a20c7120b88b1336b")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/mvcc/package.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/mvcc/package.lisp")
   :BYTES 833 :SHA256
   "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/mvcc/snapshots-core.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/mvcc/snapshots-core.lisp")
   :BYTES 7622 :SHA256
   "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/mvcc/snapshots-csn.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/mvcc/snapshots-csn.lisp")
   :BYTES 2725 :SHA256
   "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/mvcc/snapshots-lifecycle.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/mvcc/snapshots-lifecycle.lisp")
   :BYTES 6609 :SHA256
   "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/mvcc/snapshots-read.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/mvcc/snapshots-read.lisp")
   :BYTES 6651 :SHA256
   "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/mvcc/snapshots-register.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/mvcc/snapshots-register.lisp")
   :BYTES 6654 :SHA256
   "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/mvcc/snapshots-types.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/mvcc/snapshots-types.lisp")
   :BYTES 3817 :SHA256
   "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/mvcc/types.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/mvcc/types.lisp")
   :BYTES 471 :SHA256
   "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/package.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/read/core.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/read/core.lisp")
   :BYTES 3846 :SHA256
   "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/read/package.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/read/package.lisp")
   :BYTES 831 :SHA256
   "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/read/task.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/read/task.lisp")
   :BYTES 5073 :SHA256
   "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/read/types.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/read/types.lisp")
   :BYTES 2358 :SHA256
   "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/recovery/decisions-build.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/recovery/decisions-build.lisp")
   :BYTES 11857 :SHA256
   "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/recovery/decisions-package.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/recovery/decisions-package.lisp")
   :BYTES 818 :SHA256
   "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/recovery/decisions-query.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/recovery/decisions-query.lisp")
   :BYTES 4525 :SHA256
   "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/recovery/decisions-radix.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/recovery/decisions-radix.lisp")
   :BYTES 11061 :SHA256
   "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/recovery/decisions-sort.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/recovery/decisions-sort.lisp")
   :BYTES 7654 :SHA256
   "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/recovery/decisions-types.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/recovery/decisions-types.lisp")
   :BYTES 2056 :SHA256
   "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/recovery/inventory-build.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/recovery/inventory-build.lisp")
   :BYTES 9592 :SHA256
   "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/recovery/inventory-query.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/recovery/inventory-query.lisp")
   :BYTES 2100 :SHA256
   "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/recovery/inventory-types.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/recovery/inventory-types.lisp")
   :BYTES 2392 :SHA256
   "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/recovery/manifest-build.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/recovery/manifest-build.lisp")
   :BYTES 10251 :SHA256
   "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/recovery/manifest-decode.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/recovery/manifest-decode.lisp")
   :BYTES 6160 :SHA256
   "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/recovery/manifest-fold.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/recovery/manifest-fold.lisp")
   :BYTES 7068 :SHA256
   "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/recovery/manifest-package.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/recovery/manifest-package.lisp")
   :BYTES 1372 :SHA256
   "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/recovery/manifest-query.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/recovery/manifest-query.lisp")
   :BYTES 3582 :SHA256
   "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/recovery/manifest-types.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/recovery/manifest-types.lisp")
   :BYTES 3345 :SHA256
   "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/recovery/package.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/recovery/package.lisp")
   :BYTES 927 :SHA256
   "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/recovery/scan.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/recovery/scan.lisp")
   :BYTES 12829 :SHA256
   "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/series/events.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/series/events.lisp")
   :BYTES 9566 :SHA256
   "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/series/io-events.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/series/io-events.lisp")
   :BYTES 5385 :SHA256
   "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/series/ownership.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/series/ownership.lisp")
   :BYTES 8810 :SHA256
   "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/series/package.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/series/package.lisp")
   :BYTES 1392 :SHA256
   "7433162105df63d324141167e6dcf6bfee74611aa1cf7291cc6c92f41f3c7408")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/series/publication.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/series/publication.lisp")
   :BYTES 6094 :SHA256
   "288cb3fa41fad76a0e6919dfa0b2fce2beef15f5880129393bee35bc8795c762")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/series/query.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/series/query.lisp")
   :BYTES 3600 :SHA256
   "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/series/retirement.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/series/retirement.lisp")
   :BYTES 4634 :SHA256
   "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/series/types.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/series/types.lisp")
   :BYTES 3316 :SHA256
   "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/storage/compaction-scan.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/storage/compaction-scan.lisp")
   :BYTES 5510 :SHA256
   "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/storage/control-payload.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/storage/control-payload.lisp")
   :BYTES 6273 :SHA256
   "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/storage/formats.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/storage/formats.lisp")
   :BYTES 3841 :SHA256
   "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/storage/log-header.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/storage/log-header.lisp")
   :BYTES 3947 :SHA256
   "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/storage/package.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/storage/package.lisp")
   :BYTES 1079 :SHA256
   "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/storage/payload-record.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/storage/payload-record.lisp")
   :BYTES 3641 :SHA256
   "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/storage/payload-write.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/storage/payload-write.lisp")
   :BYTES 5239 :SHA256
   "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/src/storage/segment-header.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/storage/segment-header.lisp")
   :BYTES 5517 :SHA256
   "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/wal/builder.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/wal/builder.lisp")
   :BYTES 8445 :SHA256
   "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/wal/csn.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/wal/csn.lisp")
   :BYTES 9577 :SHA256
   "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/wal/executor.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/wal/executor.lisp")
   :BYTES 6023 :SHA256
   "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/wal/group.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/wal/group.lisp")
   :BYTES 6305 :SHA256
   "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/wal/package.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/wal/package.lisp")
   :BYTES 1774 :SHA256
   "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/src/wal/types.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/src/wal/types.lisp")
   :BYTES 5420 :SHA256
   "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/test.log" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/test.log")
   :BYTES 33157 :SHA256
   "23ddd04ce6147e6cd8a17c1120e1bec221c265d1686f135b9e135ee67ee2b56c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/codec/cbor-header.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/codec/cbor-header.lisp")
   :BYTES 10773 :SHA256
   "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/codec/cbor-minimal-edges.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/codec/cbor-minimal-edges.lisp")
   :BYTES 1613 :SHA256
   "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/codec/cbor-minimal-scan-support.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/codec/cbor-minimal-scan-support.lisp")
   :BYTES 8363 :SHA256
   "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/codec/cbor-minimal-scan-threads.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/codec/cbor-minimal-scan-threads.lisp")
   :BYTES 4547 :SHA256
   "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/codec/cbor-minimal-scan.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/codec/cbor-minimal-scan.lisp")
   :BYTES 19217 :SHA256
   "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/codec/cbor-minimal-support.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/codec/cbor-minimal-support.lisp")
   :BYTES 8620 :SHA256
   "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/codec/cbor-minimal-threads.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/codec/cbor-minimal-threads.lisp")
   :BYTES 3799 :SHA256
   "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/codec/cbor-minimal.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/codec/cbor-minimal.lisp")
   :BYTES 12604 :SHA256
   "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/codec/cbor-string-write-support.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/codec/cbor-string-write-support.lisp")
   :BYTES 6829 :SHA256
   "611ec1d825855d9df27988821ee45f0ecf81fbd3128a38df6ee5c727551cd9f2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/codec/cbor-string-write-threads.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/codec/cbor-string-write-threads.lisp")
   :BYTES 3311 :SHA256
   "d45b4dda658a96b9af9051b152df2b17859aecdbb9131505d1a2689b27ffb88a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/codec/cbor-string-write.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/codec/cbor-string-write.lisp")
   :BYTES 15883 :SHA256
   "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/codec/cbor-structure-support.lisp"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/codec/cbor-structure-threads.lisp"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/codec/cbor-structure-threads.lisp")
   :BYTES 4305 :SHA256
   "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/codec/cbor-structure.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/codec/cbor-structure.lisp")
   :BYTES 22968 :SHA256
   "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/codec/cbor-support.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/codec/cbor-threads.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/codec/cbor-threads.lisp")
   :BYTES 3683 :SHA256
   "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/codec/cbor-write-roundtrip.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/codec/cbor-write-roundtrip.lisp")
   :BYTES 901 :SHA256
   "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/codec/cbor-write-support.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/codec/cbor-write-support.lisp")
   :BYTES 4768 :SHA256
   "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/codec/cbor-write-threads.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/codec/cbor-write-threads.lisp")
   :BYTES 3813 :SHA256
   "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/codec/cbor-write.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/codec/cbor-write.lisp")
   :BYTES 9822 :SHA256
   "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/tests/codec/support.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/codec/support.lisp")
   :BYTES 5807 :SHA256
   "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/tests/codec/threads.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/codec/threads.lisp")
   :BYTES 3111 :SHA256
   "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/tests/codec/utf8.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/codec/utf8.lisp")
   :BYTES 12892 :SHA256
   "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/tests/csn/registry.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/csn/registry.lisp")
   :BYTES 19411 :SHA256
   "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/tests/csn/support.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/csn/support.lisp")
   :BYTES 11407 :SHA256
   "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/tests/csn/threads.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/csn/threads.lisp")
   :BYTES 10525 :SHA256
   "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/execution/handoff.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/execution/handoff.lisp")
   :BYTES 33278 :SHA256
   "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/execution/queue.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/execution/queue.lisp")
   :BYTES 12894 :SHA256
   "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/execution/ready-recycle.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/execution/ready-recycle.lisp")
   :BYTES 30075 :SHA256
   "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/execution/ready.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/execution/ready.lisp")
   :BYTES 33555 :SHA256
   "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/execution/support.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/execution/support.lisp")
   :BYTES 4469 :SHA256
   "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/execution/threads.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/execution/threads.lisp")
   :BYTES 14622 :SHA256
   "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/execution/worker.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/execution/worker.lisp")
   :BYTES 59783 :SHA256
   "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/foundation/batch.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/foundation/batch.lisp")
   :BYTES 5185 :SHA256
   "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/foundation/binary.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/foundation/binary.lisp")
   :BYTES 3721 :SHA256
   "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/foundation/record.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/foundation/record.lisp")
   :BYTES 14950 :SHA256
   "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/foundation/support.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/index/primary-support.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/index/primary-support.lisp")
   :BYTES 13938 :SHA256
   "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/index/primary-threads.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/index/primary-threads.lisp")
   :BYTES 13744 :SHA256
   "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/tests/index/primary.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/index/primary.lisp")
   :BYTES 30166 :SHA256
   "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/tests/index/rebuild.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/index/rebuild.lisp")
   :BYTES 32112 :SHA256
   "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/index/slot-support.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/index/slot-support.lisp")
   :BYTES 12800 :SHA256
   "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/index/slot-threads.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/index/slot-threads.lisp")
   :BYTES 11698 :SHA256
   "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/tests/index/slots.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/index/slots.lisp")
   :BYTES 26420 :SHA256
   "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/tests/io/native.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/io/native.lisp")
   :BYTES 6207 :SHA256
   "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/tests/io/support.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/io/support.lisp")
   :BYTES 2951 :SHA256
   "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/tests/io/transfer.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/io/transfer.lisp")
   :BYTES 11847 :SHA256
   "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/lint-fixtures/bad.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/lint-fixtures/bad.lisp")
   :BYTES 1587 :SHA256
   "ac8912ce6cc1101f2ebc305a50c0565879547b527d7ca0aeac900ee06bf26652")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/lint-fixtures/good.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/lint-fixtures/good.lisp")
   :BYTES 671 :SHA256
   "05ce84f8fd12d9af48252601bcc92d6d60335b53f39b01a9fe2697c4bdaa8cee")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/lint-fixtures/keyword-barrier.lisp"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/lint-fixtures/keyword-barrier.lisp")
   :BYTES 199 :SHA256
   "e26dab117e9526ace35bb45b92f977065d33fcc4404c40fd4fc3c77749689a96")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/lint-fixtures/qualified-reader.lisp"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/lint-fixtures/qualified-reader.lisp")
   :BYTES 152 :SHA256
   "835229bdc1a0ed0c08511cd6121e1f1bc4284da2cfba951b72cd1a74a6040d35")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/tests/mvcc/capture.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/mvcc/capture.lisp")
   :BYTES 16356 :SHA256
   "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/tests/mvcc/lifecycle.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/mvcc/lifecycle.lisp")
   :BYTES 23964 :SHA256
   "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/tests/mvcc/support.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/mvcc/support.lisp")
   :BYTES 5931 :SHA256
   "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/recovery/corruption.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/recovery/corruption.lisp")
   :BYTES 7106 :SHA256
   "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/recovery/decisions-audit.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/recovery/decisions-audit.lisp")
   :BYTES 14971 :SHA256
   "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/recovery/decisions-radix.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/recovery/decisions-radix.lisp")
   :BYTES 27851 :SHA256
   "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/recovery/decisions-support.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/recovery/decisions-support.lisp")
   :BYTES 6797 :SHA256
   "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/recovery/decisions.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/recovery/decisions.lisp")
   :BYTES 19149 :SHA256
   "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/recovery/inventory-support.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/recovery/inventory-support.lisp")
   :BYTES 8083 :SHA256
   "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/recovery/inventory.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/recovery/inventory.lisp")
   :BYTES 14479 :SHA256
   "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/recovery/manifest-audit.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/recovery/manifest-audit.lisp")
   :BYTES 17670 :SHA256
   "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/recovery/manifest-support.lisp"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/recovery/manifest-support.lisp")
   :BYTES 9769 :SHA256
   "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/recovery/manifest.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/recovery/manifest.lisp")
   :BYTES 13799 :SHA256
   "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/tests/recovery/scan.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/recovery/scan.lisp")
   :BYTES 16966 :SHA256
   "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/recovery/support.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/recovery/support.lisp")
   :BYTES 5957 :SHA256
   "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/series/boundaries.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/series/boundaries.lisp")
   :BYTES 5802 :SHA256
   "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/series/controller.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/series/controller.lisp")
   :BYTES 60484 :SHA256
   "4bea80eb231575f48b208ddb57af6a11706481e0ec755b084f6cd4b6fd0481a1")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/tests/series/support.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/series/support.lisp")
   :BYTES 16885 :SHA256
   "8821ae9e002941eff8ea3ae7dbfc727cb6874b68d2d1ef85af668eb2d34a0c0c")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/tests/series/threads.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/series/threads.lisp")
   :BYTES 19694 :SHA256
   "bbea64d207d14698b39ab0f8ded03db11bab09955d3f66705c23d69c09aefc8e")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/tests/smoke.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/smoke.lisp")
   :BYTES 735 :SHA256
   "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/storage/compaction-scan.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/storage/compaction-scan.lisp")
   :BYTES 16196 :SHA256
   "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/storage/control-payload.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/storage/control-payload.lisp")
   :BYTES 12651 :SHA256
   "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/storage/log-header.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/storage/log-header.lisp")
   :BYTES 11969 :SHA256
   "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/storage/segment-header.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/storage/segment-header.lisp")
   :BYTES 4149 :SHA256
   "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/storage/support.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/storage/support.lisp")
   :BYTES 4029 :SHA256
   "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/tests/wal/builder.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/wal/builder.lisp")
   :BYTES 4000 :SHA256
   "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tests/wal/csn-threads.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/wal/csn-threads.lisp")
   :BYTES 12114 :SHA256
   "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/tests/wal/csn.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/wal/csn.lisp")
   :BYTES 34661 :SHA256
   "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/tests/wal/fault.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/wal/fault.lisp")
   :BYTES 7614 :SHA256
   "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/tests/wal/group.lisp"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/wal/group.lisp")
   :BYTES 5524 :SHA256
   "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/tests/wal/native.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/wal/native.lisp")
   :BYTES 2567 :SHA256
   "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/tests/wal/support.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tests/wal/support.lisp")
   :BYTES 1951 :SHA256
   "90a47539e5e2898c0a08059207f30bb5551e7ca8fc166f8f6ce7b95afa757295")
  (:PATH "raw/cbor-string-write-mutations-20261011/7/tools/build.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/7/tools/cbor-string-write-isolated-build.lisp"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/tools/cbor-string-write-isolated-build.lisp")
   :BYTES 478 :SHA256
   "6649e2bda77202c7eea9e620e213a17d671b5c4a560ea279c9c9abb74346080f")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/cache/build.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/cache/build.lisp")
   :BYTES 4966 :SHA256
   "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/cache/clock.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/cache/clock.lisp")
   :BYTES 2952 :SHA256
   "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/cache/core.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/cache/core.lisp")
   :BYTES 3503 :SHA256
   "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/cache/package.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/cache/package.lisp")
   :BYTES 758 :SHA256
   "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/cache/read.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/cache/read.lisp")
   :BYTES 6220 :SHA256
   "bf2232802b2f3648514dfb76f20e571797f981ebb3138f79fc1b42477df045e8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/cache/types.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/cache/types.lisp")
   :BYTES 2448 :SHA256
   "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/cache/write.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/cache/write.lisp")
   :BYTES 5481 :SHA256
   "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/codec/cbor-float-minimal.lisp"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/codec/cbor-header.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/codec/cbor-minimal.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/codec/cbor-package.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/codec/cbor-package.lisp")
   :BYTES 579 :SHA256
   "f599073f7a2f085715caa30c78eaeda1a2feee7fed97f4fd33207e45c93455a1")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/codec/cbor-scan-input.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/codec/cbor-scan-items.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/codec/cbor-scan-minimal.lisp"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/codec/cbor-scan-stack.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/codec/cbor-scan.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/codec/cbor-space.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/codec/cbor-string-write.lisp"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/codec/cbor-write.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/codec/package.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/codec/utf8.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/csn/package.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/csn/package.lisp")
   :BYTES 441 :SHA256
   "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/csn/registry.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/csn/registry.lisp")
   :BYTES 12139 :SHA256
   "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/epochs/core.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/epochs/core.lisp")
   :BYTES 5909 :SHA256
   "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/epochs/package.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/epochs/package.lisp")
   :BYTES 779 :SHA256
   "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/epochs/read.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/epochs/read.lisp")
   :BYTES 3240 :SHA256
   "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/epochs/reclaim.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/epochs/reclaim.lisp")
   :BYTES 6373 :SHA256
   "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/epochs/retire.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/epochs/retire.lisp")
   :BYTES 5858 :SHA256
   "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/epochs/types.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/epochs/types.lisp")
   :BYTES 5304 :SHA256
   "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/execution/handoff.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/execution/handoff.lisp")
   :BYTES 7394 :SHA256
   "ee90c809ef51134efa21e08b819e5530304efaf9f9e26b63c7e4afbf6d48e607")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/execution/package.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/execution/package.lisp")
   :BYTES 1157 :SHA256
   "bbe8cdb6f7e74d7139f5e472a915cc74b43e34bd27ecac1c5fd364f723a2a643")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/execution/queue.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/execution/queue.lisp")
   :BYTES 5374 :SHA256
   "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/execution/ready-recycle.lisp"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/execution/ready-recycle.lisp")
   :BYTES 3387 :SHA256
   "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/execution/ready-types.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/execution/ready-types.lisp")
   :BYTES 5248 :SHA256
   "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/execution/ready.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/execution/ready.lisp")
   :BYTES 6635 :SHA256
   "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/execution/worker-boundary.lisp"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/execution/worker-boundary.lisp")
   :BYTES 2309 :SHA256
   "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/execution/worker-claim.lisp"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/execution/worker-claim.lisp")
   :BYTES 6401 :SHA256
   "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/execution/worker-run.lisp"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/execution/worker-run.lisp")
   :BYTES 5124 :SHA256
   "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/execution/worker-types.lisp"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/execution/worker-types.lisp")
   :BYTES 8461 :SHA256
   "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/execution/writer.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/execution/writer.lisp")
   :BYTES 6484 :SHA256
   "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/foundation/batch.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/foundation/binary.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/foundation/conditions.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/foundation/crc32c.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/foundation/package.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/foundation/record.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/index/core.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/index/core.lisp")
   :BYTES 2959 :SHA256
   "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/index/package.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/index/package.lisp")
   :BYTES 727 :SHA256
   "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/index/primary-arena.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/index/primary-arena.lisp")
   :BYTES 3485 :SHA256
   "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/index/primary-build.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/index/primary-build.lisp")
   :BYTES 4794 :SHA256
   "c38c654fd9fb4b1022c1b927cc956fc6e4fcfb4e6546241abab0ef1d2250982e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/index/primary-core.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/index/primary-core.lisp")
   :BYTES 4211 :SHA256
   "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/index/primary-directory.lisp"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/index/primary-directory.lisp")
   :BYTES 8114 :SHA256
   "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/index/primary-package.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/index/primary-package.lisp")
   :BYTES 1389 :SHA256
   "de63b143381f1d044df8f8f5545ac4230e1e6e3631ad015b5c4841ced70ecf8d")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/index/primary-probe.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/index/primary-probe.lisp")
   :BYTES 5936 :SHA256
   "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/index/primary-read.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/index/primary-read.lisp")
   :BYTES 3575 :SHA256
   "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/index/primary-relocate.lisp"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/index/primary-relocate.lisp")
   :BYTES 4073 :SHA256
   "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/index/primary-types.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/index/primary-types.lisp")
   :BYTES 3827 :SHA256
   "8fac31490331dcff794cedae79c3b9028922e18741c99d04404203f08ec3dcec")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/index/primary-write.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/index/primary-write.lisp")
   :BYTES 7061 :SHA256
   "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/index/read.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/index/read.lisp")
   :BYTES 3030 :SHA256
   "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/index/rebuild-budget.lisp"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/index/rebuild-budget.lisp")
   :BYTES 3593 :SHA256
   "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/index/rebuild-copy.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/index/rebuild-copy.lisp")
   :BYTES 4027 :SHA256
   "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/index/rebuild-scan.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/index/rebuild-scan.lisp")
   :BYTES 5002 :SHA256
   "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/index/rebuild.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/index/rebuild.lisp")
   :BYTES 2872 :SHA256
   "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/index/relocate.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/index/relocate.lisp")
   :BYTES 2383 :SHA256
   "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/index/types.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/index/types.lisp")
   :BYTES 2434 :SHA256
   "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/index/validation.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/index/validation.lisp")
   :BYTES 3930 :SHA256
   "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/index/write.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/index/write.lisp")
   :BYTES 4784 :SHA256
   "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28")
  (:PATH "raw/cbor-string-write-mutations-20261011/baseline/src/io/flush.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/io/flush.lisp")
   :BYTES 1569 :SHA256
   "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/io/lifecycle.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/io/lifecycle.lisp")
   :BYTES 4536 :SHA256
   "baa1f763fe0f394a14d381b753dcb1be1e90eb03eaff5d6469465b5d4eca015f")
  (:PATH "raw/cbor-string-write-mutations-20261011/baseline/src/io/native.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/io/native.lisp")
   :BYTES 5026 :SHA256
   "b8cf3ce1ff7b4fa9def8a602ab768c0e9a321f8d6cdce6e5b2b7ded2fe3d97dd")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/io/package.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/io/package.lisp")
   :BYTES 592 :SHA256
   "118eba04ab2aa87a2d86e0b0269dbeacaa485457acebbc12c57317ae465a89c0")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/io/transfer.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/io/transfer.lisp")
   :BYTES 5051 :SHA256
   "3748328cf85e1c007900a63bdd0f159f38a8d7cd3577c92c56fc68692b9b7bcf")
  (:PATH "raw/cbor-string-write-mutations-20261011/baseline/src/io/types.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/io/types.lisp")
   :BYTES 4143 :SHA256
   "50c7eeea91af232fca7103ce5a25535958d73836f01cb45a20c7120b88b1336b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/mvcc/package.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/mvcc/package.lisp")
   :BYTES 833 :SHA256
   "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/mvcc/snapshots-core.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/mvcc/snapshots-core.lisp")
   :BYTES 7622 :SHA256
   "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/mvcc/snapshots-csn.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/mvcc/snapshots-csn.lisp")
   :BYTES 2725 :SHA256
   "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/mvcc/snapshots-lifecycle.lisp"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/mvcc/snapshots-lifecycle.lisp")
   :BYTES 6609 :SHA256
   "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/mvcc/snapshots-read.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/mvcc/snapshots-read.lisp")
   :BYTES 6651 :SHA256
   "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/mvcc/snapshots-register.lisp"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/mvcc/snapshots-register.lisp")
   :BYTES 6654 :SHA256
   "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/mvcc/snapshots-types.lisp"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/mvcc/snapshots-types.lisp")
   :BYTES 3817 :SHA256
   "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/mvcc/types.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/mvcc/types.lisp")
   :BYTES 471 :SHA256
   "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50")
  (:PATH "raw/cbor-string-write-mutations-20261011/baseline/src/package.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH "raw/cbor-string-write-mutations-20261011/baseline/src/read/core.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/read/core.lisp")
   :BYTES 3846 :SHA256
   "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/read/package.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/read/package.lisp")
   :BYTES 831 :SHA256
   "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df")
  (:PATH "raw/cbor-string-write-mutations-20261011/baseline/src/read/task.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/read/task.lisp")
   :BYTES 5073 :SHA256
   "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/read/types.lisp"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/read/types.lisp")
   :BYTES 2358 :SHA256
   "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/recovery/decisions-build.lisp"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/recovery/decisions-build.lisp")
   :BYTES 11857 :SHA256
   "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/recovery/decisions-package.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/recovery/decisions-package.lisp")
   :BYTES 818 :SHA256
   "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/recovery/decisions-query.lisp"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/recovery/decisions-query.lisp")
   :BYTES 4525 :SHA256
   "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/recovery/decisions-radix.lisp"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/recovery/decisions-radix.lisp")
   :BYTES 11061 :SHA256
   "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/recovery/decisions-sort.lisp"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/recovery/decisions-sort.lisp")
   :BYTES 7654 :SHA256
   "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/recovery/decisions-types.lisp"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/recovery/decisions-types.lisp")
   :BYTES 2056 :SHA256
   "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/recovery/inventory-build.lisp"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/recovery/inventory-build.lisp")
   :BYTES 9592 :SHA256
   "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/recovery/inventory-query.lisp"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/recovery/inventory-query.lisp")
   :BYTES 2100 :SHA256
   "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/recovery/inventory-types.lisp"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/recovery/inventory-types.lisp")
   :BYTES 2392 :SHA256
   "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/recovery/manifest-build.lisp"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/recovery/manifest-build.lisp")
   :BYTES 10251 :SHA256
   "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/recovery/manifest-decode.lisp"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/recovery/manifest-decode.lisp")
   :BYTES 6160 :SHA256
   "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/recovery/manifest-fold.lisp"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/recovery/manifest-fold.lisp")
   :BYTES 7068 :SHA256
   "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/recovery/manifest-package.lisp"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/recovery/manifest-package.lisp")
   :BYTES 1372 :SHA256
   "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/recovery/manifest-query.lisp"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/recovery/manifest-query.lisp")
   :BYTES 3582 :SHA256
   "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/recovery/manifest-types.lisp"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/recovery/manifest-types.lisp")
   :BYTES 3345 :SHA256
   "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/recovery/package.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/recovery/package.lisp")
   :BYTES 927 :SHA256
   "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/recovery/scan.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/recovery/scan.lisp")
   :BYTES 12829 :SHA256
   "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/series/events.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/series/events.lisp")
   :BYTES 9566 :SHA256
   "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/series/io-events.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/series/io-events.lisp")
   :BYTES 5385 :SHA256
   "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/series/ownership.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/series/ownership.lisp")
   :BYTES 8810 :SHA256
   "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/series/package.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/series/package.lisp")
   :BYTES 1392 :SHA256
   "7433162105df63d324141167e6dcf6bfee74611aa1cf7291cc6c92f41f3c7408")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/series/publication.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/series/publication.lisp")
   :BYTES 6094 :SHA256
   "288cb3fa41fad76a0e6919dfa0b2fce2beef15f5880129393bee35bc8795c762")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/series/query.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/series/query.lisp")
   :BYTES 3600 :SHA256
   "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/series/retirement.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/series/retirement.lisp")
   :BYTES 4634 :SHA256
   "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/series/types.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/series/types.lisp")
   :BYTES 3316 :SHA256
   "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/storage/compaction-scan.lisp"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/storage/compaction-scan.lisp")
   :BYTES 5510 :SHA256
   "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/storage/control-payload.lisp"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/storage/control-payload.lisp")
   :BYTES 6273 :SHA256
   "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/storage/formats.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/storage/formats.lisp")
   :BYTES 3841 :SHA256
   "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/storage/log-header.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/storage/log-header.lisp")
   :BYTES 3947 :SHA256
   "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/storage/package.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/storage/package.lisp")
   :BYTES 1079 :SHA256
   "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/storage/payload-record.lisp"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/storage/payload-record.lisp")
   :BYTES 3641 :SHA256
   "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/storage/payload-write.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/storage/payload-write.lisp")
   :BYTES 5239 :SHA256
   "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/storage/segment-header.lisp"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/storage/segment-header.lisp")
   :BYTES 5517 :SHA256
   "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/wal/builder.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/wal/builder.lisp")
   :BYTES 8445 :SHA256
   "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0")
  (:PATH "raw/cbor-string-write-mutations-20261011/baseline/src/wal/csn.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/wal/csn.lisp")
   :BYTES 9577 :SHA256
   "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/wal/executor.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/wal/executor.lisp")
   :BYTES 6023 :SHA256
   "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8")
  (:PATH "raw/cbor-string-write-mutations-20261011/baseline/src/wal/group.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/wal/group.lisp")
   :BYTES 6305 :SHA256
   "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/src/wal/package.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/wal/package.lisp")
   :BYTES 1774 :SHA256
   "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89")
  (:PATH "raw/cbor-string-write-mutations-20261011/baseline/src/wal/types.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/src/wal/types.lisp")
   :BYTES 5420 :SHA256
   "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e")
  (:PATH "raw/cbor-string-write-mutations-20261011/baseline/test.log" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/test.log")
   :BYTES 48643 :SHA256
   "b94224ea776604fc582ba992dc5e8b598b8c38b3fee3b6d6d4181ed76bd14b50")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-header.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-header.lisp")
   :BYTES 10773 :SHA256
   "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-minimal-edges.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-minimal-edges.lisp")
   :BYTES 1613 :SHA256
   "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-minimal-scan-support.lisp"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-minimal-scan-support.lisp")
   :BYTES 8363 :SHA256
   "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-minimal-scan-threads.lisp"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-minimal-scan-threads.lisp")
   :BYTES 4547 :SHA256
   "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-minimal-scan.lisp"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-minimal-scan.lisp")
   :BYTES 19217 :SHA256
   "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-minimal-support.lisp"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-minimal-support.lisp")
   :BYTES 8620 :SHA256
   "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-minimal-threads.lisp"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-minimal-threads.lisp")
   :BYTES 3799 :SHA256
   "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-minimal.lisp"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-minimal.lisp")
   :BYTES 12604 :SHA256
   "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-string-write-support.lisp"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-string-write-support.lisp")
   :BYTES 6829 :SHA256
   "611ec1d825855d9df27988821ee45f0ecf81fbd3128a38df6ee5c727551cd9f2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-string-write-threads.lisp"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-string-write-threads.lisp")
   :BYTES 3311 :SHA256
   "d45b4dda658a96b9af9051b152df2b17859aecdbb9131505d1a2689b27ffb88a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-string-write.lisp"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-string-write.lisp")
   :BYTES 15883 :SHA256
   "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-structure-support.lisp"
   :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-structure-threads.lisp"
   :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-structure-threads.lisp")
   :BYTES 4305 :SHA256
   "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-structure.lisp"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-structure.lisp")
   :BYTES 22968 :SHA256
   "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-support.lisp"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-threads.lisp"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-threads.lisp")
   :BYTES 3683 :SHA256
   "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-write-roundtrip.lisp"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-write-roundtrip.lisp")
   :BYTES 901 :SHA256
   "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-write-support.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-write-support.lisp")
   :BYTES 4768 :SHA256
   "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-write-threads.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-write-threads.lisp")
   :BYTES 3813 :SHA256
   "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-write.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/codec/cbor-write.lisp")
   :BYTES 9822 :SHA256
   "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/codec/support.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/codec/support.lisp")
   :BYTES 5807 :SHA256
   "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/codec/threads.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/codec/threads.lisp")
   :BYTES 3111 :SHA256
   "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/codec/utf8.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/codec/utf8.lisp")
   :BYTES 12892 :SHA256
   "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/csn/registry.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/csn/registry.lisp")
   :BYTES 19411 :SHA256
   "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/csn/support.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/csn/support.lisp")
   :BYTES 11407 :SHA256
   "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/csn/threads.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/csn/threads.lisp")
   :BYTES 10525 :SHA256
   "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/execution/handoff.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/execution/handoff.lisp")
   :BYTES 33278 :SHA256
   "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/execution/queue.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/execution/queue.lisp")
   :BYTES 12894 :SHA256
   "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/execution/ready-recycle.lisp"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/execution/ready-recycle.lisp")
   :BYTES 30075 :SHA256
   "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/execution/ready.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/execution/ready.lisp")
   :BYTES 33555 :SHA256
   "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/execution/support.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/execution/support.lisp")
   :BYTES 4469 :SHA256
   "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/execution/threads.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/execution/threads.lisp")
   :BYTES 14622 :SHA256
   "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/execution/worker.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/execution/worker.lisp")
   :BYTES 59783 :SHA256
   "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/foundation/batch.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/foundation/batch.lisp")
   :BYTES 5185 :SHA256
   "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/foundation/binary.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/foundation/binary.lisp")
   :BYTES 3721 :SHA256
   "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/foundation/record.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/foundation/record.lisp")
   :BYTES 14950 :SHA256
   "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/foundation/support.lisp"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/index/primary-support.lisp"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/index/primary-support.lisp")
   :BYTES 13938 :SHA256
   "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/index/primary-threads.lisp"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/index/primary-threads.lisp")
   :BYTES 13744 :SHA256
   "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/index/primary.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/index/primary.lisp")
   :BYTES 30166 :SHA256
   "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/index/rebuild.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/index/rebuild.lisp")
   :BYTES 32112 :SHA256
   "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/index/slot-support.lisp"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/index/slot-support.lisp")
   :BYTES 12800 :SHA256
   "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/index/slot-threads.lisp"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/index/slot-threads.lisp")
   :BYTES 11698 :SHA256
   "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/index/slots.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/index/slots.lisp")
   :BYTES 26420 :SHA256
   "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/io/native.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/io/native.lisp")
   :BYTES 6207 :SHA256
   "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/io/support.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/io/support.lisp")
   :BYTES 2951 :SHA256
   "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/io/transfer.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/io/transfer.lisp")
   :BYTES 11847 :SHA256
   "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/lint-fixtures/bad.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/lint-fixtures/bad.lisp")
   :BYTES 1587 :SHA256
   "ac8912ce6cc1101f2ebc305a50c0565879547b527d7ca0aeac900ee06bf26652")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/lint-fixtures/good.lisp"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/lint-fixtures/good.lisp")
   :BYTES 671 :SHA256
   "05ce84f8fd12d9af48252601bcc92d6d60335b53f39b01a9fe2697c4bdaa8cee")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/lint-fixtures/keyword-barrier.lisp"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/lint-fixtures/keyword-barrier.lisp")
   :BYTES 199 :SHA256
   "e26dab117e9526ace35bb45b92f977065d33fcc4404c40fd4fc3c77749689a96")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/lint-fixtures/qualified-reader.lisp"
   :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/lint-fixtures/qualified-reader.lisp")
   :BYTES 152 :SHA256
   "835229bdc1a0ed0c08511cd6121e1f1bc4284da2cfba951b72cd1a74a6040d35")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/mvcc/capture.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/mvcc/capture.lisp")
   :BYTES 16356 :SHA256
   "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/mvcc/lifecycle.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/mvcc/lifecycle.lisp")
   :BYTES 23964 :SHA256
   "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/mvcc/support.lisp"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/mvcc/support.lisp")
   :BYTES 5931 :SHA256
   "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/recovery/corruption.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/recovery/corruption.lisp")
   :BYTES 7106 :SHA256
   "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/recovery/decisions-audit.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/recovery/decisions-audit.lisp")
   :BYTES 14971 :SHA256
   "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/recovery/decisions-radix.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/recovery/decisions-radix.lisp")
   :BYTES 27851 :SHA256
   "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/recovery/decisions-support.lisp"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/recovery/decisions-support.lisp")
   :BYTES 6797 :SHA256
   "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/recovery/decisions.lisp"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/recovery/decisions.lisp")
   :BYTES 19149 :SHA256
   "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/recovery/inventory-support.lisp"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/recovery/inventory-support.lisp")
   :BYTES 8083 :SHA256
   "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/recovery/inventory.lisp"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/recovery/inventory.lisp")
   :BYTES 14479 :SHA256
   "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/recovery/manifest-audit.lisp"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/recovery/manifest-audit.lisp")
   :BYTES 17670 :SHA256
   "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/recovery/manifest-support.lisp"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/recovery/manifest-support.lisp")
   :BYTES 9769 :SHA256
   "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/recovery/manifest.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/recovery/manifest.lisp")
   :BYTES 13799 :SHA256
   "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/recovery/scan.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/recovery/scan.lisp")
   :BYTES 16966 :SHA256
   "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/recovery/support.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/recovery/support.lisp")
   :BYTES 5957 :SHA256
   "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/series/boundaries.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/series/boundaries.lisp")
   :BYTES 5802 :SHA256
   "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/series/controller.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/series/controller.lisp")
   :BYTES 60484 :SHA256
   "4bea80eb231575f48b208ddb57af6a11706481e0ec755b084f6cd4b6fd0481a1")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/series/support.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/series/support.lisp")
   :BYTES 16885 :SHA256
   "8821ae9e002941eff8ea3ae7dbfc727cb6874b68d2d1ef85af668eb2d34a0c0c")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/series/threads.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/series/threads.lisp")
   :BYTES 19694 :SHA256
   "bbea64d207d14698b39ab0f8ded03db11bab09955d3f66705c23d69c09aefc8e")
  (:PATH "raw/cbor-string-write-mutations-20261011/baseline/tests/smoke.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/smoke.lisp")
   :BYTES 735 :SHA256
   "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/storage/compaction-scan.lisp"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/storage/compaction-scan.lisp")
   :BYTES 16196 :SHA256
   "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/storage/control-payload.lisp"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/storage/control-payload.lisp")
   :BYTES 12651 :SHA256
   "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/storage/log-header.lisp"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/storage/log-header.lisp")
   :BYTES 11969 :SHA256
   "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/storage/segment-header.lisp"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/storage/segment-header.lisp")
   :BYTES 4149 :SHA256
   "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/storage/support.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/storage/support.lisp")
   :BYTES 4029 :SHA256
   "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/wal/builder.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/wal/builder.lisp")
   :BYTES 4000 :SHA256
   "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/wal/csn-threads.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/wal/csn-threads.lisp")
   :BYTES 12114 :SHA256
   "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c")
  (:PATH "raw/cbor-string-write-mutations-20261011/baseline/tests/wal/csn.lisp"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/wal/csn.lisp")
   :BYTES 34661 :SHA256
   "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/wal/fault.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/wal/fault.lisp")
   :BYTES 7614 :SHA256
   "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/wal/group.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/wal/group.lisp")
   :BYTES 5524 :SHA256
   "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/wal/native.lisp"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/wal/native.lisp")
   :BYTES 2567 :SHA256
   "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tests/wal/support.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tests/wal/support.lisp")
   :BYTES 1951 :SHA256
   "90a47539e5e2898c0a08059207f30bb5551e7ca8fc166f8f6ce7b95afa757295")
  (:PATH "raw/cbor-string-write-mutations-20261011/baseline/tools/build.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH
   "raw/cbor-string-write-mutations-20261011/baseline/tools/cbor-string-write-isolated-build.lisp"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/baseline/tools/cbor-string-write-isolated-build.lisp")
   :BYTES 492 :SHA256
   "770995c220ff9c222d1d19ef0d94bfc9dfb99b6cd97025f790986afdadee00a6")
  (:PATH "raw/cbor-string-write-mutations-20261011/report.lisp" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/report.lisp")
   :BYTES 49472 :SHA256
   "83c7bb49def94edd76fc46fd4e35de2b467ad791406bf94b35c306e3ea358154")
  (:PATH "raw/setup/cbor-string-write-static-reader.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-static-reader.lisp")
   :BYTES 3009 :SHA256
   "55e86cd16e8a932f5e229f3278799d086c6115a76f6805321d8e738fdbad7413")
  (:PATH "raw/setup/cbor-string-write-static-reader.log" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-static-reader.log")
   :BYTES 572 :SHA256
   "b8ff789d7f4ece90a460ba890e24587fa2d397e8cbb912b375dc372907afb9a8"))
 :LIMITS
 (:SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :FASL-EXCLUDED-FROM-PUBLISHED-MUTATION-TREES
  :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
