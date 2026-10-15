(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL #A((12) BASE-CHAR . "initial-self") :RECORD-PATH
   #A((34) BASE-CHAR . "processes/initial-self/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "tools/collect-command-archive.lisp")
    #A((11) BASE-CHAR . "--self-test")
    #A((64) BASE-CHAR
       . "spikes/out/command-archive-collector-20261015/self-test-initial/"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((12) BASE-CHAR . "initial-full") :RECORD-PATH
   #A((34) BASE-CHAR . "processes/initial-full/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "make") #A((10) BASE-CHAR . "check-core")) :STATUS
   :FAILED :EXIT-CODE 2 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((10) BASE-CHAR . "fixed-self") :RECORD-PATH
   #A((32) BASE-CHAR . "processes/fixed-self/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "tools/collect-command-archive.lisp")
    #A((11) BASE-CHAR . "--self-test")
    #A((62) BASE-CHAR
       . "spikes/out/command-archive-collector-20261015/self-test-fixed/"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((10) BASE-CHAR . "fixed-full") :RECORD-PATH
   #A((32) BASE-CHAR . "processes/fixed-full/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "make") #A((10) BASE-CHAR . "check-core")) :STATUS :OK
   :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((14) BASE-CHAR . "reader-initial") :RECORD-PATH
   #A((36) BASE-CHAR . "processes/reader-initial/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((146) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/runtime-reading.lisp")
    #A((122) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078088-command-58422-0/report.lisp")
    #A((122) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078089-command-58445-0/report.lisp")
    #A((135) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/")
    #A((40) BASE-CHAR . "6d47d2dfcee66de4f2abe64c8b63ef568ba6ed2c")
    #A((40) BASE-CHAR . "d2eb1bd8a62b0fd98ec023243b2a768c19988dc7")
    #A((40) BASE-CHAR . "49da390b7e170acc9ffdafa78285f215aec75f44")
    #A((8) BASE-CHAR . "--failed")
    #A((122) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001077810-command-50855-0/report.lisp")
    #A((137) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/")
    #A((8) BASE-CHAR . "--failed")
    #A((122) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001077811-command-50873-0/report.lisp")
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((12) BASE-CHAR . "reader-fixed") :RECORD-PATH
   #A((34) BASE-CHAR . "processes/reader-fixed/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((149) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/runtime-reading-v2.lisp")
    #A((122) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078088-command-58422-0/report.lisp")
    #A((122) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078089-command-58445-0/report.lisp")
    #A((135) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/")
    #A((40) BASE-CHAR . "6d47d2dfcee66de4f2abe64c8b63ef568ba6ed2c")
    #A((40) BASE-CHAR . "d2eb1bd8a62b0fd98ec023243b2a768c19988dc7")
    #A((40) BASE-CHAR . "49da390b7e170acc9ffdafa78285f215aec75f44")
    #A((8) BASE-CHAR . "--failed")
    #A((122) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001077810-command-50855-0/report.lisp")
    #A((137) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/")
    #A((8) BASE-CHAR . "--failed")
    #A((122) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001077811-command-50873-0/report.lisp")
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/collection/main-manifest.lisp")
   :BYTES 139664 :SHA256
   "b368791891556cad16237dce3f525d008e3fa4a2666e6c0f265870136f6f0896")
  (:PATH "collection-source.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")
  (:PATH #A((39) BASE-CHAR . "processes/fixed-full/conservazione.lisp") :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078089-command-58445-0/conservazione.lisp")
   :BYTES 1772 :SHA256
   "7a83a47de8fd9da73d3002ff74497585b058c89dffb379757c62bf15ee58f51d")
  (:PATH #A((32) BASE-CHAR . "processes/fixed-full/report.lisp") :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078089-command-58445-0/report.lisp")
   :BYTES 317 :SHA256
   "bb419d34dccad1e84c0c79b2fdbaa9691ab1728518b9318df259e80338714945")
  (:PATH "processes/fixed-full/report.lisp.gz" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078089-command-58445-0/report.lisp.gz")
   :BYTES 190504 :SHA256
   "559f6c96926ebe07e4cf1be3cc5b8a38698d69dc3c6ed6ba5dafcac5d80037ca")
  (:PATH #A((39) BASE-CHAR . "processes/fixed-self/conservazione.lisp") :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078088-command-58422-0/conservazione.lisp")
   :BYTES 1181 :SHA256
   "a6e21ab4cf6778fa4ec8bc4674935dc917415a6d321cc9578cbc53a27eee62b2")
  (:PATH #A((32) BASE-CHAR . "processes/fixed-self/report.lisp") :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078088-command-58422-0/report.lisp")
   :BYTES 228434 :SHA256
   "bda5c3e13e3cff52a5b902e5dfb4ef60bea3f9c79b320f60887bbd2759c67fc0")
  (:PATH #A((41) BASE-CHAR . "processes/initial-full/conservazione.lisp")
   :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001077811-command-50873-0/conservazione.lisp")
   :BYTES 1771 :SHA256
   "5fa7540ef1a15c3e5b634bbb9609b350e6df85207760ecbde6b3c46d28516059")
  (:PATH #A((34) BASE-CHAR . "processes/initial-full/report.lisp") :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001077811-command-50873-0/report.lisp")
   :BYTES 317 :SHA256
   "e20127e6307324f128dc57faf8e385c5f31f1c23641d7cc34394f0532906ce5c")
  (:PATH "processes/initial-full/report.lisp.gz" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001077811-command-50873-0/report.lisp.gz")
   :BYTES 187848 :SHA256
   "de5d392580f8cf792c880433496541a6724dbbde09fffadd90bede7871f5fcf5")
  (:PATH #A((41) BASE-CHAR . "processes/initial-self/conservazione.lisp")
   :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001077810-command-50855-0/conservazione.lisp")
   :BYTES 1181 :SHA256
   "dbc90db2077f4af98f790a7d468f52343abcfefa94b894048e0c3e631288e2d8")
  (:PATH #A((34) BASE-CHAR . "processes/initial-self/report.lisp") :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001077810-command-50855-0/report.lisp")
   :BYTES 202295 :SHA256
   "87cecea6f6f213743d66687b0ff976277a71fc4dbea49b635a05a9eed3b7b896")
  (:PATH #A((41) BASE-CHAR . "processes/reader-fixed/conservazione.lisp")
   :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078716-command-74447-0/conservazione.lisp")
   :BYTES 1181 :SHA256
   "f2841baa05aced0f74f00c11e54eec7fc662809bcd6415995074dd7f67b36fa5")
  (:PATH #A((34) BASE-CHAR . "processes/reader-fixed/report.lisp") :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078716-command-74447-0/report.lisp")
   :BYTES 292979 :SHA256
   "7970bcd239c903c3be7e55f7c9392f0945cb89fa56819e446b91780eea1f8675")
  (:PATH #A((43) BASE-CHAR . "processes/reader-initial/conservazione.lisp")
   :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078592-command-72804-0/conservazione.lisp")
   :BYTES 1181 :SHA256
   "1b291ee67b4619c0fe442aef99e42c6bcfd445fd8e3b40e367df33fb7dd3f569")
  (:PATH #A((36) BASE-CHAR . "processes/reader-initial/report.lisp") :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078592-command-72804-0/report.lisp")
   :BYTES 203569 :SHA256
   "8d9f676d4de0169c73261e98333fc7cb769239a26f8607570777ae26bc2a4ab2")
  (:PATH
   "raw/cases/fixed-default/case-01-explicit-closed-parallel-history/case-result.lisp"
   :SOURCE
   #A((184) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-01-explicit-closed-parallel-history/case-result.lisp")
   :BYTES 462 :SHA256
   "720fbfaa9d0e34a2a3d669d1144288b6471564adde1c24c6a3ec89fa3d8fdf54")
  (:PATH
   "raw/cases/fixed-default/case-01-explicit-closed-parallel-history/independent-recheck.stderr.log"
   :SOURCE
   #A((198) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-01-explicit-closed-parallel-history/independent-recheck.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/cases/fixed-default/case-01-explicit-closed-parallel-history/independent-recheck.stdout.lisp"
   :SOURCE
   #A((199) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-01-explicit-closed-parallel-history/independent-recheck.stdout.lisp")
   :BYTES 1548 :SHA256
   "dc8adef902534c97123658ed352a3a4e6374f8e0c2bbc372f2a899ab43564c0a")
  (:PATH
   "raw/cases/fixed-default/case-01-explicit-closed-parallel-history/observations/closed-check.log"
   :SOURCE
   #A((197) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-01-explicit-closed-parallel-history/observations/closed-check.log")
   :BYTES 1548 :SHA256
   "dc8adef902534c97123658ed352a3a4e6374f8e0c2bbc372f2a899ab43564c0a")
  (:PATH
   "raw/cases/fixed-default/case-01-explicit-closed-parallel-history/observations/report.lisp"
   :SOURCE
   #A((192) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-01-explicit-closed-parallel-history/observations/report.lisp")
   :BYTES 7171 :SHA256
   "eea711ec4cfec87f99d3d94d3e5cbf60b3de8a2b563a56b04b127ae28423c273")
  (:PATH "raw/cases/fixed-default/case-02-schema-version/case-result.lisp"
   :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-02-schema-version/case-result.lisp")
   :BYTES 431 :SHA256
   "bd4eff53f038b19da6d9f5727c596cc3e8b0e1f824c88915a439ebdbff59d245")
  (:PATH
   "raw/cases/fixed-default/case-02-schema-version/observations/report.lisp"
   :SOURCE
   #A((174) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-02-schema-version/observations/report.lisp")
   :BYTES 929 :SHA256
   "6dc24dd442bc618785fc12674225a536d6e0f476daf563fb19a70675099618f0")
  (:PATH "raw/cases/fixed-default/case-03-manifest-kind/case-result.lisp"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-03-manifest-kind/case-result.lisp")
   :BYTES 429 :SHA256
   "f7c2c11cb62e443015199ded8b93c65d72f92c884ea31c7ee5f65fab39eb7d98")
  (:PATH
   "raw/cases/fixed-default/case-03-manifest-kind/observations/report.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-03-manifest-kind/observations/report.lisp")
   :BYTES 927 :SHA256
   "ee6f6b3b416fff9ded681f248958dfafd9bb544b07ca9f9156c462f9a69181d0")
  (:PATH "raw/cases/fixed-default/case-04-date-format/case-result.lisp" :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-04-date-format/case-result.lisp")
   :BYTES 425 :SHA256
   "da2a03c32ab672fd360f2325985181b9af92c36e2c79acec38e405b4a8fc04a9")
  (:PATH "raw/cases/fixed-default/case-04-date-format/observations/report.lisp"
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-04-date-format/observations/report.lisp")
   :BYTES 923 :SHA256
   "55cf4329ce6fd0de22297cfca3f69040af94645cde2b850779faa588b9089816")
  (:PATH "raw/cases/fixed-default/case-05-unknown-trees/case-result.lisp"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-05-unknown-trees/case-result.lisp")
   :BYTES 390 :SHA256
   "3bb7ae144116cf98a87b1324c9edd5400f14ec27a14635bfde07b0538b2af523")
  (:PATH
   "raw/cases/fixed-default/case-05-unknown-trees/observations/report.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-05-unknown-trees/observations/report.lisp")
   :BYTES 890 :SHA256
   "ea20fcda730528e46edcd3fc3e6be8a76d22dde45fcb29dba7135c742f554999")
  (:PATH
   "raw/cases/fixed-default/case-06-duplicate-manifest-key/case-result.lisp"
   :SOURCE
   #A((174) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-06-duplicate-manifest-key/case-result.lisp")
   :BYTES 415 :SHA256
   "2d978e53659a283e8c6d03ceaceac3858e94ad42fb46ce606295068b9960a598")
  (:PATH
   "raw/cases/fixed-default/case-06-duplicate-manifest-key/observations/report.lisp"
   :SOURCE
   #A((182) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-06-duplicate-manifest-key/observations/report.lisp")
   :BYTES 915 :SHA256
   "fc397c14d4fcf47ab388fa23801297369bba0572d3ed153564139f63b172d6e1")
  (:PATH "raw/cases/fixed-default/case-07-relative-target/case-result.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-07-relative-target/case-result.lisp")
   :BYTES 436 :SHA256
   "5b95c9d27d47d919973a31ba572d30d9c7efb8b5a308a92c3a0a612d70f23204")
  (:PATH
   "raw/cases/fixed-default/case-07-relative-target/observations/report.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-07-relative-target/observations/report.lisp")
   :BYTES 931 :SHA256
   "6a9b2c89557991695d4f7ec86ed78e370b8d46860a3def8edd0fa365f7e0af64")
  (:PATH "raw/cases/fixed-default/case-08-relative-target/case-result.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-08-relative-target/case-result.lisp")
   :BYTES 436 :SHA256
   "e369601e014d43fc2d4b777327665b4628f3b610a44efeca3aa787cdbba18510")
  (:PATH
   "raw/cases/fixed-default/case-08-relative-target/observations/report.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-08-relative-target/observations/report.lisp")
   :BYTES 931 :SHA256
   "957fa9a2d98cf8cda8e7c3665dcdb23c12e09bb9ad7ad9206b0c4ec8432c3362")
  (:PATH "raw/cases/fixed-default/case-09-relative-target/case-result.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-09-relative-target/case-result.lisp")
   :BYTES 422 :SHA256
   "8493dc2cde3e71ec347dffcff7f66a9cb906309f631773f0404d6e96cbe4d792")
  (:PATH
   "raw/cases/fixed-default/case-09-relative-target/observations/report.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-09-relative-target/observations/report.lisp")
   :BYTES 922 :SHA256
   "b27ca3da7fdfe1237be0fa6e8fdf94f387a52576ca25eab677f8a25e3415af69")
  (:PATH "raw/cases/fixed-default/case-10-relative-target/case-result.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-10-relative-target/case-result.lisp")
   :BYTES 424 :SHA256
   "a95fd678df0f134000ad59582c699800eda4fd9fbcd721b6f08febb659aaa5f6")
  (:PATH
   "raw/cases/fixed-default/case-10-relative-target/observations/report.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-10-relative-target/observations/report.lisp")
   :BYTES 923 :SHA256
   "adbb55fc05f11450260502a4cf0d2c7c2c8124c2e40710ff3a472bb61aa2736b")
  (:PATH "raw/cases/fixed-default/case-11-relative-target/case-result.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-11-relative-target/case-result.lisp")
   :BYTES 425 :SHA256
   "aebc9b7eed17ef367bb93bcfba2ddbd422aba945df95d45885280085a4c76e20")
  (:PATH
   "raw/cases/fixed-default/case-11-relative-target/observations/report.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-11-relative-target/observations/report.lisp")
   :BYTES 924 :SHA256
   "d116d30e4bf97f7ad75407363634b3f4dd753a9af4c00bcb4ff7de5c178d7815")
  (:PATH "raw/cases/fixed-default/case-12-relative-target/case-result.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-12-relative-target/case-result.lisp")
   :BYTES 405 :SHA256
   "0e7caadf214ce5ff9212e1e321366f65ad29effc31dcb4bbe87bf318ed04d896")
  (:PATH
   "raw/cases/fixed-default/case-12-relative-target/observations/report.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-12-relative-target/observations/report.lisp")
   :BYTES 904 :SHA256
   "3ab5bda7fcd8de2a21429ecc562df078556821a252e0f68b297090b5d16f99d0")
  (:PATH "raw/cases/fixed-default/case-13-reserved-target/case-result.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-13-reserved-target/case-result.lisp")
   :BYTES 415 :SHA256
   "c7fb81d8bd6a97ec50247a29efd0ee0a72edc6658fc31e472c0f71a3607534fb")
  (:PATH
   "raw/cases/fixed-default/case-13-reserved-target/observations/report.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-13-reserved-target/observations/report.lisp")
   :BYTES 914 :SHA256
   "a7aa6b63a18d6c2067219a244ec6c2f5f753499c62b76827086f6269e3bcfe03")
  (:PATH "raw/cases/fixed-default/case-14-reserved-target/case-result.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-14-reserved-target/case-result.lisp")
   :BYTES 410 :SHA256
   "3440542c74f1e0997e18f987647848dd9aa18122600c19791cdecce719767039")
  (:PATH
   "raw/cases/fixed-default/case-14-reserved-target/observations/report.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-14-reserved-target/observations/report.lisp")
   :BYTES 909 :SHA256
   "ee94e0d239073fc22634a09bb3fa6403fc751e0c37f561c65536e631bf65f3dc")
  (:PATH "raw/cases/fixed-default/case-15-reserved-target/case-result.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-15-reserved-target/case-result.lisp")
   :BYTES 421 :SHA256
   "e35d409915da2417832080ac9b54328101d219a0c382fecc54e8a190480df94d")
  (:PATH
   "raw/cases/fixed-default/case-15-reserved-target/observations/report.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-15-reserved-target/observations/report.lisp")
   :BYTES 920 :SHA256
   "5bfed38a03216514ebf0dc3f00218fddb624fc7ba835c01b49456a43d1184764")
  (:PATH "raw/cases/fixed-default/case-16-reserved-target/case-result.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-16-reserved-target/case-result.lisp")
   :BYTES 419 :SHA256
   "84a50465746e87f8f526a7f1e97c622ecd41ad02b31913838268a16379cbd65c")
  (:PATH
   "raw/cases/fixed-default/case-16-reserved-target/observations/report.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-16-reserved-target/observations/report.lisp")
   :BYTES 918 :SHA256
   "c5ad031f1dacc1e5c50ba472fc910d62f9f2c6d10ddd5a0d3850e36e83a0f188")
  (:PATH "raw/cases/fixed-default/case-17-duplicate-target/case-result.lisp"
   :SOURCE
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-17-duplicate-target/case-result.lisp")
   :BYTES 408 :SHA256
   "d31a767c6fd4e1a2b65140d4bcb7999bd0aaa17c9b408a5ac7d09d2d261e35b0")
  (:PATH
   "raw/cases/fixed-default/case-17-duplicate-target/observations/report.lisp"
   :SOURCE
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-17-duplicate-target/observations/report.lisp")
   :BYTES 907 :SHA256
   "6d60dc29dc12a06c2b0dd66629b83c98ac2a3dcdad8dcfb2d75d6105bb1e2a54")
  (:PATH
   "raw/cases/fixed-default/case-18-file-directory-collision/case-result.lisp"
   :SOURCE
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-18-file-directory-collision/case-result.lisp")
   :BYTES 433 :SHA256
   "22f33c37f703cd24445d6d6055d67cb52d618f93dbf97cd7aee5bb64aae8a729")
  (:PATH
   "raw/cases/fixed-default/case-18-file-directory-collision/observations/report.lisp"
   :SOURCE
   #A((184) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-18-file-directory-collision/observations/report.lisp")
   :BYTES 932 :SHA256
   "05fe6a56fc314fedb995f3143d4a15e64e2b89ea0c1d49a115110f4587a7b905")
  (:PATH "raw/cases/fixed-default/case-19-unknown-file-field/case-result.lisp"
   :SOURCE
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-19-unknown-file-field/case-result.lisp")
   :BYTES 404 :SHA256
   "83067ae9032688d07248fe7ff0db3c1cf13eb68af588c19b75ab2c4aded3e8da")
  (:PATH
   "raw/cases/fixed-default/case-19-unknown-file-field/observations/report.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-19-unknown-file-field/observations/report.lisp")
   :BYTES 903 :SHA256
   "215aaae162a52270c761ab23e5c29b34a09fea759b8001cf571830f8a7a78378")
  (:PATH
   "raw/cases/fixed-default/case-20-unknown-process-field/case-result.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-20-unknown-process-field/case-result.lisp")
   :BYTES 408 :SHA256
   "45eea7e34399045bde4ed080891f3b5a2f6688429f0475b73f808151aed449a0")
  (:PATH
   "raw/cases/fixed-default/case-20-unknown-process-field/observations/report.lisp"
   :SOURCE
   #A((181) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-20-unknown-process-field/observations/report.lisp")
   :BYTES 907 :SHA256
   "e7f15a8c915922b7410a0643492836da125216f27b99fd6b39606a72b21db318")
  (:PATH
   "raw/cases/fixed-default/case-21-invalid-process-label/case-result.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-21-invalid-process-label/case-result.lisp")
   :BYTES 419 :SHA256
   "f47915e38cfa6977346df86403d57c000aed65d7e6bfcfbb2fdccd8fca9a0714")
  (:PATH
   "raw/cases/fixed-default/case-21-invalid-process-label/observations/report.lisp"
   :SOURCE
   #A((181) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-21-invalid-process-label/observations/report.lisp")
   :BYTES 918 :SHA256
   "3629b5dc58824d12f7c5b0c930aa82acfe19afdd92eeb6b02b3a0d7ad10111e3")
  (:PATH
   "raw/cases/fixed-default/case-22-invalid-process-label/case-result.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-22-invalid-process-label/case-result.lisp")
   :BYTES 413 :SHA256
   "a126cef8d9bc1f25ca48b4b5d94c7f1de4d0ce99e0ed502cddaf30f8da0b6ce4")
  (:PATH
   "raw/cases/fixed-default/case-22-invalid-process-label/observations/report.lisp"
   :SOURCE
   #A((181) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-22-invalid-process-label/observations/report.lisp")
   :BYTES 912 :SHA256
   "d6ca9bbad9090d2f6d8a059d35d940df394977a0f598cb9dccf2c1ad18741be7")
  (:PATH
   "raw/cases/fixed-default/case-23-duplicate-process-label/case-result.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-23-duplicate-process-label/case-result.lisp")
   :BYTES 423 :SHA256
   "8fb300c21c68ff927335e3c5f61df1ecbfea654942f2014e38837ac103b3aed5")
  (:PATH
   "raw/cases/fixed-default/case-23-duplicate-process-label/observations/report.lisp"
   :SOURCE
   #A((183) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-23-duplicate-process-label/observations/report.lisp")
   :BYTES 922 :SHA256
   "e32f0ceefbf406bee910871b5019e764842786208a5581a845ecd6d06b05e0b1")
  (:PATH "raw/cases/fixed-default/case-24-record-not-in-files/case-result.lisp"
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-24-record-not-in-files/case-result.lisp")
   :BYTES 435 :SHA256
   "8fad51c340b68f8bf14355555c6368434be15756b0b21c62849474dc19ec5d14")
  (:PATH
   "raw/cases/fixed-default/case-24-record-not-in-files/observations/report.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-24-record-not-in-files/observations/report.lisp")
   :BYTES 934 :SHA256
   "4656eb1cc60e84d4eef7b13e59be4f9afaffb7fd2133aca4648fe36c1aa44385")
  (:PATH
   "raw/cases/fixed-default/case-25-duplicate-process-record/case-result.lisp"
   :SOURCE
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-25-duplicate-process-record/case-result.lisp")
   :BYTES 438 :SHA256
   "10e20f37efde1a87623aad1962f96f10d968e6d066d89ef31d130792b6c17dca")
  (:PATH
   "raw/cases/fixed-default/case-25-duplicate-process-record/observations/report.lisp"
   :SOURCE
   #A((184) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-25-duplicate-process-record/observations/report.lisp")
   :BYTES 937 :SHA256
   "2cf6402270889029578d392bc2cfe5347cc2523acdaf64606880a9509c38e199")
  (:PATH "raw/cases/fixed-default/case-26-wrong-record-kind/case-result.lisp"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-26-wrong-record-kind/case-result.lisp")
   :BYTES 428 :SHA256
   "e1a3a9941ac6551c327d29fbf090904f404d94e2809bb2cf060d967624d12873")
  (:PATH
   "raw/cases/fixed-default/case-26-wrong-record-kind/observations/report.lisp"
   :SOURCE
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-26-wrong-record-kind/observations/report.lisp")
   :BYTES 927 :SHA256
   "572e556219fe94f4c649c031fc245a1ae707c90e25b71c6f8fbfa2fbbc49556a")
  (:PATH "raw/cases/fixed-default/case-27-nonterminal-record/case-result.lisp"
   :SOURCE
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-27-nonterminal-record/case-result.lisp")
   :BYTES 439 :SHA256
   "9125d584d3ccca8be8da726fa8f1bf0e2f67b143953ec6399cf08a8c168415fd")
  (:PATH
   "raw/cases/fixed-default/case-27-nonterminal-record/observations/report.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-27-nonterminal-record/observations/report.lisp")
   :BYTES 936 :SHA256
   "fbb0c64426b13ec9f4067c858bde05c3068fa060b070192419418aa807334ea4")
  (:PATH "raw/cases/fixed-default/case-28-nonterminal-record/case-result.lisp"
   :SOURCE
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-28-nonterminal-record/case-result.lisp")
   :BYTES 439 :SHA256
   "87d21e101ef701a149f91047382ce42eaf2b438956d4e8b12ff44eaa936b076a")
  (:PATH
   "raw/cases/fixed-default/case-28-nonterminal-record/observations/report.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-28-nonterminal-record/observations/report.lisp")
   :BYTES 936 :SHA256
   "272a18d8ff29276abb2f6d228ec73887278f365741a88450a9ee419f8a6035ce")
  (:PATH "raw/cases/fixed-default/case-29-unfinished-record/case-result.lisp"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-29-unfinished-record/case-result.lisp")
   :BYTES 437 :SHA256
   "aaa4f26559fea3dffdd6a83f8a2be33f682eabe4417d4e524f87cbb5447c051d")
  (:PATH
   "raw/cases/fixed-default/case-29-unfinished-record/observations/report.lisp"
   :SOURCE
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-29-unfinished-record/observations/report.lisp")
   :BYTES 934 :SHA256
   "79f7f79bcfc773c21640ca84632bfb4eac0ba199e23b7f6e440b68818d33d0a2")
  (:PATH
   "raw/cases/fixed-default/case-30-invalid-record-metadata/case-result.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-30-invalid-record-metadata/case-result.lisp")
   :BYTES 461 :SHA256
   "b04564d323434e72a6b4b481ef0c6b07fcb4b2307c8121efca4714ac2e794aef")
  (:PATH
   "raw/cases/fixed-default/case-30-invalid-record-metadata/observations/report.lisp"
   :SOURCE
   #A((183) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-30-invalid-record-metadata/observations/report.lisp")
   :BYTES 953 :SHA256
   "1d3547c093cb5b353c7dcf2242bc64a0b9d3e43577a5e27966e9cf1c591ddc4f")
  (:PATH
   "raw/cases/fixed-default/case-31-ok-with-failing-exit/case-result.lisp"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-31-ok-with-failing-exit/case-result.lisp")
   :BYTES 417 :SHA256
   "661c9b82dd47c85407bbc23956a6c7453c477e3d1e15244c9f53a81aa15517ac")
  (:PATH
   "raw/cases/fixed-default/case-31-ok-with-failing-exit/observations/report.lisp"
   :SOURCE
   #A((180) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-31-ok-with-failing-exit/observations/report.lisp")
   :BYTES 916 :SHA256
   "1d2864112c0b24167bfdeda48eb4a223868335be292d665f8b6bcfab37024f29")
  (:PATH
   "raw/cases/fixed-default/case-32-ok-with-changed-source/case-result.lisp"
   :SOURCE
   #A((174) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-32-ok-with-changed-source/case-result.lisp")
   :BYTES 421 :SHA256
   "ad80d7375a59345eeb34dc52b1b59d5af6d1dc2d60ba56740409102696466536")
  (:PATH
   "raw/cases/fixed-default/case-32-ok-with-changed-source/observations/report.lisp"
   :SOURCE
   #A((182) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-32-ok-with-changed-source/observations/report.lisp")
   :BYTES 920 :SHA256
   "6088725c69e8ad9846a16d9493d910c8a38957f174a89fa37785ce07b5534ad1")
  (:PATH
   "raw/cases/fixed-default/case-33-explicit-gzip-payload-required/case-result.lisp"
   :SOURCE
   #A((182) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-33-explicit-gzip-payload-required/case-result.lisp")
   :BYTES 724 :SHA256
   "44bb6456a32644afbe02d80f119ef811f27953509fdfda64daeb35da2483d7f1")
  (:PATH
   "raw/cases/fixed-default/case-33-explicit-gzip-payload-required/observations/report.lisp"
   :SOURCE
   #A((190) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-33-explicit-gzip-payload-required/observations/report.lisp")
   :BYTES 1218 :SHA256
   "77e2fdb0293f44195e62326692b05af65e36108e797115003218c0022cea5b60")
  (:PATH
   "raw/cases/fixed-default/case-34-accessory-descriptor-also-needs-explicit-payload/case-result.lisp"
   :SOURCE
   #A((200) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-34-accessory-descriptor-also-needs-explicit-payload/case-result.lisp")
   :BYTES 778 :SHA256
   "7a39f369c5210869ae9c0b13867f8a23031cd81495a7201640f3f55304108ab5")
  (:PATH
   "raw/cases/fixed-default/case-34-accessory-descriptor-also-needs-explicit-payload/observations/report.lisp"
   :SOURCE
   #A((208) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-34-accessory-descriptor-also-needs-explicit-payload/observations/report.lisp")
   :BYTES 1272 :SHA256
   "abebfe3f52afbc6c60430b1119341e95391abc43c70cfae501a21d880e83df98")
  (:PATH
   "raw/cases/fixed-default/case-35-accessory-compressed-record-retained-with-payload/case-result.lisp"
   :SOURCE
   #A((201) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-35-accessory-compressed-record-retained-with-payload/case-result.lisp")
   :BYTES 388 :SHA256
   "4d31b7bae61ce0c98163635d3dfabd0b09fcfea5b2e454dddac3f04b229c24b2")
  (:PATH
   "raw/cases/fixed-default/case-35-accessory-compressed-record-retained-with-payload/observations/closed-check.log"
   :SOURCE
   #A((214) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-35-accessory-compressed-record-retained-with-payload/observations/closed-check.log")
   :BYTES 1375 :SHA256
   "f5afc446140d46861c3a990e285290ff9dae994388bea9a3f00950f589f6f0a0")
  (:PATH
   "raw/cases/fixed-default/case-35-accessory-compressed-record-retained-with-payload/observations/report.lisp"
   :SOURCE
   #A((209) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-35-accessory-compressed-record-retained-with-payload/observations/report.lisp")
   :BYTES 6989 :SHA256
   "c38df2b4303fa2b7ac7339a5fc3f4834e8b46e4e99e04a04682f91757ddaf2fd")
  (:PATH
   "raw/cases/fixed-default/case-36-gzip-target-must-match-descriptor/case-result.lisp"
   :SOURCE
   #A((185) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-36-gzip-target-must-match-descriptor/case-result.lisp")
   :BYTES 733 :SHA256
   "126d8c26f4cccdb594374112c0553d9238f845174d31160fbc37ac29d083d8cc")
  (:PATH
   "raw/cases/fixed-default/case-36-gzip-target-must-match-descriptor/observations/report.lisp"
   :SOURCE
   #A((193) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-36-gzip-target-must-match-descriptor/observations/report.lisp")
   :BYTES 1227 :SHA256
   "2023339c828762e8394234a2ef1a628b4ae7b3809264a73d3da46bbb2311b8d9")
  (:PATH
   "raw/cases/fixed-default/case-37-descriptor-hash-mismatch/case-result.lisp"
   :SOURCE
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-37-descriptor-hash-mismatch/case-result.lisp")
   :BYTES 857 :SHA256
   "8dceb49f435b12acf1f6dee86025c82fc139d969bd66a2143f4c8916c9947b44")
  (:PATH
   "raw/cases/fixed-default/case-37-descriptor-hash-mismatch/observations/report.lisp"
   :SOURCE
   #A((184) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-37-descriptor-hash-mismatch/observations/report.lisp")
   :BYTES 1351 :SHA256
   "f327b1db90ec4e231f4f9ea65af932c1aadb6c4f65eb8f236b0e6f77a648fc79")
  (:PATH "raw/cases/fixed-default/case-38-source-leaf-symlink/case-result.lisp"
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-38-source-leaf-symlink/case-result.lisp")
   :BYTES 621 :SHA256
   "7c9bd73100d85b197ee55701b56dcdd2791ee8f3344801836d7a40c4e6b9c73a")
  (:PATH
   "raw/cases/fixed-default/case-38-source-leaf-symlink/observations/report.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-38-source-leaf-symlink/observations/report.lisp")
   :BYTES 1113 :SHA256
   "ec1f54a84067125c737b410b12e422f2daa410bfd600d3ca10e3f3cadb10cf77")
  (:PATH
   "raw/cases/fixed-default/case-39-plain-budget-exact-boundary/case-result.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-39-plain-budget-exact-boundary/case-result.lisp")
   :BYTES 348 :SHA256
   "2515118b29e3ead01448d8cbb3790d9a625eb7636cd7065b66fc1263b9a9cd74")
  (:PATH
   "raw/cases/fixed-default/case-39-plain-budget-exact-boundary/observations/closed-check.log"
   :SOURCE
   #A((192) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-39-plain-budget-exact-boundary/observations/closed-check.log")
   :BYTES 1545 :SHA256
   "81c2498faa9c687b9848453a7037c83ef243e76148d25f2608e55deda978b496")
  (:PATH
   "raw/cases/fixed-default/case-39-plain-budget-exact-boundary/observations/report.lisp"
   :SOURCE
   #A((187) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-39-plain-budget-exact-boundary/observations/report.lisp")
   :BYTES 7119 :SHA256
   "ca74c7a2183afb2d46f30e461095d0dca2f4255b9fdaa05987f4a0a41cd72e9b")
  (:PATH
   "raw/cases/fixed-default/case-40-gzip-budget-exact-boundary/case-result.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-40-gzip-budget-exact-boundary/case-result.lisp")
   :BYTES 345 :SHA256
   "717df2bd2670d6d5a5e3c85bc27e626436fc9925ad32ef1556efb409655380f9")
  (:PATH
   "raw/cases/fixed-default/case-40-gzip-budget-exact-boundary/observations/closed-check.log"
   :SOURCE
   #A((191) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-40-gzip-budget-exact-boundary/observations/closed-check.log")
   :BYTES 1544 :SHA256
   "46a937296303e698407c432e7784b598390972713fccde6d0fd1cf78c6118ffc")
  (:PATH
   "raw/cases/fixed-default/case-40-gzip-budget-exact-boundary/observations/report.lisp"
   :SOURCE
   #A((186) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-40-gzip-budget-exact-boundary/observations/report.lisp")
   :BYTES 7106 :SHA256
   "c0ce18bdb5ca5fd0d2bb5e6c7ab08ab1b01f8e9cbbfa176f5ea0b74735b8f32d")
  (:PATH "raw/cases/fixed-default/case-41-plain-budget-over/case-result.lisp"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-41-plain-budget-over/case-result.lisp")
   :BYTES 419 :SHA256
   "ae679d0dde0719b5d7225a71b8903e0ec35da76730ce6938db70b30eea388fab")
  (:PATH
   "raw/cases/fixed-default/case-41-plain-budget-over/observations/report.lisp"
   :SOURCE
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-41-plain-budget-over/observations/report.lisp")
   :BYTES 918 :SHA256
   "8f6a8a526370ee202228b47237ac093904509d3bcbc2960d3ddb68c88777e3ca")
  (:PATH "raw/cases/fixed-default/case-42-gzip-budget-over/case-result.lisp"
   :SOURCE
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-42-gzip-budget-over/case-result.lisp")
   :BYTES 416 :SHA256
   "1c1a786fde0f357a16b88d59119c2e943142a25604ba9428b027a0e7d41759af")
  (:PATH
   "raw/cases/fixed-default/case-42-gzip-budget-over/observations/report.lisp"
   :SOURCE
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-42-gzip-budget-over/observations/report.lisp")
   :BYTES 915 :SHA256
   "f4589db31dd79176c7b704601ac477dd84ec73d6a315798cefe0bac2ea172a28")
  (:PATH
   "raw/cases/fixed-default/case-43-existing-destination-never-overwritten/case-result.lisp"
   :SOURCE
   #A((190) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-43-existing-destination-never-overwritten/case-result.lisp")
   :BYTES 627 :SHA256
   "91d127e581d03e0a5f88c830be9db6345c07d125670ed5c343631aa02b086f7f")
  (:PATH
   "raw/cases/fixed-default/case-43-existing-destination-never-overwritten/observations/report.lisp"
   :SOURCE
   #A((198) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-43-existing-destination-never-overwritten/observations/report.lisp")
   :BYTES 1119 :SHA256
   "182ddae194f329eebd94cc9c7e906a110b138fa1f80ff04248bd6f8930954053")
  (:PATH
   "raw/cases/fixed-default/case-44-existing-observations-never-overwritten/case-result.lisp"
   :SOURCE
   #A((191) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-44-existing-observations-never-overwritten/case-result.lisp")
   :BYTES 637 :SHA256
   "de8e9ddf50ecd0a91a34d99208cbe23f2f5f2798bdaf0fb66a6da66fc46a03b2")
  (:PATH
   "raw/cases/fixed-default/case-45-destination-observations-overlap/case-result.lisp"
   :SOURCE
   #A((184) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-45-destination-observations-overlap/case-result.lisp")
   :BYTES 468 :SHA256
   "0e358309e7ebf1fe8bf96b942e52c0d0b895e2a06fa02dd0af268eeac05dcf63")
  (:PATH
   "raw/cases/fixed-default/case-46-destination-observations-overlap/case-result.lisp"
   :SOURCE
   #A((184) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-46-destination-observations-overlap/case-result.lisp")
   :BYTES 468 :SHA256
   "73b67f1bab6480f26d00aa32ab232d4d8ca7bae9968c27f3d1a33a4d8e1672c4")
  (:PATH
   "raw/cases/fixed-default/case-47-destination-observations-overlap/case-result.lisp"
   :SOURCE
   #A((184) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-47-destination-observations-overlap/case-result.lisp")
   :BYTES 468 :SHA256
   "7c24b418e4845be3d2663f4dfc7f0e5a369a70269513f3be1f64954543c526c0")
  (:PATH
   "raw/cases/fixed-default/case-48-corrupt-copy-retains-failure/case-result.lisp"
   :SOURCE
   #A((180) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-48-corrupt-copy-retains-failure/case-result.lisp")
   :BYTES 591 :SHA256
   "af6d67ad697cea0544e0b4bee38125c2029c2f1eceef5c29bfd14067ba564b9f")
  (:PATH
   "raw/cases/fixed-default/case-48-corrupt-copy-retains-failure/observations/report.lisp"
   :SOURCE
   #A((188) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-48-corrupt-copy-retains-failure/observations/report.lisp")
   :BYTES 5425 :SHA256
   "b6d9ce1350323317f6cb6583c24e4cee179122e3c72656b69cd5e008a9250bc4")
  (:PATH
   "raw/cases/fixed-default/case-49-source-change-retains-failure/case-result.lisp"
   :SOURCE
   #A((181) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-49-source-change-retains-failure/case-result.lisp")
   :BYTES 597 :SHA256
   "bf7b55a4299eae4e1754d3fb00a4c4e91f20551550b834762e71c3f7f61e8401")
  (:PATH
   "raw/cases/fixed-default/case-49-source-change-retains-failure/observations/report.lisp"
   :SOURCE
   #A((189) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-49-source-change-retains-failure/observations/report.lisp")
   :BYTES 5440 :SHA256
   "ac439abbea2b8473288b4d560eaa80d7b08d7798ea1eaf04bae31770a9d48a8e")
  (:PATH
   "raw/cases/fixed-default/case-50-unindexed-extra-rejected-by-final-checker/case-result.lisp"
   :SOURCE
   #A((193) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-50-unindexed-extra-rejected-by-final-checker/case-result.lisp")
   :BYTES 975 :SHA256
   "6f31415b75182a1ebedaa28373dbbd4c9659f9d81336eacd234be4df9fa8b2aa")
  (:PATH
   "raw/cases/fixed-default/case-50-unindexed-extra-rejected-by-final-checker/observations/closed-check.log"
   :SOURCE
   #A((206) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-50-unindexed-extra-rejected-by-final-checker/observations/closed-check.log")
   :BYTES 161 :SHA256
   "36c547965bf7e5fb5aac2991d98c4e6f27d0783eb616501721e8f35c9202c18e")
  (:PATH
   "raw/cases/fixed-default/case-50-unindexed-extra-rejected-by-final-checker/observations/report.lisp"
   :SOURCE
   #A((201) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-50-unindexed-extra-rejected-by-final-checker/observations/report.lisp")
   :BYTES 5703 :SHA256
   "3155aefc6a05fa214d88e5754d4038187320da07a72cc2a54d9ee5c44e735bd2")
  (:PATH
   "raw/cases/fixed-default/case-51-manifest-read-eval-disabled/case-result.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-51-manifest-read-eval-disabled/case-result.lisp")
   :BYTES 768 :SHA256
   "5982e138be53fd61b56ab29ee0b85b28dedcdbe7c06c99cb22229c174f63f494")
  (:PATH
   "raw/cases/fixed-default/case-51-manifest-read-eval-disabled/observations/report.lisp"
   :SOURCE
   #A((187) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-51-manifest-read-eval-disabled/observations/report.lisp")
   :BYTES 1267 :SHA256
   "eb2e47c38724949c4c8f368c82918b6856561234aea970b96ae4b758a80d97ec")
  (:PATH
   "raw/cases/fixed-default/case-52-manifest-eof-required/case-result.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-52-manifest-eof-required/case-result.lisp")
   :BYTES 399 :SHA256
   "f2e6cadce55f43c9fb67bf35bae522ef5800539a5dde8878060012e359639457")
  (:PATH
   "raw/cases/fixed-default/case-52-manifest-eof-required/observations/report.lisp"
   :SOURCE
   #A((181) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-52-manifest-eof-required/observations/report.lisp")
   :BYTES 894 :SHA256
   "2b8b301155c2f7068d6c828efaddfd0029c39c54c0f1e9d13d5be0d9a0a57a3d")
  (:PATH
   "raw/cases/fixed-default/case-53-record-read-eval-disabled/case-result.lisp"
   :SOURCE
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-53-record-read-eval-disabled/case-result.lisp")
   :BYTES 757 :SHA256
   "cd95c548b1f8d7276359a0abcadf63dcb8c631b13cfd75e0e4c3804b44d30e90")
  (:PATH
   "raw/cases/fixed-default/case-53-record-read-eval-disabled/observations/report.lisp"
   :SOURCE
   #A((185) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-53-record-read-eval-disabled/observations/report.lisp")
   :BYTES 1256 :SHA256
   "a6d40234870a586838141574a2ab4d21cf24a6a9efe142cd11bd4f3fc46598fd")
  (:PATH "raw/cases/fixed-default/case-54-record-eof-required/case-result.lisp"
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-54-record-eof-required/case-result.lisp")
   :BYTES 395 :SHA256
   "58c9d179330ec1af4d3ef8158d68ee5d783e9d925cbcf78a4ac50b194710f21a")
  (:PATH
   "raw/cases/fixed-default/case-54-record-eof-required/observations/report.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-54-record-eof-required/observations/report.lisp")
   :BYTES 890 :SHA256
   "371e561d7d4fac5d63f1b7723244d72b1cca00a0ed6f670f8d607973194bc9a8")
  (:PATH "raw/cases/fixed-default/case-55-cli-arguments/case-result.lisp"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-55-cli-arguments/case-result.lisp")
   :BYTES 268 :SHA256
   "ba94320b2f90f44a11aa9e60dd67dcec2dced0a7f977645adcc5f2381ea7adf6")
  (:PATH "raw/cases/fixed-default/case-55-cli-arguments/cli.stderr.log" :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-55-cli-arguments/cli.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/cases/fixed-default/case-55-cli-arguments/cli.stdout.lisp"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-55-cli-arguments/cli.stdout.lisp")
   :BYTES 224 :SHA256
   "575d9ea7dee0df7b80717f1310e60022e9d079b983fcd26635adb5ea5111cace")
  (:PATH "raw/cases/fixed-default/case-56-cli-arguments/case-result.lisp"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-56-cli-arguments/case-result.lisp")
   :BYTES 268 :SHA256
   "620130d8559b3123c69849b6965763b0db3a2688d2e3f7e02c26a730102981b3")
  (:PATH "raw/cases/fixed-default/case-56-cli-arguments/cli.stderr.log" :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-56-cli-arguments/cli.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/cases/fixed-default/case-56-cli-arguments/cli.stdout.lisp"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-56-cli-arguments/cli.stdout.lisp")
   :BYTES 224 :SHA256
   "575d9ea7dee0df7b80717f1310e60022e9d079b983fcd26635adb5ea5111cace")
  (:PATH "raw/cases/fixed-default/case-57-cli-arguments/case-result.lisp"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-57-cli-arguments/case-result.lisp")
   :BYTES 268 :SHA256
   "4d61bffc98fbda45e1300ef78e5ef6e2bd33d2d1367b824cc8a9dd66954ac306")
  (:PATH "raw/cases/fixed-default/case-57-cli-arguments/cli.stderr.log" :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-57-cli-arguments/cli.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/cases/fixed-default/case-57-cli-arguments/cli.stdout.lisp"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-57-cli-arguments/cli.stdout.lisp")
   :BYTES 224 :SHA256
   "575d9ea7dee0df7b80717f1310e60022e9d079b983fcd26635adb5ea5111cace")
  (:PATH "raw/cases/fixed-default/case-58-cli-arguments/case-result.lisp"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-58-cli-arguments/case-result.lisp")
   :BYTES 268 :SHA256
   "eb758e6dd2d77eff26c72a77d7d1dfa4846346cbf40065dc9a78e797f1c40fca")
  (:PATH "raw/cases/fixed-default/case-58-cli-arguments/cli.stderr.log" :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-58-cli-arguments/cli.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/cases/fixed-default/case-58-cli-arguments/cli.stdout.lisp"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-58-cli-arguments/cli.stdout.lisp")
   :BYTES 224 :SHA256
   "575d9ea7dee0df7b80717f1310e60022e9d079b983fcd26635adb5ea5111cace")
  (:PATH "raw/cases/fixed-default/case-59-cli-arguments/case-result.lisp"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-59-cli-arguments/case-result.lisp")
   :BYTES 268 :SHA256
   "c32dcf510043df5bc11431b243000c8f97f84c86207b0158c2f6b246d8b1cef6")
  (:PATH "raw/cases/fixed-default/case-59-cli-arguments/cli.stderr.log" :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-59-cli-arguments/cli.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/cases/fixed-default/case-59-cli-arguments/cli.stdout.lisp"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/case-59-cli-arguments/cli.stdout.lisp")
   :BYTES 224 :SHA256
   "575d9ea7dee0df7b80717f1310e60022e9d079b983fcd26635adb5ea5111cace")
  (:PATH "raw/cases/fixed-default/self-test-report.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/self-test-report.lisp")
   :BYTES 28716 :SHA256
   "39d34bc74f75a23570bb155b569d67dd73964c8fad79beef25f5af4bc94870ad")
  (:PATH
   "raw/cases/fixed-explicit/case-01-explicit-closed-parallel-history/case-result.lisp"
   :SOURCE
   #A((192) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/case-result.lisp")
   :BYTES 461 :SHA256
   "83a751f7ed864fa97a8937f9ad115de6daaf67427af8cc9e2190247815947689")
  (:PATH
   "raw/cases/fixed-explicit/case-01-explicit-closed-parallel-history/independent-recheck.stderr.log"
   :SOURCE
   #A((206) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/independent-recheck.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/cases/fixed-explicit/case-01-explicit-closed-parallel-history/independent-recheck.stdout.lisp"
   :SOURCE
   #A((207) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/independent-recheck.stdout.lisp")
   :BYTES 1556 :SHA256
   "3a0f7a755ecd40e3e5cfd37bad4567eba6f278475ab83e9511cacbbc11d79be0")
  (:PATH
   "raw/cases/fixed-explicit/case-01-explicit-closed-parallel-history/observations/closed-check.log"
   :SOURCE
   #A((205) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/observations/closed-check.log")
   :BYTES 1556 :SHA256
   "3a0f7a755ecd40e3e5cfd37bad4567eba6f278475ab83e9511cacbbc11d79be0")
  (:PATH
   "raw/cases/fixed-explicit/case-01-explicit-closed-parallel-history/observations/report.lisp"
   :SOURCE
   #A((200) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/observations/report.lisp")
   :BYTES 7267 :SHA256
   "b22a6c6fca2df0149ed9028104afcd1678e18c12ef885e1f5c40b18911686df3")
  (:PATH "raw/cases/fixed-explicit/case-02-schema-version/case-result.lisp"
   :SOURCE
   #A((174) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-02-schema-version/case-result.lisp")
   :BYTES 430 :SHA256
   "376de283858782ceaad5cd3519a609b7d9c3833fb993b1db818d749602be14bb")
  (:PATH
   "raw/cases/fixed-explicit/case-02-schema-version/observations/report.lisp"
   :SOURCE
   #A((182) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-02-schema-version/observations/report.lisp")
   :BYTES 945 :SHA256
   "5a4730449a606f0754333f223cc40f7039d51a7880375a483dad560ae7911a04")
  (:PATH "raw/cases/fixed-explicit/case-03-manifest-kind/case-result.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-03-manifest-kind/case-result.lisp")
   :BYTES 428 :SHA256
   "562f9d8e5911b15c99c20b40478366aab50b0908496608915c80138010493ad2")
  (:PATH
   "raw/cases/fixed-explicit/case-03-manifest-kind/observations/report.lisp"
   :SOURCE
   #A((181) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-03-manifest-kind/observations/report.lisp")
   :BYTES 943 :SHA256
   "1c29e227372307eaa3c24ae46ef8ce6264235879f8822c842daf2eebd54a6dec")
  (:PATH "raw/cases/fixed-explicit/case-04-date-format/case-result.lisp"
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-04-date-format/case-result.lisp")
   :BYTES 424 :SHA256
   "046683d938abee495e135776cf5727080ed1405db762b61049bfd76b4b59cb14")
  (:PATH
   "raw/cases/fixed-explicit/case-04-date-format/observations/report.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-04-date-format/observations/report.lisp")
   :BYTES 939 :SHA256
   "b80ecb83a5d78d8f2c912c0b55b25a1fc36575c6e5d636fe16533b838fd07113")
  (:PATH "raw/cases/fixed-explicit/case-05-unknown-trees/case-result.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-05-unknown-trees/case-result.lisp")
   :BYTES 389 :SHA256
   "d7873b5742a32efd12945c5457bb9a766a5255a10c9f501a2d294005ccbf84c6")
  (:PATH
   "raw/cases/fixed-explicit/case-05-unknown-trees/observations/report.lisp"
   :SOURCE
   #A((181) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-05-unknown-trees/observations/report.lisp")
   :BYTES 906 :SHA256
   "374e344a7b30983cad2b039eee105a08f21b6ee66028b1e2635a1c81b7822109")
  (:PATH
   "raw/cases/fixed-explicit/case-06-duplicate-manifest-key/case-result.lisp"
   :SOURCE
   #A((182) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-06-duplicate-manifest-key/case-result.lisp")
   :BYTES 414 :SHA256
   "4b15ec35fe6e36bc7140b2aca1a5b485e0b3786839c35bf5d6d9962522d203aa")
  (:PATH
   "raw/cases/fixed-explicit/case-06-duplicate-manifest-key/observations/report.lisp"
   :SOURCE
   #A((190) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-06-duplicate-manifest-key/observations/report.lisp")
   :BYTES 931 :SHA256
   "5d1e53a88114b1a3bd197d52a23d495399f47fdf4b4ae898bc2350a7293491f1")
  (:PATH "raw/cases/fixed-explicit/case-07-relative-target/case-result.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-07-relative-target/case-result.lisp")
   :BYTES 435 :SHA256
   "537df24e18ed5f54ee85d382d50b6e0be0d3bc6ae3ec5f5ff3313042a1371a26")
  (:PATH
   "raw/cases/fixed-explicit/case-07-relative-target/observations/report.lisp"
   :SOURCE
   #A((183) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-07-relative-target/observations/report.lisp")
   :BYTES 947 :SHA256
   "dba1ac86994b59099287ac476db97b26cbfdac71ebab4ec7a0b27cf48972a703")
  (:PATH "raw/cases/fixed-explicit/case-08-relative-target/case-result.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-08-relative-target/case-result.lisp")
   :BYTES 435 :SHA256
   "1dc981e12dcdb0ccb76d18caf0d6958912e8d1df82b196c08028b7b439ccc1e0")
  (:PATH
   "raw/cases/fixed-explicit/case-08-relative-target/observations/report.lisp"
   :SOURCE
   #A((183) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-08-relative-target/observations/report.lisp")
   :BYTES 947 :SHA256
   "07d277fc2a2db7bcc4bd0b6aeefe273bf89c13ea5cfb02e6df7b3ad06c013f6e")
  (:PATH "raw/cases/fixed-explicit/case-09-relative-target/case-result.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-09-relative-target/case-result.lisp")
   :BYTES 421 :SHA256
   "85644ab23ee187016de137b6cca71978238c34c0e8efb6b0a693bb1beb222f83")
  (:PATH
   "raw/cases/fixed-explicit/case-09-relative-target/observations/report.lisp"
   :SOURCE
   #A((183) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-09-relative-target/observations/report.lisp")
   :BYTES 938 :SHA256
   "7acfa7f19c832b41d7d47b1b1eb9428d509462e8609b03ca2e815e7a3d03c86b")
  (:PATH "raw/cases/fixed-explicit/case-10-relative-target/case-result.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-10-relative-target/case-result.lisp")
   :BYTES 423 :SHA256
   "ea8fb7e4e81202435a67ec50b08ee2919fb6903be91b82b94593d699d83f7304")
  (:PATH
   "raw/cases/fixed-explicit/case-10-relative-target/observations/report.lisp"
   :SOURCE
   #A((183) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-10-relative-target/observations/report.lisp")
   :BYTES 939 :SHA256
   "89b25cf9db4642aa3d17fb41f377cd9dac1294aa474a101e7d26af87caf606df")
  (:PATH "raw/cases/fixed-explicit/case-11-relative-target/case-result.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-11-relative-target/case-result.lisp")
   :BYTES 424 :SHA256
   "4c46501aa5569d8d8c5af38b612a793a859205241122349d3b7a0bae21556ff9")
  (:PATH
   "raw/cases/fixed-explicit/case-11-relative-target/observations/report.lisp"
   :SOURCE
   #A((183) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-11-relative-target/observations/report.lisp")
   :BYTES 940 :SHA256
   "7ea3d9ed415a790f5ae63603612ce806cd6bc92fb2f90ea927c42c244cfd5839")
  (:PATH "raw/cases/fixed-explicit/case-12-relative-target/case-result.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-12-relative-target/case-result.lisp")
   :BYTES 404 :SHA256
   "c22b58a817fea92ae18218bc411b1b2b03d1271ae4e93326ae97258d9ea8cfc4")
  (:PATH
   "raw/cases/fixed-explicit/case-12-relative-target/observations/report.lisp"
   :SOURCE
   #A((183) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-12-relative-target/observations/report.lisp")
   :BYTES 920 :SHA256
   "c88b34d96b1383bffee37611420f2000f9acee2e1fc7541eaee7ce3bb9a7a92f")
  (:PATH "raw/cases/fixed-explicit/case-13-reserved-target/case-result.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-13-reserved-target/case-result.lisp")
   :BYTES 414 :SHA256
   "da325ebbc8755c3ba9913817721cbea9f45e8956ec43c07f588e7caa9f58b1f2")
  (:PATH
   "raw/cases/fixed-explicit/case-13-reserved-target/observations/report.lisp"
   :SOURCE
   #A((183) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-13-reserved-target/observations/report.lisp")
   :BYTES 930 :SHA256
   "94a4263010f8a4fa93de872624f77105807380e8386ee5f2807144502ae0873a")
  (:PATH "raw/cases/fixed-explicit/case-14-reserved-target/case-result.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-14-reserved-target/case-result.lisp")
   :BYTES 409 :SHA256
   "fd5b0f71f9285cc2a320c3a934aae7ab513fecf248a9f37149eaa56940b92923")
  (:PATH
   "raw/cases/fixed-explicit/case-14-reserved-target/observations/report.lisp"
   :SOURCE
   #A((183) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-14-reserved-target/observations/report.lisp")
   :BYTES 925 :SHA256
   "8114df924de48893e0c9bd8b052a357d12e55454844d355ccf8cabe05c7726fc")
  (:PATH "raw/cases/fixed-explicit/case-15-reserved-target/case-result.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-15-reserved-target/case-result.lisp")
   :BYTES 420 :SHA256
   "7426f7231685380ba8034ec607bd33c5eeb6ab9acdb143527e533db85ada1788")
  (:PATH
   "raw/cases/fixed-explicit/case-15-reserved-target/observations/report.lisp"
   :SOURCE
   #A((183) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-15-reserved-target/observations/report.lisp")
   :BYTES 936 :SHA256
   "3de35058b4e7fa36b9c43dfd2e71acac333a4994e1746791d4bd31281c43131c")
  (:PATH "raw/cases/fixed-explicit/case-16-reserved-target/case-result.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-16-reserved-target/case-result.lisp")
   :BYTES 418 :SHA256
   "b19a3a164e3082c26a042e90c65ddc45573b98ede8a46bd19624b5e5320b6a4f")
  (:PATH
   "raw/cases/fixed-explicit/case-16-reserved-target/observations/report.lisp"
   :SOURCE
   #A((183) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-16-reserved-target/observations/report.lisp")
   :BYTES 934 :SHA256
   "af8d552c70f780269a99f934c57b91abe248a76074e03509bd0a375fb959b10d")
  (:PATH "raw/cases/fixed-explicit/case-17-duplicate-target/case-result.lisp"
   :SOURCE
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-17-duplicate-target/case-result.lisp")
   :BYTES 407 :SHA256
   "3f011208cf92fe14f5d8065b35edc09a66bfb61cf2d050a3abb1ffb1c7d4219d")
  (:PATH
   "raw/cases/fixed-explicit/case-17-duplicate-target/observations/report.lisp"
   :SOURCE
   #A((184) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-17-duplicate-target/observations/report.lisp")
   :BYTES 923 :SHA256
   "ec4f106a941e94d3e5672773e22cf343ea25669b0e5079d0f95adbc7abfb6fc3")
  (:PATH
   "raw/cases/fixed-explicit/case-18-file-directory-collision/case-result.lisp"
   :SOURCE
   #A((184) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-18-file-directory-collision/case-result.lisp")
   :BYTES 432 :SHA256
   "0010bfb8a193495f92e753c1239069192ab75abdc63498c8ae6e89c35376c73b")
  (:PATH
   "raw/cases/fixed-explicit/case-18-file-directory-collision/observations/report.lisp"
   :SOURCE
   #A((192) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-18-file-directory-collision/observations/report.lisp")
   :BYTES 948 :SHA256
   "4005e492ba9803e924b07a7cda754f76dca44832842542b45612df2c50113cb2")
  (:PATH "raw/cases/fixed-explicit/case-19-unknown-file-field/case-result.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-19-unknown-file-field/case-result.lisp")
   :BYTES 403 :SHA256
   "37c467edd9f06079f026a7b3fa1101d847ad46ea0c28a0cd0395db8e840fd72c")
  (:PATH
   "raw/cases/fixed-explicit/case-19-unknown-file-field/observations/report.lisp"
   :SOURCE
   #A((186) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-19-unknown-file-field/observations/report.lisp")
   :BYTES 919 :SHA256
   "016aa65697cbfbdff8a5bbef566b5573615e13be7086364f8bf2958c978b2ccf")
  (:PATH
   "raw/cases/fixed-explicit/case-20-unknown-process-field/case-result.lisp"
   :SOURCE
   #A((181) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-20-unknown-process-field/case-result.lisp")
   :BYTES 407 :SHA256
   "4f24b13f55ee2fa90198e59b218a1fa6632101c6a76c3d7a7b2ce8de7c110390")
  (:PATH
   "raw/cases/fixed-explicit/case-20-unknown-process-field/observations/report.lisp"
   :SOURCE
   #A((189) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-20-unknown-process-field/observations/report.lisp")
   :BYTES 923 :SHA256
   "23388abff5f5c4465ab22405b34db2ded90b205651641979ccad1a237894bc03")
  (:PATH
   "raw/cases/fixed-explicit/case-21-invalid-process-label/case-result.lisp"
   :SOURCE
   #A((181) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-21-invalid-process-label/case-result.lisp")
   :BYTES 418 :SHA256
   "4f6b5f66040924b65a94e1ec031b251b7274d8c443089a077c2635bd2eb72a65")
  (:PATH
   "raw/cases/fixed-explicit/case-21-invalid-process-label/observations/report.lisp"
   :SOURCE
   #A((189) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-21-invalid-process-label/observations/report.lisp")
   :BYTES 934 :SHA256
   "9f09b884c294ec2baf6da24dbe979ea9bc6bf5007a1f0b0348712a5ae8e3781a")
  (:PATH
   "raw/cases/fixed-explicit/case-22-invalid-process-label/case-result.lisp"
   :SOURCE
   #A((181) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-22-invalid-process-label/case-result.lisp")
   :BYTES 412 :SHA256
   "44c0ae9b602e32e9f050e323e645b370b69aa24f778f201787a37782098ee062")
  (:PATH
   "raw/cases/fixed-explicit/case-22-invalid-process-label/observations/report.lisp"
   :SOURCE
   #A((189) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-22-invalid-process-label/observations/report.lisp")
   :BYTES 928 :SHA256
   "fcd47a0e51ced73e4c66cb0f5172811298ff6f25649c713385949e14b9f3bd8d")
  (:PATH
   "raw/cases/fixed-explicit/case-23-duplicate-process-label/case-result.lisp"
   :SOURCE
   #A((183) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-23-duplicate-process-label/case-result.lisp")
   :BYTES 422 :SHA256
   "f474a0d68748073a0a1c5af42b604c2cae8dc9684c5a022a85c1bd68262b9ef6")
  (:PATH
   "raw/cases/fixed-explicit/case-23-duplicate-process-label/observations/report.lisp"
   :SOURCE
   #A((191) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-23-duplicate-process-label/observations/report.lisp")
   :BYTES 938 :SHA256
   "9ef284c462e51581940895f08ab67c56a4f97c4d8d35fe140f0a61e3ee703f88")
  (:PATH
   "raw/cases/fixed-explicit/case-24-record-not-in-files/case-result.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-24-record-not-in-files/case-result.lisp")
   :BYTES 434 :SHA256
   "21e9c6b999bb9636bdb6ddb43132dd81ab0971e18902b9b497f6046dedfc1d0a")
  (:PATH
   "raw/cases/fixed-explicit/case-24-record-not-in-files/observations/report.lisp"
   :SOURCE
   #A((187) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-24-record-not-in-files/observations/report.lisp")
   :BYTES 950 :SHA256
   "0c5a8ef538c31d1248953044758c061852ff7aa10727ddbfc58b4ea44f4da2ad")
  (:PATH
   "raw/cases/fixed-explicit/case-25-duplicate-process-record/case-result.lisp"
   :SOURCE
   #A((184) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-25-duplicate-process-record/case-result.lisp")
   :BYTES 437 :SHA256
   "a136468aa9377f8d81927f3d138c639654318cea0afb21daadcf6695a0481951")
  (:PATH
   "raw/cases/fixed-explicit/case-25-duplicate-process-record/observations/report.lisp"
   :SOURCE
   #A((192) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-25-duplicate-process-record/observations/report.lisp")
   :BYTES 953 :SHA256
   "645ee779aef1f0ec7124f3b4ce65af2f10fec92ae0cffad237c0186238acb5b8")
  (:PATH "raw/cases/fixed-explicit/case-26-wrong-record-kind/case-result.lisp"
   :SOURCE
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-26-wrong-record-kind/case-result.lisp")
   :BYTES 427 :SHA256
   "9202995af091a61d073bd97fd6bd9c0241146b6b32dc8fe3fba96e36afb3d464")
  (:PATH
   "raw/cases/fixed-explicit/case-26-wrong-record-kind/observations/report.lisp"
   :SOURCE
   #A((185) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-26-wrong-record-kind/observations/report.lisp")
   :BYTES 943 :SHA256
   "296f196ad8bf31bf255bb6a8ad9fc0c9bb68ba29cdff1536371d0d8b0ca63aa6")
  (:PATH "raw/cases/fixed-explicit/case-27-nonterminal-record/case-result.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-27-nonterminal-record/case-result.lisp")
   :BYTES 438 :SHA256
   "69630261a43472c2eaf8ef8491dd87d7bc83f9193cf6193964e7348ab047757d")
  (:PATH
   "raw/cases/fixed-explicit/case-27-nonterminal-record/observations/report.lisp"
   :SOURCE
   #A((186) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-27-nonterminal-record/observations/report.lisp")
   :BYTES 952 :SHA256
   "936bfb4b6541116158c1f4a0f8dc758a92b42152b5aad59e3881ec3d13f8ad48")
  (:PATH "raw/cases/fixed-explicit/case-28-nonterminal-record/case-result.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-28-nonterminal-record/case-result.lisp")
   :BYTES 438 :SHA256
   "38b33ac5fc908f578c63e5c31bdd3c8dcd5e2a3d609a9694ccad28c509c0def3")
  (:PATH
   "raw/cases/fixed-explicit/case-28-nonterminal-record/observations/report.lisp"
   :SOURCE
   #A((186) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-28-nonterminal-record/observations/report.lisp")
   :BYTES 952 :SHA256
   "02c762f606bc14ba41de55b3cb1adc9e9dbe1087967ed790300d7106f1e0ef66")
  (:PATH "raw/cases/fixed-explicit/case-29-unfinished-record/case-result.lisp"
   :SOURCE
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-29-unfinished-record/case-result.lisp")
   :BYTES 436 :SHA256
   "9f42bf836dcfa253415434ee98cf970009eec30b5d7974eaf283b652ed4be1f7")
  (:PATH
   "raw/cases/fixed-explicit/case-29-unfinished-record/observations/report.lisp"
   :SOURCE
   #A((185) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-29-unfinished-record/observations/report.lisp")
   :BYTES 950 :SHA256
   "30de9e08decc3282983f8e802d224c048aadec9e7e46f2d42c0051d5c59d55b8")
  (:PATH
   "raw/cases/fixed-explicit/case-30-invalid-record-metadata/case-result.lisp"
   :SOURCE
   #A((183) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-30-invalid-record-metadata/case-result.lisp")
   :BYTES 460 :SHA256
   "48ec904ff1059959715fc49588873479f7c43d30a5a6964d2e94b988db2a6bde")
  (:PATH
   "raw/cases/fixed-explicit/case-30-invalid-record-metadata/observations/report.lisp"
   :SOURCE
   #A((191) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-30-invalid-record-metadata/observations/report.lisp")
   :BYTES 969 :SHA256
   "c0bc216891534d97b60b306232141ef20680a20b9d79aea12985e6e90ef0294f")
  (:PATH
   "raw/cases/fixed-explicit/case-31-ok-with-failing-exit/case-result.lisp"
   :SOURCE
   #A((180) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-31-ok-with-failing-exit/case-result.lisp")
   :BYTES 416 :SHA256
   "57cc7c5035a79105004db94d6648a56a1aab5558e94d3ad1422c3aa977f6b2cb")
  (:PATH
   "raw/cases/fixed-explicit/case-31-ok-with-failing-exit/observations/report.lisp"
   :SOURCE
   #A((188) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-31-ok-with-failing-exit/observations/report.lisp")
   :BYTES 932 :SHA256
   "5d2c169a2852e63592088773862592450d2202569fd7948482a1e6ee8882dff5")
  (:PATH
   "raw/cases/fixed-explicit/case-32-ok-with-changed-source/case-result.lisp"
   :SOURCE
   #A((182) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-32-ok-with-changed-source/case-result.lisp")
   :BYTES 420 :SHA256
   "c18e3dff02715b4f963d3b4353886dda7700daaa8f5c8c14253669418b43868f")
  (:PATH
   "raw/cases/fixed-explicit/case-32-ok-with-changed-source/observations/report.lisp"
   :SOURCE
   #A((190) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-32-ok-with-changed-source/observations/report.lisp")
   :BYTES 936 :SHA256
   "c551f6a8efdda92eba89a78d89d92e107760597854c028e6a36b856371b792b9")
  (:PATH
   "raw/cases/fixed-explicit/case-33-explicit-gzip-payload-required/case-result.lisp"
   :SOURCE
   #A((190) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-33-explicit-gzip-payload-required/case-result.lisp")
   :BYTES 731 :SHA256
   "3d09b89ac6c08e4dcfb11bc49b7c91a636991baccba4650011883fdbf27b0c05")
  (:PATH
   "raw/cases/fixed-explicit/case-33-explicit-gzip-payload-required/observations/report.lisp"
   :SOURCE
   #A((198) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-33-explicit-gzip-payload-required/observations/report.lisp")
   :BYTES 1242 :SHA256
   "82d4c0b33c99fc417c6a1e8aa03878414cf35114b152f6f578e4f166a18deb00")
  (:PATH
   "raw/cases/fixed-explicit/case-34-accessory-descriptor-also-needs-explicit-payload/case-result.lisp"
   :SOURCE
   #A((208) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-34-accessory-descriptor-also-needs-explicit-payload/case-result.lisp")
   :BYTES 785 :SHA256
   "9c8f76dd03c2959e0176cf56b17268015a16ecf0baaaad08c12fe94af2c9122a")
  (:PATH
   "raw/cases/fixed-explicit/case-34-accessory-descriptor-also-needs-explicit-payload/observations/report.lisp"
   :SOURCE
   #A((216) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-34-accessory-descriptor-also-needs-explicit-payload/observations/report.lisp")
   :BYTES 1296 :SHA256
   "c24a4929090db7cabaa0b6260062005defcb2b60c165bb01e70c0852a0cfe56f")
  (:PATH
   "raw/cases/fixed-explicit/case-35-accessory-compressed-record-retained-with-payload/case-result.lisp"
   :SOURCE
   #A((209) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-35-accessory-compressed-record-retained-with-payload/case-result.lisp")
   :BYTES 387 :SHA256
   "17bc6c3c15e77b544d6b3ddd4615b5d628a1adf3be5b3bbfc51ccd66374965e0")
  (:PATH
   "raw/cases/fixed-explicit/case-35-accessory-compressed-record-retained-with-payload/observations/closed-check.log"
   :SOURCE
   #A((222) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-35-accessory-compressed-record-retained-with-payload/observations/closed-check.log")
   :BYTES 1383 :SHA256
   "fa9b49d9f9a85e2d64039d6f89531d54a5af790bfafde8152f024d2c1ab689f7")
  (:PATH
   "raw/cases/fixed-explicit/case-35-accessory-compressed-record-retained-with-payload/observations/report.lisp"
   :SOURCE
   #A((217) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-35-accessory-compressed-record-retained-with-payload/observations/report.lisp")
   :BYTES 7085 :SHA256
   "2144a25d74ebe126e386daaf5e1cac703066209caab5a0947fa95b5146887e14")
  (:PATH
   "raw/cases/fixed-explicit/case-36-gzip-target-must-match-descriptor/case-result.lisp"
   :SOURCE
   #A((193) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-36-gzip-target-must-match-descriptor/case-result.lisp")
   :BYTES 740 :SHA256
   "9022a1c81f1557eb440c4c3b593e810894db6d6dae22ccebb563488f15b9aa97")
  (:PATH
   "raw/cases/fixed-explicit/case-36-gzip-target-must-match-descriptor/observations/report.lisp"
   :SOURCE
   #A((201) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-36-gzip-target-must-match-descriptor/observations/report.lisp")
   :BYTES 1251 :SHA256
   "4d437407848607d66f5b3eb430b5c8e1897fa6bc3dea62a3cbdee072261b0f7e")
  (:PATH
   "raw/cases/fixed-explicit/case-37-descriptor-hash-mismatch/case-result.lisp"
   :SOURCE
   #A((184) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-37-descriptor-hash-mismatch/case-result.lisp")
   :BYTES 872 :SHA256
   "8c60a3242ad4352eef0ae0da036c3f84d1c55ef8029286791c7c3c3e684c58ad")
  (:PATH
   "raw/cases/fixed-explicit/case-37-descriptor-hash-mismatch/observations/report.lisp"
   :SOURCE
   #A((192) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-37-descriptor-hash-mismatch/observations/report.lisp")
   :BYTES 1383 :SHA256
   "48050ee21ce8a78de5f605eecc0caa30f459f966f9440c699aa2cbcf58aed135")
  (:PATH
   "raw/cases/fixed-explicit/case-38-source-leaf-symlink/case-result.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-38-source-leaf-symlink/case-result.lisp")
   :BYTES 628 :SHA256
   "43c793b7730d843174afa0de0bc5993b2988b1edcfedf0f76650610484915997")
  (:PATH
   "raw/cases/fixed-explicit/case-38-source-leaf-symlink/observations/report.lisp"
   :SOURCE
   #A((187) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-38-source-leaf-symlink/observations/report.lisp")
   :BYTES 1137 :SHA256
   "4b0df9028ea231938011a05f2b578d1f209574b234ac5616f5cdbc3fbc2228e6")
  (:PATH
   "raw/cases/fixed-explicit/case-39-plain-budget-exact-boundary/case-result.lisp"
   :SOURCE
   #A((187) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-39-plain-budget-exact-boundary/case-result.lisp")
   :BYTES 347 :SHA256
   "52263a8679e459613af5f97af24be2c737e338251ebb5fb56ef14de280c7ef4c")
  (:PATH
   "raw/cases/fixed-explicit/case-39-plain-budget-exact-boundary/observations/closed-check.log"
   :SOURCE
   #A((200) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-39-plain-budget-exact-boundary/observations/closed-check.log")
   :BYTES 1553 :SHA256
   "3e766753aed9a0bdca560bba28a5e33706f3b9d2da47ff897c4ca42ad72b29e2")
  (:PATH
   "raw/cases/fixed-explicit/case-39-plain-budget-exact-boundary/observations/report.lisp"
   :SOURCE
   #A((195) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-39-plain-budget-exact-boundary/observations/report.lisp")
   :BYTES 7215 :SHA256
   "775984a919f1048ba8d6f8b43b5d3eb76e81afcc24bf6e093df5d541359652a1")
  (:PATH
   "raw/cases/fixed-explicit/case-40-gzip-budget-exact-boundary/case-result.lisp"
   :SOURCE
   #A((186) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-40-gzip-budget-exact-boundary/case-result.lisp")
   :BYTES 344 :SHA256
   "a3c5108bc865022be47849d5d84deb4294bd873c937d10f9e3272420b18991d6")
  (:PATH
   "raw/cases/fixed-explicit/case-40-gzip-budget-exact-boundary/observations/closed-check.log"
   :SOURCE
   #A((199) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-40-gzip-budget-exact-boundary/observations/closed-check.log")
   :BYTES 1552 :SHA256
   "5bfd9d6b31d7a93869a6a994d1d3607df7a1535e2b8a3b784164603c713140b5")
  (:PATH
   "raw/cases/fixed-explicit/case-40-gzip-budget-exact-boundary/observations/report.lisp"
   :SOURCE
   #A((194) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-40-gzip-budget-exact-boundary/observations/report.lisp")
   :BYTES 7202 :SHA256
   "bb6c3b9d88415dbe1bf6f20748748d58383d1e55ba7810f3d03f966f1f8214b6")
  (:PATH "raw/cases/fixed-explicit/case-41-plain-budget-over/case-result.lisp"
   :SOURCE
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-41-plain-budget-over/case-result.lisp")
   :BYTES 418 :SHA256
   "da172b09cde75062c269e146849bb199f9b737330163974341b521db8add0aa4")
  (:PATH
   "raw/cases/fixed-explicit/case-41-plain-budget-over/observations/report.lisp"
   :SOURCE
   #A((185) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-41-plain-budget-over/observations/report.lisp")
   :BYTES 934 :SHA256
   "a0a77e22e4bc7b3a2a7a08b2a487e2c1efe41778bb7284fa7f024042951771dc")
  (:PATH "raw/cases/fixed-explicit/case-42-gzip-budget-over/case-result.lisp"
   :SOURCE
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-42-gzip-budget-over/case-result.lisp")
   :BYTES 415 :SHA256
   "3860ad87496a7348d467e51a31ea239d0a50f245ad931b0b3070e14e3fc8aaf3")
  (:PATH
   "raw/cases/fixed-explicit/case-42-gzip-budget-over/observations/report.lisp"
   :SOURCE
   #A((184) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-42-gzip-budget-over/observations/report.lisp")
   :BYTES 931 :SHA256
   "9b988096f81a8bd8d86a3ab3284873f2b64e20b88e19b7bd2bcb336ffc53bb1e")
  (:PATH
   "raw/cases/fixed-explicit/case-43-existing-destination-never-overwritten/case-result.lisp"
   :SOURCE
   #A((198) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-43-existing-destination-never-overwritten/case-result.lisp")
   :BYTES 634 :SHA256
   "ddb7eb4449eecc2aed2ab0ed78c8f239e5bb0b3e2ae19ffbae2f97a460a9e1ae")
  (:PATH
   "raw/cases/fixed-explicit/case-43-existing-destination-never-overwritten/observations/report.lisp"
   :SOURCE
   #A((206) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-43-existing-destination-never-overwritten/observations/report.lisp")
   :BYTES 1143 :SHA256
   "94d7cbde7bc0501ec9bcfed4cfa0c77a8f4defb1d29a58db36d9d4ea3f9a352b")
  (:PATH
   "raw/cases/fixed-explicit/case-44-existing-observations-never-overwritten/case-result.lisp"
   :SOURCE
   #A((199) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-44-existing-observations-never-overwritten/case-result.lisp")
   :BYTES 644 :SHA256
   "5c59fca139bf400f61698ff5880b13984f52ce502c20519f831b912786fe11d2")
  (:PATH
   "raw/cases/fixed-explicit/case-45-destination-observations-overlap/case-result.lisp"
   :SOURCE
   #A((192) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-45-destination-observations-overlap/case-result.lisp")
   :BYTES 467 :SHA256
   "9e0564e37f65ff1e408603a1d3fbcbdd2d72d94f141f9a42f6cb0f73bd3609ad")
  (:PATH
   "raw/cases/fixed-explicit/case-46-destination-observations-overlap/case-result.lisp"
   :SOURCE
   #A((192) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-46-destination-observations-overlap/case-result.lisp")
   :BYTES 467 :SHA256
   "79f7cd0532189c6b743979f5b1694771bb94c21dbcad2fabd7d96b9ed6e0e4e6")
  (:PATH
   "raw/cases/fixed-explicit/case-47-destination-observations-overlap/case-result.lisp"
   :SOURCE
   #A((192) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-47-destination-observations-overlap/case-result.lisp")
   :BYTES 467 :SHA256
   "4bb3077411dc54edb0ad739c1ea6076c6712d468a0973968c1be1437ec931384")
  (:PATH
   "raw/cases/fixed-explicit/case-48-corrupt-copy-retains-failure/case-result.lisp"
   :SOURCE
   #A((188) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-48-corrupt-copy-retains-failure/case-result.lisp")
   :BYTES 598 :SHA256
   "33b19f335b20364815c344f6703b4c68733c55a36fe460fb658481ba93d9f0c4")
  (:PATH
   "raw/cases/fixed-explicit/case-48-corrupt-copy-retains-failure/observations/report.lisp"
   :SOURCE
   #A((196) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-48-corrupt-copy-retains-failure/observations/report.lisp")
   :BYTES 5513 :SHA256
   "0a54ca25efdba1a052f78a9174111dad15f7482f21664710592760879def8d04")
  (:PATH
   "raw/cases/fixed-explicit/case-49-source-change-retains-failure/case-result.lisp"
   :SOURCE
   #A((189) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-49-source-change-retains-failure/case-result.lisp")
   :BYTES 604 :SHA256
   "f0326f6b943dda31c9e19dc9819b3a705f8e9045e372131644e63bf2e1181de4")
  (:PATH
   "raw/cases/fixed-explicit/case-49-source-change-retains-failure/observations/report.lisp"
   :SOURCE
   #A((197) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-49-source-change-retains-failure/observations/report.lisp")
   :BYTES 5528 :SHA256
   "1fd596e931ae919004dc2d4ef9aca311ecae6d8487edba9effa01a8723a5ffba")
  (:PATH
   "raw/cases/fixed-explicit/case-50-unindexed-extra-rejected-by-final-checker/case-result.lisp"
   :SOURCE
   #A((201) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-50-unindexed-extra-rejected-by-final-checker/case-result.lisp")
   :BYTES 981 :SHA256
   "603e765372131f843b497a4171a58c94456a68a994b9d1915e62f02c1025da61")
  (:PATH
   "raw/cases/fixed-explicit/case-50-unindexed-extra-rejected-by-final-checker/observations/closed-check.log"
   :SOURCE
   #A((214) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-50-unindexed-extra-rejected-by-final-checker/observations/closed-check.log")
   :BYTES 161 :SHA256
   "36c547965bf7e5fb5aac2991d98c4e6f27d0783eb616501721e8f35c9202c18e")
  (:PATH
   "raw/cases/fixed-explicit/case-50-unindexed-extra-rejected-by-final-checker/observations/report.lisp"
   :SOURCE
   #A((209) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-50-unindexed-extra-rejected-by-final-checker/observations/report.lisp")
   :BYTES 5791 :SHA256
   "11af25aac61852178f5e2a72a57f0dab135a54f3ac5d08d75c423f0fd5664017")
  (:PATH
   "raw/cases/fixed-explicit/case-51-manifest-read-eval-disabled/case-result.lisp"
   :SOURCE
   #A((187) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-51-manifest-read-eval-disabled/case-result.lisp")
   :BYTES 775 :SHA256
   "3533ac12f2158f67b6e231530dad94d703078f68c958bc7598398f0989ba31b9")
  (:PATH
   "raw/cases/fixed-explicit/case-51-manifest-read-eval-disabled/observations/report.lisp"
   :SOURCE
   #A((195) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-51-manifest-read-eval-disabled/observations/report.lisp")
   :BYTES 1291 :SHA256
   "952d8fd5d3d517e02b97e28ca8d6d2d8208b7c6f9c03a65dc4fa58c9c8a700af")
  (:PATH
   "raw/cases/fixed-explicit/case-52-manifest-eof-required/case-result.lisp"
   :SOURCE
   #A((181) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-52-manifest-eof-required/case-result.lisp")
   :BYTES 398 :SHA256
   "11d47f47f8c8e05f4c225461e57405d9413a6a33af1f2b42e02e23aaec160476")
  (:PATH
   "raw/cases/fixed-explicit/case-52-manifest-eof-required/observations/report.lisp"
   :SOURCE
   #A((189) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-52-manifest-eof-required/observations/report.lisp")
   :BYTES 910 :SHA256
   "8cc7ae3c6c520740b540448314779124ba41d1e254dae235b178c8e16e53139d")
  (:PATH
   "raw/cases/fixed-explicit/case-53-record-read-eval-disabled/case-result.lisp"
   :SOURCE
   #A((185) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-53-record-read-eval-disabled/case-result.lisp")
   :BYTES 764 :SHA256
   "b3ba6eccbd7d97218471b22a4c8f45d7752763c6143f19722ab33a6f0f92f6e3")
  (:PATH
   "raw/cases/fixed-explicit/case-53-record-read-eval-disabled/observations/report.lisp"
   :SOURCE
   #A((193) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-53-record-read-eval-disabled/observations/report.lisp")
   :BYTES 1280 :SHA256
   "6971cb0bd92252f6f9e048d484bf7c40d3c5db50b793620a0dc4d6280d73966d")
  (:PATH
   "raw/cases/fixed-explicit/case-54-record-eof-required/case-result.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-54-record-eof-required/case-result.lisp")
   :BYTES 394 :SHA256
   "f38bb3e2baec476cd0a62c4d27a133fa10b0de8c8d6b452f89e1cd006f1bd7c1")
  (:PATH
   "raw/cases/fixed-explicit/case-54-record-eof-required/observations/report.lisp"
   :SOURCE
   #A((187) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-54-record-eof-required/observations/report.lisp")
   :BYTES 906 :SHA256
   "d149bfd6c85e4c24dfe3c4bfdd3d8961d3d262c97110b3e08f9ab263c933776b")
  (:PATH "raw/cases/fixed-explicit/case-55-cli-arguments/case-result.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-55-cli-arguments/case-result.lisp")
   :BYTES 267 :SHA256
   "0159b9967795d3456cc885374840ee47fb31d11fe1c578a898395d88268dcbc2")
  (:PATH "raw/cases/fixed-explicit/case-55-cli-arguments/cli.stderr.log"
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-55-cli-arguments/cli.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/cases/fixed-explicit/case-55-cli-arguments/cli.stdout.lisp"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-55-cli-arguments/cli.stdout.lisp")
   :BYTES 224 :SHA256
   "575d9ea7dee0df7b80717f1310e60022e9d079b983fcd26635adb5ea5111cace")
  (:PATH "raw/cases/fixed-explicit/case-56-cli-arguments/case-result.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-56-cli-arguments/case-result.lisp")
   :BYTES 267 :SHA256
   "0a0e0bf799501d9309f432998434aca7214b7e20834ff72910b6d3b81f0acf0a")
  (:PATH "raw/cases/fixed-explicit/case-56-cli-arguments/cli.stderr.log"
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-56-cli-arguments/cli.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/cases/fixed-explicit/case-56-cli-arguments/cli.stdout.lisp"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-56-cli-arguments/cli.stdout.lisp")
   :BYTES 224 :SHA256
   "575d9ea7dee0df7b80717f1310e60022e9d079b983fcd26635adb5ea5111cace")
  (:PATH "raw/cases/fixed-explicit/case-57-cli-arguments/case-result.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-57-cli-arguments/case-result.lisp")
   :BYTES 267 :SHA256
   "f34e896e86f642b3fd1c985e8238691345c82e40ee9d950e799f300772ac9c5b")
  (:PATH "raw/cases/fixed-explicit/case-57-cli-arguments/cli.stderr.log"
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-57-cli-arguments/cli.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/cases/fixed-explicit/case-57-cli-arguments/cli.stdout.lisp"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-57-cli-arguments/cli.stdout.lisp")
   :BYTES 224 :SHA256
   "575d9ea7dee0df7b80717f1310e60022e9d079b983fcd26635adb5ea5111cace")
  (:PATH "raw/cases/fixed-explicit/case-58-cli-arguments/case-result.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-58-cli-arguments/case-result.lisp")
   :BYTES 267 :SHA256
   "4691dd4988e3b7b866b2a2e10178eb074d27e0d6191e6a209f09ac3ad3b142db")
  (:PATH "raw/cases/fixed-explicit/case-58-cli-arguments/cli.stderr.log"
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-58-cli-arguments/cli.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/cases/fixed-explicit/case-58-cli-arguments/cli.stdout.lisp"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-58-cli-arguments/cli.stdout.lisp")
   :BYTES 224 :SHA256
   "575d9ea7dee0df7b80717f1310e60022e9d079b983fcd26635adb5ea5111cace")
  (:PATH "raw/cases/fixed-explicit/case-59-cli-arguments/case-result.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-59-cli-arguments/case-result.lisp")
   :BYTES 267 :SHA256
   "5171e5c24431fb63a2a63a313a2e387597d21623bd24d83d3b3ba7b81dff9518")
  (:PATH "raw/cases/fixed-explicit/case-59-cli-arguments/cli.stderr.log"
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-59-cli-arguments/cli.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/cases/fixed-explicit/case-59-cli-arguments/cli.stdout.lisp"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-59-cli-arguments/cli.stdout.lisp")
   :BYTES 224 :SHA256
   "575d9ea7dee0df7b80717f1310e60022e9d079b983fcd26635adb5ea5111cace")
  (:PATH "raw/cases/fixed-explicit/self-test-report.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/self-test-report.lisp")
   :BYTES 28759 :SHA256
   "dd03612e092444df2f040bf700069982d5579bf6d3f6f0fbd0e833b83501c036")
  (:PATH
   "raw/cases/initial-default/case-01-explicit-closed-parallel-history/case-result.lisp"
   :SOURCE
   #A((184) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-01-explicit-closed-parallel-history/case-result.lisp")
   :BYTES 406 :SHA256
   "32e0c2970b819e431640042f31af531bbc335ef716edd92bb8c4906a7b47d8b1")
  (:PATH "raw/cases/initial-default/case-02-schema-version/case-result.lisp"
   :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-02-schema-version/case-result.lisp")
   :BYTES 405 :SHA256
   "e200fa74a4ed9b9683bc7f95710a2e6ce7f241682b095190c1437603f73e58aa")
  (:PATH "raw/cases/initial-default/case-03-manifest-kind/case-result.lisp"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-03-manifest-kind/case-result.lisp")
   :BYTES 403 :SHA256
   "e0d4b1495213545f5278c72c6e5e217fe0b4311163a046de04b774f35f2f8e8f")
  (:PATH "raw/cases/initial-default/case-04-date-format/case-result.lisp"
   :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-04-date-format/case-result.lisp")
   :BYTES 399 :SHA256
   "71a08597d4d6d6c0137f9fa85347f697695ff8f92327a7f0505975304c60bd29")
  (:PATH "raw/cases/initial-default/case-05-unknown-trees/case-result.lisp"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-05-unknown-trees/case-result.lisp")
   :BYTES 398 :SHA256
   "d30f93bdc3ecdb088d948be3ab0b41a7046922c3f33132610aaa6d4a6480c802")
  (:PATH
   "raw/cases/initial-default/case-06-duplicate-manifest-key/case-result.lisp"
   :SOURCE
   #A((174) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-06-duplicate-manifest-key/case-result.lisp")
   :BYTES 421 :SHA256
   "83321691d8789d4b78a6b138765bb18d88c4b421968e176659b4b94c1588d8ee")
  (:PATH "raw/cases/initial-default/case-07-relative-target/case-result.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-07-relative-target/case-result.lisp")
   :BYTES 404 :SHA256
   "4203254a1b10cef75a7c1a26f3f85ca71be92795a8c51a3328b77590c0233e7c")
  (:PATH "raw/cases/initial-default/case-08-relative-target/case-result.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-08-relative-target/case-result.lisp")
   :BYTES 404 :SHA256
   "91911bc9fcc2581ed924a09f144f73b39a1cc6cddce5ae7abe3b60bffc72476f")
  (:PATH "raw/cases/initial-default/case-09-relative-target/case-result.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-09-relative-target/case-result.lisp")
   :BYTES 404 :SHA256
   "81823a5700b69070ffa699310373f2b7fbddc8e79c1e3b9357a4b6959f37d886")
  (:PATH "raw/cases/initial-default/case-10-relative-target/case-result.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-10-relative-target/case-result.lisp")
   :BYTES 405 :SHA256
   "b2953c1d77e934f82ad3df29f5e70411c77db4b7e1fa88f68febceb64bf544e3")
  (:PATH "raw/cases/initial-default/case-11-relative-target/case-result.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-11-relative-target/case-result.lisp")
   :BYTES 405 :SHA256
   "2b21bfa733f75409c6fa5c7a58aa2d43c974735de72462e75b05955a284365a1")
  (:PATH "raw/cases/initial-default/case-12-relative-target/case-result.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-12-relative-target/case-result.lisp")
   :BYTES 405 :SHA256
   "31bc3a9aee9f4898311e2aff4d215d91268aa57b66b44338e1c7f2833371d604")
  (:PATH "raw/cases/initial-default/case-13-reserved-target/case-result.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-13-reserved-target/case-result.lisp")
   :BYTES 408 :SHA256
   "6c539c6c4ae22beaaa8f6a476cb33441910fc64b2d2e43828abc5812b6136466")
  (:PATH "raw/cases/initial-default/case-14-reserved-target/case-result.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-14-reserved-target/case-result.lisp")
   :BYTES 408 :SHA256
   "e2f91b1dc6f792432be10aa3cf652ccd6d6aa401ca3264db8eab0bcf130d6772")
  (:PATH "raw/cases/initial-default/case-15-reserved-target/case-result.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-15-reserved-target/case-result.lisp")
   :BYTES 408 :SHA256
   "5d8c1ce79734148363a688d4347b7f6a41b74eeefa5fcbded19ae53dbfcf33da")
  (:PATH "raw/cases/initial-default/case-16-reserved-target/case-result.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-16-reserved-target/case-result.lisp")
   :BYTES 408 :SHA256
   "32ce4e03412b275c181b7e217de1707f874d49afdd81bb87d60292822b0301bb")
  (:PATH "raw/cases/initial-default/case-17-duplicate-target/case-result.lisp"
   :SOURCE
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-17-duplicate-target/case-result.lisp")
   :BYTES 412 :SHA256
   "2fbfc963c0de8989a5ca356610bb5ffea2fb915b515e4de1c060becc0ebcd0e0")
  (:PATH
   "raw/cases/initial-default/case-18-file-directory-collision/case-result.lisp"
   :SOURCE
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-18-file-directory-collision/case-result.lisp")
   :BYTES 425 :SHA256
   "569c2bb9fe21372449dd975fa273dad8de8936f7f6592441d618a06dcc70d071")
  (:PATH
   "raw/cases/initial-default/case-19-unknown-file-field/case-result.lisp"
   :SOURCE
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-19-unknown-file-field/case-result.lisp")
   :BYTES 409 :SHA256
   "8e29e9a5814469a75cf2eb2b63a724295e66c55290f6d5653120abbeb4075172")
  (:PATH
   "raw/cases/initial-default/case-20-unknown-process-field/case-result.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-20-unknown-process-field/case-result.lisp")
   :BYTES 415 :SHA256
   "dae4107cd0d160bf04d7b737cdb7c3b2bf8d614fb5ad3df4883f08be3b50d915")
  (:PATH
   "raw/cases/initial-default/case-21-invalid-process-label/case-result.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-21-invalid-process-label/case-result.lisp")
   :BYTES 418 :SHA256
   "14178884570de69b2478f3e062faa997b6248d14bd84fd9d4bd45de16d15121d")
  (:PATH
   "raw/cases/initial-default/case-22-invalid-process-label/case-result.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-22-invalid-process-label/case-result.lisp")
   :BYTES 418 :SHA256
   "059ffad36ad39adbd8a2f90d530c590e0871ba426eae3e4452330a62c95ca632")
  (:PATH
   "raw/cases/initial-default/case-23-duplicate-process-label/case-result.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-23-duplicate-process-label/case-result.lisp")
   :BYTES 422 :SHA256
   "d0c68e901fdaece25842347bdb5e70bf5a019fe3f4d6c549dcd61e03c8c952b2")
  (:PATH
   "raw/cases/initial-default/case-24-record-not-in-files/case-result.lisp"
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-24-record-not-in-files/case-result.lisp")
   :BYTES 415 :SHA256
   "42116ea5ed7df6b2cc895e8ac5e73094794855d02bb972be97f49e45be033736")
  (:PATH
   "raw/cases/initial-default/case-25-duplicate-process-record/case-result.lisp"
   :SOURCE
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-25-duplicate-process-record/case-result.lisp")
   :BYTES 425 :SHA256
   "5a5dd9dc9b59530114901c7a9497efea51129dd560466b1b5dfeb32a6101315b")
  (:PATH "raw/cases/initial-default/case-26-wrong-record-kind/case-result.lisp"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-26-wrong-record-kind/case-result.lisp")
   :BYTES 411 :SHA256
   "91f9f4f885808d4473fd121d9eb41546779693d562f281d59ad6ad152351b75d")
  (:PATH
   "raw/cases/initial-default/case-27-nonterminal-record/case-result.lisp"
   :SOURCE
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-27-nonterminal-record/case-result.lisp")
   :BYTES 418 :SHA256
   "5ecb9f98bd101e44e2fe3140f80e00d2910cdb89152937f0535ea0af438ab7c8")
  (:PATH
   "raw/cases/initial-default/case-28-nonterminal-record/case-result.lisp"
   :SOURCE
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-28-nonterminal-record/case-result.lisp")
   :BYTES 418 :SHA256
   "99ee39297b19520d8ef4e6e9df1c33f4b72ec623815b5442024fe1a7ca24e27d")
  (:PATH "raw/cases/initial-default/case-29-unfinished-record/case-result.lisp"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-29-unfinished-record/case-result.lisp")
   :BYTES 416 :SHA256
   "ae6f32ff459e3532f08e9762d225a870485d743c56504441d29540a87690ce47")
  (:PATH
   "raw/cases/initial-default/case-30-invalid-record-metadata/case-result.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-30-invalid-record-metadata/case-result.lisp")
   :BYTES 426 :SHA256
   "15aa2a50d78d6c81c4559979b95cc40e771089fb4d18d81864485670276dbe40")
  (:PATH
   "raw/cases/initial-default/case-31-ok-with-failing-exit/case-result.lisp"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-31-ok-with-failing-exit/case-result.lisp")
   :BYTES 420 :SHA256
   "f9d9fc758312c02a52663391888f65d5d2b5aee3108f857a41e128142b5f28bf")
  (:PATH
   "raw/cases/initial-default/case-32-ok-with-changed-source/case-result.lisp"
   :SOURCE
   #A((174) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-32-ok-with-changed-source/case-result.lisp")
   :BYTES 424 :SHA256
   "952d0df554b99b301cb3873cb09d2e045311d0d371b63bdfb9ec30c7884b9aae")
  (:PATH
   "raw/cases/initial-default/case-33-explicit-gzip-payload-required/case-result.lisp"
   :SOURCE
   #A((182) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-33-explicit-gzip-payload-required/case-result.lisp")
   :BYTES 437 :SHA256
   "6d589afe4902cd3656877f24eaf81062e81189a26fda2629f7a75b7eeb97a15a")
  (:PATH
   "raw/cases/initial-default/case-34-accessory-descriptor-also-needs-explicit-payload/case-result.lisp"
   :SOURCE
   #A((200) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-34-accessory-descriptor-also-needs-explicit-payload/case-result.lisp")
   :BYTES 474 :SHA256
   "1b4353770e9c334c924e5f8705a149d31ad2bcae101ac6807b86ace1c6d2a3ad")
  (:PATH
   "raw/cases/initial-default/case-35-accessory-compressed-record-retained-with-payload/case-result.lisp"
   :SOURCE
   #A((201) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-35-accessory-compressed-record-retained-with-payload/case-result.lisp")
   :BYTES 442 :SHA256
   "4b00eb470d861b8d2edcc0ee5de77bd537b2c4588507f078b86fd02e3900464f")
  (:PATH
   "raw/cases/initial-default/case-36-gzip-target-must-match-descriptor/case-result.lisp"
   :SOURCE
   #A((185) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-36-gzip-target-must-match-descriptor/case-result.lisp")
   :BYTES 443 :SHA256
   "26dc1a2f5221c2ae4b4b2abe374caee143a3430acdec35d78279b68aab1fe354")
  (:PATH
   "raw/cases/initial-default/case-37-descriptor-hash-mismatch/case-result.lisp"
   :SOURCE
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-37-descriptor-hash-mismatch/case-result.lisp")
   :BYTES 425 :SHA256
   "3749ccc01967b9c23af4e3df666fa1df8105b30d2ea84d490c08ad91abe5673c")
  (:PATH
   "raw/cases/initial-default/case-38-source-leaf-symlink/case-result.lisp"
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-38-source-leaf-symlink/case-result.lisp")
   :BYTES 419 :SHA256
   "bbb8425a16859c502f186e808d7addcce193db16610156dddb8d4f9f1c0b0aa3")
  (:PATH
   "raw/cases/initial-default/case-39-plain-budget-exact-boundary/case-result.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-39-plain-budget-exact-boundary/case-result.lisp")
   :BYTES 397 :SHA256
   "25ed82d62db095aabe4bb20290e5130a5472887e580248cb60f86fc2e700ea29")
  (:PATH
   "raw/cases/initial-default/case-40-gzip-budget-exact-boundary/case-result.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-40-gzip-budget-exact-boundary/case-result.lisp")
   :BYTES 395 :SHA256
   "1dbaf3ce232691e2b0733136798bd3b506d89807b15a8d8313c56cf820382aa6")
  (:PATH "raw/cases/initial-default/case-41-plain-budget-over/case-result.lisp"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-41-plain-budget-over/case-result.lisp")
   :BYTES 408 :SHA256
   "36d95630004e234548f39a92330976fc1b4d7a6471f919552ce248e4749a1a11")
  (:PATH "raw/cases/initial-default/case-42-gzip-budget-over/case-result.lisp"
   :SOURCE
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-42-gzip-budget-over/case-result.lisp")
   :BYTES 406 :SHA256
   "a80da23d721c5081fdc6a3c2d68a9a32237f0c60c1cce30e95788a1f214e5fd0")
  (:PATH
   "raw/cases/initial-default/case-43-existing-destination-never-overwritten/case-result.lisp"
   :SOURCE
   #A((190) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-43-existing-destination-never-overwritten/case-result.lisp")
   :BYTES 460 :SHA256
   "d6b640aa626c97d05491ded0e6e9651b1802feb18760c2da6dde1110c1bae704")
  (:PATH
   "raw/cases/initial-default/case-44-existing-observations-never-overwritten/case-result.lisp"
   :SOURCE
   #A((191) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-44-existing-observations-never-overwritten/case-result.lisp")
   :BYTES 463 :SHA256
   "ad513ae7051cea877f638bb3480589e10aa11ce5df2d241088d51bbba906866a")
  (:PATH
   "raw/cases/initial-default/case-45-destination-observations-overlap/case-result.lisp"
   :SOURCE
   #A((184) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-45-destination-observations-overlap/case-result.lisp")
   :BYTES 439 :SHA256
   "eb468762b1021074888472f339e8bd02cb1eff7786e96ce50933659844cc5372")
  (:PATH
   "raw/cases/initial-default/case-46-destination-observations-overlap/case-result.lisp"
   :SOURCE
   #A((184) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-46-destination-observations-overlap/case-result.lisp")
   :BYTES 439 :SHA256
   "95cc0fe00705fd10a894a1af710d7e8ed045940f75326120ce45ddaa2092b7bd")
  (:PATH
   "raw/cases/initial-default/case-47-destination-observations-overlap/case-result.lisp"
   :SOURCE
   #A((184) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-47-destination-observations-overlap/case-result.lisp")
   :BYTES 439 :SHA256
   "f8de42188f181bfe71c3e988bf41af99ffb3005be77fe65ebd6f44c3a730741c")
  (:PATH
   "raw/cases/initial-default/case-48-corrupt-copy-retains-failure/case-result.lisp"
   :SOURCE
   #A((180) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-48-corrupt-copy-retains-failure/case-result.lisp")
   :BYTES 431 :SHA256
   "a5d2bbe2176cc01a837abfe85882cd88a3e914f05000110a1d243ff2df7f4a78")
  (:PATH
   "raw/cases/initial-default/case-49-source-change-retains-failure/case-result.lisp"
   :SOURCE
   #A((181) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-49-source-change-retains-failure/case-result.lisp")
   :BYTES 435 :SHA256
   "1fbcfd0777a11a9ee52ba6209627bb4fb181e5b9904ccd22bf62f1a5252dcd62")
  (:PATH
   "raw/cases/initial-default/case-50-unindexed-extra-rejected-by-final-checker/case-result.lisp"
   :SOURCE
   #A((193) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-50-unindexed-extra-rejected-by-final-checker/case-result.lisp")
   :BYTES 457 :SHA256
   "d8c531ad31f47375b7f0e0e714a40e3d9fdd76bfc70d5117af559051187ba8ae")
  (:PATH
   "raw/cases/initial-default/case-51-manifest-read-eval-disabled/case-result.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-51-manifest-read-eval-disabled/case-result.lisp")
   :BYTES 427 :SHA256
   "76361b372c73fc8b6382b7ae9fa903a38a430ca2d85f65fc829ad471c842e6cb")
  (:PATH
   "raw/cases/initial-default/case-52-manifest-eof-required/case-result.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-52-manifest-eof-required/case-result.lisp")
   :BYTES 415 :SHA256
   "336395005be397dbabcb1c19ebf1eb0dea9318ae6d12ef53f4eeeebab6644860")
  (:PATH
   "raw/cases/initial-default/case-53-record-read-eval-disabled/case-result.lisp"
   :SOURCE
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-53-record-read-eval-disabled/case-result.lisp")
   :BYTES 423 :SHA256
   "e4ee5d82e9bb07daf1702af321c58f78cd1c76f95c549a43bf94a551f7f2df73")
  (:PATH
   "raw/cases/initial-default/case-54-record-eof-required/case-result.lisp"
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-54-record-eof-required/case-result.lisp")
   :BYTES 411 :SHA256
   "6fb58b98d1996f67ac43177f5803d33d2d40aa271f5105ea5a2894fa16f5f660")
  (:PATH "raw/cases/initial-default/case-55-cli-arguments/case-result.lisp"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-55-cli-arguments/case-result.lisp")
   :BYTES 268 :SHA256
   "57878a8c06746c30780e9249dab79a296c2370ecabfdd25453422fdb11bfd8aa")
  (:PATH "raw/cases/initial-default/case-55-cli-arguments/cli.stderr.log"
   :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-55-cli-arguments/cli.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/cases/initial-default/case-55-cli-arguments/cli.stdout.lisp"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-55-cli-arguments/cli.stdout.lisp")
   :BYTES 224 :SHA256
   "575d9ea7dee0df7b80717f1310e60022e9d079b983fcd26635adb5ea5111cace")
  (:PATH "raw/cases/initial-default/case-56-cli-arguments/case-result.lisp"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-56-cli-arguments/case-result.lisp")
   :BYTES 268 :SHA256
   "e047ee17a0286e81868588857374a2ea6033756211dc0e3c70a593ad411ddd31")
  (:PATH "raw/cases/initial-default/case-56-cli-arguments/cli.stderr.log"
   :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-56-cli-arguments/cli.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/cases/initial-default/case-56-cli-arguments/cli.stdout.lisp"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-56-cli-arguments/cli.stdout.lisp")
   :BYTES 224 :SHA256
   "575d9ea7dee0df7b80717f1310e60022e9d079b983fcd26635adb5ea5111cace")
  (:PATH "raw/cases/initial-default/case-57-cli-arguments/case-result.lisp"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-57-cli-arguments/case-result.lisp")
   :BYTES 268 :SHA256
   "f25728ecfb35e2b22269c5dc9ce2d1c762d85f4592baf78079612a8525bbeaaf")
  (:PATH "raw/cases/initial-default/case-57-cli-arguments/cli.stderr.log"
   :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-57-cli-arguments/cli.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/cases/initial-default/case-57-cli-arguments/cli.stdout.lisp"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-57-cli-arguments/cli.stdout.lisp")
   :BYTES 224 :SHA256
   "575d9ea7dee0df7b80717f1310e60022e9d079b983fcd26635adb5ea5111cace")
  (:PATH "raw/cases/initial-default/case-58-cli-arguments/case-result.lisp"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-58-cli-arguments/case-result.lisp")
   :BYTES 268 :SHA256
   "c584f3f1a94b3ed6a48dff05031adb69714514a76ff6b99b51bf92396496b2ce")
  (:PATH "raw/cases/initial-default/case-58-cli-arguments/cli.stderr.log"
   :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-58-cli-arguments/cli.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/cases/initial-default/case-58-cli-arguments/cli.stdout.lisp"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-58-cli-arguments/cli.stdout.lisp")
   :BYTES 224 :SHA256
   "575d9ea7dee0df7b80717f1310e60022e9d079b983fcd26635adb5ea5111cace")
  (:PATH "raw/cases/initial-default/case-59-cli-arguments/case-result.lisp"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-59-cli-arguments/case-result.lisp")
   :BYTES 268 :SHA256
   "566b98e6d8495cf0a2393879bcf21fce0a6f1c63edfe242742d7b8565a670a79")
  (:PATH "raw/cases/initial-default/case-59-cli-arguments/cli.stderr.log"
   :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-59-cli-arguments/cli.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/cases/initial-default/case-59-cli-arguments/cli.stdout.lisp"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/case-59-cli-arguments/cli.stdout.lisp")
   :BYTES 224 :SHA256
   "575d9ea7dee0df7b80717f1310e60022e9d079b983fcd26635adb5ea5111cace")
  (:PATH "raw/cases/initial-default/self-test-report.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/self-test-report.lisp")
   :BYTES 24940 :SHA256
   "1b5b02a419a0cf955a0141e33b6915c7ed725ecf79aae7af7cc7040a79d41843")
  (:PATH
   "raw/cases/initial-explicit/case-01-explicit-closed-parallel-history/case-result.lisp"
   :SOURCE
   #A((194) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-01-explicit-closed-parallel-history/case-result.lisp")
   :BYTES 407 :SHA256
   "20ac8f7b25b0f6396d35a61077f54edc4449d19cc392823d31de6c31927863e6")
  (:PATH "raw/cases/initial-explicit/case-02-schema-version/case-result.lisp"
   :SOURCE
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-02-schema-version/case-result.lisp")
   :BYTES 406 :SHA256
   "87ff57c26425524bd8f31a11856aa9f022fb1079375752754e27d8fc63512e61")
  (:PATH "raw/cases/initial-explicit/case-03-manifest-kind/case-result.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-03-manifest-kind/case-result.lisp")
   :BYTES 404 :SHA256
   "0dd8581ea268df0f42050f3b9cac35415bab87e636e787118ee0f675836588fe")
  (:PATH "raw/cases/initial-explicit/case-04-date-format/case-result.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-04-date-format/case-result.lisp")
   :BYTES 400 :SHA256
   "a74cee7d05d34f02ada2d04b550e832983c8c26955149bbdc3f89f280e0df373")
  (:PATH "raw/cases/initial-explicit/case-05-unknown-trees/case-result.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-05-unknown-trees/case-result.lisp")
   :BYTES 399 :SHA256
   "888537a037d417755e6ccd82249900315688c1739330eb37702230c21087941c")
  (:PATH
   "raw/cases/initial-explicit/case-06-duplicate-manifest-key/case-result.lisp"
   :SOURCE
   #A((184) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-06-duplicate-manifest-key/case-result.lisp")
   :BYTES 422 :SHA256
   "cd1d70d41d8b35d9e5d75515a5a359a67ef6be087e37883161a64c0bcbe8dafd")
  (:PATH "raw/cases/initial-explicit/case-07-relative-target/case-result.lisp"
   :SOURCE
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-07-relative-target/case-result.lisp")
   :BYTES 405 :SHA256
   "ef5eacea0a7e812d3d01de9a8f24f8ef8673a5a374a78869fe4efb04ba8a19b1")
  (:PATH "raw/cases/initial-explicit/case-08-relative-target/case-result.lisp"
   :SOURCE
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-08-relative-target/case-result.lisp")
   :BYTES 405 :SHA256
   "2cc4590a0fb3de0c78425ba8a74ff07bf1561299868c4444d19ec588cf7d6796")
  (:PATH "raw/cases/initial-explicit/case-09-relative-target/case-result.lisp"
   :SOURCE
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-09-relative-target/case-result.lisp")
   :BYTES 405 :SHA256
   "4a2d8fa3da0da53972926c4004e85e0818f79f2efe245c401dfc7766b981abfe")
  (:PATH "raw/cases/initial-explicit/case-10-relative-target/case-result.lisp"
   :SOURCE
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-10-relative-target/case-result.lisp")
   :BYTES 406 :SHA256
   "26852bdc1244861ee13bde8fac6934f38e6473ca735cc9cd36ebc0bf5315011e")
  (:PATH "raw/cases/initial-explicit/case-11-relative-target/case-result.lisp"
   :SOURCE
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-11-relative-target/case-result.lisp")
   :BYTES 406 :SHA256
   "939e2112614d408d9e0f7a1ce776e009b37fdef3aded241d6cac17dc6364f4b4")
  (:PATH "raw/cases/initial-explicit/case-12-relative-target/case-result.lisp"
   :SOURCE
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-12-relative-target/case-result.lisp")
   :BYTES 406 :SHA256
   "3c4fd559662e31b39c30c8d9b2022817b6240085777f2f4a7edd7e97090c3bb3")
  (:PATH "raw/cases/initial-explicit/case-13-reserved-target/case-result.lisp"
   :SOURCE
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-13-reserved-target/case-result.lisp")
   :BYTES 409 :SHA256
   "2e3e941881aa7a0c0e6542737d42d4e8c9c9439006f8173ab8b06e1aaa9b379e")
  (:PATH "raw/cases/initial-explicit/case-14-reserved-target/case-result.lisp"
   :SOURCE
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-14-reserved-target/case-result.lisp")
   :BYTES 409 :SHA256
   "ebcfc57b2eba6c86cb426c12fcc8060a00ecf1241393e042ed0bf6c2cd5b4461")
  (:PATH "raw/cases/initial-explicit/case-15-reserved-target/case-result.lisp"
   :SOURCE
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-15-reserved-target/case-result.lisp")
   :BYTES 409 :SHA256
   "8c02400c9d28d790842c1d70adad6fd7f8628d6a066395dacfde7521fa7c4207")
  (:PATH "raw/cases/initial-explicit/case-16-reserved-target/case-result.lisp"
   :SOURCE
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-16-reserved-target/case-result.lisp")
   :BYTES 409 :SHA256
   "f784f95bb67e73a3ff8f0d3c5b50e5758f497069ecdef73e5ecec43cb969d6a9")
  (:PATH "raw/cases/initial-explicit/case-17-duplicate-target/case-result.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-17-duplicate-target/case-result.lisp")
   :BYTES 413 :SHA256
   "99cada29e4cba2c0c871e85d83c28f19f32febee610c0bf51d441674801f230b")
  (:PATH
   "raw/cases/initial-explicit/case-18-file-directory-collision/case-result.lisp"
   :SOURCE
   #A((186) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-18-file-directory-collision/case-result.lisp")
   :BYTES 426 :SHA256
   "23bebcd58c02ec16dd46fafe493010fde94e4f1b72df098d319ef9fca31412bc")
  (:PATH
   "raw/cases/initial-explicit/case-19-unknown-file-field/case-result.lisp"
   :SOURCE
   #A((180) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-19-unknown-file-field/case-result.lisp")
   :BYTES 410 :SHA256
   "772292311cf44d791eceeae2cf17b446bacc957ddc0d628dcf0acd5dd6bc1409")
  (:PATH
   "raw/cases/initial-explicit/case-20-unknown-process-field/case-result.lisp"
   :SOURCE
   #A((183) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-20-unknown-process-field/case-result.lisp")
   :BYTES 416 :SHA256
   "7f2131d1accb7fc0793e4b7c1e54049dc3e7e6064a7df6cfe5d5c0f35dfcc44a")
  (:PATH
   "raw/cases/initial-explicit/case-21-invalid-process-label/case-result.lisp"
   :SOURCE
   #A((183) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-21-invalid-process-label/case-result.lisp")
   :BYTES 419 :SHA256
   "40b1ab323f5e3b066a48c858fe558c2fa9f21b3981ccefd90c46f704a5a3f622")
  (:PATH
   "raw/cases/initial-explicit/case-22-invalid-process-label/case-result.lisp"
   :SOURCE
   #A((183) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-22-invalid-process-label/case-result.lisp")
   :BYTES 419 :SHA256
   "1a0be218f1d0cb53edfbbbea6bb248cd9c0dc9b8d169cf1f5a3cea5afc5e6bb5")
  (:PATH
   "raw/cases/initial-explicit/case-23-duplicate-process-label/case-result.lisp"
   :SOURCE
   #A((185) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-23-duplicate-process-label/case-result.lisp")
   :BYTES 423 :SHA256
   "78cf214d1b47f62aa1206f2c8f60934e52b6aedb2aa44cdf4b498b3fbe067391")
  (:PATH
   "raw/cases/initial-explicit/case-24-record-not-in-files/case-result.lisp"
   :SOURCE
   #A((181) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-24-record-not-in-files/case-result.lisp")
   :BYTES 416 :SHA256
   "5ed637b3d8a6a189a8a980df20d3c97d9e7df40e364d394cabc3dd79480e0f8e")
  (:PATH
   "raw/cases/initial-explicit/case-25-duplicate-process-record/case-result.lisp"
   :SOURCE
   #A((186) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-25-duplicate-process-record/case-result.lisp")
   :BYTES 426 :SHA256
   "e4bd525dff7d12663ec7e227601e2b6bc00447effd861818f983449b4a859ca8")
  (:PATH
   "raw/cases/initial-explicit/case-26-wrong-record-kind/case-result.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-26-wrong-record-kind/case-result.lisp")
   :BYTES 412 :SHA256
   "9f45a3373dddae06f660c30706ac91f0cbe4a2e57d3c3a68823a9594da826e8b")
  (:PATH
   "raw/cases/initial-explicit/case-27-nonterminal-record/case-result.lisp"
   :SOURCE
   #A((180) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-27-nonterminal-record/case-result.lisp")
   :BYTES 419 :SHA256
   "e0eb52e6d30def9a55f3a7751631a3e5b90b603c08a17be70c41d3ef8ea19c66")
  (:PATH
   "raw/cases/initial-explicit/case-28-nonterminal-record/case-result.lisp"
   :SOURCE
   #A((180) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-28-nonterminal-record/case-result.lisp")
   :BYTES 419 :SHA256
   "088362600895a67f3bdeb3d977e60eb5784d7aa0e66753b28da12c1f96def630")
  (:PATH
   "raw/cases/initial-explicit/case-29-unfinished-record/case-result.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-29-unfinished-record/case-result.lisp")
   :BYTES 417 :SHA256
   "952b392e97c6d7cf35ffe8dfd1175b9b84e6cc626566b7bb692971e796dec17e")
  (:PATH
   "raw/cases/initial-explicit/case-30-invalid-record-metadata/case-result.lisp"
   :SOURCE
   #A((185) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-30-invalid-record-metadata/case-result.lisp")
   :BYTES 427 :SHA256
   "ded4b8148f301637d104bbad5a84ee6dd986f924a94a53e0cc52147e52204877")
  (:PATH
   "raw/cases/initial-explicit/case-31-ok-with-failing-exit/case-result.lisp"
   :SOURCE
   #A((182) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-31-ok-with-failing-exit/case-result.lisp")
   :BYTES 421 :SHA256
   "752f0a7ac9d23bcc646030332888f99abe5e791d5f304bc6a05e4f640f706e60")
  (:PATH
   "raw/cases/initial-explicit/case-32-ok-with-changed-source/case-result.lisp"
   :SOURCE
   #A((184) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-32-ok-with-changed-source/case-result.lisp")
   :BYTES 425 :SHA256
   "692b2345d85d821424e75e001506736f0d0d7bb56abf4f17ebc9d2911d2a6edd")
  (:PATH
   "raw/cases/initial-explicit/case-33-explicit-gzip-payload-required/case-result.lisp"
   :SOURCE
   #A((192) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-33-explicit-gzip-payload-required/case-result.lisp")
   :BYTES 438 :SHA256
   "d0f4a7ee53811021813aa3fcc301f54c67ae12ebf4a40dd6698954ca0eae94be")
  (:PATH
   "raw/cases/initial-explicit/case-34-accessory-descriptor-also-needs-explicit-payload/case-result.lisp"
   :SOURCE
   #A((210) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-34-accessory-descriptor-also-needs-explicit-payload/case-result.lisp")
   :BYTES 475 :SHA256
   "91ba800bd66898f7cde4368e6136d8f5a254e2b2e7c187641682b469fe1f3228")
  (:PATH
   "raw/cases/initial-explicit/case-35-accessory-compressed-record-retained-with-payload/case-result.lisp"
   :SOURCE
   #A((211) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-35-accessory-compressed-record-retained-with-payload/case-result.lisp")
   :BYTES 443 :SHA256
   "2948ad500d7568f9cca48067530dc44f2568878094be82335dda097574cc05e2")
  (:PATH
   "raw/cases/initial-explicit/case-36-gzip-target-must-match-descriptor/case-result.lisp"
   :SOURCE
   #A((195) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-36-gzip-target-must-match-descriptor/case-result.lisp")
   :BYTES 444 :SHA256
   "7acde4e4333b82aa84857faee116c3429a299d50b63c8687475e770ec1e6729f")
  (:PATH
   "raw/cases/initial-explicit/case-37-descriptor-hash-mismatch/case-result.lisp"
   :SOURCE
   #A((186) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-37-descriptor-hash-mismatch/case-result.lisp")
   :BYTES 426 :SHA256
   "5ec35f623a6b790ad431fd0e1cc945edf28a778420240e69ebb700de0ad7fe5a")
  (:PATH
   "raw/cases/initial-explicit/case-38-source-leaf-symlink/case-result.lisp"
   :SOURCE
   #A((181) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-38-source-leaf-symlink/case-result.lisp")
   :BYTES 420 :SHA256
   "d194040e0eeafb65aaa8d5af81bf5b6f6746780697e2cf8105581e1112662686")
  (:PATH
   "raw/cases/initial-explicit/case-39-plain-budget-exact-boundary/case-result.lisp"
   :SOURCE
   #A((189) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-39-plain-budget-exact-boundary/case-result.lisp")
   :BYTES 398 :SHA256
   "c0758ce53b47f77a21dda6d643c7e86c4e766be31b06d9f71ecca3ea0d0d849a")
  (:PATH
   "raw/cases/initial-explicit/case-40-gzip-budget-exact-boundary/case-result.lisp"
   :SOURCE
   #A((188) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-40-gzip-budget-exact-boundary/case-result.lisp")
   :BYTES 396 :SHA256
   "ba8affd1a405d100f63d3abc0601d3af79dc18f9a6dbe8feeb2598f597a615a2")
  (:PATH
   "raw/cases/initial-explicit/case-41-plain-budget-over/case-result.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-41-plain-budget-over/case-result.lisp")
   :BYTES 409 :SHA256
   "3da2e8544cc672d343891323d0db663b3e7a1c21f1b6e8ab4f06ba4361fef2a1")
  (:PATH "raw/cases/initial-explicit/case-42-gzip-budget-over/case-result.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-42-gzip-budget-over/case-result.lisp")
   :BYTES 407 :SHA256
   "6de1ed9883219f27460065617f006232c6827dcf6a394f8552c2ce3aa2cc7c8f")
  (:PATH
   "raw/cases/initial-explicit/case-43-existing-destination-never-overwritten/case-result.lisp"
   :SOURCE
   #A((200) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-43-existing-destination-never-overwritten/case-result.lisp")
   :BYTES 461 :SHA256
   "e4fcb86513f3eb6d7a43f9a1c9e5c0e431cb7f0a9e0dfb305c83d3f4f84e4552")
  (:PATH
   "raw/cases/initial-explicit/case-44-existing-observations-never-overwritten/case-result.lisp"
   :SOURCE
   #A((201) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-44-existing-observations-never-overwritten/case-result.lisp")
   :BYTES 464 :SHA256
   "33e235b973576784ea239315f9a72d086a625c1b17062b21d5407ce550b548df")
  (:PATH
   "raw/cases/initial-explicit/case-45-destination-observations-overlap/case-result.lisp"
   :SOURCE
   #A((194) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-45-destination-observations-overlap/case-result.lisp")
   :BYTES 440 :SHA256
   "7129fbea3e087df6d2cd6ee5c54c4a3758e3fc7c1ddfa523c9f4df89487cc150")
  (:PATH
   "raw/cases/initial-explicit/case-46-destination-observations-overlap/case-result.lisp"
   :SOURCE
   #A((194) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-46-destination-observations-overlap/case-result.lisp")
   :BYTES 440 :SHA256
   "737a685790f00dedcda2c6e88dabdabb7b6bcfbdd333f71e63ca936b96080b9f")
  (:PATH
   "raw/cases/initial-explicit/case-47-destination-observations-overlap/case-result.lisp"
   :SOURCE
   #A((194) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-47-destination-observations-overlap/case-result.lisp")
   :BYTES 440 :SHA256
   "64c679e1e9bee3a1a8658cdb0b7ed0fbe7b151eeb2ebd50479d841f794a17641")
  (:PATH
   "raw/cases/initial-explicit/case-48-corrupt-copy-retains-failure/case-result.lisp"
   :SOURCE
   #A((190) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-48-corrupt-copy-retains-failure/case-result.lisp")
   :BYTES 432 :SHA256
   "bc524a33502a3da107b941219d8c175e35ef0a37011c91ddb2b8d48f10a4556f")
  (:PATH
   "raw/cases/initial-explicit/case-49-source-change-retains-failure/case-result.lisp"
   :SOURCE
   #A((191) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-49-source-change-retains-failure/case-result.lisp")
   :BYTES 436 :SHA256
   "a0efee3510fe96dc87c777bfe557080d7e9f5ef0db2437bf8feda269dc393929")
  (:PATH
   "raw/cases/initial-explicit/case-50-unindexed-extra-rejected-by-final-checker/case-result.lisp"
   :SOURCE
   #A((203) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-50-unindexed-extra-rejected-by-final-checker/case-result.lisp")
   :BYTES 458 :SHA256
   "56b5afe6f15eacab124fc4968240f06c028aa2cfeabe9cf21e466502fdc3609c")
  (:PATH
   "raw/cases/initial-explicit/case-51-manifest-read-eval-disabled/case-result.lisp"
   :SOURCE
   #A((189) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-51-manifest-read-eval-disabled/case-result.lisp")
   :BYTES 428 :SHA256
   "98c255b6d0e8b9bc2582d810f6aab9c0b64ca99e710f0e254bf7ab75e2e178ea")
  (:PATH
   "raw/cases/initial-explicit/case-52-manifest-eof-required/case-result.lisp"
   :SOURCE
   #A((183) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-52-manifest-eof-required/case-result.lisp")
   :BYTES 416 :SHA256
   "160623c97fc3df724668ddbe1a90ed43c6e0becdad736e3b09907b6dfe470f2f")
  (:PATH
   "raw/cases/initial-explicit/case-53-record-read-eval-disabled/case-result.lisp"
   :SOURCE
   #A((187) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-53-record-read-eval-disabled/case-result.lisp")
   :BYTES 424 :SHA256
   "f80870c67fde4eee72918329bc743e7d70f4c3301a2a4936c04ba3a98b44da4d")
  (:PATH
   "raw/cases/initial-explicit/case-54-record-eof-required/case-result.lisp"
   :SOURCE
   #A((181) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-54-record-eof-required/case-result.lisp")
   :BYTES 412 :SHA256
   "015d3d591bd7ec45433f8df8a8669fdab672e1a2de2f2dc1f5d8555ea2be2683")
  (:PATH "raw/cases/initial-explicit/case-55-cli-arguments/case-result.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-55-cli-arguments/case-result.lisp")
   :BYTES 269 :SHA256
   "925f36989ef4132a9739cafcd7e4321916dee850c85be47f538ac02173d4a105")
  (:PATH "raw/cases/initial-explicit/case-55-cli-arguments/cli.stderr.log"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-55-cli-arguments/cli.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/cases/initial-explicit/case-55-cli-arguments/cli.stdout.lisp"
   :SOURCE
   #A((174) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-55-cli-arguments/cli.stdout.lisp")
   :BYTES 224 :SHA256
   "575d9ea7dee0df7b80717f1310e60022e9d079b983fcd26635adb5ea5111cace")
  (:PATH "raw/cases/initial-explicit/case-56-cli-arguments/case-result.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-56-cli-arguments/case-result.lisp")
   :BYTES 269 :SHA256
   "a8d076a41587c79d569ab2660fb7688f3853fcd17289ef211f93d0b11984b277")
  (:PATH "raw/cases/initial-explicit/case-56-cli-arguments/cli.stderr.log"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-56-cli-arguments/cli.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/cases/initial-explicit/case-56-cli-arguments/cli.stdout.lisp"
   :SOURCE
   #A((174) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-56-cli-arguments/cli.stdout.lisp")
   :BYTES 224 :SHA256
   "575d9ea7dee0df7b80717f1310e60022e9d079b983fcd26635adb5ea5111cace")
  (:PATH "raw/cases/initial-explicit/case-57-cli-arguments/case-result.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-57-cli-arguments/case-result.lisp")
   :BYTES 269 :SHA256
   "f6525d1db2eb80695c8a5c3e95d6cf9116da3f71f42f758cd352b6e390ac1b4c")
  (:PATH "raw/cases/initial-explicit/case-57-cli-arguments/cli.stderr.log"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-57-cli-arguments/cli.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/cases/initial-explicit/case-57-cli-arguments/cli.stdout.lisp"
   :SOURCE
   #A((174) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-57-cli-arguments/cli.stdout.lisp")
   :BYTES 224 :SHA256
   "575d9ea7dee0df7b80717f1310e60022e9d079b983fcd26635adb5ea5111cace")
  (:PATH "raw/cases/initial-explicit/case-58-cli-arguments/case-result.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-58-cli-arguments/case-result.lisp")
   :BYTES 269 :SHA256
   "f957597886a2dfed980680f3d69380f0896bdd9739407e90f076bdaf276d3b25")
  (:PATH "raw/cases/initial-explicit/case-58-cli-arguments/cli.stderr.log"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-58-cli-arguments/cli.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/cases/initial-explicit/case-58-cli-arguments/cli.stdout.lisp"
   :SOURCE
   #A((174) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-58-cli-arguments/cli.stdout.lisp")
   :BYTES 224 :SHA256
   "575d9ea7dee0df7b80717f1310e60022e9d079b983fcd26635adb5ea5111cace")
  (:PATH "raw/cases/initial-explicit/case-59-cli-arguments/case-result.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-59-cli-arguments/case-result.lisp")
   :BYTES 269 :SHA256
   "93ec06cc0514a259f82fbcfc6eb53179b688a0f1c88447d5dd995b9e89b84044")
  (:PATH "raw/cases/initial-explicit/case-59-cli-arguments/cli.stderr.log"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-59-cli-arguments/cli.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/cases/initial-explicit/case-59-cli-arguments/cli.stdout.lisp"
   :SOURCE
   #A((174) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/case-59-cli-arguments/cli.stdout.lisp")
   :BYTES 224 :SHA256
   "575d9ea7dee0df7b80717f1310e60022e9d079b983fcd26635adb5ea5111cace")
  (:PATH "raw/cases/initial-explicit/self-test-report.lisp" :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/self-test-report.lisp")
   :BYTES 25000 :SHA256
   "fc29ef8504c3fb7152a31cf0b886e58f289f752d386a88ed84a1a23f91bbb768")
  (:PATH "raw/collection/prepare-manifest.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/collection/prepare-manifest.lisp")
   :BYTES 11945 :SHA256
   "42fd67a47e00a42d05efd1b85d5e42532c40c7dbe5ba8072841410b3ca02ba7d")
  (:PATH
   "raw/precompile/collect-command-archive-tests-before-accessory-paren-fix-657a4fec.lisp"
   :SOURCE
   #A((200) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/precompile/collect-command-archive-tests-before-accessory-paren-fix-657a4fec.lisp")
   :BYTES 34449 :SHA256
   "5e0a444c51f96cd10d99cacf7de8926f25ecfa6270bc85313bcb143f6f0f04ae")
  (:PATH "raw/precompile/collector-before-pathname-fix.lisp" :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/precompile/collector-before-pathname-fix.lisp")
   :BYTES 30821 :SHA256
   "749297a5967e60fc0c2c74c8567ebca32b18cb4b7e60d69a5c8449489c0e72da")
  (:PATH "raw/precompile/collector-before-second-read.lisp" :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/precompile/collector-before-second-read.lisp")
   :BYTES 30821 :SHA256
   "749297a5967e60fc0c2c74c8567ebca32b18cb4b7e60d69a5c8449489c0e72da")
  (:PATH "raw/precompile/collector-syntax-preparation.md.txt" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/precompile/collector-syntax-preparation.md")
   :BYTES 1249 :SHA256
   "0e3428068e3ca3740940325f5da1a46ea9dd257a5d66bfe757154809cd7b6f1d")
  (:PATH
   "raw/precompile/prepare-manifest-before-artifact-close-fix-0c1fd70a.lisp"
   :SOURCE
   #A((186) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/precompile/prepare-manifest-before-artifact-close-fix-0c1fd70a.lisp")
   :BYTES 11944 :SHA256
   "743732dc68926e08dcda2156a4e72188bf316f9f2b40d05ad486397f4ab5880b")
  (:PATH "raw/precompile/prepare-manifest-before-syntax-fix-9d6fc0ee.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/precompile/prepare-manifest-before-syntax-fix-9d6fc0ee.lisp")
   :BYTES 11815 :SHA256
   "ad806eadb49b03fdcc4ff1776a64b9a4543c6147c25bb711c031361a5191ae28")
  (:PATH "raw/precompile/prepare-manifest-syntax-note.md.txt" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/precompile/prepare-manifest-syntax-note.md")
   :BYTES 1072 :SHA256
   "e64641e217e3e685a346ca1c1016fb3e6fc256458116cbd2f4abc3cf63dd66da")
  (:PATH "raw/precompile/read-tests-syntax-v2.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/precompile/read-tests-syntax-v2.lisp")
   :BYTES 1717 :SHA256
   "f1edd8075463e5b320230ac8c3b1f8916ed7c2bb88774d1853745fb148dd9f88")
  (:PATH "raw/precompile/read-tests-syntax-v2.status.txt" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/precompile/read-tests-syntax-v2.status.txt")
   :BYTES 2 :SHA256
   "9a271f2a916b0b6ee6cecb2426f0b3206ef074578be55d9bc94f6f3fe3ab86aa")
  (:PATH "raw/precompile/read-tests-syntax-v2.stderr.txt" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/precompile/read-tests-syntax-v2.stderr.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/precompile/read-tests-syntax-v2.stdout.txt" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/precompile/read-tests-syntax-v2.stdout.txt")
   :BYTES 146 :SHA256
   "8d3f8ad7b101f0e64d58971bb2c1028f6b1f01a7f44a1bd1875d84f20f0a71b6")
  (:PATH "raw/precompile/read-tests-syntax.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/precompile/read-tests-syntax.lisp")
   :BYTES 1713 :SHA256
   "322bbe409f93c275d43c534b3df54fab50db0ed5b515fa09952f86844bb5c289")
  (:PATH "raw/precompile/read-tests-syntax.stderr.txt" :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/precompile/read-tests-syntax.stderr.txt")
   :BYTES 3657 :SHA256
   "1d2764aae924e28e90120ea3a9f5834a344f1d9733963daa52c7a9ff4a65a13b")
  (:PATH "raw/precompile/read-tests-syntax.stdout.txt" :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/precompile/read-tests-syntax.stdout.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/precompile/syntax-read-collector.error.txt" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/precompile/syntax-read-collector.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/precompile/syntax-read-collector.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/precompile/syntax-read-collector.lisp")
   :BYTES 571 :SHA256
   "ff02525ade95b3394409ea4ec174dbd7927831416913c0d655cbbe788af38d1d")
  (:PATH "raw/precompile/syntax-read-collector.output.txt" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/precompile/syntax-read-collector.output.txt")
   :BYTES 51 :SHA256
   "c436a37441e2700553978752eb7fb0aa7013cf6feda9953de50da3900c838053")
  (:PATH "raw/precompile/tests-preparation-note.md.txt" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/precompile/tests-preparation-note.md")
   :BYTES 1881 :SHA256
   "63421a93f962939ff10b1cded4caeccdf488e0e80468701723e910e19de5c227")
  (:PATH "raw/review/extract-reader-status.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/extract-reader-status.lisp")
   :BYTES 921 :SHA256
   "b65751dd9212862cc9d023f05b64cc2e224fd4506da7f97e46bcd2d37aa46c25")
  (:PATH "raw/review/fix-reading.md.txt" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/fix-reading.md.txt")
   :BYTES 1103 :SHA256
   "142814edbad9d7ace29fce3f1a1ef582f07e1159f8a53711ccad8368513d125f")
  (:PATH "raw/review/prepared-final-syntax.error.log" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/prepared-final-syntax.error.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/prepared-final-syntax.output.lisp" :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/prepared-final-syntax.output.lisp")
   :BYTES 76 :SHA256
   "634d2cd7c88c40322631e970fdd69b1d528273c01ecae0b7152824abb0dbaf4b")
  (:PATH "raw/review/prepared-syntax.error.log" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/prepared-syntax.error.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/prepared-syntax.output.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/prepared-syntax.output.lisp")
   :BYTES 76 :SHA256
   "1b187dcddced0219374f7282808f33552826010feec9b4b774a7d9e65fac58e9")
  (:PATH "raw/review/read-prepared-syntax.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/read-prepared-syntax.lisp")
   :BYTES 522 :SHA256
   "837e27ed119c17f0fa02edba0a5a4c21d94078ab38bc32e56b3296814d102057")
  (:PATH "raw/review/runtime-reading-launch.error.txt" :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/runtime-reading-launch.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/runtime-reading-launch.output.txt" :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/runtime-reading-launch.output.txt")
   :BYTES 1401 :SHA256
   "18ff74b4059be3705fc2dcd976c00a13fd7b2d3283670a7168758a3b7b401228")
  (:PATH "raw/review/runtime-reading-v1.error.log" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/runtime-reading-v1.error.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/runtime-reading-v1.output.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/runtime-reading-v1.output.lisp")
   :BYTES 142 :SHA256
   "d379098ad317431e1fe322cd4dde917496b74f1d1cfbb5a72cf7b9f27c1f0b94")
  (:PATH "raw/review/runtime-reading-v1.status.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/runtime-reading-v1.status.lisp")
   :BYTES 214 :SHA256
   "ff74ed88e93298f08f188bdc7b1cbebbb50a529c811d44329236666bfff012f0")
  (:PATH "raw/review/runtime-reading-v2-launch.error.txt" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/runtime-reading-v2-launch.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/runtime-reading-v2-launch.output.txt" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/runtime-reading-v2-launch.output.txt")
   :BYTES 1400 :SHA256
   "22a7cfce8b39bdc6618abbf72ba01fab580f3b9035d5a29b588726b2b9b828a1")
  (:PATH "raw/review/runtime-reading-v2.error.log" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/runtime-reading-v2.error.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/runtime-reading-v2.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/runtime-reading-v2.lisp")
   :BYTES 24949 :SHA256
   "7c59b30bbfe0c9452737a8358d7d7147f322440738adc19a5f58a9d5d83d8243")
  (:PATH "raw/review/runtime-reading-v2.output.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/runtime-reading-v2.output.lisp")
   :BYTES 88530 :SHA256
   "4029165e55fa1fbeea2940a2ac892cf784fdf05e1ac6407f341e889b761523a9")
  (:PATH "raw/review/runtime-reading-v2.status.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/runtime-reading-v2.status.lisp")
   :BYTES 177 :SHA256
   "a360a6228881232de37be9bc0ef74d0785a1f8437d3a9da0c3163e2c367a3561")
  (:PATH "raw/review/runtime-reading.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/runtime-reading.lisp")
   :BYTES 24153 :SHA256
   "0a947d0b8c7e9b104bae77723b67d316cfedfdfd6c2711a6d7aafbd40516b02c")
  (:PATH "raw/review/runtime-reading.md.txt" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/runtime-reading.md.txt")
   :BYTES 5148 :SHA256
   "7e8b0dc2c335aff8e6f5b29655628f6e9259f5e23034c8f4032561cd257ab7ef")
  (:PATH "raw/review/static-reading.md.txt" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/static-reading.md.txt")
   :BYTES 3896 :SHA256
   "7fcd48bc44327787ba6e547a9eb9ab059f38618ea339db68a5784be24862c9d2")
  (:PATH "raw/review/status-extraction-corrected.error.txt" :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/status-extraction-corrected.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/status-extraction-corrected.output.txt" :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/status-extraction-corrected.output.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/status-extraction-error-note.txt" :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/status-extraction-error-note.txt")
   :BYTES 688 :SHA256
   "12a17762b3b1c448069b3b5f99e34a731404750b76e31055e424217bde512eb2")
  (:PATH "raw/review/status-extraction-original-form.lisp.txt" :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/status-extraction-original-form.lisp.txt")
   :BYTES 634 :SHA256
   "24848c438596f4527fb996d919295ec02253f8c6d74b2fec04a7d5d388560921")
  (:PATH "raw/review/v2-syntax.error.log" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/v2-syntax.error.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/v2-syntax.output.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/v2-syntax.output.lisp")
   :BYTES 76 :SHA256
   "634d2cd7c88c40322631e970fdd69b1d528273c01ecae0b7152824abb0dbaf4b"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
