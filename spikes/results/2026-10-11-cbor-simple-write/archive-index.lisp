(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "preliminary" :RECORD-PATH "processes/preliminary/report.lisp"
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "make") #A((4) BASE-CHAR . "test")
    #A((4) BASE-CHAR . "lint") #A((5) BASE-CHAR . "trace")))
  (:LABEL "coverage-self-test" :RECORD-PATH
   "processes/coverage-self-test/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((11) BASE-CHAR . "--self-test")
    #A((57) BASE-CHAR
       . "spikes/out/cbor-simple-write-20261011/coverage-self-test/")))
  (:LABEL "bench-self-test" :RECORD-PATH
   "processes/bench-self-test/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "tools/cbor-simple-write-bench.lisp")
    #A((11) BASE-CHAR . "--self-test")))
  (:LABEL "bench" :RECORD-PATH "processes/bench/report.lisp" :STATUS :OK
   :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "tools/cbor-simple-write-bench.lisp")
    #A((7) BASE-CHAR . "--bench")))
  (:LABEL #A((8) BASE-CHAR . "extra-01") :RECORD-PATH
   "processes/extra-01/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((37) BASE-CHAR . "tools/cbor-simple-write-mutation.lisp")
    #A((11) BASE-CHAR . "--self-test")))
  (:LABEL #A((8) BASE-CHAR . "extra-02") :RECORD-PATH
   "processes/extra-02/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "tools/cbor-simple-write-audit.lisp")
    #A((11) BASE-CHAR . "--self-test")))
  (:LABEL #A((8) BASE-CHAR . "extra-03") :RECORD-PATH
   "processes/extra-03/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((51) BASE-CHAR . "spikes/out/cbor-simple-write-20261011/campaign.lisp")
    #A((9) BASE-CHAR . "self-test")))
  (:LABEL "mutation-self-test" :RECORD-PATH
   "processes/mutation-self-test/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((37) BASE-CHAR . "tools/cbor-simple-write-mutation.lisp")
    #A((11) BASE-CHAR . "--self-test")))
  (:LABEL "mutations" :RECORD-PATH "processes/mutations/report.lisp" :STATUS
   :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((37) BASE-CHAR . "tools/cbor-simple-write-mutation.lisp")
    #A((5) BASE-CHAR . "--run")
    #A((48) BASE-CHAR . "spikes/out/cbor-simple-write-20261011/mutations/")))
  (:LABEL "coverage" :RECORD-PATH "processes/coverage/report.lisp" :STATUS :OK
   :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((8) BASE-CHAR . "--report")
    #A((47) BASE-CHAR . "spikes/out/cbor-simple-write-20261011/coverage/")
    #A((17) BASE-CHAR . "cbor-simple-write")))
  (:LABEL "bench-audit" :RECORD-PATH "processes/bench-audit/report.lisp"
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "tools/cbor-simple-write-audit.lisp")
    #A((7) BASE-CHAR . "--bench")
    #A((114) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000713808-command-19171-0/report.lisp")
    #A((40) BASE-CHAR . "58c7a3a040ec814fae2dfe636f569b5623cba8f0")
    #A((32) BASE-CHAR . "200373402e6e082dd8c7afde305302bb")))
  (:LABEL "data-audit-self-test" :RECORD-PATH
   "processes/data-audit-self-test/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((53) BASE-CHAR
       . "spikes/out/cbor-simple-write-20261011/data-audit.lisp")
    #A((11) BASE-CHAR . "--self-test")
    #A((54) BASE-CHAR
       . "spikes/out/cbor-simple-write-20261011/audit-self-test/")))
  (:LABEL "mutation-audit" :RECORD-PATH "processes/mutation-audit/report.lisp"
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((53) BASE-CHAR
       . "spikes/out/cbor-simple-write-20261011/data-audit.lisp")
    #A((11) BASE-CHAR . "--mutations")
    #A((114) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714190-command-35834-0/report.lisp")
    #A((48) BASE-CHAR . "spikes/out/cbor-simple-write-20261011/mutations/")))
  (:LABEL "coverage-audit" :RECORD-PATH "processes/coverage-audit/report.lisp"
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((53) BASE-CHAR
       . "spikes/out/cbor-simple-write-20261011/data-audit.lisp")
    #A((10) BASE-CHAR . "--coverage")
    #A((114) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714357-command-44709-0/report.lisp")
    #A((47) BASE-CHAR . "spikes/out/cbor-simple-write-20261011/coverage/")))
  (:LABEL #A((8) BASE-CHAR . "extra-04") :RECORD-PATH
   "processes/extra-04/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((27) BASE-CHAR . "tools/compact-evidence.lisp")
    #A((6) BASE-CHAR . "--root") #A((11) BASE-CHAR . "spikes/out/")
    #A((6) BASE-CHAR . "--jobs") #A((1) BASE-CHAR . "4"))))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/manifest.lisp")
   :BYTES 8732 :SHA256
   "24413c0ae7fb819bbdcb46b10b86121e889430b3076d46cd0d4ec2df8f2d80cc")
  (:PATH "collection-source.lisp" :SOURCE
   #A((101) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/header-write/collect.lisp")
   :BYTES 9677 :SHA256
   "f59f7a52934c7fe6103b5047aade87214f17494e857fe35c568968c681790d81")
  (:PATH "processes/bench-audit/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714388-command-46985-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "a9355ec5f85ddbb766966d628080111409347a5dae5e330118ed52d9fedb95aa")
  (:PATH "processes/bench-audit/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714388-command-46985-0/report.lisp")
   :BYTES 143614 :SHA256
   "8a5877d924feafb5fd573bc920661a30ac425d295487b04098df3366e332c015")
  (:PATH "processes/bench-self-test/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000713806-command-19078-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "687593b6ec19a33be4b1cfad357b6c1b4c397fc2bdce829d7bd827142b873f5b")
  (:PATH "processes/bench-self-test/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000713806-command-19078-0/report.lisp")
   :BYTES 175469 :SHA256
   "9bbfcbbf3c198d87318f5b63db01416d2c2155c64edcf10b0bfae06f22695498")
  (:PATH "processes/bench/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000713808-command-19171-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "612369f26ee60d3bd412065d081b97ad708fef28604bae02f4f52edabe1b1b21")
  (:PATH "processes/bench/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000713808-command-19171-0/report.lisp")
   :BYTES 183455 :SHA256
   "49e218bbe4a9eee8f137c381755929cab53c4cf298bb7df73a019ea0b7467e02")
  (:PATH "processes/coverage-audit/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714401-command-47888-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "1128af39f68412ee535d0d12e48bec39e721d7b42985b45413799d68056fe3ee")
  (:PATH "processes/coverage-audit/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714401-command-47888-0/report.lisp")
   :BYTES 141993 :SHA256
   "be5d11d83c9d70d71db8205dd5c4cbf4de4c46e9adf96741eabfc08cfbe40b5e")
  (:PATH "processes/coverage-self-test/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000713804-command-19019-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "65326e7619ba92e778d059f9c3e821fa18f8da460912128eb7f7f1e1997f2a11")
  (:PATH "processes/coverage-self-test/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000713804-command-19019-0/report.lisp")
   :BYTES 141806 :SHA256
   "0953dc0e2cbc15faec695a77a5deadf29a255247b2b73fe4c4e80884aa54d1c0")
  (:PATH "processes/coverage/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714357-command-44709-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "dc53ae6e0a3e5477254b1c219122297a9b7004967b015df6bee84a97de13818a")
  (:PATH "processes/coverage/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714357-command-44709-0/report.lisp")
   :BYTES 143512 :SHA256
   "e0a78c97970b94febf0881a047cb4249d581cf118d022c829825b614d8dc4a79")
  (:PATH "processes/data-audit-self-test/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714391-command-47195-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "3653abc7fa4fcc72cba0d8cbe1361a4ea77c20001908b925f665fc8a0839f9bb")
  (:PATH "processes/data-audit-self-test/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714391-command-47195-0/report.lisp")
   :BYTES 141867 :SHA256
   "ad88bc22762608e2dfd911f910d8f1867ba6a030c4fbf0eeca3b2fda7991100d")
  (:PATH "processes/extra-01/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000713828-command-19939-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "9a25f05ea13961927981d6b4eb15bafc35b74bf1764eb848fef64006daccd739")
  (:PATH "processes/extra-01/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000713828-command-19939-0/report.lisp")
   :BYTES 202742 :SHA256
   "c8641c3621443e351e2a84d112d4766c9079cc634ff09889adb979c451168d48")
  (:PATH "processes/extra-02/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000713828-command-19963-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "a5ae3ed4b0c2920c6910a313b736fafb2a5e700bba2cf9d635468d36ed51f4eb")
  (:PATH "processes/extra-02/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000713828-command-19963-0/report.lisp")
   :BYTES 145722 :SHA256
   "dd009a032d17a496f7d71e88d66ab6684959972dd7e15d09920a8319d86603c7")
  (:PATH "processes/extra-03/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000713933-command-25948-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "3d98713c4690b446f28d0f9765d97c6b8b1589cb96ea85301a602f1498563e6f")
  (:PATH "processes/extra-03/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000713933-command-25948-0/report.lisp")
   :BYTES 141749 :SHA256
   "44f95b6b0477ac18d245e8824f932a34c338a01d5bdb7908779a4d9cc0519dd7")
  (:PATH "processes/extra-04/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714744-command-57313-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "277dc7c180471b0c7810341860ee8e926dafdbd1e6c341f360c7695846b4456a")
  (:PATH "processes/extra-04/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714744-command-57313-0/report.lisp")
   :BYTES 144582 :SHA256
   "1ce06f45a76542e6688d11039a72761f4dcd3fae78b00fdf26982b2f0537f996")
  (:PATH "processes/mutation-audit/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714393-command-47353-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "d1f5de75b4456acf35da7304b7643917ba3db9d167a98d1686fbfe9888042d02")
  (:PATH "processes/mutation-audit/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714393-command-47353-0/report.lisp")
   :BYTES 141997 :SHA256
   "1ab2161173596210de8240858fb56da56f1fccbc2ea8a23b840130a0efef67ef")
  (:PATH "processes/mutation-self-test/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714188-command-35741-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "ec49bcf40e4f8871acc362d2a6dfe424efd1031bce9bb11911d7cc754ee5357c")
  (:PATH "processes/mutation-self-test/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714188-command-35741-0/report.lisp")
   :BYTES 202753 :SHA256
   "81c4636bf5b9fbaeb5c846bfd241b7858a7a28906325929bd658f1d5bd853279")
  (:PATH "processes/mutations/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714190-command-35834-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "2d85b03f0340f84efc1a7931d674a31417726f220f10be56fa7f443e09f30632")
  (:PATH "processes/mutations/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714190-command-35834-0/report.lisp")
   :BYTES 205648 :SHA256
   "940cb518692cea9c32dd1f372cb20dcb06a96c211447c0ef7a5aef92c264d649")
  (:PATH "processes/preliminary/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000713780-command-17360-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "d859a2178f3316ddb9ff676534996d3523d94d4564b9b0d7b8467c822a6cc372")
  (:PATH "processes/preliminary/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000713780-command-17360-0/report.lisp")
   :BYTES 695896 :SHA256
   "d7a184fe1d77302fd0484f43f8e028264d327b2208d22eb7e9d2e7b5ea9e5428")
  (:PATH
   "raw/4000713829-cbor-simple-write-worker-self-test-19995/baseline-copy/report.lisp"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000713829-cbor-simple-write-worker-self-test-19995/baseline-copy/report.lisp")
   :BYTES 509 :SHA256
   "69f2f541160dc3443589f8e9145d92abcc8e4676a7bbcefd1d9bfbd0a5b3821e")
  (:PATH
   "raw/4000713829-cbor-simple-write-worker-self-test-19995/baseline-copy/test.log"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000713829-cbor-simple-write-worker-self-test-19995/baseline-copy/test.log")
   :BYTES 72 :SHA256
   "de0dbcd7f7ead42441ea8049fc98c4131badb83e7d506ec1dcbf65c5f390cf6f")
  (:PATH
   "raw/4000713829-cbor-simple-write-worker-self-test-19995/baseline-transport/report.lisp"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000713829-cbor-simple-write-worker-self-test-19995/baseline-transport/report.lisp")
   :BYTES 524 :SHA256
   "c5e9b18333882e4f67ed4415ba0a5e536b18e6101a9569929802353268c7beb5")
  (:PATH
   "raw/4000713829-cbor-simple-write-worker-self-test-19995/baseline-transport/test.log"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000713829-cbor-simple-write-worker-self-test-19995/baseline-transport/test.log")
   :BYTES 77 :SHA256
   "8db5a0350972541411a1e5939c72ccd8c01f29d66442dfef3cf75a6bc434356c")
  (:PATH
   "raw/4000713829-cbor-simple-write-worker-self-test-19995/completion-exit/test.log"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000713829-cbor-simple-write-worker-self-test-19995/completion-exit/test.log")
   :BYTES 96 :SHA256
   "c0320463f598c4c5f11202e542c7617c216e7be84103be16768a503c83b17a95")
  (:PATH
   "raw/4000713829-cbor-simple-write-worker-self-test-19995/completion-exit/tools/cbor-simple-write-isolated-build.lisp"
   :SOURCE
   #A((187) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000713829-cbor-simple-write-worker-self-test-19995/completion-exit/tools/cbor-simple-write-isolated-build.lisp")
   :BYTES 184 :SHA256
   "1e3c5ad6ead59dcacdfb02c47ce2474eb44727271c8fcd8436fefe2dde8d0b61")
  (:PATH "raw/4000713829-cbor-simple-write-worker-self-test-19995/report.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000713829-cbor-simple-write-worker-self-test-19995/report.lisp")
   :BYTES 1757 :SHA256
   "16359db91eba2d0d7dce6ad80c038d4fc365245799c77b761324bbfb41de363b")
  (:PATH
   "raw/4000713829-cbor-simple-write-worker-self-test-19995/signal/test.log"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000713829-cbor-simple-write-worker-self-test-19995/signal/test.log")
   :BYTES 40 :SHA256
   "52ed427bbed0c5c928fa7e029bb609e785bb3a11329b9a8110255dbeb7c5f384")
  (:PATH
   "raw/4000713829-cbor-simple-write-worker-self-test-19995/signal/tools/cbor-simple-write-isolated-build.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000713829-cbor-simple-write-worker-self-test-19995/signal/tools/cbor-simple-write-isolated-build.lisp")
   :BYTES 142 :SHA256
   "1ee0da58fd6e1dca7befab8f13b2c7c520b79e8d12dedc4e6a3f9bb926d5628b")
  (:PATH
   "raw/4000714189-cbor-simple-write-worker-self-test-35774/baseline-copy/report.lisp"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714189-cbor-simple-write-worker-self-test-35774/baseline-copy/report.lisp")
   :BYTES 509 :SHA256
   "c0128c7671ffa4aab9448d69f012410359bddc2afc5d7bad4e1c8939bb380600")
  (:PATH
   "raw/4000714189-cbor-simple-write-worker-self-test-35774/baseline-copy/test.log"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714189-cbor-simple-write-worker-self-test-35774/baseline-copy/test.log")
   :BYTES 72 :SHA256
   "de0dbcd7f7ead42441ea8049fc98c4131badb83e7d506ec1dcbf65c5f390cf6f")
  (:PATH
   "raw/4000714189-cbor-simple-write-worker-self-test-35774/baseline-transport/report.lisp"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714189-cbor-simple-write-worker-self-test-35774/baseline-transport/report.lisp")
   :BYTES 524 :SHA256
   "4e568f660822f2f36302118ce8c553d971a77681ff835fc3ea46b3f95bac48c7")
  (:PATH
   "raw/4000714189-cbor-simple-write-worker-self-test-35774/baseline-transport/test.log"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714189-cbor-simple-write-worker-self-test-35774/baseline-transport/test.log")
   :BYTES 77 :SHA256
   "8db5a0350972541411a1e5939c72ccd8c01f29d66442dfef3cf75a6bc434356c")
  (:PATH
   "raw/4000714189-cbor-simple-write-worker-self-test-35774/completion-exit/test.log"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714189-cbor-simple-write-worker-self-test-35774/completion-exit/test.log")
   :BYTES 96 :SHA256
   "c0320463f598c4c5f11202e542c7617c216e7be84103be16768a503c83b17a95")
  (:PATH
   "raw/4000714189-cbor-simple-write-worker-self-test-35774/completion-exit/tools/cbor-simple-write-isolated-build.lisp"
   :SOURCE
   #A((187) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714189-cbor-simple-write-worker-self-test-35774/completion-exit/tools/cbor-simple-write-isolated-build.lisp")
   :BYTES 184 :SHA256
   "1e3c5ad6ead59dcacdfb02c47ce2474eb44727271c8fcd8436fefe2dde8d0b61")
  (:PATH "raw/4000714189-cbor-simple-write-worker-self-test-35774/report.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714189-cbor-simple-write-worker-self-test-35774/report.lisp")
   :BYTES 1757 :SHA256
   "6a58e5036afa5da0e73f26cc3b793d64e865034d241c12a879e2b6e3cb535d24")
  (:PATH
   "raw/4000714189-cbor-simple-write-worker-self-test-35774/signal/test.log"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714189-cbor-simple-write-worker-self-test-35774/signal/test.log")
   :BYTES 40 :SHA256
   "52ed427bbed0c5c928fa7e029bb609e785bb3a11329b9a8110255dbeb7c5f384")
  (:PATH
   "raw/4000714189-cbor-simple-write-worker-self-test-35774/signal/tools/cbor-simple-write-isolated-build.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714189-cbor-simple-write-worker-self-test-35774/signal/tools/cbor-simple-write-isolated-build.lisp")
   :BYTES 142 :SHA256
   "1ee0da58fd6e1dca7befab8f13b2c7c520b79e8d12dedc4e6a3f9bb926d5628b")
  (:PATH
   "raw/4000714191-cbor-simple-write-worker-self-test-35886/baseline-copy/report.lisp"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714191-cbor-simple-write-worker-self-test-35886/baseline-copy/report.lisp")
   :BYTES 509 :SHA256
   "f6eca9253fc8a89748d9e3cc6f87fe9d1b2edad245e6e1e28f84d64a9760cc7f")
  (:PATH
   "raw/4000714191-cbor-simple-write-worker-self-test-35886/baseline-copy/test.log"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714191-cbor-simple-write-worker-self-test-35886/baseline-copy/test.log")
   :BYTES 72 :SHA256
   "de0dbcd7f7ead42441ea8049fc98c4131badb83e7d506ec1dcbf65c5f390cf6f")
  (:PATH
   "raw/4000714191-cbor-simple-write-worker-self-test-35886/baseline-transport/report.lisp"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714191-cbor-simple-write-worker-self-test-35886/baseline-transport/report.lisp")
   :BYTES 524 :SHA256
   "06839a39ab74df29ae127ba0cc9aa53adf03e865fecd1f7221f1dedda5cb6489")
  (:PATH
   "raw/4000714191-cbor-simple-write-worker-self-test-35886/baseline-transport/test.log"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714191-cbor-simple-write-worker-self-test-35886/baseline-transport/test.log")
   :BYTES 77 :SHA256
   "8db5a0350972541411a1e5939c72ccd8c01f29d66442dfef3cf75a6bc434356c")
  (:PATH
   "raw/4000714191-cbor-simple-write-worker-self-test-35886/completion-exit/test.log"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714191-cbor-simple-write-worker-self-test-35886/completion-exit/test.log")
   :BYTES 96 :SHA256
   "c0320463f598c4c5f11202e542c7617c216e7be84103be16768a503c83b17a95")
  (:PATH
   "raw/4000714191-cbor-simple-write-worker-self-test-35886/completion-exit/tools/cbor-simple-write-isolated-build.lisp"
   :SOURCE
   #A((187) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714191-cbor-simple-write-worker-self-test-35886/completion-exit/tools/cbor-simple-write-isolated-build.lisp")
   :BYTES 184 :SHA256
   "1e3c5ad6ead59dcacdfb02c47ce2474eb44727271c8fcd8436fefe2dde8d0b61")
  (:PATH "raw/4000714191-cbor-simple-write-worker-self-test-35886/report.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714191-cbor-simple-write-worker-self-test-35886/report.lisp")
   :BYTES 1757 :SHA256
   "d6b9e693e356f11da77c265bc2830e0b98671d5024bfaa65ca4b15aa445c82d1")
  (:PATH
   "raw/4000714191-cbor-simple-write-worker-self-test-35886/signal/test.log"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714191-cbor-simple-write-worker-self-test-35886/signal/test.log")
   :BYTES 40 :SHA256
   "52ed427bbed0c5c928fa7e029bb609e785bb3a11329b9a8110255dbeb7c5f384")
  (:PATH
   "raw/4000714191-cbor-simple-write-worker-self-test-35886/signal/tools/cbor-simple-write-isolated-build.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714191-cbor-simple-write-worker-self-test-35886/signal/tools/cbor-simple-write-isolated-build.lisp")
   :BYTES 142 :SHA256
   "1ee0da58fd6e1dca7befab8f13b2c7c520b79e8d12dedc4e6a3f9bb926d5628b")
  (:PATH "raw/audit-self-test/coverage-gap-map.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/audit-self-test/coverage-gap-map.lisp")
   :BYTES 81 :SHA256
   "b1679ff9a0db2fcd3c069347d98e760dbfba651f59e605de06fbe21fe64377c8")
  (:PATH "raw/audit-self-test/coverage-good.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/audit-self-test/coverage-good.lisp")
   :BYTES 78 :SHA256
   "e6d890f8ef672aef35032a545aca9322d673dcf62c42dfb9db07ad4740531d74")
  (:PATH "raw/audit-self-test/coverage-html-implicit-row-end.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/audit-self-test/coverage-html-implicit-row-end.lisp")
   :BYTES 96 :SHA256
   "22372146cbb89af05321a480fb0f37818d7d82a6fb45a0a6b4a42adf2a74fd78")
  (:PATH "raw/audit-self-test/coverage-invalid-bit.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/audit-self-test/coverage-invalid-bit.lisp")
   :BYTES 86 :SHA256
   "f8f0d4842e751c6181a066ba2803cf48df6bda1ebe042dd237d1bb32554b5905")
  (:PATH "raw/audit-self-test/mutants-baseline.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/audit-self-test/mutants-baseline.lisp")
   :BYTES 6228 :SHA256
   "b8f9a8b5f037febd97e93433701cbd228e2ada0f8adcbd3be8f9d6bc3719c0e4")
  (:PATH "raw/audit-self-test/mutants-blob.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/audit-self-test/mutants-blob.lisp")
   :BYTES 6187 :SHA256
   "8627b184b67ac3bde6298281fd4f9468b058c5766a3b6cd9424b7eabdefa3fb5")
  (:PATH "raw/audit-self-test/mutants-catalog.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/audit-self-test/mutants-catalog.lisp")
   :BYTES 6217 :SHA256
   "66aee1d91ecfadf50007fdf6429f2f5be0585e158be39459c4a40b2fb89d563a")
  (:PATH "raw/audit-self-test/mutants-catalogue-status.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/audit-self-test/mutants-catalogue-status.lisp")
   :BYTES 6252 :SHA256
   "12bb6a5cb551c65d5b55fc0b3b9a7b936ca617fce88fc3e89042539d38dade08")
  (:PATH "raw/audit-self-test/mutants-good.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/audit-self-test/mutants-good.lisp")
   :BYTES 77 :SHA256
   "ff42fc9ba44c6dc1af16a6a667f9f9c5b92d046e013d7217e5d473ec958ebb0d")
  (:PATH "raw/audit-self-test/mutants-invalid.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/audit-self-test/mutants-invalid.lisp")
   :BYTES 6226 :SHA256
   "68003d3f959ecccf75df300bc8a975a5409ee071685770230fb1b75081044f26")
  (:PATH "raw/audit-self-test/mutants-names.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/audit-self-test/mutants-names.lisp")
   :BYTES 6047 :SHA256
   "8cf2b9b9f013d2bed34c184a1b762b078378738947c5f2e4ca4a6f947c4e74f3")
  (:PATH "raw/audit-self-test/mutants-signal.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/audit-self-test/mutants-signal.lisp")
   :BYTES 6224 :SHA256
   "8e833e9a136c9514a8d802c1d9bcf14e42c9b102e76fb22ea75ef88b1ec3e085")
  (:PATH "raw/audit-self-test/mutants-survived.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/audit-self-test/mutants-survived.lisp")
   :BYTES 6228 :SHA256
   "39999425b25c7c594c9876ac22304882696620aceb0e4d8f62fb15c2a021a470")
  (:PATH "raw/audit-self-test/mutants-worker-errors.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/audit-self-test/mutants-worker-errors.lisp")
   :BYTES 6233 :SHA256
   "39582a63b8b63e42f441bbcd13c49515600ba4098f4aeca37e485a144ecf2151")
  (:PATH "raw/audit-self-test/process-after.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/audit-self-test/process-after.lisp")
   :BYTES 403 :SHA256
   "3cb392a79ecba67addd20141ea5f023c576ef7c7b14f57e21133da3a69306cef")
  (:PATH "raw/audit-self-test/process-blob.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/audit-self-test/process-blob.lisp")
   :BYTES 463 :SHA256
   "99e5827e9371f39091839dd76b2cdf2d0a9fd90fe6fe75897af30db9bbf87a0d")
  (:PATH "raw/audit-self-test/process-changed.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/audit-self-test/process-changed.lisp")
   :BYTES 506 :SHA256
   "8fe1fa7df5f9a9c96bc1a93f19cc314424520deb4c7abae3281ce3f8b6449b9f")
  (:PATH "raw/audit-self-test/process-exit.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/audit-self-test/process-exit.lisp")
   :BYTES 502 :SHA256
   "b854d011fb5bedd88bf07930ef060ab9e5da4a80ef46bd89a333dc59961d9879")
  (:PATH "raw/audit-self-test/process-good.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/audit-self-test/process-good.lisp")
   :BYTES 77 :SHA256
   "152e3c960a5574b593858f64f430d2693a01d134a86c5acb6af2df86f5f5208d")
  (:PATH "raw/audit-self-test/process-status.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/audit-self-test/process-status.lisp")
   :BYTES 508 :SHA256
   "eed67ddb133087c97535223591a5285a696375afa582e2f7b48188db894cc1f3")
  (:PATH "raw/audit-self-test/reader-16.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/audit-self-test/reader-16.lisp")
   :BYTES 105 :SHA256
   "b9518f92bd55324e99eb45858623026ea260d6d4ac057c0cfe5a805a381b1108")
  (:PATH "raw/audit-self-test/reader-17.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/audit-self-test/reader-17.lisp")
   :BYTES 107 :SHA256
   "01718202aeeacd07c45889f7864b247c675e73d5f786cb35069c9865d5cf200a")
  (:PATH "raw/audit-self-test/reader-18.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/audit-self-test/reader-18.lisp")
   :BYTES 107 :SHA256
   "efb9a658914d3252152f89e9113b3deb0fac218e87da71345c3db0ba504bf9e4")
  (:PATH "raw/audit-self-test/reader-19.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/audit-self-test/reader-19.lisp")
   :BYTES 104 :SHA256
   "6ab5ce16b0b8de49f96bd10a05720ed14888642fbf52d1220c7739480c6bf1b0")
  (:PATH "raw/audit-self-test/report.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/audit-self-test/report.lisp")
   :BYTES 1988 :SHA256
   "bd8bc14f3e01f854191c4cc2615b60500514cf00a687fd5628ac39c883d0a32d")
  (:PATH "raw/audit-self-test/substitution-duplicate.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/audit-self-test/substitution-duplicate.lisp")
   :BYTES 88 :SHA256
   "981f02be835f32ffed988ffc98b31b5fcafe36867fba774bf6dc93e071c326ea")
  (:PATH "raw/audit-self-test/substitution-good.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/audit-self-test/substitution-good.lisp")
   :BYTES 83 :SHA256
   "d2d4b315a4555e23e7d1234fd2c13829b26113ac7bd30c7e35dfb8fc10921d20")
  (:PATH "raw/audit-self-test/unknown-preamble.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/audit-self-test/unknown-preamble.lisp")
   :BYTES 81 :SHA256
   "3c5cc14c419d6865d7268701289bb4d756904644bc40ae3b0d273620bb3a1040")
  (:PATH "raw/audit/audit-comment-fix.diff" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/audit-comment-fix.diff")
   :BYTES 784 :SHA256
   "0748d325e341c3c9745884e87ef992ed82a4d3304f41e53d6abf68a614a24143")
  (:PATH "raw/audit/audit-coverage.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/audit-coverage.lisp")
   :BYTES 7569 :SHA256
   "28b53b238befbfde84d51ba1fb915a3c68c9e1d28c8285e4a4fc520d1a4228a5")
  (:PATH "raw/audit/audit-mutations.lisp" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/audit-mutations.lisp")
   :BYTES 25477 :SHA256
   "e0dc3942dedefbe00024317bdd8c76244e5666a1960667c9bf62e7fdf7e9c58d")
  (:PATH "raw/audit/audit-original-pre-comment.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/audit-original-pre-comment.lisp")
   :BYTES 38409 :SHA256
   "2fdf77d22fca65bf892eb120bfe8a97efe633f844af521b36af5b2c39c0383a9")
  (:PATH "raw/audit/audit-run.log" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/audit-run.log")
   :BYTES 555 :SHA256
   "1fb3b1126ee9ad79a27a7dab8a5ecb67f2b54a10aa30a02cdc86bd87ba937782")
  (:PATH "raw/audit/audit-stats.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/audit-stats.lisp")
   :BYTES 225 :SHA256
   "cf89232215138e16ccf50f9916cd001c934509be9b46d420313f50f93892e78f")
  (:PATH "raw/audit/campaign-original.lisp" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/campaign-original.lisp")
   :BYTES 2850 :SHA256
   "8e40053d57cd3448b94b466e4a8391ca00e335cec3a7159afa26eeabb86e9396")
  (:PATH "raw/audit/campaign.lisp" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/campaign.lisp")
   :BYTES 4758 :SHA256
   "5a1e7e9bacffbbb51b36218770deb91b6481ce39661da9756ce35c10dd290b66")
  (:PATH "raw/audit/data-audit.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/data-audit.lisp")
   :BYTES 31960 :SHA256
   "c05a7da9b468eef04785ca7702c288489756225cc0333f6a930e3e90e317896b")
  (:PATH "raw/audit/falsification-run.log" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/falsification-run.log")
   :BYTES 407 :SHA256
   "daec9a7c4710f21d544a2823c8ad5b3e0b635bb5bd7d97b9bccf237983d9a16b")
  (:PATH "raw/audit/freeze.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/freeze.lisp")
   :BYTES 2060 :SHA256
   "33c2a31ebf5dc54a84e6cb6c066e6b79b150054d4405c462669665693ab0ab8e")
  (:PATH "raw/audit/inspect.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/inspect.lisp")
   :BYTES 662 :SHA256
   "f6ffb92643a1522d420a3eff9548f828cd875a9cbf0f8d3fc5804e0f9a27be96")
  (:PATH "raw/audit/manifest-builder.lisp" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/manifest-builder.lisp")
   :BYTES 2951 :SHA256
   "cb8d66ce03bb1d6d3887d4ca8013f1dc6dd15463edcf611b206881a41e3d6373")
  (:PATH "raw/audit/mutation-final.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutation-final.lisp")
   :BYTES 35611 :SHA256
   "6728ac4c009bf20a9e77956ce7c62092ab1211efdcd2e5b4eb4467e0513edca5")
  (:PATH "raw/audit/orchestration-attempt1.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/orchestration-attempt1.lisp")
   :BYTES 802 :SHA256
   "09534af8aeca30ed38ac0984d49018bbcf049a1de075a385b907cb800684bc71")
  (:PATH "raw/audit/processes.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/processes.lisp")
   :BYTES 1816 :SHA256
   "c8500d87ac09b6f909e256c4b0e4ae1f2e2c79a2f536cf72b002e8113a714ff7")
  (:PATH "raw/audit/summarize.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/summarize.lisp")
   :BYTES 824 :SHA256
   "5ddd1f6610e9ff8195b06f222cdaa29142b9f0324f8c6a880d63c3c2bde23a1c")
  (:PATH "raw/audit/summary-objects.lisp" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/summary-objects.lisp")
   :BYTES 427 :SHA256
   "1ab2907df18503bcee684c9a17838ee1ee4a23a705e82d81159ceaaaf1138a8a")
  (:PATH "raw/coverage-self-test-html/6949116fbec35b7085d526a5859b491a.html"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/coverage-self-test/6949116fbec35b7085d526a5859b491a.html")
   :BYTES 2841 :SHA256
   "1498105ca074ecd4f3b0291834f7c86c2dc059391ab397b0b6ac034959fb66eb")
  (:PATH "raw/coverage-self-test-html/cover-index.html" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/coverage-self-test/cover-index.html")
   :BYTES 1801 :SHA256
   "4eb56327f2f5911c3f290f521810138c7e56c0ceb3bd5706be8e63c242a4cd70")
  (:PATH "raw/coverage-self-test/coverage-fixture.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/coverage-self-test/coverage-fixture.lisp")
   :BYTES 147 :SHA256
   "3767518fde8bde1e1286dbf663e97eac01f02e038d7f3161df436d9fd3e92559")
  (:PATH "raw/coverage/9ae2ab0021850480ee0bbfa07aef40ba.html" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/coverage/9ae2ab0021850480ee0bbfa07aef40ba.html")
   :BYTES 18819 :SHA256
   "469e9a0b9e88da57ccbe5cd6a9e20fa4629205324da252d811e61af535f2bfa7")
  (:PATH "raw/coverage/cover-index.html" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/coverage/cover-index.html")
   :BYTES 1760 :SHA256
   "f5bbcc1b6dfe30392a712c320ca2fd3b55836cad907d3b61bee00db21b477d58")
  (:PATH "raw/coverage/coverage-state.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/coverage/coverage-state.lisp")
   :BYTES 325 :SHA256
   "647cb11b5dae65e1698e0307ec460389e139e9605e734af7a5ed86bee931fe0c")
  (:PATH "raw/coverage/coverage-state.lisp.gz" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/coverage/coverage-state.lisp.gz")
   :BYTES 250828 :SHA256
   "d45f2d69299d154c1dcbc88eacbdf3b54df5c9170c053ae0bc430cbedb8d2560")
  (:PATH "raw/frozen/arcdocdb.asd" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/frozen/arcdocdb.asd")
   :BYTES 12001 :SHA256
   "0bf5f1d95d841a479920b766aaca5638e3411efa5435cdbe931fe402f16187d3")
  (:PATH "raw/frozen/docs/implementazione/cbor-semplici-decisioni.md.txt"
   :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/frozen/docs/implementazione/cbor-semplici-decisioni.md.txt")
   :BYTES 1734 :SHA256
   "a7a24403c7f727bd9ca43979607d297b6f456dd1f68af79e46fc5920d2ca4a5b")
  (:PATH "raw/frozen/docs/implementazione/cbor-semplici-lettura.md.txt" :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/frozen/docs/implementazione/cbor-semplici-lettura.md.txt")
   :BYTES 13020 :SHA256
   "dc9026c44d8afbc2335e1a0bd9eb250fb09e6ef779891b217f4178a0ce9a3324")
  (:PATH "raw/frozen/docs/implementazione/cbor-semplici-metodo.md.txt" :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/frozen/docs/implementazione/cbor-semplici-metodo.md.txt")
   :BYTES 3873 :SHA256
   "ca81fb60d8c1d6d6275474f9d53e389de06476391c84fc0a861ddff9f5d1ec4b")
  (:PATH "raw/frozen/docs/implementazione/cbor-semplici-revisione.md.txt"
   :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/frozen/docs/implementazione/cbor-semplici-revisione.md.txt")
   :BYTES 6291 :SHA256
   "498a711a34fe33a77dfa02b7501983d020a592e3179360c510a3a81ef499185f")
  (:PATH "raw/frozen/docs/implementazione/cbor-semplici.md.txt" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/frozen/docs/implementazione/cbor-semplici.md.txt")
   :BYTES 1749 :SHA256
   "3d841236be75e30b60c210be601fc977150e1e8d5d4855a29d39d2fdda03be6a")
  (:PATH "raw/frozen/docs/tracciabilita/matrice.md.txt" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/frozen/docs/tracciabilita/matrice.md.txt")
   :BYTES 48903 :SHA256
   "7292d97498238528a94afdbd9f936db71965a852f3558a1311a92c0e7c948aeb")
  (:PATH "raw/frozen/docs/tracciabilita/requisiti.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/frozen/docs/tracciabilita/requisiti.lisp")
   :BYTES 39451 :SHA256
   "02e0b79300ac0c4ad1972c12822ad47f873d100813482368b0b691f4dcd2d2c8")
  (:PATH "raw/frozen/snapshot-index.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/frozen/snapshot-index.lisp")
   :BYTES 3938 :SHA256
   "3b1f0a51d10ac431cd2fb8251f731c0e80193625bdcd308bc76049e20e586dcc")
  (:PATH "raw/frozen/src/codec/cbor-package.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/frozen/src/codec/cbor-package.lisp")
   :BYTES 620 :SHA256
   "53fa9acbed8f5602b204252ff394c01fd01effdbe41baf021a713e2636cbd668")
  (:PATH "raw/frozen/src/codec/cbor-simple-write.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/frozen/src/codec/cbor-simple-write.lisp")
   :BYTES 2887 :SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e")
  (:PATH "raw/frozen/tests/codec/cbor-simple-write-support.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/frozen/tests/codec/cbor-simple-write-support.lisp")
   :BYTES 4955 :SHA256
   "53ceafc72a027a2ff1f787900558ff26f2ff70bbb212f1b37926a6d520fbe86e")
  (:PATH "raw/frozen/tests/codec/cbor-simple-write-threads.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/frozen/tests/codec/cbor-simple-write-threads.lisp")
   :BYTES 3561 :SHA256
   "77074033e75a224fd02e890f98dffa8e97d3a1f8bedd510b00ea55d8ff8687b2")
  (:PATH "raw/frozen/tests/codec/cbor-simple-write.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/frozen/tests/codec/cbor-simple-write.lisp")
   :BYTES 10712 :SHA256
   "958bdd3901cfc41032c09d6c9023b192799981884e09ce3573256ff45bc5329a")
  (:PATH "raw/frozen/tests/codec/cbor-string-write-support.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/frozen/tests/codec/cbor-string-write-support.lisp")
   :BYTES 6868 :SHA256
   "2cbdb601f442a56456bc637c94e759cc965f44b178268dce3c636c385d34fc39")
  (:PATH "raw/frozen/tests/codec/cbor-string-write-threads.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/frozen/tests/codec/cbor-string-write-threads.lisp")
   :BYTES 3512 :SHA256
   "8e07b881a55e2554a429f1c8b2c69f67862ac015217d90d019167d636564d27d")
  (:PATH "raw/frozen/tools/cbor-simple-write-audit.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/frozen/tools/cbor-simple-write-audit.lisp")
   :BYTES 38405 :SHA256
   "8d19644e582d5fe75d665fce7c6484116d6dc74329cb8db103ef6ebf26a7cf3c")
  (:PATH "raw/frozen/tools/cbor-simple-write-bench.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/frozen/tools/cbor-simple-write-bench.lisp")
   :BYTES 11748 :SHA256
   "6b7a6cbd622f37b8b0ffead5c8004bbe9bab232cf746580c55eb5de7a695c9dc")
  (:PATH "raw/frozen/tools/cbor-simple-write-mutation.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/frozen/tools/cbor-simple-write-mutation.lisp")
   :BYTES 35600 :SHA256
   "b0f1c5f2e1770ac4a9954545b2e1bbd5ecaa7b5d70ef5099f36a12a91e402c4a")
  (:PATH "raw/frozen/tools/foundation-coverage.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/frozen/tools/foundation-coverage.lisp")
   :BYTES 14274 :SHA256
   "932e93838b0242ef9c5d9fdf989d75356903d0850fe1c8bf16dd27d2d90af5b7")
  (:PATH "raw/mutations/0/src/cache/build.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/cache/build.lisp")
   :BYTES 4966 :SHA256
   "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0")
  (:PATH "raw/mutations/0/src/cache/clock.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/cache/clock.lisp")
   :BYTES 2952 :SHA256
   "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f")
  (:PATH "raw/mutations/0/src/cache/core.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/cache/core.lisp")
   :BYTES 3503 :SHA256
   "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4")
  (:PATH "raw/mutations/0/src/cache/package.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/cache/package.lisp")
   :BYTES 758 :SHA256
   "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848")
  (:PATH "raw/mutations/0/src/cache/read.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/cache/read.lisp")
   :BYTES 6485 :SHA256
   "5700e43ae8ee859e96bdecb5953af43a712fd9e6ec23a53565759676bb07f85a")
  (:PATH "raw/mutations/0/src/cache/types.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/cache/types.lisp")
   :BYTES 2448 :SHA256
   "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30")
  (:PATH "raw/mutations/0/src/cache/write.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/cache/write.lisp")
   :BYTES 5481 :SHA256
   "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8")
  (:PATH "raw/mutations/0/src/codec/cbor-float-minimal.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH "raw/mutations/0/src/codec/cbor-header.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH "raw/mutations/0/src/codec/cbor-minimal.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH "raw/mutations/0/src/codec/cbor-package.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/codec/cbor-package.lisp")
   :BYTES 620 :SHA256
   "53fa9acbed8f5602b204252ff394c01fd01effdbe41baf021a713e2636cbd668")
  (:PATH "raw/mutations/0/src/codec/cbor-scan-input.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH "raw/mutations/0/src/codec/cbor-scan-items.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH "raw/mutations/0/src/codec/cbor-scan-minimal.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH "raw/mutations/0/src/codec/cbor-scan-stack.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH "raw/mutations/0/src/codec/cbor-scan.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH "raw/mutations/0/src/codec/cbor-simple-write.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/codec/cbor-simple-write.lisp")
   :BYTES 2866 :SHA256
   "7408771e69eb1a8eecb177894c30aed4fe00a769457f1f9cebf26ee17b94cee9")
  (:PATH "raw/mutations/0/src/codec/cbor-space.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH "raw/mutations/0/src/codec/cbor-string-write.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727")
  (:PATH "raw/mutations/0/src/codec/cbor-write.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/mutations/0/src/codec/package.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH "raw/mutations/0/src/codec/utf8.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH "raw/mutations/0/src/csn/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/csn/package.lisp")
   :BYTES 441 :SHA256
   "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0")
  (:PATH "raw/mutations/0/src/csn/registry.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/csn/registry.lisp")
   :BYTES 12139 :SHA256
   "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a")
  (:PATH "raw/mutations/0/src/epochs/core.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/epochs/core.lisp")
   :BYTES 5909 :SHA256
   "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399")
  (:PATH "raw/mutations/0/src/epochs/package.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/epochs/package.lisp")
   :BYTES 779 :SHA256
   "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd")
  (:PATH "raw/mutations/0/src/epochs/read.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/epochs/read.lisp")
   :BYTES 3240 :SHA256
   "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905")
  (:PATH "raw/mutations/0/src/epochs/reclaim.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/epochs/reclaim.lisp")
   :BYTES 6373 :SHA256
   "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202")
  (:PATH "raw/mutations/0/src/epochs/retire.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/epochs/retire.lisp")
   :BYTES 5858 :SHA256
   "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b")
  (:PATH "raw/mutations/0/src/epochs/types.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/epochs/types.lisp")
   :BYTES 5304 :SHA256
   "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097")
  (:PATH "raw/mutations/0/src/execution/handoff.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/execution/handoff.lisp")
   :BYTES 7394 :SHA256
   "ee90c809ef51134efa21e08b819e5530304efaf9f9e26b63c7e4afbf6d48e607")
  (:PATH "raw/mutations/0/src/execution/package.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/execution/package.lisp")
   :BYTES 1157 :SHA256
   "bbe8cdb6f7e74d7139f5e472a915cc74b43e34bd27ecac1c5fd364f723a2a643")
  (:PATH "raw/mutations/0/src/execution/queue.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/execution/queue.lisp")
   :BYTES 5374 :SHA256
   "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90")
  (:PATH "raw/mutations/0/src/execution/ready-recycle.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/execution/ready-recycle.lisp")
   :BYTES 3387 :SHA256
   "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b")
  (:PATH "raw/mutations/0/src/execution/ready-types.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/execution/ready-types.lisp")
   :BYTES 5248 :SHA256
   "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f")
  (:PATH "raw/mutations/0/src/execution/ready.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/execution/ready.lisp")
   :BYTES 6635 :SHA256
   "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327")
  (:PATH "raw/mutations/0/src/execution/worker-boundary.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/execution/worker-boundary.lisp")
   :BYTES 2309 :SHA256
   "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a")
  (:PATH "raw/mutations/0/src/execution/worker-claim.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/execution/worker-claim.lisp")
   :BYTES 6401 :SHA256
   "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e")
  (:PATH "raw/mutations/0/src/execution/worker-run.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/execution/worker-run.lisp")
   :BYTES 5124 :SHA256
   "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542")
  (:PATH "raw/mutations/0/src/execution/worker-types.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/execution/worker-types.lisp")
   :BYTES 8461 :SHA256
   "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317")
  (:PATH "raw/mutations/0/src/execution/writer.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/execution/writer.lisp")
   :BYTES 6484 :SHA256
   "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105")
  (:PATH "raw/mutations/0/src/foundation/batch.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH "raw/mutations/0/src/foundation/binary.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH "raw/mutations/0/src/foundation/conditions.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH "raw/mutations/0/src/foundation/crc32c.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH "raw/mutations/0/src/foundation/package.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH "raw/mutations/0/src/foundation/record.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH "raw/mutations/0/src/get-resolver/build.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/get-resolver/build.lisp")
   :BYTES 6882 :SHA256
   "3715cb750e08ab30fcaa068a05b17772381a3cf1975bdbdd0c03f71761089ef6")
  (:PATH "raw/mutations/0/src/get-resolver/package.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/get-resolver/package.lisp")
   :BYTES 1887 :SHA256
   "f244c1346604ccde93880824ea990a4a7329340df6c8b665963713977ca0ee10")
  (:PATH "raw/mutations/0/src/get-resolver/read.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/get-resolver/read.lisp")
   :BYTES 7259 :SHA256
   "68f82df01f7894f66db0c6545267616e76c0ba93fd7c49db6434cec666f02dc3")
  (:PATH "raw/mutations/0/src/get-resolver/rows.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/get-resolver/rows.lisp")
   :BYTES 3350 :SHA256
   "d9db85d788006fc7ad1f9a7cdeef28b992605de7fac8c295dd7fdc51f5511854")
  (:PATH "raw/mutations/0/src/get-resolver/scan.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/get-resolver/scan.lisp")
   :BYTES 6786 :SHA256
   "35a1780c6bf66364ef94c4151fa91f02eebe359f0ca0639985d2a907fd9d512d")
  (:PATH "raw/mutations/0/src/get-resolver/sort.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/get-resolver/sort.lisp")
   :BYTES 7118 :SHA256
   "974bf44efeb1cd26c5e9db0601aea295c8f1a18234894ad9d41938a2880e2255")
  (:PATH "raw/mutations/0/src/get-resolver/types.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/get-resolver/types.lisp")
   :BYTES 1757 :SHA256
   "1334512380bfb01add33b0ca152c0ce4746b3f79bcd04f84d7844ef234d6eaba")
  (:PATH "raw/mutations/0/src/get/build.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/get/build.lisp")
   :BYTES 3745 :SHA256
   "bcfc4916e9a85833dc151c4ce176bc905f2c03b6bc6d636f97a60df0d8c16739")
  (:PATH "raw/mutations/0/src/get/lifecycle.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/get/lifecycle.lisp")
   :BYTES 5345 :SHA256
   "885ba4141114ea411cac37c9b5f924aaa7f9f2a5ba311ebf92a392e5da1e3c59")
  (:PATH "raw/mutations/0/src/get/lookup.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/get/lookup.lisp")
   :BYTES 4352 :SHA256
   "9d1042d4cf1e7bd9c6d1153de12b2459e7a2724e47bd32534cd7ae56cb274c5f")
  (:PATH "raw/mutations/0/src/get/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/get/package.lisp")
   :BYTES 1995 :SHA256
   "87b795779aef0c4b918a039d182daddd22b902a9ad10c763df4364b7e630151c")
  (:PATH "raw/mutations/0/src/get/segment.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/get/segment.lisp")
   :BYTES 8097 :SHA256
   "4a486528cb2c1cc3471cb4b332d4314d24011889e1f885db6fd5600bb077eea3")
  (:PATH "raw/mutations/0/src/get/target.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/get/target.lisp")
   :BYTES 5652 :SHA256
   "9f682f735e49108cad176a6143ec99e1be64da98f29cae0b52f9b49cdea34250")
  (:PATH "raw/mutations/0/src/get/types.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/get/types.lisp")
   :BYTES 4413 :SHA256
   "653b23a6e719cd1f55e7c58b4d7e8143aec5983992ba210d0eac1f4c8682f623")
  (:PATH "raw/mutations/0/src/hash/arithmetic.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/hash/arithmetic.lisp")
   :BYTES 3073 :SHA256
   "c439e534b768acb123d69b921b85e1e56683aa8335bbc87efba95fe95f256fa9")
  (:PATH "raw/mutations/0/src/hash/blocks.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/hash/blocks.lisp")
   :BYTES 3262 :SHA256
   "5f5dff95ae6c34dfc15538c537ba2fa8d34ba2376ad66ad9975745ea13a2175f")
  (:PATH "raw/mutations/0/src/hash/hash64.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/hash/hash64.lisp")
   :BYTES 1768 :SHA256
   "99e4c8394a8f877ce1f552f15a57a082c0ec81015e87119ee4ffea28cf3ae77f")
  (:PATH "raw/mutations/0/src/hash/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/hash/package.lisp")
   :BYTES 477 :SHA256
   "1e7668fa26fc1a8e3b3cfe824aa3e08b30b57441d5f90d44453fc3a9259a10d0")
  (:PATH "raw/mutations/0/src/index/core.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/index/core.lisp")
   :BYTES 2959 :SHA256
   "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff")
  (:PATH "raw/mutations/0/src/index/hash-digests.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/index/hash-digests.lisp")
   :BYTES 3674 :SHA256
   "924bb7dab91ff56c1e909f2b06dff5f74b443ac6442e379498f29b25f1fa2673")
  (:PATH "raw/mutations/0/src/index/hash-seed.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/index/hash-seed.lisp")
   :BYTES 2437 :SHA256
   "ae86514101e95737747ba58a4f0c5dc1ddb44d2b3a18bceb8fd0d0756b57a7a1")
  (:PATH "raw/mutations/0/src/index/package.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/index/package.lisp")
   :BYTES 727 :SHA256
   "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507")
  (:PATH "raw/mutations/0/src/index/primary-arena.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/index/primary-arena.lisp")
   :BYTES 3485 :SHA256
   "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5")
  (:PATH "raw/mutations/0/src/index/primary-build.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/index/primary-build.lisp")
   :BYTES 5379 :SHA256
   "06ca5ac8c03504e2d2f973873e5cabf7518c090cd1f8f2118c46e0ea2f9bf37b")
  (:PATH "raw/mutations/0/src/index/primary-core.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/index/primary-core.lisp")
   :BYTES 4211 :SHA256
   "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e")
  (:PATH "raw/mutations/0/src/index/primary-directory.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/index/primary-directory.lisp")
   :BYTES 8114 :SHA256
   "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd")
  (:PATH "raw/mutations/0/src/index/primary-package.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/index/primary-package.lisp")
   :BYTES 1451 :SHA256
   "0682eb9a61596506b6788bd0285f9808db2496246caae64ab3203182ed46b860")
  (:PATH "raw/mutations/0/src/index/primary-probe.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/index/primary-probe.lisp")
   :BYTES 5936 :SHA256
   "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4")
  (:PATH "raw/mutations/0/src/index/primary-read.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/index/primary-read.lisp")
   :BYTES 3575 :SHA256
   "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f")
  (:PATH "raw/mutations/0/src/index/primary-relocate.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/index/primary-relocate.lisp")
   :BYTES 4073 :SHA256
   "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20")
  (:PATH "raw/mutations/0/src/index/primary-types.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/index/primary-types.lisp")
   :BYTES 3949 :SHA256
   "f17ca0dcd8a538b921f00044e23872b28272638c4435eacd30f0509422505e64")
  (:PATH "raw/mutations/0/src/index/primary-write.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/index/primary-write.lisp")
   :BYTES 7061 :SHA256
   "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655")
  (:PATH "raw/mutations/0/src/index/read.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/index/read.lisp")
   :BYTES 3030 :SHA256
   "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7")
  (:PATH "raw/mutations/0/src/index/rebuild-budget.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/index/rebuild-budget.lisp")
   :BYTES 3593 :SHA256
   "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0")
  (:PATH "raw/mutations/0/src/index/rebuild-copy.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/index/rebuild-copy.lisp")
   :BYTES 4027 :SHA256
   "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee")
  (:PATH "raw/mutations/0/src/index/rebuild-scan.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/index/rebuild-scan.lisp")
   :BYTES 5002 :SHA256
   "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e")
  (:PATH "raw/mutations/0/src/index/rebuild.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/index/rebuild.lisp")
   :BYTES 2872 :SHA256
   "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1")
  (:PATH "raw/mutations/0/src/index/relocate.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/index/relocate.lisp")
   :BYTES 2383 :SHA256
   "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc")
  (:PATH "raw/mutations/0/src/index/types.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/index/types.lisp")
   :BYTES 2434 :SHA256
   "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e")
  (:PATH "raw/mutations/0/src/index/validation.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/index/validation.lisp")
   :BYTES 3930 :SHA256
   "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a")
  (:PATH "raw/mutations/0/src/index/write.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/index/write.lisp")
   :BYTES 4784 :SHA256
   "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28")
  (:PATH "raw/mutations/0/src/io/flush.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/io/flush.lisp")
   :BYTES 1569 :SHA256
   "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325")
  (:PATH "raw/mutations/0/src/io/lifecycle.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/io/lifecycle.lisp")
   :BYTES 4536 :SHA256
   "baa1f763fe0f394a14d381b753dcb1be1e90eb03eaff5d6469465b5d4eca015f")
  (:PATH "raw/mutations/0/src/io/native.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/io/native.lisp")
   :BYTES 5026 :SHA256
   "b8cf3ce1ff7b4fa9def8a602ab768c0e9a321f8d6cdce6e5b2b7ded2fe3d97dd")
  (:PATH "raw/mutations/0/src/io/package.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/io/package.lisp")
   :BYTES 592 :SHA256
   "118eba04ab2aa87a2d86e0b0269dbeacaa485457acebbc12c57317ae465a89c0")
  (:PATH "raw/mutations/0/src/io/transfer.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/io/transfer.lisp")
   :BYTES 5051 :SHA256
   "3748328cf85e1c007900a63bdd0f159f38a8d7cd3577c92c56fc68692b9b7bcf")
  (:PATH "raw/mutations/0/src/io/types.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/io/types.lisp")
   :BYTES 4143 :SHA256
   "50c7eeea91af232fca7103ce5a25535958d73836f01cb45a20c7120b88b1336b")
  (:PATH "raw/mutations/0/src/mvcc/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/mvcc/package.lisp")
   :BYTES 833 :SHA256
   "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c")
  (:PATH "raw/mutations/0/src/mvcc/snapshots-core.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/mvcc/snapshots-core.lisp")
   :BYTES 7622 :SHA256
   "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998")
  (:PATH "raw/mutations/0/src/mvcc/snapshots-csn.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/mvcc/snapshots-csn.lisp")
   :BYTES 2725 :SHA256
   "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77")
  (:PATH "raw/mutations/0/src/mvcc/snapshots-lifecycle.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/mvcc/snapshots-lifecycle.lisp")
   :BYTES 6609 :SHA256
   "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082")
  (:PATH "raw/mutations/0/src/mvcc/snapshots-read.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/mvcc/snapshots-read.lisp")
   :BYTES 6651 :SHA256
   "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9")
  (:PATH "raw/mutations/0/src/mvcc/snapshots-register.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/mvcc/snapshots-register.lisp")
   :BYTES 6654 :SHA256
   "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b")
  (:PATH "raw/mutations/0/src/mvcc/snapshots-types.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/mvcc/snapshots-types.lisp")
   :BYTES 3817 :SHA256
   "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f")
  (:PATH "raw/mutations/0/src/mvcc/types.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/mvcc/types.lisp")
   :BYTES 471 :SHA256
   "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50")
  (:PATH "raw/mutations/0/src/package.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH "raw/mutations/0/src/read/core.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/read/core.lisp")
   :BYTES 3846 :SHA256
   "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f")
  (:PATH "raw/mutations/0/src/read/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/read/package.lisp")
   :BYTES 831 :SHA256
   "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df")
  (:PATH "raw/mutations/0/src/read/task.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/read/task.lisp")
   :BYTES 5073 :SHA256
   "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2")
  (:PATH "raw/mutations/0/src/read/types.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/read/types.lisp")
   :BYTES 2358 :SHA256
   "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c")
  (:PATH "raw/mutations/0/src/recovery/decisions-build.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/recovery/decisions-build.lisp")
   :BYTES 11857 :SHA256
   "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115")
  (:PATH "raw/mutations/0/src/recovery/decisions-package.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/recovery/decisions-package.lisp")
   :BYTES 818 :SHA256
   "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39")
  (:PATH "raw/mutations/0/src/recovery/decisions-query.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/recovery/decisions-query.lisp")
   :BYTES 4525 :SHA256
   "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24")
  (:PATH "raw/mutations/0/src/recovery/decisions-radix.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/recovery/decisions-radix.lisp")
   :BYTES 11061 :SHA256
   "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54")
  (:PATH "raw/mutations/0/src/recovery/decisions-sort.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/recovery/decisions-sort.lisp")
   :BYTES 7654 :SHA256
   "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2")
  (:PATH "raw/mutations/0/src/recovery/decisions-types.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/recovery/decisions-types.lisp")
   :BYTES 2056 :SHA256
   "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c")
  (:PATH "raw/mutations/0/src/recovery/inventory-build.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/recovery/inventory-build.lisp")
   :BYTES 9592 :SHA256
   "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e")
  (:PATH "raw/mutations/0/src/recovery/inventory-query.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/recovery/inventory-query.lisp")
   :BYTES 2100 :SHA256
   "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb")
  (:PATH "raw/mutations/0/src/recovery/inventory-types.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/recovery/inventory-types.lisp")
   :BYTES 2392 :SHA256
   "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9")
  (:PATH "raw/mutations/0/src/recovery/manifest-build.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/recovery/manifest-build.lisp")
   :BYTES 10251 :SHA256
   "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471")
  (:PATH "raw/mutations/0/src/recovery/manifest-decode.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/recovery/manifest-decode.lisp")
   :BYTES 6160 :SHA256
   "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779")
  (:PATH "raw/mutations/0/src/recovery/manifest-fold.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/recovery/manifest-fold.lisp")
   :BYTES 7068 :SHA256
   "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730")
  (:PATH "raw/mutations/0/src/recovery/manifest-package.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/recovery/manifest-package.lisp")
   :BYTES 1372 :SHA256
   "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc")
  (:PATH "raw/mutations/0/src/recovery/manifest-query.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/recovery/manifest-query.lisp")
   :BYTES 3582 :SHA256
   "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b")
  (:PATH "raw/mutations/0/src/recovery/manifest-types.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/recovery/manifest-types.lisp")
   :BYTES 3345 :SHA256
   "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10")
  (:PATH "raw/mutations/0/src/recovery/package.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/recovery/package.lisp")
   :BYTES 927 :SHA256
   "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9")
  (:PATH "raw/mutations/0/src/recovery/scan.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/recovery/scan.lisp")
   :BYTES 12829 :SHA256
   "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218")
  (:PATH "raw/mutations/0/src/series/events.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/series/events.lisp")
   :BYTES 9566 :SHA256
   "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7")
  (:PATH "raw/mutations/0/src/series/io-events.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/series/io-events.lisp")
   :BYTES 5385 :SHA256
   "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546")
  (:PATH "raw/mutations/0/src/series/ownership.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/series/ownership.lisp")
   :BYTES 8810 :SHA256
   "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4")
  (:PATH "raw/mutations/0/src/series/package.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/series/package.lisp")
   :BYTES 1392 :SHA256
   "7433162105df63d324141167e6dcf6bfee74611aa1cf7291cc6c92f41f3c7408")
  (:PATH "raw/mutations/0/src/series/publication.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/series/publication.lisp")
   :BYTES 6094 :SHA256
   "288cb3fa41fad76a0e6919dfa0b2fce2beef15f5880129393bee35bc8795c762")
  (:PATH "raw/mutations/0/src/series/query.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/series/query.lisp")
   :BYTES 3600 :SHA256
   "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9")
  (:PATH "raw/mutations/0/src/series/retirement.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/series/retirement.lisp")
   :BYTES 4634 :SHA256
   "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059")
  (:PATH "raw/mutations/0/src/series/types.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/series/types.lisp")
   :BYTES 3316 :SHA256
   "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9")
  (:PATH "raw/mutations/0/src/series/worker-boundary.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/series/worker-boundary.lisp")
   :BYTES 3443 :SHA256
   "793d401d1b9acc7b67923d815560f277f3d390ca050740f735f07d88dbacfe73")
  (:PATH "raw/mutations/0/src/series/worker-package.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/series/worker-package.lisp")
   :BYTES 1036 :SHA256
   "881a2958ddb8f5781954d4c59d7467e34c03c01fbb2fea43dc06e9e2050a1f37")
  (:PATH "raw/mutations/0/src/series/worker-run.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/series/worker-run.lisp")
   :BYTES 6985 :SHA256
   "f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f")
  (:PATH "raw/mutations/0/src/series/worker-types.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/series/worker-types.lisp")
   :BYTES 6493 :SHA256
   "a366799fd9b938bfaa48b0ffda228ff8369ab9acb5b5ead7f081dfc66ab2c81a")
  (:PATH "raw/mutations/0/src/storage/compaction-scan.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/storage/compaction-scan.lisp")
   :BYTES 5510 :SHA256
   "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d")
  (:PATH "raw/mutations/0/src/storage/control-payload.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/storage/control-payload.lisp")
   :BYTES 6273 :SHA256
   "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491")
  (:PATH "raw/mutations/0/src/storage/formats.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/storage/formats.lisp")
   :BYTES 3841 :SHA256
   "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f")
  (:PATH "raw/mutations/0/src/storage/log-header.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/storage/log-header.lisp")
   :BYTES 3947 :SHA256
   "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81")
  (:PATH "raw/mutations/0/src/storage/package.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/storage/package.lisp")
   :BYTES 1079 :SHA256
   "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e")
  (:PATH "raw/mutations/0/src/storage/payload-record.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/storage/payload-record.lisp")
   :BYTES 3641 :SHA256
   "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7")
  (:PATH "raw/mutations/0/src/storage/payload-write.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/storage/payload-write.lisp")
   :BYTES 5239 :SHA256
   "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc")
  (:PATH "raw/mutations/0/src/storage/segment-header.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/storage/segment-header.lisp")
   :BYTES 5517 :SHA256
   "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011")
  (:PATH "raw/mutations/0/src/wal/builder.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/wal/builder.lisp")
   :BYTES 8445 :SHA256
   "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0")
  (:PATH "raw/mutations/0/src/wal/csn.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/wal/csn.lisp")
   :BYTES 9577 :SHA256
   "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810")
  (:PATH "raw/mutations/0/src/wal/executor.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/wal/executor.lisp")
   :BYTES 6023 :SHA256
   "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8")
  (:PATH "raw/mutations/0/src/wal/group.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/wal/group.lisp")
   :BYTES 6305 :SHA256
   "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b")
  (:PATH "raw/mutations/0/src/wal/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/wal/package.lisp")
   :BYTES 1774 :SHA256
   "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89")
  (:PATH "raw/mutations/0/src/wal/types.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/src/wal/types.lisp")
   :BYTES 5420 :SHA256
   "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e")
  (:PATH "raw/mutations/0/test.log" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/test.log")
   :BYTES 25594 :SHA256
   "2c69ddc9ace30a4c0df6d50279e37c8381f22bd155f632c1d2769923c0d3a3e9")
  (:PATH "raw/mutations/0/tests/codec/cbor-header.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/codec/cbor-header.lisp")
   :BYTES 10773 :SHA256
   "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815")
  (:PATH "raw/mutations/0/tests/codec/cbor-minimal-edges.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/codec/cbor-minimal-edges.lisp")
   :BYTES 1613 :SHA256
   "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70")
  (:PATH "raw/mutations/0/tests/codec/cbor-minimal-scan-support.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/codec/cbor-minimal-scan-support.lisp")
   :BYTES 8363 :SHA256
   "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421")
  (:PATH "raw/mutations/0/tests/codec/cbor-minimal-scan-threads.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/codec/cbor-minimal-scan-threads.lisp")
   :BYTES 4547 :SHA256
   "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660")
  (:PATH "raw/mutations/0/tests/codec/cbor-minimal-scan.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/codec/cbor-minimal-scan.lisp")
   :BYTES 19217 :SHA256
   "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8")
  (:PATH "raw/mutations/0/tests/codec/cbor-minimal-support.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/codec/cbor-minimal-support.lisp")
   :BYTES 8620 :SHA256
   "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a")
  (:PATH "raw/mutations/0/tests/codec/cbor-minimal-threads.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/codec/cbor-minimal-threads.lisp")
   :BYTES 3799 :SHA256
   "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2")
  (:PATH "raw/mutations/0/tests/codec/cbor-minimal.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/codec/cbor-minimal.lisp")
   :BYTES 12604 :SHA256
   "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3")
  (:PATH "raw/mutations/0/tests/codec/cbor-simple-write-support.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/codec/cbor-simple-write-support.lisp")
   :BYTES 4955 :SHA256
   "53ceafc72a027a2ff1f787900558ff26f2ff70bbb212f1b37926a6d520fbe86e")
  (:PATH "raw/mutations/0/tests/codec/cbor-simple-write-threads.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/codec/cbor-simple-write-threads.lisp")
   :BYTES 3561 :SHA256
   "77074033e75a224fd02e890f98dffa8e97d3a1f8bedd510b00ea55d8ff8687b2")
  (:PATH "raw/mutations/0/tests/codec/cbor-simple-write.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/codec/cbor-simple-write.lisp")
   :BYTES 10712 :SHA256
   "958bdd3901cfc41032c09d6c9023b192799981884e09ce3573256ff45bc5329a")
  (:PATH "raw/mutations/0/tests/codec/cbor-string-write-support.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/codec/cbor-string-write-support.lisp")
   :BYTES 6868 :SHA256
   "2cbdb601f442a56456bc637c94e759cc965f44b178268dce3c636c385d34fc39")
  (:PATH "raw/mutations/0/tests/codec/cbor-string-write-threads.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/codec/cbor-string-write-threads.lisp")
   :BYTES 3512 :SHA256
   "8e07b881a55e2554a429f1c8b2c69f67862ac015217d90d019167d636564d27d")
  (:PATH "raw/mutations/0/tests/codec/cbor-string-write.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/codec/cbor-string-write.lisp")
   :BYTES 15883 :SHA256
   "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115")
  (:PATH "raw/mutations/0/tests/codec/cbor-structure-support.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:PATH "raw/mutations/0/tests/codec/cbor-structure-threads.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/codec/cbor-structure-threads.lisp")
   :BYTES 4305 :SHA256
   "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645")
  (:PATH "raw/mutations/0/tests/codec/cbor-structure.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/codec/cbor-structure.lisp")
   :BYTES 22968 :SHA256
   "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110")
  (:PATH "raw/mutations/0/tests/codec/cbor-support.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:PATH "raw/mutations/0/tests/codec/cbor-threads.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/codec/cbor-threads.lisp")
   :BYTES 3683 :SHA256
   "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14")
  (:PATH "raw/mutations/0/tests/codec/cbor-write-roundtrip.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/codec/cbor-write-roundtrip.lisp")
   :BYTES 901 :SHA256
   "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344")
  (:PATH "raw/mutations/0/tests/codec/cbor-write-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/codec/cbor-write-support.lisp")
   :BYTES 4768 :SHA256
   "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6")
  (:PATH "raw/mutations/0/tests/codec/cbor-write-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/codec/cbor-write-threads.lisp")
   :BYTES 3813 :SHA256
   "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb")
  (:PATH "raw/mutations/0/tests/codec/cbor-write.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/codec/cbor-write.lisp")
   :BYTES 9822 :SHA256
   "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3")
  (:PATH "raw/mutations/0/tests/codec/support.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/codec/support.lisp")
   :BYTES 5807 :SHA256
   "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96")
  (:PATH "raw/mutations/0/tests/codec/threads.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/codec/threads.lisp")
   :BYTES 3111 :SHA256
   "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337")
  (:PATH "raw/mutations/0/tests/codec/utf8.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/codec/utf8.lisp")
   :BYTES 12892 :SHA256
   "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100")
  (:PATH "raw/mutations/0/tests/csn/registry.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/csn/registry.lisp")
   :BYTES 19411 :SHA256
   "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950")
  (:PATH "raw/mutations/0/tests/csn/support.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/csn/support.lisp")
   :BYTES 11407 :SHA256
   "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db")
  (:PATH "raw/mutations/0/tests/csn/threads.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/csn/threads.lisp")
   :BYTES 10525 :SHA256
   "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2")
  (:PATH "raw/mutations/0/tests/epochs/lifecycle.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/epochs/lifecycle.lisp")
   :BYTES 25394 :SHA256
   "ddc2fbdad9f97d2e4ff008c167776a50b17b742398306fbd5198dca474559cbf")
  (:PATH "raw/mutations/0/tests/epochs/support.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/epochs/support.lisp")
   :BYTES 5943 :SHA256
   "366be7af4bf6c4ed946b3fa9e97aea6b034c83e3b757d81c54078dc76d229b6d")
  (:PATH "raw/mutations/0/tests/epochs/threads.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/epochs/threads.lisp")
   :BYTES 3654 :SHA256
   "54b73e06c61e64f32a3e3af0791891dacb6590e929163dcf0fac95f2c71e66fd")
  (:PATH "raw/mutations/0/tests/execution/handoff.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/execution/handoff.lisp")
   :BYTES 33278 :SHA256
   "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e")
  (:PATH "raw/mutations/0/tests/execution/queue.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/execution/queue.lisp")
   :BYTES 12894 :SHA256
   "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722")
  (:PATH "raw/mutations/0/tests/execution/ready-recycle.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/execution/ready-recycle.lisp")
   :BYTES 30075 :SHA256
   "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae")
  (:PATH "raw/mutations/0/tests/execution/ready.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/execution/ready.lisp")
   :BYTES 33555 :SHA256
   "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e")
  (:PATH "raw/mutations/0/tests/execution/support.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/execution/support.lisp")
   :BYTES 4469 :SHA256
   "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43")
  (:PATH "raw/mutations/0/tests/execution/threads.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/execution/threads.lisp")
   :BYTES 14622 :SHA256
   "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359")
  (:PATH "raw/mutations/0/tests/execution/worker.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/execution/worker.lisp")
   :BYTES 59783 :SHA256
   "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06")
  (:PATH "raw/mutations/0/tests/foundation/batch.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/foundation/batch.lisp")
   :BYTES 5185 :SHA256
   "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183")
  (:PATH "raw/mutations/0/tests/foundation/binary.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/foundation/binary.lisp")
   :BYTES 3721 :SHA256
   "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe")
  (:PATH "raw/mutations/0/tests/foundation/record.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/foundation/record.lisp")
   :BYTES 14950 :SHA256
   "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8")
  (:PATH "raw/mutations/0/tests/foundation/support.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:PATH "raw/mutations/0/tests/get-performance/guards.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/get-performance/guards.lisp")
   :BYTES 8986 :SHA256
   "c41721b917ed443355ea3707efdd07e7da53a978c0515ab1e5ede5fcc47d63fc")
  (:PATH "raw/mutations/0/tests/get-performance/paths.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/get-performance/paths.lisp")
   :BYTES 4936 :SHA256
   "3b8d2c9c93467507ea2bb471d42192eb1fa084b55c0f4263b5ef0d3acf468f55")
  (:PATH "raw/mutations/0/tests/get-performance/support.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/get-performance/support.lisp")
   :BYTES 22497 :SHA256
   "e586ed94dcb2aaba00282931cdd83313e4f84a86d4d1ba85e2d56e8b7433ed8d")
  (:PATH "raw/mutations/0/tests/get-performance/threads.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/get-performance/threads.lisp")
   :BYTES 4744 :SHA256
   "05ace5eb351ab49da59611dc1a2a5abedb9d723a2fc6e75a30fc76e507573a90")
  (:PATH "raw/mutations/0/tests/hash/guards.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/hash/guards.lisp")
   :BYTES 1162 :SHA256
   "9af5b38443a57d224990a68e93f12f7a4cda306f94c7ccd3ccb50635865d7864")
  (:PATH "raw/mutations/0/tests/hash/hash64.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/hash/hash64.lisp")
   :BYTES 17948 :SHA256
   "70606bc68807143cfea9583871474c84efc868d13692cde28488284dee43e0f1")
  (:PATH "raw/mutations/0/tests/hash/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/hash/support.lisp")
   :BYTES 10828 :SHA256
   "0fae9dc36976af544f83e6051b9cf9d67c9bef0b9e25f1fa2a48fdac48592acb")
  (:PATH "raw/mutations/0/tests/hash/threads.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/hash/threads.lisp")
   :BYTES 6701 :SHA256
   "3fc587a57d26a294aebfc6a7aeadf2f61a42a21106c1c57517f891b76b4e750a")
  (:PATH "raw/mutations/0/tests/index/hash-digests.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/index/hash-digests.lisp")
   :BYTES 35926 :SHA256
   "3b3b39f861883cf2017cab8e6488560a6bb3897d63784f00e820a6450d743225")
  (:PATH "raw/mutations/0/tests/index/primary-support.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/index/primary-support.lisp")
   :BYTES 13938 :SHA256
   "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a")
  (:PATH "raw/mutations/0/tests/index/primary-threads.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/index/primary-threads.lisp")
   :BYTES 13744 :SHA256
   "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2")
  (:PATH "raw/mutations/0/tests/index/primary.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/index/primary.lisp")
   :BYTES 30166 :SHA256
   "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696")
  (:PATH "raw/mutations/0/tests/index/rebuild.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/index/rebuild.lisp")
   :BYTES 32112 :SHA256
   "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1")
  (:PATH "raw/mutations/0/tests/index/slot-support.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/index/slot-support.lisp")
   :BYTES 12800 :SHA256
   "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31")
  (:PATH "raw/mutations/0/tests/index/slot-threads.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/index/slot-threads.lisp")
   :BYTES 11698 :SHA256
   "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f")
  (:PATH "raw/mutations/0/tests/index/slots.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/index/slots.lisp")
   :BYTES 26420 :SHA256
   "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb")
  (:PATH "raw/mutations/0/tests/io/native.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/io/native.lisp")
   :BYTES 6207 :SHA256
   "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0")
  (:PATH "raw/mutations/0/tests/io/support.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/io/support.lisp")
   :BYTES 2951 :SHA256
   "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50")
  (:PATH "raw/mutations/0/tests/io/transfer.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/io/transfer.lisp")
   :BYTES 11847 :SHA256
   "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd")
  (:PATH "raw/mutations/0/tests/lint-fixtures/bad.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/lint-fixtures/bad.lisp")
   :BYTES 1587 :SHA256
   "ac8912ce6cc1101f2ebc305a50c0565879547b527d7ca0aeac900ee06bf26652")
  (:PATH "raw/mutations/0/tests/lint-fixtures/good.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/lint-fixtures/good.lisp")
   :BYTES 671 :SHA256
   "05ce84f8fd12d9af48252601bcc92d6d60335b53f39b01a9fe2697c4bdaa8cee")
  (:PATH "raw/mutations/0/tests/lint-fixtures/keyword-barrier.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/lint-fixtures/keyword-barrier.lisp")
   :BYTES 199 :SHA256
   "e26dab117e9526ace35bb45b92f977065d33fcc4404c40fd4fc3c77749689a96")
  (:PATH "raw/mutations/0/tests/lint-fixtures/qualified-reader.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/lint-fixtures/qualified-reader.lisp")
   :BYTES 152 :SHA256
   "835229bdc1a0ed0c08511cd6121e1f1bc4284da2cfba951b72cd1a74a6040d35")
  (:PATH "raw/mutations/0/tests/mvcc/capture.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/mvcc/capture.lisp")
   :BYTES 16356 :SHA256
   "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35")
  (:PATH "raw/mutations/0/tests/mvcc/lifecycle.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/mvcc/lifecycle.lisp")
   :BYTES 23964 :SHA256
   "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16")
  (:PATH "raw/mutations/0/tests/mvcc/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/mvcc/support.lisp")
   :BYTES 5931 :SHA256
   "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290")
  (:PATH "raw/mutations/0/tests/read/lifecycle.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/read/lifecycle.lisp")
   :BYTES 17804 :SHA256
   "c4c4642408816f2e0e809e21d04739b68b9391237e3e46ea0b195ed82857c3a8")
  (:PATH "raw/mutations/0/tests/read/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/read/support.lisp")
   :BYTES 4845 :SHA256
   "8095cc39d49342f6e43f3421b4fced839da02d8d11b4d8ddcd91bd346447e754")
  (:PATH "raw/mutations/0/tests/read/threads.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/read/threads.lisp")
   :BYTES 4150 :SHA256
   "e2e223b69b08a5d76b9773c6ad4dee13ef2ddbb6f5ababa713cc5654bc7b51c5")
  (:PATH "raw/mutations/0/tests/recovery/corruption.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/recovery/corruption.lisp")
   :BYTES 7106 :SHA256
   "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c")
  (:PATH "raw/mutations/0/tests/recovery/decisions-audit.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/recovery/decisions-audit.lisp")
   :BYTES 14971 :SHA256
   "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0")
  (:PATH "raw/mutations/0/tests/recovery/decisions-radix.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/recovery/decisions-radix.lisp")
   :BYTES 27851 :SHA256
   "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0")
  (:PATH "raw/mutations/0/tests/recovery/decisions-support.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/recovery/decisions-support.lisp")
   :BYTES 6797 :SHA256
   "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4")
  (:PATH "raw/mutations/0/tests/recovery/decisions.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/recovery/decisions.lisp")
   :BYTES 19149 :SHA256
   "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e")
  (:PATH "raw/mutations/0/tests/recovery/inventory-support.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/recovery/inventory-support.lisp")
   :BYTES 8083 :SHA256
   "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27")
  (:PATH "raw/mutations/0/tests/recovery/inventory.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/recovery/inventory.lisp")
   :BYTES 14479 :SHA256
   "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9")
  (:PATH "raw/mutations/0/tests/recovery/manifest-audit.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/recovery/manifest-audit.lisp")
   :BYTES 17670 :SHA256
   "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6")
  (:PATH "raw/mutations/0/tests/recovery/manifest-support.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/recovery/manifest-support.lisp")
   :BYTES 9769 :SHA256
   "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830")
  (:PATH "raw/mutations/0/tests/recovery/manifest.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/recovery/manifest.lisp")
   :BYTES 13799 :SHA256
   "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd")
  (:PATH "raw/mutations/0/tests/recovery/scan.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/recovery/scan.lisp")
   :BYTES 16966 :SHA256
   "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b")
  (:PATH "raw/mutations/0/tests/recovery/support.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/recovery/support.lisp")
   :BYTES 5957 :SHA256
   "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204")
  (:PATH "raw/mutations/0/tests/series/boundaries.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/series/boundaries.lisp")
   :BYTES 5802 :SHA256
   "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8")
  (:PATH "raw/mutations/0/tests/series/controller.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/series/controller.lisp")
   :BYTES 60484 :SHA256
   "4bea80eb231575f48b208ddb57af6a11706481e0ec755b084f6cd4b6fd0481a1")
  (:PATH "raw/mutations/0/tests/series/support.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/series/support.lisp")
   :BYTES 16885 :SHA256
   "8821ae9e002941eff8ea3ae7dbfc727cb6874b68d2d1ef85af668eb2d34a0c0c")
  (:PATH "raw/mutations/0/tests/series/threads.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/series/threads.lisp")
   :BYTES 19694 :SHA256
   "bbea64d207d14698b39ab0f8ded03db11bab09955d3f66705c23d69c09aefc8e")
  (:PATH "raw/mutations/0/tests/series/worker-bridge.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/series/worker-bridge.lisp")
   :BYTES 56677 :SHA256
   "c1ee49702e63978a83cb86c4e5bf437a5a40e48fa02b65d3eaf3dca0d2e39176")
  (:PATH "raw/mutations/0/tests/smoke.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/smoke.lisp")
   :BYTES 735 :SHA256
   "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8")
  (:PATH "raw/mutations/0/tests/storage/compaction-scan.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/storage/compaction-scan.lisp")
   :BYTES 16196 :SHA256
   "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5")
  (:PATH "raw/mutations/0/tests/storage/control-payload.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/storage/control-payload.lisp")
   :BYTES 12651 :SHA256
   "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae")
  (:PATH "raw/mutations/0/tests/storage/log-header.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/storage/log-header.lisp")
   :BYTES 11969 :SHA256
   "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e")
  (:PATH "raw/mutations/0/tests/storage/segment-header.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/storage/segment-header.lisp")
   :BYTES 4149 :SHA256
   "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df")
  (:PATH "raw/mutations/0/tests/storage/support.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/storage/support.lisp")
   :BYTES 4029 :SHA256
   "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625")
  (:PATH "raw/mutations/0/tests/wal/builder.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/wal/builder.lisp")
   :BYTES 4000 :SHA256
   "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6")
  (:PATH "raw/mutations/0/tests/wal/csn-threads.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/wal/csn-threads.lisp")
   :BYTES 12114 :SHA256
   "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c")
  (:PATH "raw/mutations/0/tests/wal/csn.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/wal/csn.lisp")
   :BYTES 34661 :SHA256
   "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a")
  (:PATH "raw/mutations/0/tests/wal/fault.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/wal/fault.lisp")
   :BYTES 7614 :SHA256
   "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875")
  (:PATH "raw/mutations/0/tests/wal/group.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/wal/group.lisp")
   :BYTES 5524 :SHA256
   "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e")
  (:PATH "raw/mutations/0/tests/wal/native.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/wal/native.lisp")
   :BYTES 2567 :SHA256
   "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7")
  (:PATH "raw/mutations/0/tests/wal/support.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tests/wal/support.lisp")
   :BYTES 1951 :SHA256
   "90a47539e5e2898c0a08059207f30bb5551e7ca8fc166f8f6ce7b95afa757295")
  (:PATH "raw/mutations/0/tools/build.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/0/tools/cbor-simple-write-isolated-build.lisp" :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/0/tools/cbor-simple-write-isolated-build.lisp")
   :BYTES 478 :SHA256
   "76a8633f7639b4208c013891469385a94814ddcd132f5904d3b00434a7d4c5e0")
  (:PATH "raw/mutations/1/src/cache/build.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/cache/build.lisp")
   :BYTES 4966 :SHA256
   "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0")
  (:PATH "raw/mutations/1/src/cache/clock.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/cache/clock.lisp")
   :BYTES 2952 :SHA256
   "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f")
  (:PATH "raw/mutations/1/src/cache/core.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/cache/core.lisp")
   :BYTES 3503 :SHA256
   "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4")
  (:PATH "raw/mutations/1/src/cache/package.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/cache/package.lisp")
   :BYTES 758 :SHA256
   "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848")
  (:PATH "raw/mutations/1/src/cache/read.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/cache/read.lisp")
   :BYTES 6485 :SHA256
   "5700e43ae8ee859e96bdecb5953af43a712fd9e6ec23a53565759676bb07f85a")
  (:PATH "raw/mutations/1/src/cache/types.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/cache/types.lisp")
   :BYTES 2448 :SHA256
   "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30")
  (:PATH "raw/mutations/1/src/cache/write.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/cache/write.lisp")
   :BYTES 5481 :SHA256
   "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8")
  (:PATH "raw/mutations/1/src/codec/cbor-float-minimal.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH "raw/mutations/1/src/codec/cbor-header.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH "raw/mutations/1/src/codec/cbor-minimal.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH "raw/mutations/1/src/codec/cbor-package.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/codec/cbor-package.lisp")
   :BYTES 620 :SHA256
   "53fa9acbed8f5602b204252ff394c01fd01effdbe41baf021a713e2636cbd668")
  (:PATH "raw/mutations/1/src/codec/cbor-scan-input.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH "raw/mutations/1/src/codec/cbor-scan-items.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH "raw/mutations/1/src/codec/cbor-scan-minimal.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH "raw/mutations/1/src/codec/cbor-scan-stack.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH "raw/mutations/1/src/codec/cbor-scan.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH "raw/mutations/1/src/codec/cbor-simple-write.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/codec/cbor-simple-write.lisp")
   :BYTES 2887 :SHA256
   "065a7fe11fc339c01fe97afbb87c9aee7aa89e1b22a890bcbb30f9bba165ead3")
  (:PATH "raw/mutations/1/src/codec/cbor-space.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH "raw/mutations/1/src/codec/cbor-string-write.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727")
  (:PATH "raw/mutations/1/src/codec/cbor-write.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/mutations/1/src/codec/package.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH "raw/mutations/1/src/codec/utf8.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH "raw/mutations/1/src/csn/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/csn/package.lisp")
   :BYTES 441 :SHA256
   "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0")
  (:PATH "raw/mutations/1/src/csn/registry.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/csn/registry.lisp")
   :BYTES 12139 :SHA256
   "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a")
  (:PATH "raw/mutations/1/src/epochs/core.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/epochs/core.lisp")
   :BYTES 5909 :SHA256
   "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399")
  (:PATH "raw/mutations/1/src/epochs/package.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/epochs/package.lisp")
   :BYTES 779 :SHA256
   "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd")
  (:PATH "raw/mutations/1/src/epochs/read.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/epochs/read.lisp")
   :BYTES 3240 :SHA256
   "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905")
  (:PATH "raw/mutations/1/src/epochs/reclaim.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/epochs/reclaim.lisp")
   :BYTES 6373 :SHA256
   "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202")
  (:PATH "raw/mutations/1/src/epochs/retire.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/epochs/retire.lisp")
   :BYTES 5858 :SHA256
   "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b")
  (:PATH "raw/mutations/1/src/epochs/types.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/epochs/types.lisp")
   :BYTES 5304 :SHA256
   "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097")
  (:PATH "raw/mutations/1/src/execution/handoff.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/execution/handoff.lisp")
   :BYTES 7394 :SHA256
   "ee90c809ef51134efa21e08b819e5530304efaf9f9e26b63c7e4afbf6d48e607")
  (:PATH "raw/mutations/1/src/execution/package.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/execution/package.lisp")
   :BYTES 1157 :SHA256
   "bbe8cdb6f7e74d7139f5e472a915cc74b43e34bd27ecac1c5fd364f723a2a643")
  (:PATH "raw/mutations/1/src/execution/queue.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/execution/queue.lisp")
   :BYTES 5374 :SHA256
   "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90")
  (:PATH "raw/mutations/1/src/execution/ready-recycle.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/execution/ready-recycle.lisp")
   :BYTES 3387 :SHA256
   "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b")
  (:PATH "raw/mutations/1/src/execution/ready-types.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/execution/ready-types.lisp")
   :BYTES 5248 :SHA256
   "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f")
  (:PATH "raw/mutations/1/src/execution/ready.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/execution/ready.lisp")
   :BYTES 6635 :SHA256
   "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327")
  (:PATH "raw/mutations/1/src/execution/worker-boundary.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/execution/worker-boundary.lisp")
   :BYTES 2309 :SHA256
   "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a")
  (:PATH "raw/mutations/1/src/execution/worker-claim.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/execution/worker-claim.lisp")
   :BYTES 6401 :SHA256
   "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e")
  (:PATH "raw/mutations/1/src/execution/worker-run.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/execution/worker-run.lisp")
   :BYTES 5124 :SHA256
   "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542")
  (:PATH "raw/mutations/1/src/execution/worker-types.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/execution/worker-types.lisp")
   :BYTES 8461 :SHA256
   "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317")
  (:PATH "raw/mutations/1/src/execution/writer.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/execution/writer.lisp")
   :BYTES 6484 :SHA256
   "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105")
  (:PATH "raw/mutations/1/src/foundation/batch.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH "raw/mutations/1/src/foundation/binary.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH "raw/mutations/1/src/foundation/conditions.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH "raw/mutations/1/src/foundation/crc32c.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH "raw/mutations/1/src/foundation/package.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH "raw/mutations/1/src/foundation/record.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH "raw/mutations/1/src/get-resolver/build.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/get-resolver/build.lisp")
   :BYTES 6882 :SHA256
   "3715cb750e08ab30fcaa068a05b17772381a3cf1975bdbdd0c03f71761089ef6")
  (:PATH "raw/mutations/1/src/get-resolver/package.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/get-resolver/package.lisp")
   :BYTES 1887 :SHA256
   "f244c1346604ccde93880824ea990a4a7329340df6c8b665963713977ca0ee10")
  (:PATH "raw/mutations/1/src/get-resolver/read.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/get-resolver/read.lisp")
   :BYTES 7259 :SHA256
   "68f82df01f7894f66db0c6545267616e76c0ba93fd7c49db6434cec666f02dc3")
  (:PATH "raw/mutations/1/src/get-resolver/rows.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/get-resolver/rows.lisp")
   :BYTES 3350 :SHA256
   "d9db85d788006fc7ad1f9a7cdeef28b992605de7fac8c295dd7fdc51f5511854")
  (:PATH "raw/mutations/1/src/get-resolver/scan.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/get-resolver/scan.lisp")
   :BYTES 6786 :SHA256
   "35a1780c6bf66364ef94c4151fa91f02eebe359f0ca0639985d2a907fd9d512d")
  (:PATH "raw/mutations/1/src/get-resolver/sort.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/get-resolver/sort.lisp")
   :BYTES 7118 :SHA256
   "974bf44efeb1cd26c5e9db0601aea295c8f1a18234894ad9d41938a2880e2255")
  (:PATH "raw/mutations/1/src/get-resolver/types.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/get-resolver/types.lisp")
   :BYTES 1757 :SHA256
   "1334512380bfb01add33b0ca152c0ce4746b3f79bcd04f84d7844ef234d6eaba")
  (:PATH "raw/mutations/1/src/get/build.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/get/build.lisp")
   :BYTES 3745 :SHA256
   "bcfc4916e9a85833dc151c4ce176bc905f2c03b6bc6d636f97a60df0d8c16739")
  (:PATH "raw/mutations/1/src/get/lifecycle.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/get/lifecycle.lisp")
   :BYTES 5345 :SHA256
   "885ba4141114ea411cac37c9b5f924aaa7f9f2a5ba311ebf92a392e5da1e3c59")
  (:PATH "raw/mutations/1/src/get/lookup.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/get/lookup.lisp")
   :BYTES 4352 :SHA256
   "9d1042d4cf1e7bd9c6d1153de12b2459e7a2724e47bd32534cd7ae56cb274c5f")
  (:PATH "raw/mutations/1/src/get/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/get/package.lisp")
   :BYTES 1995 :SHA256
   "87b795779aef0c4b918a039d182daddd22b902a9ad10c763df4364b7e630151c")
  (:PATH "raw/mutations/1/src/get/segment.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/get/segment.lisp")
   :BYTES 8097 :SHA256
   "4a486528cb2c1cc3471cb4b332d4314d24011889e1f885db6fd5600bb077eea3")
  (:PATH "raw/mutations/1/src/get/target.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/get/target.lisp")
   :BYTES 5652 :SHA256
   "9f682f735e49108cad176a6143ec99e1be64da98f29cae0b52f9b49cdea34250")
  (:PATH "raw/mutations/1/src/get/types.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/get/types.lisp")
   :BYTES 4413 :SHA256
   "653b23a6e719cd1f55e7c58b4d7e8143aec5983992ba210d0eac1f4c8682f623")
  (:PATH "raw/mutations/1/src/hash/arithmetic.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/hash/arithmetic.lisp")
   :BYTES 3073 :SHA256
   "c439e534b768acb123d69b921b85e1e56683aa8335bbc87efba95fe95f256fa9")
  (:PATH "raw/mutations/1/src/hash/blocks.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/hash/blocks.lisp")
   :BYTES 3262 :SHA256
   "5f5dff95ae6c34dfc15538c537ba2fa8d34ba2376ad66ad9975745ea13a2175f")
  (:PATH "raw/mutations/1/src/hash/hash64.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/hash/hash64.lisp")
   :BYTES 1768 :SHA256
   "99e4c8394a8f877ce1f552f15a57a082c0ec81015e87119ee4ffea28cf3ae77f")
  (:PATH "raw/mutations/1/src/hash/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/hash/package.lisp")
   :BYTES 477 :SHA256
   "1e7668fa26fc1a8e3b3cfe824aa3e08b30b57441d5f90d44453fc3a9259a10d0")
  (:PATH "raw/mutations/1/src/index/core.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/index/core.lisp")
   :BYTES 2959 :SHA256
   "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff")
  (:PATH "raw/mutations/1/src/index/hash-digests.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/index/hash-digests.lisp")
   :BYTES 3674 :SHA256
   "924bb7dab91ff56c1e909f2b06dff5f74b443ac6442e379498f29b25f1fa2673")
  (:PATH "raw/mutations/1/src/index/hash-seed.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/index/hash-seed.lisp")
   :BYTES 2437 :SHA256
   "ae86514101e95737747ba58a4f0c5dc1ddb44d2b3a18bceb8fd0d0756b57a7a1")
  (:PATH "raw/mutations/1/src/index/package.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/index/package.lisp")
   :BYTES 727 :SHA256
   "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507")
  (:PATH "raw/mutations/1/src/index/primary-arena.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/index/primary-arena.lisp")
   :BYTES 3485 :SHA256
   "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5")
  (:PATH "raw/mutations/1/src/index/primary-build.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/index/primary-build.lisp")
   :BYTES 5379 :SHA256
   "06ca5ac8c03504e2d2f973873e5cabf7518c090cd1f8f2118c46e0ea2f9bf37b")
  (:PATH "raw/mutations/1/src/index/primary-core.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/index/primary-core.lisp")
   :BYTES 4211 :SHA256
   "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e")
  (:PATH "raw/mutations/1/src/index/primary-directory.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/index/primary-directory.lisp")
   :BYTES 8114 :SHA256
   "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd")
  (:PATH "raw/mutations/1/src/index/primary-package.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/index/primary-package.lisp")
   :BYTES 1451 :SHA256
   "0682eb9a61596506b6788bd0285f9808db2496246caae64ab3203182ed46b860")
  (:PATH "raw/mutations/1/src/index/primary-probe.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/index/primary-probe.lisp")
   :BYTES 5936 :SHA256
   "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4")
  (:PATH "raw/mutations/1/src/index/primary-read.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/index/primary-read.lisp")
   :BYTES 3575 :SHA256
   "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f")
  (:PATH "raw/mutations/1/src/index/primary-relocate.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/index/primary-relocate.lisp")
   :BYTES 4073 :SHA256
   "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20")
  (:PATH "raw/mutations/1/src/index/primary-types.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/index/primary-types.lisp")
   :BYTES 3949 :SHA256
   "f17ca0dcd8a538b921f00044e23872b28272638c4435eacd30f0509422505e64")
  (:PATH "raw/mutations/1/src/index/primary-write.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/index/primary-write.lisp")
   :BYTES 7061 :SHA256
   "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655")
  (:PATH "raw/mutations/1/src/index/read.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/index/read.lisp")
   :BYTES 3030 :SHA256
   "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7")
  (:PATH "raw/mutations/1/src/index/rebuild-budget.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/index/rebuild-budget.lisp")
   :BYTES 3593 :SHA256
   "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0")
  (:PATH "raw/mutations/1/src/index/rebuild-copy.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/index/rebuild-copy.lisp")
   :BYTES 4027 :SHA256
   "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee")
  (:PATH "raw/mutations/1/src/index/rebuild-scan.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/index/rebuild-scan.lisp")
   :BYTES 5002 :SHA256
   "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e")
  (:PATH "raw/mutations/1/src/index/rebuild.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/index/rebuild.lisp")
   :BYTES 2872 :SHA256
   "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1")
  (:PATH "raw/mutations/1/src/index/relocate.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/index/relocate.lisp")
   :BYTES 2383 :SHA256
   "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc")
  (:PATH "raw/mutations/1/src/index/types.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/index/types.lisp")
   :BYTES 2434 :SHA256
   "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e")
  (:PATH "raw/mutations/1/src/index/validation.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/index/validation.lisp")
   :BYTES 3930 :SHA256
   "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a")
  (:PATH "raw/mutations/1/src/index/write.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/index/write.lisp")
   :BYTES 4784 :SHA256
   "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28")
  (:PATH "raw/mutations/1/src/io/flush.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/io/flush.lisp")
   :BYTES 1569 :SHA256
   "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325")
  (:PATH "raw/mutations/1/src/io/lifecycle.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/io/lifecycle.lisp")
   :BYTES 4536 :SHA256
   "baa1f763fe0f394a14d381b753dcb1be1e90eb03eaff5d6469465b5d4eca015f")
  (:PATH "raw/mutations/1/src/io/native.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/io/native.lisp")
   :BYTES 5026 :SHA256
   "b8cf3ce1ff7b4fa9def8a602ab768c0e9a321f8d6cdce6e5b2b7ded2fe3d97dd")
  (:PATH "raw/mutations/1/src/io/package.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/io/package.lisp")
   :BYTES 592 :SHA256
   "118eba04ab2aa87a2d86e0b0269dbeacaa485457acebbc12c57317ae465a89c0")
  (:PATH "raw/mutations/1/src/io/transfer.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/io/transfer.lisp")
   :BYTES 5051 :SHA256
   "3748328cf85e1c007900a63bdd0f159f38a8d7cd3577c92c56fc68692b9b7bcf")
  (:PATH "raw/mutations/1/src/io/types.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/io/types.lisp")
   :BYTES 4143 :SHA256
   "50c7eeea91af232fca7103ce5a25535958d73836f01cb45a20c7120b88b1336b")
  (:PATH "raw/mutations/1/src/mvcc/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/mvcc/package.lisp")
   :BYTES 833 :SHA256
   "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c")
  (:PATH "raw/mutations/1/src/mvcc/snapshots-core.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/mvcc/snapshots-core.lisp")
   :BYTES 7622 :SHA256
   "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998")
  (:PATH "raw/mutations/1/src/mvcc/snapshots-csn.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/mvcc/snapshots-csn.lisp")
   :BYTES 2725 :SHA256
   "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77")
  (:PATH "raw/mutations/1/src/mvcc/snapshots-lifecycle.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/mvcc/snapshots-lifecycle.lisp")
   :BYTES 6609 :SHA256
   "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082")
  (:PATH "raw/mutations/1/src/mvcc/snapshots-read.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/mvcc/snapshots-read.lisp")
   :BYTES 6651 :SHA256
   "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9")
  (:PATH "raw/mutations/1/src/mvcc/snapshots-register.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/mvcc/snapshots-register.lisp")
   :BYTES 6654 :SHA256
   "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b")
  (:PATH "raw/mutations/1/src/mvcc/snapshots-types.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/mvcc/snapshots-types.lisp")
   :BYTES 3817 :SHA256
   "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f")
  (:PATH "raw/mutations/1/src/mvcc/types.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/mvcc/types.lisp")
   :BYTES 471 :SHA256
   "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50")
  (:PATH "raw/mutations/1/src/package.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH "raw/mutations/1/src/read/core.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/read/core.lisp")
   :BYTES 3846 :SHA256
   "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f")
  (:PATH "raw/mutations/1/src/read/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/read/package.lisp")
   :BYTES 831 :SHA256
   "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df")
  (:PATH "raw/mutations/1/src/read/task.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/read/task.lisp")
   :BYTES 5073 :SHA256
   "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2")
  (:PATH "raw/mutations/1/src/read/types.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/read/types.lisp")
   :BYTES 2358 :SHA256
   "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c")
  (:PATH "raw/mutations/1/src/recovery/decisions-build.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/recovery/decisions-build.lisp")
   :BYTES 11857 :SHA256
   "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115")
  (:PATH "raw/mutations/1/src/recovery/decisions-package.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/recovery/decisions-package.lisp")
   :BYTES 818 :SHA256
   "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39")
  (:PATH "raw/mutations/1/src/recovery/decisions-query.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/recovery/decisions-query.lisp")
   :BYTES 4525 :SHA256
   "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24")
  (:PATH "raw/mutations/1/src/recovery/decisions-radix.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/recovery/decisions-radix.lisp")
   :BYTES 11061 :SHA256
   "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54")
  (:PATH "raw/mutations/1/src/recovery/decisions-sort.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/recovery/decisions-sort.lisp")
   :BYTES 7654 :SHA256
   "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2")
  (:PATH "raw/mutations/1/src/recovery/decisions-types.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/recovery/decisions-types.lisp")
   :BYTES 2056 :SHA256
   "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c")
  (:PATH "raw/mutations/1/src/recovery/inventory-build.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/recovery/inventory-build.lisp")
   :BYTES 9592 :SHA256
   "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e")
  (:PATH "raw/mutations/1/src/recovery/inventory-query.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/recovery/inventory-query.lisp")
   :BYTES 2100 :SHA256
   "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb")
  (:PATH "raw/mutations/1/src/recovery/inventory-types.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/recovery/inventory-types.lisp")
   :BYTES 2392 :SHA256
   "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9")
  (:PATH "raw/mutations/1/src/recovery/manifest-build.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/recovery/manifest-build.lisp")
   :BYTES 10251 :SHA256
   "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471")
  (:PATH "raw/mutations/1/src/recovery/manifest-decode.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/recovery/manifest-decode.lisp")
   :BYTES 6160 :SHA256
   "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779")
  (:PATH "raw/mutations/1/src/recovery/manifest-fold.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/recovery/manifest-fold.lisp")
   :BYTES 7068 :SHA256
   "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730")
  (:PATH "raw/mutations/1/src/recovery/manifest-package.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/recovery/manifest-package.lisp")
   :BYTES 1372 :SHA256
   "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc")
  (:PATH "raw/mutations/1/src/recovery/manifest-query.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/recovery/manifest-query.lisp")
   :BYTES 3582 :SHA256
   "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b")
  (:PATH "raw/mutations/1/src/recovery/manifest-types.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/recovery/manifest-types.lisp")
   :BYTES 3345 :SHA256
   "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10")
  (:PATH "raw/mutations/1/src/recovery/package.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/recovery/package.lisp")
   :BYTES 927 :SHA256
   "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9")
  (:PATH "raw/mutations/1/src/recovery/scan.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/recovery/scan.lisp")
   :BYTES 12829 :SHA256
   "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218")
  (:PATH "raw/mutations/1/src/series/events.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/series/events.lisp")
   :BYTES 9566 :SHA256
   "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7")
  (:PATH "raw/mutations/1/src/series/io-events.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/series/io-events.lisp")
   :BYTES 5385 :SHA256
   "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546")
  (:PATH "raw/mutations/1/src/series/ownership.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/series/ownership.lisp")
   :BYTES 8810 :SHA256
   "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4")
  (:PATH "raw/mutations/1/src/series/package.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/series/package.lisp")
   :BYTES 1392 :SHA256
   "7433162105df63d324141167e6dcf6bfee74611aa1cf7291cc6c92f41f3c7408")
  (:PATH "raw/mutations/1/src/series/publication.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/series/publication.lisp")
   :BYTES 6094 :SHA256
   "288cb3fa41fad76a0e6919dfa0b2fce2beef15f5880129393bee35bc8795c762")
  (:PATH "raw/mutations/1/src/series/query.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/series/query.lisp")
   :BYTES 3600 :SHA256
   "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9")
  (:PATH "raw/mutations/1/src/series/retirement.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/series/retirement.lisp")
   :BYTES 4634 :SHA256
   "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059")
  (:PATH "raw/mutations/1/src/series/types.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/series/types.lisp")
   :BYTES 3316 :SHA256
   "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9")
  (:PATH "raw/mutations/1/src/series/worker-boundary.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/series/worker-boundary.lisp")
   :BYTES 3443 :SHA256
   "793d401d1b9acc7b67923d815560f277f3d390ca050740f735f07d88dbacfe73")
  (:PATH "raw/mutations/1/src/series/worker-package.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/series/worker-package.lisp")
   :BYTES 1036 :SHA256
   "881a2958ddb8f5781954d4c59d7467e34c03c01fbb2fea43dc06e9e2050a1f37")
  (:PATH "raw/mutations/1/src/series/worker-run.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/series/worker-run.lisp")
   :BYTES 6985 :SHA256
   "f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f")
  (:PATH "raw/mutations/1/src/series/worker-types.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/series/worker-types.lisp")
   :BYTES 6493 :SHA256
   "a366799fd9b938bfaa48b0ffda228ff8369ab9acb5b5ead7f081dfc66ab2c81a")
  (:PATH "raw/mutations/1/src/storage/compaction-scan.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/storage/compaction-scan.lisp")
   :BYTES 5510 :SHA256
   "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d")
  (:PATH "raw/mutations/1/src/storage/control-payload.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/storage/control-payload.lisp")
   :BYTES 6273 :SHA256
   "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491")
  (:PATH "raw/mutations/1/src/storage/formats.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/storage/formats.lisp")
   :BYTES 3841 :SHA256
   "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f")
  (:PATH "raw/mutations/1/src/storage/log-header.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/storage/log-header.lisp")
   :BYTES 3947 :SHA256
   "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81")
  (:PATH "raw/mutations/1/src/storage/package.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/storage/package.lisp")
   :BYTES 1079 :SHA256
   "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e")
  (:PATH "raw/mutations/1/src/storage/payload-record.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/storage/payload-record.lisp")
   :BYTES 3641 :SHA256
   "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7")
  (:PATH "raw/mutations/1/src/storage/payload-write.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/storage/payload-write.lisp")
   :BYTES 5239 :SHA256
   "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc")
  (:PATH "raw/mutations/1/src/storage/segment-header.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/storage/segment-header.lisp")
   :BYTES 5517 :SHA256
   "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011")
  (:PATH "raw/mutations/1/src/wal/builder.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/wal/builder.lisp")
   :BYTES 8445 :SHA256
   "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0")
  (:PATH "raw/mutations/1/src/wal/csn.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/wal/csn.lisp")
   :BYTES 9577 :SHA256
   "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810")
  (:PATH "raw/mutations/1/src/wal/executor.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/wal/executor.lisp")
   :BYTES 6023 :SHA256
   "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8")
  (:PATH "raw/mutations/1/src/wal/group.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/wal/group.lisp")
   :BYTES 6305 :SHA256
   "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b")
  (:PATH "raw/mutations/1/src/wal/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/wal/package.lisp")
   :BYTES 1774 :SHA256
   "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89")
  (:PATH "raw/mutations/1/src/wal/types.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/src/wal/types.lisp")
   :BYTES 5420 :SHA256
   "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e")
  (:PATH "raw/mutations/1/test.log" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/test.log")
   :BYTES 25430 :SHA256
   "db6dc67bb2371f77cedfe891f75ab1614825cf74e4f45c1f3ebafa176fd88bea")
  (:PATH "raw/mutations/1/tests/codec/cbor-header.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/codec/cbor-header.lisp")
   :BYTES 10773 :SHA256
   "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815")
  (:PATH "raw/mutations/1/tests/codec/cbor-minimal-edges.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/codec/cbor-minimal-edges.lisp")
   :BYTES 1613 :SHA256
   "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70")
  (:PATH "raw/mutations/1/tests/codec/cbor-minimal-scan-support.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/codec/cbor-minimal-scan-support.lisp")
   :BYTES 8363 :SHA256
   "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421")
  (:PATH "raw/mutations/1/tests/codec/cbor-minimal-scan-threads.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/codec/cbor-minimal-scan-threads.lisp")
   :BYTES 4547 :SHA256
   "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660")
  (:PATH "raw/mutations/1/tests/codec/cbor-minimal-scan.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/codec/cbor-minimal-scan.lisp")
   :BYTES 19217 :SHA256
   "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8")
  (:PATH "raw/mutations/1/tests/codec/cbor-minimal-support.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/codec/cbor-minimal-support.lisp")
   :BYTES 8620 :SHA256
   "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a")
  (:PATH "raw/mutations/1/tests/codec/cbor-minimal-threads.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/codec/cbor-minimal-threads.lisp")
   :BYTES 3799 :SHA256
   "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2")
  (:PATH "raw/mutations/1/tests/codec/cbor-minimal.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/codec/cbor-minimal.lisp")
   :BYTES 12604 :SHA256
   "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3")
  (:PATH "raw/mutations/1/tests/codec/cbor-simple-write-support.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/codec/cbor-simple-write-support.lisp")
   :BYTES 4955 :SHA256
   "53ceafc72a027a2ff1f787900558ff26f2ff70bbb212f1b37926a6d520fbe86e")
  (:PATH "raw/mutations/1/tests/codec/cbor-simple-write-threads.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/codec/cbor-simple-write-threads.lisp")
   :BYTES 3561 :SHA256
   "77074033e75a224fd02e890f98dffa8e97d3a1f8bedd510b00ea55d8ff8687b2")
  (:PATH "raw/mutations/1/tests/codec/cbor-simple-write.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/codec/cbor-simple-write.lisp")
   :BYTES 10712 :SHA256
   "958bdd3901cfc41032c09d6c9023b192799981884e09ce3573256ff45bc5329a")
  (:PATH "raw/mutations/1/tests/codec/cbor-string-write-support.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/codec/cbor-string-write-support.lisp")
   :BYTES 6868 :SHA256
   "2cbdb601f442a56456bc637c94e759cc965f44b178268dce3c636c385d34fc39")
  (:PATH "raw/mutations/1/tests/codec/cbor-string-write-threads.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/codec/cbor-string-write-threads.lisp")
   :BYTES 3512 :SHA256
   "8e07b881a55e2554a429f1c8b2c69f67862ac015217d90d019167d636564d27d")
  (:PATH "raw/mutations/1/tests/codec/cbor-string-write.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/codec/cbor-string-write.lisp")
   :BYTES 15883 :SHA256
   "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115")
  (:PATH "raw/mutations/1/tests/codec/cbor-structure-support.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:PATH "raw/mutations/1/tests/codec/cbor-structure-threads.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/codec/cbor-structure-threads.lisp")
   :BYTES 4305 :SHA256
   "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645")
  (:PATH "raw/mutations/1/tests/codec/cbor-structure.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/codec/cbor-structure.lisp")
   :BYTES 22968 :SHA256
   "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110")
  (:PATH "raw/mutations/1/tests/codec/cbor-support.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:PATH "raw/mutations/1/tests/codec/cbor-threads.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/codec/cbor-threads.lisp")
   :BYTES 3683 :SHA256
   "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14")
  (:PATH "raw/mutations/1/tests/codec/cbor-write-roundtrip.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/codec/cbor-write-roundtrip.lisp")
   :BYTES 901 :SHA256
   "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344")
  (:PATH "raw/mutations/1/tests/codec/cbor-write-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/codec/cbor-write-support.lisp")
   :BYTES 4768 :SHA256
   "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6")
  (:PATH "raw/mutations/1/tests/codec/cbor-write-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/codec/cbor-write-threads.lisp")
   :BYTES 3813 :SHA256
   "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb")
  (:PATH "raw/mutations/1/tests/codec/cbor-write.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/codec/cbor-write.lisp")
   :BYTES 9822 :SHA256
   "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3")
  (:PATH "raw/mutations/1/tests/codec/support.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/codec/support.lisp")
   :BYTES 5807 :SHA256
   "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96")
  (:PATH "raw/mutations/1/tests/codec/threads.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/codec/threads.lisp")
   :BYTES 3111 :SHA256
   "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337")
  (:PATH "raw/mutations/1/tests/codec/utf8.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/codec/utf8.lisp")
   :BYTES 12892 :SHA256
   "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100")
  (:PATH "raw/mutations/1/tests/csn/registry.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/csn/registry.lisp")
   :BYTES 19411 :SHA256
   "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950")
  (:PATH "raw/mutations/1/tests/csn/support.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/csn/support.lisp")
   :BYTES 11407 :SHA256
   "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db")
  (:PATH "raw/mutations/1/tests/csn/threads.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/csn/threads.lisp")
   :BYTES 10525 :SHA256
   "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2")
  (:PATH "raw/mutations/1/tests/epochs/lifecycle.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/epochs/lifecycle.lisp")
   :BYTES 25394 :SHA256
   "ddc2fbdad9f97d2e4ff008c167776a50b17b742398306fbd5198dca474559cbf")
  (:PATH "raw/mutations/1/tests/epochs/support.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/epochs/support.lisp")
   :BYTES 5943 :SHA256
   "366be7af4bf6c4ed946b3fa9e97aea6b034c83e3b757d81c54078dc76d229b6d")
  (:PATH "raw/mutations/1/tests/epochs/threads.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/epochs/threads.lisp")
   :BYTES 3654 :SHA256
   "54b73e06c61e64f32a3e3af0791891dacb6590e929163dcf0fac95f2c71e66fd")
  (:PATH "raw/mutations/1/tests/execution/handoff.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/execution/handoff.lisp")
   :BYTES 33278 :SHA256
   "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e")
  (:PATH "raw/mutations/1/tests/execution/queue.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/execution/queue.lisp")
   :BYTES 12894 :SHA256
   "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722")
  (:PATH "raw/mutations/1/tests/execution/ready-recycle.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/execution/ready-recycle.lisp")
   :BYTES 30075 :SHA256
   "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae")
  (:PATH "raw/mutations/1/tests/execution/ready.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/execution/ready.lisp")
   :BYTES 33555 :SHA256
   "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e")
  (:PATH "raw/mutations/1/tests/execution/support.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/execution/support.lisp")
   :BYTES 4469 :SHA256
   "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43")
  (:PATH "raw/mutations/1/tests/execution/threads.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/execution/threads.lisp")
   :BYTES 14622 :SHA256
   "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359")
  (:PATH "raw/mutations/1/tests/execution/worker.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/execution/worker.lisp")
   :BYTES 59783 :SHA256
   "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06")
  (:PATH "raw/mutations/1/tests/foundation/batch.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/foundation/batch.lisp")
   :BYTES 5185 :SHA256
   "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183")
  (:PATH "raw/mutations/1/tests/foundation/binary.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/foundation/binary.lisp")
   :BYTES 3721 :SHA256
   "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe")
  (:PATH "raw/mutations/1/tests/foundation/record.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/foundation/record.lisp")
   :BYTES 14950 :SHA256
   "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8")
  (:PATH "raw/mutations/1/tests/foundation/support.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:PATH "raw/mutations/1/tests/get-performance/guards.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/get-performance/guards.lisp")
   :BYTES 8986 :SHA256
   "c41721b917ed443355ea3707efdd07e7da53a978c0515ab1e5ede5fcc47d63fc")
  (:PATH "raw/mutations/1/tests/get-performance/paths.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/get-performance/paths.lisp")
   :BYTES 4936 :SHA256
   "3b8d2c9c93467507ea2bb471d42192eb1fa084b55c0f4263b5ef0d3acf468f55")
  (:PATH "raw/mutations/1/tests/get-performance/support.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/get-performance/support.lisp")
   :BYTES 22497 :SHA256
   "e586ed94dcb2aaba00282931cdd83313e4f84a86d4d1ba85e2d56e8b7433ed8d")
  (:PATH "raw/mutations/1/tests/get-performance/threads.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/get-performance/threads.lisp")
   :BYTES 4744 :SHA256
   "05ace5eb351ab49da59611dc1a2a5abedb9d723a2fc6e75a30fc76e507573a90")
  (:PATH "raw/mutations/1/tests/hash/guards.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/hash/guards.lisp")
   :BYTES 1162 :SHA256
   "9af5b38443a57d224990a68e93f12f7a4cda306f94c7ccd3ccb50635865d7864")
  (:PATH "raw/mutations/1/tests/hash/hash64.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/hash/hash64.lisp")
   :BYTES 17948 :SHA256
   "70606bc68807143cfea9583871474c84efc868d13692cde28488284dee43e0f1")
  (:PATH "raw/mutations/1/tests/hash/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/hash/support.lisp")
   :BYTES 10828 :SHA256
   "0fae9dc36976af544f83e6051b9cf9d67c9bef0b9e25f1fa2a48fdac48592acb")
  (:PATH "raw/mutations/1/tests/hash/threads.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/hash/threads.lisp")
   :BYTES 6701 :SHA256
   "3fc587a57d26a294aebfc6a7aeadf2f61a42a21106c1c57517f891b76b4e750a")
  (:PATH "raw/mutations/1/tests/index/hash-digests.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/index/hash-digests.lisp")
   :BYTES 35926 :SHA256
   "3b3b39f861883cf2017cab8e6488560a6bb3897d63784f00e820a6450d743225")
  (:PATH "raw/mutations/1/tests/index/primary-support.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/index/primary-support.lisp")
   :BYTES 13938 :SHA256
   "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a")
  (:PATH "raw/mutations/1/tests/index/primary-threads.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/index/primary-threads.lisp")
   :BYTES 13744 :SHA256
   "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2")
  (:PATH "raw/mutations/1/tests/index/primary.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/index/primary.lisp")
   :BYTES 30166 :SHA256
   "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696")
  (:PATH "raw/mutations/1/tests/index/rebuild.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/index/rebuild.lisp")
   :BYTES 32112 :SHA256
   "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1")
  (:PATH "raw/mutations/1/tests/index/slot-support.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/index/slot-support.lisp")
   :BYTES 12800 :SHA256
   "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31")
  (:PATH "raw/mutations/1/tests/index/slot-threads.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/index/slot-threads.lisp")
   :BYTES 11698 :SHA256
   "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f")
  (:PATH "raw/mutations/1/tests/index/slots.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/index/slots.lisp")
   :BYTES 26420 :SHA256
   "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb")
  (:PATH "raw/mutations/1/tests/io/native.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/io/native.lisp")
   :BYTES 6207 :SHA256
   "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0")
  (:PATH "raw/mutations/1/tests/io/support.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/io/support.lisp")
   :BYTES 2951 :SHA256
   "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50")
  (:PATH "raw/mutations/1/tests/io/transfer.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/io/transfer.lisp")
   :BYTES 11847 :SHA256
   "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd")
  (:PATH "raw/mutations/1/tests/lint-fixtures/bad.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/lint-fixtures/bad.lisp")
   :BYTES 1587 :SHA256
   "ac8912ce6cc1101f2ebc305a50c0565879547b527d7ca0aeac900ee06bf26652")
  (:PATH "raw/mutations/1/tests/lint-fixtures/good.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/lint-fixtures/good.lisp")
   :BYTES 671 :SHA256
   "05ce84f8fd12d9af48252601bcc92d6d60335b53f39b01a9fe2697c4bdaa8cee")
  (:PATH "raw/mutations/1/tests/lint-fixtures/keyword-barrier.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/lint-fixtures/keyword-barrier.lisp")
   :BYTES 199 :SHA256
   "e26dab117e9526ace35bb45b92f977065d33fcc4404c40fd4fc3c77749689a96")
  (:PATH "raw/mutations/1/tests/lint-fixtures/qualified-reader.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/lint-fixtures/qualified-reader.lisp")
   :BYTES 152 :SHA256
   "835229bdc1a0ed0c08511cd6121e1f1bc4284da2cfba951b72cd1a74a6040d35")
  (:PATH "raw/mutations/1/tests/mvcc/capture.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/mvcc/capture.lisp")
   :BYTES 16356 :SHA256
   "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35")
  (:PATH "raw/mutations/1/tests/mvcc/lifecycle.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/mvcc/lifecycle.lisp")
   :BYTES 23964 :SHA256
   "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16")
  (:PATH "raw/mutations/1/tests/mvcc/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/mvcc/support.lisp")
   :BYTES 5931 :SHA256
   "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290")
  (:PATH "raw/mutations/1/tests/read/lifecycle.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/read/lifecycle.lisp")
   :BYTES 17804 :SHA256
   "c4c4642408816f2e0e809e21d04739b68b9391237e3e46ea0b195ed82857c3a8")
  (:PATH "raw/mutations/1/tests/read/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/read/support.lisp")
   :BYTES 4845 :SHA256
   "8095cc39d49342f6e43f3421b4fced839da02d8d11b4d8ddcd91bd346447e754")
  (:PATH "raw/mutations/1/tests/read/threads.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/read/threads.lisp")
   :BYTES 4150 :SHA256
   "e2e223b69b08a5d76b9773c6ad4dee13ef2ddbb6f5ababa713cc5654bc7b51c5")
  (:PATH "raw/mutations/1/tests/recovery/corruption.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/recovery/corruption.lisp")
   :BYTES 7106 :SHA256
   "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c")
  (:PATH "raw/mutations/1/tests/recovery/decisions-audit.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/recovery/decisions-audit.lisp")
   :BYTES 14971 :SHA256
   "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0")
  (:PATH "raw/mutations/1/tests/recovery/decisions-radix.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/recovery/decisions-radix.lisp")
   :BYTES 27851 :SHA256
   "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0")
  (:PATH "raw/mutations/1/tests/recovery/decisions-support.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/recovery/decisions-support.lisp")
   :BYTES 6797 :SHA256
   "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4")
  (:PATH "raw/mutations/1/tests/recovery/decisions.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/recovery/decisions.lisp")
   :BYTES 19149 :SHA256
   "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e")
  (:PATH "raw/mutations/1/tests/recovery/inventory-support.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/recovery/inventory-support.lisp")
   :BYTES 8083 :SHA256
   "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27")
  (:PATH "raw/mutations/1/tests/recovery/inventory.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/recovery/inventory.lisp")
   :BYTES 14479 :SHA256
   "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9")
  (:PATH "raw/mutations/1/tests/recovery/manifest-audit.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/recovery/manifest-audit.lisp")
   :BYTES 17670 :SHA256
   "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6")
  (:PATH "raw/mutations/1/tests/recovery/manifest-support.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/recovery/manifest-support.lisp")
   :BYTES 9769 :SHA256
   "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830")
  (:PATH "raw/mutations/1/tests/recovery/manifest.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/recovery/manifest.lisp")
   :BYTES 13799 :SHA256
   "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd")
  (:PATH "raw/mutations/1/tests/recovery/scan.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/recovery/scan.lisp")
   :BYTES 16966 :SHA256
   "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b")
  (:PATH "raw/mutations/1/tests/recovery/support.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/recovery/support.lisp")
   :BYTES 5957 :SHA256
   "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204")
  (:PATH "raw/mutations/1/tests/series/boundaries.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/series/boundaries.lisp")
   :BYTES 5802 :SHA256
   "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8")
  (:PATH "raw/mutations/1/tests/series/controller.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/series/controller.lisp")
   :BYTES 60484 :SHA256
   "4bea80eb231575f48b208ddb57af6a11706481e0ec755b084f6cd4b6fd0481a1")
  (:PATH "raw/mutations/1/tests/series/support.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/series/support.lisp")
   :BYTES 16885 :SHA256
   "8821ae9e002941eff8ea3ae7dbfc727cb6874b68d2d1ef85af668eb2d34a0c0c")
  (:PATH "raw/mutations/1/tests/series/threads.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/series/threads.lisp")
   :BYTES 19694 :SHA256
   "bbea64d207d14698b39ab0f8ded03db11bab09955d3f66705c23d69c09aefc8e")
  (:PATH "raw/mutations/1/tests/series/worker-bridge.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/series/worker-bridge.lisp")
   :BYTES 56677 :SHA256
   "c1ee49702e63978a83cb86c4e5bf437a5a40e48fa02b65d3eaf3dca0d2e39176")
  (:PATH "raw/mutations/1/tests/smoke.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/smoke.lisp")
   :BYTES 735 :SHA256
   "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8")
  (:PATH "raw/mutations/1/tests/storage/compaction-scan.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/storage/compaction-scan.lisp")
   :BYTES 16196 :SHA256
   "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5")
  (:PATH "raw/mutations/1/tests/storage/control-payload.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/storage/control-payload.lisp")
   :BYTES 12651 :SHA256
   "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae")
  (:PATH "raw/mutations/1/tests/storage/log-header.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/storage/log-header.lisp")
   :BYTES 11969 :SHA256
   "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e")
  (:PATH "raw/mutations/1/tests/storage/segment-header.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/storage/segment-header.lisp")
   :BYTES 4149 :SHA256
   "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df")
  (:PATH "raw/mutations/1/tests/storage/support.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/storage/support.lisp")
   :BYTES 4029 :SHA256
   "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625")
  (:PATH "raw/mutations/1/tests/wal/builder.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/wal/builder.lisp")
   :BYTES 4000 :SHA256
   "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6")
  (:PATH "raw/mutations/1/tests/wal/csn-threads.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/wal/csn-threads.lisp")
   :BYTES 12114 :SHA256
   "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c")
  (:PATH "raw/mutations/1/tests/wal/csn.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/wal/csn.lisp")
   :BYTES 34661 :SHA256
   "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a")
  (:PATH "raw/mutations/1/tests/wal/fault.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/wal/fault.lisp")
   :BYTES 7614 :SHA256
   "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875")
  (:PATH "raw/mutations/1/tests/wal/group.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/wal/group.lisp")
   :BYTES 5524 :SHA256
   "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e")
  (:PATH "raw/mutations/1/tests/wal/native.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/wal/native.lisp")
   :BYTES 2567 :SHA256
   "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7")
  (:PATH "raw/mutations/1/tests/wal/support.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tests/wal/support.lisp")
   :BYTES 1951 :SHA256
   "90a47539e5e2898c0a08059207f30bb5551e7ca8fc166f8f6ce7b95afa757295")
  (:PATH "raw/mutations/1/tools/build.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/1/tools/cbor-simple-write-isolated-build.lisp" :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/1/tools/cbor-simple-write-isolated-build.lisp")
   :BYTES 478 :SHA256
   "0da4ce25bd4d93288d558a90cbb083be16ce706e65ed646a49bbba43a5bad71b")
  (:PATH "raw/mutations/2/src/cache/build.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/cache/build.lisp")
   :BYTES 4966 :SHA256
   "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0")
  (:PATH "raw/mutations/2/src/cache/clock.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/cache/clock.lisp")
   :BYTES 2952 :SHA256
   "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f")
  (:PATH "raw/mutations/2/src/cache/core.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/cache/core.lisp")
   :BYTES 3503 :SHA256
   "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4")
  (:PATH "raw/mutations/2/src/cache/package.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/cache/package.lisp")
   :BYTES 758 :SHA256
   "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848")
  (:PATH "raw/mutations/2/src/cache/read.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/cache/read.lisp")
   :BYTES 6485 :SHA256
   "5700e43ae8ee859e96bdecb5953af43a712fd9e6ec23a53565759676bb07f85a")
  (:PATH "raw/mutations/2/src/cache/types.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/cache/types.lisp")
   :BYTES 2448 :SHA256
   "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30")
  (:PATH "raw/mutations/2/src/cache/write.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/cache/write.lisp")
   :BYTES 5481 :SHA256
   "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8")
  (:PATH "raw/mutations/2/src/codec/cbor-float-minimal.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH "raw/mutations/2/src/codec/cbor-header.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH "raw/mutations/2/src/codec/cbor-minimal.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH "raw/mutations/2/src/codec/cbor-package.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/codec/cbor-package.lisp")
   :BYTES 620 :SHA256
   "53fa9acbed8f5602b204252ff394c01fd01effdbe41baf021a713e2636cbd668")
  (:PATH "raw/mutations/2/src/codec/cbor-scan-input.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH "raw/mutations/2/src/codec/cbor-scan-items.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH "raw/mutations/2/src/codec/cbor-scan-minimal.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH "raw/mutations/2/src/codec/cbor-scan-stack.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH "raw/mutations/2/src/codec/cbor-scan.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH "raw/mutations/2/src/codec/cbor-simple-write.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/codec/cbor-simple-write.lisp")
   :BYTES 2887 :SHA256
   "a63092a915e1a200218608b0e25b566fcbfef8711fec6b0b004ac046c7a816e6")
  (:PATH "raw/mutations/2/src/codec/cbor-space.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH "raw/mutations/2/src/codec/cbor-string-write.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727")
  (:PATH "raw/mutations/2/src/codec/cbor-write.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/mutations/2/src/codec/package.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH "raw/mutations/2/src/codec/utf8.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH "raw/mutations/2/src/csn/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/csn/package.lisp")
   :BYTES 441 :SHA256
   "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0")
  (:PATH "raw/mutations/2/src/csn/registry.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/csn/registry.lisp")
   :BYTES 12139 :SHA256
   "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a")
  (:PATH "raw/mutations/2/src/epochs/core.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/epochs/core.lisp")
   :BYTES 5909 :SHA256
   "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399")
  (:PATH "raw/mutations/2/src/epochs/package.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/epochs/package.lisp")
   :BYTES 779 :SHA256
   "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd")
  (:PATH "raw/mutations/2/src/epochs/read.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/epochs/read.lisp")
   :BYTES 3240 :SHA256
   "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905")
  (:PATH "raw/mutations/2/src/epochs/reclaim.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/epochs/reclaim.lisp")
   :BYTES 6373 :SHA256
   "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202")
  (:PATH "raw/mutations/2/src/epochs/retire.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/epochs/retire.lisp")
   :BYTES 5858 :SHA256
   "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b")
  (:PATH "raw/mutations/2/src/epochs/types.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/epochs/types.lisp")
   :BYTES 5304 :SHA256
   "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097")
  (:PATH "raw/mutations/2/src/execution/handoff.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/execution/handoff.lisp")
   :BYTES 7394 :SHA256
   "ee90c809ef51134efa21e08b819e5530304efaf9f9e26b63c7e4afbf6d48e607")
  (:PATH "raw/mutations/2/src/execution/package.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/execution/package.lisp")
   :BYTES 1157 :SHA256
   "bbe8cdb6f7e74d7139f5e472a915cc74b43e34bd27ecac1c5fd364f723a2a643")
  (:PATH "raw/mutations/2/src/execution/queue.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/execution/queue.lisp")
   :BYTES 5374 :SHA256
   "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90")
  (:PATH "raw/mutations/2/src/execution/ready-recycle.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/execution/ready-recycle.lisp")
   :BYTES 3387 :SHA256
   "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b")
  (:PATH "raw/mutations/2/src/execution/ready-types.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/execution/ready-types.lisp")
   :BYTES 5248 :SHA256
   "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f")
  (:PATH "raw/mutations/2/src/execution/ready.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/execution/ready.lisp")
   :BYTES 6635 :SHA256
   "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327")
  (:PATH "raw/mutations/2/src/execution/worker-boundary.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/execution/worker-boundary.lisp")
   :BYTES 2309 :SHA256
   "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a")
  (:PATH "raw/mutations/2/src/execution/worker-claim.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/execution/worker-claim.lisp")
   :BYTES 6401 :SHA256
   "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e")
  (:PATH "raw/mutations/2/src/execution/worker-run.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/execution/worker-run.lisp")
   :BYTES 5124 :SHA256
   "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542")
  (:PATH "raw/mutations/2/src/execution/worker-types.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/execution/worker-types.lisp")
   :BYTES 8461 :SHA256
   "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317")
  (:PATH "raw/mutations/2/src/execution/writer.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/execution/writer.lisp")
   :BYTES 6484 :SHA256
   "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105")
  (:PATH "raw/mutations/2/src/foundation/batch.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH "raw/mutations/2/src/foundation/binary.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH "raw/mutations/2/src/foundation/conditions.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH "raw/mutations/2/src/foundation/crc32c.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH "raw/mutations/2/src/foundation/package.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH "raw/mutations/2/src/foundation/record.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH "raw/mutations/2/src/get-resolver/build.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/get-resolver/build.lisp")
   :BYTES 6882 :SHA256
   "3715cb750e08ab30fcaa068a05b17772381a3cf1975bdbdd0c03f71761089ef6")
  (:PATH "raw/mutations/2/src/get-resolver/package.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/get-resolver/package.lisp")
   :BYTES 1887 :SHA256
   "f244c1346604ccde93880824ea990a4a7329340df6c8b665963713977ca0ee10")
  (:PATH "raw/mutations/2/src/get-resolver/read.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/get-resolver/read.lisp")
   :BYTES 7259 :SHA256
   "68f82df01f7894f66db0c6545267616e76c0ba93fd7c49db6434cec666f02dc3")
  (:PATH "raw/mutations/2/src/get-resolver/rows.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/get-resolver/rows.lisp")
   :BYTES 3350 :SHA256
   "d9db85d788006fc7ad1f9a7cdeef28b992605de7fac8c295dd7fdc51f5511854")
  (:PATH "raw/mutations/2/src/get-resolver/scan.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/get-resolver/scan.lisp")
   :BYTES 6786 :SHA256
   "35a1780c6bf66364ef94c4151fa91f02eebe359f0ca0639985d2a907fd9d512d")
  (:PATH "raw/mutations/2/src/get-resolver/sort.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/get-resolver/sort.lisp")
   :BYTES 7118 :SHA256
   "974bf44efeb1cd26c5e9db0601aea295c8f1a18234894ad9d41938a2880e2255")
  (:PATH "raw/mutations/2/src/get-resolver/types.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/get-resolver/types.lisp")
   :BYTES 1757 :SHA256
   "1334512380bfb01add33b0ca152c0ce4746b3f79bcd04f84d7844ef234d6eaba")
  (:PATH "raw/mutations/2/src/get/build.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/get/build.lisp")
   :BYTES 3745 :SHA256
   "bcfc4916e9a85833dc151c4ce176bc905f2c03b6bc6d636f97a60df0d8c16739")
  (:PATH "raw/mutations/2/src/get/lifecycle.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/get/lifecycle.lisp")
   :BYTES 5345 :SHA256
   "885ba4141114ea411cac37c9b5f924aaa7f9f2a5ba311ebf92a392e5da1e3c59")
  (:PATH "raw/mutations/2/src/get/lookup.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/get/lookup.lisp")
   :BYTES 4352 :SHA256
   "9d1042d4cf1e7bd9c6d1153de12b2459e7a2724e47bd32534cd7ae56cb274c5f")
  (:PATH "raw/mutations/2/src/get/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/get/package.lisp")
   :BYTES 1995 :SHA256
   "87b795779aef0c4b918a039d182daddd22b902a9ad10c763df4364b7e630151c")
  (:PATH "raw/mutations/2/src/get/segment.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/get/segment.lisp")
   :BYTES 8097 :SHA256
   "4a486528cb2c1cc3471cb4b332d4314d24011889e1f885db6fd5600bb077eea3")
  (:PATH "raw/mutations/2/src/get/target.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/get/target.lisp")
   :BYTES 5652 :SHA256
   "9f682f735e49108cad176a6143ec99e1be64da98f29cae0b52f9b49cdea34250")
  (:PATH "raw/mutations/2/src/get/types.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/get/types.lisp")
   :BYTES 4413 :SHA256
   "653b23a6e719cd1f55e7c58b4d7e8143aec5983992ba210d0eac1f4c8682f623")
  (:PATH "raw/mutations/2/src/hash/arithmetic.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/hash/arithmetic.lisp")
   :BYTES 3073 :SHA256
   "c439e534b768acb123d69b921b85e1e56683aa8335bbc87efba95fe95f256fa9")
  (:PATH "raw/mutations/2/src/hash/blocks.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/hash/blocks.lisp")
   :BYTES 3262 :SHA256
   "5f5dff95ae6c34dfc15538c537ba2fa8d34ba2376ad66ad9975745ea13a2175f")
  (:PATH "raw/mutations/2/src/hash/hash64.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/hash/hash64.lisp")
   :BYTES 1768 :SHA256
   "99e4c8394a8f877ce1f552f15a57a082c0ec81015e87119ee4ffea28cf3ae77f")
  (:PATH "raw/mutations/2/src/hash/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/hash/package.lisp")
   :BYTES 477 :SHA256
   "1e7668fa26fc1a8e3b3cfe824aa3e08b30b57441d5f90d44453fc3a9259a10d0")
  (:PATH "raw/mutations/2/src/index/core.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/index/core.lisp")
   :BYTES 2959 :SHA256
   "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff")
  (:PATH "raw/mutations/2/src/index/hash-digests.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/index/hash-digests.lisp")
   :BYTES 3674 :SHA256
   "924bb7dab91ff56c1e909f2b06dff5f74b443ac6442e379498f29b25f1fa2673")
  (:PATH "raw/mutations/2/src/index/hash-seed.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/index/hash-seed.lisp")
   :BYTES 2437 :SHA256
   "ae86514101e95737747ba58a4f0c5dc1ddb44d2b3a18bceb8fd0d0756b57a7a1")
  (:PATH "raw/mutations/2/src/index/package.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/index/package.lisp")
   :BYTES 727 :SHA256
   "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507")
  (:PATH "raw/mutations/2/src/index/primary-arena.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/index/primary-arena.lisp")
   :BYTES 3485 :SHA256
   "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5")
  (:PATH "raw/mutations/2/src/index/primary-build.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/index/primary-build.lisp")
   :BYTES 5379 :SHA256
   "06ca5ac8c03504e2d2f973873e5cabf7518c090cd1f8f2118c46e0ea2f9bf37b")
  (:PATH "raw/mutations/2/src/index/primary-core.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/index/primary-core.lisp")
   :BYTES 4211 :SHA256
   "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e")
  (:PATH "raw/mutations/2/src/index/primary-directory.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/index/primary-directory.lisp")
   :BYTES 8114 :SHA256
   "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd")
  (:PATH "raw/mutations/2/src/index/primary-package.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/index/primary-package.lisp")
   :BYTES 1451 :SHA256
   "0682eb9a61596506b6788bd0285f9808db2496246caae64ab3203182ed46b860")
  (:PATH "raw/mutations/2/src/index/primary-probe.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/index/primary-probe.lisp")
   :BYTES 5936 :SHA256
   "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4")
  (:PATH "raw/mutations/2/src/index/primary-read.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/index/primary-read.lisp")
   :BYTES 3575 :SHA256
   "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f")
  (:PATH "raw/mutations/2/src/index/primary-relocate.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/index/primary-relocate.lisp")
   :BYTES 4073 :SHA256
   "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20")
  (:PATH "raw/mutations/2/src/index/primary-types.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/index/primary-types.lisp")
   :BYTES 3949 :SHA256
   "f17ca0dcd8a538b921f00044e23872b28272638c4435eacd30f0509422505e64")
  (:PATH "raw/mutations/2/src/index/primary-write.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/index/primary-write.lisp")
   :BYTES 7061 :SHA256
   "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655")
  (:PATH "raw/mutations/2/src/index/read.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/index/read.lisp")
   :BYTES 3030 :SHA256
   "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7")
  (:PATH "raw/mutations/2/src/index/rebuild-budget.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/index/rebuild-budget.lisp")
   :BYTES 3593 :SHA256
   "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0")
  (:PATH "raw/mutations/2/src/index/rebuild-copy.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/index/rebuild-copy.lisp")
   :BYTES 4027 :SHA256
   "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee")
  (:PATH "raw/mutations/2/src/index/rebuild-scan.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/index/rebuild-scan.lisp")
   :BYTES 5002 :SHA256
   "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e")
  (:PATH "raw/mutations/2/src/index/rebuild.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/index/rebuild.lisp")
   :BYTES 2872 :SHA256
   "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1")
  (:PATH "raw/mutations/2/src/index/relocate.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/index/relocate.lisp")
   :BYTES 2383 :SHA256
   "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc")
  (:PATH "raw/mutations/2/src/index/types.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/index/types.lisp")
   :BYTES 2434 :SHA256
   "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e")
  (:PATH "raw/mutations/2/src/index/validation.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/index/validation.lisp")
   :BYTES 3930 :SHA256
   "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a")
  (:PATH "raw/mutations/2/src/index/write.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/index/write.lisp")
   :BYTES 4784 :SHA256
   "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28")
  (:PATH "raw/mutations/2/src/io/flush.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/io/flush.lisp")
   :BYTES 1569 :SHA256
   "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325")
  (:PATH "raw/mutations/2/src/io/lifecycle.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/io/lifecycle.lisp")
   :BYTES 4536 :SHA256
   "baa1f763fe0f394a14d381b753dcb1be1e90eb03eaff5d6469465b5d4eca015f")
  (:PATH "raw/mutations/2/src/io/native.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/io/native.lisp")
   :BYTES 5026 :SHA256
   "b8cf3ce1ff7b4fa9def8a602ab768c0e9a321f8d6cdce6e5b2b7ded2fe3d97dd")
  (:PATH "raw/mutations/2/src/io/package.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/io/package.lisp")
   :BYTES 592 :SHA256
   "118eba04ab2aa87a2d86e0b0269dbeacaa485457acebbc12c57317ae465a89c0")
  (:PATH "raw/mutations/2/src/io/transfer.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/io/transfer.lisp")
   :BYTES 5051 :SHA256
   "3748328cf85e1c007900a63bdd0f159f38a8d7cd3577c92c56fc68692b9b7bcf")
  (:PATH "raw/mutations/2/src/io/types.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/io/types.lisp")
   :BYTES 4143 :SHA256
   "50c7eeea91af232fca7103ce5a25535958d73836f01cb45a20c7120b88b1336b")
  (:PATH "raw/mutations/2/src/mvcc/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/mvcc/package.lisp")
   :BYTES 833 :SHA256
   "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c")
  (:PATH "raw/mutations/2/src/mvcc/snapshots-core.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/mvcc/snapshots-core.lisp")
   :BYTES 7622 :SHA256
   "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998")
  (:PATH "raw/mutations/2/src/mvcc/snapshots-csn.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/mvcc/snapshots-csn.lisp")
   :BYTES 2725 :SHA256
   "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77")
  (:PATH "raw/mutations/2/src/mvcc/snapshots-lifecycle.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/mvcc/snapshots-lifecycle.lisp")
   :BYTES 6609 :SHA256
   "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082")
  (:PATH "raw/mutations/2/src/mvcc/snapshots-read.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/mvcc/snapshots-read.lisp")
   :BYTES 6651 :SHA256
   "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9")
  (:PATH "raw/mutations/2/src/mvcc/snapshots-register.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/mvcc/snapshots-register.lisp")
   :BYTES 6654 :SHA256
   "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b")
  (:PATH "raw/mutations/2/src/mvcc/snapshots-types.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/mvcc/snapshots-types.lisp")
   :BYTES 3817 :SHA256
   "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f")
  (:PATH "raw/mutations/2/src/mvcc/types.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/mvcc/types.lisp")
   :BYTES 471 :SHA256
   "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50")
  (:PATH "raw/mutations/2/src/package.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH "raw/mutations/2/src/read/core.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/read/core.lisp")
   :BYTES 3846 :SHA256
   "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f")
  (:PATH "raw/mutations/2/src/read/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/read/package.lisp")
   :BYTES 831 :SHA256
   "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df")
  (:PATH "raw/mutations/2/src/read/task.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/read/task.lisp")
   :BYTES 5073 :SHA256
   "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2")
  (:PATH "raw/mutations/2/src/read/types.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/read/types.lisp")
   :BYTES 2358 :SHA256
   "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c")
  (:PATH "raw/mutations/2/src/recovery/decisions-build.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/recovery/decisions-build.lisp")
   :BYTES 11857 :SHA256
   "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115")
  (:PATH "raw/mutations/2/src/recovery/decisions-package.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/recovery/decisions-package.lisp")
   :BYTES 818 :SHA256
   "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39")
  (:PATH "raw/mutations/2/src/recovery/decisions-query.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/recovery/decisions-query.lisp")
   :BYTES 4525 :SHA256
   "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24")
  (:PATH "raw/mutations/2/src/recovery/decisions-radix.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/recovery/decisions-radix.lisp")
   :BYTES 11061 :SHA256
   "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54")
  (:PATH "raw/mutations/2/src/recovery/decisions-sort.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/recovery/decisions-sort.lisp")
   :BYTES 7654 :SHA256
   "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2")
  (:PATH "raw/mutations/2/src/recovery/decisions-types.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/recovery/decisions-types.lisp")
   :BYTES 2056 :SHA256
   "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c")
  (:PATH "raw/mutations/2/src/recovery/inventory-build.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/recovery/inventory-build.lisp")
   :BYTES 9592 :SHA256
   "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e")
  (:PATH "raw/mutations/2/src/recovery/inventory-query.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/recovery/inventory-query.lisp")
   :BYTES 2100 :SHA256
   "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb")
  (:PATH "raw/mutations/2/src/recovery/inventory-types.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/recovery/inventory-types.lisp")
   :BYTES 2392 :SHA256
   "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9")
  (:PATH "raw/mutations/2/src/recovery/manifest-build.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/recovery/manifest-build.lisp")
   :BYTES 10251 :SHA256
   "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471")
  (:PATH "raw/mutations/2/src/recovery/manifest-decode.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/recovery/manifest-decode.lisp")
   :BYTES 6160 :SHA256
   "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779")
  (:PATH "raw/mutations/2/src/recovery/manifest-fold.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/recovery/manifest-fold.lisp")
   :BYTES 7068 :SHA256
   "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730")
  (:PATH "raw/mutations/2/src/recovery/manifest-package.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/recovery/manifest-package.lisp")
   :BYTES 1372 :SHA256
   "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc")
  (:PATH "raw/mutations/2/src/recovery/manifest-query.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/recovery/manifest-query.lisp")
   :BYTES 3582 :SHA256
   "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b")
  (:PATH "raw/mutations/2/src/recovery/manifest-types.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/recovery/manifest-types.lisp")
   :BYTES 3345 :SHA256
   "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10")
  (:PATH "raw/mutations/2/src/recovery/package.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/recovery/package.lisp")
   :BYTES 927 :SHA256
   "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9")
  (:PATH "raw/mutations/2/src/recovery/scan.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/recovery/scan.lisp")
   :BYTES 12829 :SHA256
   "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218")
  (:PATH "raw/mutations/2/src/series/events.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/series/events.lisp")
   :BYTES 9566 :SHA256
   "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7")
  (:PATH "raw/mutations/2/src/series/io-events.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/series/io-events.lisp")
   :BYTES 5385 :SHA256
   "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546")
  (:PATH "raw/mutations/2/src/series/ownership.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/series/ownership.lisp")
   :BYTES 8810 :SHA256
   "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4")
  (:PATH "raw/mutations/2/src/series/package.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/series/package.lisp")
   :BYTES 1392 :SHA256
   "7433162105df63d324141167e6dcf6bfee74611aa1cf7291cc6c92f41f3c7408")
  (:PATH "raw/mutations/2/src/series/publication.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/series/publication.lisp")
   :BYTES 6094 :SHA256
   "288cb3fa41fad76a0e6919dfa0b2fce2beef15f5880129393bee35bc8795c762")
  (:PATH "raw/mutations/2/src/series/query.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/series/query.lisp")
   :BYTES 3600 :SHA256
   "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9")
  (:PATH "raw/mutations/2/src/series/retirement.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/series/retirement.lisp")
   :BYTES 4634 :SHA256
   "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059")
  (:PATH "raw/mutations/2/src/series/types.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/series/types.lisp")
   :BYTES 3316 :SHA256
   "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9")
  (:PATH "raw/mutations/2/src/series/worker-boundary.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/series/worker-boundary.lisp")
   :BYTES 3443 :SHA256
   "793d401d1b9acc7b67923d815560f277f3d390ca050740f735f07d88dbacfe73")
  (:PATH "raw/mutations/2/src/series/worker-package.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/series/worker-package.lisp")
   :BYTES 1036 :SHA256
   "881a2958ddb8f5781954d4c59d7467e34c03c01fbb2fea43dc06e9e2050a1f37")
  (:PATH "raw/mutations/2/src/series/worker-run.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/series/worker-run.lisp")
   :BYTES 6985 :SHA256
   "f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f")
  (:PATH "raw/mutations/2/src/series/worker-types.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/series/worker-types.lisp")
   :BYTES 6493 :SHA256
   "a366799fd9b938bfaa48b0ffda228ff8369ab9acb5b5ead7f081dfc66ab2c81a")
  (:PATH "raw/mutations/2/src/storage/compaction-scan.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/storage/compaction-scan.lisp")
   :BYTES 5510 :SHA256
   "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d")
  (:PATH "raw/mutations/2/src/storage/control-payload.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/storage/control-payload.lisp")
   :BYTES 6273 :SHA256
   "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491")
  (:PATH "raw/mutations/2/src/storage/formats.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/storage/formats.lisp")
   :BYTES 3841 :SHA256
   "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f")
  (:PATH "raw/mutations/2/src/storage/log-header.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/storage/log-header.lisp")
   :BYTES 3947 :SHA256
   "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81")
  (:PATH "raw/mutations/2/src/storage/package.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/storage/package.lisp")
   :BYTES 1079 :SHA256
   "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e")
  (:PATH "raw/mutations/2/src/storage/payload-record.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/storage/payload-record.lisp")
   :BYTES 3641 :SHA256
   "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7")
  (:PATH "raw/mutations/2/src/storage/payload-write.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/storage/payload-write.lisp")
   :BYTES 5239 :SHA256
   "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc")
  (:PATH "raw/mutations/2/src/storage/segment-header.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/storage/segment-header.lisp")
   :BYTES 5517 :SHA256
   "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011")
  (:PATH "raw/mutations/2/src/wal/builder.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/wal/builder.lisp")
   :BYTES 8445 :SHA256
   "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0")
  (:PATH "raw/mutations/2/src/wal/csn.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/wal/csn.lisp")
   :BYTES 9577 :SHA256
   "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810")
  (:PATH "raw/mutations/2/src/wal/executor.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/wal/executor.lisp")
   :BYTES 6023 :SHA256
   "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8")
  (:PATH "raw/mutations/2/src/wal/group.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/wal/group.lisp")
   :BYTES 6305 :SHA256
   "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b")
  (:PATH "raw/mutations/2/src/wal/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/wal/package.lisp")
   :BYTES 1774 :SHA256
   "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89")
  (:PATH "raw/mutations/2/src/wal/types.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/src/wal/types.lisp")
   :BYTES 5420 :SHA256
   "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e")
  (:PATH "raw/mutations/2/test.log" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/test.log")
   :BYTES 25435 :SHA256
   "1c8fa126dadf4474048a460a568d3aa2ef6e108ab528510a0e44536de5f8b07c")
  (:PATH "raw/mutations/2/tests/codec/cbor-header.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/codec/cbor-header.lisp")
   :BYTES 10773 :SHA256
   "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815")
  (:PATH "raw/mutations/2/tests/codec/cbor-minimal-edges.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/codec/cbor-minimal-edges.lisp")
   :BYTES 1613 :SHA256
   "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70")
  (:PATH "raw/mutations/2/tests/codec/cbor-minimal-scan-support.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/codec/cbor-minimal-scan-support.lisp")
   :BYTES 8363 :SHA256
   "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421")
  (:PATH "raw/mutations/2/tests/codec/cbor-minimal-scan-threads.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/codec/cbor-minimal-scan-threads.lisp")
   :BYTES 4547 :SHA256
   "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660")
  (:PATH "raw/mutations/2/tests/codec/cbor-minimal-scan.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/codec/cbor-minimal-scan.lisp")
   :BYTES 19217 :SHA256
   "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8")
  (:PATH "raw/mutations/2/tests/codec/cbor-minimal-support.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/codec/cbor-minimal-support.lisp")
   :BYTES 8620 :SHA256
   "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a")
  (:PATH "raw/mutations/2/tests/codec/cbor-minimal-threads.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/codec/cbor-minimal-threads.lisp")
   :BYTES 3799 :SHA256
   "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2")
  (:PATH "raw/mutations/2/tests/codec/cbor-minimal.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/codec/cbor-minimal.lisp")
   :BYTES 12604 :SHA256
   "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3")
  (:PATH "raw/mutations/2/tests/codec/cbor-simple-write-support.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/codec/cbor-simple-write-support.lisp")
   :BYTES 4955 :SHA256
   "53ceafc72a027a2ff1f787900558ff26f2ff70bbb212f1b37926a6d520fbe86e")
  (:PATH "raw/mutations/2/tests/codec/cbor-simple-write-threads.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/codec/cbor-simple-write-threads.lisp")
   :BYTES 3561 :SHA256
   "77074033e75a224fd02e890f98dffa8e97d3a1f8bedd510b00ea55d8ff8687b2")
  (:PATH "raw/mutations/2/tests/codec/cbor-simple-write.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/codec/cbor-simple-write.lisp")
   :BYTES 10712 :SHA256
   "958bdd3901cfc41032c09d6c9023b192799981884e09ce3573256ff45bc5329a")
  (:PATH "raw/mutations/2/tests/codec/cbor-string-write-support.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/codec/cbor-string-write-support.lisp")
   :BYTES 6868 :SHA256
   "2cbdb601f442a56456bc637c94e759cc965f44b178268dce3c636c385d34fc39")
  (:PATH "raw/mutations/2/tests/codec/cbor-string-write-threads.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/codec/cbor-string-write-threads.lisp")
   :BYTES 3512 :SHA256
   "8e07b881a55e2554a429f1c8b2c69f67862ac015217d90d019167d636564d27d")
  (:PATH "raw/mutations/2/tests/codec/cbor-string-write.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/codec/cbor-string-write.lisp")
   :BYTES 15883 :SHA256
   "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115")
  (:PATH "raw/mutations/2/tests/codec/cbor-structure-support.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:PATH "raw/mutations/2/tests/codec/cbor-structure-threads.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/codec/cbor-structure-threads.lisp")
   :BYTES 4305 :SHA256
   "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645")
  (:PATH "raw/mutations/2/tests/codec/cbor-structure.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/codec/cbor-structure.lisp")
   :BYTES 22968 :SHA256
   "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110")
  (:PATH "raw/mutations/2/tests/codec/cbor-support.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:PATH "raw/mutations/2/tests/codec/cbor-threads.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/codec/cbor-threads.lisp")
   :BYTES 3683 :SHA256
   "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14")
  (:PATH "raw/mutations/2/tests/codec/cbor-write-roundtrip.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/codec/cbor-write-roundtrip.lisp")
   :BYTES 901 :SHA256
   "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344")
  (:PATH "raw/mutations/2/tests/codec/cbor-write-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/codec/cbor-write-support.lisp")
   :BYTES 4768 :SHA256
   "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6")
  (:PATH "raw/mutations/2/tests/codec/cbor-write-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/codec/cbor-write-threads.lisp")
   :BYTES 3813 :SHA256
   "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb")
  (:PATH "raw/mutations/2/tests/codec/cbor-write.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/codec/cbor-write.lisp")
   :BYTES 9822 :SHA256
   "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3")
  (:PATH "raw/mutations/2/tests/codec/support.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/codec/support.lisp")
   :BYTES 5807 :SHA256
   "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96")
  (:PATH "raw/mutations/2/tests/codec/threads.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/codec/threads.lisp")
   :BYTES 3111 :SHA256
   "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337")
  (:PATH "raw/mutations/2/tests/codec/utf8.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/codec/utf8.lisp")
   :BYTES 12892 :SHA256
   "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100")
  (:PATH "raw/mutations/2/tests/csn/registry.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/csn/registry.lisp")
   :BYTES 19411 :SHA256
   "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950")
  (:PATH "raw/mutations/2/tests/csn/support.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/csn/support.lisp")
   :BYTES 11407 :SHA256
   "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db")
  (:PATH "raw/mutations/2/tests/csn/threads.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/csn/threads.lisp")
   :BYTES 10525 :SHA256
   "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2")
  (:PATH "raw/mutations/2/tests/epochs/lifecycle.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/epochs/lifecycle.lisp")
   :BYTES 25394 :SHA256
   "ddc2fbdad9f97d2e4ff008c167776a50b17b742398306fbd5198dca474559cbf")
  (:PATH "raw/mutations/2/tests/epochs/support.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/epochs/support.lisp")
   :BYTES 5943 :SHA256
   "366be7af4bf6c4ed946b3fa9e97aea6b034c83e3b757d81c54078dc76d229b6d")
  (:PATH "raw/mutations/2/tests/epochs/threads.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/epochs/threads.lisp")
   :BYTES 3654 :SHA256
   "54b73e06c61e64f32a3e3af0791891dacb6590e929163dcf0fac95f2c71e66fd")
  (:PATH "raw/mutations/2/tests/execution/handoff.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/execution/handoff.lisp")
   :BYTES 33278 :SHA256
   "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e")
  (:PATH "raw/mutations/2/tests/execution/queue.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/execution/queue.lisp")
   :BYTES 12894 :SHA256
   "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722")
  (:PATH "raw/mutations/2/tests/execution/ready-recycle.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/execution/ready-recycle.lisp")
   :BYTES 30075 :SHA256
   "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae")
  (:PATH "raw/mutations/2/tests/execution/ready.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/execution/ready.lisp")
   :BYTES 33555 :SHA256
   "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e")
  (:PATH "raw/mutations/2/tests/execution/support.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/execution/support.lisp")
   :BYTES 4469 :SHA256
   "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43")
  (:PATH "raw/mutations/2/tests/execution/threads.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/execution/threads.lisp")
   :BYTES 14622 :SHA256
   "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359")
  (:PATH "raw/mutations/2/tests/execution/worker.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/execution/worker.lisp")
   :BYTES 59783 :SHA256
   "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06")
  (:PATH "raw/mutations/2/tests/foundation/batch.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/foundation/batch.lisp")
   :BYTES 5185 :SHA256
   "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183")
  (:PATH "raw/mutations/2/tests/foundation/binary.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/foundation/binary.lisp")
   :BYTES 3721 :SHA256
   "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe")
  (:PATH "raw/mutations/2/tests/foundation/record.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/foundation/record.lisp")
   :BYTES 14950 :SHA256
   "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8")
  (:PATH "raw/mutations/2/tests/foundation/support.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:PATH "raw/mutations/2/tests/get-performance/guards.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/get-performance/guards.lisp")
   :BYTES 8986 :SHA256
   "c41721b917ed443355ea3707efdd07e7da53a978c0515ab1e5ede5fcc47d63fc")
  (:PATH "raw/mutations/2/tests/get-performance/paths.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/get-performance/paths.lisp")
   :BYTES 4936 :SHA256
   "3b8d2c9c93467507ea2bb471d42192eb1fa084b55c0f4263b5ef0d3acf468f55")
  (:PATH "raw/mutations/2/tests/get-performance/support.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/get-performance/support.lisp")
   :BYTES 22497 :SHA256
   "e586ed94dcb2aaba00282931cdd83313e4f84a86d4d1ba85e2d56e8b7433ed8d")
  (:PATH "raw/mutations/2/tests/get-performance/threads.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/get-performance/threads.lisp")
   :BYTES 4744 :SHA256
   "05ace5eb351ab49da59611dc1a2a5abedb9d723a2fc6e75a30fc76e507573a90")
  (:PATH "raw/mutations/2/tests/hash/guards.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/hash/guards.lisp")
   :BYTES 1162 :SHA256
   "9af5b38443a57d224990a68e93f12f7a4cda306f94c7ccd3ccb50635865d7864")
  (:PATH "raw/mutations/2/tests/hash/hash64.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/hash/hash64.lisp")
   :BYTES 17948 :SHA256
   "70606bc68807143cfea9583871474c84efc868d13692cde28488284dee43e0f1")
  (:PATH "raw/mutations/2/tests/hash/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/hash/support.lisp")
   :BYTES 10828 :SHA256
   "0fae9dc36976af544f83e6051b9cf9d67c9bef0b9e25f1fa2a48fdac48592acb")
  (:PATH "raw/mutations/2/tests/hash/threads.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/hash/threads.lisp")
   :BYTES 6701 :SHA256
   "3fc587a57d26a294aebfc6a7aeadf2f61a42a21106c1c57517f891b76b4e750a")
  (:PATH "raw/mutations/2/tests/index/hash-digests.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/index/hash-digests.lisp")
   :BYTES 35926 :SHA256
   "3b3b39f861883cf2017cab8e6488560a6bb3897d63784f00e820a6450d743225")
  (:PATH "raw/mutations/2/tests/index/primary-support.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/index/primary-support.lisp")
   :BYTES 13938 :SHA256
   "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a")
  (:PATH "raw/mutations/2/tests/index/primary-threads.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/index/primary-threads.lisp")
   :BYTES 13744 :SHA256
   "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2")
  (:PATH "raw/mutations/2/tests/index/primary.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/index/primary.lisp")
   :BYTES 30166 :SHA256
   "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696")
  (:PATH "raw/mutations/2/tests/index/rebuild.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/index/rebuild.lisp")
   :BYTES 32112 :SHA256
   "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1")
  (:PATH "raw/mutations/2/tests/index/slot-support.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/index/slot-support.lisp")
   :BYTES 12800 :SHA256
   "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31")
  (:PATH "raw/mutations/2/tests/index/slot-threads.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/index/slot-threads.lisp")
   :BYTES 11698 :SHA256
   "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f")
  (:PATH "raw/mutations/2/tests/index/slots.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/index/slots.lisp")
   :BYTES 26420 :SHA256
   "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb")
  (:PATH "raw/mutations/2/tests/io/native.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/io/native.lisp")
   :BYTES 6207 :SHA256
   "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0")
  (:PATH "raw/mutations/2/tests/io/support.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/io/support.lisp")
   :BYTES 2951 :SHA256
   "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50")
  (:PATH "raw/mutations/2/tests/io/transfer.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/io/transfer.lisp")
   :BYTES 11847 :SHA256
   "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd")
  (:PATH "raw/mutations/2/tests/lint-fixtures/bad.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/lint-fixtures/bad.lisp")
   :BYTES 1587 :SHA256
   "ac8912ce6cc1101f2ebc305a50c0565879547b527d7ca0aeac900ee06bf26652")
  (:PATH "raw/mutations/2/tests/lint-fixtures/good.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/lint-fixtures/good.lisp")
   :BYTES 671 :SHA256
   "05ce84f8fd12d9af48252601bcc92d6d60335b53f39b01a9fe2697c4bdaa8cee")
  (:PATH "raw/mutations/2/tests/lint-fixtures/keyword-barrier.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/lint-fixtures/keyword-barrier.lisp")
   :BYTES 199 :SHA256
   "e26dab117e9526ace35bb45b92f977065d33fcc4404c40fd4fc3c77749689a96")
  (:PATH "raw/mutations/2/tests/lint-fixtures/qualified-reader.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/lint-fixtures/qualified-reader.lisp")
   :BYTES 152 :SHA256
   "835229bdc1a0ed0c08511cd6121e1f1bc4284da2cfba951b72cd1a74a6040d35")
  (:PATH "raw/mutations/2/tests/mvcc/capture.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/mvcc/capture.lisp")
   :BYTES 16356 :SHA256
   "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35")
  (:PATH "raw/mutations/2/tests/mvcc/lifecycle.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/mvcc/lifecycle.lisp")
   :BYTES 23964 :SHA256
   "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16")
  (:PATH "raw/mutations/2/tests/mvcc/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/mvcc/support.lisp")
   :BYTES 5931 :SHA256
   "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290")
  (:PATH "raw/mutations/2/tests/read/lifecycle.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/read/lifecycle.lisp")
   :BYTES 17804 :SHA256
   "c4c4642408816f2e0e809e21d04739b68b9391237e3e46ea0b195ed82857c3a8")
  (:PATH "raw/mutations/2/tests/read/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/read/support.lisp")
   :BYTES 4845 :SHA256
   "8095cc39d49342f6e43f3421b4fced839da02d8d11b4d8ddcd91bd346447e754")
  (:PATH "raw/mutations/2/tests/read/threads.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/read/threads.lisp")
   :BYTES 4150 :SHA256
   "e2e223b69b08a5d76b9773c6ad4dee13ef2ddbb6f5ababa713cc5654bc7b51c5")
  (:PATH "raw/mutations/2/tests/recovery/corruption.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/recovery/corruption.lisp")
   :BYTES 7106 :SHA256
   "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c")
  (:PATH "raw/mutations/2/tests/recovery/decisions-audit.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/recovery/decisions-audit.lisp")
   :BYTES 14971 :SHA256
   "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0")
  (:PATH "raw/mutations/2/tests/recovery/decisions-radix.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/recovery/decisions-radix.lisp")
   :BYTES 27851 :SHA256
   "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0")
  (:PATH "raw/mutations/2/tests/recovery/decisions-support.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/recovery/decisions-support.lisp")
   :BYTES 6797 :SHA256
   "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4")
  (:PATH "raw/mutations/2/tests/recovery/decisions.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/recovery/decisions.lisp")
   :BYTES 19149 :SHA256
   "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e")
  (:PATH "raw/mutations/2/tests/recovery/inventory-support.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/recovery/inventory-support.lisp")
   :BYTES 8083 :SHA256
   "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27")
  (:PATH "raw/mutations/2/tests/recovery/inventory.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/recovery/inventory.lisp")
   :BYTES 14479 :SHA256
   "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9")
  (:PATH "raw/mutations/2/tests/recovery/manifest-audit.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/recovery/manifest-audit.lisp")
   :BYTES 17670 :SHA256
   "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6")
  (:PATH "raw/mutations/2/tests/recovery/manifest-support.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/recovery/manifest-support.lisp")
   :BYTES 9769 :SHA256
   "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830")
  (:PATH "raw/mutations/2/tests/recovery/manifest.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/recovery/manifest.lisp")
   :BYTES 13799 :SHA256
   "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd")
  (:PATH "raw/mutations/2/tests/recovery/scan.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/recovery/scan.lisp")
   :BYTES 16966 :SHA256
   "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b")
  (:PATH "raw/mutations/2/tests/recovery/support.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/recovery/support.lisp")
   :BYTES 5957 :SHA256
   "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204")
  (:PATH "raw/mutations/2/tests/series/boundaries.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/series/boundaries.lisp")
   :BYTES 5802 :SHA256
   "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8")
  (:PATH "raw/mutations/2/tests/series/controller.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/series/controller.lisp")
   :BYTES 60484 :SHA256
   "4bea80eb231575f48b208ddb57af6a11706481e0ec755b084f6cd4b6fd0481a1")
  (:PATH "raw/mutations/2/tests/series/support.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/series/support.lisp")
   :BYTES 16885 :SHA256
   "8821ae9e002941eff8ea3ae7dbfc727cb6874b68d2d1ef85af668eb2d34a0c0c")
  (:PATH "raw/mutations/2/tests/series/threads.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/series/threads.lisp")
   :BYTES 19694 :SHA256
   "bbea64d207d14698b39ab0f8ded03db11bab09955d3f66705c23d69c09aefc8e")
  (:PATH "raw/mutations/2/tests/series/worker-bridge.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/series/worker-bridge.lisp")
   :BYTES 56677 :SHA256
   "c1ee49702e63978a83cb86c4e5bf437a5a40e48fa02b65d3eaf3dca0d2e39176")
  (:PATH "raw/mutations/2/tests/smoke.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/smoke.lisp")
   :BYTES 735 :SHA256
   "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8")
  (:PATH "raw/mutations/2/tests/storage/compaction-scan.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/storage/compaction-scan.lisp")
   :BYTES 16196 :SHA256
   "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5")
  (:PATH "raw/mutations/2/tests/storage/control-payload.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/storage/control-payload.lisp")
   :BYTES 12651 :SHA256
   "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae")
  (:PATH "raw/mutations/2/tests/storage/log-header.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/storage/log-header.lisp")
   :BYTES 11969 :SHA256
   "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e")
  (:PATH "raw/mutations/2/tests/storage/segment-header.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/storage/segment-header.lisp")
   :BYTES 4149 :SHA256
   "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df")
  (:PATH "raw/mutations/2/tests/storage/support.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/storage/support.lisp")
   :BYTES 4029 :SHA256
   "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625")
  (:PATH "raw/mutations/2/tests/wal/builder.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/wal/builder.lisp")
   :BYTES 4000 :SHA256
   "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6")
  (:PATH "raw/mutations/2/tests/wal/csn-threads.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/wal/csn-threads.lisp")
   :BYTES 12114 :SHA256
   "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c")
  (:PATH "raw/mutations/2/tests/wal/csn.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/wal/csn.lisp")
   :BYTES 34661 :SHA256
   "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a")
  (:PATH "raw/mutations/2/tests/wal/fault.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/wal/fault.lisp")
   :BYTES 7614 :SHA256
   "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875")
  (:PATH "raw/mutations/2/tests/wal/group.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/wal/group.lisp")
   :BYTES 5524 :SHA256
   "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e")
  (:PATH "raw/mutations/2/tests/wal/native.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/wal/native.lisp")
   :BYTES 2567 :SHA256
   "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7")
  (:PATH "raw/mutations/2/tests/wal/support.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tests/wal/support.lisp")
   :BYTES 1951 :SHA256
   "90a47539e5e2898c0a08059207f30bb5551e7ca8fc166f8f6ce7b95afa757295")
  (:PATH "raw/mutations/2/tools/build.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/2/tools/cbor-simple-write-isolated-build.lisp" :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/2/tools/cbor-simple-write-isolated-build.lisp")
   :BYTES 478 :SHA256
   "bd4af4b46a699fd5dce85cb75360d8aafe37fe33edd3f0dc93e312239728d010")
  (:PATH "raw/mutations/3/src/cache/build.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/cache/build.lisp")
   :BYTES 4966 :SHA256
   "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0")
  (:PATH "raw/mutations/3/src/cache/clock.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/cache/clock.lisp")
   :BYTES 2952 :SHA256
   "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f")
  (:PATH "raw/mutations/3/src/cache/core.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/cache/core.lisp")
   :BYTES 3503 :SHA256
   "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4")
  (:PATH "raw/mutations/3/src/cache/package.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/cache/package.lisp")
   :BYTES 758 :SHA256
   "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848")
  (:PATH "raw/mutations/3/src/cache/read.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/cache/read.lisp")
   :BYTES 6485 :SHA256
   "5700e43ae8ee859e96bdecb5953af43a712fd9e6ec23a53565759676bb07f85a")
  (:PATH "raw/mutations/3/src/cache/types.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/cache/types.lisp")
   :BYTES 2448 :SHA256
   "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30")
  (:PATH "raw/mutations/3/src/cache/write.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/cache/write.lisp")
   :BYTES 5481 :SHA256
   "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8")
  (:PATH "raw/mutations/3/src/codec/cbor-float-minimal.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH "raw/mutations/3/src/codec/cbor-header.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH "raw/mutations/3/src/codec/cbor-minimal.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH "raw/mutations/3/src/codec/cbor-package.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/codec/cbor-package.lisp")
   :BYTES 620 :SHA256
   "53fa9acbed8f5602b204252ff394c01fd01effdbe41baf021a713e2636cbd668")
  (:PATH "raw/mutations/3/src/codec/cbor-scan-input.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH "raw/mutations/3/src/codec/cbor-scan-items.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH "raw/mutations/3/src/codec/cbor-scan-minimal.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH "raw/mutations/3/src/codec/cbor-scan-stack.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH "raw/mutations/3/src/codec/cbor-scan.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH "raw/mutations/3/src/codec/cbor-simple-write.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/codec/cbor-simple-write.lisp")
   :BYTES 2887 :SHA256
   "b7adb8de2b748c78e7d94891f4a0f890c20cc5c29535c744f4c8ef401b9223d9")
  (:PATH "raw/mutations/3/src/codec/cbor-space.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH "raw/mutations/3/src/codec/cbor-string-write.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727")
  (:PATH "raw/mutations/3/src/codec/cbor-write.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/mutations/3/src/codec/package.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH "raw/mutations/3/src/codec/utf8.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH "raw/mutations/3/src/csn/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/csn/package.lisp")
   :BYTES 441 :SHA256
   "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0")
  (:PATH "raw/mutations/3/src/csn/registry.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/csn/registry.lisp")
   :BYTES 12139 :SHA256
   "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a")
  (:PATH "raw/mutations/3/src/epochs/core.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/epochs/core.lisp")
   :BYTES 5909 :SHA256
   "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399")
  (:PATH "raw/mutations/3/src/epochs/package.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/epochs/package.lisp")
   :BYTES 779 :SHA256
   "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd")
  (:PATH "raw/mutations/3/src/epochs/read.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/epochs/read.lisp")
   :BYTES 3240 :SHA256
   "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905")
  (:PATH "raw/mutations/3/src/epochs/reclaim.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/epochs/reclaim.lisp")
   :BYTES 6373 :SHA256
   "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202")
  (:PATH "raw/mutations/3/src/epochs/retire.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/epochs/retire.lisp")
   :BYTES 5858 :SHA256
   "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b")
  (:PATH "raw/mutations/3/src/epochs/types.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/epochs/types.lisp")
   :BYTES 5304 :SHA256
   "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097")
  (:PATH "raw/mutations/3/src/execution/handoff.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/execution/handoff.lisp")
   :BYTES 7394 :SHA256
   "ee90c809ef51134efa21e08b819e5530304efaf9f9e26b63c7e4afbf6d48e607")
  (:PATH "raw/mutations/3/src/execution/package.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/execution/package.lisp")
   :BYTES 1157 :SHA256
   "bbe8cdb6f7e74d7139f5e472a915cc74b43e34bd27ecac1c5fd364f723a2a643")
  (:PATH "raw/mutations/3/src/execution/queue.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/execution/queue.lisp")
   :BYTES 5374 :SHA256
   "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90")
  (:PATH "raw/mutations/3/src/execution/ready-recycle.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/execution/ready-recycle.lisp")
   :BYTES 3387 :SHA256
   "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b")
  (:PATH "raw/mutations/3/src/execution/ready-types.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/execution/ready-types.lisp")
   :BYTES 5248 :SHA256
   "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f")
  (:PATH "raw/mutations/3/src/execution/ready.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/execution/ready.lisp")
   :BYTES 6635 :SHA256
   "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327")
  (:PATH "raw/mutations/3/src/execution/worker-boundary.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/execution/worker-boundary.lisp")
   :BYTES 2309 :SHA256
   "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a")
  (:PATH "raw/mutations/3/src/execution/worker-claim.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/execution/worker-claim.lisp")
   :BYTES 6401 :SHA256
   "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e")
  (:PATH "raw/mutations/3/src/execution/worker-run.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/execution/worker-run.lisp")
   :BYTES 5124 :SHA256
   "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542")
  (:PATH "raw/mutations/3/src/execution/worker-types.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/execution/worker-types.lisp")
   :BYTES 8461 :SHA256
   "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317")
  (:PATH "raw/mutations/3/src/execution/writer.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/execution/writer.lisp")
   :BYTES 6484 :SHA256
   "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105")
  (:PATH "raw/mutations/3/src/foundation/batch.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH "raw/mutations/3/src/foundation/binary.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH "raw/mutations/3/src/foundation/conditions.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH "raw/mutations/3/src/foundation/crc32c.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH "raw/mutations/3/src/foundation/package.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH "raw/mutations/3/src/foundation/record.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH "raw/mutations/3/src/get-resolver/build.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/get-resolver/build.lisp")
   :BYTES 6882 :SHA256
   "3715cb750e08ab30fcaa068a05b17772381a3cf1975bdbdd0c03f71761089ef6")
  (:PATH "raw/mutations/3/src/get-resolver/package.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/get-resolver/package.lisp")
   :BYTES 1887 :SHA256
   "f244c1346604ccde93880824ea990a4a7329340df6c8b665963713977ca0ee10")
  (:PATH "raw/mutations/3/src/get-resolver/read.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/get-resolver/read.lisp")
   :BYTES 7259 :SHA256
   "68f82df01f7894f66db0c6545267616e76c0ba93fd7c49db6434cec666f02dc3")
  (:PATH "raw/mutations/3/src/get-resolver/rows.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/get-resolver/rows.lisp")
   :BYTES 3350 :SHA256
   "d9db85d788006fc7ad1f9a7cdeef28b992605de7fac8c295dd7fdc51f5511854")
  (:PATH "raw/mutations/3/src/get-resolver/scan.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/get-resolver/scan.lisp")
   :BYTES 6786 :SHA256
   "35a1780c6bf66364ef94c4151fa91f02eebe359f0ca0639985d2a907fd9d512d")
  (:PATH "raw/mutations/3/src/get-resolver/sort.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/get-resolver/sort.lisp")
   :BYTES 7118 :SHA256
   "974bf44efeb1cd26c5e9db0601aea295c8f1a18234894ad9d41938a2880e2255")
  (:PATH "raw/mutations/3/src/get-resolver/types.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/get-resolver/types.lisp")
   :BYTES 1757 :SHA256
   "1334512380bfb01add33b0ca152c0ce4746b3f79bcd04f84d7844ef234d6eaba")
  (:PATH "raw/mutations/3/src/get/build.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/get/build.lisp")
   :BYTES 3745 :SHA256
   "bcfc4916e9a85833dc151c4ce176bc905f2c03b6bc6d636f97a60df0d8c16739")
  (:PATH "raw/mutations/3/src/get/lifecycle.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/get/lifecycle.lisp")
   :BYTES 5345 :SHA256
   "885ba4141114ea411cac37c9b5f924aaa7f9f2a5ba311ebf92a392e5da1e3c59")
  (:PATH "raw/mutations/3/src/get/lookup.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/get/lookup.lisp")
   :BYTES 4352 :SHA256
   "9d1042d4cf1e7bd9c6d1153de12b2459e7a2724e47bd32534cd7ae56cb274c5f")
  (:PATH "raw/mutations/3/src/get/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/get/package.lisp")
   :BYTES 1995 :SHA256
   "87b795779aef0c4b918a039d182daddd22b902a9ad10c763df4364b7e630151c")
  (:PATH "raw/mutations/3/src/get/segment.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/get/segment.lisp")
   :BYTES 8097 :SHA256
   "4a486528cb2c1cc3471cb4b332d4314d24011889e1f885db6fd5600bb077eea3")
  (:PATH "raw/mutations/3/src/get/target.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/get/target.lisp")
   :BYTES 5652 :SHA256
   "9f682f735e49108cad176a6143ec99e1be64da98f29cae0b52f9b49cdea34250")
  (:PATH "raw/mutations/3/src/get/types.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/get/types.lisp")
   :BYTES 4413 :SHA256
   "653b23a6e719cd1f55e7c58b4d7e8143aec5983992ba210d0eac1f4c8682f623")
  (:PATH "raw/mutations/3/src/hash/arithmetic.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/hash/arithmetic.lisp")
   :BYTES 3073 :SHA256
   "c439e534b768acb123d69b921b85e1e56683aa8335bbc87efba95fe95f256fa9")
  (:PATH "raw/mutations/3/src/hash/blocks.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/hash/blocks.lisp")
   :BYTES 3262 :SHA256
   "5f5dff95ae6c34dfc15538c537ba2fa8d34ba2376ad66ad9975745ea13a2175f")
  (:PATH "raw/mutations/3/src/hash/hash64.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/hash/hash64.lisp")
   :BYTES 1768 :SHA256
   "99e4c8394a8f877ce1f552f15a57a082c0ec81015e87119ee4ffea28cf3ae77f")
  (:PATH "raw/mutations/3/src/hash/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/hash/package.lisp")
   :BYTES 477 :SHA256
   "1e7668fa26fc1a8e3b3cfe824aa3e08b30b57441d5f90d44453fc3a9259a10d0")
  (:PATH "raw/mutations/3/src/index/core.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/index/core.lisp")
   :BYTES 2959 :SHA256
   "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff")
  (:PATH "raw/mutations/3/src/index/hash-digests.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/index/hash-digests.lisp")
   :BYTES 3674 :SHA256
   "924bb7dab91ff56c1e909f2b06dff5f74b443ac6442e379498f29b25f1fa2673")
  (:PATH "raw/mutations/3/src/index/hash-seed.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/index/hash-seed.lisp")
   :BYTES 2437 :SHA256
   "ae86514101e95737747ba58a4f0c5dc1ddb44d2b3a18bceb8fd0d0756b57a7a1")
  (:PATH "raw/mutations/3/src/index/package.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/index/package.lisp")
   :BYTES 727 :SHA256
   "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507")
  (:PATH "raw/mutations/3/src/index/primary-arena.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/index/primary-arena.lisp")
   :BYTES 3485 :SHA256
   "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5")
  (:PATH "raw/mutations/3/src/index/primary-build.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/index/primary-build.lisp")
   :BYTES 5379 :SHA256
   "06ca5ac8c03504e2d2f973873e5cabf7518c090cd1f8f2118c46e0ea2f9bf37b")
  (:PATH "raw/mutations/3/src/index/primary-core.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/index/primary-core.lisp")
   :BYTES 4211 :SHA256
   "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e")
  (:PATH "raw/mutations/3/src/index/primary-directory.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/index/primary-directory.lisp")
   :BYTES 8114 :SHA256
   "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd")
  (:PATH "raw/mutations/3/src/index/primary-package.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/index/primary-package.lisp")
   :BYTES 1451 :SHA256
   "0682eb9a61596506b6788bd0285f9808db2496246caae64ab3203182ed46b860")
  (:PATH "raw/mutations/3/src/index/primary-probe.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/index/primary-probe.lisp")
   :BYTES 5936 :SHA256
   "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4")
  (:PATH "raw/mutations/3/src/index/primary-read.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/index/primary-read.lisp")
   :BYTES 3575 :SHA256
   "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f")
  (:PATH "raw/mutations/3/src/index/primary-relocate.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/index/primary-relocate.lisp")
   :BYTES 4073 :SHA256
   "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20")
  (:PATH "raw/mutations/3/src/index/primary-types.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/index/primary-types.lisp")
   :BYTES 3949 :SHA256
   "f17ca0dcd8a538b921f00044e23872b28272638c4435eacd30f0509422505e64")
  (:PATH "raw/mutations/3/src/index/primary-write.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/index/primary-write.lisp")
   :BYTES 7061 :SHA256
   "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655")
  (:PATH "raw/mutations/3/src/index/read.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/index/read.lisp")
   :BYTES 3030 :SHA256
   "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7")
  (:PATH "raw/mutations/3/src/index/rebuild-budget.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/index/rebuild-budget.lisp")
   :BYTES 3593 :SHA256
   "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0")
  (:PATH "raw/mutations/3/src/index/rebuild-copy.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/index/rebuild-copy.lisp")
   :BYTES 4027 :SHA256
   "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee")
  (:PATH "raw/mutations/3/src/index/rebuild-scan.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/index/rebuild-scan.lisp")
   :BYTES 5002 :SHA256
   "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e")
  (:PATH "raw/mutations/3/src/index/rebuild.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/index/rebuild.lisp")
   :BYTES 2872 :SHA256
   "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1")
  (:PATH "raw/mutations/3/src/index/relocate.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/index/relocate.lisp")
   :BYTES 2383 :SHA256
   "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc")
  (:PATH "raw/mutations/3/src/index/types.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/index/types.lisp")
   :BYTES 2434 :SHA256
   "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e")
  (:PATH "raw/mutations/3/src/index/validation.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/index/validation.lisp")
   :BYTES 3930 :SHA256
   "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a")
  (:PATH "raw/mutations/3/src/index/write.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/index/write.lisp")
   :BYTES 4784 :SHA256
   "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28")
  (:PATH "raw/mutations/3/src/io/flush.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/io/flush.lisp")
   :BYTES 1569 :SHA256
   "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325")
  (:PATH "raw/mutations/3/src/io/lifecycle.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/io/lifecycle.lisp")
   :BYTES 4536 :SHA256
   "baa1f763fe0f394a14d381b753dcb1be1e90eb03eaff5d6469465b5d4eca015f")
  (:PATH "raw/mutations/3/src/io/native.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/io/native.lisp")
   :BYTES 5026 :SHA256
   "b8cf3ce1ff7b4fa9def8a602ab768c0e9a321f8d6cdce6e5b2b7ded2fe3d97dd")
  (:PATH "raw/mutations/3/src/io/package.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/io/package.lisp")
   :BYTES 592 :SHA256
   "118eba04ab2aa87a2d86e0b0269dbeacaa485457acebbc12c57317ae465a89c0")
  (:PATH "raw/mutations/3/src/io/transfer.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/io/transfer.lisp")
   :BYTES 5051 :SHA256
   "3748328cf85e1c007900a63bdd0f159f38a8d7cd3577c92c56fc68692b9b7bcf")
  (:PATH "raw/mutations/3/src/io/types.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/io/types.lisp")
   :BYTES 4143 :SHA256
   "50c7eeea91af232fca7103ce5a25535958d73836f01cb45a20c7120b88b1336b")
  (:PATH "raw/mutations/3/src/mvcc/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/mvcc/package.lisp")
   :BYTES 833 :SHA256
   "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c")
  (:PATH "raw/mutations/3/src/mvcc/snapshots-core.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/mvcc/snapshots-core.lisp")
   :BYTES 7622 :SHA256
   "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998")
  (:PATH "raw/mutations/3/src/mvcc/snapshots-csn.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/mvcc/snapshots-csn.lisp")
   :BYTES 2725 :SHA256
   "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77")
  (:PATH "raw/mutations/3/src/mvcc/snapshots-lifecycle.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/mvcc/snapshots-lifecycle.lisp")
   :BYTES 6609 :SHA256
   "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082")
  (:PATH "raw/mutations/3/src/mvcc/snapshots-read.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/mvcc/snapshots-read.lisp")
   :BYTES 6651 :SHA256
   "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9")
  (:PATH "raw/mutations/3/src/mvcc/snapshots-register.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/mvcc/snapshots-register.lisp")
   :BYTES 6654 :SHA256
   "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b")
  (:PATH "raw/mutations/3/src/mvcc/snapshots-types.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/mvcc/snapshots-types.lisp")
   :BYTES 3817 :SHA256
   "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f")
  (:PATH "raw/mutations/3/src/mvcc/types.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/mvcc/types.lisp")
   :BYTES 471 :SHA256
   "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50")
  (:PATH "raw/mutations/3/src/package.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH "raw/mutations/3/src/read/core.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/read/core.lisp")
   :BYTES 3846 :SHA256
   "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f")
  (:PATH "raw/mutations/3/src/read/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/read/package.lisp")
   :BYTES 831 :SHA256
   "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df")
  (:PATH "raw/mutations/3/src/read/task.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/read/task.lisp")
   :BYTES 5073 :SHA256
   "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2")
  (:PATH "raw/mutations/3/src/read/types.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/read/types.lisp")
   :BYTES 2358 :SHA256
   "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c")
  (:PATH "raw/mutations/3/src/recovery/decisions-build.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/recovery/decisions-build.lisp")
   :BYTES 11857 :SHA256
   "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115")
  (:PATH "raw/mutations/3/src/recovery/decisions-package.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/recovery/decisions-package.lisp")
   :BYTES 818 :SHA256
   "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39")
  (:PATH "raw/mutations/3/src/recovery/decisions-query.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/recovery/decisions-query.lisp")
   :BYTES 4525 :SHA256
   "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24")
  (:PATH "raw/mutations/3/src/recovery/decisions-radix.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/recovery/decisions-radix.lisp")
   :BYTES 11061 :SHA256
   "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54")
  (:PATH "raw/mutations/3/src/recovery/decisions-sort.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/recovery/decisions-sort.lisp")
   :BYTES 7654 :SHA256
   "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2")
  (:PATH "raw/mutations/3/src/recovery/decisions-types.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/recovery/decisions-types.lisp")
   :BYTES 2056 :SHA256
   "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c")
  (:PATH "raw/mutations/3/src/recovery/inventory-build.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/recovery/inventory-build.lisp")
   :BYTES 9592 :SHA256
   "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e")
  (:PATH "raw/mutations/3/src/recovery/inventory-query.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/recovery/inventory-query.lisp")
   :BYTES 2100 :SHA256
   "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb")
  (:PATH "raw/mutations/3/src/recovery/inventory-types.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/recovery/inventory-types.lisp")
   :BYTES 2392 :SHA256
   "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9")
  (:PATH "raw/mutations/3/src/recovery/manifest-build.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/recovery/manifest-build.lisp")
   :BYTES 10251 :SHA256
   "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471")
  (:PATH "raw/mutations/3/src/recovery/manifest-decode.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/recovery/manifest-decode.lisp")
   :BYTES 6160 :SHA256
   "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779")
  (:PATH "raw/mutations/3/src/recovery/manifest-fold.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/recovery/manifest-fold.lisp")
   :BYTES 7068 :SHA256
   "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730")
  (:PATH "raw/mutations/3/src/recovery/manifest-package.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/recovery/manifest-package.lisp")
   :BYTES 1372 :SHA256
   "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc")
  (:PATH "raw/mutations/3/src/recovery/manifest-query.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/recovery/manifest-query.lisp")
   :BYTES 3582 :SHA256
   "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b")
  (:PATH "raw/mutations/3/src/recovery/manifest-types.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/recovery/manifest-types.lisp")
   :BYTES 3345 :SHA256
   "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10")
  (:PATH "raw/mutations/3/src/recovery/package.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/recovery/package.lisp")
   :BYTES 927 :SHA256
   "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9")
  (:PATH "raw/mutations/3/src/recovery/scan.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/recovery/scan.lisp")
   :BYTES 12829 :SHA256
   "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218")
  (:PATH "raw/mutations/3/src/series/events.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/series/events.lisp")
   :BYTES 9566 :SHA256
   "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7")
  (:PATH "raw/mutations/3/src/series/io-events.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/series/io-events.lisp")
   :BYTES 5385 :SHA256
   "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546")
  (:PATH "raw/mutations/3/src/series/ownership.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/series/ownership.lisp")
   :BYTES 8810 :SHA256
   "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4")
  (:PATH "raw/mutations/3/src/series/package.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/series/package.lisp")
   :BYTES 1392 :SHA256
   "7433162105df63d324141167e6dcf6bfee74611aa1cf7291cc6c92f41f3c7408")
  (:PATH "raw/mutations/3/src/series/publication.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/series/publication.lisp")
   :BYTES 6094 :SHA256
   "288cb3fa41fad76a0e6919dfa0b2fce2beef15f5880129393bee35bc8795c762")
  (:PATH "raw/mutations/3/src/series/query.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/series/query.lisp")
   :BYTES 3600 :SHA256
   "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9")
  (:PATH "raw/mutations/3/src/series/retirement.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/series/retirement.lisp")
   :BYTES 4634 :SHA256
   "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059")
  (:PATH "raw/mutations/3/src/series/types.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/series/types.lisp")
   :BYTES 3316 :SHA256
   "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9")
  (:PATH "raw/mutations/3/src/series/worker-boundary.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/series/worker-boundary.lisp")
   :BYTES 3443 :SHA256
   "793d401d1b9acc7b67923d815560f277f3d390ca050740f735f07d88dbacfe73")
  (:PATH "raw/mutations/3/src/series/worker-package.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/series/worker-package.lisp")
   :BYTES 1036 :SHA256
   "881a2958ddb8f5781954d4c59d7467e34c03c01fbb2fea43dc06e9e2050a1f37")
  (:PATH "raw/mutations/3/src/series/worker-run.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/series/worker-run.lisp")
   :BYTES 6985 :SHA256
   "f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f")
  (:PATH "raw/mutations/3/src/series/worker-types.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/series/worker-types.lisp")
   :BYTES 6493 :SHA256
   "a366799fd9b938bfaa48b0ffda228ff8369ab9acb5b5ead7f081dfc66ab2c81a")
  (:PATH "raw/mutations/3/src/storage/compaction-scan.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/storage/compaction-scan.lisp")
   :BYTES 5510 :SHA256
   "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d")
  (:PATH "raw/mutations/3/src/storage/control-payload.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/storage/control-payload.lisp")
   :BYTES 6273 :SHA256
   "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491")
  (:PATH "raw/mutations/3/src/storage/formats.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/storage/formats.lisp")
   :BYTES 3841 :SHA256
   "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f")
  (:PATH "raw/mutations/3/src/storage/log-header.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/storage/log-header.lisp")
   :BYTES 3947 :SHA256
   "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81")
  (:PATH "raw/mutations/3/src/storage/package.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/storage/package.lisp")
   :BYTES 1079 :SHA256
   "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e")
  (:PATH "raw/mutations/3/src/storage/payload-record.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/storage/payload-record.lisp")
   :BYTES 3641 :SHA256
   "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7")
  (:PATH "raw/mutations/3/src/storage/payload-write.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/storage/payload-write.lisp")
   :BYTES 5239 :SHA256
   "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc")
  (:PATH "raw/mutations/3/src/storage/segment-header.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/storage/segment-header.lisp")
   :BYTES 5517 :SHA256
   "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011")
  (:PATH "raw/mutations/3/src/wal/builder.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/wal/builder.lisp")
   :BYTES 8445 :SHA256
   "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0")
  (:PATH "raw/mutations/3/src/wal/csn.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/wal/csn.lisp")
   :BYTES 9577 :SHA256
   "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810")
  (:PATH "raw/mutations/3/src/wal/executor.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/wal/executor.lisp")
   :BYTES 6023 :SHA256
   "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8")
  (:PATH "raw/mutations/3/src/wal/group.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/wal/group.lisp")
   :BYTES 6305 :SHA256
   "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b")
  (:PATH "raw/mutations/3/src/wal/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/wal/package.lisp")
   :BYTES 1774 :SHA256
   "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89")
  (:PATH "raw/mutations/3/src/wal/types.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/src/wal/types.lisp")
   :BYTES 5420 :SHA256
   "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e")
  (:PATH "raw/mutations/3/test.log" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/test.log")
   :BYTES 25441 :SHA256
   "2c7493a39069a9df9f9e6c7fade52ad7d4cfb42ec847a96ed941c2a67c65009c")
  (:PATH "raw/mutations/3/tests/codec/cbor-header.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/codec/cbor-header.lisp")
   :BYTES 10773 :SHA256
   "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815")
  (:PATH "raw/mutations/3/tests/codec/cbor-minimal-edges.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/codec/cbor-minimal-edges.lisp")
   :BYTES 1613 :SHA256
   "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70")
  (:PATH "raw/mutations/3/tests/codec/cbor-minimal-scan-support.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/codec/cbor-minimal-scan-support.lisp")
   :BYTES 8363 :SHA256
   "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421")
  (:PATH "raw/mutations/3/tests/codec/cbor-minimal-scan-threads.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/codec/cbor-minimal-scan-threads.lisp")
   :BYTES 4547 :SHA256
   "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660")
  (:PATH "raw/mutations/3/tests/codec/cbor-minimal-scan.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/codec/cbor-minimal-scan.lisp")
   :BYTES 19217 :SHA256
   "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8")
  (:PATH "raw/mutations/3/tests/codec/cbor-minimal-support.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/codec/cbor-minimal-support.lisp")
   :BYTES 8620 :SHA256
   "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a")
  (:PATH "raw/mutations/3/tests/codec/cbor-minimal-threads.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/codec/cbor-minimal-threads.lisp")
   :BYTES 3799 :SHA256
   "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2")
  (:PATH "raw/mutations/3/tests/codec/cbor-minimal.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/codec/cbor-minimal.lisp")
   :BYTES 12604 :SHA256
   "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3")
  (:PATH "raw/mutations/3/tests/codec/cbor-simple-write-support.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/codec/cbor-simple-write-support.lisp")
   :BYTES 4955 :SHA256
   "53ceafc72a027a2ff1f787900558ff26f2ff70bbb212f1b37926a6d520fbe86e")
  (:PATH "raw/mutations/3/tests/codec/cbor-simple-write-threads.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/codec/cbor-simple-write-threads.lisp")
   :BYTES 3561 :SHA256
   "77074033e75a224fd02e890f98dffa8e97d3a1f8bedd510b00ea55d8ff8687b2")
  (:PATH "raw/mutations/3/tests/codec/cbor-simple-write.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/codec/cbor-simple-write.lisp")
   :BYTES 10712 :SHA256
   "958bdd3901cfc41032c09d6c9023b192799981884e09ce3573256ff45bc5329a")
  (:PATH "raw/mutations/3/tests/codec/cbor-string-write-support.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/codec/cbor-string-write-support.lisp")
   :BYTES 6868 :SHA256
   "2cbdb601f442a56456bc637c94e759cc965f44b178268dce3c636c385d34fc39")
  (:PATH "raw/mutations/3/tests/codec/cbor-string-write-threads.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/codec/cbor-string-write-threads.lisp")
   :BYTES 3512 :SHA256
   "8e07b881a55e2554a429f1c8b2c69f67862ac015217d90d019167d636564d27d")
  (:PATH "raw/mutations/3/tests/codec/cbor-string-write.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/codec/cbor-string-write.lisp")
   :BYTES 15883 :SHA256
   "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115")
  (:PATH "raw/mutations/3/tests/codec/cbor-structure-support.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:PATH "raw/mutations/3/tests/codec/cbor-structure-threads.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/codec/cbor-structure-threads.lisp")
   :BYTES 4305 :SHA256
   "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645")
  (:PATH "raw/mutations/3/tests/codec/cbor-structure.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/codec/cbor-structure.lisp")
   :BYTES 22968 :SHA256
   "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110")
  (:PATH "raw/mutations/3/tests/codec/cbor-support.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:PATH "raw/mutations/3/tests/codec/cbor-threads.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/codec/cbor-threads.lisp")
   :BYTES 3683 :SHA256
   "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14")
  (:PATH "raw/mutations/3/tests/codec/cbor-write-roundtrip.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/codec/cbor-write-roundtrip.lisp")
   :BYTES 901 :SHA256
   "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344")
  (:PATH "raw/mutations/3/tests/codec/cbor-write-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/codec/cbor-write-support.lisp")
   :BYTES 4768 :SHA256
   "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6")
  (:PATH "raw/mutations/3/tests/codec/cbor-write-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/codec/cbor-write-threads.lisp")
   :BYTES 3813 :SHA256
   "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb")
  (:PATH "raw/mutations/3/tests/codec/cbor-write.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/codec/cbor-write.lisp")
   :BYTES 9822 :SHA256
   "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3")
  (:PATH "raw/mutations/3/tests/codec/support.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/codec/support.lisp")
   :BYTES 5807 :SHA256
   "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96")
  (:PATH "raw/mutations/3/tests/codec/threads.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/codec/threads.lisp")
   :BYTES 3111 :SHA256
   "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337")
  (:PATH "raw/mutations/3/tests/codec/utf8.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/codec/utf8.lisp")
   :BYTES 12892 :SHA256
   "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100")
  (:PATH "raw/mutations/3/tests/csn/registry.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/csn/registry.lisp")
   :BYTES 19411 :SHA256
   "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950")
  (:PATH "raw/mutations/3/tests/csn/support.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/csn/support.lisp")
   :BYTES 11407 :SHA256
   "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db")
  (:PATH "raw/mutations/3/tests/csn/threads.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/csn/threads.lisp")
   :BYTES 10525 :SHA256
   "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2")
  (:PATH "raw/mutations/3/tests/epochs/lifecycle.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/epochs/lifecycle.lisp")
   :BYTES 25394 :SHA256
   "ddc2fbdad9f97d2e4ff008c167776a50b17b742398306fbd5198dca474559cbf")
  (:PATH "raw/mutations/3/tests/epochs/support.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/epochs/support.lisp")
   :BYTES 5943 :SHA256
   "366be7af4bf6c4ed946b3fa9e97aea6b034c83e3b757d81c54078dc76d229b6d")
  (:PATH "raw/mutations/3/tests/epochs/threads.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/epochs/threads.lisp")
   :BYTES 3654 :SHA256
   "54b73e06c61e64f32a3e3af0791891dacb6590e929163dcf0fac95f2c71e66fd")
  (:PATH "raw/mutations/3/tests/execution/handoff.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/execution/handoff.lisp")
   :BYTES 33278 :SHA256
   "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e")
  (:PATH "raw/mutations/3/tests/execution/queue.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/execution/queue.lisp")
   :BYTES 12894 :SHA256
   "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722")
  (:PATH "raw/mutations/3/tests/execution/ready-recycle.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/execution/ready-recycle.lisp")
   :BYTES 30075 :SHA256
   "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae")
  (:PATH "raw/mutations/3/tests/execution/ready.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/execution/ready.lisp")
   :BYTES 33555 :SHA256
   "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e")
  (:PATH "raw/mutations/3/tests/execution/support.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/execution/support.lisp")
   :BYTES 4469 :SHA256
   "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43")
  (:PATH "raw/mutations/3/tests/execution/threads.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/execution/threads.lisp")
   :BYTES 14622 :SHA256
   "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359")
  (:PATH "raw/mutations/3/tests/execution/worker.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/execution/worker.lisp")
   :BYTES 59783 :SHA256
   "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06")
  (:PATH "raw/mutations/3/tests/foundation/batch.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/foundation/batch.lisp")
   :BYTES 5185 :SHA256
   "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183")
  (:PATH "raw/mutations/3/tests/foundation/binary.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/foundation/binary.lisp")
   :BYTES 3721 :SHA256
   "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe")
  (:PATH "raw/mutations/3/tests/foundation/record.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/foundation/record.lisp")
   :BYTES 14950 :SHA256
   "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8")
  (:PATH "raw/mutations/3/tests/foundation/support.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:PATH "raw/mutations/3/tests/get-performance/guards.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/get-performance/guards.lisp")
   :BYTES 8986 :SHA256
   "c41721b917ed443355ea3707efdd07e7da53a978c0515ab1e5ede5fcc47d63fc")
  (:PATH "raw/mutations/3/tests/get-performance/paths.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/get-performance/paths.lisp")
   :BYTES 4936 :SHA256
   "3b8d2c9c93467507ea2bb471d42192eb1fa084b55c0f4263b5ef0d3acf468f55")
  (:PATH "raw/mutations/3/tests/get-performance/support.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/get-performance/support.lisp")
   :BYTES 22497 :SHA256
   "e586ed94dcb2aaba00282931cdd83313e4f84a86d4d1ba85e2d56e8b7433ed8d")
  (:PATH "raw/mutations/3/tests/get-performance/threads.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/get-performance/threads.lisp")
   :BYTES 4744 :SHA256
   "05ace5eb351ab49da59611dc1a2a5abedb9d723a2fc6e75a30fc76e507573a90")
  (:PATH "raw/mutations/3/tests/hash/guards.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/hash/guards.lisp")
   :BYTES 1162 :SHA256
   "9af5b38443a57d224990a68e93f12f7a4cda306f94c7ccd3ccb50635865d7864")
  (:PATH "raw/mutations/3/tests/hash/hash64.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/hash/hash64.lisp")
   :BYTES 17948 :SHA256
   "70606bc68807143cfea9583871474c84efc868d13692cde28488284dee43e0f1")
  (:PATH "raw/mutations/3/tests/hash/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/hash/support.lisp")
   :BYTES 10828 :SHA256
   "0fae9dc36976af544f83e6051b9cf9d67c9bef0b9e25f1fa2a48fdac48592acb")
  (:PATH "raw/mutations/3/tests/hash/threads.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/hash/threads.lisp")
   :BYTES 6701 :SHA256
   "3fc587a57d26a294aebfc6a7aeadf2f61a42a21106c1c57517f891b76b4e750a")
  (:PATH "raw/mutations/3/tests/index/hash-digests.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/index/hash-digests.lisp")
   :BYTES 35926 :SHA256
   "3b3b39f861883cf2017cab8e6488560a6bb3897d63784f00e820a6450d743225")
  (:PATH "raw/mutations/3/tests/index/primary-support.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/index/primary-support.lisp")
   :BYTES 13938 :SHA256
   "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a")
  (:PATH "raw/mutations/3/tests/index/primary-threads.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/index/primary-threads.lisp")
   :BYTES 13744 :SHA256
   "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2")
  (:PATH "raw/mutations/3/tests/index/primary.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/index/primary.lisp")
   :BYTES 30166 :SHA256
   "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696")
  (:PATH "raw/mutations/3/tests/index/rebuild.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/index/rebuild.lisp")
   :BYTES 32112 :SHA256
   "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1")
  (:PATH "raw/mutations/3/tests/index/slot-support.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/index/slot-support.lisp")
   :BYTES 12800 :SHA256
   "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31")
  (:PATH "raw/mutations/3/tests/index/slot-threads.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/index/slot-threads.lisp")
   :BYTES 11698 :SHA256
   "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f")
  (:PATH "raw/mutations/3/tests/index/slots.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/index/slots.lisp")
   :BYTES 26420 :SHA256
   "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb")
  (:PATH "raw/mutations/3/tests/io/native.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/io/native.lisp")
   :BYTES 6207 :SHA256
   "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0")
  (:PATH "raw/mutations/3/tests/io/support.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/io/support.lisp")
   :BYTES 2951 :SHA256
   "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50")
  (:PATH "raw/mutations/3/tests/io/transfer.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/io/transfer.lisp")
   :BYTES 11847 :SHA256
   "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd")
  (:PATH "raw/mutations/3/tests/lint-fixtures/bad.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/lint-fixtures/bad.lisp")
   :BYTES 1587 :SHA256
   "ac8912ce6cc1101f2ebc305a50c0565879547b527d7ca0aeac900ee06bf26652")
  (:PATH "raw/mutations/3/tests/lint-fixtures/good.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/lint-fixtures/good.lisp")
   :BYTES 671 :SHA256
   "05ce84f8fd12d9af48252601bcc92d6d60335b53f39b01a9fe2697c4bdaa8cee")
  (:PATH "raw/mutations/3/tests/lint-fixtures/keyword-barrier.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/lint-fixtures/keyword-barrier.lisp")
   :BYTES 199 :SHA256
   "e26dab117e9526ace35bb45b92f977065d33fcc4404c40fd4fc3c77749689a96")
  (:PATH "raw/mutations/3/tests/lint-fixtures/qualified-reader.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/lint-fixtures/qualified-reader.lisp")
   :BYTES 152 :SHA256
   "835229bdc1a0ed0c08511cd6121e1f1bc4284da2cfba951b72cd1a74a6040d35")
  (:PATH "raw/mutations/3/tests/mvcc/capture.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/mvcc/capture.lisp")
   :BYTES 16356 :SHA256
   "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35")
  (:PATH "raw/mutations/3/tests/mvcc/lifecycle.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/mvcc/lifecycle.lisp")
   :BYTES 23964 :SHA256
   "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16")
  (:PATH "raw/mutations/3/tests/mvcc/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/mvcc/support.lisp")
   :BYTES 5931 :SHA256
   "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290")
  (:PATH "raw/mutations/3/tests/read/lifecycle.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/read/lifecycle.lisp")
   :BYTES 17804 :SHA256
   "c4c4642408816f2e0e809e21d04739b68b9391237e3e46ea0b195ed82857c3a8")
  (:PATH "raw/mutations/3/tests/read/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/read/support.lisp")
   :BYTES 4845 :SHA256
   "8095cc39d49342f6e43f3421b4fced839da02d8d11b4d8ddcd91bd346447e754")
  (:PATH "raw/mutations/3/tests/read/threads.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/read/threads.lisp")
   :BYTES 4150 :SHA256
   "e2e223b69b08a5d76b9773c6ad4dee13ef2ddbb6f5ababa713cc5654bc7b51c5")
  (:PATH "raw/mutations/3/tests/recovery/corruption.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/recovery/corruption.lisp")
   :BYTES 7106 :SHA256
   "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c")
  (:PATH "raw/mutations/3/tests/recovery/decisions-audit.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/recovery/decisions-audit.lisp")
   :BYTES 14971 :SHA256
   "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0")
  (:PATH "raw/mutations/3/tests/recovery/decisions-radix.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/recovery/decisions-radix.lisp")
   :BYTES 27851 :SHA256
   "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0")
  (:PATH "raw/mutations/3/tests/recovery/decisions-support.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/recovery/decisions-support.lisp")
   :BYTES 6797 :SHA256
   "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4")
  (:PATH "raw/mutations/3/tests/recovery/decisions.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/recovery/decisions.lisp")
   :BYTES 19149 :SHA256
   "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e")
  (:PATH "raw/mutations/3/tests/recovery/inventory-support.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/recovery/inventory-support.lisp")
   :BYTES 8083 :SHA256
   "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27")
  (:PATH "raw/mutations/3/tests/recovery/inventory.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/recovery/inventory.lisp")
   :BYTES 14479 :SHA256
   "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9")
  (:PATH "raw/mutations/3/tests/recovery/manifest-audit.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/recovery/manifest-audit.lisp")
   :BYTES 17670 :SHA256
   "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6")
  (:PATH "raw/mutations/3/tests/recovery/manifest-support.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/recovery/manifest-support.lisp")
   :BYTES 9769 :SHA256
   "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830")
  (:PATH "raw/mutations/3/tests/recovery/manifest.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/recovery/manifest.lisp")
   :BYTES 13799 :SHA256
   "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd")
  (:PATH "raw/mutations/3/tests/recovery/scan.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/recovery/scan.lisp")
   :BYTES 16966 :SHA256
   "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b")
  (:PATH "raw/mutations/3/tests/recovery/support.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/recovery/support.lisp")
   :BYTES 5957 :SHA256
   "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204")
  (:PATH "raw/mutations/3/tests/series/boundaries.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/series/boundaries.lisp")
   :BYTES 5802 :SHA256
   "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8")
  (:PATH "raw/mutations/3/tests/series/controller.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/series/controller.lisp")
   :BYTES 60484 :SHA256
   "4bea80eb231575f48b208ddb57af6a11706481e0ec755b084f6cd4b6fd0481a1")
  (:PATH "raw/mutations/3/tests/series/support.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/series/support.lisp")
   :BYTES 16885 :SHA256
   "8821ae9e002941eff8ea3ae7dbfc727cb6874b68d2d1ef85af668eb2d34a0c0c")
  (:PATH "raw/mutations/3/tests/series/threads.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/series/threads.lisp")
   :BYTES 19694 :SHA256
   "bbea64d207d14698b39ab0f8ded03db11bab09955d3f66705c23d69c09aefc8e")
  (:PATH "raw/mutations/3/tests/series/worker-bridge.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/series/worker-bridge.lisp")
   :BYTES 56677 :SHA256
   "c1ee49702e63978a83cb86c4e5bf437a5a40e48fa02b65d3eaf3dca0d2e39176")
  (:PATH "raw/mutations/3/tests/smoke.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/smoke.lisp")
   :BYTES 735 :SHA256
   "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8")
  (:PATH "raw/mutations/3/tests/storage/compaction-scan.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/storage/compaction-scan.lisp")
   :BYTES 16196 :SHA256
   "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5")
  (:PATH "raw/mutations/3/tests/storage/control-payload.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/storage/control-payload.lisp")
   :BYTES 12651 :SHA256
   "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae")
  (:PATH "raw/mutations/3/tests/storage/log-header.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/storage/log-header.lisp")
   :BYTES 11969 :SHA256
   "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e")
  (:PATH "raw/mutations/3/tests/storage/segment-header.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/storage/segment-header.lisp")
   :BYTES 4149 :SHA256
   "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df")
  (:PATH "raw/mutations/3/tests/storage/support.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/storage/support.lisp")
   :BYTES 4029 :SHA256
   "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625")
  (:PATH "raw/mutations/3/tests/wal/builder.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/wal/builder.lisp")
   :BYTES 4000 :SHA256
   "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6")
  (:PATH "raw/mutations/3/tests/wal/csn-threads.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/wal/csn-threads.lisp")
   :BYTES 12114 :SHA256
   "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c")
  (:PATH "raw/mutations/3/tests/wal/csn.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/wal/csn.lisp")
   :BYTES 34661 :SHA256
   "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a")
  (:PATH "raw/mutations/3/tests/wal/fault.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/wal/fault.lisp")
   :BYTES 7614 :SHA256
   "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875")
  (:PATH "raw/mutations/3/tests/wal/group.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/wal/group.lisp")
   :BYTES 5524 :SHA256
   "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e")
  (:PATH "raw/mutations/3/tests/wal/native.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/wal/native.lisp")
   :BYTES 2567 :SHA256
   "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7")
  (:PATH "raw/mutations/3/tests/wal/support.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tests/wal/support.lisp")
   :BYTES 1951 :SHA256
   "90a47539e5e2898c0a08059207f30bb5551e7ca8fc166f8f6ce7b95afa757295")
  (:PATH "raw/mutations/3/tools/build.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/3/tools/cbor-simple-write-isolated-build.lisp" :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/3/tools/cbor-simple-write-isolated-build.lisp")
   :BYTES 478 :SHA256
   "a2c3ae91cb94a88e3b849b93c522eb5d6932c6868d1ee8d5771a1abee4e500a1")
  (:PATH "raw/mutations/4/src/cache/build.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/cache/build.lisp")
   :BYTES 4966 :SHA256
   "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0")
  (:PATH "raw/mutations/4/src/cache/clock.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/cache/clock.lisp")
   :BYTES 2952 :SHA256
   "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f")
  (:PATH "raw/mutations/4/src/cache/core.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/cache/core.lisp")
   :BYTES 3503 :SHA256
   "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4")
  (:PATH "raw/mutations/4/src/cache/package.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/cache/package.lisp")
   :BYTES 758 :SHA256
   "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848")
  (:PATH "raw/mutations/4/src/cache/read.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/cache/read.lisp")
   :BYTES 6485 :SHA256
   "5700e43ae8ee859e96bdecb5953af43a712fd9e6ec23a53565759676bb07f85a")
  (:PATH "raw/mutations/4/src/cache/types.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/cache/types.lisp")
   :BYTES 2448 :SHA256
   "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30")
  (:PATH "raw/mutations/4/src/cache/write.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/cache/write.lisp")
   :BYTES 5481 :SHA256
   "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8")
  (:PATH "raw/mutations/4/src/codec/cbor-float-minimal.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH "raw/mutations/4/src/codec/cbor-header.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH "raw/mutations/4/src/codec/cbor-minimal.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH "raw/mutations/4/src/codec/cbor-package.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/codec/cbor-package.lisp")
   :BYTES 620 :SHA256
   "53fa9acbed8f5602b204252ff394c01fd01effdbe41baf021a713e2636cbd668")
  (:PATH "raw/mutations/4/src/codec/cbor-scan-input.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH "raw/mutations/4/src/codec/cbor-scan-items.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH "raw/mutations/4/src/codec/cbor-scan-minimal.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH "raw/mutations/4/src/codec/cbor-scan-stack.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH "raw/mutations/4/src/codec/cbor-scan.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH "raw/mutations/4/src/codec/cbor-simple-write.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/codec/cbor-simple-write.lisp")
   :BYTES 2918 :SHA256
   "fd029f4f7755b4a44b42903b458b98f303c47d7d3e19c9b8e7dc200ce8e8a0cc")
  (:PATH "raw/mutations/4/src/codec/cbor-space.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH "raw/mutations/4/src/codec/cbor-string-write.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727")
  (:PATH "raw/mutations/4/src/codec/cbor-write.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/mutations/4/src/codec/package.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH "raw/mutations/4/src/codec/utf8.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH "raw/mutations/4/src/csn/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/csn/package.lisp")
   :BYTES 441 :SHA256
   "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0")
  (:PATH "raw/mutations/4/src/csn/registry.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/csn/registry.lisp")
   :BYTES 12139 :SHA256
   "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a")
  (:PATH "raw/mutations/4/src/epochs/core.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/epochs/core.lisp")
   :BYTES 5909 :SHA256
   "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399")
  (:PATH "raw/mutations/4/src/epochs/package.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/epochs/package.lisp")
   :BYTES 779 :SHA256
   "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd")
  (:PATH "raw/mutations/4/src/epochs/read.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/epochs/read.lisp")
   :BYTES 3240 :SHA256
   "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905")
  (:PATH "raw/mutations/4/src/epochs/reclaim.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/epochs/reclaim.lisp")
   :BYTES 6373 :SHA256
   "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202")
  (:PATH "raw/mutations/4/src/epochs/retire.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/epochs/retire.lisp")
   :BYTES 5858 :SHA256
   "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b")
  (:PATH "raw/mutations/4/src/epochs/types.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/epochs/types.lisp")
   :BYTES 5304 :SHA256
   "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097")
  (:PATH "raw/mutations/4/src/execution/handoff.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/execution/handoff.lisp")
   :BYTES 7394 :SHA256
   "ee90c809ef51134efa21e08b819e5530304efaf9f9e26b63c7e4afbf6d48e607")
  (:PATH "raw/mutations/4/src/execution/package.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/execution/package.lisp")
   :BYTES 1157 :SHA256
   "bbe8cdb6f7e74d7139f5e472a915cc74b43e34bd27ecac1c5fd364f723a2a643")
  (:PATH "raw/mutations/4/src/execution/queue.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/execution/queue.lisp")
   :BYTES 5374 :SHA256
   "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90")
  (:PATH "raw/mutations/4/src/execution/ready-recycle.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/execution/ready-recycle.lisp")
   :BYTES 3387 :SHA256
   "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b")
  (:PATH "raw/mutations/4/src/execution/ready-types.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/execution/ready-types.lisp")
   :BYTES 5248 :SHA256
   "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f")
  (:PATH "raw/mutations/4/src/execution/ready.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/execution/ready.lisp")
   :BYTES 6635 :SHA256
   "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327")
  (:PATH "raw/mutations/4/src/execution/worker-boundary.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/execution/worker-boundary.lisp")
   :BYTES 2309 :SHA256
   "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a")
  (:PATH "raw/mutations/4/src/execution/worker-claim.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/execution/worker-claim.lisp")
   :BYTES 6401 :SHA256
   "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e")
  (:PATH "raw/mutations/4/src/execution/worker-run.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/execution/worker-run.lisp")
   :BYTES 5124 :SHA256
   "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542")
  (:PATH "raw/mutations/4/src/execution/worker-types.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/execution/worker-types.lisp")
   :BYTES 8461 :SHA256
   "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317")
  (:PATH "raw/mutations/4/src/execution/writer.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/execution/writer.lisp")
   :BYTES 6484 :SHA256
   "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105")
  (:PATH "raw/mutations/4/src/foundation/batch.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH "raw/mutations/4/src/foundation/binary.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH "raw/mutations/4/src/foundation/conditions.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH "raw/mutations/4/src/foundation/crc32c.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH "raw/mutations/4/src/foundation/package.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH "raw/mutations/4/src/foundation/record.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH "raw/mutations/4/src/get-resolver/build.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/get-resolver/build.lisp")
   :BYTES 6882 :SHA256
   "3715cb750e08ab30fcaa068a05b17772381a3cf1975bdbdd0c03f71761089ef6")
  (:PATH "raw/mutations/4/src/get-resolver/package.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/get-resolver/package.lisp")
   :BYTES 1887 :SHA256
   "f244c1346604ccde93880824ea990a4a7329340df6c8b665963713977ca0ee10")
  (:PATH "raw/mutations/4/src/get-resolver/read.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/get-resolver/read.lisp")
   :BYTES 7259 :SHA256
   "68f82df01f7894f66db0c6545267616e76c0ba93fd7c49db6434cec666f02dc3")
  (:PATH "raw/mutations/4/src/get-resolver/rows.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/get-resolver/rows.lisp")
   :BYTES 3350 :SHA256
   "d9db85d788006fc7ad1f9a7cdeef28b992605de7fac8c295dd7fdc51f5511854")
  (:PATH "raw/mutations/4/src/get-resolver/scan.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/get-resolver/scan.lisp")
   :BYTES 6786 :SHA256
   "35a1780c6bf66364ef94c4151fa91f02eebe359f0ca0639985d2a907fd9d512d")
  (:PATH "raw/mutations/4/src/get-resolver/sort.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/get-resolver/sort.lisp")
   :BYTES 7118 :SHA256
   "974bf44efeb1cd26c5e9db0601aea295c8f1a18234894ad9d41938a2880e2255")
  (:PATH "raw/mutations/4/src/get-resolver/types.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/get-resolver/types.lisp")
   :BYTES 1757 :SHA256
   "1334512380bfb01add33b0ca152c0ce4746b3f79bcd04f84d7844ef234d6eaba")
  (:PATH "raw/mutations/4/src/get/build.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/get/build.lisp")
   :BYTES 3745 :SHA256
   "bcfc4916e9a85833dc151c4ce176bc905f2c03b6bc6d636f97a60df0d8c16739")
  (:PATH "raw/mutations/4/src/get/lifecycle.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/get/lifecycle.lisp")
   :BYTES 5345 :SHA256
   "885ba4141114ea411cac37c9b5f924aaa7f9f2a5ba311ebf92a392e5da1e3c59")
  (:PATH "raw/mutations/4/src/get/lookup.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/get/lookup.lisp")
   :BYTES 4352 :SHA256
   "9d1042d4cf1e7bd9c6d1153de12b2459e7a2724e47bd32534cd7ae56cb274c5f")
  (:PATH "raw/mutations/4/src/get/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/get/package.lisp")
   :BYTES 1995 :SHA256
   "87b795779aef0c4b918a039d182daddd22b902a9ad10c763df4364b7e630151c")
  (:PATH "raw/mutations/4/src/get/segment.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/get/segment.lisp")
   :BYTES 8097 :SHA256
   "4a486528cb2c1cc3471cb4b332d4314d24011889e1f885db6fd5600bb077eea3")
  (:PATH "raw/mutations/4/src/get/target.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/get/target.lisp")
   :BYTES 5652 :SHA256
   "9f682f735e49108cad176a6143ec99e1be64da98f29cae0b52f9b49cdea34250")
  (:PATH "raw/mutations/4/src/get/types.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/get/types.lisp")
   :BYTES 4413 :SHA256
   "653b23a6e719cd1f55e7c58b4d7e8143aec5983992ba210d0eac1f4c8682f623")
  (:PATH "raw/mutations/4/src/hash/arithmetic.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/hash/arithmetic.lisp")
   :BYTES 3073 :SHA256
   "c439e534b768acb123d69b921b85e1e56683aa8335bbc87efba95fe95f256fa9")
  (:PATH "raw/mutations/4/src/hash/blocks.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/hash/blocks.lisp")
   :BYTES 3262 :SHA256
   "5f5dff95ae6c34dfc15538c537ba2fa8d34ba2376ad66ad9975745ea13a2175f")
  (:PATH "raw/mutations/4/src/hash/hash64.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/hash/hash64.lisp")
   :BYTES 1768 :SHA256
   "99e4c8394a8f877ce1f552f15a57a082c0ec81015e87119ee4ffea28cf3ae77f")
  (:PATH "raw/mutations/4/src/hash/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/hash/package.lisp")
   :BYTES 477 :SHA256
   "1e7668fa26fc1a8e3b3cfe824aa3e08b30b57441d5f90d44453fc3a9259a10d0")
  (:PATH "raw/mutations/4/src/index/core.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/index/core.lisp")
   :BYTES 2959 :SHA256
   "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff")
  (:PATH "raw/mutations/4/src/index/hash-digests.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/index/hash-digests.lisp")
   :BYTES 3674 :SHA256
   "924bb7dab91ff56c1e909f2b06dff5f74b443ac6442e379498f29b25f1fa2673")
  (:PATH "raw/mutations/4/src/index/hash-seed.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/index/hash-seed.lisp")
   :BYTES 2437 :SHA256
   "ae86514101e95737747ba58a4f0c5dc1ddb44d2b3a18bceb8fd0d0756b57a7a1")
  (:PATH "raw/mutations/4/src/index/package.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/index/package.lisp")
   :BYTES 727 :SHA256
   "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507")
  (:PATH "raw/mutations/4/src/index/primary-arena.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/index/primary-arena.lisp")
   :BYTES 3485 :SHA256
   "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5")
  (:PATH "raw/mutations/4/src/index/primary-build.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/index/primary-build.lisp")
   :BYTES 5379 :SHA256
   "06ca5ac8c03504e2d2f973873e5cabf7518c090cd1f8f2118c46e0ea2f9bf37b")
  (:PATH "raw/mutations/4/src/index/primary-core.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/index/primary-core.lisp")
   :BYTES 4211 :SHA256
   "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e")
  (:PATH "raw/mutations/4/src/index/primary-directory.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/index/primary-directory.lisp")
   :BYTES 8114 :SHA256
   "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd")
  (:PATH "raw/mutations/4/src/index/primary-package.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/index/primary-package.lisp")
   :BYTES 1451 :SHA256
   "0682eb9a61596506b6788bd0285f9808db2496246caae64ab3203182ed46b860")
  (:PATH "raw/mutations/4/src/index/primary-probe.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/index/primary-probe.lisp")
   :BYTES 5936 :SHA256
   "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4")
  (:PATH "raw/mutations/4/src/index/primary-read.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/index/primary-read.lisp")
   :BYTES 3575 :SHA256
   "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f")
  (:PATH "raw/mutations/4/src/index/primary-relocate.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/index/primary-relocate.lisp")
   :BYTES 4073 :SHA256
   "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20")
  (:PATH "raw/mutations/4/src/index/primary-types.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/index/primary-types.lisp")
   :BYTES 3949 :SHA256
   "f17ca0dcd8a538b921f00044e23872b28272638c4435eacd30f0509422505e64")
  (:PATH "raw/mutations/4/src/index/primary-write.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/index/primary-write.lisp")
   :BYTES 7061 :SHA256
   "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655")
  (:PATH "raw/mutations/4/src/index/read.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/index/read.lisp")
   :BYTES 3030 :SHA256
   "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7")
  (:PATH "raw/mutations/4/src/index/rebuild-budget.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/index/rebuild-budget.lisp")
   :BYTES 3593 :SHA256
   "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0")
  (:PATH "raw/mutations/4/src/index/rebuild-copy.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/index/rebuild-copy.lisp")
   :BYTES 4027 :SHA256
   "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee")
  (:PATH "raw/mutations/4/src/index/rebuild-scan.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/index/rebuild-scan.lisp")
   :BYTES 5002 :SHA256
   "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e")
  (:PATH "raw/mutations/4/src/index/rebuild.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/index/rebuild.lisp")
   :BYTES 2872 :SHA256
   "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1")
  (:PATH "raw/mutations/4/src/index/relocate.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/index/relocate.lisp")
   :BYTES 2383 :SHA256
   "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc")
  (:PATH "raw/mutations/4/src/index/types.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/index/types.lisp")
   :BYTES 2434 :SHA256
   "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e")
  (:PATH "raw/mutations/4/src/index/validation.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/index/validation.lisp")
   :BYTES 3930 :SHA256
   "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a")
  (:PATH "raw/mutations/4/src/index/write.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/index/write.lisp")
   :BYTES 4784 :SHA256
   "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28")
  (:PATH "raw/mutations/4/src/io/flush.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/io/flush.lisp")
   :BYTES 1569 :SHA256
   "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325")
  (:PATH "raw/mutations/4/src/io/lifecycle.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/io/lifecycle.lisp")
   :BYTES 4536 :SHA256
   "baa1f763fe0f394a14d381b753dcb1be1e90eb03eaff5d6469465b5d4eca015f")
  (:PATH "raw/mutations/4/src/io/native.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/io/native.lisp")
   :BYTES 5026 :SHA256
   "b8cf3ce1ff7b4fa9def8a602ab768c0e9a321f8d6cdce6e5b2b7ded2fe3d97dd")
  (:PATH "raw/mutations/4/src/io/package.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/io/package.lisp")
   :BYTES 592 :SHA256
   "118eba04ab2aa87a2d86e0b0269dbeacaa485457acebbc12c57317ae465a89c0")
  (:PATH "raw/mutations/4/src/io/transfer.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/io/transfer.lisp")
   :BYTES 5051 :SHA256
   "3748328cf85e1c007900a63bdd0f159f38a8d7cd3577c92c56fc68692b9b7bcf")
  (:PATH "raw/mutations/4/src/io/types.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/io/types.lisp")
   :BYTES 4143 :SHA256
   "50c7eeea91af232fca7103ce5a25535958d73836f01cb45a20c7120b88b1336b")
  (:PATH "raw/mutations/4/src/mvcc/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/mvcc/package.lisp")
   :BYTES 833 :SHA256
   "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c")
  (:PATH "raw/mutations/4/src/mvcc/snapshots-core.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/mvcc/snapshots-core.lisp")
   :BYTES 7622 :SHA256
   "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998")
  (:PATH "raw/mutations/4/src/mvcc/snapshots-csn.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/mvcc/snapshots-csn.lisp")
   :BYTES 2725 :SHA256
   "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77")
  (:PATH "raw/mutations/4/src/mvcc/snapshots-lifecycle.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/mvcc/snapshots-lifecycle.lisp")
   :BYTES 6609 :SHA256
   "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082")
  (:PATH "raw/mutations/4/src/mvcc/snapshots-read.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/mvcc/snapshots-read.lisp")
   :BYTES 6651 :SHA256
   "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9")
  (:PATH "raw/mutations/4/src/mvcc/snapshots-register.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/mvcc/snapshots-register.lisp")
   :BYTES 6654 :SHA256
   "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b")
  (:PATH "raw/mutations/4/src/mvcc/snapshots-types.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/mvcc/snapshots-types.lisp")
   :BYTES 3817 :SHA256
   "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f")
  (:PATH "raw/mutations/4/src/mvcc/types.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/mvcc/types.lisp")
   :BYTES 471 :SHA256
   "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50")
  (:PATH "raw/mutations/4/src/package.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH "raw/mutations/4/src/read/core.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/read/core.lisp")
   :BYTES 3846 :SHA256
   "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f")
  (:PATH "raw/mutations/4/src/read/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/read/package.lisp")
   :BYTES 831 :SHA256
   "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df")
  (:PATH "raw/mutations/4/src/read/task.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/read/task.lisp")
   :BYTES 5073 :SHA256
   "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2")
  (:PATH "raw/mutations/4/src/read/types.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/read/types.lisp")
   :BYTES 2358 :SHA256
   "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c")
  (:PATH "raw/mutations/4/src/recovery/decisions-build.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/recovery/decisions-build.lisp")
   :BYTES 11857 :SHA256
   "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115")
  (:PATH "raw/mutations/4/src/recovery/decisions-package.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/recovery/decisions-package.lisp")
   :BYTES 818 :SHA256
   "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39")
  (:PATH "raw/mutations/4/src/recovery/decisions-query.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/recovery/decisions-query.lisp")
   :BYTES 4525 :SHA256
   "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24")
  (:PATH "raw/mutations/4/src/recovery/decisions-radix.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/recovery/decisions-radix.lisp")
   :BYTES 11061 :SHA256
   "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54")
  (:PATH "raw/mutations/4/src/recovery/decisions-sort.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/recovery/decisions-sort.lisp")
   :BYTES 7654 :SHA256
   "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2")
  (:PATH "raw/mutations/4/src/recovery/decisions-types.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/recovery/decisions-types.lisp")
   :BYTES 2056 :SHA256
   "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c")
  (:PATH "raw/mutations/4/src/recovery/inventory-build.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/recovery/inventory-build.lisp")
   :BYTES 9592 :SHA256
   "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e")
  (:PATH "raw/mutations/4/src/recovery/inventory-query.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/recovery/inventory-query.lisp")
   :BYTES 2100 :SHA256
   "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb")
  (:PATH "raw/mutations/4/src/recovery/inventory-types.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/recovery/inventory-types.lisp")
   :BYTES 2392 :SHA256
   "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9")
  (:PATH "raw/mutations/4/src/recovery/manifest-build.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/recovery/manifest-build.lisp")
   :BYTES 10251 :SHA256
   "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471")
  (:PATH "raw/mutations/4/src/recovery/manifest-decode.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/recovery/manifest-decode.lisp")
   :BYTES 6160 :SHA256
   "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779")
  (:PATH "raw/mutations/4/src/recovery/manifest-fold.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/recovery/manifest-fold.lisp")
   :BYTES 7068 :SHA256
   "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730")
  (:PATH "raw/mutations/4/src/recovery/manifest-package.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/recovery/manifest-package.lisp")
   :BYTES 1372 :SHA256
   "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc")
  (:PATH "raw/mutations/4/src/recovery/manifest-query.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/recovery/manifest-query.lisp")
   :BYTES 3582 :SHA256
   "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b")
  (:PATH "raw/mutations/4/src/recovery/manifest-types.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/recovery/manifest-types.lisp")
   :BYTES 3345 :SHA256
   "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10")
  (:PATH "raw/mutations/4/src/recovery/package.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/recovery/package.lisp")
   :BYTES 927 :SHA256
   "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9")
  (:PATH "raw/mutations/4/src/recovery/scan.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/recovery/scan.lisp")
   :BYTES 12829 :SHA256
   "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218")
  (:PATH "raw/mutations/4/src/series/events.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/series/events.lisp")
   :BYTES 9566 :SHA256
   "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7")
  (:PATH "raw/mutations/4/src/series/io-events.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/series/io-events.lisp")
   :BYTES 5385 :SHA256
   "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546")
  (:PATH "raw/mutations/4/src/series/ownership.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/series/ownership.lisp")
   :BYTES 8810 :SHA256
   "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4")
  (:PATH "raw/mutations/4/src/series/package.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/series/package.lisp")
   :BYTES 1392 :SHA256
   "7433162105df63d324141167e6dcf6bfee74611aa1cf7291cc6c92f41f3c7408")
  (:PATH "raw/mutations/4/src/series/publication.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/series/publication.lisp")
   :BYTES 6094 :SHA256
   "288cb3fa41fad76a0e6919dfa0b2fce2beef15f5880129393bee35bc8795c762")
  (:PATH "raw/mutations/4/src/series/query.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/series/query.lisp")
   :BYTES 3600 :SHA256
   "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9")
  (:PATH "raw/mutations/4/src/series/retirement.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/series/retirement.lisp")
   :BYTES 4634 :SHA256
   "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059")
  (:PATH "raw/mutations/4/src/series/types.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/series/types.lisp")
   :BYTES 3316 :SHA256
   "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9")
  (:PATH "raw/mutations/4/src/series/worker-boundary.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/series/worker-boundary.lisp")
   :BYTES 3443 :SHA256
   "793d401d1b9acc7b67923d815560f277f3d390ca050740f735f07d88dbacfe73")
  (:PATH "raw/mutations/4/src/series/worker-package.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/series/worker-package.lisp")
   :BYTES 1036 :SHA256
   "881a2958ddb8f5781954d4c59d7467e34c03c01fbb2fea43dc06e9e2050a1f37")
  (:PATH "raw/mutations/4/src/series/worker-run.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/series/worker-run.lisp")
   :BYTES 6985 :SHA256
   "f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f")
  (:PATH "raw/mutations/4/src/series/worker-types.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/series/worker-types.lisp")
   :BYTES 6493 :SHA256
   "a366799fd9b938bfaa48b0ffda228ff8369ab9acb5b5ead7f081dfc66ab2c81a")
  (:PATH "raw/mutations/4/src/storage/compaction-scan.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/storage/compaction-scan.lisp")
   :BYTES 5510 :SHA256
   "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d")
  (:PATH "raw/mutations/4/src/storage/control-payload.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/storage/control-payload.lisp")
   :BYTES 6273 :SHA256
   "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491")
  (:PATH "raw/mutations/4/src/storage/formats.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/storage/formats.lisp")
   :BYTES 3841 :SHA256
   "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f")
  (:PATH "raw/mutations/4/src/storage/log-header.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/storage/log-header.lisp")
   :BYTES 3947 :SHA256
   "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81")
  (:PATH "raw/mutations/4/src/storage/package.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/storage/package.lisp")
   :BYTES 1079 :SHA256
   "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e")
  (:PATH "raw/mutations/4/src/storage/payload-record.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/storage/payload-record.lisp")
   :BYTES 3641 :SHA256
   "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7")
  (:PATH "raw/mutations/4/src/storage/payload-write.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/storage/payload-write.lisp")
   :BYTES 5239 :SHA256
   "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc")
  (:PATH "raw/mutations/4/src/storage/segment-header.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/storage/segment-header.lisp")
   :BYTES 5517 :SHA256
   "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011")
  (:PATH "raw/mutations/4/src/wal/builder.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/wal/builder.lisp")
   :BYTES 8445 :SHA256
   "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0")
  (:PATH "raw/mutations/4/src/wal/csn.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/wal/csn.lisp")
   :BYTES 9577 :SHA256
   "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810")
  (:PATH "raw/mutations/4/src/wal/executor.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/wal/executor.lisp")
   :BYTES 6023 :SHA256
   "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8")
  (:PATH "raw/mutations/4/src/wal/group.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/wal/group.lisp")
   :BYTES 6305 :SHA256
   "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b")
  (:PATH "raw/mutations/4/src/wal/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/wal/package.lisp")
   :BYTES 1774 :SHA256
   "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89")
  (:PATH "raw/mutations/4/src/wal/types.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/src/wal/types.lisp")
   :BYTES 5420 :SHA256
   "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e")
  (:PATH "raw/mutations/4/test.log" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/test.log")
   :BYTES 25534 :SHA256
   "ad65161fb400dec9d8df06795591e7e1746a37b8aa98edfc28f69007dd3cca00")
  (:PATH "raw/mutations/4/tests/codec/cbor-header.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/codec/cbor-header.lisp")
   :BYTES 10773 :SHA256
   "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815")
  (:PATH "raw/mutations/4/tests/codec/cbor-minimal-edges.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/codec/cbor-minimal-edges.lisp")
   :BYTES 1613 :SHA256
   "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70")
  (:PATH "raw/mutations/4/tests/codec/cbor-minimal-scan-support.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/codec/cbor-minimal-scan-support.lisp")
   :BYTES 8363 :SHA256
   "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421")
  (:PATH "raw/mutations/4/tests/codec/cbor-minimal-scan-threads.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/codec/cbor-minimal-scan-threads.lisp")
   :BYTES 4547 :SHA256
   "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660")
  (:PATH "raw/mutations/4/tests/codec/cbor-minimal-scan.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/codec/cbor-minimal-scan.lisp")
   :BYTES 19217 :SHA256
   "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8")
  (:PATH "raw/mutations/4/tests/codec/cbor-minimal-support.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/codec/cbor-minimal-support.lisp")
   :BYTES 8620 :SHA256
   "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a")
  (:PATH "raw/mutations/4/tests/codec/cbor-minimal-threads.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/codec/cbor-minimal-threads.lisp")
   :BYTES 3799 :SHA256
   "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2")
  (:PATH "raw/mutations/4/tests/codec/cbor-minimal.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/codec/cbor-minimal.lisp")
   :BYTES 12604 :SHA256
   "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3")
  (:PATH "raw/mutations/4/tests/codec/cbor-simple-write-support.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/codec/cbor-simple-write-support.lisp")
   :BYTES 4955 :SHA256
   "53ceafc72a027a2ff1f787900558ff26f2ff70bbb212f1b37926a6d520fbe86e")
  (:PATH "raw/mutations/4/tests/codec/cbor-simple-write-threads.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/codec/cbor-simple-write-threads.lisp")
   :BYTES 3561 :SHA256
   "77074033e75a224fd02e890f98dffa8e97d3a1f8bedd510b00ea55d8ff8687b2")
  (:PATH "raw/mutations/4/tests/codec/cbor-simple-write.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/codec/cbor-simple-write.lisp")
   :BYTES 10712 :SHA256
   "958bdd3901cfc41032c09d6c9023b192799981884e09ce3573256ff45bc5329a")
  (:PATH "raw/mutations/4/tests/codec/cbor-string-write-support.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/codec/cbor-string-write-support.lisp")
   :BYTES 6868 :SHA256
   "2cbdb601f442a56456bc637c94e759cc965f44b178268dce3c636c385d34fc39")
  (:PATH "raw/mutations/4/tests/codec/cbor-string-write-threads.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/codec/cbor-string-write-threads.lisp")
   :BYTES 3512 :SHA256
   "8e07b881a55e2554a429f1c8b2c69f67862ac015217d90d019167d636564d27d")
  (:PATH "raw/mutations/4/tests/codec/cbor-string-write.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/codec/cbor-string-write.lisp")
   :BYTES 15883 :SHA256
   "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115")
  (:PATH "raw/mutations/4/tests/codec/cbor-structure-support.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:PATH "raw/mutations/4/tests/codec/cbor-structure-threads.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/codec/cbor-structure-threads.lisp")
   :BYTES 4305 :SHA256
   "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645")
  (:PATH "raw/mutations/4/tests/codec/cbor-structure.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/codec/cbor-structure.lisp")
   :BYTES 22968 :SHA256
   "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110")
  (:PATH "raw/mutations/4/tests/codec/cbor-support.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:PATH "raw/mutations/4/tests/codec/cbor-threads.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/codec/cbor-threads.lisp")
   :BYTES 3683 :SHA256
   "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14")
  (:PATH "raw/mutations/4/tests/codec/cbor-write-roundtrip.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/codec/cbor-write-roundtrip.lisp")
   :BYTES 901 :SHA256
   "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344")
  (:PATH "raw/mutations/4/tests/codec/cbor-write-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/codec/cbor-write-support.lisp")
   :BYTES 4768 :SHA256
   "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6")
  (:PATH "raw/mutations/4/tests/codec/cbor-write-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/codec/cbor-write-threads.lisp")
   :BYTES 3813 :SHA256
   "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb")
  (:PATH "raw/mutations/4/tests/codec/cbor-write.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/codec/cbor-write.lisp")
   :BYTES 9822 :SHA256
   "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3")
  (:PATH "raw/mutations/4/tests/codec/support.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/codec/support.lisp")
   :BYTES 5807 :SHA256
   "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96")
  (:PATH "raw/mutations/4/tests/codec/threads.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/codec/threads.lisp")
   :BYTES 3111 :SHA256
   "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337")
  (:PATH "raw/mutations/4/tests/codec/utf8.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/codec/utf8.lisp")
   :BYTES 12892 :SHA256
   "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100")
  (:PATH "raw/mutations/4/tests/csn/registry.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/csn/registry.lisp")
   :BYTES 19411 :SHA256
   "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950")
  (:PATH "raw/mutations/4/tests/csn/support.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/csn/support.lisp")
   :BYTES 11407 :SHA256
   "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db")
  (:PATH "raw/mutations/4/tests/csn/threads.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/csn/threads.lisp")
   :BYTES 10525 :SHA256
   "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2")
  (:PATH "raw/mutations/4/tests/epochs/lifecycle.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/epochs/lifecycle.lisp")
   :BYTES 25394 :SHA256
   "ddc2fbdad9f97d2e4ff008c167776a50b17b742398306fbd5198dca474559cbf")
  (:PATH "raw/mutations/4/tests/epochs/support.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/epochs/support.lisp")
   :BYTES 5943 :SHA256
   "366be7af4bf6c4ed946b3fa9e97aea6b034c83e3b757d81c54078dc76d229b6d")
  (:PATH "raw/mutations/4/tests/epochs/threads.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/epochs/threads.lisp")
   :BYTES 3654 :SHA256
   "54b73e06c61e64f32a3e3af0791891dacb6590e929163dcf0fac95f2c71e66fd")
  (:PATH "raw/mutations/4/tests/execution/handoff.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/execution/handoff.lisp")
   :BYTES 33278 :SHA256
   "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e")
  (:PATH "raw/mutations/4/tests/execution/queue.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/execution/queue.lisp")
   :BYTES 12894 :SHA256
   "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722")
  (:PATH "raw/mutations/4/tests/execution/ready-recycle.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/execution/ready-recycle.lisp")
   :BYTES 30075 :SHA256
   "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae")
  (:PATH "raw/mutations/4/tests/execution/ready.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/execution/ready.lisp")
   :BYTES 33555 :SHA256
   "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e")
  (:PATH "raw/mutations/4/tests/execution/support.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/execution/support.lisp")
   :BYTES 4469 :SHA256
   "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43")
  (:PATH "raw/mutations/4/tests/execution/threads.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/execution/threads.lisp")
   :BYTES 14622 :SHA256
   "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359")
  (:PATH "raw/mutations/4/tests/execution/worker.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/execution/worker.lisp")
   :BYTES 59783 :SHA256
   "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06")
  (:PATH "raw/mutations/4/tests/foundation/batch.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/foundation/batch.lisp")
   :BYTES 5185 :SHA256
   "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183")
  (:PATH "raw/mutations/4/tests/foundation/binary.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/foundation/binary.lisp")
   :BYTES 3721 :SHA256
   "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe")
  (:PATH "raw/mutations/4/tests/foundation/record.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/foundation/record.lisp")
   :BYTES 14950 :SHA256
   "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8")
  (:PATH "raw/mutations/4/tests/foundation/support.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:PATH "raw/mutations/4/tests/get-performance/guards.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/get-performance/guards.lisp")
   :BYTES 8986 :SHA256
   "c41721b917ed443355ea3707efdd07e7da53a978c0515ab1e5ede5fcc47d63fc")
  (:PATH "raw/mutations/4/tests/get-performance/paths.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/get-performance/paths.lisp")
   :BYTES 4936 :SHA256
   "3b8d2c9c93467507ea2bb471d42192eb1fa084b55c0f4263b5ef0d3acf468f55")
  (:PATH "raw/mutations/4/tests/get-performance/support.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/get-performance/support.lisp")
   :BYTES 22497 :SHA256
   "e586ed94dcb2aaba00282931cdd83313e4f84a86d4d1ba85e2d56e8b7433ed8d")
  (:PATH "raw/mutations/4/tests/get-performance/threads.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/get-performance/threads.lisp")
   :BYTES 4744 :SHA256
   "05ace5eb351ab49da59611dc1a2a5abedb9d723a2fc6e75a30fc76e507573a90")
  (:PATH "raw/mutations/4/tests/hash/guards.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/hash/guards.lisp")
   :BYTES 1162 :SHA256
   "9af5b38443a57d224990a68e93f12f7a4cda306f94c7ccd3ccb50635865d7864")
  (:PATH "raw/mutations/4/tests/hash/hash64.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/hash/hash64.lisp")
   :BYTES 17948 :SHA256
   "70606bc68807143cfea9583871474c84efc868d13692cde28488284dee43e0f1")
  (:PATH "raw/mutations/4/tests/hash/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/hash/support.lisp")
   :BYTES 10828 :SHA256
   "0fae9dc36976af544f83e6051b9cf9d67c9bef0b9e25f1fa2a48fdac48592acb")
  (:PATH "raw/mutations/4/tests/hash/threads.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/hash/threads.lisp")
   :BYTES 6701 :SHA256
   "3fc587a57d26a294aebfc6a7aeadf2f61a42a21106c1c57517f891b76b4e750a")
  (:PATH "raw/mutations/4/tests/index/hash-digests.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/index/hash-digests.lisp")
   :BYTES 35926 :SHA256
   "3b3b39f861883cf2017cab8e6488560a6bb3897d63784f00e820a6450d743225")
  (:PATH "raw/mutations/4/tests/index/primary-support.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/index/primary-support.lisp")
   :BYTES 13938 :SHA256
   "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a")
  (:PATH "raw/mutations/4/tests/index/primary-threads.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/index/primary-threads.lisp")
   :BYTES 13744 :SHA256
   "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2")
  (:PATH "raw/mutations/4/tests/index/primary.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/index/primary.lisp")
   :BYTES 30166 :SHA256
   "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696")
  (:PATH "raw/mutations/4/tests/index/rebuild.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/index/rebuild.lisp")
   :BYTES 32112 :SHA256
   "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1")
  (:PATH "raw/mutations/4/tests/index/slot-support.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/index/slot-support.lisp")
   :BYTES 12800 :SHA256
   "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31")
  (:PATH "raw/mutations/4/tests/index/slot-threads.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/index/slot-threads.lisp")
   :BYTES 11698 :SHA256
   "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f")
  (:PATH "raw/mutations/4/tests/index/slots.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/index/slots.lisp")
   :BYTES 26420 :SHA256
   "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb")
  (:PATH "raw/mutations/4/tests/io/native.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/io/native.lisp")
   :BYTES 6207 :SHA256
   "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0")
  (:PATH "raw/mutations/4/tests/io/support.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/io/support.lisp")
   :BYTES 2951 :SHA256
   "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50")
  (:PATH "raw/mutations/4/tests/io/transfer.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/io/transfer.lisp")
   :BYTES 11847 :SHA256
   "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd")
  (:PATH "raw/mutations/4/tests/lint-fixtures/bad.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/lint-fixtures/bad.lisp")
   :BYTES 1587 :SHA256
   "ac8912ce6cc1101f2ebc305a50c0565879547b527d7ca0aeac900ee06bf26652")
  (:PATH "raw/mutations/4/tests/lint-fixtures/good.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/lint-fixtures/good.lisp")
   :BYTES 671 :SHA256
   "05ce84f8fd12d9af48252601bcc92d6d60335b53f39b01a9fe2697c4bdaa8cee")
  (:PATH "raw/mutations/4/tests/lint-fixtures/keyword-barrier.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/lint-fixtures/keyword-barrier.lisp")
   :BYTES 199 :SHA256
   "e26dab117e9526ace35bb45b92f977065d33fcc4404c40fd4fc3c77749689a96")
  (:PATH "raw/mutations/4/tests/lint-fixtures/qualified-reader.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/lint-fixtures/qualified-reader.lisp")
   :BYTES 152 :SHA256
   "835229bdc1a0ed0c08511cd6121e1f1bc4284da2cfba951b72cd1a74a6040d35")
  (:PATH "raw/mutations/4/tests/mvcc/capture.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/mvcc/capture.lisp")
   :BYTES 16356 :SHA256
   "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35")
  (:PATH "raw/mutations/4/tests/mvcc/lifecycle.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/mvcc/lifecycle.lisp")
   :BYTES 23964 :SHA256
   "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16")
  (:PATH "raw/mutations/4/tests/mvcc/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/mvcc/support.lisp")
   :BYTES 5931 :SHA256
   "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290")
  (:PATH "raw/mutations/4/tests/read/lifecycle.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/read/lifecycle.lisp")
   :BYTES 17804 :SHA256
   "c4c4642408816f2e0e809e21d04739b68b9391237e3e46ea0b195ed82857c3a8")
  (:PATH "raw/mutations/4/tests/read/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/read/support.lisp")
   :BYTES 4845 :SHA256
   "8095cc39d49342f6e43f3421b4fced839da02d8d11b4d8ddcd91bd346447e754")
  (:PATH "raw/mutations/4/tests/read/threads.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/read/threads.lisp")
   :BYTES 4150 :SHA256
   "e2e223b69b08a5d76b9773c6ad4dee13ef2ddbb6f5ababa713cc5654bc7b51c5")
  (:PATH "raw/mutations/4/tests/recovery/corruption.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/recovery/corruption.lisp")
   :BYTES 7106 :SHA256
   "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c")
  (:PATH "raw/mutations/4/tests/recovery/decisions-audit.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/recovery/decisions-audit.lisp")
   :BYTES 14971 :SHA256
   "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0")
  (:PATH "raw/mutations/4/tests/recovery/decisions-radix.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/recovery/decisions-radix.lisp")
   :BYTES 27851 :SHA256
   "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0")
  (:PATH "raw/mutations/4/tests/recovery/decisions-support.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/recovery/decisions-support.lisp")
   :BYTES 6797 :SHA256
   "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4")
  (:PATH "raw/mutations/4/tests/recovery/decisions.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/recovery/decisions.lisp")
   :BYTES 19149 :SHA256
   "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e")
  (:PATH "raw/mutations/4/tests/recovery/inventory-support.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/recovery/inventory-support.lisp")
   :BYTES 8083 :SHA256
   "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27")
  (:PATH "raw/mutations/4/tests/recovery/inventory.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/recovery/inventory.lisp")
   :BYTES 14479 :SHA256
   "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9")
  (:PATH "raw/mutations/4/tests/recovery/manifest-audit.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/recovery/manifest-audit.lisp")
   :BYTES 17670 :SHA256
   "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6")
  (:PATH "raw/mutations/4/tests/recovery/manifest-support.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/recovery/manifest-support.lisp")
   :BYTES 9769 :SHA256
   "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830")
  (:PATH "raw/mutations/4/tests/recovery/manifest.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/recovery/manifest.lisp")
   :BYTES 13799 :SHA256
   "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd")
  (:PATH "raw/mutations/4/tests/recovery/scan.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/recovery/scan.lisp")
   :BYTES 16966 :SHA256
   "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b")
  (:PATH "raw/mutations/4/tests/recovery/support.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/recovery/support.lisp")
   :BYTES 5957 :SHA256
   "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204")
  (:PATH "raw/mutations/4/tests/series/boundaries.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/series/boundaries.lisp")
   :BYTES 5802 :SHA256
   "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8")
  (:PATH "raw/mutations/4/tests/series/controller.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/series/controller.lisp")
   :BYTES 60484 :SHA256
   "4bea80eb231575f48b208ddb57af6a11706481e0ec755b084f6cd4b6fd0481a1")
  (:PATH "raw/mutations/4/tests/series/support.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/series/support.lisp")
   :BYTES 16885 :SHA256
   "8821ae9e002941eff8ea3ae7dbfc727cb6874b68d2d1ef85af668eb2d34a0c0c")
  (:PATH "raw/mutations/4/tests/series/threads.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/series/threads.lisp")
   :BYTES 19694 :SHA256
   "bbea64d207d14698b39ab0f8ded03db11bab09955d3f66705c23d69c09aefc8e")
  (:PATH "raw/mutations/4/tests/series/worker-bridge.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/series/worker-bridge.lisp")
   :BYTES 56677 :SHA256
   "c1ee49702e63978a83cb86c4e5bf437a5a40e48fa02b65d3eaf3dca0d2e39176")
  (:PATH "raw/mutations/4/tests/smoke.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/smoke.lisp")
   :BYTES 735 :SHA256
   "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8")
  (:PATH "raw/mutations/4/tests/storage/compaction-scan.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/storage/compaction-scan.lisp")
   :BYTES 16196 :SHA256
   "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5")
  (:PATH "raw/mutations/4/tests/storage/control-payload.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/storage/control-payload.lisp")
   :BYTES 12651 :SHA256
   "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae")
  (:PATH "raw/mutations/4/tests/storage/log-header.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/storage/log-header.lisp")
   :BYTES 11969 :SHA256
   "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e")
  (:PATH "raw/mutations/4/tests/storage/segment-header.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/storage/segment-header.lisp")
   :BYTES 4149 :SHA256
   "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df")
  (:PATH "raw/mutations/4/tests/storage/support.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/storage/support.lisp")
   :BYTES 4029 :SHA256
   "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625")
  (:PATH "raw/mutations/4/tests/wal/builder.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/wal/builder.lisp")
   :BYTES 4000 :SHA256
   "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6")
  (:PATH "raw/mutations/4/tests/wal/csn-threads.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/wal/csn-threads.lisp")
   :BYTES 12114 :SHA256
   "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c")
  (:PATH "raw/mutations/4/tests/wal/csn.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/wal/csn.lisp")
   :BYTES 34661 :SHA256
   "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a")
  (:PATH "raw/mutations/4/tests/wal/fault.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/wal/fault.lisp")
   :BYTES 7614 :SHA256
   "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875")
  (:PATH "raw/mutations/4/tests/wal/group.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/wal/group.lisp")
   :BYTES 5524 :SHA256
   "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e")
  (:PATH "raw/mutations/4/tests/wal/native.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/wal/native.lisp")
   :BYTES 2567 :SHA256
   "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7")
  (:PATH "raw/mutations/4/tests/wal/support.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tests/wal/support.lisp")
   :BYTES 1951 :SHA256
   "90a47539e5e2898c0a08059207f30bb5551e7ca8fc166f8f6ce7b95afa757295")
  (:PATH "raw/mutations/4/tools/build.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/4/tools/cbor-simple-write-isolated-build.lisp" :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/4/tools/cbor-simple-write-isolated-build.lisp")
   :BYTES 478 :SHA256
   "f986cf1844a744df63a144b97cf7c22030fc8091af90421c613e703df1e64763")
  (:PATH "raw/mutations/5/src/cache/build.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/cache/build.lisp")
   :BYTES 4966 :SHA256
   "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0")
  (:PATH "raw/mutations/5/src/cache/clock.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/cache/clock.lisp")
   :BYTES 2952 :SHA256
   "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f")
  (:PATH "raw/mutations/5/src/cache/core.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/cache/core.lisp")
   :BYTES 3503 :SHA256
   "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4")
  (:PATH "raw/mutations/5/src/cache/package.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/cache/package.lisp")
   :BYTES 758 :SHA256
   "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848")
  (:PATH "raw/mutations/5/src/cache/read.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/cache/read.lisp")
   :BYTES 6485 :SHA256
   "5700e43ae8ee859e96bdecb5953af43a712fd9e6ec23a53565759676bb07f85a")
  (:PATH "raw/mutations/5/src/cache/types.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/cache/types.lisp")
   :BYTES 2448 :SHA256
   "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30")
  (:PATH "raw/mutations/5/src/cache/write.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/cache/write.lisp")
   :BYTES 5481 :SHA256
   "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8")
  (:PATH "raw/mutations/5/src/codec/cbor-float-minimal.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH "raw/mutations/5/src/codec/cbor-header.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH "raw/mutations/5/src/codec/cbor-minimal.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH "raw/mutations/5/src/codec/cbor-package.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/codec/cbor-package.lisp")
   :BYTES 620 :SHA256
   "53fa9acbed8f5602b204252ff394c01fd01effdbe41baf021a713e2636cbd668")
  (:PATH "raw/mutations/5/src/codec/cbor-scan-input.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH "raw/mutations/5/src/codec/cbor-scan-items.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH "raw/mutations/5/src/codec/cbor-scan-minimal.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH "raw/mutations/5/src/codec/cbor-scan-stack.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH "raw/mutations/5/src/codec/cbor-scan.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH "raw/mutations/5/src/codec/cbor-simple-write.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/codec/cbor-simple-write.lisp")
   :BYTES 2884 :SHA256
   "c5ffcaa35f341afd9df915852f0af85608aefcef3acf06192245ee83bd030f49")
  (:PATH "raw/mutations/5/src/codec/cbor-space.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH "raw/mutations/5/src/codec/cbor-string-write.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727")
  (:PATH "raw/mutations/5/src/codec/cbor-write.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/mutations/5/src/codec/package.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH "raw/mutations/5/src/codec/utf8.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH "raw/mutations/5/src/csn/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/csn/package.lisp")
   :BYTES 441 :SHA256
   "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0")
  (:PATH "raw/mutations/5/src/csn/registry.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/csn/registry.lisp")
   :BYTES 12139 :SHA256
   "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a")
  (:PATH "raw/mutations/5/src/epochs/core.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/epochs/core.lisp")
   :BYTES 5909 :SHA256
   "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399")
  (:PATH "raw/mutations/5/src/epochs/package.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/epochs/package.lisp")
   :BYTES 779 :SHA256
   "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd")
  (:PATH "raw/mutations/5/src/epochs/read.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/epochs/read.lisp")
   :BYTES 3240 :SHA256
   "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905")
  (:PATH "raw/mutations/5/src/epochs/reclaim.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/epochs/reclaim.lisp")
   :BYTES 6373 :SHA256
   "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202")
  (:PATH "raw/mutations/5/src/epochs/retire.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/epochs/retire.lisp")
   :BYTES 5858 :SHA256
   "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b")
  (:PATH "raw/mutations/5/src/epochs/types.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/epochs/types.lisp")
   :BYTES 5304 :SHA256
   "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097")
  (:PATH "raw/mutations/5/src/execution/handoff.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/execution/handoff.lisp")
   :BYTES 7394 :SHA256
   "ee90c809ef51134efa21e08b819e5530304efaf9f9e26b63c7e4afbf6d48e607")
  (:PATH "raw/mutations/5/src/execution/package.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/execution/package.lisp")
   :BYTES 1157 :SHA256
   "bbe8cdb6f7e74d7139f5e472a915cc74b43e34bd27ecac1c5fd364f723a2a643")
  (:PATH "raw/mutations/5/src/execution/queue.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/execution/queue.lisp")
   :BYTES 5374 :SHA256
   "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90")
  (:PATH "raw/mutations/5/src/execution/ready-recycle.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/execution/ready-recycle.lisp")
   :BYTES 3387 :SHA256
   "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b")
  (:PATH "raw/mutations/5/src/execution/ready-types.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/execution/ready-types.lisp")
   :BYTES 5248 :SHA256
   "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f")
  (:PATH "raw/mutations/5/src/execution/ready.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/execution/ready.lisp")
   :BYTES 6635 :SHA256
   "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327")
  (:PATH "raw/mutations/5/src/execution/worker-boundary.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/execution/worker-boundary.lisp")
   :BYTES 2309 :SHA256
   "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a")
  (:PATH "raw/mutations/5/src/execution/worker-claim.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/execution/worker-claim.lisp")
   :BYTES 6401 :SHA256
   "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e")
  (:PATH "raw/mutations/5/src/execution/worker-run.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/execution/worker-run.lisp")
   :BYTES 5124 :SHA256
   "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542")
  (:PATH "raw/mutations/5/src/execution/worker-types.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/execution/worker-types.lisp")
   :BYTES 8461 :SHA256
   "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317")
  (:PATH "raw/mutations/5/src/execution/writer.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/execution/writer.lisp")
   :BYTES 6484 :SHA256
   "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105")
  (:PATH "raw/mutations/5/src/foundation/batch.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH "raw/mutations/5/src/foundation/binary.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH "raw/mutations/5/src/foundation/conditions.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH "raw/mutations/5/src/foundation/crc32c.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH "raw/mutations/5/src/foundation/package.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH "raw/mutations/5/src/foundation/record.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH "raw/mutations/5/src/get-resolver/build.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/get-resolver/build.lisp")
   :BYTES 6882 :SHA256
   "3715cb750e08ab30fcaa068a05b17772381a3cf1975bdbdd0c03f71761089ef6")
  (:PATH "raw/mutations/5/src/get-resolver/package.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/get-resolver/package.lisp")
   :BYTES 1887 :SHA256
   "f244c1346604ccde93880824ea990a4a7329340df6c8b665963713977ca0ee10")
  (:PATH "raw/mutations/5/src/get-resolver/read.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/get-resolver/read.lisp")
   :BYTES 7259 :SHA256
   "68f82df01f7894f66db0c6545267616e76c0ba93fd7c49db6434cec666f02dc3")
  (:PATH "raw/mutations/5/src/get-resolver/rows.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/get-resolver/rows.lisp")
   :BYTES 3350 :SHA256
   "d9db85d788006fc7ad1f9a7cdeef28b992605de7fac8c295dd7fdc51f5511854")
  (:PATH "raw/mutations/5/src/get-resolver/scan.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/get-resolver/scan.lisp")
   :BYTES 6786 :SHA256
   "35a1780c6bf66364ef94c4151fa91f02eebe359f0ca0639985d2a907fd9d512d")
  (:PATH "raw/mutations/5/src/get-resolver/sort.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/get-resolver/sort.lisp")
   :BYTES 7118 :SHA256
   "974bf44efeb1cd26c5e9db0601aea295c8f1a18234894ad9d41938a2880e2255")
  (:PATH "raw/mutations/5/src/get-resolver/types.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/get-resolver/types.lisp")
   :BYTES 1757 :SHA256
   "1334512380bfb01add33b0ca152c0ce4746b3f79bcd04f84d7844ef234d6eaba")
  (:PATH "raw/mutations/5/src/get/build.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/get/build.lisp")
   :BYTES 3745 :SHA256
   "bcfc4916e9a85833dc151c4ce176bc905f2c03b6bc6d636f97a60df0d8c16739")
  (:PATH "raw/mutations/5/src/get/lifecycle.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/get/lifecycle.lisp")
   :BYTES 5345 :SHA256
   "885ba4141114ea411cac37c9b5f924aaa7f9f2a5ba311ebf92a392e5da1e3c59")
  (:PATH "raw/mutations/5/src/get/lookup.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/get/lookup.lisp")
   :BYTES 4352 :SHA256
   "9d1042d4cf1e7bd9c6d1153de12b2459e7a2724e47bd32534cd7ae56cb274c5f")
  (:PATH "raw/mutations/5/src/get/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/get/package.lisp")
   :BYTES 1995 :SHA256
   "87b795779aef0c4b918a039d182daddd22b902a9ad10c763df4364b7e630151c")
  (:PATH "raw/mutations/5/src/get/segment.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/get/segment.lisp")
   :BYTES 8097 :SHA256
   "4a486528cb2c1cc3471cb4b332d4314d24011889e1f885db6fd5600bb077eea3")
  (:PATH "raw/mutations/5/src/get/target.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/get/target.lisp")
   :BYTES 5652 :SHA256
   "9f682f735e49108cad176a6143ec99e1be64da98f29cae0b52f9b49cdea34250")
  (:PATH "raw/mutations/5/src/get/types.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/get/types.lisp")
   :BYTES 4413 :SHA256
   "653b23a6e719cd1f55e7c58b4d7e8143aec5983992ba210d0eac1f4c8682f623")
  (:PATH "raw/mutations/5/src/hash/arithmetic.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/hash/arithmetic.lisp")
   :BYTES 3073 :SHA256
   "c439e534b768acb123d69b921b85e1e56683aa8335bbc87efba95fe95f256fa9")
  (:PATH "raw/mutations/5/src/hash/blocks.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/hash/blocks.lisp")
   :BYTES 3262 :SHA256
   "5f5dff95ae6c34dfc15538c537ba2fa8d34ba2376ad66ad9975745ea13a2175f")
  (:PATH "raw/mutations/5/src/hash/hash64.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/hash/hash64.lisp")
   :BYTES 1768 :SHA256
   "99e4c8394a8f877ce1f552f15a57a082c0ec81015e87119ee4ffea28cf3ae77f")
  (:PATH "raw/mutations/5/src/hash/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/hash/package.lisp")
   :BYTES 477 :SHA256
   "1e7668fa26fc1a8e3b3cfe824aa3e08b30b57441d5f90d44453fc3a9259a10d0")
  (:PATH "raw/mutations/5/src/index/core.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/index/core.lisp")
   :BYTES 2959 :SHA256
   "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff")
  (:PATH "raw/mutations/5/src/index/hash-digests.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/index/hash-digests.lisp")
   :BYTES 3674 :SHA256
   "924bb7dab91ff56c1e909f2b06dff5f74b443ac6442e379498f29b25f1fa2673")
  (:PATH "raw/mutations/5/src/index/hash-seed.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/index/hash-seed.lisp")
   :BYTES 2437 :SHA256
   "ae86514101e95737747ba58a4f0c5dc1ddb44d2b3a18bceb8fd0d0756b57a7a1")
  (:PATH "raw/mutations/5/src/index/package.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/index/package.lisp")
   :BYTES 727 :SHA256
   "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507")
  (:PATH "raw/mutations/5/src/index/primary-arena.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/index/primary-arena.lisp")
   :BYTES 3485 :SHA256
   "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5")
  (:PATH "raw/mutations/5/src/index/primary-build.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/index/primary-build.lisp")
   :BYTES 5379 :SHA256
   "06ca5ac8c03504e2d2f973873e5cabf7518c090cd1f8f2118c46e0ea2f9bf37b")
  (:PATH "raw/mutations/5/src/index/primary-core.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/index/primary-core.lisp")
   :BYTES 4211 :SHA256
   "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e")
  (:PATH "raw/mutations/5/src/index/primary-directory.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/index/primary-directory.lisp")
   :BYTES 8114 :SHA256
   "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd")
  (:PATH "raw/mutations/5/src/index/primary-package.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/index/primary-package.lisp")
   :BYTES 1451 :SHA256
   "0682eb9a61596506b6788bd0285f9808db2496246caae64ab3203182ed46b860")
  (:PATH "raw/mutations/5/src/index/primary-probe.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/index/primary-probe.lisp")
   :BYTES 5936 :SHA256
   "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4")
  (:PATH "raw/mutations/5/src/index/primary-read.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/index/primary-read.lisp")
   :BYTES 3575 :SHA256
   "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f")
  (:PATH "raw/mutations/5/src/index/primary-relocate.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/index/primary-relocate.lisp")
   :BYTES 4073 :SHA256
   "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20")
  (:PATH "raw/mutations/5/src/index/primary-types.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/index/primary-types.lisp")
   :BYTES 3949 :SHA256
   "f17ca0dcd8a538b921f00044e23872b28272638c4435eacd30f0509422505e64")
  (:PATH "raw/mutations/5/src/index/primary-write.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/index/primary-write.lisp")
   :BYTES 7061 :SHA256
   "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655")
  (:PATH "raw/mutations/5/src/index/read.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/index/read.lisp")
   :BYTES 3030 :SHA256
   "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7")
  (:PATH "raw/mutations/5/src/index/rebuild-budget.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/index/rebuild-budget.lisp")
   :BYTES 3593 :SHA256
   "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0")
  (:PATH "raw/mutations/5/src/index/rebuild-copy.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/index/rebuild-copy.lisp")
   :BYTES 4027 :SHA256
   "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee")
  (:PATH "raw/mutations/5/src/index/rebuild-scan.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/index/rebuild-scan.lisp")
   :BYTES 5002 :SHA256
   "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e")
  (:PATH "raw/mutations/5/src/index/rebuild.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/index/rebuild.lisp")
   :BYTES 2872 :SHA256
   "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1")
  (:PATH "raw/mutations/5/src/index/relocate.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/index/relocate.lisp")
   :BYTES 2383 :SHA256
   "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc")
  (:PATH "raw/mutations/5/src/index/types.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/index/types.lisp")
   :BYTES 2434 :SHA256
   "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e")
  (:PATH "raw/mutations/5/src/index/validation.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/index/validation.lisp")
   :BYTES 3930 :SHA256
   "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a")
  (:PATH "raw/mutations/5/src/index/write.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/index/write.lisp")
   :BYTES 4784 :SHA256
   "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28")
  (:PATH "raw/mutations/5/src/io/flush.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/io/flush.lisp")
   :BYTES 1569 :SHA256
   "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325")
  (:PATH "raw/mutations/5/src/io/lifecycle.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/io/lifecycle.lisp")
   :BYTES 4536 :SHA256
   "baa1f763fe0f394a14d381b753dcb1be1e90eb03eaff5d6469465b5d4eca015f")
  (:PATH "raw/mutations/5/src/io/native.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/io/native.lisp")
   :BYTES 5026 :SHA256
   "b8cf3ce1ff7b4fa9def8a602ab768c0e9a321f8d6cdce6e5b2b7ded2fe3d97dd")
  (:PATH "raw/mutations/5/src/io/package.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/io/package.lisp")
   :BYTES 592 :SHA256
   "118eba04ab2aa87a2d86e0b0269dbeacaa485457acebbc12c57317ae465a89c0")
  (:PATH "raw/mutations/5/src/io/transfer.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/io/transfer.lisp")
   :BYTES 5051 :SHA256
   "3748328cf85e1c007900a63bdd0f159f38a8d7cd3577c92c56fc68692b9b7bcf")
  (:PATH "raw/mutations/5/src/io/types.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/io/types.lisp")
   :BYTES 4143 :SHA256
   "50c7eeea91af232fca7103ce5a25535958d73836f01cb45a20c7120b88b1336b")
  (:PATH "raw/mutations/5/src/mvcc/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/mvcc/package.lisp")
   :BYTES 833 :SHA256
   "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c")
  (:PATH "raw/mutations/5/src/mvcc/snapshots-core.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/mvcc/snapshots-core.lisp")
   :BYTES 7622 :SHA256
   "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998")
  (:PATH "raw/mutations/5/src/mvcc/snapshots-csn.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/mvcc/snapshots-csn.lisp")
   :BYTES 2725 :SHA256
   "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77")
  (:PATH "raw/mutations/5/src/mvcc/snapshots-lifecycle.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/mvcc/snapshots-lifecycle.lisp")
   :BYTES 6609 :SHA256
   "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082")
  (:PATH "raw/mutations/5/src/mvcc/snapshots-read.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/mvcc/snapshots-read.lisp")
   :BYTES 6651 :SHA256
   "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9")
  (:PATH "raw/mutations/5/src/mvcc/snapshots-register.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/mvcc/snapshots-register.lisp")
   :BYTES 6654 :SHA256
   "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b")
  (:PATH "raw/mutations/5/src/mvcc/snapshots-types.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/mvcc/snapshots-types.lisp")
   :BYTES 3817 :SHA256
   "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f")
  (:PATH "raw/mutations/5/src/mvcc/types.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/mvcc/types.lisp")
   :BYTES 471 :SHA256
   "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50")
  (:PATH "raw/mutations/5/src/package.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH "raw/mutations/5/src/read/core.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/read/core.lisp")
   :BYTES 3846 :SHA256
   "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f")
  (:PATH "raw/mutations/5/src/read/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/read/package.lisp")
   :BYTES 831 :SHA256
   "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df")
  (:PATH "raw/mutations/5/src/read/task.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/read/task.lisp")
   :BYTES 5073 :SHA256
   "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2")
  (:PATH "raw/mutations/5/src/read/types.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/read/types.lisp")
   :BYTES 2358 :SHA256
   "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c")
  (:PATH "raw/mutations/5/src/recovery/decisions-build.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/recovery/decisions-build.lisp")
   :BYTES 11857 :SHA256
   "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115")
  (:PATH "raw/mutations/5/src/recovery/decisions-package.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/recovery/decisions-package.lisp")
   :BYTES 818 :SHA256
   "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39")
  (:PATH "raw/mutations/5/src/recovery/decisions-query.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/recovery/decisions-query.lisp")
   :BYTES 4525 :SHA256
   "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24")
  (:PATH "raw/mutations/5/src/recovery/decisions-radix.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/recovery/decisions-radix.lisp")
   :BYTES 11061 :SHA256
   "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54")
  (:PATH "raw/mutations/5/src/recovery/decisions-sort.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/recovery/decisions-sort.lisp")
   :BYTES 7654 :SHA256
   "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2")
  (:PATH "raw/mutations/5/src/recovery/decisions-types.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/recovery/decisions-types.lisp")
   :BYTES 2056 :SHA256
   "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c")
  (:PATH "raw/mutations/5/src/recovery/inventory-build.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/recovery/inventory-build.lisp")
   :BYTES 9592 :SHA256
   "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e")
  (:PATH "raw/mutations/5/src/recovery/inventory-query.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/recovery/inventory-query.lisp")
   :BYTES 2100 :SHA256
   "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb")
  (:PATH "raw/mutations/5/src/recovery/inventory-types.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/recovery/inventory-types.lisp")
   :BYTES 2392 :SHA256
   "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9")
  (:PATH "raw/mutations/5/src/recovery/manifest-build.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/recovery/manifest-build.lisp")
   :BYTES 10251 :SHA256
   "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471")
  (:PATH "raw/mutations/5/src/recovery/manifest-decode.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/recovery/manifest-decode.lisp")
   :BYTES 6160 :SHA256
   "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779")
  (:PATH "raw/mutations/5/src/recovery/manifest-fold.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/recovery/manifest-fold.lisp")
   :BYTES 7068 :SHA256
   "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730")
  (:PATH "raw/mutations/5/src/recovery/manifest-package.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/recovery/manifest-package.lisp")
   :BYTES 1372 :SHA256
   "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc")
  (:PATH "raw/mutations/5/src/recovery/manifest-query.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/recovery/manifest-query.lisp")
   :BYTES 3582 :SHA256
   "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b")
  (:PATH "raw/mutations/5/src/recovery/manifest-types.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/recovery/manifest-types.lisp")
   :BYTES 3345 :SHA256
   "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10")
  (:PATH "raw/mutations/5/src/recovery/package.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/recovery/package.lisp")
   :BYTES 927 :SHA256
   "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9")
  (:PATH "raw/mutations/5/src/recovery/scan.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/recovery/scan.lisp")
   :BYTES 12829 :SHA256
   "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218")
  (:PATH "raw/mutations/5/src/series/events.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/series/events.lisp")
   :BYTES 9566 :SHA256
   "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7")
  (:PATH "raw/mutations/5/src/series/io-events.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/series/io-events.lisp")
   :BYTES 5385 :SHA256
   "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546")
  (:PATH "raw/mutations/5/src/series/ownership.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/series/ownership.lisp")
   :BYTES 8810 :SHA256
   "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4")
  (:PATH "raw/mutations/5/src/series/package.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/series/package.lisp")
   :BYTES 1392 :SHA256
   "7433162105df63d324141167e6dcf6bfee74611aa1cf7291cc6c92f41f3c7408")
  (:PATH "raw/mutations/5/src/series/publication.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/series/publication.lisp")
   :BYTES 6094 :SHA256
   "288cb3fa41fad76a0e6919dfa0b2fce2beef15f5880129393bee35bc8795c762")
  (:PATH "raw/mutations/5/src/series/query.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/series/query.lisp")
   :BYTES 3600 :SHA256
   "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9")
  (:PATH "raw/mutations/5/src/series/retirement.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/series/retirement.lisp")
   :BYTES 4634 :SHA256
   "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059")
  (:PATH "raw/mutations/5/src/series/types.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/series/types.lisp")
   :BYTES 3316 :SHA256
   "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9")
  (:PATH "raw/mutations/5/src/series/worker-boundary.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/series/worker-boundary.lisp")
   :BYTES 3443 :SHA256
   "793d401d1b9acc7b67923d815560f277f3d390ca050740f735f07d88dbacfe73")
  (:PATH "raw/mutations/5/src/series/worker-package.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/series/worker-package.lisp")
   :BYTES 1036 :SHA256
   "881a2958ddb8f5781954d4c59d7467e34c03c01fbb2fea43dc06e9e2050a1f37")
  (:PATH "raw/mutations/5/src/series/worker-run.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/series/worker-run.lisp")
   :BYTES 6985 :SHA256
   "f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f")
  (:PATH "raw/mutations/5/src/series/worker-types.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/series/worker-types.lisp")
   :BYTES 6493 :SHA256
   "a366799fd9b938bfaa48b0ffda228ff8369ab9acb5b5ead7f081dfc66ab2c81a")
  (:PATH "raw/mutations/5/src/storage/compaction-scan.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/storage/compaction-scan.lisp")
   :BYTES 5510 :SHA256
   "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d")
  (:PATH "raw/mutations/5/src/storage/control-payload.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/storage/control-payload.lisp")
   :BYTES 6273 :SHA256
   "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491")
  (:PATH "raw/mutations/5/src/storage/formats.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/storage/formats.lisp")
   :BYTES 3841 :SHA256
   "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f")
  (:PATH "raw/mutations/5/src/storage/log-header.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/storage/log-header.lisp")
   :BYTES 3947 :SHA256
   "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81")
  (:PATH "raw/mutations/5/src/storage/package.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/storage/package.lisp")
   :BYTES 1079 :SHA256
   "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e")
  (:PATH "raw/mutations/5/src/storage/payload-record.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/storage/payload-record.lisp")
   :BYTES 3641 :SHA256
   "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7")
  (:PATH "raw/mutations/5/src/storage/payload-write.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/storage/payload-write.lisp")
   :BYTES 5239 :SHA256
   "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc")
  (:PATH "raw/mutations/5/src/storage/segment-header.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/storage/segment-header.lisp")
   :BYTES 5517 :SHA256
   "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011")
  (:PATH "raw/mutations/5/src/wal/builder.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/wal/builder.lisp")
   :BYTES 8445 :SHA256
   "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0")
  (:PATH "raw/mutations/5/src/wal/csn.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/wal/csn.lisp")
   :BYTES 9577 :SHA256
   "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810")
  (:PATH "raw/mutations/5/src/wal/executor.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/wal/executor.lisp")
   :BYTES 6023 :SHA256
   "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8")
  (:PATH "raw/mutations/5/src/wal/group.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/wal/group.lisp")
   :BYTES 6305 :SHA256
   "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b")
  (:PATH "raw/mutations/5/src/wal/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/wal/package.lisp")
   :BYTES 1774 :SHA256
   "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89")
  (:PATH "raw/mutations/5/src/wal/types.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/src/wal/types.lisp")
   :BYTES 5420 :SHA256
   "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e")
  (:PATH "raw/mutations/5/test.log" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/test.log")
   :BYTES 25438 :SHA256
   "28f1bd17d9d16b27c21cd827386198c07850cbd26c0e9ad27701f2d3f59577b1")
  (:PATH "raw/mutations/5/tests/codec/cbor-header.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/codec/cbor-header.lisp")
   :BYTES 10773 :SHA256
   "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815")
  (:PATH "raw/mutations/5/tests/codec/cbor-minimal-edges.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/codec/cbor-minimal-edges.lisp")
   :BYTES 1613 :SHA256
   "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70")
  (:PATH "raw/mutations/5/tests/codec/cbor-minimal-scan-support.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/codec/cbor-minimal-scan-support.lisp")
   :BYTES 8363 :SHA256
   "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421")
  (:PATH "raw/mutations/5/tests/codec/cbor-minimal-scan-threads.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/codec/cbor-minimal-scan-threads.lisp")
   :BYTES 4547 :SHA256
   "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660")
  (:PATH "raw/mutations/5/tests/codec/cbor-minimal-scan.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/codec/cbor-minimal-scan.lisp")
   :BYTES 19217 :SHA256
   "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8")
  (:PATH "raw/mutations/5/tests/codec/cbor-minimal-support.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/codec/cbor-minimal-support.lisp")
   :BYTES 8620 :SHA256
   "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a")
  (:PATH "raw/mutations/5/tests/codec/cbor-minimal-threads.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/codec/cbor-minimal-threads.lisp")
   :BYTES 3799 :SHA256
   "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2")
  (:PATH "raw/mutations/5/tests/codec/cbor-minimal.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/codec/cbor-minimal.lisp")
   :BYTES 12604 :SHA256
   "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3")
  (:PATH "raw/mutations/5/tests/codec/cbor-simple-write-support.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/codec/cbor-simple-write-support.lisp")
   :BYTES 4955 :SHA256
   "53ceafc72a027a2ff1f787900558ff26f2ff70bbb212f1b37926a6d520fbe86e")
  (:PATH "raw/mutations/5/tests/codec/cbor-simple-write-threads.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/codec/cbor-simple-write-threads.lisp")
   :BYTES 3561 :SHA256
   "77074033e75a224fd02e890f98dffa8e97d3a1f8bedd510b00ea55d8ff8687b2")
  (:PATH "raw/mutations/5/tests/codec/cbor-simple-write.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/codec/cbor-simple-write.lisp")
   :BYTES 10712 :SHA256
   "958bdd3901cfc41032c09d6c9023b192799981884e09ce3573256ff45bc5329a")
  (:PATH "raw/mutations/5/tests/codec/cbor-string-write-support.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/codec/cbor-string-write-support.lisp")
   :BYTES 6868 :SHA256
   "2cbdb601f442a56456bc637c94e759cc965f44b178268dce3c636c385d34fc39")
  (:PATH "raw/mutations/5/tests/codec/cbor-string-write-threads.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/codec/cbor-string-write-threads.lisp")
   :BYTES 3512 :SHA256
   "8e07b881a55e2554a429f1c8b2c69f67862ac015217d90d019167d636564d27d")
  (:PATH "raw/mutations/5/tests/codec/cbor-string-write.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/codec/cbor-string-write.lisp")
   :BYTES 15883 :SHA256
   "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115")
  (:PATH "raw/mutations/5/tests/codec/cbor-structure-support.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:PATH "raw/mutations/5/tests/codec/cbor-structure-threads.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/codec/cbor-structure-threads.lisp")
   :BYTES 4305 :SHA256
   "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645")
  (:PATH "raw/mutations/5/tests/codec/cbor-structure.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/codec/cbor-structure.lisp")
   :BYTES 22968 :SHA256
   "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110")
  (:PATH "raw/mutations/5/tests/codec/cbor-support.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:PATH "raw/mutations/5/tests/codec/cbor-threads.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/codec/cbor-threads.lisp")
   :BYTES 3683 :SHA256
   "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14")
  (:PATH "raw/mutations/5/tests/codec/cbor-write-roundtrip.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/codec/cbor-write-roundtrip.lisp")
   :BYTES 901 :SHA256
   "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344")
  (:PATH "raw/mutations/5/tests/codec/cbor-write-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/codec/cbor-write-support.lisp")
   :BYTES 4768 :SHA256
   "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6")
  (:PATH "raw/mutations/5/tests/codec/cbor-write-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/codec/cbor-write-threads.lisp")
   :BYTES 3813 :SHA256
   "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb")
  (:PATH "raw/mutations/5/tests/codec/cbor-write.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/codec/cbor-write.lisp")
   :BYTES 9822 :SHA256
   "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3")
  (:PATH "raw/mutations/5/tests/codec/support.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/codec/support.lisp")
   :BYTES 5807 :SHA256
   "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96")
  (:PATH "raw/mutations/5/tests/codec/threads.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/codec/threads.lisp")
   :BYTES 3111 :SHA256
   "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337")
  (:PATH "raw/mutations/5/tests/codec/utf8.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/codec/utf8.lisp")
   :BYTES 12892 :SHA256
   "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100")
  (:PATH "raw/mutations/5/tests/csn/registry.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/csn/registry.lisp")
   :BYTES 19411 :SHA256
   "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950")
  (:PATH "raw/mutations/5/tests/csn/support.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/csn/support.lisp")
   :BYTES 11407 :SHA256
   "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db")
  (:PATH "raw/mutations/5/tests/csn/threads.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/csn/threads.lisp")
   :BYTES 10525 :SHA256
   "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2")
  (:PATH "raw/mutations/5/tests/epochs/lifecycle.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/epochs/lifecycle.lisp")
   :BYTES 25394 :SHA256
   "ddc2fbdad9f97d2e4ff008c167776a50b17b742398306fbd5198dca474559cbf")
  (:PATH "raw/mutations/5/tests/epochs/support.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/epochs/support.lisp")
   :BYTES 5943 :SHA256
   "366be7af4bf6c4ed946b3fa9e97aea6b034c83e3b757d81c54078dc76d229b6d")
  (:PATH "raw/mutations/5/tests/epochs/threads.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/epochs/threads.lisp")
   :BYTES 3654 :SHA256
   "54b73e06c61e64f32a3e3af0791891dacb6590e929163dcf0fac95f2c71e66fd")
  (:PATH "raw/mutations/5/tests/execution/handoff.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/execution/handoff.lisp")
   :BYTES 33278 :SHA256
   "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e")
  (:PATH "raw/mutations/5/tests/execution/queue.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/execution/queue.lisp")
   :BYTES 12894 :SHA256
   "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722")
  (:PATH "raw/mutations/5/tests/execution/ready-recycle.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/execution/ready-recycle.lisp")
   :BYTES 30075 :SHA256
   "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae")
  (:PATH "raw/mutations/5/tests/execution/ready.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/execution/ready.lisp")
   :BYTES 33555 :SHA256
   "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e")
  (:PATH "raw/mutations/5/tests/execution/support.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/execution/support.lisp")
   :BYTES 4469 :SHA256
   "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43")
  (:PATH "raw/mutations/5/tests/execution/threads.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/execution/threads.lisp")
   :BYTES 14622 :SHA256
   "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359")
  (:PATH "raw/mutations/5/tests/execution/worker.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/execution/worker.lisp")
   :BYTES 59783 :SHA256
   "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06")
  (:PATH "raw/mutations/5/tests/foundation/batch.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/foundation/batch.lisp")
   :BYTES 5185 :SHA256
   "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183")
  (:PATH "raw/mutations/5/tests/foundation/binary.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/foundation/binary.lisp")
   :BYTES 3721 :SHA256
   "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe")
  (:PATH "raw/mutations/5/tests/foundation/record.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/foundation/record.lisp")
   :BYTES 14950 :SHA256
   "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8")
  (:PATH "raw/mutations/5/tests/foundation/support.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:PATH "raw/mutations/5/tests/get-performance/guards.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/get-performance/guards.lisp")
   :BYTES 8986 :SHA256
   "c41721b917ed443355ea3707efdd07e7da53a978c0515ab1e5ede5fcc47d63fc")
  (:PATH "raw/mutations/5/tests/get-performance/paths.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/get-performance/paths.lisp")
   :BYTES 4936 :SHA256
   "3b8d2c9c93467507ea2bb471d42192eb1fa084b55c0f4263b5ef0d3acf468f55")
  (:PATH "raw/mutations/5/tests/get-performance/support.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/get-performance/support.lisp")
   :BYTES 22497 :SHA256
   "e586ed94dcb2aaba00282931cdd83313e4f84a86d4d1ba85e2d56e8b7433ed8d")
  (:PATH "raw/mutations/5/tests/get-performance/threads.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/get-performance/threads.lisp")
   :BYTES 4744 :SHA256
   "05ace5eb351ab49da59611dc1a2a5abedb9d723a2fc6e75a30fc76e507573a90")
  (:PATH "raw/mutations/5/tests/hash/guards.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/hash/guards.lisp")
   :BYTES 1162 :SHA256
   "9af5b38443a57d224990a68e93f12f7a4cda306f94c7ccd3ccb50635865d7864")
  (:PATH "raw/mutations/5/tests/hash/hash64.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/hash/hash64.lisp")
   :BYTES 17948 :SHA256
   "70606bc68807143cfea9583871474c84efc868d13692cde28488284dee43e0f1")
  (:PATH "raw/mutations/5/tests/hash/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/hash/support.lisp")
   :BYTES 10828 :SHA256
   "0fae9dc36976af544f83e6051b9cf9d67c9bef0b9e25f1fa2a48fdac48592acb")
  (:PATH "raw/mutations/5/tests/hash/threads.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/hash/threads.lisp")
   :BYTES 6701 :SHA256
   "3fc587a57d26a294aebfc6a7aeadf2f61a42a21106c1c57517f891b76b4e750a")
  (:PATH "raw/mutations/5/tests/index/hash-digests.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/index/hash-digests.lisp")
   :BYTES 35926 :SHA256
   "3b3b39f861883cf2017cab8e6488560a6bb3897d63784f00e820a6450d743225")
  (:PATH "raw/mutations/5/tests/index/primary-support.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/index/primary-support.lisp")
   :BYTES 13938 :SHA256
   "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a")
  (:PATH "raw/mutations/5/tests/index/primary-threads.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/index/primary-threads.lisp")
   :BYTES 13744 :SHA256
   "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2")
  (:PATH "raw/mutations/5/tests/index/primary.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/index/primary.lisp")
   :BYTES 30166 :SHA256
   "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696")
  (:PATH "raw/mutations/5/tests/index/rebuild.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/index/rebuild.lisp")
   :BYTES 32112 :SHA256
   "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1")
  (:PATH "raw/mutations/5/tests/index/slot-support.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/index/slot-support.lisp")
   :BYTES 12800 :SHA256
   "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31")
  (:PATH "raw/mutations/5/tests/index/slot-threads.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/index/slot-threads.lisp")
   :BYTES 11698 :SHA256
   "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f")
  (:PATH "raw/mutations/5/tests/index/slots.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/index/slots.lisp")
   :BYTES 26420 :SHA256
   "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb")
  (:PATH "raw/mutations/5/tests/io/native.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/io/native.lisp")
   :BYTES 6207 :SHA256
   "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0")
  (:PATH "raw/mutations/5/tests/io/support.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/io/support.lisp")
   :BYTES 2951 :SHA256
   "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50")
  (:PATH "raw/mutations/5/tests/io/transfer.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/io/transfer.lisp")
   :BYTES 11847 :SHA256
   "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd")
  (:PATH "raw/mutations/5/tests/lint-fixtures/bad.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/lint-fixtures/bad.lisp")
   :BYTES 1587 :SHA256
   "ac8912ce6cc1101f2ebc305a50c0565879547b527d7ca0aeac900ee06bf26652")
  (:PATH "raw/mutations/5/tests/lint-fixtures/good.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/lint-fixtures/good.lisp")
   :BYTES 671 :SHA256
   "05ce84f8fd12d9af48252601bcc92d6d60335b53f39b01a9fe2697c4bdaa8cee")
  (:PATH "raw/mutations/5/tests/lint-fixtures/keyword-barrier.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/lint-fixtures/keyword-barrier.lisp")
   :BYTES 199 :SHA256
   "e26dab117e9526ace35bb45b92f977065d33fcc4404c40fd4fc3c77749689a96")
  (:PATH "raw/mutations/5/tests/lint-fixtures/qualified-reader.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/lint-fixtures/qualified-reader.lisp")
   :BYTES 152 :SHA256
   "835229bdc1a0ed0c08511cd6121e1f1bc4284da2cfba951b72cd1a74a6040d35")
  (:PATH "raw/mutations/5/tests/mvcc/capture.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/mvcc/capture.lisp")
   :BYTES 16356 :SHA256
   "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35")
  (:PATH "raw/mutations/5/tests/mvcc/lifecycle.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/mvcc/lifecycle.lisp")
   :BYTES 23964 :SHA256
   "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16")
  (:PATH "raw/mutations/5/tests/mvcc/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/mvcc/support.lisp")
   :BYTES 5931 :SHA256
   "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290")
  (:PATH "raw/mutations/5/tests/read/lifecycle.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/read/lifecycle.lisp")
   :BYTES 17804 :SHA256
   "c4c4642408816f2e0e809e21d04739b68b9391237e3e46ea0b195ed82857c3a8")
  (:PATH "raw/mutations/5/tests/read/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/read/support.lisp")
   :BYTES 4845 :SHA256
   "8095cc39d49342f6e43f3421b4fced839da02d8d11b4d8ddcd91bd346447e754")
  (:PATH "raw/mutations/5/tests/read/threads.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/read/threads.lisp")
   :BYTES 4150 :SHA256
   "e2e223b69b08a5d76b9773c6ad4dee13ef2ddbb6f5ababa713cc5654bc7b51c5")
  (:PATH "raw/mutations/5/tests/recovery/corruption.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/recovery/corruption.lisp")
   :BYTES 7106 :SHA256
   "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c")
  (:PATH "raw/mutations/5/tests/recovery/decisions-audit.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/recovery/decisions-audit.lisp")
   :BYTES 14971 :SHA256
   "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0")
  (:PATH "raw/mutations/5/tests/recovery/decisions-radix.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/recovery/decisions-radix.lisp")
   :BYTES 27851 :SHA256
   "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0")
  (:PATH "raw/mutations/5/tests/recovery/decisions-support.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/recovery/decisions-support.lisp")
   :BYTES 6797 :SHA256
   "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4")
  (:PATH "raw/mutations/5/tests/recovery/decisions.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/recovery/decisions.lisp")
   :BYTES 19149 :SHA256
   "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e")
  (:PATH "raw/mutations/5/tests/recovery/inventory-support.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/recovery/inventory-support.lisp")
   :BYTES 8083 :SHA256
   "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27")
  (:PATH "raw/mutations/5/tests/recovery/inventory.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/recovery/inventory.lisp")
   :BYTES 14479 :SHA256
   "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9")
  (:PATH "raw/mutations/5/tests/recovery/manifest-audit.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/recovery/manifest-audit.lisp")
   :BYTES 17670 :SHA256
   "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6")
  (:PATH "raw/mutations/5/tests/recovery/manifest-support.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/recovery/manifest-support.lisp")
   :BYTES 9769 :SHA256
   "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830")
  (:PATH "raw/mutations/5/tests/recovery/manifest.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/recovery/manifest.lisp")
   :BYTES 13799 :SHA256
   "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd")
  (:PATH "raw/mutations/5/tests/recovery/scan.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/recovery/scan.lisp")
   :BYTES 16966 :SHA256
   "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b")
  (:PATH "raw/mutations/5/tests/recovery/support.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/recovery/support.lisp")
   :BYTES 5957 :SHA256
   "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204")
  (:PATH "raw/mutations/5/tests/series/boundaries.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/series/boundaries.lisp")
   :BYTES 5802 :SHA256
   "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8")
  (:PATH "raw/mutations/5/tests/series/controller.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/series/controller.lisp")
   :BYTES 60484 :SHA256
   "4bea80eb231575f48b208ddb57af6a11706481e0ec755b084f6cd4b6fd0481a1")
  (:PATH "raw/mutations/5/tests/series/support.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/series/support.lisp")
   :BYTES 16885 :SHA256
   "8821ae9e002941eff8ea3ae7dbfc727cb6874b68d2d1ef85af668eb2d34a0c0c")
  (:PATH "raw/mutations/5/tests/series/threads.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/series/threads.lisp")
   :BYTES 19694 :SHA256
   "bbea64d207d14698b39ab0f8ded03db11bab09955d3f66705c23d69c09aefc8e")
  (:PATH "raw/mutations/5/tests/series/worker-bridge.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/series/worker-bridge.lisp")
   :BYTES 56677 :SHA256
   "c1ee49702e63978a83cb86c4e5bf437a5a40e48fa02b65d3eaf3dca0d2e39176")
  (:PATH "raw/mutations/5/tests/smoke.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/smoke.lisp")
   :BYTES 735 :SHA256
   "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8")
  (:PATH "raw/mutations/5/tests/storage/compaction-scan.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/storage/compaction-scan.lisp")
   :BYTES 16196 :SHA256
   "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5")
  (:PATH "raw/mutations/5/tests/storage/control-payload.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/storage/control-payload.lisp")
   :BYTES 12651 :SHA256
   "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae")
  (:PATH "raw/mutations/5/tests/storage/log-header.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/storage/log-header.lisp")
   :BYTES 11969 :SHA256
   "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e")
  (:PATH "raw/mutations/5/tests/storage/segment-header.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/storage/segment-header.lisp")
   :BYTES 4149 :SHA256
   "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df")
  (:PATH "raw/mutations/5/tests/storage/support.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/storage/support.lisp")
   :BYTES 4029 :SHA256
   "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625")
  (:PATH "raw/mutations/5/tests/wal/builder.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/wal/builder.lisp")
   :BYTES 4000 :SHA256
   "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6")
  (:PATH "raw/mutations/5/tests/wal/csn-threads.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/wal/csn-threads.lisp")
   :BYTES 12114 :SHA256
   "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c")
  (:PATH "raw/mutations/5/tests/wal/csn.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/wal/csn.lisp")
   :BYTES 34661 :SHA256
   "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a")
  (:PATH "raw/mutations/5/tests/wal/fault.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/wal/fault.lisp")
   :BYTES 7614 :SHA256
   "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875")
  (:PATH "raw/mutations/5/tests/wal/group.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/wal/group.lisp")
   :BYTES 5524 :SHA256
   "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e")
  (:PATH "raw/mutations/5/tests/wal/native.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/wal/native.lisp")
   :BYTES 2567 :SHA256
   "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7")
  (:PATH "raw/mutations/5/tests/wal/support.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tests/wal/support.lisp")
   :BYTES 1951 :SHA256
   "90a47539e5e2898c0a08059207f30bb5551e7ca8fc166f8f6ce7b95afa757295")
  (:PATH "raw/mutations/5/tools/build.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/5/tools/cbor-simple-write-isolated-build.lisp" :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/5/tools/cbor-simple-write-isolated-build.lisp")
   :BYTES 478 :SHA256
   "2b74602f53f498be99801e529334d22d249974d75725a213c7534490ec1daf54")
  (:PATH "raw/mutations/6/src/cache/build.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/cache/build.lisp")
   :BYTES 4966 :SHA256
   "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0")
  (:PATH "raw/mutations/6/src/cache/clock.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/cache/clock.lisp")
   :BYTES 2952 :SHA256
   "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f")
  (:PATH "raw/mutations/6/src/cache/core.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/cache/core.lisp")
   :BYTES 3503 :SHA256
   "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4")
  (:PATH "raw/mutations/6/src/cache/package.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/cache/package.lisp")
   :BYTES 758 :SHA256
   "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848")
  (:PATH "raw/mutations/6/src/cache/read.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/cache/read.lisp")
   :BYTES 6485 :SHA256
   "5700e43ae8ee859e96bdecb5953af43a712fd9e6ec23a53565759676bb07f85a")
  (:PATH "raw/mutations/6/src/cache/types.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/cache/types.lisp")
   :BYTES 2448 :SHA256
   "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30")
  (:PATH "raw/mutations/6/src/cache/write.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/cache/write.lisp")
   :BYTES 5481 :SHA256
   "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8")
  (:PATH "raw/mutations/6/src/codec/cbor-float-minimal.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH "raw/mutations/6/src/codec/cbor-header.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH "raw/mutations/6/src/codec/cbor-minimal.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH "raw/mutations/6/src/codec/cbor-package.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/codec/cbor-package.lisp")
   :BYTES 620 :SHA256
   "53fa9acbed8f5602b204252ff394c01fd01effdbe41baf021a713e2636cbd668")
  (:PATH "raw/mutations/6/src/codec/cbor-scan-input.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH "raw/mutations/6/src/codec/cbor-scan-items.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH "raw/mutations/6/src/codec/cbor-scan-minimal.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH "raw/mutations/6/src/codec/cbor-scan-stack.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH "raw/mutations/6/src/codec/cbor-scan.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH "raw/mutations/6/src/codec/cbor-simple-write.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/codec/cbor-simple-write.lisp")
   :BYTES 2892 :SHA256
   "d76e9ba45b5c84ae123993bfa2d8d82fadba175959d5809a7697cc7c2dbe1ce4")
  (:PATH "raw/mutations/6/src/codec/cbor-space.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH "raw/mutations/6/src/codec/cbor-string-write.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727")
  (:PATH "raw/mutations/6/src/codec/cbor-write.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/mutations/6/src/codec/package.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH "raw/mutations/6/src/codec/utf8.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH "raw/mutations/6/src/csn/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/csn/package.lisp")
   :BYTES 441 :SHA256
   "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0")
  (:PATH "raw/mutations/6/src/csn/registry.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/csn/registry.lisp")
   :BYTES 12139 :SHA256
   "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a")
  (:PATH "raw/mutations/6/src/epochs/core.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/epochs/core.lisp")
   :BYTES 5909 :SHA256
   "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399")
  (:PATH "raw/mutations/6/src/epochs/package.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/epochs/package.lisp")
   :BYTES 779 :SHA256
   "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd")
  (:PATH "raw/mutations/6/src/epochs/read.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/epochs/read.lisp")
   :BYTES 3240 :SHA256
   "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905")
  (:PATH "raw/mutations/6/src/epochs/reclaim.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/epochs/reclaim.lisp")
   :BYTES 6373 :SHA256
   "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202")
  (:PATH "raw/mutations/6/src/epochs/retire.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/epochs/retire.lisp")
   :BYTES 5858 :SHA256
   "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b")
  (:PATH "raw/mutations/6/src/epochs/types.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/epochs/types.lisp")
   :BYTES 5304 :SHA256
   "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097")
  (:PATH "raw/mutations/6/src/execution/handoff.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/execution/handoff.lisp")
   :BYTES 7394 :SHA256
   "ee90c809ef51134efa21e08b819e5530304efaf9f9e26b63c7e4afbf6d48e607")
  (:PATH "raw/mutations/6/src/execution/package.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/execution/package.lisp")
   :BYTES 1157 :SHA256
   "bbe8cdb6f7e74d7139f5e472a915cc74b43e34bd27ecac1c5fd364f723a2a643")
  (:PATH "raw/mutations/6/src/execution/queue.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/execution/queue.lisp")
   :BYTES 5374 :SHA256
   "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90")
  (:PATH "raw/mutations/6/src/execution/ready-recycle.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/execution/ready-recycle.lisp")
   :BYTES 3387 :SHA256
   "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b")
  (:PATH "raw/mutations/6/src/execution/ready-types.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/execution/ready-types.lisp")
   :BYTES 5248 :SHA256
   "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f")
  (:PATH "raw/mutations/6/src/execution/ready.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/execution/ready.lisp")
   :BYTES 6635 :SHA256
   "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327")
  (:PATH "raw/mutations/6/src/execution/worker-boundary.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/execution/worker-boundary.lisp")
   :BYTES 2309 :SHA256
   "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a")
  (:PATH "raw/mutations/6/src/execution/worker-claim.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/execution/worker-claim.lisp")
   :BYTES 6401 :SHA256
   "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e")
  (:PATH "raw/mutations/6/src/execution/worker-run.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/execution/worker-run.lisp")
   :BYTES 5124 :SHA256
   "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542")
  (:PATH "raw/mutations/6/src/execution/worker-types.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/execution/worker-types.lisp")
   :BYTES 8461 :SHA256
   "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317")
  (:PATH "raw/mutations/6/src/execution/writer.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/execution/writer.lisp")
   :BYTES 6484 :SHA256
   "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105")
  (:PATH "raw/mutations/6/src/foundation/batch.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH "raw/mutations/6/src/foundation/binary.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH "raw/mutations/6/src/foundation/conditions.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH "raw/mutations/6/src/foundation/crc32c.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH "raw/mutations/6/src/foundation/package.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH "raw/mutations/6/src/foundation/record.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH "raw/mutations/6/src/get-resolver/build.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/get-resolver/build.lisp")
   :BYTES 6882 :SHA256
   "3715cb750e08ab30fcaa068a05b17772381a3cf1975bdbdd0c03f71761089ef6")
  (:PATH "raw/mutations/6/src/get-resolver/package.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/get-resolver/package.lisp")
   :BYTES 1887 :SHA256
   "f244c1346604ccde93880824ea990a4a7329340df6c8b665963713977ca0ee10")
  (:PATH "raw/mutations/6/src/get-resolver/read.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/get-resolver/read.lisp")
   :BYTES 7259 :SHA256
   "68f82df01f7894f66db0c6545267616e76c0ba93fd7c49db6434cec666f02dc3")
  (:PATH "raw/mutations/6/src/get-resolver/rows.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/get-resolver/rows.lisp")
   :BYTES 3350 :SHA256
   "d9db85d788006fc7ad1f9a7cdeef28b992605de7fac8c295dd7fdc51f5511854")
  (:PATH "raw/mutations/6/src/get-resolver/scan.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/get-resolver/scan.lisp")
   :BYTES 6786 :SHA256
   "35a1780c6bf66364ef94c4151fa91f02eebe359f0ca0639985d2a907fd9d512d")
  (:PATH "raw/mutations/6/src/get-resolver/sort.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/get-resolver/sort.lisp")
   :BYTES 7118 :SHA256
   "974bf44efeb1cd26c5e9db0601aea295c8f1a18234894ad9d41938a2880e2255")
  (:PATH "raw/mutations/6/src/get-resolver/types.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/get-resolver/types.lisp")
   :BYTES 1757 :SHA256
   "1334512380bfb01add33b0ca152c0ce4746b3f79bcd04f84d7844ef234d6eaba")
  (:PATH "raw/mutations/6/src/get/build.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/get/build.lisp")
   :BYTES 3745 :SHA256
   "bcfc4916e9a85833dc151c4ce176bc905f2c03b6bc6d636f97a60df0d8c16739")
  (:PATH "raw/mutations/6/src/get/lifecycle.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/get/lifecycle.lisp")
   :BYTES 5345 :SHA256
   "885ba4141114ea411cac37c9b5f924aaa7f9f2a5ba311ebf92a392e5da1e3c59")
  (:PATH "raw/mutations/6/src/get/lookup.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/get/lookup.lisp")
   :BYTES 4352 :SHA256
   "9d1042d4cf1e7bd9c6d1153de12b2459e7a2724e47bd32534cd7ae56cb274c5f")
  (:PATH "raw/mutations/6/src/get/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/get/package.lisp")
   :BYTES 1995 :SHA256
   "87b795779aef0c4b918a039d182daddd22b902a9ad10c763df4364b7e630151c")
  (:PATH "raw/mutations/6/src/get/segment.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/get/segment.lisp")
   :BYTES 8097 :SHA256
   "4a486528cb2c1cc3471cb4b332d4314d24011889e1f885db6fd5600bb077eea3")
  (:PATH "raw/mutations/6/src/get/target.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/get/target.lisp")
   :BYTES 5652 :SHA256
   "9f682f735e49108cad176a6143ec99e1be64da98f29cae0b52f9b49cdea34250")
  (:PATH "raw/mutations/6/src/get/types.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/get/types.lisp")
   :BYTES 4413 :SHA256
   "653b23a6e719cd1f55e7c58b4d7e8143aec5983992ba210d0eac1f4c8682f623")
  (:PATH "raw/mutations/6/src/hash/arithmetic.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/hash/arithmetic.lisp")
   :BYTES 3073 :SHA256
   "c439e534b768acb123d69b921b85e1e56683aa8335bbc87efba95fe95f256fa9")
  (:PATH "raw/mutations/6/src/hash/blocks.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/hash/blocks.lisp")
   :BYTES 3262 :SHA256
   "5f5dff95ae6c34dfc15538c537ba2fa8d34ba2376ad66ad9975745ea13a2175f")
  (:PATH "raw/mutations/6/src/hash/hash64.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/hash/hash64.lisp")
   :BYTES 1768 :SHA256
   "99e4c8394a8f877ce1f552f15a57a082c0ec81015e87119ee4ffea28cf3ae77f")
  (:PATH "raw/mutations/6/src/hash/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/hash/package.lisp")
   :BYTES 477 :SHA256
   "1e7668fa26fc1a8e3b3cfe824aa3e08b30b57441d5f90d44453fc3a9259a10d0")
  (:PATH "raw/mutations/6/src/index/core.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/index/core.lisp")
   :BYTES 2959 :SHA256
   "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff")
  (:PATH "raw/mutations/6/src/index/hash-digests.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/index/hash-digests.lisp")
   :BYTES 3674 :SHA256
   "924bb7dab91ff56c1e909f2b06dff5f74b443ac6442e379498f29b25f1fa2673")
  (:PATH "raw/mutations/6/src/index/hash-seed.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/index/hash-seed.lisp")
   :BYTES 2437 :SHA256
   "ae86514101e95737747ba58a4f0c5dc1ddb44d2b3a18bceb8fd0d0756b57a7a1")
  (:PATH "raw/mutations/6/src/index/package.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/index/package.lisp")
   :BYTES 727 :SHA256
   "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507")
  (:PATH "raw/mutations/6/src/index/primary-arena.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/index/primary-arena.lisp")
   :BYTES 3485 :SHA256
   "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5")
  (:PATH "raw/mutations/6/src/index/primary-build.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/index/primary-build.lisp")
   :BYTES 5379 :SHA256
   "06ca5ac8c03504e2d2f973873e5cabf7518c090cd1f8f2118c46e0ea2f9bf37b")
  (:PATH "raw/mutations/6/src/index/primary-core.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/index/primary-core.lisp")
   :BYTES 4211 :SHA256
   "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e")
  (:PATH "raw/mutations/6/src/index/primary-directory.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/index/primary-directory.lisp")
   :BYTES 8114 :SHA256
   "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd")
  (:PATH "raw/mutations/6/src/index/primary-package.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/index/primary-package.lisp")
   :BYTES 1451 :SHA256
   "0682eb9a61596506b6788bd0285f9808db2496246caae64ab3203182ed46b860")
  (:PATH "raw/mutations/6/src/index/primary-probe.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/index/primary-probe.lisp")
   :BYTES 5936 :SHA256
   "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4")
  (:PATH "raw/mutations/6/src/index/primary-read.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/index/primary-read.lisp")
   :BYTES 3575 :SHA256
   "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f")
  (:PATH "raw/mutations/6/src/index/primary-relocate.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/index/primary-relocate.lisp")
   :BYTES 4073 :SHA256
   "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20")
  (:PATH "raw/mutations/6/src/index/primary-types.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/index/primary-types.lisp")
   :BYTES 3949 :SHA256
   "f17ca0dcd8a538b921f00044e23872b28272638c4435eacd30f0509422505e64")
  (:PATH "raw/mutations/6/src/index/primary-write.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/index/primary-write.lisp")
   :BYTES 7061 :SHA256
   "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655")
  (:PATH "raw/mutations/6/src/index/read.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/index/read.lisp")
   :BYTES 3030 :SHA256
   "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7")
  (:PATH "raw/mutations/6/src/index/rebuild-budget.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/index/rebuild-budget.lisp")
   :BYTES 3593 :SHA256
   "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0")
  (:PATH "raw/mutations/6/src/index/rebuild-copy.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/index/rebuild-copy.lisp")
   :BYTES 4027 :SHA256
   "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee")
  (:PATH "raw/mutations/6/src/index/rebuild-scan.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/index/rebuild-scan.lisp")
   :BYTES 5002 :SHA256
   "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e")
  (:PATH "raw/mutations/6/src/index/rebuild.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/index/rebuild.lisp")
   :BYTES 2872 :SHA256
   "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1")
  (:PATH "raw/mutations/6/src/index/relocate.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/index/relocate.lisp")
   :BYTES 2383 :SHA256
   "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc")
  (:PATH "raw/mutations/6/src/index/types.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/index/types.lisp")
   :BYTES 2434 :SHA256
   "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e")
  (:PATH "raw/mutations/6/src/index/validation.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/index/validation.lisp")
   :BYTES 3930 :SHA256
   "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a")
  (:PATH "raw/mutations/6/src/index/write.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/index/write.lisp")
   :BYTES 4784 :SHA256
   "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28")
  (:PATH "raw/mutations/6/src/io/flush.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/io/flush.lisp")
   :BYTES 1569 :SHA256
   "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325")
  (:PATH "raw/mutations/6/src/io/lifecycle.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/io/lifecycle.lisp")
   :BYTES 4536 :SHA256
   "baa1f763fe0f394a14d381b753dcb1be1e90eb03eaff5d6469465b5d4eca015f")
  (:PATH "raw/mutations/6/src/io/native.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/io/native.lisp")
   :BYTES 5026 :SHA256
   "b8cf3ce1ff7b4fa9def8a602ab768c0e9a321f8d6cdce6e5b2b7ded2fe3d97dd")
  (:PATH "raw/mutations/6/src/io/package.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/io/package.lisp")
   :BYTES 592 :SHA256
   "118eba04ab2aa87a2d86e0b0269dbeacaa485457acebbc12c57317ae465a89c0")
  (:PATH "raw/mutations/6/src/io/transfer.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/io/transfer.lisp")
   :BYTES 5051 :SHA256
   "3748328cf85e1c007900a63bdd0f159f38a8d7cd3577c92c56fc68692b9b7bcf")
  (:PATH "raw/mutations/6/src/io/types.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/io/types.lisp")
   :BYTES 4143 :SHA256
   "50c7eeea91af232fca7103ce5a25535958d73836f01cb45a20c7120b88b1336b")
  (:PATH "raw/mutations/6/src/mvcc/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/mvcc/package.lisp")
   :BYTES 833 :SHA256
   "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c")
  (:PATH "raw/mutations/6/src/mvcc/snapshots-core.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/mvcc/snapshots-core.lisp")
   :BYTES 7622 :SHA256
   "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998")
  (:PATH "raw/mutations/6/src/mvcc/snapshots-csn.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/mvcc/snapshots-csn.lisp")
   :BYTES 2725 :SHA256
   "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77")
  (:PATH "raw/mutations/6/src/mvcc/snapshots-lifecycle.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/mvcc/snapshots-lifecycle.lisp")
   :BYTES 6609 :SHA256
   "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082")
  (:PATH "raw/mutations/6/src/mvcc/snapshots-read.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/mvcc/snapshots-read.lisp")
   :BYTES 6651 :SHA256
   "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9")
  (:PATH "raw/mutations/6/src/mvcc/snapshots-register.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/mvcc/snapshots-register.lisp")
   :BYTES 6654 :SHA256
   "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b")
  (:PATH "raw/mutations/6/src/mvcc/snapshots-types.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/mvcc/snapshots-types.lisp")
   :BYTES 3817 :SHA256
   "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f")
  (:PATH "raw/mutations/6/src/mvcc/types.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/mvcc/types.lisp")
   :BYTES 471 :SHA256
   "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50")
  (:PATH "raw/mutations/6/src/package.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH "raw/mutations/6/src/read/core.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/read/core.lisp")
   :BYTES 3846 :SHA256
   "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f")
  (:PATH "raw/mutations/6/src/read/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/read/package.lisp")
   :BYTES 831 :SHA256
   "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df")
  (:PATH "raw/mutations/6/src/read/task.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/read/task.lisp")
   :BYTES 5073 :SHA256
   "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2")
  (:PATH "raw/mutations/6/src/read/types.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/read/types.lisp")
   :BYTES 2358 :SHA256
   "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c")
  (:PATH "raw/mutations/6/src/recovery/decisions-build.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/recovery/decisions-build.lisp")
   :BYTES 11857 :SHA256
   "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115")
  (:PATH "raw/mutations/6/src/recovery/decisions-package.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/recovery/decisions-package.lisp")
   :BYTES 818 :SHA256
   "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39")
  (:PATH "raw/mutations/6/src/recovery/decisions-query.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/recovery/decisions-query.lisp")
   :BYTES 4525 :SHA256
   "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24")
  (:PATH "raw/mutations/6/src/recovery/decisions-radix.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/recovery/decisions-radix.lisp")
   :BYTES 11061 :SHA256
   "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54")
  (:PATH "raw/mutations/6/src/recovery/decisions-sort.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/recovery/decisions-sort.lisp")
   :BYTES 7654 :SHA256
   "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2")
  (:PATH "raw/mutations/6/src/recovery/decisions-types.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/recovery/decisions-types.lisp")
   :BYTES 2056 :SHA256
   "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c")
  (:PATH "raw/mutations/6/src/recovery/inventory-build.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/recovery/inventory-build.lisp")
   :BYTES 9592 :SHA256
   "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e")
  (:PATH "raw/mutations/6/src/recovery/inventory-query.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/recovery/inventory-query.lisp")
   :BYTES 2100 :SHA256
   "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb")
  (:PATH "raw/mutations/6/src/recovery/inventory-types.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/recovery/inventory-types.lisp")
   :BYTES 2392 :SHA256
   "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9")
  (:PATH "raw/mutations/6/src/recovery/manifest-build.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/recovery/manifest-build.lisp")
   :BYTES 10251 :SHA256
   "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471")
  (:PATH "raw/mutations/6/src/recovery/manifest-decode.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/recovery/manifest-decode.lisp")
   :BYTES 6160 :SHA256
   "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779")
  (:PATH "raw/mutations/6/src/recovery/manifest-fold.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/recovery/manifest-fold.lisp")
   :BYTES 7068 :SHA256
   "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730")
  (:PATH "raw/mutations/6/src/recovery/manifest-package.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/recovery/manifest-package.lisp")
   :BYTES 1372 :SHA256
   "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc")
  (:PATH "raw/mutations/6/src/recovery/manifest-query.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/recovery/manifest-query.lisp")
   :BYTES 3582 :SHA256
   "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b")
  (:PATH "raw/mutations/6/src/recovery/manifest-types.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/recovery/manifest-types.lisp")
   :BYTES 3345 :SHA256
   "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10")
  (:PATH "raw/mutations/6/src/recovery/package.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/recovery/package.lisp")
   :BYTES 927 :SHA256
   "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9")
  (:PATH "raw/mutations/6/src/recovery/scan.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/recovery/scan.lisp")
   :BYTES 12829 :SHA256
   "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218")
  (:PATH "raw/mutations/6/src/series/events.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/series/events.lisp")
   :BYTES 9566 :SHA256
   "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7")
  (:PATH "raw/mutations/6/src/series/io-events.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/series/io-events.lisp")
   :BYTES 5385 :SHA256
   "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546")
  (:PATH "raw/mutations/6/src/series/ownership.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/series/ownership.lisp")
   :BYTES 8810 :SHA256
   "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4")
  (:PATH "raw/mutations/6/src/series/package.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/series/package.lisp")
   :BYTES 1392 :SHA256
   "7433162105df63d324141167e6dcf6bfee74611aa1cf7291cc6c92f41f3c7408")
  (:PATH "raw/mutations/6/src/series/publication.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/series/publication.lisp")
   :BYTES 6094 :SHA256
   "288cb3fa41fad76a0e6919dfa0b2fce2beef15f5880129393bee35bc8795c762")
  (:PATH "raw/mutations/6/src/series/query.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/series/query.lisp")
   :BYTES 3600 :SHA256
   "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9")
  (:PATH "raw/mutations/6/src/series/retirement.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/series/retirement.lisp")
   :BYTES 4634 :SHA256
   "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059")
  (:PATH "raw/mutations/6/src/series/types.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/series/types.lisp")
   :BYTES 3316 :SHA256
   "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9")
  (:PATH "raw/mutations/6/src/series/worker-boundary.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/series/worker-boundary.lisp")
   :BYTES 3443 :SHA256
   "793d401d1b9acc7b67923d815560f277f3d390ca050740f735f07d88dbacfe73")
  (:PATH "raw/mutations/6/src/series/worker-package.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/series/worker-package.lisp")
   :BYTES 1036 :SHA256
   "881a2958ddb8f5781954d4c59d7467e34c03c01fbb2fea43dc06e9e2050a1f37")
  (:PATH "raw/mutations/6/src/series/worker-run.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/series/worker-run.lisp")
   :BYTES 6985 :SHA256
   "f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f")
  (:PATH "raw/mutations/6/src/series/worker-types.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/series/worker-types.lisp")
   :BYTES 6493 :SHA256
   "a366799fd9b938bfaa48b0ffda228ff8369ab9acb5b5ead7f081dfc66ab2c81a")
  (:PATH "raw/mutations/6/src/storage/compaction-scan.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/storage/compaction-scan.lisp")
   :BYTES 5510 :SHA256
   "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d")
  (:PATH "raw/mutations/6/src/storage/control-payload.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/storage/control-payload.lisp")
   :BYTES 6273 :SHA256
   "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491")
  (:PATH "raw/mutations/6/src/storage/formats.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/storage/formats.lisp")
   :BYTES 3841 :SHA256
   "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f")
  (:PATH "raw/mutations/6/src/storage/log-header.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/storage/log-header.lisp")
   :BYTES 3947 :SHA256
   "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81")
  (:PATH "raw/mutations/6/src/storage/package.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/storage/package.lisp")
   :BYTES 1079 :SHA256
   "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e")
  (:PATH "raw/mutations/6/src/storage/payload-record.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/storage/payload-record.lisp")
   :BYTES 3641 :SHA256
   "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7")
  (:PATH "raw/mutations/6/src/storage/payload-write.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/storage/payload-write.lisp")
   :BYTES 5239 :SHA256
   "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc")
  (:PATH "raw/mutations/6/src/storage/segment-header.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/storage/segment-header.lisp")
   :BYTES 5517 :SHA256
   "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011")
  (:PATH "raw/mutations/6/src/wal/builder.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/wal/builder.lisp")
   :BYTES 8445 :SHA256
   "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0")
  (:PATH "raw/mutations/6/src/wal/csn.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/wal/csn.lisp")
   :BYTES 9577 :SHA256
   "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810")
  (:PATH "raw/mutations/6/src/wal/executor.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/wal/executor.lisp")
   :BYTES 6023 :SHA256
   "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8")
  (:PATH "raw/mutations/6/src/wal/group.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/wal/group.lisp")
   :BYTES 6305 :SHA256
   "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b")
  (:PATH "raw/mutations/6/src/wal/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/wal/package.lisp")
   :BYTES 1774 :SHA256
   "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89")
  (:PATH "raw/mutations/6/src/wal/types.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/src/wal/types.lisp")
   :BYTES 5420 :SHA256
   "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e")
  (:PATH "raw/mutations/6/test.log" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/test.log")
   :BYTES 25429 :SHA256
   "e6fca97134acb741cd5271679cd4d5b785e4d84fa8675922d98ced9461026183")
  (:PATH "raw/mutations/6/tests/codec/cbor-header.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/codec/cbor-header.lisp")
   :BYTES 10773 :SHA256
   "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815")
  (:PATH "raw/mutations/6/tests/codec/cbor-minimal-edges.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/codec/cbor-minimal-edges.lisp")
   :BYTES 1613 :SHA256
   "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70")
  (:PATH "raw/mutations/6/tests/codec/cbor-minimal-scan-support.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/codec/cbor-minimal-scan-support.lisp")
   :BYTES 8363 :SHA256
   "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421")
  (:PATH "raw/mutations/6/tests/codec/cbor-minimal-scan-threads.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/codec/cbor-minimal-scan-threads.lisp")
   :BYTES 4547 :SHA256
   "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660")
  (:PATH "raw/mutations/6/tests/codec/cbor-minimal-scan.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/codec/cbor-minimal-scan.lisp")
   :BYTES 19217 :SHA256
   "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8")
  (:PATH "raw/mutations/6/tests/codec/cbor-minimal-support.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/codec/cbor-minimal-support.lisp")
   :BYTES 8620 :SHA256
   "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a")
  (:PATH "raw/mutations/6/tests/codec/cbor-minimal-threads.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/codec/cbor-minimal-threads.lisp")
   :BYTES 3799 :SHA256
   "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2")
  (:PATH "raw/mutations/6/tests/codec/cbor-minimal.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/codec/cbor-minimal.lisp")
   :BYTES 12604 :SHA256
   "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3")
  (:PATH "raw/mutations/6/tests/codec/cbor-simple-write-support.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/codec/cbor-simple-write-support.lisp")
   :BYTES 4955 :SHA256
   "53ceafc72a027a2ff1f787900558ff26f2ff70bbb212f1b37926a6d520fbe86e")
  (:PATH "raw/mutations/6/tests/codec/cbor-simple-write-threads.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/codec/cbor-simple-write-threads.lisp")
   :BYTES 3561 :SHA256
   "77074033e75a224fd02e890f98dffa8e97d3a1f8bedd510b00ea55d8ff8687b2")
  (:PATH "raw/mutations/6/tests/codec/cbor-simple-write.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/codec/cbor-simple-write.lisp")
   :BYTES 10712 :SHA256
   "958bdd3901cfc41032c09d6c9023b192799981884e09ce3573256ff45bc5329a")
  (:PATH "raw/mutations/6/tests/codec/cbor-string-write-support.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/codec/cbor-string-write-support.lisp")
   :BYTES 6868 :SHA256
   "2cbdb601f442a56456bc637c94e759cc965f44b178268dce3c636c385d34fc39")
  (:PATH "raw/mutations/6/tests/codec/cbor-string-write-threads.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/codec/cbor-string-write-threads.lisp")
   :BYTES 3512 :SHA256
   "8e07b881a55e2554a429f1c8b2c69f67862ac015217d90d019167d636564d27d")
  (:PATH "raw/mutations/6/tests/codec/cbor-string-write.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/codec/cbor-string-write.lisp")
   :BYTES 15883 :SHA256
   "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115")
  (:PATH "raw/mutations/6/tests/codec/cbor-structure-support.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:PATH "raw/mutations/6/tests/codec/cbor-structure-threads.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/codec/cbor-structure-threads.lisp")
   :BYTES 4305 :SHA256
   "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645")
  (:PATH "raw/mutations/6/tests/codec/cbor-structure.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/codec/cbor-structure.lisp")
   :BYTES 22968 :SHA256
   "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110")
  (:PATH "raw/mutations/6/tests/codec/cbor-support.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:PATH "raw/mutations/6/tests/codec/cbor-threads.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/codec/cbor-threads.lisp")
   :BYTES 3683 :SHA256
   "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14")
  (:PATH "raw/mutations/6/tests/codec/cbor-write-roundtrip.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/codec/cbor-write-roundtrip.lisp")
   :BYTES 901 :SHA256
   "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344")
  (:PATH "raw/mutations/6/tests/codec/cbor-write-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/codec/cbor-write-support.lisp")
   :BYTES 4768 :SHA256
   "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6")
  (:PATH "raw/mutations/6/tests/codec/cbor-write-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/codec/cbor-write-threads.lisp")
   :BYTES 3813 :SHA256
   "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb")
  (:PATH "raw/mutations/6/tests/codec/cbor-write.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/codec/cbor-write.lisp")
   :BYTES 9822 :SHA256
   "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3")
  (:PATH "raw/mutations/6/tests/codec/support.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/codec/support.lisp")
   :BYTES 5807 :SHA256
   "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96")
  (:PATH "raw/mutations/6/tests/codec/threads.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/codec/threads.lisp")
   :BYTES 3111 :SHA256
   "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337")
  (:PATH "raw/mutations/6/tests/codec/utf8.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/codec/utf8.lisp")
   :BYTES 12892 :SHA256
   "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100")
  (:PATH "raw/mutations/6/tests/csn/registry.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/csn/registry.lisp")
   :BYTES 19411 :SHA256
   "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950")
  (:PATH "raw/mutations/6/tests/csn/support.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/csn/support.lisp")
   :BYTES 11407 :SHA256
   "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db")
  (:PATH "raw/mutations/6/tests/csn/threads.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/csn/threads.lisp")
   :BYTES 10525 :SHA256
   "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2")
  (:PATH "raw/mutations/6/tests/epochs/lifecycle.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/epochs/lifecycle.lisp")
   :BYTES 25394 :SHA256
   "ddc2fbdad9f97d2e4ff008c167776a50b17b742398306fbd5198dca474559cbf")
  (:PATH "raw/mutations/6/tests/epochs/support.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/epochs/support.lisp")
   :BYTES 5943 :SHA256
   "366be7af4bf6c4ed946b3fa9e97aea6b034c83e3b757d81c54078dc76d229b6d")
  (:PATH "raw/mutations/6/tests/epochs/threads.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/epochs/threads.lisp")
   :BYTES 3654 :SHA256
   "54b73e06c61e64f32a3e3af0791891dacb6590e929163dcf0fac95f2c71e66fd")
  (:PATH "raw/mutations/6/tests/execution/handoff.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/execution/handoff.lisp")
   :BYTES 33278 :SHA256
   "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e")
  (:PATH "raw/mutations/6/tests/execution/queue.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/execution/queue.lisp")
   :BYTES 12894 :SHA256
   "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722")
  (:PATH "raw/mutations/6/tests/execution/ready-recycle.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/execution/ready-recycle.lisp")
   :BYTES 30075 :SHA256
   "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae")
  (:PATH "raw/mutations/6/tests/execution/ready.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/execution/ready.lisp")
   :BYTES 33555 :SHA256
   "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e")
  (:PATH "raw/mutations/6/tests/execution/support.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/execution/support.lisp")
   :BYTES 4469 :SHA256
   "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43")
  (:PATH "raw/mutations/6/tests/execution/threads.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/execution/threads.lisp")
   :BYTES 14622 :SHA256
   "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359")
  (:PATH "raw/mutations/6/tests/execution/worker.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/execution/worker.lisp")
   :BYTES 59783 :SHA256
   "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06")
  (:PATH "raw/mutations/6/tests/foundation/batch.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/foundation/batch.lisp")
   :BYTES 5185 :SHA256
   "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183")
  (:PATH "raw/mutations/6/tests/foundation/binary.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/foundation/binary.lisp")
   :BYTES 3721 :SHA256
   "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe")
  (:PATH "raw/mutations/6/tests/foundation/record.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/foundation/record.lisp")
   :BYTES 14950 :SHA256
   "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8")
  (:PATH "raw/mutations/6/tests/foundation/support.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:PATH "raw/mutations/6/tests/get-performance/guards.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/get-performance/guards.lisp")
   :BYTES 8986 :SHA256
   "c41721b917ed443355ea3707efdd07e7da53a978c0515ab1e5ede5fcc47d63fc")
  (:PATH "raw/mutations/6/tests/get-performance/paths.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/get-performance/paths.lisp")
   :BYTES 4936 :SHA256
   "3b8d2c9c93467507ea2bb471d42192eb1fa084b55c0f4263b5ef0d3acf468f55")
  (:PATH "raw/mutations/6/tests/get-performance/support.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/get-performance/support.lisp")
   :BYTES 22497 :SHA256
   "e586ed94dcb2aaba00282931cdd83313e4f84a86d4d1ba85e2d56e8b7433ed8d")
  (:PATH "raw/mutations/6/tests/get-performance/threads.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/get-performance/threads.lisp")
   :BYTES 4744 :SHA256
   "05ace5eb351ab49da59611dc1a2a5abedb9d723a2fc6e75a30fc76e507573a90")
  (:PATH "raw/mutations/6/tests/hash/guards.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/hash/guards.lisp")
   :BYTES 1162 :SHA256
   "9af5b38443a57d224990a68e93f12f7a4cda306f94c7ccd3ccb50635865d7864")
  (:PATH "raw/mutations/6/tests/hash/hash64.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/hash/hash64.lisp")
   :BYTES 17948 :SHA256
   "70606bc68807143cfea9583871474c84efc868d13692cde28488284dee43e0f1")
  (:PATH "raw/mutations/6/tests/hash/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/hash/support.lisp")
   :BYTES 10828 :SHA256
   "0fae9dc36976af544f83e6051b9cf9d67c9bef0b9e25f1fa2a48fdac48592acb")
  (:PATH "raw/mutations/6/tests/hash/threads.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/hash/threads.lisp")
   :BYTES 6701 :SHA256
   "3fc587a57d26a294aebfc6a7aeadf2f61a42a21106c1c57517f891b76b4e750a")
  (:PATH "raw/mutations/6/tests/index/hash-digests.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/index/hash-digests.lisp")
   :BYTES 35926 :SHA256
   "3b3b39f861883cf2017cab8e6488560a6bb3897d63784f00e820a6450d743225")
  (:PATH "raw/mutations/6/tests/index/primary-support.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/index/primary-support.lisp")
   :BYTES 13938 :SHA256
   "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a")
  (:PATH "raw/mutations/6/tests/index/primary-threads.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/index/primary-threads.lisp")
   :BYTES 13744 :SHA256
   "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2")
  (:PATH "raw/mutations/6/tests/index/primary.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/index/primary.lisp")
   :BYTES 30166 :SHA256
   "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696")
  (:PATH "raw/mutations/6/tests/index/rebuild.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/index/rebuild.lisp")
   :BYTES 32112 :SHA256
   "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1")
  (:PATH "raw/mutations/6/tests/index/slot-support.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/index/slot-support.lisp")
   :BYTES 12800 :SHA256
   "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31")
  (:PATH "raw/mutations/6/tests/index/slot-threads.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/index/slot-threads.lisp")
   :BYTES 11698 :SHA256
   "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f")
  (:PATH "raw/mutations/6/tests/index/slots.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/index/slots.lisp")
   :BYTES 26420 :SHA256
   "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb")
  (:PATH "raw/mutations/6/tests/io/native.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/io/native.lisp")
   :BYTES 6207 :SHA256
   "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0")
  (:PATH "raw/mutations/6/tests/io/support.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/io/support.lisp")
   :BYTES 2951 :SHA256
   "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50")
  (:PATH "raw/mutations/6/tests/io/transfer.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/io/transfer.lisp")
   :BYTES 11847 :SHA256
   "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd")
  (:PATH "raw/mutations/6/tests/lint-fixtures/bad.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/lint-fixtures/bad.lisp")
   :BYTES 1587 :SHA256
   "ac8912ce6cc1101f2ebc305a50c0565879547b527d7ca0aeac900ee06bf26652")
  (:PATH "raw/mutations/6/tests/lint-fixtures/good.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/lint-fixtures/good.lisp")
   :BYTES 671 :SHA256
   "05ce84f8fd12d9af48252601bcc92d6d60335b53f39b01a9fe2697c4bdaa8cee")
  (:PATH "raw/mutations/6/tests/lint-fixtures/keyword-barrier.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/lint-fixtures/keyword-barrier.lisp")
   :BYTES 199 :SHA256
   "e26dab117e9526ace35bb45b92f977065d33fcc4404c40fd4fc3c77749689a96")
  (:PATH "raw/mutations/6/tests/lint-fixtures/qualified-reader.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/lint-fixtures/qualified-reader.lisp")
   :BYTES 152 :SHA256
   "835229bdc1a0ed0c08511cd6121e1f1bc4284da2cfba951b72cd1a74a6040d35")
  (:PATH "raw/mutations/6/tests/mvcc/capture.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/mvcc/capture.lisp")
   :BYTES 16356 :SHA256
   "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35")
  (:PATH "raw/mutations/6/tests/mvcc/lifecycle.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/mvcc/lifecycle.lisp")
   :BYTES 23964 :SHA256
   "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16")
  (:PATH "raw/mutations/6/tests/mvcc/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/mvcc/support.lisp")
   :BYTES 5931 :SHA256
   "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290")
  (:PATH "raw/mutations/6/tests/read/lifecycle.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/read/lifecycle.lisp")
   :BYTES 17804 :SHA256
   "c4c4642408816f2e0e809e21d04739b68b9391237e3e46ea0b195ed82857c3a8")
  (:PATH "raw/mutations/6/tests/read/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/read/support.lisp")
   :BYTES 4845 :SHA256
   "8095cc39d49342f6e43f3421b4fced839da02d8d11b4d8ddcd91bd346447e754")
  (:PATH "raw/mutations/6/tests/read/threads.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/read/threads.lisp")
   :BYTES 4150 :SHA256
   "e2e223b69b08a5d76b9773c6ad4dee13ef2ddbb6f5ababa713cc5654bc7b51c5")
  (:PATH "raw/mutations/6/tests/recovery/corruption.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/recovery/corruption.lisp")
   :BYTES 7106 :SHA256
   "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c")
  (:PATH "raw/mutations/6/tests/recovery/decisions-audit.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/recovery/decisions-audit.lisp")
   :BYTES 14971 :SHA256
   "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0")
  (:PATH "raw/mutations/6/tests/recovery/decisions-radix.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/recovery/decisions-radix.lisp")
   :BYTES 27851 :SHA256
   "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0")
  (:PATH "raw/mutations/6/tests/recovery/decisions-support.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/recovery/decisions-support.lisp")
   :BYTES 6797 :SHA256
   "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4")
  (:PATH "raw/mutations/6/tests/recovery/decisions.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/recovery/decisions.lisp")
   :BYTES 19149 :SHA256
   "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e")
  (:PATH "raw/mutations/6/tests/recovery/inventory-support.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/recovery/inventory-support.lisp")
   :BYTES 8083 :SHA256
   "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27")
  (:PATH "raw/mutations/6/tests/recovery/inventory.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/recovery/inventory.lisp")
   :BYTES 14479 :SHA256
   "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9")
  (:PATH "raw/mutations/6/tests/recovery/manifest-audit.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/recovery/manifest-audit.lisp")
   :BYTES 17670 :SHA256
   "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6")
  (:PATH "raw/mutations/6/tests/recovery/manifest-support.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/recovery/manifest-support.lisp")
   :BYTES 9769 :SHA256
   "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830")
  (:PATH "raw/mutations/6/tests/recovery/manifest.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/recovery/manifest.lisp")
   :BYTES 13799 :SHA256
   "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd")
  (:PATH "raw/mutations/6/tests/recovery/scan.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/recovery/scan.lisp")
   :BYTES 16966 :SHA256
   "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b")
  (:PATH "raw/mutations/6/tests/recovery/support.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/recovery/support.lisp")
   :BYTES 5957 :SHA256
   "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204")
  (:PATH "raw/mutations/6/tests/series/boundaries.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/series/boundaries.lisp")
   :BYTES 5802 :SHA256
   "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8")
  (:PATH "raw/mutations/6/tests/series/controller.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/series/controller.lisp")
   :BYTES 60484 :SHA256
   "4bea80eb231575f48b208ddb57af6a11706481e0ec755b084f6cd4b6fd0481a1")
  (:PATH "raw/mutations/6/tests/series/support.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/series/support.lisp")
   :BYTES 16885 :SHA256
   "8821ae9e002941eff8ea3ae7dbfc727cb6874b68d2d1ef85af668eb2d34a0c0c")
  (:PATH "raw/mutations/6/tests/series/threads.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/series/threads.lisp")
   :BYTES 19694 :SHA256
   "bbea64d207d14698b39ab0f8ded03db11bab09955d3f66705c23d69c09aefc8e")
  (:PATH "raw/mutations/6/tests/series/worker-bridge.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/series/worker-bridge.lisp")
   :BYTES 56677 :SHA256
   "c1ee49702e63978a83cb86c4e5bf437a5a40e48fa02b65d3eaf3dca0d2e39176")
  (:PATH "raw/mutations/6/tests/smoke.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/smoke.lisp")
   :BYTES 735 :SHA256
   "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8")
  (:PATH "raw/mutations/6/tests/storage/compaction-scan.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/storage/compaction-scan.lisp")
   :BYTES 16196 :SHA256
   "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5")
  (:PATH "raw/mutations/6/tests/storage/control-payload.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/storage/control-payload.lisp")
   :BYTES 12651 :SHA256
   "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae")
  (:PATH "raw/mutations/6/tests/storage/log-header.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/storage/log-header.lisp")
   :BYTES 11969 :SHA256
   "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e")
  (:PATH "raw/mutations/6/tests/storage/segment-header.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/storage/segment-header.lisp")
   :BYTES 4149 :SHA256
   "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df")
  (:PATH "raw/mutations/6/tests/storage/support.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/storage/support.lisp")
   :BYTES 4029 :SHA256
   "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625")
  (:PATH "raw/mutations/6/tests/wal/builder.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/wal/builder.lisp")
   :BYTES 4000 :SHA256
   "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6")
  (:PATH "raw/mutations/6/tests/wal/csn-threads.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/wal/csn-threads.lisp")
   :BYTES 12114 :SHA256
   "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c")
  (:PATH "raw/mutations/6/tests/wal/csn.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/wal/csn.lisp")
   :BYTES 34661 :SHA256
   "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a")
  (:PATH "raw/mutations/6/tests/wal/fault.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/wal/fault.lisp")
   :BYTES 7614 :SHA256
   "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875")
  (:PATH "raw/mutations/6/tests/wal/group.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/wal/group.lisp")
   :BYTES 5524 :SHA256
   "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e")
  (:PATH "raw/mutations/6/tests/wal/native.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/wal/native.lisp")
   :BYTES 2567 :SHA256
   "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7")
  (:PATH "raw/mutations/6/tests/wal/support.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tests/wal/support.lisp")
   :BYTES 1951 :SHA256
   "90a47539e5e2898c0a08059207f30bb5551e7ca8fc166f8f6ce7b95afa757295")
  (:PATH "raw/mutations/6/tools/build.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/6/tools/cbor-simple-write-isolated-build.lisp" :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/6/tools/cbor-simple-write-isolated-build.lisp")
   :BYTES 478 :SHA256
   "3a9949045ded2494a032005a37c35dff0bdd370abe818b2eab0afa14e25869aa")
  (:PATH "raw/mutations/7/src/cache/build.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/cache/build.lisp")
   :BYTES 4966 :SHA256
   "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0")
  (:PATH "raw/mutations/7/src/cache/clock.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/cache/clock.lisp")
   :BYTES 2952 :SHA256
   "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f")
  (:PATH "raw/mutations/7/src/cache/core.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/cache/core.lisp")
   :BYTES 3503 :SHA256
   "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4")
  (:PATH "raw/mutations/7/src/cache/package.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/cache/package.lisp")
   :BYTES 758 :SHA256
   "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848")
  (:PATH "raw/mutations/7/src/cache/read.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/cache/read.lisp")
   :BYTES 6485 :SHA256
   "5700e43ae8ee859e96bdecb5953af43a712fd9e6ec23a53565759676bb07f85a")
  (:PATH "raw/mutations/7/src/cache/types.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/cache/types.lisp")
   :BYTES 2448 :SHA256
   "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30")
  (:PATH "raw/mutations/7/src/cache/write.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/cache/write.lisp")
   :BYTES 5481 :SHA256
   "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8")
  (:PATH "raw/mutations/7/src/codec/cbor-float-minimal.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH "raw/mutations/7/src/codec/cbor-header.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH "raw/mutations/7/src/codec/cbor-minimal.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH "raw/mutations/7/src/codec/cbor-package.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/codec/cbor-package.lisp")
   :BYTES 620 :SHA256
   "53fa9acbed8f5602b204252ff394c01fd01effdbe41baf021a713e2636cbd668")
  (:PATH "raw/mutations/7/src/codec/cbor-scan-input.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH "raw/mutations/7/src/codec/cbor-scan-items.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH "raw/mutations/7/src/codec/cbor-scan-minimal.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH "raw/mutations/7/src/codec/cbor-scan-stack.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH "raw/mutations/7/src/codec/cbor-scan.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH "raw/mutations/7/src/codec/cbor-simple-write.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/codec/cbor-simple-write.lisp")
   :BYTES 2896 :SHA256
   "d89158d588b710eb68b002ffb238162a4aaf7f013af75790913e70070c60c5f3")
  (:PATH "raw/mutations/7/src/codec/cbor-space.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH "raw/mutations/7/src/codec/cbor-string-write.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727")
  (:PATH "raw/mutations/7/src/codec/cbor-write.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/mutations/7/src/codec/package.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH "raw/mutations/7/src/codec/utf8.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH "raw/mutations/7/src/csn/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/csn/package.lisp")
   :BYTES 441 :SHA256
   "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0")
  (:PATH "raw/mutations/7/src/csn/registry.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/csn/registry.lisp")
   :BYTES 12139 :SHA256
   "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a")
  (:PATH "raw/mutations/7/src/epochs/core.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/epochs/core.lisp")
   :BYTES 5909 :SHA256
   "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399")
  (:PATH "raw/mutations/7/src/epochs/package.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/epochs/package.lisp")
   :BYTES 779 :SHA256
   "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd")
  (:PATH "raw/mutations/7/src/epochs/read.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/epochs/read.lisp")
   :BYTES 3240 :SHA256
   "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905")
  (:PATH "raw/mutations/7/src/epochs/reclaim.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/epochs/reclaim.lisp")
   :BYTES 6373 :SHA256
   "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202")
  (:PATH "raw/mutations/7/src/epochs/retire.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/epochs/retire.lisp")
   :BYTES 5858 :SHA256
   "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b")
  (:PATH "raw/mutations/7/src/epochs/types.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/epochs/types.lisp")
   :BYTES 5304 :SHA256
   "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097")
  (:PATH "raw/mutations/7/src/execution/handoff.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/execution/handoff.lisp")
   :BYTES 7394 :SHA256
   "ee90c809ef51134efa21e08b819e5530304efaf9f9e26b63c7e4afbf6d48e607")
  (:PATH "raw/mutations/7/src/execution/package.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/execution/package.lisp")
   :BYTES 1157 :SHA256
   "bbe8cdb6f7e74d7139f5e472a915cc74b43e34bd27ecac1c5fd364f723a2a643")
  (:PATH "raw/mutations/7/src/execution/queue.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/execution/queue.lisp")
   :BYTES 5374 :SHA256
   "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90")
  (:PATH "raw/mutations/7/src/execution/ready-recycle.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/execution/ready-recycle.lisp")
   :BYTES 3387 :SHA256
   "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b")
  (:PATH "raw/mutations/7/src/execution/ready-types.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/execution/ready-types.lisp")
   :BYTES 5248 :SHA256
   "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f")
  (:PATH "raw/mutations/7/src/execution/ready.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/execution/ready.lisp")
   :BYTES 6635 :SHA256
   "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327")
  (:PATH "raw/mutations/7/src/execution/worker-boundary.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/execution/worker-boundary.lisp")
   :BYTES 2309 :SHA256
   "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a")
  (:PATH "raw/mutations/7/src/execution/worker-claim.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/execution/worker-claim.lisp")
   :BYTES 6401 :SHA256
   "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e")
  (:PATH "raw/mutations/7/src/execution/worker-run.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/execution/worker-run.lisp")
   :BYTES 5124 :SHA256
   "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542")
  (:PATH "raw/mutations/7/src/execution/worker-types.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/execution/worker-types.lisp")
   :BYTES 8461 :SHA256
   "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317")
  (:PATH "raw/mutations/7/src/execution/writer.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/execution/writer.lisp")
   :BYTES 6484 :SHA256
   "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105")
  (:PATH "raw/mutations/7/src/foundation/batch.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH "raw/mutations/7/src/foundation/binary.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH "raw/mutations/7/src/foundation/conditions.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH "raw/mutations/7/src/foundation/crc32c.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH "raw/mutations/7/src/foundation/package.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH "raw/mutations/7/src/foundation/record.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH "raw/mutations/7/src/get-resolver/build.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/get-resolver/build.lisp")
   :BYTES 6882 :SHA256
   "3715cb750e08ab30fcaa068a05b17772381a3cf1975bdbdd0c03f71761089ef6")
  (:PATH "raw/mutations/7/src/get-resolver/package.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/get-resolver/package.lisp")
   :BYTES 1887 :SHA256
   "f244c1346604ccde93880824ea990a4a7329340df6c8b665963713977ca0ee10")
  (:PATH "raw/mutations/7/src/get-resolver/read.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/get-resolver/read.lisp")
   :BYTES 7259 :SHA256
   "68f82df01f7894f66db0c6545267616e76c0ba93fd7c49db6434cec666f02dc3")
  (:PATH "raw/mutations/7/src/get-resolver/rows.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/get-resolver/rows.lisp")
   :BYTES 3350 :SHA256
   "d9db85d788006fc7ad1f9a7cdeef28b992605de7fac8c295dd7fdc51f5511854")
  (:PATH "raw/mutations/7/src/get-resolver/scan.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/get-resolver/scan.lisp")
   :BYTES 6786 :SHA256
   "35a1780c6bf66364ef94c4151fa91f02eebe359f0ca0639985d2a907fd9d512d")
  (:PATH "raw/mutations/7/src/get-resolver/sort.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/get-resolver/sort.lisp")
   :BYTES 7118 :SHA256
   "974bf44efeb1cd26c5e9db0601aea295c8f1a18234894ad9d41938a2880e2255")
  (:PATH "raw/mutations/7/src/get-resolver/types.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/get-resolver/types.lisp")
   :BYTES 1757 :SHA256
   "1334512380bfb01add33b0ca152c0ce4746b3f79bcd04f84d7844ef234d6eaba")
  (:PATH "raw/mutations/7/src/get/build.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/get/build.lisp")
   :BYTES 3745 :SHA256
   "bcfc4916e9a85833dc151c4ce176bc905f2c03b6bc6d636f97a60df0d8c16739")
  (:PATH "raw/mutations/7/src/get/lifecycle.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/get/lifecycle.lisp")
   :BYTES 5345 :SHA256
   "885ba4141114ea411cac37c9b5f924aaa7f9f2a5ba311ebf92a392e5da1e3c59")
  (:PATH "raw/mutations/7/src/get/lookup.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/get/lookup.lisp")
   :BYTES 4352 :SHA256
   "9d1042d4cf1e7bd9c6d1153de12b2459e7a2724e47bd32534cd7ae56cb274c5f")
  (:PATH "raw/mutations/7/src/get/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/get/package.lisp")
   :BYTES 1995 :SHA256
   "87b795779aef0c4b918a039d182daddd22b902a9ad10c763df4364b7e630151c")
  (:PATH "raw/mutations/7/src/get/segment.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/get/segment.lisp")
   :BYTES 8097 :SHA256
   "4a486528cb2c1cc3471cb4b332d4314d24011889e1f885db6fd5600bb077eea3")
  (:PATH "raw/mutations/7/src/get/target.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/get/target.lisp")
   :BYTES 5652 :SHA256
   "9f682f735e49108cad176a6143ec99e1be64da98f29cae0b52f9b49cdea34250")
  (:PATH "raw/mutations/7/src/get/types.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/get/types.lisp")
   :BYTES 4413 :SHA256
   "653b23a6e719cd1f55e7c58b4d7e8143aec5983992ba210d0eac1f4c8682f623")
  (:PATH "raw/mutations/7/src/hash/arithmetic.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/hash/arithmetic.lisp")
   :BYTES 3073 :SHA256
   "c439e534b768acb123d69b921b85e1e56683aa8335bbc87efba95fe95f256fa9")
  (:PATH "raw/mutations/7/src/hash/blocks.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/hash/blocks.lisp")
   :BYTES 3262 :SHA256
   "5f5dff95ae6c34dfc15538c537ba2fa8d34ba2376ad66ad9975745ea13a2175f")
  (:PATH "raw/mutations/7/src/hash/hash64.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/hash/hash64.lisp")
   :BYTES 1768 :SHA256
   "99e4c8394a8f877ce1f552f15a57a082c0ec81015e87119ee4ffea28cf3ae77f")
  (:PATH "raw/mutations/7/src/hash/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/hash/package.lisp")
   :BYTES 477 :SHA256
   "1e7668fa26fc1a8e3b3cfe824aa3e08b30b57441d5f90d44453fc3a9259a10d0")
  (:PATH "raw/mutations/7/src/index/core.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/index/core.lisp")
   :BYTES 2959 :SHA256
   "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff")
  (:PATH "raw/mutations/7/src/index/hash-digests.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/index/hash-digests.lisp")
   :BYTES 3674 :SHA256
   "924bb7dab91ff56c1e909f2b06dff5f74b443ac6442e379498f29b25f1fa2673")
  (:PATH "raw/mutations/7/src/index/hash-seed.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/index/hash-seed.lisp")
   :BYTES 2437 :SHA256
   "ae86514101e95737747ba58a4f0c5dc1ddb44d2b3a18bceb8fd0d0756b57a7a1")
  (:PATH "raw/mutations/7/src/index/package.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/index/package.lisp")
   :BYTES 727 :SHA256
   "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507")
  (:PATH "raw/mutations/7/src/index/primary-arena.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/index/primary-arena.lisp")
   :BYTES 3485 :SHA256
   "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5")
  (:PATH "raw/mutations/7/src/index/primary-build.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/index/primary-build.lisp")
   :BYTES 5379 :SHA256
   "06ca5ac8c03504e2d2f973873e5cabf7518c090cd1f8f2118c46e0ea2f9bf37b")
  (:PATH "raw/mutations/7/src/index/primary-core.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/index/primary-core.lisp")
   :BYTES 4211 :SHA256
   "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e")
  (:PATH "raw/mutations/7/src/index/primary-directory.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/index/primary-directory.lisp")
   :BYTES 8114 :SHA256
   "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd")
  (:PATH "raw/mutations/7/src/index/primary-package.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/index/primary-package.lisp")
   :BYTES 1451 :SHA256
   "0682eb9a61596506b6788bd0285f9808db2496246caae64ab3203182ed46b860")
  (:PATH "raw/mutations/7/src/index/primary-probe.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/index/primary-probe.lisp")
   :BYTES 5936 :SHA256
   "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4")
  (:PATH "raw/mutations/7/src/index/primary-read.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/index/primary-read.lisp")
   :BYTES 3575 :SHA256
   "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f")
  (:PATH "raw/mutations/7/src/index/primary-relocate.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/index/primary-relocate.lisp")
   :BYTES 4073 :SHA256
   "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20")
  (:PATH "raw/mutations/7/src/index/primary-types.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/index/primary-types.lisp")
   :BYTES 3949 :SHA256
   "f17ca0dcd8a538b921f00044e23872b28272638c4435eacd30f0509422505e64")
  (:PATH "raw/mutations/7/src/index/primary-write.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/index/primary-write.lisp")
   :BYTES 7061 :SHA256
   "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655")
  (:PATH "raw/mutations/7/src/index/read.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/index/read.lisp")
   :BYTES 3030 :SHA256
   "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7")
  (:PATH "raw/mutations/7/src/index/rebuild-budget.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/index/rebuild-budget.lisp")
   :BYTES 3593 :SHA256
   "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0")
  (:PATH "raw/mutations/7/src/index/rebuild-copy.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/index/rebuild-copy.lisp")
   :BYTES 4027 :SHA256
   "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee")
  (:PATH "raw/mutations/7/src/index/rebuild-scan.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/index/rebuild-scan.lisp")
   :BYTES 5002 :SHA256
   "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e")
  (:PATH "raw/mutations/7/src/index/rebuild.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/index/rebuild.lisp")
   :BYTES 2872 :SHA256
   "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1")
  (:PATH "raw/mutations/7/src/index/relocate.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/index/relocate.lisp")
   :BYTES 2383 :SHA256
   "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc")
  (:PATH "raw/mutations/7/src/index/types.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/index/types.lisp")
   :BYTES 2434 :SHA256
   "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e")
  (:PATH "raw/mutations/7/src/index/validation.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/index/validation.lisp")
   :BYTES 3930 :SHA256
   "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a")
  (:PATH "raw/mutations/7/src/index/write.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/index/write.lisp")
   :BYTES 4784 :SHA256
   "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28")
  (:PATH "raw/mutations/7/src/io/flush.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/io/flush.lisp")
   :BYTES 1569 :SHA256
   "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325")
  (:PATH "raw/mutations/7/src/io/lifecycle.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/io/lifecycle.lisp")
   :BYTES 4536 :SHA256
   "baa1f763fe0f394a14d381b753dcb1be1e90eb03eaff5d6469465b5d4eca015f")
  (:PATH "raw/mutations/7/src/io/native.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/io/native.lisp")
   :BYTES 5026 :SHA256
   "b8cf3ce1ff7b4fa9def8a602ab768c0e9a321f8d6cdce6e5b2b7ded2fe3d97dd")
  (:PATH "raw/mutations/7/src/io/package.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/io/package.lisp")
   :BYTES 592 :SHA256
   "118eba04ab2aa87a2d86e0b0269dbeacaa485457acebbc12c57317ae465a89c0")
  (:PATH "raw/mutations/7/src/io/transfer.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/io/transfer.lisp")
   :BYTES 5051 :SHA256
   "3748328cf85e1c007900a63bdd0f159f38a8d7cd3577c92c56fc68692b9b7bcf")
  (:PATH "raw/mutations/7/src/io/types.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/io/types.lisp")
   :BYTES 4143 :SHA256
   "50c7eeea91af232fca7103ce5a25535958d73836f01cb45a20c7120b88b1336b")
  (:PATH "raw/mutations/7/src/mvcc/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/mvcc/package.lisp")
   :BYTES 833 :SHA256
   "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c")
  (:PATH "raw/mutations/7/src/mvcc/snapshots-core.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/mvcc/snapshots-core.lisp")
   :BYTES 7622 :SHA256
   "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998")
  (:PATH "raw/mutations/7/src/mvcc/snapshots-csn.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/mvcc/snapshots-csn.lisp")
   :BYTES 2725 :SHA256
   "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77")
  (:PATH "raw/mutations/7/src/mvcc/snapshots-lifecycle.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/mvcc/snapshots-lifecycle.lisp")
   :BYTES 6609 :SHA256
   "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082")
  (:PATH "raw/mutations/7/src/mvcc/snapshots-read.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/mvcc/snapshots-read.lisp")
   :BYTES 6651 :SHA256
   "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9")
  (:PATH "raw/mutations/7/src/mvcc/snapshots-register.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/mvcc/snapshots-register.lisp")
   :BYTES 6654 :SHA256
   "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b")
  (:PATH "raw/mutations/7/src/mvcc/snapshots-types.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/mvcc/snapshots-types.lisp")
   :BYTES 3817 :SHA256
   "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f")
  (:PATH "raw/mutations/7/src/mvcc/types.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/mvcc/types.lisp")
   :BYTES 471 :SHA256
   "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50")
  (:PATH "raw/mutations/7/src/package.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH "raw/mutations/7/src/read/core.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/read/core.lisp")
   :BYTES 3846 :SHA256
   "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f")
  (:PATH "raw/mutations/7/src/read/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/read/package.lisp")
   :BYTES 831 :SHA256
   "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df")
  (:PATH "raw/mutations/7/src/read/task.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/read/task.lisp")
   :BYTES 5073 :SHA256
   "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2")
  (:PATH "raw/mutations/7/src/read/types.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/read/types.lisp")
   :BYTES 2358 :SHA256
   "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c")
  (:PATH "raw/mutations/7/src/recovery/decisions-build.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/recovery/decisions-build.lisp")
   :BYTES 11857 :SHA256
   "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115")
  (:PATH "raw/mutations/7/src/recovery/decisions-package.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/recovery/decisions-package.lisp")
   :BYTES 818 :SHA256
   "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39")
  (:PATH "raw/mutations/7/src/recovery/decisions-query.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/recovery/decisions-query.lisp")
   :BYTES 4525 :SHA256
   "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24")
  (:PATH "raw/mutations/7/src/recovery/decisions-radix.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/recovery/decisions-radix.lisp")
   :BYTES 11061 :SHA256
   "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54")
  (:PATH "raw/mutations/7/src/recovery/decisions-sort.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/recovery/decisions-sort.lisp")
   :BYTES 7654 :SHA256
   "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2")
  (:PATH "raw/mutations/7/src/recovery/decisions-types.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/recovery/decisions-types.lisp")
   :BYTES 2056 :SHA256
   "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c")
  (:PATH "raw/mutations/7/src/recovery/inventory-build.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/recovery/inventory-build.lisp")
   :BYTES 9592 :SHA256
   "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e")
  (:PATH "raw/mutations/7/src/recovery/inventory-query.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/recovery/inventory-query.lisp")
   :BYTES 2100 :SHA256
   "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb")
  (:PATH "raw/mutations/7/src/recovery/inventory-types.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/recovery/inventory-types.lisp")
   :BYTES 2392 :SHA256
   "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9")
  (:PATH "raw/mutations/7/src/recovery/manifest-build.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/recovery/manifest-build.lisp")
   :BYTES 10251 :SHA256
   "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471")
  (:PATH "raw/mutations/7/src/recovery/manifest-decode.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/recovery/manifest-decode.lisp")
   :BYTES 6160 :SHA256
   "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779")
  (:PATH "raw/mutations/7/src/recovery/manifest-fold.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/recovery/manifest-fold.lisp")
   :BYTES 7068 :SHA256
   "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730")
  (:PATH "raw/mutations/7/src/recovery/manifest-package.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/recovery/manifest-package.lisp")
   :BYTES 1372 :SHA256
   "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc")
  (:PATH "raw/mutations/7/src/recovery/manifest-query.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/recovery/manifest-query.lisp")
   :BYTES 3582 :SHA256
   "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b")
  (:PATH "raw/mutations/7/src/recovery/manifest-types.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/recovery/manifest-types.lisp")
   :BYTES 3345 :SHA256
   "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10")
  (:PATH "raw/mutations/7/src/recovery/package.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/recovery/package.lisp")
   :BYTES 927 :SHA256
   "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9")
  (:PATH "raw/mutations/7/src/recovery/scan.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/recovery/scan.lisp")
   :BYTES 12829 :SHA256
   "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218")
  (:PATH "raw/mutations/7/src/series/events.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/series/events.lisp")
   :BYTES 9566 :SHA256
   "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7")
  (:PATH "raw/mutations/7/src/series/io-events.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/series/io-events.lisp")
   :BYTES 5385 :SHA256
   "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546")
  (:PATH "raw/mutations/7/src/series/ownership.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/series/ownership.lisp")
   :BYTES 8810 :SHA256
   "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4")
  (:PATH "raw/mutations/7/src/series/package.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/series/package.lisp")
   :BYTES 1392 :SHA256
   "7433162105df63d324141167e6dcf6bfee74611aa1cf7291cc6c92f41f3c7408")
  (:PATH "raw/mutations/7/src/series/publication.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/series/publication.lisp")
   :BYTES 6094 :SHA256
   "288cb3fa41fad76a0e6919dfa0b2fce2beef15f5880129393bee35bc8795c762")
  (:PATH "raw/mutations/7/src/series/query.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/series/query.lisp")
   :BYTES 3600 :SHA256
   "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9")
  (:PATH "raw/mutations/7/src/series/retirement.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/series/retirement.lisp")
   :BYTES 4634 :SHA256
   "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059")
  (:PATH "raw/mutations/7/src/series/types.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/series/types.lisp")
   :BYTES 3316 :SHA256
   "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9")
  (:PATH "raw/mutations/7/src/series/worker-boundary.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/series/worker-boundary.lisp")
   :BYTES 3443 :SHA256
   "793d401d1b9acc7b67923d815560f277f3d390ca050740f735f07d88dbacfe73")
  (:PATH "raw/mutations/7/src/series/worker-package.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/series/worker-package.lisp")
   :BYTES 1036 :SHA256
   "881a2958ddb8f5781954d4c59d7467e34c03c01fbb2fea43dc06e9e2050a1f37")
  (:PATH "raw/mutations/7/src/series/worker-run.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/series/worker-run.lisp")
   :BYTES 6985 :SHA256
   "f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f")
  (:PATH "raw/mutations/7/src/series/worker-types.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/series/worker-types.lisp")
   :BYTES 6493 :SHA256
   "a366799fd9b938bfaa48b0ffda228ff8369ab9acb5b5ead7f081dfc66ab2c81a")
  (:PATH "raw/mutations/7/src/storage/compaction-scan.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/storage/compaction-scan.lisp")
   :BYTES 5510 :SHA256
   "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d")
  (:PATH "raw/mutations/7/src/storage/control-payload.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/storage/control-payload.lisp")
   :BYTES 6273 :SHA256
   "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491")
  (:PATH "raw/mutations/7/src/storage/formats.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/storage/formats.lisp")
   :BYTES 3841 :SHA256
   "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f")
  (:PATH "raw/mutations/7/src/storage/log-header.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/storage/log-header.lisp")
   :BYTES 3947 :SHA256
   "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81")
  (:PATH "raw/mutations/7/src/storage/package.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/storage/package.lisp")
   :BYTES 1079 :SHA256
   "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e")
  (:PATH "raw/mutations/7/src/storage/payload-record.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/storage/payload-record.lisp")
   :BYTES 3641 :SHA256
   "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7")
  (:PATH "raw/mutations/7/src/storage/payload-write.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/storage/payload-write.lisp")
   :BYTES 5239 :SHA256
   "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc")
  (:PATH "raw/mutations/7/src/storage/segment-header.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/storage/segment-header.lisp")
   :BYTES 5517 :SHA256
   "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011")
  (:PATH "raw/mutations/7/src/wal/builder.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/wal/builder.lisp")
   :BYTES 8445 :SHA256
   "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0")
  (:PATH "raw/mutations/7/src/wal/csn.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/wal/csn.lisp")
   :BYTES 9577 :SHA256
   "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810")
  (:PATH "raw/mutations/7/src/wal/executor.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/wal/executor.lisp")
   :BYTES 6023 :SHA256
   "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8")
  (:PATH "raw/mutations/7/src/wal/group.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/wal/group.lisp")
   :BYTES 6305 :SHA256
   "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b")
  (:PATH "raw/mutations/7/src/wal/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/wal/package.lisp")
   :BYTES 1774 :SHA256
   "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89")
  (:PATH "raw/mutations/7/src/wal/types.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/src/wal/types.lisp")
   :BYTES 5420 :SHA256
   "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e")
  (:PATH "raw/mutations/7/test.log" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/test.log")
   :BYTES 25332 :SHA256
   "aacbaff8c0915f8b5c75dd1976323d9d874fceeab92e96220d6871de848de7b0")
  (:PATH "raw/mutations/7/tests/codec/cbor-header.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/codec/cbor-header.lisp")
   :BYTES 10773 :SHA256
   "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815")
  (:PATH "raw/mutations/7/tests/codec/cbor-minimal-edges.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/codec/cbor-minimal-edges.lisp")
   :BYTES 1613 :SHA256
   "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70")
  (:PATH "raw/mutations/7/tests/codec/cbor-minimal-scan-support.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/codec/cbor-minimal-scan-support.lisp")
   :BYTES 8363 :SHA256
   "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421")
  (:PATH "raw/mutations/7/tests/codec/cbor-minimal-scan-threads.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/codec/cbor-minimal-scan-threads.lisp")
   :BYTES 4547 :SHA256
   "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660")
  (:PATH "raw/mutations/7/tests/codec/cbor-minimal-scan.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/codec/cbor-minimal-scan.lisp")
   :BYTES 19217 :SHA256
   "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8")
  (:PATH "raw/mutations/7/tests/codec/cbor-minimal-support.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/codec/cbor-minimal-support.lisp")
   :BYTES 8620 :SHA256
   "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a")
  (:PATH "raw/mutations/7/tests/codec/cbor-minimal-threads.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/codec/cbor-minimal-threads.lisp")
   :BYTES 3799 :SHA256
   "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2")
  (:PATH "raw/mutations/7/tests/codec/cbor-minimal.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/codec/cbor-minimal.lisp")
   :BYTES 12604 :SHA256
   "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3")
  (:PATH "raw/mutations/7/tests/codec/cbor-simple-write-support.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/codec/cbor-simple-write-support.lisp")
   :BYTES 4955 :SHA256
   "53ceafc72a027a2ff1f787900558ff26f2ff70bbb212f1b37926a6d520fbe86e")
  (:PATH "raw/mutations/7/tests/codec/cbor-simple-write-threads.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/codec/cbor-simple-write-threads.lisp")
   :BYTES 3561 :SHA256
   "77074033e75a224fd02e890f98dffa8e97d3a1f8bedd510b00ea55d8ff8687b2")
  (:PATH "raw/mutations/7/tests/codec/cbor-simple-write.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/codec/cbor-simple-write.lisp")
   :BYTES 10712 :SHA256
   "958bdd3901cfc41032c09d6c9023b192799981884e09ce3573256ff45bc5329a")
  (:PATH "raw/mutations/7/tests/codec/cbor-string-write-support.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/codec/cbor-string-write-support.lisp")
   :BYTES 6868 :SHA256
   "2cbdb601f442a56456bc637c94e759cc965f44b178268dce3c636c385d34fc39")
  (:PATH "raw/mutations/7/tests/codec/cbor-string-write-threads.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/codec/cbor-string-write-threads.lisp")
   :BYTES 3512 :SHA256
   "8e07b881a55e2554a429f1c8b2c69f67862ac015217d90d019167d636564d27d")
  (:PATH "raw/mutations/7/tests/codec/cbor-string-write.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/codec/cbor-string-write.lisp")
   :BYTES 15883 :SHA256
   "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115")
  (:PATH "raw/mutations/7/tests/codec/cbor-structure-support.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:PATH "raw/mutations/7/tests/codec/cbor-structure-threads.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/codec/cbor-structure-threads.lisp")
   :BYTES 4305 :SHA256
   "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645")
  (:PATH "raw/mutations/7/tests/codec/cbor-structure.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/codec/cbor-structure.lisp")
   :BYTES 22968 :SHA256
   "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110")
  (:PATH "raw/mutations/7/tests/codec/cbor-support.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:PATH "raw/mutations/7/tests/codec/cbor-threads.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/codec/cbor-threads.lisp")
   :BYTES 3683 :SHA256
   "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14")
  (:PATH "raw/mutations/7/tests/codec/cbor-write-roundtrip.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/codec/cbor-write-roundtrip.lisp")
   :BYTES 901 :SHA256
   "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344")
  (:PATH "raw/mutations/7/tests/codec/cbor-write-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/codec/cbor-write-support.lisp")
   :BYTES 4768 :SHA256
   "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6")
  (:PATH "raw/mutations/7/tests/codec/cbor-write-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/codec/cbor-write-threads.lisp")
   :BYTES 3813 :SHA256
   "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb")
  (:PATH "raw/mutations/7/tests/codec/cbor-write.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/codec/cbor-write.lisp")
   :BYTES 9822 :SHA256
   "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3")
  (:PATH "raw/mutations/7/tests/codec/support.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/codec/support.lisp")
   :BYTES 5807 :SHA256
   "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96")
  (:PATH "raw/mutations/7/tests/codec/threads.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/codec/threads.lisp")
   :BYTES 3111 :SHA256
   "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337")
  (:PATH "raw/mutations/7/tests/codec/utf8.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/codec/utf8.lisp")
   :BYTES 12892 :SHA256
   "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100")
  (:PATH "raw/mutations/7/tests/csn/registry.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/csn/registry.lisp")
   :BYTES 19411 :SHA256
   "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950")
  (:PATH "raw/mutations/7/tests/csn/support.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/csn/support.lisp")
   :BYTES 11407 :SHA256
   "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db")
  (:PATH "raw/mutations/7/tests/csn/threads.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/csn/threads.lisp")
   :BYTES 10525 :SHA256
   "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2")
  (:PATH "raw/mutations/7/tests/epochs/lifecycle.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/epochs/lifecycle.lisp")
   :BYTES 25394 :SHA256
   "ddc2fbdad9f97d2e4ff008c167776a50b17b742398306fbd5198dca474559cbf")
  (:PATH "raw/mutations/7/tests/epochs/support.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/epochs/support.lisp")
   :BYTES 5943 :SHA256
   "366be7af4bf6c4ed946b3fa9e97aea6b034c83e3b757d81c54078dc76d229b6d")
  (:PATH "raw/mutations/7/tests/epochs/threads.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/epochs/threads.lisp")
   :BYTES 3654 :SHA256
   "54b73e06c61e64f32a3e3af0791891dacb6590e929163dcf0fac95f2c71e66fd")
  (:PATH "raw/mutations/7/tests/execution/handoff.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/execution/handoff.lisp")
   :BYTES 33278 :SHA256
   "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e")
  (:PATH "raw/mutations/7/tests/execution/queue.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/execution/queue.lisp")
   :BYTES 12894 :SHA256
   "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722")
  (:PATH "raw/mutations/7/tests/execution/ready-recycle.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/execution/ready-recycle.lisp")
   :BYTES 30075 :SHA256
   "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae")
  (:PATH "raw/mutations/7/tests/execution/ready.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/execution/ready.lisp")
   :BYTES 33555 :SHA256
   "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e")
  (:PATH "raw/mutations/7/tests/execution/support.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/execution/support.lisp")
   :BYTES 4469 :SHA256
   "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43")
  (:PATH "raw/mutations/7/tests/execution/threads.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/execution/threads.lisp")
   :BYTES 14622 :SHA256
   "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359")
  (:PATH "raw/mutations/7/tests/execution/worker.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/execution/worker.lisp")
   :BYTES 59783 :SHA256
   "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06")
  (:PATH "raw/mutations/7/tests/foundation/batch.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/foundation/batch.lisp")
   :BYTES 5185 :SHA256
   "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183")
  (:PATH "raw/mutations/7/tests/foundation/binary.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/foundation/binary.lisp")
   :BYTES 3721 :SHA256
   "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe")
  (:PATH "raw/mutations/7/tests/foundation/record.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/foundation/record.lisp")
   :BYTES 14950 :SHA256
   "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8")
  (:PATH "raw/mutations/7/tests/foundation/support.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:PATH "raw/mutations/7/tests/get-performance/guards.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/get-performance/guards.lisp")
   :BYTES 8986 :SHA256
   "c41721b917ed443355ea3707efdd07e7da53a978c0515ab1e5ede5fcc47d63fc")
  (:PATH "raw/mutations/7/tests/get-performance/paths.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/get-performance/paths.lisp")
   :BYTES 4936 :SHA256
   "3b8d2c9c93467507ea2bb471d42192eb1fa084b55c0f4263b5ef0d3acf468f55")
  (:PATH "raw/mutations/7/tests/get-performance/support.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/get-performance/support.lisp")
   :BYTES 22497 :SHA256
   "e586ed94dcb2aaba00282931cdd83313e4f84a86d4d1ba85e2d56e8b7433ed8d")
  (:PATH "raw/mutations/7/tests/get-performance/threads.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/get-performance/threads.lisp")
   :BYTES 4744 :SHA256
   "05ace5eb351ab49da59611dc1a2a5abedb9d723a2fc6e75a30fc76e507573a90")
  (:PATH "raw/mutations/7/tests/hash/guards.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/hash/guards.lisp")
   :BYTES 1162 :SHA256
   "9af5b38443a57d224990a68e93f12f7a4cda306f94c7ccd3ccb50635865d7864")
  (:PATH "raw/mutations/7/tests/hash/hash64.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/hash/hash64.lisp")
   :BYTES 17948 :SHA256
   "70606bc68807143cfea9583871474c84efc868d13692cde28488284dee43e0f1")
  (:PATH "raw/mutations/7/tests/hash/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/hash/support.lisp")
   :BYTES 10828 :SHA256
   "0fae9dc36976af544f83e6051b9cf9d67c9bef0b9e25f1fa2a48fdac48592acb")
  (:PATH "raw/mutations/7/tests/hash/threads.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/hash/threads.lisp")
   :BYTES 6701 :SHA256
   "3fc587a57d26a294aebfc6a7aeadf2f61a42a21106c1c57517f891b76b4e750a")
  (:PATH "raw/mutations/7/tests/index/hash-digests.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/index/hash-digests.lisp")
   :BYTES 35926 :SHA256
   "3b3b39f861883cf2017cab8e6488560a6bb3897d63784f00e820a6450d743225")
  (:PATH "raw/mutations/7/tests/index/primary-support.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/index/primary-support.lisp")
   :BYTES 13938 :SHA256
   "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a")
  (:PATH "raw/mutations/7/tests/index/primary-threads.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/index/primary-threads.lisp")
   :BYTES 13744 :SHA256
   "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2")
  (:PATH "raw/mutations/7/tests/index/primary.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/index/primary.lisp")
   :BYTES 30166 :SHA256
   "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696")
  (:PATH "raw/mutations/7/tests/index/rebuild.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/index/rebuild.lisp")
   :BYTES 32112 :SHA256
   "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1")
  (:PATH "raw/mutations/7/tests/index/slot-support.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/index/slot-support.lisp")
   :BYTES 12800 :SHA256
   "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31")
  (:PATH "raw/mutations/7/tests/index/slot-threads.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/index/slot-threads.lisp")
   :BYTES 11698 :SHA256
   "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f")
  (:PATH "raw/mutations/7/tests/index/slots.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/index/slots.lisp")
   :BYTES 26420 :SHA256
   "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb")
  (:PATH "raw/mutations/7/tests/io/native.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/io/native.lisp")
   :BYTES 6207 :SHA256
   "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0")
  (:PATH "raw/mutations/7/tests/io/support.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/io/support.lisp")
   :BYTES 2951 :SHA256
   "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50")
  (:PATH "raw/mutations/7/tests/io/transfer.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/io/transfer.lisp")
   :BYTES 11847 :SHA256
   "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd")
  (:PATH "raw/mutations/7/tests/lint-fixtures/bad.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/lint-fixtures/bad.lisp")
   :BYTES 1587 :SHA256
   "ac8912ce6cc1101f2ebc305a50c0565879547b527d7ca0aeac900ee06bf26652")
  (:PATH "raw/mutations/7/tests/lint-fixtures/good.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/lint-fixtures/good.lisp")
   :BYTES 671 :SHA256
   "05ce84f8fd12d9af48252601bcc92d6d60335b53f39b01a9fe2697c4bdaa8cee")
  (:PATH "raw/mutations/7/tests/lint-fixtures/keyword-barrier.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/lint-fixtures/keyword-barrier.lisp")
   :BYTES 199 :SHA256
   "e26dab117e9526ace35bb45b92f977065d33fcc4404c40fd4fc3c77749689a96")
  (:PATH "raw/mutations/7/tests/lint-fixtures/qualified-reader.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/lint-fixtures/qualified-reader.lisp")
   :BYTES 152 :SHA256
   "835229bdc1a0ed0c08511cd6121e1f1bc4284da2cfba951b72cd1a74a6040d35")
  (:PATH "raw/mutations/7/tests/mvcc/capture.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/mvcc/capture.lisp")
   :BYTES 16356 :SHA256
   "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35")
  (:PATH "raw/mutations/7/tests/mvcc/lifecycle.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/mvcc/lifecycle.lisp")
   :BYTES 23964 :SHA256
   "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16")
  (:PATH "raw/mutations/7/tests/mvcc/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/mvcc/support.lisp")
   :BYTES 5931 :SHA256
   "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290")
  (:PATH "raw/mutations/7/tests/read/lifecycle.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/read/lifecycle.lisp")
   :BYTES 17804 :SHA256
   "c4c4642408816f2e0e809e21d04739b68b9391237e3e46ea0b195ed82857c3a8")
  (:PATH "raw/mutations/7/tests/read/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/read/support.lisp")
   :BYTES 4845 :SHA256
   "8095cc39d49342f6e43f3421b4fced839da02d8d11b4d8ddcd91bd346447e754")
  (:PATH "raw/mutations/7/tests/read/threads.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/read/threads.lisp")
   :BYTES 4150 :SHA256
   "e2e223b69b08a5d76b9773c6ad4dee13ef2ddbb6f5ababa713cc5654bc7b51c5")
  (:PATH "raw/mutations/7/tests/recovery/corruption.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/recovery/corruption.lisp")
   :BYTES 7106 :SHA256
   "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c")
  (:PATH "raw/mutations/7/tests/recovery/decisions-audit.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/recovery/decisions-audit.lisp")
   :BYTES 14971 :SHA256
   "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0")
  (:PATH "raw/mutations/7/tests/recovery/decisions-radix.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/recovery/decisions-radix.lisp")
   :BYTES 27851 :SHA256
   "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0")
  (:PATH "raw/mutations/7/tests/recovery/decisions-support.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/recovery/decisions-support.lisp")
   :BYTES 6797 :SHA256
   "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4")
  (:PATH "raw/mutations/7/tests/recovery/decisions.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/recovery/decisions.lisp")
   :BYTES 19149 :SHA256
   "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e")
  (:PATH "raw/mutations/7/tests/recovery/inventory-support.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/recovery/inventory-support.lisp")
   :BYTES 8083 :SHA256
   "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27")
  (:PATH "raw/mutations/7/tests/recovery/inventory.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/recovery/inventory.lisp")
   :BYTES 14479 :SHA256
   "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9")
  (:PATH "raw/mutations/7/tests/recovery/manifest-audit.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/recovery/manifest-audit.lisp")
   :BYTES 17670 :SHA256
   "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6")
  (:PATH "raw/mutations/7/tests/recovery/manifest-support.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/recovery/manifest-support.lisp")
   :BYTES 9769 :SHA256
   "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830")
  (:PATH "raw/mutations/7/tests/recovery/manifest.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/recovery/manifest.lisp")
   :BYTES 13799 :SHA256
   "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd")
  (:PATH "raw/mutations/7/tests/recovery/scan.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/recovery/scan.lisp")
   :BYTES 16966 :SHA256
   "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b")
  (:PATH "raw/mutations/7/tests/recovery/support.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/recovery/support.lisp")
   :BYTES 5957 :SHA256
   "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204")
  (:PATH "raw/mutations/7/tests/series/boundaries.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/series/boundaries.lisp")
   :BYTES 5802 :SHA256
   "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8")
  (:PATH "raw/mutations/7/tests/series/controller.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/series/controller.lisp")
   :BYTES 60484 :SHA256
   "4bea80eb231575f48b208ddb57af6a11706481e0ec755b084f6cd4b6fd0481a1")
  (:PATH "raw/mutations/7/tests/series/support.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/series/support.lisp")
   :BYTES 16885 :SHA256
   "8821ae9e002941eff8ea3ae7dbfc727cb6874b68d2d1ef85af668eb2d34a0c0c")
  (:PATH "raw/mutations/7/tests/series/threads.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/series/threads.lisp")
   :BYTES 19694 :SHA256
   "bbea64d207d14698b39ab0f8ded03db11bab09955d3f66705c23d69c09aefc8e")
  (:PATH "raw/mutations/7/tests/series/worker-bridge.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/series/worker-bridge.lisp")
   :BYTES 56677 :SHA256
   "c1ee49702e63978a83cb86c4e5bf437a5a40e48fa02b65d3eaf3dca0d2e39176")
  (:PATH "raw/mutations/7/tests/smoke.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/smoke.lisp")
   :BYTES 735 :SHA256
   "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8")
  (:PATH "raw/mutations/7/tests/storage/compaction-scan.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/storage/compaction-scan.lisp")
   :BYTES 16196 :SHA256
   "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5")
  (:PATH "raw/mutations/7/tests/storage/control-payload.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/storage/control-payload.lisp")
   :BYTES 12651 :SHA256
   "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae")
  (:PATH "raw/mutations/7/tests/storage/log-header.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/storage/log-header.lisp")
   :BYTES 11969 :SHA256
   "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e")
  (:PATH "raw/mutations/7/tests/storage/segment-header.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/storage/segment-header.lisp")
   :BYTES 4149 :SHA256
   "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df")
  (:PATH "raw/mutations/7/tests/storage/support.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/storage/support.lisp")
   :BYTES 4029 :SHA256
   "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625")
  (:PATH "raw/mutations/7/tests/wal/builder.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/wal/builder.lisp")
   :BYTES 4000 :SHA256
   "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6")
  (:PATH "raw/mutations/7/tests/wal/csn-threads.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/wal/csn-threads.lisp")
   :BYTES 12114 :SHA256
   "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c")
  (:PATH "raw/mutations/7/tests/wal/csn.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/wal/csn.lisp")
   :BYTES 34661 :SHA256
   "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a")
  (:PATH "raw/mutations/7/tests/wal/fault.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/wal/fault.lisp")
   :BYTES 7614 :SHA256
   "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875")
  (:PATH "raw/mutations/7/tests/wal/group.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/wal/group.lisp")
   :BYTES 5524 :SHA256
   "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e")
  (:PATH "raw/mutations/7/tests/wal/native.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/wal/native.lisp")
   :BYTES 2567 :SHA256
   "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7")
  (:PATH "raw/mutations/7/tests/wal/support.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tests/wal/support.lisp")
   :BYTES 1951 :SHA256
   "90a47539e5e2898c0a08059207f30bb5551e7ca8fc166f8f6ce7b95afa757295")
  (:PATH "raw/mutations/7/tools/build.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/7/tools/cbor-simple-write-isolated-build.lisp" :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/7/tools/cbor-simple-write-isolated-build.lisp")
   :BYTES 478 :SHA256
   "eb2d3a3ce2c873ca32ca934c0a3b8c373484643b25cf06081f3cf8221086b85c")
  (:PATH "raw/mutations/baseline/src/cache/build.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/cache/build.lisp")
   :BYTES 4966 :SHA256
   "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0")
  (:PATH "raw/mutations/baseline/src/cache/clock.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/cache/clock.lisp")
   :BYTES 2952 :SHA256
   "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f")
  (:PATH "raw/mutations/baseline/src/cache/core.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/cache/core.lisp")
   :BYTES 3503 :SHA256
   "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4")
  (:PATH "raw/mutations/baseline/src/cache/package.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/cache/package.lisp")
   :BYTES 758 :SHA256
   "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848")
  (:PATH "raw/mutations/baseline/src/cache/read.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/cache/read.lisp")
   :BYTES 6485 :SHA256
   "5700e43ae8ee859e96bdecb5953af43a712fd9e6ec23a53565759676bb07f85a")
  (:PATH "raw/mutations/baseline/src/cache/types.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/cache/types.lisp")
   :BYTES 2448 :SHA256
   "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30")
  (:PATH "raw/mutations/baseline/src/cache/write.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/cache/write.lisp")
   :BYTES 5481 :SHA256
   "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8")
  (:PATH "raw/mutations/baseline/src/codec/cbor-float-minimal.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH "raw/mutations/baseline/src/codec/cbor-header.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH "raw/mutations/baseline/src/codec/cbor-minimal.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH "raw/mutations/baseline/src/codec/cbor-package.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/codec/cbor-package.lisp")
   :BYTES 620 :SHA256
   "53fa9acbed8f5602b204252ff394c01fd01effdbe41baf021a713e2636cbd668")
  (:PATH "raw/mutations/baseline/src/codec/cbor-scan-input.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH "raw/mutations/baseline/src/codec/cbor-scan-items.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH "raw/mutations/baseline/src/codec/cbor-scan-minimal.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH "raw/mutations/baseline/src/codec/cbor-scan-stack.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH "raw/mutations/baseline/src/codec/cbor-scan.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH "raw/mutations/baseline/src/codec/cbor-simple-write.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/codec/cbor-simple-write.lisp")
   :BYTES 2887 :SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e")
  (:PATH "raw/mutations/baseline/src/codec/cbor-space.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH "raw/mutations/baseline/src/codec/cbor-string-write.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727")
  (:PATH "raw/mutations/baseline/src/codec/cbor-write.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/mutations/baseline/src/codec/package.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH "raw/mutations/baseline/src/codec/utf8.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH "raw/mutations/baseline/src/csn/package.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/csn/package.lisp")
   :BYTES 441 :SHA256
   "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0")
  (:PATH "raw/mutations/baseline/src/csn/registry.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/csn/registry.lisp")
   :BYTES 12139 :SHA256
   "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a")
  (:PATH "raw/mutations/baseline/src/epochs/core.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/epochs/core.lisp")
   :BYTES 5909 :SHA256
   "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399")
  (:PATH "raw/mutations/baseline/src/epochs/package.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/epochs/package.lisp")
   :BYTES 779 :SHA256
   "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd")
  (:PATH "raw/mutations/baseline/src/epochs/read.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/epochs/read.lisp")
   :BYTES 3240 :SHA256
   "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905")
  (:PATH "raw/mutations/baseline/src/epochs/reclaim.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/epochs/reclaim.lisp")
   :BYTES 6373 :SHA256
   "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202")
  (:PATH "raw/mutations/baseline/src/epochs/retire.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/epochs/retire.lisp")
   :BYTES 5858 :SHA256
   "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b")
  (:PATH "raw/mutations/baseline/src/epochs/types.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/epochs/types.lisp")
   :BYTES 5304 :SHA256
   "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097")
  (:PATH "raw/mutations/baseline/src/execution/handoff.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/execution/handoff.lisp")
   :BYTES 7394 :SHA256
   "ee90c809ef51134efa21e08b819e5530304efaf9f9e26b63c7e4afbf6d48e607")
  (:PATH "raw/mutations/baseline/src/execution/package.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/execution/package.lisp")
   :BYTES 1157 :SHA256
   "bbe8cdb6f7e74d7139f5e472a915cc74b43e34bd27ecac1c5fd364f723a2a643")
  (:PATH "raw/mutations/baseline/src/execution/queue.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/execution/queue.lisp")
   :BYTES 5374 :SHA256
   "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90")
  (:PATH "raw/mutations/baseline/src/execution/ready-recycle.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/execution/ready-recycle.lisp")
   :BYTES 3387 :SHA256
   "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b")
  (:PATH "raw/mutations/baseline/src/execution/ready-types.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/execution/ready-types.lisp")
   :BYTES 5248 :SHA256
   "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f")
  (:PATH "raw/mutations/baseline/src/execution/ready.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/execution/ready.lisp")
   :BYTES 6635 :SHA256
   "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327")
  (:PATH "raw/mutations/baseline/src/execution/worker-boundary.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/execution/worker-boundary.lisp")
   :BYTES 2309 :SHA256
   "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a")
  (:PATH "raw/mutations/baseline/src/execution/worker-claim.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/execution/worker-claim.lisp")
   :BYTES 6401 :SHA256
   "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e")
  (:PATH "raw/mutations/baseline/src/execution/worker-run.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/execution/worker-run.lisp")
   :BYTES 5124 :SHA256
   "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542")
  (:PATH "raw/mutations/baseline/src/execution/worker-types.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/execution/worker-types.lisp")
   :BYTES 8461 :SHA256
   "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317")
  (:PATH "raw/mutations/baseline/src/execution/writer.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/execution/writer.lisp")
   :BYTES 6484 :SHA256
   "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105")
  (:PATH "raw/mutations/baseline/src/foundation/batch.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH "raw/mutations/baseline/src/foundation/binary.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH "raw/mutations/baseline/src/foundation/conditions.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH "raw/mutations/baseline/src/foundation/crc32c.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH "raw/mutations/baseline/src/foundation/package.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH "raw/mutations/baseline/src/foundation/record.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH "raw/mutations/baseline/src/get-resolver/build.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/get-resolver/build.lisp")
   :BYTES 6882 :SHA256
   "3715cb750e08ab30fcaa068a05b17772381a3cf1975bdbdd0c03f71761089ef6")
  (:PATH "raw/mutations/baseline/src/get-resolver/package.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/get-resolver/package.lisp")
   :BYTES 1887 :SHA256
   "f244c1346604ccde93880824ea990a4a7329340df6c8b665963713977ca0ee10")
  (:PATH "raw/mutations/baseline/src/get-resolver/read.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/get-resolver/read.lisp")
   :BYTES 7259 :SHA256
   "68f82df01f7894f66db0c6545267616e76c0ba93fd7c49db6434cec666f02dc3")
  (:PATH "raw/mutations/baseline/src/get-resolver/rows.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/get-resolver/rows.lisp")
   :BYTES 3350 :SHA256
   "d9db85d788006fc7ad1f9a7cdeef28b992605de7fac8c295dd7fdc51f5511854")
  (:PATH "raw/mutations/baseline/src/get-resolver/scan.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/get-resolver/scan.lisp")
   :BYTES 6786 :SHA256
   "35a1780c6bf66364ef94c4151fa91f02eebe359f0ca0639985d2a907fd9d512d")
  (:PATH "raw/mutations/baseline/src/get-resolver/sort.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/get-resolver/sort.lisp")
   :BYTES 7118 :SHA256
   "974bf44efeb1cd26c5e9db0601aea295c8f1a18234894ad9d41938a2880e2255")
  (:PATH "raw/mutations/baseline/src/get-resolver/types.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/get-resolver/types.lisp")
   :BYTES 1757 :SHA256
   "1334512380bfb01add33b0ca152c0ce4746b3f79bcd04f84d7844ef234d6eaba")
  (:PATH "raw/mutations/baseline/src/get/build.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/get/build.lisp")
   :BYTES 3745 :SHA256
   "bcfc4916e9a85833dc151c4ce176bc905f2c03b6bc6d636f97a60df0d8c16739")
  (:PATH "raw/mutations/baseline/src/get/lifecycle.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/get/lifecycle.lisp")
   :BYTES 5345 :SHA256
   "885ba4141114ea411cac37c9b5f924aaa7f9f2a5ba311ebf92a392e5da1e3c59")
  (:PATH "raw/mutations/baseline/src/get/lookup.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/get/lookup.lisp")
   :BYTES 4352 :SHA256
   "9d1042d4cf1e7bd9c6d1153de12b2459e7a2724e47bd32534cd7ae56cb274c5f")
  (:PATH "raw/mutations/baseline/src/get/package.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/get/package.lisp")
   :BYTES 1995 :SHA256
   "87b795779aef0c4b918a039d182daddd22b902a9ad10c763df4364b7e630151c")
  (:PATH "raw/mutations/baseline/src/get/segment.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/get/segment.lisp")
   :BYTES 8097 :SHA256
   "4a486528cb2c1cc3471cb4b332d4314d24011889e1f885db6fd5600bb077eea3")
  (:PATH "raw/mutations/baseline/src/get/target.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/get/target.lisp")
   :BYTES 5652 :SHA256
   "9f682f735e49108cad176a6143ec99e1be64da98f29cae0b52f9b49cdea34250")
  (:PATH "raw/mutations/baseline/src/get/types.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/get/types.lisp")
   :BYTES 4413 :SHA256
   "653b23a6e719cd1f55e7c58b4d7e8143aec5983992ba210d0eac1f4c8682f623")
  (:PATH "raw/mutations/baseline/src/hash/arithmetic.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/hash/arithmetic.lisp")
   :BYTES 3073 :SHA256
   "c439e534b768acb123d69b921b85e1e56683aa8335bbc87efba95fe95f256fa9")
  (:PATH "raw/mutations/baseline/src/hash/blocks.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/hash/blocks.lisp")
   :BYTES 3262 :SHA256
   "5f5dff95ae6c34dfc15538c537ba2fa8d34ba2376ad66ad9975745ea13a2175f")
  (:PATH "raw/mutations/baseline/src/hash/hash64.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/hash/hash64.lisp")
   :BYTES 1768 :SHA256
   "99e4c8394a8f877ce1f552f15a57a082c0ec81015e87119ee4ffea28cf3ae77f")
  (:PATH "raw/mutations/baseline/src/hash/package.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/hash/package.lisp")
   :BYTES 477 :SHA256
   "1e7668fa26fc1a8e3b3cfe824aa3e08b30b57441d5f90d44453fc3a9259a10d0")
  (:PATH "raw/mutations/baseline/src/index/core.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/index/core.lisp")
   :BYTES 2959 :SHA256
   "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff")
  (:PATH "raw/mutations/baseline/src/index/hash-digests.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/index/hash-digests.lisp")
   :BYTES 3674 :SHA256
   "924bb7dab91ff56c1e909f2b06dff5f74b443ac6442e379498f29b25f1fa2673")
  (:PATH "raw/mutations/baseline/src/index/hash-seed.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/index/hash-seed.lisp")
   :BYTES 2437 :SHA256
   "ae86514101e95737747ba58a4f0c5dc1ddb44d2b3a18bceb8fd0d0756b57a7a1")
  (:PATH "raw/mutations/baseline/src/index/package.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/index/package.lisp")
   :BYTES 727 :SHA256
   "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507")
  (:PATH "raw/mutations/baseline/src/index/primary-arena.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/index/primary-arena.lisp")
   :BYTES 3485 :SHA256
   "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5")
  (:PATH "raw/mutations/baseline/src/index/primary-build.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/index/primary-build.lisp")
   :BYTES 5379 :SHA256
   "06ca5ac8c03504e2d2f973873e5cabf7518c090cd1f8f2118c46e0ea2f9bf37b")
  (:PATH "raw/mutations/baseline/src/index/primary-core.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/index/primary-core.lisp")
   :BYTES 4211 :SHA256
   "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e")
  (:PATH "raw/mutations/baseline/src/index/primary-directory.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/index/primary-directory.lisp")
   :BYTES 8114 :SHA256
   "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd")
  (:PATH "raw/mutations/baseline/src/index/primary-package.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/index/primary-package.lisp")
   :BYTES 1451 :SHA256
   "0682eb9a61596506b6788bd0285f9808db2496246caae64ab3203182ed46b860")
  (:PATH "raw/mutations/baseline/src/index/primary-probe.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/index/primary-probe.lisp")
   :BYTES 5936 :SHA256
   "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4")
  (:PATH "raw/mutations/baseline/src/index/primary-read.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/index/primary-read.lisp")
   :BYTES 3575 :SHA256
   "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f")
  (:PATH "raw/mutations/baseline/src/index/primary-relocate.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/index/primary-relocate.lisp")
   :BYTES 4073 :SHA256
   "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20")
  (:PATH "raw/mutations/baseline/src/index/primary-types.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/index/primary-types.lisp")
   :BYTES 3949 :SHA256
   "f17ca0dcd8a538b921f00044e23872b28272638c4435eacd30f0509422505e64")
  (:PATH "raw/mutations/baseline/src/index/primary-write.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/index/primary-write.lisp")
   :BYTES 7061 :SHA256
   "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655")
  (:PATH "raw/mutations/baseline/src/index/read.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/index/read.lisp")
   :BYTES 3030 :SHA256
   "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7")
  (:PATH "raw/mutations/baseline/src/index/rebuild-budget.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/index/rebuild-budget.lisp")
   :BYTES 3593 :SHA256
   "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0")
  (:PATH "raw/mutations/baseline/src/index/rebuild-copy.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/index/rebuild-copy.lisp")
   :BYTES 4027 :SHA256
   "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee")
  (:PATH "raw/mutations/baseline/src/index/rebuild-scan.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/index/rebuild-scan.lisp")
   :BYTES 5002 :SHA256
   "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e")
  (:PATH "raw/mutations/baseline/src/index/rebuild.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/index/rebuild.lisp")
   :BYTES 2872 :SHA256
   "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1")
  (:PATH "raw/mutations/baseline/src/index/relocate.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/index/relocate.lisp")
   :BYTES 2383 :SHA256
   "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc")
  (:PATH "raw/mutations/baseline/src/index/types.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/index/types.lisp")
   :BYTES 2434 :SHA256
   "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e")
  (:PATH "raw/mutations/baseline/src/index/validation.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/index/validation.lisp")
   :BYTES 3930 :SHA256
   "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a")
  (:PATH "raw/mutations/baseline/src/index/write.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/index/write.lisp")
   :BYTES 4784 :SHA256
   "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28")
  (:PATH "raw/mutations/baseline/src/io/flush.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/io/flush.lisp")
   :BYTES 1569 :SHA256
   "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325")
  (:PATH "raw/mutations/baseline/src/io/lifecycle.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/io/lifecycle.lisp")
   :BYTES 4536 :SHA256
   "baa1f763fe0f394a14d381b753dcb1be1e90eb03eaff5d6469465b5d4eca015f")
  (:PATH "raw/mutations/baseline/src/io/native.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/io/native.lisp")
   :BYTES 5026 :SHA256
   "b8cf3ce1ff7b4fa9def8a602ab768c0e9a321f8d6cdce6e5b2b7ded2fe3d97dd")
  (:PATH "raw/mutations/baseline/src/io/package.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/io/package.lisp")
   :BYTES 592 :SHA256
   "118eba04ab2aa87a2d86e0b0269dbeacaa485457acebbc12c57317ae465a89c0")
  (:PATH "raw/mutations/baseline/src/io/transfer.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/io/transfer.lisp")
   :BYTES 5051 :SHA256
   "3748328cf85e1c007900a63bdd0f159f38a8d7cd3577c92c56fc68692b9b7bcf")
  (:PATH "raw/mutations/baseline/src/io/types.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/io/types.lisp")
   :BYTES 4143 :SHA256
   "50c7eeea91af232fca7103ce5a25535958d73836f01cb45a20c7120b88b1336b")
  (:PATH "raw/mutations/baseline/src/mvcc/package.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/mvcc/package.lisp")
   :BYTES 833 :SHA256
   "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c")
  (:PATH "raw/mutations/baseline/src/mvcc/snapshots-core.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/mvcc/snapshots-core.lisp")
   :BYTES 7622 :SHA256
   "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998")
  (:PATH "raw/mutations/baseline/src/mvcc/snapshots-csn.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/mvcc/snapshots-csn.lisp")
   :BYTES 2725 :SHA256
   "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77")
  (:PATH "raw/mutations/baseline/src/mvcc/snapshots-lifecycle.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/mvcc/snapshots-lifecycle.lisp")
   :BYTES 6609 :SHA256
   "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082")
  (:PATH "raw/mutations/baseline/src/mvcc/snapshots-read.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/mvcc/snapshots-read.lisp")
   :BYTES 6651 :SHA256
   "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9")
  (:PATH "raw/mutations/baseline/src/mvcc/snapshots-register.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/mvcc/snapshots-register.lisp")
   :BYTES 6654 :SHA256
   "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b")
  (:PATH "raw/mutations/baseline/src/mvcc/snapshots-types.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/mvcc/snapshots-types.lisp")
   :BYTES 3817 :SHA256
   "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f")
  (:PATH "raw/mutations/baseline/src/mvcc/types.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/mvcc/types.lisp")
   :BYTES 471 :SHA256
   "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50")
  (:PATH "raw/mutations/baseline/src/package.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH "raw/mutations/baseline/src/read/core.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/read/core.lisp")
   :BYTES 3846 :SHA256
   "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f")
  (:PATH "raw/mutations/baseline/src/read/package.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/read/package.lisp")
   :BYTES 831 :SHA256
   "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df")
  (:PATH "raw/mutations/baseline/src/read/task.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/read/task.lisp")
   :BYTES 5073 :SHA256
   "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2")
  (:PATH "raw/mutations/baseline/src/read/types.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/read/types.lisp")
   :BYTES 2358 :SHA256
   "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c")
  (:PATH "raw/mutations/baseline/src/recovery/decisions-build.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/recovery/decisions-build.lisp")
   :BYTES 11857 :SHA256
   "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115")
  (:PATH "raw/mutations/baseline/src/recovery/decisions-package.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/recovery/decisions-package.lisp")
   :BYTES 818 :SHA256
   "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39")
  (:PATH "raw/mutations/baseline/src/recovery/decisions-query.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/recovery/decisions-query.lisp")
   :BYTES 4525 :SHA256
   "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24")
  (:PATH "raw/mutations/baseline/src/recovery/decisions-radix.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/recovery/decisions-radix.lisp")
   :BYTES 11061 :SHA256
   "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54")
  (:PATH "raw/mutations/baseline/src/recovery/decisions-sort.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/recovery/decisions-sort.lisp")
   :BYTES 7654 :SHA256
   "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2")
  (:PATH "raw/mutations/baseline/src/recovery/decisions-types.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/recovery/decisions-types.lisp")
   :BYTES 2056 :SHA256
   "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c")
  (:PATH "raw/mutations/baseline/src/recovery/inventory-build.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/recovery/inventory-build.lisp")
   :BYTES 9592 :SHA256
   "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e")
  (:PATH "raw/mutations/baseline/src/recovery/inventory-query.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/recovery/inventory-query.lisp")
   :BYTES 2100 :SHA256
   "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb")
  (:PATH "raw/mutations/baseline/src/recovery/inventory-types.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/recovery/inventory-types.lisp")
   :BYTES 2392 :SHA256
   "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9")
  (:PATH "raw/mutations/baseline/src/recovery/manifest-build.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/recovery/manifest-build.lisp")
   :BYTES 10251 :SHA256
   "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471")
  (:PATH "raw/mutations/baseline/src/recovery/manifest-decode.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/recovery/manifest-decode.lisp")
   :BYTES 6160 :SHA256
   "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779")
  (:PATH "raw/mutations/baseline/src/recovery/manifest-fold.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/recovery/manifest-fold.lisp")
   :BYTES 7068 :SHA256
   "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730")
  (:PATH "raw/mutations/baseline/src/recovery/manifest-package.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/recovery/manifest-package.lisp")
   :BYTES 1372 :SHA256
   "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc")
  (:PATH "raw/mutations/baseline/src/recovery/manifest-query.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/recovery/manifest-query.lisp")
   :BYTES 3582 :SHA256
   "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b")
  (:PATH "raw/mutations/baseline/src/recovery/manifest-types.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/recovery/manifest-types.lisp")
   :BYTES 3345 :SHA256
   "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10")
  (:PATH "raw/mutations/baseline/src/recovery/package.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/recovery/package.lisp")
   :BYTES 927 :SHA256
   "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9")
  (:PATH "raw/mutations/baseline/src/recovery/scan.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/recovery/scan.lisp")
   :BYTES 12829 :SHA256
   "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218")
  (:PATH "raw/mutations/baseline/src/series/events.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/series/events.lisp")
   :BYTES 9566 :SHA256
   "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7")
  (:PATH "raw/mutations/baseline/src/series/io-events.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/series/io-events.lisp")
   :BYTES 5385 :SHA256
   "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546")
  (:PATH "raw/mutations/baseline/src/series/ownership.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/series/ownership.lisp")
   :BYTES 8810 :SHA256
   "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4")
  (:PATH "raw/mutations/baseline/src/series/package.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/series/package.lisp")
   :BYTES 1392 :SHA256
   "7433162105df63d324141167e6dcf6bfee74611aa1cf7291cc6c92f41f3c7408")
  (:PATH "raw/mutations/baseline/src/series/publication.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/series/publication.lisp")
   :BYTES 6094 :SHA256
   "288cb3fa41fad76a0e6919dfa0b2fce2beef15f5880129393bee35bc8795c762")
  (:PATH "raw/mutations/baseline/src/series/query.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/series/query.lisp")
   :BYTES 3600 :SHA256
   "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9")
  (:PATH "raw/mutations/baseline/src/series/retirement.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/series/retirement.lisp")
   :BYTES 4634 :SHA256
   "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059")
  (:PATH "raw/mutations/baseline/src/series/types.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/series/types.lisp")
   :BYTES 3316 :SHA256
   "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9")
  (:PATH "raw/mutations/baseline/src/series/worker-boundary.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/series/worker-boundary.lisp")
   :BYTES 3443 :SHA256
   "793d401d1b9acc7b67923d815560f277f3d390ca050740f735f07d88dbacfe73")
  (:PATH "raw/mutations/baseline/src/series/worker-package.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/series/worker-package.lisp")
   :BYTES 1036 :SHA256
   "881a2958ddb8f5781954d4c59d7467e34c03c01fbb2fea43dc06e9e2050a1f37")
  (:PATH "raw/mutations/baseline/src/series/worker-run.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/series/worker-run.lisp")
   :BYTES 6985 :SHA256
   "f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f")
  (:PATH "raw/mutations/baseline/src/series/worker-types.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/series/worker-types.lisp")
   :BYTES 6493 :SHA256
   "a366799fd9b938bfaa48b0ffda228ff8369ab9acb5b5ead7f081dfc66ab2c81a")
  (:PATH "raw/mutations/baseline/src/storage/compaction-scan.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/storage/compaction-scan.lisp")
   :BYTES 5510 :SHA256
   "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d")
  (:PATH "raw/mutations/baseline/src/storage/control-payload.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/storage/control-payload.lisp")
   :BYTES 6273 :SHA256
   "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491")
  (:PATH "raw/mutations/baseline/src/storage/formats.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/storage/formats.lisp")
   :BYTES 3841 :SHA256
   "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f")
  (:PATH "raw/mutations/baseline/src/storage/log-header.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/storage/log-header.lisp")
   :BYTES 3947 :SHA256
   "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81")
  (:PATH "raw/mutations/baseline/src/storage/package.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/storage/package.lisp")
   :BYTES 1079 :SHA256
   "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e")
  (:PATH "raw/mutations/baseline/src/storage/payload-record.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/storage/payload-record.lisp")
   :BYTES 3641 :SHA256
   "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7")
  (:PATH "raw/mutations/baseline/src/storage/payload-write.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/storage/payload-write.lisp")
   :BYTES 5239 :SHA256
   "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc")
  (:PATH "raw/mutations/baseline/src/storage/segment-header.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/storage/segment-header.lisp")
   :BYTES 5517 :SHA256
   "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011")
  (:PATH "raw/mutations/baseline/src/wal/builder.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/wal/builder.lisp")
   :BYTES 8445 :SHA256
   "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0")
  (:PATH "raw/mutations/baseline/src/wal/csn.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/wal/csn.lisp")
   :BYTES 9577 :SHA256
   "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810")
  (:PATH "raw/mutations/baseline/src/wal/executor.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/wal/executor.lisp")
   :BYTES 6023 :SHA256
   "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8")
  (:PATH "raw/mutations/baseline/src/wal/group.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/wal/group.lisp")
   :BYTES 6305 :SHA256
   "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b")
  (:PATH "raw/mutations/baseline/src/wal/package.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/wal/package.lisp")
   :BYTES 1774 :SHA256
   "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89")
  (:PATH "raw/mutations/baseline/src/wal/types.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/src/wal/types.lisp")
   :BYTES 5420 :SHA256
   "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e")
  (:PATH "raw/mutations/baseline/test.log" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/test.log")
   :BYTES 59871 :SHA256
   "b45fa4fe6652976ecbc941033db5576fce22c821b4c7982e1f200f5e13314c89")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-header.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/codec/cbor-header.lisp")
   :BYTES 10773 :SHA256
   "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-minimal-edges.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/codec/cbor-minimal-edges.lisp")
   :BYTES 1613 :SHA256
   "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-minimal-scan-support.lisp"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/codec/cbor-minimal-scan-support.lisp")
   :BYTES 8363 :SHA256
   "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-minimal-scan-threads.lisp"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/codec/cbor-minimal-scan-threads.lisp")
   :BYTES 4547 :SHA256
   "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-minimal-scan.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/codec/cbor-minimal-scan.lisp")
   :BYTES 19217 :SHA256
   "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-minimal-support.lisp" :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/codec/cbor-minimal-support.lisp")
   :BYTES 8620 :SHA256
   "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-minimal-threads.lisp" :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/codec/cbor-minimal-threads.lisp")
   :BYTES 3799 :SHA256
   "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-minimal.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/codec/cbor-minimal.lisp")
   :BYTES 12604 :SHA256
   "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-simple-write-support.lisp"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/codec/cbor-simple-write-support.lisp")
   :BYTES 4955 :SHA256
   "53ceafc72a027a2ff1f787900558ff26f2ff70bbb212f1b37926a6d520fbe86e")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-simple-write-threads.lisp"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/codec/cbor-simple-write-threads.lisp")
   :BYTES 3561 :SHA256
   "77074033e75a224fd02e890f98dffa8e97d3a1f8bedd510b00ea55d8ff8687b2")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-simple-write.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/codec/cbor-simple-write.lisp")
   :BYTES 10712 :SHA256
   "958bdd3901cfc41032c09d6c9023b192799981884e09ce3573256ff45bc5329a")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-string-write-support.lisp"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/codec/cbor-string-write-support.lisp")
   :BYTES 6868 :SHA256
   "2cbdb601f442a56456bc637c94e759cc965f44b178268dce3c636c385d34fc39")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-string-write-threads.lisp"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/codec/cbor-string-write-threads.lisp")
   :BYTES 3512 :SHA256
   "8e07b881a55e2554a429f1c8b2c69f67862ac015217d90d019167d636564d27d")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-string-write.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/codec/cbor-string-write.lisp")
   :BYTES 15883 :SHA256
   "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-structure-support.lisp"
   :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-structure-threads.lisp"
   :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/codec/cbor-structure-threads.lisp")
   :BYTES 4305 :SHA256
   "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-structure.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/codec/cbor-structure.lisp")
   :BYTES 22968 :SHA256
   "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-support.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-threads.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/codec/cbor-threads.lisp")
   :BYTES 3683 :SHA256
   "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-write-roundtrip.lisp" :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/codec/cbor-write-roundtrip.lisp")
   :BYTES 901 :SHA256
   "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-write-support.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/codec/cbor-write-support.lisp")
   :BYTES 4768 :SHA256
   "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-write-threads.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/codec/cbor-write-threads.lisp")
   :BYTES 3813 :SHA256
   "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-write.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/codec/cbor-write.lisp")
   :BYTES 9822 :SHA256
   "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3")
  (:PATH "raw/mutations/baseline/tests/codec/support.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/codec/support.lisp")
   :BYTES 5807 :SHA256
   "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96")
  (:PATH "raw/mutations/baseline/tests/codec/threads.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/codec/threads.lisp")
   :BYTES 3111 :SHA256
   "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337")
  (:PATH "raw/mutations/baseline/tests/codec/utf8.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/codec/utf8.lisp")
   :BYTES 12892 :SHA256
   "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100")
  (:PATH "raw/mutations/baseline/tests/csn/registry.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/csn/registry.lisp")
   :BYTES 19411 :SHA256
   "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950")
  (:PATH "raw/mutations/baseline/tests/csn/support.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/csn/support.lisp")
   :BYTES 11407 :SHA256
   "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db")
  (:PATH "raw/mutations/baseline/tests/csn/threads.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/csn/threads.lisp")
   :BYTES 10525 :SHA256
   "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2")
  (:PATH "raw/mutations/baseline/tests/epochs/lifecycle.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/epochs/lifecycle.lisp")
   :BYTES 25394 :SHA256
   "ddc2fbdad9f97d2e4ff008c167776a50b17b742398306fbd5198dca474559cbf")
  (:PATH "raw/mutations/baseline/tests/epochs/support.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/epochs/support.lisp")
   :BYTES 5943 :SHA256
   "366be7af4bf6c4ed946b3fa9e97aea6b034c83e3b757d81c54078dc76d229b6d")
  (:PATH "raw/mutations/baseline/tests/epochs/threads.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/epochs/threads.lisp")
   :BYTES 3654 :SHA256
   "54b73e06c61e64f32a3e3af0791891dacb6590e929163dcf0fac95f2c71e66fd")
  (:PATH "raw/mutations/baseline/tests/execution/handoff.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/execution/handoff.lisp")
   :BYTES 33278 :SHA256
   "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e")
  (:PATH "raw/mutations/baseline/tests/execution/queue.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/execution/queue.lisp")
   :BYTES 12894 :SHA256
   "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722")
  (:PATH "raw/mutations/baseline/tests/execution/ready-recycle.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/execution/ready-recycle.lisp")
   :BYTES 30075 :SHA256
   "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae")
  (:PATH "raw/mutations/baseline/tests/execution/ready.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/execution/ready.lisp")
   :BYTES 33555 :SHA256
   "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e")
  (:PATH "raw/mutations/baseline/tests/execution/support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/execution/support.lisp")
   :BYTES 4469 :SHA256
   "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43")
  (:PATH "raw/mutations/baseline/tests/execution/threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/execution/threads.lisp")
   :BYTES 14622 :SHA256
   "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359")
  (:PATH "raw/mutations/baseline/tests/execution/worker.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/execution/worker.lisp")
   :BYTES 59783 :SHA256
   "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06")
  (:PATH "raw/mutations/baseline/tests/foundation/batch.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/foundation/batch.lisp")
   :BYTES 5185 :SHA256
   "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183")
  (:PATH "raw/mutations/baseline/tests/foundation/binary.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/foundation/binary.lisp")
   :BYTES 3721 :SHA256
   "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe")
  (:PATH "raw/mutations/baseline/tests/foundation/record.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/foundation/record.lisp")
   :BYTES 14950 :SHA256
   "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8")
  (:PATH "raw/mutations/baseline/tests/foundation/support.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:PATH "raw/mutations/baseline/tests/get-performance/guards.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/get-performance/guards.lisp")
   :BYTES 8986 :SHA256
   "c41721b917ed443355ea3707efdd07e7da53a978c0515ab1e5ede5fcc47d63fc")
  (:PATH "raw/mutations/baseline/tests/get-performance/paths.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/get-performance/paths.lisp")
   :BYTES 4936 :SHA256
   "3b8d2c9c93467507ea2bb471d42192eb1fa084b55c0f4263b5ef0d3acf468f55")
  (:PATH "raw/mutations/baseline/tests/get-performance/support.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/get-performance/support.lisp")
   :BYTES 22497 :SHA256
   "e586ed94dcb2aaba00282931cdd83313e4f84a86d4d1ba85e2d56e8b7433ed8d")
  (:PATH "raw/mutations/baseline/tests/get-performance/threads.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/get-performance/threads.lisp")
   :BYTES 4744 :SHA256
   "05ace5eb351ab49da59611dc1a2a5abedb9d723a2fc6e75a30fc76e507573a90")
  (:PATH "raw/mutations/baseline/tests/hash/guards.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/hash/guards.lisp")
   :BYTES 1162 :SHA256
   "9af5b38443a57d224990a68e93f12f7a4cda306f94c7ccd3ccb50635865d7864")
  (:PATH "raw/mutations/baseline/tests/hash/hash64.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/hash/hash64.lisp")
   :BYTES 17948 :SHA256
   "70606bc68807143cfea9583871474c84efc868d13692cde28488284dee43e0f1")
  (:PATH "raw/mutations/baseline/tests/hash/support.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/hash/support.lisp")
   :BYTES 10828 :SHA256
   "0fae9dc36976af544f83e6051b9cf9d67c9bef0b9e25f1fa2a48fdac48592acb")
  (:PATH "raw/mutations/baseline/tests/hash/threads.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/hash/threads.lisp")
   :BYTES 6701 :SHA256
   "3fc587a57d26a294aebfc6a7aeadf2f61a42a21106c1c57517f891b76b4e750a")
  (:PATH "raw/mutations/baseline/tests/index/hash-digests.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/index/hash-digests.lisp")
   :BYTES 35926 :SHA256
   "3b3b39f861883cf2017cab8e6488560a6bb3897d63784f00e820a6450d743225")
  (:PATH "raw/mutations/baseline/tests/index/primary-support.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/index/primary-support.lisp")
   :BYTES 13938 :SHA256
   "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a")
  (:PATH "raw/mutations/baseline/tests/index/primary-threads.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/index/primary-threads.lisp")
   :BYTES 13744 :SHA256
   "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2")
  (:PATH "raw/mutations/baseline/tests/index/primary.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/index/primary.lisp")
   :BYTES 30166 :SHA256
   "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696")
  (:PATH "raw/mutations/baseline/tests/index/rebuild.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/index/rebuild.lisp")
   :BYTES 32112 :SHA256
   "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1")
  (:PATH "raw/mutations/baseline/tests/index/slot-support.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/index/slot-support.lisp")
   :BYTES 12800 :SHA256
   "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31")
  (:PATH "raw/mutations/baseline/tests/index/slot-threads.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/index/slot-threads.lisp")
   :BYTES 11698 :SHA256
   "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f")
  (:PATH "raw/mutations/baseline/tests/index/slots.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/index/slots.lisp")
   :BYTES 26420 :SHA256
   "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb")
  (:PATH "raw/mutations/baseline/tests/io/native.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/io/native.lisp")
   :BYTES 6207 :SHA256
   "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0")
  (:PATH "raw/mutations/baseline/tests/io/support.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/io/support.lisp")
   :BYTES 2951 :SHA256
   "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50")
  (:PATH "raw/mutations/baseline/tests/io/transfer.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/io/transfer.lisp")
   :BYTES 11847 :SHA256
   "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd")
  (:PATH "raw/mutations/baseline/tests/lint-fixtures/bad.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/lint-fixtures/bad.lisp")
   :BYTES 1587 :SHA256
   "ac8912ce6cc1101f2ebc305a50c0565879547b527d7ca0aeac900ee06bf26652")
  (:PATH "raw/mutations/baseline/tests/lint-fixtures/good.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/lint-fixtures/good.lisp")
   :BYTES 671 :SHA256
   "05ce84f8fd12d9af48252601bcc92d6d60335b53f39b01a9fe2697c4bdaa8cee")
  (:PATH "raw/mutations/baseline/tests/lint-fixtures/keyword-barrier.lisp"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/lint-fixtures/keyword-barrier.lisp")
   :BYTES 199 :SHA256
   "e26dab117e9526ace35bb45b92f977065d33fcc4404c40fd4fc3c77749689a96")
  (:PATH "raw/mutations/baseline/tests/lint-fixtures/qualified-reader.lisp"
   :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/lint-fixtures/qualified-reader.lisp")
   :BYTES 152 :SHA256
   "835229bdc1a0ed0c08511cd6121e1f1bc4284da2cfba951b72cd1a74a6040d35")
  (:PATH "raw/mutations/baseline/tests/mvcc/capture.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/mvcc/capture.lisp")
   :BYTES 16356 :SHA256
   "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35")
  (:PATH "raw/mutations/baseline/tests/mvcc/lifecycle.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/mvcc/lifecycle.lisp")
   :BYTES 23964 :SHA256
   "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16")
  (:PATH "raw/mutations/baseline/tests/mvcc/support.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/mvcc/support.lisp")
   :BYTES 5931 :SHA256
   "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290")
  (:PATH "raw/mutations/baseline/tests/read/lifecycle.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/read/lifecycle.lisp")
   :BYTES 17804 :SHA256
   "c4c4642408816f2e0e809e21d04739b68b9391237e3e46ea0b195ed82857c3a8")
  (:PATH "raw/mutations/baseline/tests/read/support.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/read/support.lisp")
   :BYTES 4845 :SHA256
   "8095cc39d49342f6e43f3421b4fced839da02d8d11b4d8ddcd91bd346447e754")
  (:PATH "raw/mutations/baseline/tests/read/threads.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/read/threads.lisp")
   :BYTES 4150 :SHA256
   "e2e223b69b08a5d76b9773c6ad4dee13ef2ddbb6f5ababa713cc5654bc7b51c5")
  (:PATH "raw/mutations/baseline/tests/recovery/corruption.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/recovery/corruption.lisp")
   :BYTES 7106 :SHA256
   "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c")
  (:PATH "raw/mutations/baseline/tests/recovery/decisions-audit.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/recovery/decisions-audit.lisp")
   :BYTES 14971 :SHA256
   "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0")
  (:PATH "raw/mutations/baseline/tests/recovery/decisions-radix.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/recovery/decisions-radix.lisp")
   :BYTES 27851 :SHA256
   "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0")
  (:PATH "raw/mutations/baseline/tests/recovery/decisions-support.lisp" :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/recovery/decisions-support.lisp")
   :BYTES 6797 :SHA256
   "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4")
  (:PATH "raw/mutations/baseline/tests/recovery/decisions.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/recovery/decisions.lisp")
   :BYTES 19149 :SHA256
   "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e")
  (:PATH "raw/mutations/baseline/tests/recovery/inventory-support.lisp" :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/recovery/inventory-support.lisp")
   :BYTES 8083 :SHA256
   "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27")
  (:PATH "raw/mutations/baseline/tests/recovery/inventory.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/recovery/inventory.lisp")
   :BYTES 14479 :SHA256
   "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9")
  (:PATH "raw/mutations/baseline/tests/recovery/manifest-audit.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/recovery/manifest-audit.lisp")
   :BYTES 17670 :SHA256
   "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6")
  (:PATH "raw/mutations/baseline/tests/recovery/manifest-support.lisp" :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/recovery/manifest-support.lisp")
   :BYTES 9769 :SHA256
   "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830")
  (:PATH "raw/mutations/baseline/tests/recovery/manifest.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/recovery/manifest.lisp")
   :BYTES 13799 :SHA256
   "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd")
  (:PATH "raw/mutations/baseline/tests/recovery/scan.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/recovery/scan.lisp")
   :BYTES 16966 :SHA256
   "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b")
  (:PATH "raw/mutations/baseline/tests/recovery/support.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/recovery/support.lisp")
   :BYTES 5957 :SHA256
   "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204")
  (:PATH "raw/mutations/baseline/tests/series/boundaries.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/series/boundaries.lisp")
   :BYTES 5802 :SHA256
   "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8")
  (:PATH "raw/mutations/baseline/tests/series/controller.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/series/controller.lisp")
   :BYTES 60484 :SHA256
   "4bea80eb231575f48b208ddb57af6a11706481e0ec755b084f6cd4b6fd0481a1")
  (:PATH "raw/mutations/baseline/tests/series/support.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/series/support.lisp")
   :BYTES 16885 :SHA256
   "8821ae9e002941eff8ea3ae7dbfc727cb6874b68d2d1ef85af668eb2d34a0c0c")
  (:PATH "raw/mutations/baseline/tests/series/threads.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/series/threads.lisp")
   :BYTES 19694 :SHA256
   "bbea64d207d14698b39ab0f8ded03db11bab09955d3f66705c23d69c09aefc8e")
  (:PATH "raw/mutations/baseline/tests/series/worker-bridge.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/series/worker-bridge.lisp")
   :BYTES 56677 :SHA256
   "c1ee49702e63978a83cb86c4e5bf437a5a40e48fa02b65d3eaf3dca0d2e39176")
  (:PATH "raw/mutations/baseline/tests/smoke.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/smoke.lisp")
   :BYTES 735 :SHA256
   "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8")
  (:PATH "raw/mutations/baseline/tests/storage/compaction-scan.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/storage/compaction-scan.lisp")
   :BYTES 16196 :SHA256
   "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5")
  (:PATH "raw/mutations/baseline/tests/storage/control-payload.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/storage/control-payload.lisp")
   :BYTES 12651 :SHA256
   "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae")
  (:PATH "raw/mutations/baseline/tests/storage/log-header.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/storage/log-header.lisp")
   :BYTES 11969 :SHA256
   "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e")
  (:PATH "raw/mutations/baseline/tests/storage/segment-header.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/storage/segment-header.lisp")
   :BYTES 4149 :SHA256
   "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df")
  (:PATH "raw/mutations/baseline/tests/storage/support.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/storage/support.lisp")
   :BYTES 4029 :SHA256
   "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625")
  (:PATH "raw/mutations/baseline/tests/wal/builder.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/wal/builder.lisp")
   :BYTES 4000 :SHA256
   "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6")
  (:PATH "raw/mutations/baseline/tests/wal/csn-threads.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/wal/csn-threads.lisp")
   :BYTES 12114 :SHA256
   "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c")
  (:PATH "raw/mutations/baseline/tests/wal/csn.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/wal/csn.lisp")
   :BYTES 34661 :SHA256
   "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a")
  (:PATH "raw/mutations/baseline/tests/wal/fault.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/wal/fault.lisp")
   :BYTES 7614 :SHA256
   "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875")
  (:PATH "raw/mutations/baseline/tests/wal/group.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/wal/group.lisp")
   :BYTES 5524 :SHA256
   "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e")
  (:PATH "raw/mutations/baseline/tests/wal/native.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/wal/native.lisp")
   :BYTES 2567 :SHA256
   "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7")
  (:PATH "raw/mutations/baseline/tests/wal/support.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tests/wal/support.lisp")
   :BYTES 1951 :SHA256
   "90a47539e5e2898c0a08059207f30bb5551e7ca8fc166f8f6ce7b95afa757295")
  (:PATH "raw/mutations/baseline/tools/build.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/baseline/tools/cbor-simple-write-isolated-build.lisp"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/tools/cbor-simple-write-isolated-build.lisp")
   :BYTES 492 :SHA256
   "f9dada238bc7c04343c62695a24b7dce23df44e6c2157e2fb632336a66c06f01")
  (:PATH "raw/mutations/report.lisp" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/report.lisp")
   :BYTES 61536 :SHA256
   "bf742a9f60494cfb5b61a4f10c4311fb45cf87ced05e74c4776d8988c0bdf93b")
  (:PATH "raw/physical-capacity-revision/data-audit-v0.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/physical-capacity-revision/data-audit-v0.lisp")
   :BYTES 31949 :SHA256
   "f887feba51b48ca11323d851b4a7305485b02ce1ca9d96b10128470d084dc815")
  (:PATH "raw/physical-capacity-revision/data-audit.diff" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/physical-capacity-revision/data-audit.diff")
   :BYTES 489 :SHA256
   "50521d8cac1e0f748e94e2d03dd3fcd37f7d925b1db2525635da5e44458a2695")
  (:PATH "raw/physical-capacity-revision/mutation-v0.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/physical-capacity-revision/mutation-v0.lisp")
   :BYTES 35600 :SHA256
   "b0f1c5f2e1770ac4a9954545b2e1bbd5ecaa7b5d70ef5099f36a12a91e402c4a")
  (:PATH "raw/physical-capacity-revision/mutation.diff" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/physical-capacity-revision/mutation.diff")
   :BYTES 460 :SHA256
   "f9fdfc4e2856619b47921992d51186d600f1ddfeba4adee4a181d2569c366fcc")
  (:PATH "raw/readings/c4-review-draft.md.txt" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/c4-review-draft.md.txt")
   :BYTES 10509 :SHA256
   "1208bbc3dfa6da90780d4536e66ba19a9118b2b57181df290ad2fe5b2f8f8317")
  (:PATH "raw/worker-protocol-fix/README.md" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/worker-protocol-fix/README.md")
   :BYTES 2924 :SHA256
   "0c85c9e8d4a0a76cbbbe7ceb90b376df3aecf126c64f90cebbbd4abaeef7647d")
  (:PATH "raw/worker-protocol-fix/cbor-string-write-support.after.lisp" :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/worker-protocol-fix/cbor-string-write-support.after.lisp")
   :BYTES 6868 :SHA256
   "2cbdb601f442a56456bc637c94e759cc965f44b178268dce3c636c385d34fc39")
  (:PATH "raw/worker-protocol-fix/cbor-string-write-support.before.lisp"
   :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/worker-protocol-fix/cbor-string-write-support.before.lisp")
   :BYTES 6829 :SHA256
   "611ec1d825855d9df27988821ee45f0ecf81fbd3128a38df6ee5c727551cd9f2")
  (:PATH "raw/worker-protocol-fix/cbor-string-write-threads.after.lisp" :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/worker-protocol-fix/cbor-string-write-threads.after.lisp")
   :BYTES 3512 :SHA256
   "8e07b881a55e2554a429f1c8b2c69f67862ac015217d90d019167d636564d27d")
  (:PATH "raw/worker-protocol-fix/cbor-string-write-threads.before.lisp"
   :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/worker-protocol-fix/cbor-string-write-threads.before.lisp")
   :BYTES 3311 :SHA256
   "d45b4dda658a96b9af9051b152df2b17859aecdbb9131505d1a2689b27ffb88a")
  (:PATH "raw/worker-protocol-fix/worker-protocol.patch" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/worker-protocol-fix/worker-protocol.patch")
   :BYTES 3419 :SHA256
   "7a1852177f1e84101406dd15e9e0e67995d3fc7e384d9004bb81496888785481"))
 :LIMITS
 (:SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :FASL-EXCLUDED-FROM-PUBLISHED-MUTATION-TREES
  :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
