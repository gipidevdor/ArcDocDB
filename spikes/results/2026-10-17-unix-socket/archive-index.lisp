(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "command-0" :RECORD-PATH "processes/command-0/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((17) BASE-CHAR . "--non-interactive") #A((6) BASE-CHAR . "--eval")
    #A((25) BASE-CHAR . "(require :sb-bsd-sockets)")
    #A((6) BASE-CHAR . "--eval") #A((19) BASE-CHAR . "(require :sb-posix)")
    #A((6) BASE-CHAR . "--eval")
    #A((49) BASE-CHAR . "(describe (function sb-sys:wait-until-fd-usable))")
    #A((6) BASE-CHAR . "--eval")
    #A((51) BASE-CHAR . "(describe (function sb-bsd-sockets:socket-receive))")
    #A((6) BASE-CHAR . "--eval")
    #A((48) BASE-CHAR . "(describe (function sb-bsd-sockets:socket-send))")
    #A((6) BASE-CHAR . "--eval")
    #A((38) BASE-CHAR . "(describe (function sb-posix:mkdtemp))"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-2" :RECORD-PATH "processes/command-2/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "spikes/SPK-11-unix-socket/run.lisp")
    #A((7) BASE-CHAR . "--check"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-3" :RECORD-PATH "processes/command-3/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "spikes/SPK-11-unix-socket/run.lisp")
    #A((7) BASE-CHAR . "--check"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-4" :RECORD-PATH "processes/command-4/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "spikes/SPK-11-unix-socket/run.lisp")
    #A((7) BASE-CHAR . "--check"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-5" :RECORD-PATH "processes/command-5/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "spikes/SPK-11-unix-socket/run.lisp")
    #A((7) BASE-CHAR . "--check"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-6" :RECORD-PATH "processes/command-6/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "spikes/SPK-11-unix-socket/run.lisp")
    #A((7) BASE-CHAR . "--check"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-7" :RECORD-PATH "processes/command-7/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "make") #A((11) BASE-CHAR . "trace-write")) :STATUS
   :SOURCE-CHANGED :EXIT-CODE 0 :SOURCE-CONSISTENCY :CHANGED)
  (:LABEL "command-8" :RECORD-PATH "processes/command-8/report.lisp" :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-9" :RECORD-PATH "processes/command-9/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "make") #A((4) BASE-CHAR . "test")
    #A((4) BASE-CHAR . "lint") #A((5) BASE-CHAR . "trace")
    #A((5) BASE-CHAR . "links"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-10" :RECORD-PATH "processes/command-10/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((13) BASE-CHAR . "tools/ci.lisp")
    #A((4) BASE-CHAR . "plan") #A((5) BASE-CHAR . "--out")
    #A((39) BASE-CHAR . "spikes/out/ci/integration-plan-4b5432ea"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-11" :RECORD-PATH "processes/command-11/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((58) BASE-CHAR
       . "/tmp/arcdocdb-unix-integration-Zq6kA8/preserve-finder.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-12" :RECORD-PATH "processes/command-12/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((13) BASE-CHAR . "tools/ci.lisp")
    #A((4) BASE-CHAR . "plan") #A((5) BASE-CHAR . "--out")
    #A((41) BASE-CHAR . "spikes/out/ci/integration-plan-4b5432ea-2"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-13" :RECORD-PATH "processes/command-13/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((57) BASE-CHAR
       . "/tmp/arcdocdb-unix-integration-Zq6kA8/restore-finder.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-14" :RECORD-PATH "processes/command-14/report.lisp" :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-15" :RECORD-PATH "processes/command-15/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((13) BASE-CHAR . "tools/ci.lisp")
    #A((9) BASE-CHAR . "self-test") #A((5) BASE-CHAR . "--out")
    #A((39) BASE-CHAR . "spikes/out/ci/selftest-1792231092-32466"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-16" :RECORD-PATH "processes/command-16/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((61) BASE-CHAR
       . "/tmp/arcdocdb-unix-integration-Zq6kA8/verify-integration.lisp")
    #A((49) BASE-CHAR . "spikes/out/4001219063-command-16748-0/report.lisp")
    #A((49) BASE-CHAR . "spikes/out/4001219892-command-32469-0/report.lisp")
    #A((61) BASE-CHAR
       . "/tmp/arcdocdb-unix-integration-Zq6kA8/integration-inputs.lisp"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((78) BASE-CHAR
      . "/private/tmp/arcdocdb-unix-integration-Zq6kA8/unix-archive-manifest-final.lisp")
   :BYTES 12588 :SHA256
   "3749b4b572983b0dd5589a2cb7da899031bfc23afe6bd8a271d8e70af208379c")
  (:PATH "collection-source.lisp" :SOURCE
   #A((74) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")
  (:PATH "processes/command-0/conservazione.lisp" :SOURCE
   #A((96) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001216923-command-70250-0/conservazione.lisp")
   :BYTES 1079 :SHA256
   "f10b6314edae4ff1b9644c6b5ef314f0efdfdf31ea55f890d667ff5bf6e4bad6")
  (:PATH "processes/command-0/report.lisp" :SOURCE
   #A((89) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001216923-command-70250-0/report.lisp")
   :BYTES 248506 :SHA256
   "2e97baa9dc5706a8520bc4f10fb678a2fb172c876e55109dc0c3ae107c197793")
  (:PATH "processes/command-1/SPK-11.lisp" :SOURCE
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001217248-check-76247-0/SPK-11.lisp")
   :BYTES 62831 :SHA256
   "6efa22b0d86ca291333e10a29daa1c9f38430c5f33c3d43e6a2903b9f4b0a89a")
  (:PATH "processes/command-1/conservazione.lisp" :SOURCE
   #A((94) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001217248-check-76247-0/conservazione.lisp")
   :BYTES 1075 :SHA256
   "5f35ce08bb3064827e4b3be3fcefa4912dd44940b525d2a851aae624c5f8a8d7")
  (:PATH "processes/command-1/report.lisp" :SOURCE
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001217248-check-76247-0/report.lisp")
   :BYTES 37954 :SHA256
   "9a92d5a13162bf66b87c758a662f1314b3c479c038188b72b6c3c9a001633429")
  (:PATH "processes/command-10/conservazione.lisp" :SOURCE
   #A((96) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001219079-command-16953-0/conservazione.lisp")
   :BYTES 1079 :SHA256
   "26f8fe5e67b94e93d6db2c6ed9ab2e2ecd4ed3768fbce57bfaf6153a3b9c29d1")
  (:PATH "processes/command-10/report.lisp" :SOURCE
   #A((89) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001219079-command-16953-0/report.lisp")
   :BYTES 256070 :SHA256
   "fd333b1e76fd5bf5052313ddc44477d961cc9d3f0eeea442385206596cd38478")
  (:PATH "processes/command-11/conservazione.lisp" :SOURCE
   #A((96) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001219205-command-19394-0/conservazione.lisp")
   :BYTES 1079 :SHA256
   "bb38c5422b7cd9f49661fe35978d1bc13fdd6dfd5cf9abd68b901ec311d2b67e")
  (:PATH "processes/command-11/report.lisp" :SOURCE
   #A((89) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001219205-command-19394-0/report.lisp")
   :BYTES 255945 :SHA256
   "679e1099049cb188eb2c0867bf09a865ed8b0c7987435d334a369954a04f8672")
  (:PATH "processes/command-12/conservazione.lisp" :SOURCE
   #A((96) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001219217-command-19777-0/conservazione.lisp")
   :BYTES 1079 :SHA256
   "48451505318a9d740b62fb300509bf59c862f9118de4ea79b58b49cdbb2aca22")
  (:PATH "processes/command-12/report.lisp" :SOURCE
   #A((89) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001219217-command-19777-0/report.lisp")
   :BYTES 255990 :SHA256
   "f2ed9c2e84c58447e2ba125bf9d0f54640abdd28b1aca64f61b200316b30568e")
  (:PATH "processes/command-13/conservazione.lisp" :SOURCE
   #A((96) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001219410-command-24433-0/conservazione.lisp")
   :BYTES 1079 :SHA256
   "72f7e52580e4237f8181d351e2a39b81bdb6008e242d0b780441e932ab59ab4b")
  (:PATH "processes/command-13/report.lisp" :SOURCE
   #A((89) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001219410-command-24433-0/report.lisp")
   :BYTES 255959 :SHA256
   "ef8ba7524c54f6e9af896b3f6908b7eb9c654b89de9db047e8685766a476bd8f")
  (:PATH "processes/command-14/conservazione.lisp" :SOURCE
   #A((96) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001219063-command-16748-0/conservazione.lisp")
   :BYTES 1636 :SHA256
   "29c411ab4791ecc3281accfdaf13f8f189b42ab8a672d530685060aa32ea0471")
  (:PATH "processes/command-14/report.lisp" :SOURCE
   #A((89) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001219063-command-16748-0/report.lisp")
   :BYTES 317 :SHA256
   "95a4a25b94a91242c729f53deb02b2eccd189e00e2da94a55fd7924880dc82d7")
  (:PATH "processes/command-14/report.lisp.gz" :SOURCE
   #A((92) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001219063-command-16748-0/report.lisp.gz")
   :BYTES 255717 :SHA256
   "203438f435aa323db919a90bfd97b28dae9eee3fb6ee8a3ebb9421a28620a9b8")
  (:PATH "processes/command-15/conservazione.lisp" :SOURCE
   #A((96) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001219892-command-32469-0/conservazione.lisp")
   :BYTES 1079 :SHA256
   "9b93cb7ddf2f6578de60b5a118c8590f9db67343a0639257bf33a3c894fb1536")
  (:PATH "processes/command-15/report.lisp" :SOURCE
   #A((89) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001219892-command-32469-0/report.lisp")
   :BYTES 256473 :SHA256
   "3caf4d94848e9cc104fed74b42502e6621958eee9c0c3f698ef106149fb8a558")
  (:PATH "processes/command-16/conservazione.lisp" :SOURCE
   #A((96) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001220016-command-39264-0/conservazione.lisp")
   :BYTES 1079 :SHA256
   "6be6a1e60a137476824f50a5a188d24e2cd857fd0d8aaf56f4d8f39b4e34460d")
  (:PATH "processes/command-16/report.lisp" :SOURCE
   #A((89) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001220016-command-39264-0/report.lisp")
   :BYTES 276199 :SHA256
   "cf48e8c0d06c6292ef54775ef459667e6d7652eb91192bb6ebba8f0973a250b2")
  (:PATH "processes/command-2/conservazione.lisp" :SOURCE
   #A((96) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001217365-command-78999-0/conservazione.lisp")
   :BYTES 1079 :SHA256
   "64cbba22f7999c1d806b7ac722c4c158807e0242561733f86b79bec07a2b079d")
  (:PATH "processes/command-2/report.lisp" :SOURCE
   #A((89) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001217365-command-78999-0/report.lisp")
   :BYTES 246065 :SHA256
   "60734a34ac7af7ddee212723afd81f1c7e44dcdacb64796013e9642c9f198a0b")
  (:PATH "processes/command-3/conservazione.lisp" :SOURCE
   #A((96) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001217393-command-79322-0/conservazione.lisp")
   :BYTES 1079 :SHA256
   "db4a231a7c2affcf986bf14dab24c86f02a5b6fe3cbcc0d764af9ea7bf4e9302")
  (:PATH "processes/command-3/report.lisp" :SOURCE
   #A((89) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001217393-command-79322-0/report.lisp")
   :BYTES 246149 :SHA256
   "577ef0837984c40d3cdad02be708b3e0e74d0a63dfb6f4eb73ce87187ef01519")
  (:PATH "processes/command-4/conservazione.lisp" :SOURCE
   #A((96) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001217431-command-79950-0/conservazione.lisp")
   :BYTES 1079 :SHA256
   "43c1a9eb49a03aa9901e1fc28740adf38a1093364ce82e1495e8adf5ef13cbb9")
  (:PATH "processes/command-4/report.lisp" :SOURCE
   #A((89) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001217431-command-79950-0/report.lisp")
   :BYTES 245627 :SHA256
   "8acdb8e23947f9d35572e238f0e1a6a6a72eeadeec6899509a18996d6c5b135f")
  (:PATH "processes/command-5/conservazione.lisp" :SOURCE
   #A((96) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001217468-command-80557-0/conservazione.lisp")
   :BYTES 1079 :SHA256
   "d6359567b9a6a17648e8a15cf0a3415af48f19066462da7dbf9d6ae48474c8ea")
  (:PATH "processes/command-5/report.lisp" :SOURCE
   #A((89) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001217468-command-80557-0/report.lisp")
   :BYTES 245740 :SHA256
   "1932c4bcac983b9e7e2ef5907111de8ecde70d47324e87c403dbef7a1626fafe")
  (:PATH "processes/command-6/conservazione.lisp" :SOURCE
   #A((96) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001217529-command-81464-0/conservazione.lisp")
   :BYTES 1079 :SHA256
   "8c1acf96de14afd5bf96c0685173181a3d9639ac3c7dacee8951a8152d7864bc")
  (:PATH "processes/command-6/report.lisp" :SOURCE
   #A((89) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001217529-command-81464-0/report.lisp")
   :BYTES 252688 :SHA256
   "fc5d54e33544e6a41fe8d98b2140d945869014acbe97bef218d471392760d3a7")
  (:PATH "processes/command-7/conservazione.lisp" :SOURCE
   #A((96) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001217596-command-83333-0/conservazione.lisp")
   :BYTES 1079 :SHA256
   "860df7a150089110ef26f4e8cabb42214355a686c629cbcc5cf9f3c7e853e0ef")
  (:PATH "processes/command-7/report.lisp" :SOURCE
   #A((89) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001217596-command-83333-0/report.lisp")
   :BYTES 245671 :SHA256
   "a719acc30319883df73698ffac7bca88aa8e26a8e48f81be5012e581845e581a")
  (:PATH "processes/command-8/conservazione.lisp" :SOURCE
   #A((96) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001217650-command-85047-0/conservazione.lisp")
   :BYTES 1636 :SHA256
   "3eec43e50b63feb68d1eab299746a2fce47566d832fb408a1a4c05fb92863969")
  (:PATH "processes/command-8/report.lisp" :SOURCE
   #A((89) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001217650-command-85047-0/report.lisp")
   :BYTES 317 :SHA256
   "c6a187c8618a348efab6f80f2952d383c6bc2693c5a608ec2b6799010ab145f8")
  (:PATH "processes/command-8/report.lisp.gz" :SOURCE
   #A((92) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001217650-command-85047-0/report.lisp.gz")
   :BYTES 246620 :SHA256
   "204a470ee807e55b38e684299901cde3fc4ccb60316cc42150dc2fbbb3e8f814")
  (:PATH "processes/command-9/conservazione.lisp" :SOURCE
   #A((96) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001218733-command-12012-0/conservazione.lisp")
   :BYTES 1636 :SHA256
   "b156a1261acd3d53c94f730e189134d5675a135b10c1ced2dcbeea05aba7e0b7")
  (:PATH "processes/command-9/report.lisp" :SOURCE
   #A((89) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001218733-command-12012-0/report.lisp")
   :BYTES 317 :SHA256
   "91a25af5860281d282d0b1f7d30b484a76c1a4dddd421e5f1341ee4383a07c02")
  (:PATH "processes/command-9/report.lisp.gz" :SOURCE
   #A((92) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001218733-command-12012-0/report.lisp.gz")
   :BYTES 243852 :SHA256
   "568652a5c8911b5099a1b7c8268e5db023655a6821d9058874472698eac9dad4")
  (:PATH "raw/prepare-archive.lisp.txt" :SOURCE
   #A((66) BASE-CHAR
      . "/private/tmp/arcdocdb-unix-integration-Zq6kA8/prepare-archive.lisp")
   :BYTES 3424 :SHA256
   "592a61226cef1a1b17ef601ca106bb704641eafcaa438c5aba1bff44ea75d055")
  (:PATH "raw/spikes-0/SPK-01.lisp" :SOURCE
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001219585-check-29957-0/SPK-01.lisp")
   :BYTES 27228 :SHA256
   "62cfabc91f2ddf9a32eabe18666bda983f5841710c1bd27d332655ab6830ee8f")
  (:PATH "raw/spikes-0/SPK-02.lisp" :SOURCE
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001219585-check-29957-0/SPK-02.lisp")
   :BYTES 1606 :SHA256
   "9ebfeaaa5ce6038ccdff9e2a9d357af4ff440c468ca17ae406dddb08d6591972")
  (:PATH "raw/spikes-0/SPK-03.lisp" :SOURCE
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001219585-check-29957-0/SPK-03.lisp")
   :BYTES 3596 :SHA256
   "e6922046e1bcc0c3996ca4d7aa4cab89fe16df2e3a74b07187eb933cde5d12ae")
  (:PATH "raw/spikes-0/SPK-04.lisp" :SOURCE
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001219585-check-29957-0/SPK-04.lisp")
   :BYTES 6752 :SHA256
   "f75b62a2946b90d82f24a4b108e88164c37b6686c62ba13e2d9627780da3deb1")
  (:PATH "raw/spikes-0/SPK-05.lisp" :SOURCE
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001219585-check-29957-0/SPK-05.lisp")
   :BYTES 10172 :SHA256
   "f823912470e682e80ee0ba82bb3fbfd04af33bda2b871619d000a2ae7818000d")
  (:PATH "raw/spikes-0/SPK-06.lisp" :SOURCE
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001219585-check-29957-0/SPK-06.lisp")
   :BYTES 24120 :SHA256
   "017df2aec2a244a7e6e34319cd29ee35566901d60e3ee87f939dbe821c42cd01")
  (:PATH "raw/spikes-0/SPK-07.lisp" :SOURCE
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001219585-check-29957-0/SPK-07.lisp")
   :BYTES 318 :SHA256
   "6ba937c7642b218e818cf51fcc97f11b49aa8205a5a1504301d6754f9d7fb241")
  (:PATH "raw/spikes-0/SPK-07.lisp.gz" :SOURCE
   #A((90) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001219585-check-29957-0/SPK-07.lisp.gz")
   :BYTES 410639 :SHA256
   "7a859ce1fda2dd101bed56110c905d93e227ff72da8085fae52ba39120bbaac6")
  (:PATH "raw/spikes-0/SPK-08.lisp" :SOURCE
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001219585-check-29957-0/SPK-08.lisp")
   :BYTES 291712 :SHA256
   "624247297f0d700ab8b13646f689dd2fdbc11c6b259db906b1e8407a8418198b")
  (:PATH "raw/spikes-0/SPK-09.lisp" :SOURCE
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001219585-check-29957-0/SPK-09.lisp")
   :BYTES 2472 :SHA256
   "b3e05601ed2af67222e1e3b69e78c73fbf0fc2e55cd9caf2527c75a708af2fbf")
  (:PATH "raw/spikes-0/SPK-10.lisp" :SOURCE
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001219585-check-29957-0/SPK-10.lisp")
   :BYTES 22977 :SHA256
   "a10653b5383c6485c73309f143dcc23242e2671378d59a23da650b31f78e631b")
  (:PATH "raw/spikes-0/SPK-11.lisp" :SOURCE
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001219585-check-29957-0/SPK-11.lisp")
   :BYTES 15803 :SHA256
   "ff8413e31e2c91cab9482a3712f58c1478864a9d89f065ca1e77653443525d4c")
  (:PATH "raw/spikes-0/conservazione.lisp" :SOURCE
   #A((94) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001219585-check-29957-0/conservazione.lisp")
   :BYTES 2177 :SHA256
   "9ae2e6aa03b5613242c68e6e323f29dfd3cd3af93321bf60f67d432a167c22f1")
  (:PATH "raw/spikes-0/report.lisp" :SOURCE
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001219585-check-29957-0/report.lisp")
   :BYTES 318 :SHA256
   "f4136a63f031f45a787ab18a0878552ec06f1d32cea64d41b8e426e09429e480")
  (:PATH "raw/spikes-0/report.lisp.gz" :SOURCE
   #A((90) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001219585-check-29957-0/report.lisp.gz")
   :BYTES 469313 :SHA256
   "a289c3c010b7cd2d4bf0c5c3477f4c102fbd5d347309676a99478ddd02fe8ce8")
  (:PATH "raw/spikes-1/SPK-01.lisp" :SOURCE
   #A((86) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001218355-check-4747-0/SPK-01.lisp")
   :BYTES 27220 :SHA256
   "bdfd37659fd8fe3c176bc56073722838553b21ef3e63dcb75a24fff2698a13c0")
  (:PATH "raw/spikes-1/SPK-02.lisp" :SOURCE
   #A((86) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001218355-check-4747-0/SPK-02.lisp")
   :BYTES 1607 :SHA256
   "0e3001de39945d154a638b6575283788ccdd798f1b5aca11ac8889abfde88b25")
  (:PATH "raw/spikes-1/SPK-03.lisp" :SOURCE
   #A((86) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001218355-check-4747-0/SPK-03.lisp")
   :BYTES 3596 :SHA256
   "5fe94af039441a7b95520e72398fbb8f4bd25d24ecb8a7712447a7936468b2b4")
  (:PATH "raw/spikes-1/SPK-04.lisp" :SOURCE
   #A((86) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001218355-check-4747-0/SPK-04.lisp")
   :BYTES 6752 :SHA256
   "e0a03fe6445f812187c53d016694cf505c3083c52b9dccb29145d2d9e6630752")
  (:PATH "raw/spikes-1/SPK-05.lisp" :SOURCE
   #A((86) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001218355-check-4747-0/SPK-05.lisp")
   :BYTES 10223 :SHA256
   "5ebfd44fce82b9153e380cb06247631c968d948f248ccbb8452054eefb2e1298")
  (:PATH "raw/spikes-1/SPK-06.lisp" :SOURCE
   #A((86) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001218355-check-4747-0/SPK-06.lisp")
   :BYTES 24317 :SHA256
   "8955d0991a83c63dfb2aede4183b0c31a0a0fd66377a5ecad026c267587383d7")
  (:PATH "raw/spikes-1/SPK-07.lisp" :SOURCE
   #A((86) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001218355-check-4747-0/SPK-07.lisp")
   :BYTES 318 :SHA256
   "098e8acf93940fd2757bf93f137b3eb6f54dfb2a5602ffb3d081de7f9db35f81")
  (:PATH "raw/spikes-1/SPK-07.lisp.gz" :SOURCE
   #A((89) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001218355-check-4747-0/SPK-07.lisp.gz")
   :BYTES 410616 :SHA256
   "5e1350c5eb494390544928fd9a4265474e44c4f3d9bf81a805f5fbbf02d57a16")
  (:PATH "raw/spikes-1/SPK-08.lisp" :SOURCE
   #A((86) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001218355-check-4747-0/SPK-08.lisp")
   :BYTES 291712 :SHA256
   "1936ed40eb2fb62c0b0495aebaae7c0b42bac5adf1e599b9c26a8e272e1c36a2")
  (:PATH "raw/spikes-1/SPK-09.lisp" :SOURCE
   #A((86) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001218355-check-4747-0/SPK-09.lisp")
   :BYTES 2471 :SHA256
   "b94c3b05b0b30db64f973f729920de451fb28fcf50166ea063e8524aa91a61cc")
  (:PATH "raw/spikes-1/SPK-10.lisp" :SOURCE
   #A((86) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001218355-check-4747-0/SPK-10.lisp")
   :BYTES 22971 :SHA256
   "cc77115345e2c63cb8e624ede6112daa60830f2f1a7be552a7771a247ec4c5ef")
  (:PATH "raw/spikes-1/SPK-11.lisp" :SOURCE
   #A((86) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001218355-check-4747-0/SPK-11.lisp")
   :BYTES 15749 :SHA256
   "d867963758c9070706cfa18502ded506a98c872902fe16c6a8865d3471188d42")
  (:PATH "raw/spikes-1/conservazione.lisp" :SOURCE
   #A((93) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001218355-check-4747-0/conservazione.lisp")
   :BYTES 2172 :SHA256
   "726749d9b9e7b075da4d34b32cda1fcc43090b38b92c2cb3389728320bc5bf15")
  (:PATH "raw/spikes-1/report.lisp" :SOURCE
   #A((86) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001218355-check-4747-0/report.lisp")
   :BYTES 318 :SHA256
   "05f1da04bc18622f01e3816b68fe37bed37623d7f6111e28e66cba9dc6fa9750")
  (:PATH "raw/spikes-1/report.lisp.gz" :SOURCE
   #A((89) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001218355-check-4747-0/report.lisp.gz")
   :BYTES 469734 :SHA256
   "ad08f2b9d0d8891cd6d97a770851140052f819dbfd6467320084b2b5911514a1")
  (:PATH "raw/verify-integration.lisp.txt" :SOURCE
   #A((69) BASE-CHAR
      . "/private/tmp/arcdocdb-unix-integration-Zq6kA8/verify-integration.lisp")
   :BYTES 6013 :SHA256
   "34784cc040bc9ef224404d469943dda5838984239662526533ef13adbdaed95a")
  (:PATH "report.md" :SOURCE
   #A((64) BASE-CHAR
      . "/private/tmp/arcdocdb-unix-integration-Zq6kA8/campaign-report.md")
   :BYTES 4260 :SHA256
   "ce8769c6470fec1317ce48fa02c0536eebf54652b29c1418c4399d9eb35348e7")
  (:PATH "sources/codec-inputs.lisp.txt" :SOURCE
   #A((83) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/codec-inputs.lisp")
   :BYTES 581 :SHA256
   "28233a1ac780db554bb0620345af6dedae8ad3f81bb0ecb88c1bf96769d560ba")
  (:PATH "sources/core.lisp.txt" :SOURCE
   #A((75) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/core.lisp")
   :BYTES 6282 :SHA256
   "5a5eea7b37d2b5c48fb19a53b2e864e4d9e6fed23e4701f14ffc0a72b0079795")
  (:PATH "sources/run-spikes.lisp.txt" :SOURCE
   #A((61) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/tools/run-spikes.lisp")
   :BYTES 14038 :SHA256
   "e78baf536d3c685111fe13bbfa1d7ccbccde4acd169c668d58e498ad46db9cc3")
  (:PATH "sources/run.lisp.txt" :SOURCE
   #A((74) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/run.lisp")
   :BYTES 2771 :SHA256
   "61a0418f736fe36e1123bcf53871384eddbc0c27aeecc9b8559cc52a1620ac83")
  (:PATH "sources/scenarios.lisp.txt" :SOURCE
   #A((80) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/scenarios.lisp")
   :BYTES 8664 :SHA256
   "b1b0bcf0411b61e2ecbc0ac50b666741750a44b83e7f51b3bf0c9b4a1ce639cb")
  (:PATH "sources/transport.lisp.txt" :SOURCE
   #A((80) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/transport.lisp")
   :BYTES 6051 :SHA256
   "05c25cde68b1f5be3e1759ce61e7991fc97996074548dac4b48dd593f5ecf36d"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
