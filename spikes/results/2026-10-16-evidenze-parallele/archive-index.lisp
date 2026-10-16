(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL #A((5) BASE-CHAR . "run-0") :RECORD-PATH
   #A((27) BASE-CHAR . "processes/run-0/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((25) BASE-CHAR . "tools/check-evidence.lisp")
    #A((11) BASE-CHAR . "--self-test"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((5) BASE-CHAR . "run-1") :RECORD-PATH
   #A((27) BASE-CHAR . "processes/run-1/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((25) BASE-CHAR . "tools/check-evidence.lisp")
    #A((11) BASE-CHAR . "--self-test"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((5) BASE-CHAR . "run-2") :RECORD-PATH
   #A((27) BASE-CHAR . "processes/run-2/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((50) BASE-CHAR . "spikes/out/evidence-parallel-20261016/compare.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((5) BASE-CHAR . "run-3") :RECORD-PATH
   #A((27) BASE-CHAR . "processes/run-3/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "make") #A((10) BASE-CHAR . "check-core")) :STATUS
   :FAILED :EXIT-CODE 2 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((5) BASE-CHAR . "run-4") :RECORD-PATH
   #A((27) BASE-CHAR . "processes/run-4/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "make") #A((10) BASE-CHAR . "check-core")) :STATUS
   :FAILED :EXIT-CODE 143 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((5) BASE-CHAR . "run-5") :RECORD-PATH
   #A((27) BASE-CHAR . "processes/run-5/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "make") #A((10) BASE-CHAR . "check-core")) :STATUS
   :FAILED :EXIT-CODE 143 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((5) BASE-CHAR . "run-6") :RECORD-PATH
   #A((27) BASE-CHAR . "processes/run-6/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "make") #A((10) BASE-CHAR . "check-core")) :STATUS
   :FAILED :EXIT-CODE 2 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((5) BASE-CHAR . "run-7") :RECORD-PATH
   #A((27) BASE-CHAR . "processes/run-7/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((60) BASE-CHAR
       . "spikes/out/evidence-parallel-20261016/propagation-probe.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((5) BASE-CHAR . "run-8") :RECORD-PATH
   #A((27) BASE-CHAR . "processes/run-8/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "make") #A((10) BASE-CHAR . "check-core")) :STATUS :OK
   :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((5) BASE-CHAR . "run-9") :RECORD-PATH
   #A((27) BASE-CHAR . "processes/run-9/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((56) BASE-CHAR
       . "spikes/out/evidence-parallel-20261016/cleanup-probe.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((6) BASE-CHAR . "run-10") :RECORD-PATH
   #A((28) BASE-CHAR . "processes/run-10/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "make") #A((8) BASE-CHAR . "evidence")) :STATUS :OK
   :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((6) BASE-CHAR . "run-11") :RECORD-PATH
   #A((28) BASE-CHAR . "processes/run-11/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "make") #A((4) BASE-CHAR . "test")
    #A((4) BASE-CHAR . "lint") #A((5) BASE-CHAR . "trace")
    #A((5) BASE-CHAR . "links"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((6) BASE-CHAR . "run-12") :RECORD-PATH
   #A((28) BASE-CHAR . "processes/run-12/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((50) BASE-CHAR . "spikes/out/evidence-parallel-20261016/results.lisp")
    #A((49) BASE-CHAR . "spikes/out/4001154506-command-88936-0/report.lisp")
    #A((49) BASE-CHAR . "spikes/out/4001154818-command-94920-0/report.lisp")
    #A((49) BASE-CHAR . "spikes/out/4001154921-command-97823-0/report.lisp")
    #A((49) BASE-CHAR . "spikes/out/4001155302-command-11195-0/report.lisp")
    #A((49) BASE-CHAR . "spikes/out/4001155836-command-20347-0/report.lisp")
    #A((49) BASE-CHAR . "spikes/out/4001156028-command-24549-0/report.lisp")
    #A((49) BASE-CHAR . "spikes/out/4001156102-command-25998-0/report.lisp")
    #A((49) BASE-CHAR . "spikes/out/4001156414-command-35966-0/report.lisp")
    #A((49) BASE-CHAR . "spikes/out/4001156462-command-39221-0/report.lisp")
    #A((49) BASE-CHAR . "spikes/out/4001157163-command-78205-0/report.lisp")
    #A((49) BASE-CHAR . "spikes/out/4001157172-command-78590-0/report.lisp")
    #A((49) BASE-CHAR . "spikes/out/4001157172-command-78589-0/report.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/evidence-parallel-20261016/manifest.lisp")
   :BYTES 10635 :SHA256
   "fb1cf4f9cf60f94f089217170a31b6b0cd18f25e27eadbfdb22f2d20ffe7a2cb")
  (:PATH "collection-source.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")
  (:PATH #A((34) BASE-CHAR . "processes/run-0/conservazione.lisp") :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001154506-command-88936-0/conservazione.lisp")
   :BYTES 1181 :SHA256
   "e9681a1b0f89a3a6e09c1b0020541207c6a50733f3c625e7965f3d3a581a455f")
  (:PATH #A((27) BASE-CHAR . "processes/run-0/report.lisp") :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001154506-command-88936-0/report.lisp")
   :BYTES 218067 :SHA256
   "65c9819afba281268c605451a03847604c5ca63033b7de588f7828a72030e953")
  (:PATH #A((34) BASE-CHAR . "processes/run-1/conservazione.lisp") :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001154818-command-94920-0/conservazione.lisp")
   :BYTES 1181 :SHA256
   "71231d313895d9d532b9eed3347dd21d75f842a93d05811e32044322de97bb87")
  (:PATH #A((27) BASE-CHAR . "processes/run-1/report.lisp") :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001154818-command-94920-0/report.lisp")
   :BYTES 218223 :SHA256
   "4c347ef08143cc5da5fde70302d60809cf279117b7cf02602aa0b8fbf110694f")
  (:PATH #A((35) BASE-CHAR . "processes/run-10/conservazione.lisp") :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001157172-command-78590-0/conservazione.lisp")
   :BYTES 1181 :SHA256
   "02032542d634f9e56fa559dc99b80ad49617c182e23c6c1a2359acace3b2b746")
  (:PATH #A((28) BASE-CHAR . "processes/run-10/report.lisp") :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001157172-command-78590-0/report.lisp")
   :BYTES 219656 :SHA256
   "221c16ebce61c5ea00a1b501ac532e5ccfa608de479089187d3f9548c87e1d7f")
  (:PATH #A((35) BASE-CHAR . "processes/run-11/conservazione.lisp") :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001157172-command-78589-0/conservazione.lisp")
   :BYTES 1772 :SHA256
   "ad026a254f444584fc84f35cdafb797f30c4a1392b4662fb5dc92a6df6f4a928")
  (:PATH #A((28) BASE-CHAR . "processes/run-11/report.lisp") :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001157172-command-78589-0/report.lisp")
   :BYTES 317 :SHA256
   "9f306292b673cdc6e73dc63e719417e831e968cd9ef3df4a76d83377fe59f397")
  (:PATH #A((31) BASE-CHAR . "processes/run-11/report.lisp.gz") :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001157172-command-78589-0/report.lisp.gz")
   :BYTES 213248 :SHA256
   "245ca602a10d2dfb09d68bed1921d8fedc8cdf4e0885d88b59b059ce9a765afa")
  (:PATH #A((35) BASE-CHAR . "processes/run-12/conservazione.lisp") :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001157380-command-89822-0/conservazione.lisp")
   :BYTES 1181 :SHA256
   "30b0a3e49ed24cbff9de2b54e342b6d145cb0fee4367e6ccf0e2327b33ff81f7")
  (:PATH #A((28) BASE-CHAR . "processes/run-12/report.lisp") :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001157380-command-89822-0/report.lisp")
   :BYTES 246093 :SHA256
   "45c7e82063e4781dbad49a68b89e6b2dbd2c4e47c2335aef194cf4690fd7d6a4")
  (:PATH #A((34) BASE-CHAR . "processes/run-2/conservazione.lisp") :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001154921-command-97823-0/conservazione.lisp")
   :BYTES 1181 :SHA256
   "48f1bad5330a986e613bafcb280b6d3efade77fd20148476b35a4cc63e82b110")
  (:PATH #A((27) BASE-CHAR . "processes/run-2/report.lisp") :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001154921-command-97823-0/report.lisp")
   :BYTES 216679 :SHA256
   "9bc146c666b5b796c05f956a7c5401a02459e6f100cbd90abc04406db25577eb")
  (:PATH #A((34) BASE-CHAR . "processes/run-3/conservazione.lisp") :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001155302-command-11195-0/conservazione.lisp")
   :BYTES 1771 :SHA256
   "ecbd05d21df293765189eb41b79a77654f9d46fab2ce7b28dd6849d7c2442277")
  (:PATH #A((27) BASE-CHAR . "processes/run-3/report.lisp") :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001155302-command-11195-0/report.lisp")
   :BYTES 317 :SHA256
   "c5d57f9079ec73bb60b810d9949dc859bb0440feb8fbe3cef2053e2806990d54")
  (:PATH #A((30) BASE-CHAR . "processes/run-3/report.lisp.gz") :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001155302-command-11195-0/report.lisp.gz")
   :BYTES 208464 :SHA256
   "be8baa71010afbe18591133a68e08bfca0d2dadb55d7f7f9b5da501f2d3805bd")
  (:PATH #A((34) BASE-CHAR . "processes/run-4/conservazione.lisp") :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001155836-command-20347-0/conservazione.lisp")
   :BYTES 1772 :SHA256
   "878e0ca088e51d5c4c254edd35233da0f2174418725b2deabdf045897fe0506c")
  (:PATH #A((27) BASE-CHAR . "processes/run-4/report.lisp") :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001155836-command-20347-0/report.lisp")
   :BYTES 317 :SHA256
   "1dd930d95d9e48a91a9542940f018a3830675d09b605425beecf41aa27f8f448")
  (:PATH #A((30) BASE-CHAR . "processes/run-4/report.lisp.gz") :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001155836-command-20347-0/report.lisp.gz")
   :BYTES 202564 :SHA256
   "6b1a096b5f3824bd5005f08ec45f97a319a3a1be4a907eff800cfd281bcf20c7")
  (:PATH #A((34) BASE-CHAR . "processes/run-5/conservazione.lisp") :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001156028-command-24549-0/conservazione.lisp")
   :BYTES 1772 :SHA256
   "95f0b1becffbe54c9e56472c1709516688f39806ea33487690e2e61ae46817b5")
  (:PATH #A((27) BASE-CHAR . "processes/run-5/report.lisp") :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001156028-command-24549-0/report.lisp")
   :BYTES 317 :SHA256
   "37860124d4693a7f6ff479c8892e797132c98125377cbd02ac97a24625c31eb0")
  (:PATH #A((30) BASE-CHAR . "processes/run-5/report.lisp.gz") :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001156028-command-24549-0/report.lisp.gz")
   :BYTES 193644 :SHA256
   "10df463d912756315c62c9c9fe6976c93376cded9c10381a55aea8e33c12dee1")
  (:PATH #A((34) BASE-CHAR . "processes/run-6/conservazione.lisp") :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001156102-command-25998-0/conservazione.lisp")
   :BYTES 1772 :SHA256
   "7ce7af7d5b343e17f957b7f0d121676f2dd46c1846320bd6608cfc9b742ee73d")
  (:PATH #A((27) BASE-CHAR . "processes/run-6/report.lisp") :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001156102-command-25998-0/report.lisp")
   :BYTES 317 :SHA256
   "e472e27b17eb3777521e15ea591d467383f40de052427902e489c9cca0bbba28")
  (:PATH #A((30) BASE-CHAR . "processes/run-6/report.lisp.gz") :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001156102-command-25998-0/report.lisp.gz")
   :BYTES 218002 :SHA256
   "f343493b446a30df2aefdbff9eb202554fc3f7eca50665f49e9a7a1f06859d75")
  (:PATH #A((34) BASE-CHAR . "processes/run-7/conservazione.lisp") :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001156414-command-35966-0/conservazione.lisp")
   :BYTES 1181 :SHA256
   "3c873239fe6eca042b376fdfe7cfb9f4ec66bf50db195712ccac0b9178d20ba4")
  (:PATH #A((27) BASE-CHAR . "processes/run-7/report.lisp") :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001156414-command-35966-0/report.lisp")
   :BYTES 218958 :SHA256
   "d8c62496710693bb7c302a75bdcfcec815915c0af0e0aa0df77497a31f24ec23")
  (:PATH #A((34) BASE-CHAR . "processes/run-8/conservazione.lisp") :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001156462-command-39221-0/conservazione.lisp")
   :BYTES 1772 :SHA256
   "ff0dcf0427998f8f014bf50609760c731037301617c79ac9c8d0a08ca66633db")
  (:PATH #A((27) BASE-CHAR . "processes/run-8/report.lisp") :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001156462-command-39221-0/report.lisp")
   :BYTES 317 :SHA256
   "3d4b2c505f755e764c8b070701ea6f6c0eadc0814ab6ad15add73da5c3fb45d3")
  (:PATH #A((30) BASE-CHAR . "processes/run-8/report.lisp.gz") :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001156462-command-39221-0/report.lisp.gz")
   :BYTES 221702 :SHA256
   "1279ed67060600be620c9332e3c445473abe8b788e4359d6847ac6603a7a04fc")
  (:PATH #A((34) BASE-CHAR . "processes/run-9/conservazione.lisp") :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001157163-command-78205-0/conservazione.lisp")
   :BYTES 1181 :SHA256
   "bc52ce2eab1f89a7391020cd087466b01d517760a4b5ea03a2a6a2486ac54e63")
  (:PATH #A((27) BASE-CHAR . "processes/run-9/report.lisp") :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001157163-command-78205-0/report.lisp")
   :BYTES 220872 :SHA256
   "181bf0c6afd5e75751eb5b0f0b0d0f3ea680567d4aa28a42eb2539d825abbf8c")
  (:PATH "raw.tar.gz" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/evidence-parallel-20261016/raw.tar.gz")
   :BYTES 965369 :SHA256
   "e3abd83ce1286da4dec89f5446daf0a9e3a0429cf51d7c637290c851988ca4a9")
  (:PATH "tools/cleanup-probe.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/evidence-parallel-20261016/cleanup-probe.lisp")
   :BYTES 2378 :SHA256
   "533b65ec3549b2f523df42ca247510ae0110074923ab0393be16e91d5705fb59")
  (:PATH "tools/compare.lisp" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/evidence-parallel-20261016/compare.lisp")
   :BYTES 1266 :SHA256
   "8870d347b1911f506a9cf791b8cd350cc0d557afe42f4e608dfcf3182002de3c")
  (:PATH "tools/final-checks.lisp" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/evidence-parallel-20261016/final-checks.lisp")
   :BYTES 1109 :SHA256
   "4404688579845fe7b9aa922c3f70bc8302e22eb4fdda3c8a22204cc4b17c2246")
  (:PATH "tools/propagation-probe.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/evidence-parallel-20261016/propagation-probe.lisp")
   :BYTES 682 :SHA256
   "706d7b57bd1b3f1706460cb53fdda7388fdd9b94dbe376a613bc09f2e1e28eac")
  (:PATH "tools/publish.lisp" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/evidence-parallel-20261016/publish.lisp")
   :BYTES 3681 :SHA256
   "93db6759eb43117a03b753e15fc51660ca12d7ee916bd043a4cb399a62bef696")
  (:PATH "tools/results-report.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/evidence-parallel-20261016/results-report.lisp")
   :BYTES 25013 :SHA256
   "2e60e995a8a061a66f5fab564e4f85d663272ced64e8d569af2fa9577bfc6f83")
  (:PATH "tools/results.lisp" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/evidence-parallel-20261016/results.lisp")
   :BYTES 2658 :SHA256
   "7766beef75a3c8660ea6a8e67f7830e6403d7eabfb3e36760417ce3584f79c4c"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
