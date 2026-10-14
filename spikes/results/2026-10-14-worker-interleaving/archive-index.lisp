(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "historical-PR13-CI-audit" :RECORD-PATH
   "raw/historical-PR13-CI-audit/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((136) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/tools/audit.lisp")
    #A((11) BASE-CHAR . "--workspace")
    #A((66) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB")
    #A((8) BASE-CHAR . "--commit")
    #A((40) BASE-CHAR . "61b4ecdd03e40d14f3b8249d2e83c08ac757b5b9")
    #A((5) BASE-CHAR . "--run") #A((11) BASE-CHAR . "38638591424")
    #A((7) BASE-CHAR . "--tests") #A((4) BASE-CHAR . "1528")
    #A((5) BASE-CHAR . "--get") #A((2) BASE-CHAR . "70")
    #A((10) BASE-CHAR . "--resolver") #A((2) BASE-CHAR . "42")
    #A((8) BASE-CHAR . "--active") #A((2) BASE-CHAR . "42")
    #A((8) BASE-CHAR . "--epochs") #A((2) BASE-CHAR . "34")
    #A((6) BASE-CHAR . "--read") #A((2) BASE-CHAR . "30")
    #A((7) BASE-CHAR . "--smoke") #A((1) BASE-CHAR . "2")
    #A((23) BASE-CHAR . "--require-all-platforms")
    #A((10) BASE-CHAR . "--platform") #A((6) BASE-CHAR . "ubuntu")
    #A((144) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-ubuntu-latest/")
    #A((10) BASE-CHAR . "--platform") #A((5) BASE-CHAR . "macOS")
    #A((143) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-macos-latest/")
    #A((10) BASE-CHAR . "--platform") #A((14) BASE-CHAR . "documentazione")
    #A((145) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-documentazione/"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "historical-main-CI-negative-audit" :RECORD-PATH
   "raw/historical-main-CI-negative-audit/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((68) BASE-CHAR
       . "spikes/out/lifetime-ci-runtime/main-run-38640790953/tools/audit.lisp")
    #A((11) BASE-CHAR . "--workspace")
    #A((66) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB")
    #A((8) BASE-CHAR . "--commit")
    #A((40) BASE-CHAR . "05a1c1f1688968c7c64b483a14528945a05b1335")
    #A((5) BASE-CHAR . "--run") #A((11) BASE-CHAR . "38640790953")
    #A((7) BASE-CHAR . "--tests") #A((4) BASE-CHAR . "1528")
    #A((5) BASE-CHAR . "--get") #A((2) BASE-CHAR . "70")
    #A((10) BASE-CHAR . "--resolver") #A((2) BASE-CHAR . "42")
    #A((8) BASE-CHAR . "--active") #A((2) BASE-CHAR . "42")
    #A((8) BASE-CHAR . "--epochs") #A((2) BASE-CHAR . "34")
    #A((6) BASE-CHAR . "--read") #A((2) BASE-CHAR . "30")
    #A((7) BASE-CHAR . "--smoke") #A((1) BASE-CHAR . "2")
    #A((23) BASE-CHAR . "--require-all-platforms")
    #A((10) BASE-CHAR . "--platform") #A((6) BASE-CHAR . "ubuntu")
    #A((76) BASE-CHAR
       . "spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-ubuntu-latest/")
    #A((10) BASE-CHAR . "--platform") #A((14) BASE-CHAR . "documentazione")
    #A((77) BASE-CHAR
       . "spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-documentazione/")
    #A((10) BASE-CHAR . "--platform") #A((5) BASE-CHAR . "macOS")
    #A((75) BASE-CHAR
       . "spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-macos-latest/"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "F3-full-outer" :RECORD-PATH "raw/F3-full-outer/report.lisp" :COMMAND
   (#A((3) BASE-CHAR . "env")
    #A((276) BASE-CHAR
       . "ASDF_OUTPUT_TRANSLATIONS=(:output-translations (#P\"/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/**/*.*\" #P\"/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/**/*.*\") :ignore-inherited-configuration)")
    #A((4) BASE-CHAR . "make") #A((5) BASE-CHAR . "check"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "F3-full-inner" :RECORD-PATH "raw/F3-full-inner/report.lisp" :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "F3-native-semantic-audit" :RECORD-PATH
   "raw/F3-native-semantic-audit/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((18) BASE-CHAR . "--disable-debugger") #A((8) BASE-CHAR . "--script")
    #A((56) BASE-CHAR
       . "spikes/out/worker-interleaving-publication/audit-F2.lisp")
    #A((11) BASE-CHAR . "--workspace")
    #A((67) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/")
    #A((8) BASE-CHAR . "--commit")
    #A((40) BASE-CHAR . "91c818f3616da7d0807285aaf5af44f519cb4247")
    #A((6) BASE-CHAR . "--core")
    #A((49) BASE-CHAR . "spikes/out/4001003154-command-24880-0/report.lisp")
    #A((12) BASE-CHAR . "--outer-core")
    #A((49) BASE-CHAR . "spikes/out/4001003152-command-24845-0/report.lisp")
    #A((10) BASE-CHAR . "--fasl-dir")
    #A((39) BASE-CHAR . "spikes/out/worker-interleaving-F3-fasl/")
    #A((8) BASE-CHAR . "--reader")
    #A((58) BASE-CHAR
       . "spikes/out/4001003196-reader-self-test-25173-0/report.lisp")
    #A((10) BASE-CHAR . "--snapshot")
    #A((60) BASE-CHAR
       . "spikes/out/4001003195-snapshot-self-test-25170-0/report.lisp")
    #A((14) BASE-CHAR . "--expect-tests") #A((4) BASE-CHAR . "1528")
    #A((14) BASE-CHAR . "--expect-scope") #A((2) BASE-CHAR . "72"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "README.md" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-publication/README.md.txt")
   :BYTES 4435 :SHA256
   "95132ae394d2818595cf09e8f60eb6c12e117624236d1c3e53704fe61af1fe04")
  (:PATH "archive-audit-contract.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-publication/archive-audit-contract.lisp")
   :BYTES 1604 :SHA256
   "fee105c75af4664485abf022011b19aaad724ad1512b38dea4ed646922c6b814")
  (:PATH "archive-audit-source.txt" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-publication/audit-batch.lisp")
   :BYTES 26411 :SHA256
   "d17564b38f51cd54e7ae86241c82c0eaa81a41bc9a29ecc70a6f937d59d59173")
  (:PATH "batch-sha-source.txt" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-publication/batch-sha.lisp")
   :BYTES 5787 :SHA256
   "130f428551e1aa17a946c2614db5dc14adf9ae35309ec2b21c3be5b2d59be1da")
  (:PATH "collection-manifest.lisp" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-publication/manifest.lisp")
   :BYTES 5042 :SHA256
   "06b681e42bff82860cb342b38c4e281d2ed42e41198decbd77958837aa0f40b9")
  (:PATH "collection-source.txt" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-publication/collector-batch.lisp")
   :BYTES 24309 :SHA256
   "e6b2cdecbe1bf1602109161b07c7ce51c6716323238dea10e8f9cb7a96a4facf")
  (:PATH "collector-source.txt" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-publication/collector-batch.lisp")
   :BYTES 24309 :SHA256
   "e6b2cdecbe1bf1602109161b07c7ce51c6716323238dea10e8f9cb7a96a4facf")
  (:PATH "git-counter-source.txt" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-publication/count-tests.lisp")
   :BYTES 14296 :SHA256
   "1cb93fc4901faefaa66fdfe4207f012f51f683f8ab622ec5a25a92aa4512541e")
  (:PATH "raw/F3-full-cache/src/active/package.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/active/package.fasl")
   :BYTES 1580 :SHA256
   "c8d7b990756a4cbd8c2c15e6fd7368e5be14862c8f9a5bca704233c1de5452c0")
  (:PATH "raw/F3-full-cache/src/active/preflight.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/active/preflight.fasl")
   :BYTES 4790 :SHA256
   "1c262fff0db56b15e194f3d0f95a56897f12c675cc38715563feef62d8f3ab27")
  (:PATH "raw/F3-full-cache/src/active/prepare.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/active/prepare.fasl")
   :BYTES 5552 :SHA256
   "d513c5552a75d3624e04fed46bd7b36745e08d4bdc4977790330d071837dda58")
  (:PATH "raw/F3-full-cache/src/active/source.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/active/source.fasl")
   :BYTES 5206 :SHA256
   "dbea7758a74fc0da21ce3215a18e333e4a2436b55a00fa1c803c518f9528d428")
  (:PATH "raw/F3-full-cache/src/active/types.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/active/types.fasl")
   :BYTES 5967 :SHA256
   "963e8ea7c1f228bc86a5a6b7c65ae40674d901377a4babd7c7d5dc4607eb438c")
  (:PATH "raw/F3-full-cache/src/cache/build.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/cache/build.fasl")
   :BYTES 8841 :SHA256
   "64d34ce20a533734947527b6c5f7258f1148221e8468980dd12cebb4c585e250")
  (:PATH "raw/F3-full-cache/src/cache/clock.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/cache/clock.fasl")
   :BYTES 4882 :SHA256
   "9800b258af4b0e064f70c78d901e4575849f445ad02fb6062eeee0cb9af8d008")
  (:PATH "raw/F3-full-cache/src/cache/core.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/cache/core.fasl")
   :BYTES 7257 :SHA256
   "c371e087bd92e6fa5fccf47d016cff8c787824c24f01f28bf00ba2eee3b49653")
  (:PATH "raw/F3-full-cache/src/cache/package.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/cache/package.fasl")
   :BYTES 1164 :SHA256
   "953b0cb10b29e462bf2fa7cced8e2fcc1d0dd9bc06027e978c9ef5cb72cde91b")
  (:PATH "raw/F3-full-cache/src/cache/read.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/cache/read.fasl")
   :BYTES 11955 :SHA256
   "3f09e77d6cbcf7c5ccad79b3de974c1572df8e9e2133e1a9892001ce8871e680")
  (:PATH "raw/F3-full-cache/src/cache/types.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/cache/types.fasl")
   :BYTES 17982 :SHA256
   "f5846a7010aa3286e3a3c340feb2b95510fdbf8e4ce345986ad2c94ce1db3e27")
  (:PATH "raw/F3-full-cache/src/cache/write.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/cache/write.fasl")
   :BYTES 9821 :SHA256
   "83748d84c67cf0b3edfb30319dca46ec91f216a5c80c9aa25e660ccdfd061d24")
  (:PATH "raw/F3-full-cache/src/codec/cbor-array-input.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/codec/cbor-array-input.fasl")
   :BYTES 9970 :SHA256
   "4910e2ba80fcedbc8d3d55d1ba111b0f7bc49448a2290438b397859bc55286e0")
  (:PATH "raw/F3-full-cache/src/codec/cbor-array-write.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/codec/cbor-array-write.fasl")
   :BYTES 8684 :SHA256
   "14576a50b55131a72fd709b7e08cbed84e65440b058cb2dc4769790f19cb6fce")
  (:PATH "raw/F3-full-cache/src/codec/cbor-float-minimal.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/codec/cbor-float-minimal.fasl")
   :BYTES 4224 :SHA256
   "889df138bb6a0db88cb9408e8ae59f48f7275bb5454b69265dd8fcf4be025813")
  (:PATH "raw/F3-full-cache/src/codec/cbor-float-narrow.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/codec/cbor-float-narrow.fasl")
   :BYTES 5042 :SHA256
   "6074b6c3fd227e8db22f13eec4d9fb4efabee31478ed26a4fb5cdc9285840ea8")
  (:PATH "raw/F3-full-cache/src/codec/cbor-float-write.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/codec/cbor-float-write.fasl")
   :BYTES 6792 :SHA256
   "3adc5caa5eebff433649a44b732db93207d6b1ac860c36150d89b106571e71a5")
  (:PATH "raw/F3-full-cache/src/codec/cbor-header.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/codec/cbor-header.fasl")
   :BYTES 7374 :SHA256
   "2c071b192084aa2fd92f3f8fa78d0e8b85e2cc3b465bd61c10445fa4df946539")
  (:PATH "raw/F3-full-cache/src/codec/cbor-map-input.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/codec/cbor-map-input.fasl")
   :BYTES 10461 :SHA256
   "4d7dfb978aa00edf7be8538834a9e850c53a034f376eab2761438669ebc49a11")
  (:PATH "raw/F3-full-cache/src/codec/cbor-map-write.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/codec/cbor-map-write.fasl")
   :BYTES 8772 :SHA256
   "d701202065b27bebd185337d03a7ea5cbae9e4581e6b2da811e7b4b1923c38c7")
  (:PATH "raw/F3-full-cache/src/codec/cbor-minimal.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/codec/cbor-minimal.fasl")
   :BYTES 5462 :SHA256
   "dcf60dee9434500b212fdb2a7d53041f488a7a14015c3b907566491df454d174")
  (:PATH "raw/F3-full-cache/src/codec/cbor-package.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/codec/cbor-package.fasl")
   :BYTES 1244 :SHA256
   "31ccc7a826f1190d0dde0d4035005a589a4c6cb3590c67244229b896ead8403c")
  (:PATH "raw/F3-full-cache/src/codec/cbor-scan-input.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/codec/cbor-scan-input.fasl")
   :BYTES 3447 :SHA256
   "3cadc537411a7a4de57a298e8374fb58888da9df88ab8006a7e5301ab2258686")
  (:PATH "raw/F3-full-cache/src/codec/cbor-scan-items.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/codec/cbor-scan-items.fasl")
   :BYTES 10653 :SHA256
   "b382921886a7c48faccd829652e31834bee4e0b6c871ef8109694e06f3838768")
  (:PATH "raw/F3-full-cache/src/codec/cbor-scan-minimal.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/codec/cbor-scan-minimal.fasl")
   :BYTES 2923 :SHA256
   "22a9259eef0d380495f85bfe872a795bfe37614416eb4ad067ea2b02bf52c578")
  (:PATH "raw/F3-full-cache/src/codec/cbor-scan-stack.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/codec/cbor-scan-stack.fasl")
   :BYTES 8012 :SHA256
   "efca914608992d5636837d48207bded01f940a1604d6b1c7064927ddaedba982")
  (:PATH "raw/F3-full-cache/src/codec/cbor-scan.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/codec/cbor-scan.fasl")
   :BYTES 8473 :SHA256
   "2e95cc25539c92563c14aefc1617126324392d89d78207483a1cf04daefd0a73")
  (:PATH "raw/F3-full-cache/src/codec/cbor-simple-write.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/codec/cbor-simple-write.fasl")
   :BYTES 3938 :SHA256
   "afcaca08aacb5de47e671202801b1023256c93df192a1bf9b4f4e7e287bba9c5")
  (:PATH "raw/F3-full-cache/src/codec/cbor-space.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/codec/cbor-space.fasl")
   :BYTES 11627 :SHA256
   "9f252a90bcb94187c042d43069a9f6f80fac9a8eec5c62fc34eecc22b09eaa4e")
  (:PATH "raw/F3-full-cache/src/codec/cbor-string-write.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/codec/cbor-string-write.fasl")
   :BYTES 9752 :SHA256
   "ea938920d3f6c8afd24e099d448d96f0d434f427cf74cfffed8217e52bc04fd3")
  (:PATH "raw/F3-full-cache/src/codec/cbor-tag-input.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/codec/cbor-tag-input.fasl")
   :BYTES 7013 :SHA256
   "bdba492c638607a797c877a509b7414212b2ea018e2bd33f8d325873cf0e9bbd")
  (:PATH "raw/F3-full-cache/src/codec/cbor-tag-write.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/codec/cbor-tag-write.fasl")
   :BYTES 6356 :SHA256
   "e10e66a33e92d6c63ba0693999ce16437862ac06f56ad28522662e954d1b0fb0")
  (:PATH "raw/F3-full-cache/src/codec/cbor-write.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/codec/cbor-write.fasl")
   :BYTES 6917 :SHA256
   "ec53e8e0ce169702982ccfa1e192148c94c2aa311834f6a343b18ea719601a37")
  (:PATH "raw/F3-full-cache/src/codec/package.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/codec/package.fasl")
   :BYTES 933 :SHA256
   "d9cfec477adb93161f6f6c76d70bf0626b6deca984b9fae048b1174ca057f7cb")
  (:PATH "raw/F3-full-cache/src/codec/utf8.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/codec/utf8.fasl")
   :BYTES 8330 :SHA256
   "2c1e42e38b60c89427daf1e3474f15c17409115a136ed699ef5734464c7ad60f")
  (:PATH "raw/F3-full-cache/src/control/build.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/control/build.fasl")
   :BYTES 8197 :SHA256
   "f5834ecc93b2cd52710f9e4e3c2e5e36008d0cd96972faddaeb3ed7321987195")
  (:PATH "raw/F3-full-cache/src/control/dependency.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/control/dependency.fasl")
   :BYTES 3986 :SHA256
   "a01ec53d35f63edde9945ab7722b0bd9d83f59d6aa0c4659133e5914ba97e6b7")
  (:PATH "raw/F3-full-cache/src/control/package.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/control/package.fasl")
   :BYTES 2256 :SHA256
   "859bce83898ad15b445dc758bde16a5021d5b31ba6b5fcaa8af23193ca1f84f7")
  (:PATH "raw/F3-full-cache/src/control/preflight.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/control/preflight.fasl")
   :BYTES 5169 :SHA256
   "ab9d747ee76ecac163c671173dc47abe8d2ef3365158d8cc18b2d37d650fd40d")
  (:PATH "raw/F3-full-cache/src/control/prepare.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/control/prepare.fasl")
   :BYTES 5550 :SHA256
   "38d5366562a5094586626fee54a2e1e1571329c8fd60de0874fb0857f9061743")
  (:PATH "raw/F3-full-cache/src/control/publication-read.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/control/publication-read.fasl")
   :BYTES 4053 :SHA256
   "969c032a6ca65ac07b9ff3234077d28a03a55a828812db91c34dcd990b7c4d9e")
  (:PATH "raw/F3-full-cache/src/control/publication.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/control/publication.fasl")
   :BYTES 6062 :SHA256
   "651327ab0de44beb5ed0b2f77688c018d249f1f94182c4e344c0d4900b518ed1")
  (:PATH "raw/F3-full-cache/src/control/recovery-publication.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/control/recovery-publication.fasl")
   :BYTES 2888 :SHA256
   "0cadaac2f5bf36c3ed60071c048bcbb733110d638297a6691be292d30a364bea")
  (:PATH "raw/F3-full-cache/src/control/recovery-read.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/control/recovery-read.fasl")
   :BYTES 8797 :SHA256
   "c17c6e6b7bf5e340bb9ee4d1524d8a228331b1eb8f1e80d309f8ebe8314b0930")
  (:PATH "raw/F3-full-cache/src/control/recovery-types.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/control/recovery-types.fasl")
   :BYTES 9692 :SHA256
   "9548ab237c68fa2ece009db4ea5be978c09cf8ce2898e21fd3916332dccedcb0")
  (:PATH "raw/F3-full-cache/src/control/transfer.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/control/transfer.fasl")
   :BYTES 4874 :SHA256
   "6dea4bed11afc4547f147bd9fa8c1f6347d17eca4a7b736ad2896b007017927d")
  (:PATH "raw/F3-full-cache/src/control/types.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/control/types.fasl")
   :BYTES 21462 :SHA256
   "3fb73f8a4b059f58c390448c38d893b8b45fbb94be32426beb0b095a47c98e31")
  (:PATH "raw/F3-full-cache/src/csn/package.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/csn/package.fasl")
   :BYTES 966 :SHA256
   "11869ade0b6bcf18c05e657e92cac510fbd7532e1f257b9dd398b9433f55e023")
  (:PATH "raw/F3-full-cache/src/csn/registry.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/csn/registry.fasl")
   :BYTES 29093 :SHA256
   "4897d7c1cf912d571b4793de676fe59c0a0fca1b9b580ffb0807fcdae41a628e")
  (:PATH "raw/F3-full-cache/src/dispatch/begin.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/dispatch/begin.fasl")
   :BYTES 2513 :SHA256
   "e4b7d75a9d1062b2c705646250ca9758499550231f8499e347cd0d2b1dff3261")
  (:PATH "raw/F3-full-cache/src/dispatch/build.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/dispatch/build.fasl")
   :BYTES 2233 :SHA256
   "e4b723bf3289aa92d2f388d6b8d7f9d73dccfdfeef0d9217254c25600a4095c2")
  (:PATH "raw/F3-full-cache/src/dispatch/claim.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/dispatch/claim.fasl")
   :BYTES 3533 :SHA256
   "1c36a864efbf924241f394f8f7c0fd1db2f9cf82fa2ac7524f80c9e1923419d4")
  (:PATH "raw/F3-full-cache/src/dispatch/package.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/dispatch/package.fasl")
   :BYTES 1058 :SHA256
   "7d1203b52263cb10c86fcdcb92811b56c2783f17d1ef254783f1678147cbc1a2")
  (:PATH "raw/F3-full-cache/src/dispatch/recycle.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/dispatch/recycle.fasl")
   :BYTES 3621 :SHA256
   "e7713194a4bf3b9ef3880efa50d0e0c1e7752bcd26ff07aa9b54a9ebb5f7ac21")
  (:PATH "raw/F3-full-cache/src/dispatch/types.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/dispatch/types.fasl")
   :BYTES 5565 :SHA256
   "6467472bbb5013f61a949e5ed40e458f3bdc98d3bc43f871d088ae8f24ad6469")
  (:PATH "raw/F3-full-cache/src/epochs/core.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/epochs/core.fasl")
   :BYTES 9448 :SHA256
   "1d0882cabf23a7085c628605ea78cd6019c677c461ee1ebd1f133ccc00681280")
  (:PATH "raw/F3-full-cache/src/epochs/package.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/epochs/package.fasl")
   :BYTES 1191 :SHA256
   "44c5b8f281844ff3e8be050284482962e498447448cd90f5f7a764aded498b95")
  (:PATH "raw/F3-full-cache/src/epochs/read.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/epochs/read.fasl")
   :BYTES 5287 :SHA256
   "41d8f029d3e165cb4ee029d4f22aee90081af7499b17d92dbd3f80e7ebd7d2e3")
  (:PATH "raw/F3-full-cache/src/epochs/reclaim.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/epochs/reclaim.fasl")
   :BYTES 10797 :SHA256
   "2af6f1b0cfa65e2b069dcb02a124bae1cb481ed0929fad968ea2d867774dfc5f")
  (:PATH "raw/F3-full-cache/src/epochs/retire.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/epochs/retire.fasl")
   :BYTES 9406 :SHA256
   "a916db67c7364a05d7005cae30c9d204475bb98c1e8005b32ba8d1f3e3996bc9")
  (:PATH "raw/F3-full-cache/src/epochs/types.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/epochs/types.fasl")
   :BYTES 24012 :SHA256
   "7dc837e4f7dd0b7cfd8940251a37424faca2d68fc28fb5fa31e1903895198d6b")
  (:PATH "raw/F3-full-cache/src/execution/handoff.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/execution/handoff.fasl")
   :BYTES 15921 :SHA256
   "99999928538d2393450898aa8b0f088ff1856928bf7249ae3a732c1ed7ab428d")
  (:PATH "raw/F3-full-cache/src/execution/package.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/execution/package.fasl")
   :BYTES 1602 :SHA256
   "dfdf249affb09cf7d488ace225019c46eb074f02b03eb1b398a3922074da95e7")
  (:PATH "raw/F3-full-cache/src/execution/queue.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/execution/queue.fasl")
   :BYTES 17776 :SHA256
   "b1890b0f4c1a440325e2638df99f47f842c51c83b445022f2c85b5ed85126ec1")
  (:PATH "raw/F3-full-cache/src/execution/ready-recycle.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/execution/ready-recycle.fasl")
   :BYTES 5161 :SHA256
   "566dc48a4b6b88285681e4dc960974f81320513377af5b3146d9574884b2807f")
  (:PATH "raw/F3-full-cache/src/execution/ready-types.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/execution/ready-types.fasl")
   :BYTES 14953 :SHA256
   "9d541a706c5086c2289a21d9a365b44ebc2c90a7bd1bb5ed89b9f0328cdaf9d5")
  (:PATH "raw/F3-full-cache/src/execution/ready.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/execution/ready.fasl")
   :BYTES 9699 :SHA256
   "5ad21518c642d207b5a43dfea0d24962b2585a33e3ab001d48f88f67a5946c8b")
  (:PATH "raw/F3-full-cache/src/execution/worker-boundary.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/execution/worker-boundary.fasl")
   :BYTES 6417 :SHA256
   "23a6ccc3a8f38a8b10f68914231bc240e8a142d7e9e1035277554eacb6d78ea1")
  (:PATH "raw/F3-full-cache/src/execution/worker-claim.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/execution/worker-claim.fasl")
   :BYTES 12427 :SHA256
   "bb6b6f9ca0775d2b64323beeabd7d32c12235e2751247ff84835d5286c1f15a5")
  (:PATH "raw/F3-full-cache/src/execution/worker-run.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/execution/worker-run.fasl")
   :BYTES 9021 :SHA256
   "a431ebaedf8e0595adf46e27ff8d9447b60cfdacfb62bec0feb461783c19ca00")
  (:PATH "raw/F3-full-cache/src/execution/worker-types.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/execution/worker-types.fasl")
   :BYTES 22077 :SHA256
   "e529b320e7e266c43aaddc50d494e90bd9fc328b95e2f191fa72be532bb7a5e7")
  (:PATH "raw/F3-full-cache/src/execution/writer.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/execution/writer.fasl")
   :BYTES 8964 :SHA256
   "0ee0edf9b211d5b7704dc331be3b62c205fc70c03aa637d000497d5fc6bafa61")
  (:PATH "raw/F3-full-cache/src/foundation/batch.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/foundation/batch.fasl")
   :BYTES 9663 :SHA256
   "7068eeb31511ce66bf788add2f10b7dc994ad9d5af916d1b989c2ff8b2e12272")
  (:PATH "raw/F3-full-cache/src/foundation/binary.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/foundation/binary.fasl")
   :BYTES 9069 :SHA256
   "1abc1450109f33c3ca65438cabf6d7351d12e38d91a3307b9c0f28cdc68ed870")
  (:PATH "raw/F3-full-cache/src/foundation/conditions.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/foundation/conditions.fasl")
   :BYTES 6263 :SHA256
   "b820d827496c281d69ef4fac362c1ca5af9689666471d2e4a37f08a64dbea613")
  (:PATH "raw/F3-full-cache/src/foundation/crc32c.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/foundation/crc32c.fasl")
   :BYTES 4245 :SHA256
   "1d84d07dfc5b768d52b4b02f612ec5538d4ae31047c18df1e0ec9b968b6eb96b")
  (:PATH "raw/F3-full-cache/src/foundation/package.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/foundation/package.fasl")
   :BYTES 2076 :SHA256
   "6ef29696425e49e4b58e24d35e52d03db0b9a4070f49dd7e61835393e3b814d9")
  (:PATH "raw/F3-full-cache/src/foundation/record.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/foundation/record.fasl")
   :BYTES 36352 :SHA256
   "be5ad5d0b6edbd3f903b926d89299d65212a25bb7436203e60954253162590ad")
  (:PATH "raw/F3-full-cache/src/get-directory/build.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/get-directory/build.fasl")
   :BYTES 6178 :SHA256
   "4fb51b9878476d22965addd5a2d8d7257e3620e1a047583733073434435bb12f")
  (:PATH "raw/F3-full-cache/src/get-directory/package.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/get-directory/package.fasl")
   :BYTES 2163 :SHA256
   "9e78c0881bb28f7e3e3a1106e4e003f83713d14b441c415287abd4ff3b5e7407")
  (:PATH "raw/F3-full-cache/src/get-directory/read.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/get-directory/read.fasl")
   :BYTES 7274 :SHA256
   "02afa52ddbe43d853a4d3215cd85c1a978b1c0d13eb6cc04207313df937639a7")
  (:PATH "raw/F3-full-cache/src/get-directory/sources-read.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/get-directory/sources-read.fasl")
   :BYTES 8225 :SHA256
   "4590b126b75f96c412d657dcdff05b29e2b0bfb51795add6acd112b5cbc3ab9c")
  (:PATH "raw/F3-full-cache/src/get-directory/sources-types.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/get-directory/sources-types.fasl")
   :BYTES 12628 :SHA256
   "ce1a066ce404767756436a15edcc19ce398a58aa9a26e3cfb3caa1fcc3db0824")
  (:PATH "raw/F3-full-cache/src/get-directory/types.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/get-directory/types.fasl")
   :BYTES 7011 :SHA256
   "ba6f45522e084413d13ee5d7e52e473f2f0f2f47c8ebf369eccc2df24d3f6c2f")
  (:PATH "raw/F3-full-cache/src/get-resolver/active-build.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/get-resolver/active-build.fasl")
   :BYTES 13947 :SHA256
   "8c086450e93dc02221388e3e7698e228c07ff865b1f707221554812306113468")
  (:PATH "raw/F3-full-cache/src/get-resolver/active-directory.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/get-resolver/active-directory.fasl")
   :BYTES 6959 :SHA256
   "5c0124381a3010085ec88e6527b75e9a1460c23392006eb58ce1c18a0c468b05")
  (:PATH "raw/F3-full-cache/src/get-resolver/active-init.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/get-resolver/active-init.fasl")
   :BYTES 3929 :SHA256
   "a8a544f103da6340bec3836b240634db90fabab152b648bf0638012f82e5a5dd")
  (:PATH "raw/F3-full-cache/src/get-resolver/active-preflight.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/get-resolver/active-preflight.fasl")
   :BYTES 8999 :SHA256
   "40cc7c875083ec900f9f5d0291610ef691cc71cf1a166da9d29d1edbbd00230e")
  (:PATH "raw/F3-full-cache/src/get-resolver/active-read.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/get-resolver/active-read.fasl")
   :BYTES 6869 :SHA256
   "818cbbb6b63f82b6ee48fdcc3fccb775daa139f1ada650ab0df0193294893a28")
  (:PATH "raw/F3-full-cache/src/get-resolver/active-scan.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/get-resolver/active-scan.fasl")
   :BYTES 8213 :SHA256
   "bd45acd64b00aed7e471ea31841cc78656e574152f625a05ede3bb8361e36ba9")
  (:PATH "raw/F3-full-cache/src/get-resolver/active-types.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/get-resolver/active-types.fasl")
   :BYTES 17313 :SHA256
   "b7653ab396e2edc069b780d6df7975f08066679f87533ba8f33e8c480274adc4")
  (:PATH "raw/F3-full-cache/src/get-resolver/build.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/get-resolver/build.fasl")
   :BYTES 10742 :SHA256
   "6179b324771174376ca3cf8d7cb57efb2472fa9134c5e7da5b580f5803478a92")
  (:PATH "raw/F3-full-cache/src/get-resolver/package.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/get-resolver/package.fasl")
   :BYTES 2659 :SHA256
   "d2f274ae8be03c26086bbe9c2b75be5823d5ee75a1962fff6e0f427f9578d874")
  (:PATH "raw/F3-full-cache/src/get-resolver/read.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/get-resolver/read.fasl")
   :BYTES 10505 :SHA256
   "527c67de168510ed5c83428f1e0b48aee99e9a6b7acc2e64ca8e3c3bd0b84dc1")
  (:PATH "raw/F3-full-cache/src/get-resolver/rows.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/get-resolver/rows.fasl")
   :BYTES 5852 :SHA256
   "56162e7904b2c937394289d0d323379612c1a450b4d9530d01dfca0f9326b749")
  (:PATH "raw/F3-full-cache/src/get-resolver/scan.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/get-resolver/scan.fasl")
   :BYTES 10730 :SHA256
   "4c127161b5e767a569f54d94d42a479e6581c7726418f81d6d571ce1d98d27c7")
  (:PATH "raw/F3-full-cache/src/get-resolver/sort.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/get-resolver/sort.fasl")
   :BYTES 9377 :SHA256
   "2c49f6d60d2e0a79845e03dd153e937c40ca9b28b7fff4d5d35c5e4386e93270")
  (:PATH "raw/F3-full-cache/src/get-resolver/types.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/get-resolver/types.fasl")
   :BYTES 7424 :SHA256
   "48f6f1ebe75204086f1319c550f3d3675f36d442c62aa36142520d3d80d125e9")
  (:PATH "raw/F3-full-cache/src/get/build.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/get/build.fasl")
   :BYTES 6732 :SHA256
   "ccf6bea4b6d12b9f9ecdf838fe946bc469e5db417bee38f5807469a690930fd2")
  (:PATH "raw/F3-full-cache/src/get/lifecycle.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/get/lifecycle.fasl")
   :BYTES 8673 :SHA256
   "1b311d9acc80536540def92adee94322edadf36d7195c71f165b912c9f629985")
  (:PATH "raw/F3-full-cache/src/get/lookup.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/get/lookup.fasl")
   :BYTES 11193 :SHA256
   "7e586a701ac948b466cad6c011562da498209756b07a4b0774c2fe3b2c21e726")
  (:PATH "raw/F3-full-cache/src/get/package.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/get/package.fasl")
   :BYTES 2156 :SHA256
   "689ee4f5d508171323945b6d01c442583ce871aa3bc39d2a6455e8f3971baf33")
  (:PATH "raw/F3-full-cache/src/get/segment.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/get/segment.fasl")
   :BYTES 10553 :SHA256
   "6e5a056b48da77229135aa0e76e835ef000a320be01c1ac4c0daf98ac75cd5bc")
  (:PATH "raw/F3-full-cache/src/get/target.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/get/target.fasl")
   :BYTES 7798 :SHA256
   "9b6cb9e8896d0b023b511a20efab953eb082abe6a917f02a6ae9dc190c540364")
  (:PATH "raw/F3-full-cache/src/get/types.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/get/types.fasl")
   :BYTES 30906 :SHA256
   "af0dc6343699df064ca9badbab7885951277b600c38594d81543d836cd254fda")
  (:PATH "raw/F3-full-cache/src/hash/arithmetic.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/hash/arithmetic.fasl")
   :BYTES 7674 :SHA256
   "d5b5d81e54ea227391f6e129eafcce87e6f85a40eee5a8c3cddbedd5985f0e6f")
  (:PATH "raw/F3-full-cache/src/hash/blocks.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/hash/blocks.fasl")
   :BYTES 8285 :SHA256
   "742e34da132fcac10b7d6f8142856c5f055507f766fa8219edff2b548542ee0c")
  (:PATH "raw/F3-full-cache/src/hash/hash64.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/hash/hash64.fasl")
   :BYTES 6634 :SHA256
   "ff2c2c7cc1002898a7fb2446816902e756cd0afc6aa194c4b1bf5b1812906748")
  (:PATH "raw/F3-full-cache/src/hash/package.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/hash/package.fasl")
   :BYTES 941 :SHA256
   "c67c6439df0a3672e41b63f29b51b8731cad5aae8cca16b1da67bebd8a8f89f8")
  (:PATH "raw/F3-full-cache/src/index/core.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/index/core.fasl")
   :BYTES 6177 :SHA256
   "a395542566632adf1fac696500c6e7cea34090533d99457005d5c715e83b9a4a")
  (:PATH "raw/F3-full-cache/src/index/hash-digests.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/index/hash-digests.fasl")
   :BYTES 6094 :SHA256
   "6a1434addf68aac4f150a203fc7095eb3186b894ad3e59114988b0eaadb8dbc2")
  (:PATH "raw/F3-full-cache/src/index/hash-seed.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/index/hash-seed.fasl")
   :BYTES 5126 :SHA256
   "39d981cd9939fd32a0e30352ff4144f0d2fefa81751e6737ca07ce7b90358c3f")
  (:PATH "raw/F3-full-cache/src/index/package.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/index/package.fasl")
   :BYTES 1136 :SHA256
   "8985991b2f0fe4e757f10df4f0cc5d7cb02c70666b7ab1e57f1cbab54a177657")
  (:PATH "raw/F3-full-cache/src/index/primary-arena.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/index/primary-arena.fasl")
   :BYTES 6816 :SHA256
   "cad972f5dbbba054515a0c013c503382385c5bc039325672e3ae799be2e1bd06")
  (:PATH "raw/F3-full-cache/src/index/primary-build.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/index/primary-build.fasl")
   :BYTES 10589 :SHA256
   "35638104fd88662feb6ff1f20679f87d6573413a2175c75ced1bcf308fae2014")
  (:PATH "raw/F3-full-cache/src/index/primary-core.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/index/primary-core.fasl")
   :BYTES 8742 :SHA256
   "eb2ecd2fa53f0de0ddeb5fef4ddeb3c94910bdea9de0a9b22a87525b296866c8")
  (:PATH "raw/F3-full-cache/src/index/primary-directory.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/index/primary-directory.fasl")
   :BYTES 14226 :SHA256
   "fefb7ceb5027b06f87cc88c6ba0a494581bc6aec791a14934fea4b26b3414f8d")
  (:PATH "raw/F3-full-cache/src/index/primary-package.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/index/primary-package.fasl")
   :BYTES 1711 :SHA256
   "d1649b74ae4a0acd8d68959e49cb2a0d70d176a56edc041479cd0cae11fe39ae")
  (:PATH "raw/F3-full-cache/src/index/primary-probe.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/index/primary-probe.fasl")
   :BYTES 13332 :SHA256
   "cfc97f96b771d13f051473c14adeb13bb651da4f9a54ad9f09e736e780326207")
  (:PATH "raw/F3-full-cache/src/index/primary-read.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/index/primary-read.fasl")
   :BYTES 7535 :SHA256
   "0e4e68499d81c10dea8af30bd5d3c0f631fc4cf1d1acd8cfeb1eaebac5aa13fc")
  (:PATH "raw/F3-full-cache/src/index/primary-relocate.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/index/primary-relocate.fasl")
   :BYTES 9163 :SHA256
   "1c7dd33d3fd9b7fd2ef130bb6566ebbe81027387c1c8a7d55237b2c6a15e0369")
  (:PATH "raw/F3-full-cache/src/index/primary-types.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/index/primary-types.fasl")
   :BYTES 36210 :SHA256
   "f22fe1d12e5b894e202bf75987a4c488b2940718c9af367ca206e3c283054ccd")
  (:PATH "raw/F3-full-cache/src/index/primary-write.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/index/primary-write.fasl")
   :BYTES 15725 :SHA256
   "e061873a03b7ef580866f4a4677f0f28ed82841a07b934c56ad40d667c440f51")
  (:PATH "raw/F3-full-cache/src/index/read.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/index/read.fasl")
   :BYTES 7190 :SHA256
   "11797269b1f8d363d53232393a93b330d354c5c22c2b7859c04dcc1da929d533")
  (:PATH "raw/F3-full-cache/src/index/rebuild-budget.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/index/rebuild-budget.fasl")
   :BYTES 6556 :SHA256
   "79fd8947dc2898c75103ddc1139185966c90b5f90a6971499ee6ea39034a651f")
  (:PATH "raw/F3-full-cache/src/index/rebuild-copy.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/index/rebuild-copy.fasl")
   :BYTES 8099 :SHA256
   "b9434d0e3fceefb7fb662d256fc9f76aee288bf62130556aa3023069d81293b1")
  (:PATH "raw/F3-full-cache/src/index/rebuild-scan.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/index/rebuild-scan.fasl")
   :BYTES 12569 :SHA256
   "dd48bc8eaaba317f8c6a2699c125c7bb484f01e25f374e5fa93423c458475027")
  (:PATH "raw/F3-full-cache/src/index/rebuild.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/index/rebuild.fasl")
   :BYTES 4509 :SHA256
   "a8bb629b9d6ac356fc110d1b9f16346e4d3b4d52025cd9052a4143cfbaa9a9e7")
  (:PATH "raw/F3-full-cache/src/index/relocate.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/index/relocate.fasl")
   :BYTES 6677 :SHA256
   "95770eb316df5866c3deb57a480e9a5ac2d03dedfe97745ce95ff0f101aa08ca")
  (:PATH "raw/F3-full-cache/src/index/types.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/index/types.fasl")
   :BYTES 9931 :SHA256
   "4399a62940a26ac054ffa7114a5e85de819d951a97e2deaa884abe58c032e48e")
  (:PATH "raw/F3-full-cache/src/index/validation.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/index/validation.fasl")
   :BYTES 9600 :SHA256
   "2e138593779842c3b77765485c58aad596a351e52f929f007f064fcda4181b82")
  (:PATH "raw/F3-full-cache/src/index/write.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/index/write.fasl")
   :BYTES 12510 :SHA256
   "e4ed5e815c15f2a73241468afac9f1757ca75befe85e05776d399bb0e5583ef3")
  (:PATH "raw/F3-full-cache/src/io/flush.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/io/flush.fasl")
   :BYTES 4608 :SHA256
   "c38daaca704d9d231cd1857a4fd0e5b70ef20df6d83bc95c1bf1a140baf29614")
  (:PATH "raw/F3-full-cache/src/io/identity-types.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/io/identity-types.fasl")
   :BYTES 4462 :SHA256
   "fa072fb8f20a87c16ff892894466e060ecbada274bea1181a390d9408caa863f")
  (:PATH "raw/F3-full-cache/src/io/identity.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/io/identity.fasl")
   :BYTES 7734 :SHA256
   "4328c46c84f2906c5e694c11d9f2083682b52941b73c9efb4b1a69549d3ca7cd")
  (:PATH "raw/F3-full-cache/src/io/lifecycle.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/io/lifecycle.fasl")
   :BYTES 10851 :SHA256
   "860f8c5abd06a55de94f2e2352e4e1f10ea71c1bfa6a3cb767ffe5697046d8bb")
  (:PATH "raw/F3-full-cache/src/io/namespace.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/io/namespace.fasl")
   :BYTES 11379 :SHA256
   "1616c58a4e60d62a565255d2d21a2d0817c7612cfb692f842ecbb0b2caf99fb7")
  (:PATH "raw/F3-full-cache/src/io/native-namespace.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/io/native-namespace.fasl")
   :BYTES 17936 :SHA256
   "e09fac5df814315f66e92120c3d7177464338819865f110261d4d900ac13d6ee")
  (:PATH "raw/F3-full-cache/src/io/native.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/io/native.fasl")
   :BYTES 22496 :SHA256
   "056119b0fc7210f680568185fde46108bdab35d7c9f3bc92f752558ffe734b2e")
  (:PATH "raw/F3-full-cache/src/io/package.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/io/package.fasl")
   :BYTES 1365 :SHA256
   "5f1ea7cc9f8b72330e6e544a7ca87a98dccf989138413a20c5feb2689205150f")
  (:PATH "raw/F3-full-cache/src/io/rename.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/io/rename.fasl")
   :BYTES 10570 :SHA256
   "06d67e1cf012d37b853e283849fc3c12b8b6f6aa07e837be3b1a51308443131a")
  (:PATH "raw/F3-full-cache/src/io/transfer.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/io/transfer.fasl")
   :BYTES 16309 :SHA256
   "d6053edcca9687281aef04680053fab8af12f7247d1b02d3b0db3eeefb88ec3a")
  (:PATH "raw/F3-full-cache/src/io/types.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/io/types.fasl")
   :BYTES 24328 :SHA256
   "4e0f192a5f9d5c8741811a7946668e9a8d67f52eb264910844259ce23ff6382f")
  (:PATH "raw/F3-full-cache/src/mvcc/package.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/mvcc/package.fasl")
   :BYTES 1304 :SHA256
   "fa0a4103972d70083f14202616c8568ef90fab0d1fac15939577a7accb5190f9")
  (:PATH "raw/F3-full-cache/src/mvcc/snapshots-core.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/mvcc/snapshots-core.fasl")
   :BYTES 11937 :SHA256
   "6bdf23656f8e382b951cdd29e3bef6f66acbb8816e8f7ab383b3f7e735486572")
  (:PATH "raw/F3-full-cache/src/mvcc/snapshots-csn.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/mvcc/snapshots-csn.fasl")
   :BYTES 6263 :SHA256
   "6900616cb036b11022de4304414930850b411b378ac77f73b6447ecb304d8f24")
  (:PATH "raw/F3-full-cache/src/mvcc/snapshots-lifecycle.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/mvcc/snapshots-lifecycle.fasl")
   :BYTES 10474 :SHA256
   "65dc4acd60b389933cd3c8eeeb5811f23ccdcc99591ac0897a4092b12fbf197c")
  (:PATH "raw/F3-full-cache/src/mvcc/snapshots-read.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/mvcc/snapshots-read.fasl")
   :BYTES 13698 :SHA256
   "296a2ed17ef142e0409ba56b17fbdd9f0dbed4edc9b731ff874745eaa2750f99")
  (:PATH "raw/F3-full-cache/src/mvcc/snapshots-register.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/mvcc/snapshots-register.fasl")
   :BYTES 10008 :SHA256
   "7bf352a56acb527eb33389514674ef41564ff9579097aad43e7105d291bf3725")
  (:PATH "raw/F3-full-cache/src/mvcc/snapshots-types.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/mvcc/snapshots-types.fasl")
   :BYTES 21774 :SHA256
   "740b9390e01d3631a9753dd5643641e587492ef08061089cdffb42d4459adbf5")
  (:PATH "raw/F3-full-cache/src/mvcc/types.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/mvcc/types.fasl")
   :BYTES 1388 :SHA256
   "c758f52a38c3688484c62bb5fcb7608766f23c0367482faed8df3db83a442ec5")
  (:PATH "raw/F3-full-cache/src/package.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/package.fasl")
   :BYTES 1400 :SHA256
   "5f84510fb9f930bed44a7c7589c3908e851506d1aaeee4654ea9bf3a7e72c5d5")
  (:PATH "raw/F3-full-cache/src/read/core.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/read/core.fasl")
   :BYTES 6234 :SHA256
   "c1f29d47cd1fe9754f4769f669c2db78f20cc4f62b33d7c37867b9c4f85ef6f5")
  (:PATH "raw/F3-full-cache/src/read/package.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/read/package.fasl")
   :BYTES 1196 :SHA256
   "f99bd664a1a77103143cfa01d8d4a3c5f1e99e3834c2a043016f7f4531cfd28a")
  (:PATH "raw/F3-full-cache/src/read/task.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/read/task.fasl")
   :BYTES 14100 :SHA256
   "3cf55012cda787949c3704f26cc4a0ad47976d65a07dd5d576844b191990e59c")
  (:PATH "raw/F3-full-cache/src/read/types.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/read/types.fasl")
   :BYTES 9772 :SHA256
   "7d31c5938e9d7f4491eac97cc9e5b99e653c4b30f63e343b1324a09e2b51ab69")
  (:PATH "raw/F3-full-cache/src/recovery-active/build.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/recovery-active/build.fasl")
   :BYTES 7757 :SHA256
   "6879c00313092f24af9015f0e4335dc53cdb171b6e3b8ba2e34b59da4c931d27")
  (:PATH "raw/F3-full-cache/src/recovery-active/closure.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/recovery-active/closure.fasl")
   :BYTES 5256 :SHA256
   "bb302e075bc1e05f5f6ab807986f3aa00dc373a8122cc67339946506bd99088d")
  (:PATH "raw/F3-full-cache/src/recovery-active/frames.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/recovery-active/frames.fasl")
   :BYTES 8929 :SHA256
   "788782aa3d666db5d111ebc35ec4fdd708b6284acac31bd3ee5b70a136a88d44")
  (:PATH "raw/F3-full-cache/src/recovery-active/package.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/recovery-active/package.fasl")
   :BYTES 1949 :SHA256
   "d8b34f26d302321b641e18d2ce517d86f153ed58f6c645c04e3fa99d40490114")
  (:PATH "raw/F3-full-cache/src/recovery-active/publication.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/recovery-active/publication.fasl")
   :BYTES 4384 :SHA256
   "a2d38970d6ac55adb08e793a97f6bfb92644a1710412c1de08ce827def63dfa6")
  (:PATH "raw/F3-full-cache/src/recovery-active/query.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/recovery-active/query.fasl")
   :BYTES 5356 :SHA256
   "059137eac781744b234e4953b21448e4263bfd8a549f78b747a5e683d837036c")
  (:PATH "raw/F3-full-cache/src/recovery-active/read.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/recovery-active/read.fasl")
   :BYTES 5645 :SHA256
   "7773ad8102f59037b819507255ce80ef26020593b999b13b9b0aaace70e2b3e9")
  (:PATH "raw/F3-full-cache/src/recovery-active/resolve.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/recovery-active/resolve.fasl")
   :BYTES 7612 :SHA256
   "8634a2caeb47b33894774af8f537f1c9f7d425566eaf2736a4dcbdd63ea4ff40")
  (:PATH "raw/F3-full-cache/src/recovery-active/types.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/recovery-active/types.fasl")
   :BYTES 18450 :SHA256
   "6adcf8a0c85cc33bf9da622aa93233fccef097be0d603a16425f0ff23026a678")
  (:PATH "raw/F3-full-cache/src/recovery/decisions-build.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/recovery/decisions-build.fasl")
   :BYTES 17723 :SHA256
   "ea299ddbd4d4de405b46642a5f1fcba13341032a0f8f34ba17d0d91c0b6ff4c9")
  (:PATH "raw/F3-full-cache/src/recovery/decisions-package.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/recovery/decisions-package.fasl")
   :BYTES 1295 :SHA256
   "7ce71f66d0e6ccf4cc8bde8aebb4b4722e2ba858ec98e701624e3c5ac6806af2")
  (:PATH "raw/F3-full-cache/src/recovery/decisions-query.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/recovery/decisions-query.fasl")
   :BYTES 7476 :SHA256
   "c009b2e9277946d081cb539dc79179fd142fa8162ab8d31e4179b5ffd26fa3d3")
  (:PATH "raw/F3-full-cache/src/recovery/decisions-radix.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/recovery/decisions-radix.fasl")
   :BYTES 14784 :SHA256
   "565ba1f6554988eb886b994c3c4b2ed5d7c5aeaeb51f65629df83c5949537330")
  (:PATH "raw/F3-full-cache/src/recovery/decisions-sort.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/recovery/decisions-sort.fasl")
   :BYTES 14177 :SHA256
   "0bc925e6557b59d4eea6b6d5ea0035ae9b3b371377093d8ff95579cd846acd08")
  (:PATH "raw/F3-full-cache/src/recovery/decisions-types.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/recovery/decisions-types.fasl")
   :BYTES 11074 :SHA256
   "5b7524af0bf13282036ed70ae3487a8f12ef4be28180582a2c5d5591a2005056")
  (:PATH "raw/F3-full-cache/src/recovery/inventory-build.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/recovery/inventory-build.fasl")
   :BYTES 14466 :SHA256
   "2164cfae82d260410eb57d0c140ffab13dca4bc1bf4887766669ad4c7c798100")
  (:PATH "raw/F3-full-cache/src/recovery/inventory-query.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/recovery/inventory-query.fasl")
   :BYTES 3813 :SHA256
   "16397950c8c9825e75b3c48ff77ee84ef3d584f2a3a9beca898be0606faca31f")
  (:PATH "raw/F3-full-cache/src/recovery/inventory-types.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/recovery/inventory-types.fasl")
   :BYTES 14861 :SHA256
   "0c3e02d121364ed727319ab6eefccdf10edacfab9ba10732e837256df3bd06cd")
  (:PATH "raw/F3-full-cache/src/recovery/manifest-build.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/recovery/manifest-build.fasl")
   :BYTES 15460 :SHA256
   "563f2051cbebb3be9499d25fda65625c7a801f276a1c0f394c09c08298e8a477")
  (:PATH "raw/F3-full-cache/src/recovery/manifest-decode.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/recovery/manifest-decode.fasl")
   :BYTES 10748 :SHA256
   "e6b6c669a57bacbf74ce74ccb2cf2df5614f40b36db358738dad1f8bc2ad4ad0")
  (:PATH "raw/F3-full-cache/src/recovery/manifest-fold.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/recovery/manifest-fold.fasl")
   :BYTES 14545 :SHA256
   "79604ea56ddf36ddf764bcb4e874dd5ef5c91b87bdb9b3ac2d0f2498ca445b31")
  (:PATH "raw/F3-full-cache/src/recovery/manifest-package.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/recovery/manifest-package.fasl")
   :BYTES 1764 :SHA256
   "192a2e7352ab008e3b36a9f122f3658f5f558d032f865b8356d432e2fdb138f2")
  (:PATH "raw/F3-full-cache/src/recovery/manifest-query.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/recovery/manifest-query.fasl")
   :BYTES 6805 :SHA256
   "7352091b0f3354ef12124ff08986962c16ff2859d64ada0cfa4db576bab9b50c")
  (:PATH "raw/F3-full-cache/src/recovery/manifest-transition.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/recovery/manifest-transition.fasl")
   :BYTES 6626 :SHA256
   "59ba70caf1029d004b249390b969986ffaef226fae63061b4b1463a5af8b9644")
  (:PATH "raw/F3-full-cache/src/recovery/manifest-types.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/recovery/manifest-types.fasl")
   :BYTES 30414 :SHA256
   "60048cca29031da109e83d0a6911d8a3518e6f7c5683f11c31c234372cc081a7")
  (:PATH "raw/F3-full-cache/src/recovery/package.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/recovery/package.fasl")
   :BYTES 1338 :SHA256
   "00e1ebac4a991dabc1629c4410ea0785c823aedc6b200cbc52b3299d42fb2c65")
  (:PATH "raw/F3-full-cache/src/recovery/scan.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/recovery/scan.fasl")
   :BYTES 25447 :SHA256
   "20629a20a1e7e57d16552a688fd92f9a89388b8807891d169bf224247c65ffc8")
  (:PATH "raw/F3-full-cache/src/scheduler/build.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/scheduler/build.fasl")
   :BYTES 4099 :SHA256
   "09378029b057c85554aea45b1b9d3c28b95faac0e8574063d15ad3c6ffb1a508")
  (:PATH "raw/F3-full-cache/src/scheduler/lifecycle-build.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/scheduler/lifecycle-build.fasl")
   :BYTES 6604 :SHA256
   "6e74aebb3cd01af1b29a2ece867126501d58e120b78254438b14377d5d071104")
  (:PATH "raw/F3-full-cache/src/scheduler/lifecycle-read.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/scheduler/lifecycle-read.fasl")
   :BYTES 4487 :SHA256
   "896a1070c86f0922aadd0265bb3e1ff76b27162b98d56a3d09de04ea4c8fa097")
  (:PATH "raw/F3-full-cache/src/scheduler/lifecycle-types.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/scheduler/lifecycle-types.fasl")
   :BYTES 13333 :SHA256
   "aa46a66c55f68dd3617a3b30b1bddabb65879012ba7999e9c51be1e8f162a9d3")
  (:PATH "raw/F3-full-cache/src/scheduler/lifecycle-update.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/scheduler/lifecycle-update.fasl")
   :BYTES 5724 :SHA256
   "c3e7ecf3d655782e92cac7ce0addfa1d1d0d9ca48275b5909e594d3b10babd51")
  (:PATH "raw/F3-full-cache/src/scheduler/lifecycle-worker.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/scheduler/lifecycle-worker.fasl")
   :BYTES 3556 :SHA256
   "32b13f49797ed21bc777ff8412412c612d60b343adc4f70bd5045678b1d3fafa")
  (:PATH "raw/F3-full-cache/src/scheduler/package.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/scheduler/package.fasl")
   :BYTES 1140 :SHA256
   "5f760da9e854f7f83630bdacb01f45f2b03ae9cdfcdd598f084901b1ddc76f8b")
  (:PATH "raw/F3-full-cache/src/scheduler/policy.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/scheduler/policy.fasl")
   :BYTES 4412 :SHA256
   "dc446d1cff72132292c15c91a807cdfc8de6632ae95ca13166a5908b98d454ad")
  (:PATH "raw/F3-full-cache/src/scheduler/pool-claim.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/scheduler/pool-claim.fasl")
   :BYTES 2727 :SHA256
   "d4a28e4b5de66c5d0d870ff53d9b4ab67a58b2b4696b7eaf4e5044f665e63fb4")
  (:PATH "raw/F3-full-cache/src/scheduler/read.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/scheduler/read.fasl")
   :BYTES 3329 :SHA256
   "9e41cddb89fa2f63cea3877c5f67d2a2dc1e3749949a5f797bcecb513856f0b4")
  (:PATH "raw/F3-full-cache/src/scheduler/types.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/scheduler/types.fasl")
   :BYTES 16604 :SHA256
   "52ca9c5fcdbbac40a09931d9e68aedcca33e09f2e443f56d4a6ee10eda6e6094")
  (:PATH "raw/F3-full-cache/src/scheduler/update.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/scheduler/update.fasl")
   :BYTES 4730 :SHA256
   "46235cef5e245648b6d027cf0e8e835ce7c0f4451cca4de19387b0290147c9a7")
  (:PATH "raw/F3-full-cache/src/series/events.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/series/events.fasl")
   :BYTES 17558 :SHA256
   "380857166cd166cd00f2818d0fd7381911d6dfbf7667f3db0d87eb7b63086bc1")
  (:PATH "raw/F3-full-cache/src/series/io-events.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/series/io-events.fasl")
   :BYTES 8388 :SHA256
   "85e28e8daa906392f2ec56bf0bb6e3096cc60717c8b4edcabf52704b41d23d90")
  (:PATH "raw/F3-full-cache/src/series/ownership.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/series/ownership.fasl")
   :BYTES 13658 :SHA256
   "0d7d6e8d1fc523da00f1ea8cb48ade5e2c8d390c7309aaa87ea1c977513b1b05")
  (:PATH "raw/F3-full-cache/src/series/package.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/series/package.fasl")
   :BYTES 1745 :SHA256
   "3edfe2a6e93709ab9cf1f35b2b00395a44edf110cc30201bf9f8ce8e5bb424ab")
  (:PATH "raw/F3-full-cache/src/series/publication.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/series/publication.fasl")
   :BYTES 14458 :SHA256
   "eb40f3dee882f54e5fb06ef4bd3149ad79c35ad6a55b443ed191278fb8086603")
  (:PATH "raw/F3-full-cache/src/series/query.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/series/query.fasl")
   :BYTES 6494 :SHA256
   "0d8dd1318e817215c9fc8ae7c964709843ad1db7c85e87a16726b11762b7ac21")
  (:PATH "raw/F3-full-cache/src/series/retirement.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/series/retirement.fasl")
   :BYTES 8210 :SHA256
   "0580155e792dac02e0b23fdfc94ca32ff87238f89e72c280aa577bf9fddedc37")
  (:PATH "raw/F3-full-cache/src/series/routing-build.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/series/routing-build.fasl")
   :BYTES 6413 :SHA256
   "bf68923319223b586ab6511ea77b8252e27a17973db3fa831e13db6d4a63666a")
  (:PATH "raw/F3-full-cache/src/series/routing-select.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/series/routing-select.fasl")
   :BYTES 6871 :SHA256
   "5d8579cf9286989713126fcac0c8386f96a490f9254d92fba3669891a35d83eb")
  (:PATH "raw/F3-full-cache/src/series/routing-types.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/series/routing-types.fasl")
   :BYTES 9270 :SHA256
   "42c173882928343137279f4c2ebef9c2730f0f1cc9c95187ac1b152248b9b868")
  (:PATH "raw/F3-full-cache/src/series/types.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/series/types.fasl")
   :BYTES 34009 :SHA256
   "7805756a37c9cfa264bb80d3792ff9cd99d25fbe47fed739c366597d080e3002")
  (:PATH "raw/F3-full-cache/src/series/worker-boundary.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/series/worker-boundary.fasl")
   :BYTES 7846 :SHA256
   "c9f33b6d3165d6fa4875557a81bcb01a4bec0d81c7703f96b4f8f449c0388645")
  (:PATH "raw/F3-full-cache/src/series/worker-package.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/series/worker-package.fasl")
   :BYTES 1587 :SHA256
   "d50354e6d09be3718abb199afbbf400de90fa615ba94e71264cd5571475a72e1")
  (:PATH "raw/F3-full-cache/src/series/worker-run.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/series/worker-run.fasl")
   :BYTES 15258 :SHA256
   "5c3fdbcc1b603caed82371c0c8a5d3fd5cbc6771b34d533e91d0b17e41eb6e1e")
  (:PATH "raw/F3-full-cache/src/series/worker-types.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/series/worker-types.fasl")
   :BYTES 17264 :SHA256
   "f566efa0f56a428955a3b25433b5e5ccdac3881cd177e56d0f352a06a84042e7")
  (:PATH "raw/F3-full-cache/src/storage/compaction-scan.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/storage/compaction-scan.fasl")
   :BYTES 8284 :SHA256
   "33efc6f42ff1bb94fb5a1474a7ceee1c45986b83166ec50477d28cdc4b9681ae")
  (:PATH "raw/F3-full-cache/src/storage/control-payload.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/storage/control-payload.fasl")
   :BYTES 12130 :SHA256
   "2a8dbbefa5de24bd52f99d0d4c59b5dc053b5aacf25c7fab7283cc361bf8b9e9")
  (:PATH "raw/F3-full-cache/src/storage/formats.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/storage/formats.fasl")
   :BYTES 8582 :SHA256
   "a7644b9a8bd227d8945088a5b8b61f6e574d1696ec57a21d061ab2b1120601ee")
  (:PATH "raw/F3-full-cache/src/storage/log-header.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/storage/log-header.fasl")
   :BYTES 7970 :SHA256
   "ea04b7a368994a54bf03feb288c3431cb9255c9f49b9669c0658f59aa474d21c")
  (:PATH "raw/F3-full-cache/src/storage/package.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/storage/package.fasl")
   :BYTES 1496 :SHA256
   "6d2c869db7756764b4df0bea7be6efd1e05020c6158d720cb4459a66f7cfa0ce")
  (:PATH "raw/F3-full-cache/src/storage/payload-record.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/storage/payload-record.fasl")
   :BYTES 6747 :SHA256
   "e2b2ede5718adc056c0ab5f9e01715acd91e207c11a1a482c7511e84f9aa60fb")
  (:PATH "raw/F3-full-cache/src/storage/payload-write.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/storage/payload-write.fasl")
   :BYTES 9547 :SHA256
   "4068291e6c42a45428978efe6c30222368af1bdf1b4c991c728c10b0c717afa6")
  (:PATH "raw/F3-full-cache/src/storage/segment-header.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/storage/segment-header.fasl")
   :BYTES 10310 :SHA256
   "fffba70a7336b1eb68085f0c93f8f0fc138eaa2d93fcf407542ad3b088de2492")
  (:PATH "raw/F3-full-cache/src/wal/builder.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/wal/builder.fasl")
   :BYTES 14593 :SHA256
   "16e2105e0091d72961e34c618c91246353d08f0d366e77aa5b21fd3c097a4894")
  (:PATH "raw/F3-full-cache/src/wal/csn.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/wal/csn.fasl")
   :BYTES 16433 :SHA256
   "139d232c3d0383d474ff9f831d031ea9a24051c595a1cd5c0aa375faad469c1c")
  (:PATH "raw/F3-full-cache/src/wal/executor.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/wal/executor.fasl")
   :BYTES 13800 :SHA256
   "233624ff0a28dfdeec5d4fcac6b2696a625fa8c7d579f71816788483a905cabf")
  (:PATH "raw/F3-full-cache/src/wal/group.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/wal/group.fasl")
   :BYTES 11028 :SHA256
   "c821ce7a3fd484d8a4a97f3ca450a7a83511c982a81d945ac2c1cb7ead3f2303")
  (:PATH "raw/F3-full-cache/src/wal/package.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/wal/package.fasl")
   :BYTES 2121 :SHA256
   "bf26463b9adb4b106df7bcef82f5ffbc19cf76fc4111f639ef57f10e153cb220")
  (:PATH "raw/F3-full-cache/src/wal/types.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/src/wal/types.fasl")
   :BYTES 38887 :SHA256
   "60cc61decb475d757c0780362c847ca639cc5c5118777f8e7b1d116a884d1657")
  (:PATH "raw/F3-full-cache/tests/codec/cbor-array-write-support.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/cbor-array-write-support.fasl")
   :BYTES 22678 :SHA256
   "84db232f13d030c0ad9ccb803c6e30b5f577bb4c238da904c8e44dce3d0df76c")
  (:PATH "raw/F3-full-cache/tests/codec/cbor-array-write-threads.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/cbor-array-write-threads.fasl")
   :BYTES 11030 :SHA256
   "82f4aa4875577ec9ffb12a39f240715c8c9aa049eb21a4a099e3290731e81ab3")
  (:PATH "raw/F3-full-cache/tests/codec/cbor-array-write.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/cbor-array-write.fasl")
   :BYTES 36665 :SHA256
   "083716e1abdd8d7ec1360223e5499500b1721bb01218c90b19aaa0c584f079cc")
  (:PATH "raw/F3-full-cache/tests/codec/cbor-float-write-support.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/cbor-float-write-support.fasl")
   :BYTES 30402 :SHA256
   "94cd4499977270660c550b305d62db46da39494e1e02f7cd74047ff1a906e9e5")
  (:PATH "raw/F3-full-cache/tests/codec/cbor-float-write-threads.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/cbor-float-write-threads.fasl")
   :BYTES 10542 :SHA256
   "e4e7406928abe485e4c27ce23ba5be3c2b5e883d71916ba11c1003789452eaeb")
  (:PATH "raw/F3-full-cache/tests/codec/cbor-float-write.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/cbor-float-write.fasl")
   :BYTES 40115 :SHA256
   "1395dcd247a7b6006ac957f0271f62eea3209edb1dd96470a0e5f271c5a6ce0f")
  (:PATH "raw/F3-full-cache/tests/codec/cbor-header.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/cbor-header.fasl")
   :BYTES 22707 :SHA256
   "2294012b5d3dda936622bd921dd286e8996c74a5dc4f5f83fc90086d16ae0ea3")
  (:PATH "raw/F3-full-cache/tests/codec/cbor-map-write-support.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/cbor-map-write-support.fasl")
   :BYTES 23686 :SHA256
   "6f94991b4b439f3d3b8ab37d38f50840d3057c2803771cc3c88b2e1c20189f7d")
  (:PATH "raw/F3-full-cache/tests/codec/cbor-map-write-threads.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/cbor-map-write-threads.fasl")
   :BYTES 11008 :SHA256
   "ca18c07b99d5b4294f39e8d4b3c8f4aea6a11827ead76dc3fefcf823e89d1711")
  (:PATH "raw/F3-full-cache/tests/codec/cbor-map-write.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/cbor-map-write.fasl")
   :BYTES 38934 :SHA256
   "1dac621035c864138c19b6eab8b62625473bb1a70db7729b4257bf28786097c7")
  (:PATH "raw/F3-full-cache/tests/codec/cbor-minimal-edges.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/cbor-minimal-edges.fasl")
   :BYTES 3135 :SHA256
   "99c06dc9f1a5d512fad28a3438c5e04c0ccecc67c969b783f0c2835b8b17a4ab")
  (:PATH "raw/F3-full-cache/tests/codec/cbor-minimal-scan-support.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/cbor-minimal-scan-support.fasl")
   :BYTES 30226 :SHA256
   "31a9bd4ca1bcde939d3b45e6691e6b05b9d7088d5afc7ffc3b02fda38ae3f8e2")
  (:PATH "raw/F3-full-cache/tests/codec/cbor-minimal-scan-threads.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/cbor-minimal-scan-threads.fasl")
   :BYTES 12077 :SHA256
   "78a1c39492305bfa8ddc8eb8f6e6675f5680d87ca217e271b4831087d31801e8")
  (:PATH "raw/F3-full-cache/tests/codec/cbor-minimal-scan.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/cbor-minimal-scan.fasl")
   :BYTES 33519 :SHA256
   "3d17c611966c7c5b3c6c11aae8b52132d948effa97a885d2710af9ee2dde08e1")
  (:PATH "raw/F3-full-cache/tests/codec/cbor-minimal-support.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/cbor-minimal-support.fasl")
   :BYTES 23891 :SHA256
   "4c9c32920132b7937a81d8d164723b568f706edf593a91b87f16c2d73e4bce07")
  (:PATH "raw/F3-full-cache/tests/codec/cbor-minimal-threads.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/cbor-minimal-threads.fasl")
   :BYTES 9939 :SHA256
   "b5e8aba8f7b855a4309842ce7d9bf9db9c37cd16835255df3b87b4cae98ec0ad")
  (:PATH "raw/F3-full-cache/tests/codec/cbor-minimal.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/cbor-minimal.fasl")
   :BYTES 24415 :SHA256
   "d394770dffef154ab46357edb3cd199d036498b4de5e6b999c5a59bfdbb3d6d8")
  (:PATH "raw/F3-full-cache/tests/codec/cbor-simple-write-support.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/cbor-simple-write-support.fasl")
   :BYTES 16645 :SHA256
   "611ea3b11ca8a9b2dc47fd7821de2ac68103240d6bc0d721f1b5a04c0e94692e")
  (:PATH "raw/F3-full-cache/tests/codec/cbor-simple-write-threads.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/cbor-simple-write-threads.fasl")
   :BYTES 10483 :SHA256
   "5c6bcda9284fde6226bf2fd90316f403f5ad91a88a31d966d6b81dbdb304d20c")
  (:PATH "raw/F3-full-cache/tests/codec/cbor-simple-write.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/cbor-simple-write.fasl")
   :BYTES 23619 :SHA256
   "12bb750ac5423a9b63e2d1d3d16664d14060aeb09df500a8eb9bc36bfa50d635")
  (:PATH "raw/F3-full-cache/tests/codec/cbor-string-write-support.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/cbor-string-write-support.fasl")
   :BYTES 19584 :SHA256
   "e2f5989976d10b14fce0d53b032357e14d3cb49aebdccf974cd8ec7b6ca984da")
  (:PATH "raw/F3-full-cache/tests/codec/cbor-string-write-threads.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/cbor-string-write-threads.fasl")
   :BYTES 10419 :SHA256
   "760678a22c7a18eb2c8222094281358dd0575b85eed5296749281ad598cf9a27")
  (:PATH "raw/F3-full-cache/tests/codec/cbor-string-write.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/cbor-string-write.fasl")
   :BYTES 28840 :SHA256
   "209e437861a1cd6c838e435034dc64e7e297ef3484eea5c14526b2fdd9d8a617")
  (:PATH "raw/F3-full-cache/tests/codec/cbor-structure-support.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/cbor-structure-support.fasl")
   :BYTES 34942 :SHA256
   "6eb570aca893149a9be31f65c75e7dbde04781c7135baf2dd4c8d81d6124a476")
  (:PATH "raw/F3-full-cache/tests/codec/cbor-structure-threads.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/cbor-structure-threads.fasl")
   :BYTES 11814 :SHA256
   "e776cdb95f3d87fe08841e09ea9986d7bd5252892e8604ebea8c0be4da484c07")
  (:PATH "raw/F3-full-cache/tests/codec/cbor-structure.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/cbor-structure.fasl")
   :BYTES 41677 :SHA256
   "a21f11f34a754e76df23bbc340e94a60f45585bfbd07d4c57f1524922053991a")
  (:PATH "raw/F3-full-cache/tests/codec/cbor-support.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/cbor-support.fasl")
   :BYTES 18133 :SHA256
   "6ea0a62ee918dd00b49a975f31ab4cd48709c9f4e7be669d6a093b9bfd86d07d")
  (:PATH "raw/F3-full-cache/tests/codec/cbor-tag-write-support.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/cbor-tag-write-support.fasl")
   :BYTES 22730 :SHA256
   "5e7b0bd34030af418c8dcc951dec72100538749b8674235ae2728962e66bfbe1")
  (:PATH "raw/F3-full-cache/tests/codec/cbor-tag-write-threads.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/cbor-tag-write-threads.fasl")
   :BYTES 10768 :SHA256
   "9596b2c930ebe7bcfa0b82e46cb3a66a1f1c54eea3883d1e341a97e326259232")
  (:PATH "raw/F3-full-cache/tests/codec/cbor-tag-write.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/cbor-tag-write.fasl")
   :BYTES 34823 :SHA256
   "0800ddbb51d2bb2704547fdd8bcc5d5bfe65414384095ee56d290f485b89330e")
  (:PATH "raw/F3-full-cache/tests/codec/cbor-threads.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/cbor-threads.fasl")
   :BYTES 10387 :SHA256
   "3302f6326192393fd54cf32a4dc3a09062def97bf97c9b5cf0d71e36d01a7290")
  (:PATH "raw/F3-full-cache/tests/codec/cbor-write-roundtrip.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/cbor-write-roundtrip.fasl")
   :BYTES 2554 :SHA256
   "85c63da8b61279521827bc32b490764e463ae2d8ede650c399227b0f47ed18cd")
  (:PATH "raw/F3-full-cache/tests/codec/cbor-write-support.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/cbor-write-support.fasl")
   :BYTES 14010 :SHA256
   "f740ed5c91ac15955fe0b86bd71497f83b542ddd15eda7dd67f28f9f03104151")
  (:PATH "raw/F3-full-cache/tests/codec/cbor-write-threads.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/cbor-write-threads.fasl")
   :BYTES 10541 :SHA256
   "0def36a0ef808d013cebab6c646914bd15ca4652f717c4833d5d85e702d79f9d")
  (:PATH "raw/F3-full-cache/tests/codec/cbor-write.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/cbor-write.fasl")
   :BYTES 19792 :SHA256
   "b4e1ddc727eac69d86d0c2e92e35e0d08b9b63cc8f3da8420ba470df6b57c797")
  (:PATH "raw/F3-full-cache/tests/codec/support.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/support.fasl")
   :BYTES 17727 :SHA256
   "9d7a61e513b800715d8b2ebc5b9d22fae90a6a1d2356e3bb2d0f01dd6381ddc8")
  (:PATH "raw/F3-full-cache/tests/codec/threads.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/threads.fasl")
   :BYTES 9411 :SHA256
   "98a411c72bedeb7eafbc5ae2b1d716bf05e7baea690e985448e1f1353e6496a4")
  (:PATH "raw/F3-full-cache/tests/codec/utf8.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/codec/utf8.fasl")
   :BYTES 25370 :SHA256
   "b130abe2b06b8d5a4fe3d0b4b733858c0d061499f6d8afb2ee598afbc245cf2a")
  (:PATH "raw/F3-full-cache/tests/control/native.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/control/native.fasl")
   :BYTES 151844 :SHA256
   "527491bda717ed5c71814852b83f11005f959c85f9b6b2929cdb92bd19f18c7a")
  (:PATH "raw/F3-full-cache/tests/control/publication.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/control/publication.fasl")
   :BYTES 258126 :SHA256
   "eb35d47944881e16ef93e879a4baf794e958e0df2dd3b0dd003000e5a98f38c1")
  (:PATH "raw/F3-full-cache/tests/control/recovery-publication.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/control/recovery-publication.fasl")
   :BYTES 96675 :SHA256
   "964f6aa7c37ee0ba21da04dd714a90ad5303c70a21fed9d8eb9252e54ee797b9")
  (:PATH "raw/F3-full-cache/tests/control/recovery-read.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/control/recovery-read.fasl")
   :BYTES 144682 :SHA256
   "d359f62ec01b69eeee4cd7f7151536bc318c3e0ae34e3d86d4d85bbc29829418")
  (:PATH "raw/F3-full-cache/tests/control/support.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/control/support.fasl")
   :BYTES 3948 :SHA256
   "10c0c4349c9fe2ae6af4783ca4c57d7a8e84639db5fabc64d2494301ee6e6d32")
  (:PATH "raw/F3-full-cache/tests/csn/registry.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/csn/registry.fasl")
   :BYTES 50829 :SHA256
   "843f9575f58149dd6f7344eb0f1307033f214ec5acb02119ecffcdc3cf379ca8")
  (:PATH "raw/F3-full-cache/tests/csn/support.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/csn/support.fasl")
   :BYTES 39990 :SHA256
   "57cf6a553cdc301ebcee0491a9be621d7e7496a4240d18d7eddfe405ccd5e33d")
  (:PATH "raw/F3-full-cache/tests/csn/threads.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/csn/threads.fasl")
   :BYTES 22670 :SHA256
   "c78ec2f1695cac669cd633c854d10d4c7bec3c2ae8decc2245e0c50f49e4dc3d")
  (:PATH "raw/F3-full-cache/tests/epochs/lifecycle.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/epochs/lifecycle.fasl")
   :BYTES 73983 :SHA256
   "2a37c2fd0bb7efd912af3bc210ca15e20f9f5bfda167392fad0f8647f2b5ad95")
  (:PATH "raw/F3-full-cache/tests/epochs/support.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/epochs/support.fasl")
   :BYTES 35861 :SHA256
   "6bb6de6bc3aad66b61b134b895312f16f24267b282d63a5681966d9b397df15b")
  (:PATH "raw/F3-full-cache/tests/epochs/threads.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/epochs/threads.fasl")
   :BYTES 10418 :SHA256
   "a03743c682b95a2f3325f3367532532d5c563954ae8fbcf1f05b27698fa41b8c")
  (:PATH "raw/F3-full-cache/tests/execution/handoff.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/execution/handoff.fasl")
   :BYTES 90782 :SHA256
   "34b2f4be3e0f5fda3b134cc47ec397d58c2881cb3150ab2d9e83d57dbbb412c7")
  (:PATH "raw/F3-full-cache/tests/execution/queue.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/execution/queue.fasl")
   :BYTES 40333 :SHA256
   "1ff4c0f1608754aa5da1810e5e269a4e8e17b7f5f08f91291504f54045fc7866")
  (:PATH "raw/F3-full-cache/tests/execution/ready-recycle.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/execution/ready-recycle.fasl")
   :BYTES 67050 :SHA256
   "c5d26a81fcf4812f1cbccbc775bf620eb9e351de22c7056d7c8474e2282651bc")
  (:PATH "raw/F3-full-cache/tests/execution/ready.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/execution/ready.fasl")
   :BYTES 82266 :SHA256
   "8596a28d45d95e5e86e4ad7ef0dfa2bc6d314db6167e672e4dfa2de3671ef397")
  (:PATH "raw/F3-full-cache/tests/execution/support.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/execution/support.fasl")
   :BYTES 16054 :SHA256
   "43980eefcb641b3890eb883815502c8fb4ded81fa4e819c3894a87bb4ebfc7f7")
  (:PATH "raw/F3-full-cache/tests/execution/threads.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/execution/threads.fasl")
   :BYTES 32774 :SHA256
   "319537db69beb31fc4e5852a87d3e134b1d1735c403fbfb97b25e8753e8ed435")
  (:PATH "raw/F3-full-cache/tests/execution/worker.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/execution/worker.fasl")
   :BYTES 158266 :SHA256
   "e8e5be65389a5d7cb628662f4ca548826f33207097065ecc5ee790d5445b5d43")
  (:PATH "raw/F3-full-cache/tests/foundation/batch.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/foundation/batch.fasl")
   :BYTES 18989 :SHA256
   "8ddf2991ad607ec7a9bec60c7882e2084ddec59a7e7ea9aa13e239d0437d5608")
  (:PATH "raw/F3-full-cache/tests/foundation/binary.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/foundation/binary.fasl")
   :BYTES 15557 :SHA256
   "8e4ed340829e5727c4faee5c76d1d6448c689252de15db0c979b2a88a9d203e3")
  (:PATH "raw/F3-full-cache/tests/foundation/record.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/foundation/record.fasl")
   :BYTES 59112 :SHA256
   "a8e9f254bb34a97e1119a729e9d64c8ea66bf345fe1a6ec6a3a7288d4373d67d")
  (:PATH "raw/F3-full-cache/tests/foundation/support.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/foundation/support.fasl")
   :BYTES 10271 :SHA256
   "4446641b268286d3576d2624cc7eb01310c2c6d876c255cdff63d72edbcd8fcf")
  (:PATH "raw/F3-full-cache/tests/get-active/construction.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/get-active/construction.fasl")
   :BYTES 80693 :SHA256
   "6d3fba8f0401ade543dc4c666991e7c0ce7f7fcf71c34af53095118fff37523f")
  (:PATH "raw/F3-full-cache/tests/get-active/directory.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/get-active/directory.fasl")
   :BYTES 29455 :SHA256
   "7d403ccc3604e5c36f5ab072f8052ba1b96734f1ff0c8e986427dd58b7544e45")
  (:PATH "raw/F3-full-cache/tests/get-active/preflight.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/get-active/preflight.fasl")
   :BYTES 72386 :SHA256
   "4849285072bb6f5be23eb1559f90bd3f1e2733dd921eac4d99c68a0f6ebf97f3")
  (:PATH "raw/F3-full-cache/tests/get-active/read.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/get-active/read.fasl")
   :BYTES 110761 :SHA256
   "0d50c2843ec74d47c6b02996d02808559ee5694ccb5e4b729053efee0dce0b8d")
  (:PATH "raw/F3-full-cache/tests/get-active/support.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/get-active/support.fasl")
   :BYTES 179830 :SHA256
   "132d111f8081b96ebfe7c458cd80ca3ff834ad34a0b624a0dbe171de215de050")
  (:PATH "raw/F3-full-cache/tests/get-directory/construction.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/get-directory/construction.fasl")
   :BYTES 40537 :SHA256
   "9bb456a5953102b23fd26e8ee4cb8992058fbe018bc65beb9b65e440edcf6c68")
  (:PATH "raw/F3-full-cache/tests/get-directory/lifetime-support.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/get-directory/lifetime-support.fasl")
   :BYTES 26848 :SHA256
   "e19adf17f5620ef47dd4ac5898ee4d955bc5a7ed2bbb12a6afb7ca90cf50c49a")
  (:PATH "raw/F3-full-cache/tests/get-directory/lifetime.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/get-directory/lifetime.fasl")
   :BYTES 69114 :SHA256
   "9ee28a344fadc5fc486a6784ba162bd1c2e65b2b55ea0f0d44845c8a8bbc1f50")
  (:PATH "raw/F3-full-cache/tests/get-directory/read.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/get-directory/read.fasl")
   :BYTES 65615 :SHA256
   "8e4d59d56122ebb159f8b674823bf0925ac6171834363f0efc0e1b06feb2e0d1")
  (:PATH "raw/F3-full-cache/tests/get-directory/series-read.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/get-directory/series-read.fasl")
   :BYTES 243980 :SHA256
   "0e49fdec678edbff6120eea0d96ee6efe392ae5c2b890f27cb08351e6f89ea8f")
  (:PATH "raw/F3-full-cache/tests/get-directory/series-support.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/get-directory/series-support.fasl")
   :BYTES 116815 :SHA256
   "5a44c469d655cc3cbeb7c811e7b36d56dd3dc029a03bf4c616a2ed3b707d0889")
  (:PATH "raw/F3-full-cache/tests/get-directory/support.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/get-directory/support.fasl")
   :BYTES 133865 :SHA256
   "b7a14dfd2599c92ed325bb2851fcc8df3032a68c3176846d79e438779780c663")
  (:PATH "raw/F3-full-cache/tests/get-directory/threads.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/get-directory/threads.fasl")
   :BYTES 15438 :SHA256
   "c9725da0b7f1c684b13c02fd91353f5c1b97c65e41b5a48d6c41fae9dda16d72")
  (:PATH "raw/F3-full-cache/tests/get-performance/guards.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/get-performance/guards.fasl")
   :BYTES 19315 :SHA256
   "516df8b04953d3603ef325e8702a1ad880d06cd65c631a6534cf2b8d08af60ec")
  (:PATH "raw/F3-full-cache/tests/get-performance/paths.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/get-performance/paths.fasl")
   :BYTES 15866 :SHA256
   "166ff142a73633937d457d90036040d380b83d34d869d7d62c2d257d8ae132ac")
  (:PATH "raw/F3-full-cache/tests/get-performance/support.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/get-performance/support.fasl")
   :BYTES 114320 :SHA256
   "afcbd5c4bbdeb81f1b7de51b6f35a80bc1a89e0c6e65138bb471e03efc4e7336")
  (:PATH "raw/F3-full-cache/tests/get-performance/threads.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/get-performance/threads.fasl")
   :BYTES 10480 :SHA256
   "a71041b2550eeb9d176b03820272cfae8c0cb7fa3faee8c2efa4b4ed0f86d6be")
  (:PATH "raw/F3-full-cache/tests/get-resolver/construction.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/get-resolver/construction.fasl")
   :BYTES 56479 :SHA256
   "dddcc7de39857994d08393567cbb25e30d61c87ecebdca44cda3b1719b3e0f97")
  (:PATH "raw/F3-full-cache/tests/get-resolver/read.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/get-resolver/read.fasl")
   :BYTES 122912 :SHA256
   "55d23f59190fad0286a70038e99c0ac1878fd98a2b2b337e94b532bec59784b8")
  (:PATH "raw/F3-full-cache/tests/get-resolver/sort.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/get-resolver/sort.fasl")
   :BYTES 31273 :SHA256
   "21b0dba028a06421cd8f61d6de52ca51490824dc35e672085e49e2d03a91e2ed")
  (:PATH "raw/F3-full-cache/tests/get-resolver/support.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/get-resolver/support.fasl")
   :BYTES 130390 :SHA256
   "509d411c09055bc8a800cb7c41bec3de6e0dc3ad469ac837f6276900cfdc9259")
  (:PATH "raw/F3-full-cache/tests/get/lifecycle.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/get/lifecycle.fasl")
   :BYTES 86065 :SHA256
   "e0aafa850c190c10c3641c974e586830a6313b2a165703e614132f6b604d4367")
  (:PATH "raw/F3-full-cache/tests/get/segment.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/get/segment.fasl")
   :BYTES 64566 :SHA256
   "ffe963149464490dfdc02932bb9a913b6c18988bbf84826e719f94afecde1bb4")
  (:PATH "raw/F3-full-cache/tests/get/support.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/get/support.fasl")
   :BYTES 56065 :SHA256
   "89461d4beb3be015d699b9125105ac581a9b7bcf8d9bee043cee91bc0fb48dc5")
  (:PATH "raw/F3-full-cache/tests/hash/guards.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/hash/guards.fasl")
   :BYTES 4805 :SHA256
   "89ae52171cfd2a1202b24a5eca1ec1bc23e35f542321856707afa55609a826c1")
  (:PATH "raw/F3-full-cache/tests/hash/hash64.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/hash/hash64.fasl")
   :BYTES 37232 :SHA256
   "878f816fe2cf6a174e9c4eebacfe8781649392c66cbbcb15f38ba8e4b0b2bc9e")
  (:PATH "raw/F3-full-cache/tests/hash/support.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/hash/support.fasl")
   :BYTES 46843 :SHA256
   "103375c4ab9501a528d9b6dc7525a82fd7e648d0485e247de624a6cb52a11173")
  (:PATH "raw/F3-full-cache/tests/hash/threads.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/hash/threads.fasl")
   :BYTES 14668 :SHA256
   "903aae155db08522a5ed95a4c4d8816ee95735ccd806b1b71d9e1f26213d3aaa")
  (:PATH "raw/F3-full-cache/tests/index/hash-digests.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/index/hash-digests.fasl")
   :BYTES 149727 :SHA256
   "07feafcc0dba75e8090e4dd4e0241539ad18156d054855859bba0495799ef136")
  (:PATH "raw/F3-full-cache/tests/index/primary-support.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/index/primary-support.fasl")
   :BYTES 55209 :SHA256
   "db78d23c2293c821ca46e4949b31937fd72307aaca7251f9057b253cb510233b")
  (:PATH "raw/F3-full-cache/tests/index/primary-threads.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/index/primary-threads.fasl")
   :BYTES 54597 :SHA256
   "639ec2fbd63262bccc78ebbb68a2df102a9cb09d372a53ebeae45fd8c4a70212")
  (:PATH "raw/F3-full-cache/tests/index/primary.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/index/primary.fasl")
   :BYTES 143077 :SHA256
   "05bd3644ab754041f7d15d67188cf13896f94330b70cf8650c7d73ccaa706210")
  (:PATH "raw/F3-full-cache/tests/index/rebuild.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/index/rebuild.fasl")
   :BYTES 135875 :SHA256
   "2f488d315c503520b3115b67f1204166fd9bf77b7819d04818359df441e94e5c")
  (:PATH "raw/F3-full-cache/tests/index/slot-support.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/index/slot-support.fasl")
   :BYTES 48223 :SHA256
   "3580c44c2d18af60f37cf737df740c71c35e828138b41e4c6d4b9c386794c00d")
  (:PATH "raw/F3-full-cache/tests/index/slot-threads.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/index/slot-threads.fasl")
   :BYTES 52723 :SHA256
   "17439a2ba6e8a72c105b723abfe4d0cf4973823f9a0c61f79d5209cb172ccf8c")
  (:PATH "raw/F3-full-cache/tests/index/slots.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/index/slots.fasl")
   :BYTES 148200 :SHA256
   "822ac6064a9295fe4be5967365638ebc47fd568e1077f0a55d5ccba55ef5eef3")
  (:PATH "raw/F3-full-cache/tests/io/flush-failure.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/io/flush-failure.fasl")
   :BYTES 34572 :SHA256
   "f9223769d6cfe0f834b63ec3f25effa992e2ea5f31339295c206e5af8d7c1aa0")
  (:PATH "raw/F3-full-cache/tests/io/native.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/io/native.fasl")
   :BYTES 34316 :SHA256
   "dd74d988a93924a481e2044a8ca91353eb2eac30f0855821f16709974f9387eb")
  (:PATH "raw/F3-full-cache/tests/io/rename-native.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/io/rename-native.fasl")
   :BYTES 126290 :SHA256
   "cb2f211c047149cb4a768b634030a249eb245556733280a4393ad85411d6a73d")
  (:PATH "raw/F3-full-cache/tests/io/rename.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/io/rename.fasl")
   :BYTES 110046 :SHA256
   "09277c7bcebb647ad1aa40f4e5bb6a562359092013121eb6289242df6b4501f7")
  (:PATH "raw/F3-full-cache/tests/io/support.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/io/support.fasl")
   :BYTES 16064 :SHA256
   "7a4ee03104ea37370d15d68abb8721427dfd8bd8d7c862c63030441377d4d084")
  (:PATH "raw/F3-full-cache/tests/io/transfer-failure.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/io/transfer-failure.fasl")
   :BYTES 25942 :SHA256
   "2629edb942baedcbdfa9c1685cc76fc46d3035006464e57b7885a1e5557a7f18")
  (:PATH "raw/F3-full-cache/tests/io/transfer.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/io/transfer.fasl")
   :BYTES 53169 :SHA256
   "af782d8b5ff509ffef39d19b0be5e0aeb624f5bd8fdaf0902d9907f4a31be824")
  (:PATH "raw/F3-full-cache/tests/mvcc/capture.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/mvcc/capture.fasl")
   :BYTES 48557 :SHA256
   "11b796df945080a52e4cd9e731384d69d30e969e79f99a6fb66da99486ecda94")
  (:PATH "raw/F3-full-cache/tests/mvcc/lifecycle.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/mvcc/lifecycle.fasl")
   :BYTES 89139 :SHA256
   "6454b4621cd80bf58325b2a213b94110fd564da7a876e76f67132ac95879fdbf")
  (:PATH "raw/F3-full-cache/tests/mvcc/support.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/mvcc/support.fasl")
   :BYTES 38340 :SHA256
   "6bc299febf3547e943b4f018fb08ede7b7e2382889d9bd6bff53b615911cf399")
  (:PATH "raw/F3-full-cache/tests/read/lifecycle.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/read/lifecycle.fasl")
   :BYTES 122284 :SHA256
   "4e63fcfe5aa8932d8e9a6e3413cd1e059152d6f9753c615aee808f5d6dff8577")
  (:PATH "raw/F3-full-cache/tests/read/support.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/read/support.fasl")
   :BYTES 20918 :SHA256
   "2058c8003eddf04493713eca786a824be27941669b6b336675fdedcdd9f34afc")
  (:PATH "raw/F3-full-cache/tests/read/threads.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/read/threads.fasl")
   :BYTES 16880 :SHA256
   "37c406e2ac123d84bb9cf232f9138cdf0aed44376d31d536e1c165e06bf5cb27")
  (:PATH "raw/F3-full-cache/tests/recovery/corruption.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/recovery/corruption.fasl")
   :BYTES 13088 :SHA256
   "03a2fc93b58ef64c1c9b5cf4f21949119bd0e7f899962421c44adb29d00b41f4")
  (:PATH "raw/F3-full-cache/tests/recovery/decisions-audit.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/recovery/decisions-audit.fasl")
   :BYTES 34004 :SHA256
   "891330781e596a3b4344f5ba60926802b931a62b5cdaaca28ed7f78820fe929a")
  (:PATH "raw/F3-full-cache/tests/recovery/decisions-radix.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/recovery/decisions-radix.fasl")
   :BYTES 69374 :SHA256
   "77e10d99e50c39bf908fed26aa36882c75b02d206464a4d9b49c2234ffc620ea")
  (:PATH "raw/F3-full-cache/tests/recovery/decisions-support.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/recovery/decisions-support.fasl")
   :BYTES 16614 :SHA256
   "42762587c2d673035dff0bb878e21504d4363e21fbb4991fd7aff2174c4a50d4")
  (:PATH "raw/F3-full-cache/tests/recovery/decisions.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/recovery/decisions.fasl")
   :BYTES 57589 :SHA256
   "da8ec6e8ef0196deddd755bc17ec99f120bb61abc9b29a67d3111ee335db0a23")
  (:PATH "raw/F3-full-cache/tests/recovery/inventory-support.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/recovery/inventory-support.fasl")
   :BYTES 20585 :SHA256
   "52fc5cf132bde0775a94928e0f98fe4028ea859727ca448af32f2a4cabe8edb2")
  (:PATH "raw/F3-full-cache/tests/recovery/inventory.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/recovery/inventory.fasl")
   :BYTES 37703 :SHA256
   "eed5227a90e6491acbd1d07f3de23f37a25cbcc290b5ddbcb68a85efdedec10f")
  (:PATH "raw/F3-full-cache/tests/recovery/manifest-audit.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/recovery/manifest-audit.fasl")
   :BYTES 47961 :SHA256
   "350e0f6ff5d6b8f3ccec6d9c22bfcababafa9356ad50bf57bbd8e9b23a3a7a7d")
  (:PATH "raw/F3-full-cache/tests/recovery/manifest-support.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/recovery/manifest-support.fasl")
   :BYTES 24099 :SHA256
   "53e7b710f488cb02c9fd3184dca4a9148568d9bb4abf66718fb728e6328cb0e0")
  (:PATH "raw/F3-full-cache/tests/recovery/manifest-transition.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/recovery/manifest-transition.fasl")
   :BYTES 63019 :SHA256
   "bbd5b546f0a26c6659ecb8ca1350ec91f37475e3b4cf4d05f48a4662383042c1")
  (:PATH "raw/F3-full-cache/tests/recovery/manifest.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/recovery/manifest.fasl")
   :BYTES 33926 :SHA256
   "9a3bd5bb56f4dffe1495081fdb63449495997ef6e1a0fbc4651c2457617555f7")
  (:PATH "raw/F3-full-cache/tests/recovery/scan.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/recovery/scan.fasl")
   :BYTES 52942 :SHA256
   "b4508545a0202e468a136c11e9682759b394ec5073be44ad7e62b5f38ebfd13d")
  (:PATH "raw/F3-full-cache/tests/recovery/support.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/recovery/support.fasl")
   :BYTES 17902 :SHA256
   "0e4c4ea1bc591b45faecd8ec5373b7db9fc7bc246a210cfd78b3d4472eba6c78")
  (:PATH "raw/F3-full-cache/tests/scheduler/controller.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/scheduler/controller.fasl")
   :BYTES 48533 :SHA256
   "b8f07330dd021a22cf14fb9d5fb6f30dbdea30824b8448623168629533cdcde3")
  (:PATH "raw/F3-full-cache/tests/scheduler/dispatch.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/scheduler/dispatch.fasl")
   :BYTES 64693 :SHA256
   "37c748a4c6097233d742dc1519d5124e38cc2f96ddfbef51679ca5d48a513073")
  (:PATH "raw/F3-full-cache/tests/scheduler/lifecycle.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/scheduler/lifecycle.fasl")
   :BYTES 96592 :SHA256
   "2e4652933dbdb8dcc69ed586d46232794d4c00d44c2d5946eedc1d6c2ba5f902")
  (:PATH "raw/F3-full-cache/tests/scheduler/pool-begin.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/scheduler/pool-begin.fasl")
   :BYTES 59512 :SHA256
   "f736a6e9e209fcc745787123f97c0c3f0ee8e0c9bae1a795c5398435fdba0875")
  (:PATH "raw/F3-full-cache/tests/scheduler/pool-claim.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/scheduler/pool-claim.fasl")
   :BYTES 42910 :SHA256
   "d0b1d7b729eff23e5efb1a4e6ab498a9bf40d9011fb906326fecf0a7867f2987")
  (:PATH "raw/F3-full-cache/tests/scheduler/pool-recycle.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/scheduler/pool-recycle.fasl")
   :BYTES 52620 :SHA256
   "dc9ad30acc14035815aae988953fb46a538d43b412b88cedffdfb77706f4dfb8")
  (:PATH "raw/F3-full-cache/tests/scheduler/support.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/scheduler/support.fasl")
   :BYTES 10730 :SHA256
   "7026438ddb8eae9efe0047211c5800574645a1945b01cc7547ab8b095c76f9e1")
  (:PATH "raw/F3-full-cache/tests/series/boundaries.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/series/boundaries.fasl")
   :BYTES 10719 :SHA256
   "774845a078431fdfb79a3be5f56c50ff4ae4aa1baf3dfa035942fd7fb79c16f0")
  (:PATH "raw/F3-full-cache/tests/series/controller.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/series/controller.fasl")
   :BYTES 165176 :SHA256
   "079dec7c69fe628bf3175f495d47be14774332d39aad6cafdf327013682960d0")
  (:PATH "raw/F3-full-cache/tests/series/support.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/series/support.fasl")
   :BYTES 96212 :SHA256
   "95041ef975cb4ea0d05a0291718e2848bac92d17472caa313a9d09c475c5f7e8")
  (:PATH "raw/F3-full-cache/tests/series/threads.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/series/threads.fasl")
   :BYTES 44949 :SHA256
   "738fb5a2e3848ecde36b4a8cdff94ddfac1ab478354b196c80c717a7bdcd9d23")
  (:PATH "raw/F3-full-cache/tests/series/worker-bridge.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/series/worker-bridge.fasl")
   :BYTES 111063 :SHA256
   "dd817f5335d987f6c6a5fe34afe096c24fb80b9f778f1ad0cfd81ebcfb7c3725")
  (:PATH "raw/F3-full-cache/tests/series/worker-routing.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/series/worker-routing.fasl")
   :BYTES 64479 :SHA256
   "29da0457c7d9c5eb12855b0f154fa7003b3d92f342940c76e80cd43ae25a9306")
  (:PATH "raw/F3-full-cache/tests/smoke.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/smoke.fasl")
   :BYTES 3284 :SHA256
   "8cc47b0aed2b3ccd5bdc53e02cca602009b8a3afe3166b4ad216addf0ac511d7")
  (:PATH "raw/F3-full-cache/tests/storage/compaction-scan.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/storage/compaction-scan.fasl")
   :BYTES 35498 :SHA256
   "258e886fadeebf600b60514c856845e81f0e5336fdcbd0e622bb20bf680edffd")
  (:PATH "raw/F3-full-cache/tests/storage/control-payload.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/storage/control-payload.fasl")
   :BYTES 59351 :SHA256
   "bdcecdb5b7feb08f0b2de64ccbdcf46cdd41de6513fabdeaf7eba82eef4eb91b")
  (:PATH "raw/F3-full-cache/tests/storage/log-header.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/storage/log-header.fasl")
   :BYTES 36637 :SHA256
   "9d48682b7dae7ec6e0c26305716a697777a9b023ff45d3ebe22a98076ba1878d")
  (:PATH "raw/F3-full-cache/tests/storage/segment-header.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/storage/segment-header.fasl")
   :BYTES 18216 :SHA256
   "14b3d990c98814ae2fb5fcc01593aab27104e1ff7b8ca35af112ad2e588442ae")
  (:PATH "raw/F3-full-cache/tests/storage/support.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/storage/support.fasl")
   :BYTES 13718 :SHA256
   "182012f7d89e5e28305c2381143c4725e42560d57ee676c73431707e5899a705")
  (:PATH "raw/F3-full-cache/tests/wal/builder.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/wal/builder.fasl")
   :BYTES 17394 :SHA256
   "33be9b905e471b78570cb947396ebf3decf0ef00e06a879c0d5d4b32ce0ee45c")
  (:PATH "raw/F3-full-cache/tests/wal/csn-threads.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/wal/csn-threads.fasl")
   :BYTES 27286 :SHA256
   "bc23a01164e4427607cd691acef51f6e8ba76ccbca0863bf2fd2be48983cf00e")
  (:PATH "raw/F3-full-cache/tests/wal/csn.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/wal/csn.fasl")
   :BYTES 167866 :SHA256
   "049ffd7f984e29e33df3cecf9cba7f86d498038ba83806496f37b706499387c6")
  (:PATH "raw/F3-full-cache/tests/wal/fault.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/wal/fault.fasl")
   :BYTES 28696 :SHA256
   "27460dfe84ec36332fbb2ee69240d885cccf5cd751b5ca790b66a974058ca961")
  (:PATH "raw/F3-full-cache/tests/wal/group.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/wal/group.fasl")
   :BYTES 25470 :SHA256
   "8cd598ab60c04c77ebcd9f4daac3f9bc57b9e703773e6a31414ba995600ab1c3")
  (:PATH "raw/F3-full-cache/tests/wal/native.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/wal/native.fasl")
   :BYTES 9837 :SHA256
   "3fe328ea80dc785542cc72d6dd2cd184f140bb633a2cdab43077e4e62a410792")
  (:PATH "raw/F3-full-cache/tests/wal/support.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-F3-fasl/tests/wal/support.fasl")
   :BYTES 8016 :SHA256
   "a925cf395ed35294895bc50ca89d6fe34ac0f66811ffc46ffca443e6bc74e423")
  (:PATH "raw/F3-full-inner/conservazione.lisp" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003154-command-24880-0/conservazione.lisp")
   :BYTES 1747 :SHA256
   "05f1c0689918fa6a16d50a0922256da0d981c34133a4e90daafb16d2e12d5be5")
  (:PATH "raw/F3-full-inner/report.lisp" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003154-command-24880-0/report.lisp")
   :BYTES 317 :SHA256
   "4da646b9cde0ee454552a8432e8fb8a02a4ed12a59d7e4cb006cb2bbc3c2b68c")
  (:PATH "raw/F3-full-inner/report.lisp.gz" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003154-command-24880-0/report.lisp.gz")
   :BYTES 170431 :SHA256
   "7c06881229e29cbdf4a08044afdaad91357a858faf52138653073748f4338e91")
  (:PATH "raw/F3-full-outer/conservazione.lisp" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003152-command-24845-0/conservazione.lisp")
   :BYTES 1162 :SHA256
   "52f63350d3edc91a148d6b4ee306c709db7666d54a7e553e6e2b86e2f1260760")
  (:PATH "raw/F3-full-outer/report.lisp" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003152-command-24845-0/report.lisp")
   :BYTES 191703 :SHA256
   "f817b2b82ec0577b1c10a8446d439a5bf6f247b1c9ed32c683d03105ad828ff9")
  (:PATH "raw/F3-native-semantic-audit/conservazione.lisp" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003465-command-33474-0/conservazione.lisp")
   :BYTES 1162 :SHA256
   "9319abbc8f90b112e5eaae61cd364d88500c8954a7d15b0da8b189859d1277c5")
  (:PATH "raw/F3-native-semantic-audit/report.lisp" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003465-command-33474-0/report.lisp")
   :BYTES 419929 :SHA256
   "cc83b08b972ffb829a33a5d84088d0f76107e7245eb4ac53647254d9f638fa93")
  (:PATH "raw/F3-reader-fixtures/completion-exit/isolated-build.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003196-reader-self-test-25173-0/completion-exit/isolated-build.lisp")
   :BYTES 197 :SHA256
   "1a45dcf8a6d03f1e8866e49280c6f0edb894320c90624d5620fad1e3d546cea9")
  (:PATH "raw/F3-reader-fixtures/completion-exit/stderr.log" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003196-reader-self-test-25173-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/F3-reader-fixtures/completion-exit/stdout.log" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003196-reader-self-test-25173-0/completion-exit/stdout.log")
   :BYTES 105 :SHA256
   "5e630c1b44d68ce71b27d151e76bf367e3cbd941200adc36cdd30e0fe7390531")
  (:PATH "raw/F3-reader-fixtures/report.lisp" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003196-reader-self-test-25173-0/report.lisp")
   :BYTES 1961 :SHA256
   "c87f615bfb535e7807f54a997530d5100a625af59e36bf569392c846bb0dca79")
  (:PATH "raw/F3-reader-fixtures/signal/isolated-build.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003196-reader-self-test-25173-0/signal/isolated-build.lisp")
   :BYTES 247 :SHA256
   "ff5cf55dda241d32ea1b4308172c7dc526436cbf1d546e7471148cee95a873d1")
  (:PATH "raw/F3-reader-fixtures/signal/stderr.log" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003196-reader-self-test-25173-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/F3-reader-fixtures/signal/stdout.log" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003196-reader-self-test-25173-0/signal/stdout.log")
   :BYTES 126 :SHA256
   "3697c68fa71f124c8d05d8cc5d649a744586a10989eb2e67c5bdce6bfc760142")
  (:PATH "raw/F3-semantic-output/full-F3-audit.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-audit-runtime/full-F3-audit.lisp")
   :BYTES 220378 :SHA256
   "14e83b57818173ffcb59d1121d3918ead99db1fab52d83ca5727c52e14b3dde1")
  (:PATH "raw/F3-semantic-output/native-wrapper.stderr.log" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-audit-runtime/native-wrapper.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/F3-semantic-output/native-wrapper.stdout.log" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-audit-runtime/native-wrapper.stdout.log")
   :BYTES 764 :SHA256
   "16328abe504c9004fafe5456b38f1b089c73a39a61417fdf6e26cf6434944d96")
  (:PATH "raw/F3-snapshot-fixtures/completion-exit/isolated-build.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003195-snapshot-self-test-25170-0/completion-exit/isolated-build.lisp")
   :BYTES 199 :SHA256
   "b8bb4416a818775bae5c77341eeec2c356a2733f633ac2bc8b6ac3ff955d05e0")
  (:PATH "raw/F3-snapshot-fixtures/completion-exit/stderr.log" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003195-snapshot-self-test-25170-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/F3-snapshot-fixtures/completion-exit/stdout.log" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003195-snapshot-self-test-25170-0/completion-exit/stdout.log")
   :BYTES 107 :SHA256
   "4f22544421d9012fe132a36bf15950cd327ca959b8f9c5ef3d386e0c8b62a25c")
  (:PATH "raw/F3-snapshot-fixtures/report.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003195-snapshot-self-test-25170-0/report.lisp")
   :BYTES 1979 :SHA256
   "1f4079a8261a234a66b7123e99cfd06c6f3a7e36536839e29de796ac90ab1a92")
  (:PATH "raw/F3-snapshot-fixtures/signal/isolated-build.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003195-snapshot-self-test-25170-0/signal/isolated-build.lisp")
   :BYTES 249 :SHA256
   "a345276e3dfe377c0bbd359793165915b1527938a65250d367ce5ac079feecc1")
  (:PATH "raw/F3-snapshot-fixtures/signal/stderr.log" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003195-snapshot-self-test-25170-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/F3-snapshot-fixtures/signal/stdout.log" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003195-snapshot-self-test-25170-0/signal/stdout.log")
   :BYTES 128 :SHA256
   "e3502e714a0530acb1f0130c4ced4a016607bcb067e3686f6f29704db8423ea5")
  (:PATH "raw/F3-spike-aggregate/SPK-01.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003403-check-31002-0/SPK-01.lisp")
   :BYTES 27228 :SHA256
   "61dcb42a302a47ebdc5e5170295f57436ca6b9069245e24528ff2e92d6634e2c")
  (:PATH "raw/F3-spike-aggregate/SPK-02.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003403-check-31002-0/SPK-02.lisp")
   :BYTES 1606 :SHA256
   "b59588458f7940a5fc5b7a5f0f09cb5762a04044b03c9d99c510663b75e03d5c")
  (:PATH "raw/F3-spike-aggregate/SPK-03.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003403-check-31002-0/SPK-03.lisp")
   :BYTES 3650 :SHA256
   "50d70734c8a3bcc30965e39d9f261d6e34fc7a6430d97284884b6a946e5cda7c")
  (:PATH "raw/F3-spike-aggregate/SPK-04.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003403-check-31002-0/SPK-04.lisp")
   :BYTES 6750 :SHA256
   "5491a98151820f925240f99aaf0a12bd4d1a456b44ff715f23de79104201f434")
  (:PATH "raw/F3-spike-aggregate/SPK-05.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003403-check-31002-0/SPK-05.lisp")
   :BYTES 10145 :SHA256
   "8bdc47d4096f98dcef14ed8545f4ae42bc5bf0e526249cb69845c62051a9b0b9")
  (:PATH "raw/F3-spike-aggregate/SPK-06.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003403-check-31002-0/SPK-06.lisp")
   :BYTES 24099 :SHA256
   "2cf0654cabf0602177ed7bc3a5c203b9ffad4a2675fd7884e3ae637f72a08a5b")
  (:PATH "raw/F3-spike-aggregate/SPK-07.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003403-check-31002-0/SPK-07.lisp")
   :BYTES 318 :SHA256
   "a0c1afe1261a32c097554469b6c875d88a802c7fa08fbf65fdbea85544738447")
  (:PATH "raw/F3-spike-aggregate/SPK-07.lisp.gz" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003403-check-31002-0/SPK-07.lisp.gz")
   :BYTES 410641 :SHA256
   "47132726dc62f8dd94e13f701331ce9ced738b9c4382bb030d556a74e4dd8153")
  (:PATH "raw/F3-spike-aggregate/SPK-08.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003403-check-31002-0/SPK-08.lisp")
   :BYTES 291712 :SHA256
   "e24f7a18356fa2ade7d0fd5c59ce3edb4b70e6eb7febd130b407e48a2cec062e")
  (:PATH "raw/F3-spike-aggregate/SPK-09.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003403-check-31002-0/SPK-09.lisp")
   :BYTES 2472 :SHA256
   "77d77e7d9425b38061ddda69d14d6a84eb57be213dc4beff4552d6e1f1290bab")
  (:PATH "raw/F3-spike-aggregate/SPK-10.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003403-check-31002-0/SPK-10.lisp")
   :BYTES 22977 :SHA256
   "246d98cf319893d2d93eeef0a6d2d8098beb7d3d89fa049e6d057b6d2760bbe9")
  (:PATH "raw/F3-spike-aggregate/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003403-check-31002-0/conservazione.lisp")
   :BYTES 2316 :SHA256
   "caa5e92db2313922b9f743a4476b4ad730c61268c4017717549ccae0cd139623")
  (:PATH "raw/F3-spike-aggregate/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003403-check-31002-0/report.lisp")
   :BYTES 318 :SHA256
   "196a091b9c1e0d7775610dd0bbd37d36dabdc7ca96e77e282180c3712e2e8c3e")
  (:PATH "raw/F3-spike-aggregate/report.lisp.gz" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001003403-check-31002-0/report.lisp.gz")
   :BYTES 466851 :SHA256
   "faa23c4863e11c4c55c1b9ca21573466680faf68afd066c4e22ced3eec382309")
  (:PATH "raw/SPK-01-whole-cache/check-lettura-buffer.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-01-primary-index/out/check-lettura-buffer.fasl")
   :BYTES 112349 :SHA256
   "3ba2935f8945b9c139aa730d54de43431074282127da7e68f6a134f912715116")
  (:PATH "raw/SPK-01-whole-cache/core.fasl" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-01-primary-index/out/core.fasl")
   :BYTES 158710 :SHA256
   "a19da67f24d0b1acd96f9bd3bdabd8f34f31a78558c49fff7d40d79533bed609")
  (:PATH "raw/SPK-01-whole-cache/lettura-buffer.fasl" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-01-primary-index/out/lettura-buffer.fasl")
   :BYTES 8165 :SHA256
   "0464e3ddc711e86491bbb950b78b62c39e55eeb9c3611e395b3a72bcc6621258")
  (:PATH "raw/SPK-02-whole-cache/core.fasl" :SOURCE
   #A((97) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-02-gc/out/core.fasl")
   :BYTES 110732 :SHA256
   "130752713248a4d0a30fa51170f049e1a81d0cf6e3c0034911709e0792385bd2")
  (:PATH "raw/SPK-03-whole-cache/core.fasl" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-03-group-commit/out/core.fasl")
   :BYTES 102602 :SHA256
   "fae0268ba7566e9ce1c175c32247a1d7174ae893de51dc83a4d63fd6ba826444")
  (:PATH "raw/SPK-04-whole-cache/31620/core.fasl" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-04-writer-pool/out/31620/core.fasl")
   :BYTES 7314 :SHA256
   "5ff2573e01689d70a16f0ff942a358fb435bce9474a2fe192564cc89b9274b07")
  (:PATH "raw/SPK-04-whole-cache/31620/parcheggi.fasl" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-04-writer-pool/out/31620/parcheggi.fasl")
   :BYTES 86732 :SHA256
   "956abbb4c6c696293a045bdddba83265061480b539fd40b74f3496814acfcf39")
  (:PATH "raw/SPK-04-whole-cache/31620/pool.fasl" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-04-writer-pool/out/31620/pool.fasl")
   :BYTES 96532 :SHA256
   "0d2b6df541af20a42fca6e282f9f3f6c4d6fdb96038458934a546a1b5f7035f2")
  (:PATH "raw/SPK-04-whole-cache/85519/core.fasl" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-04-writer-pool/out/85519/core.fasl")
   :BYTES 7314 :SHA256
   "5ff2573e01689d70a16f0ff942a358fb435bce9474a2fe192564cc89b9274b07")
  (:PATH "raw/SPK-04-whole-cache/85519/parcheggi.fasl" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-04-writer-pool/out/85519/parcheggi.fasl")
   :BYTES 86732 :SHA256
   "956abbb4c6c696293a045bdddba83265061480b539fd40b74f3496814acfcf39")
  (:PATH "raw/SPK-04-whole-cache/85519/pool.fasl" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-04-writer-pool/out/85519/pool.fasl")
   :BYTES 96532 :SHA256
   "0d2b6df541af20a42fca6e282f9f3f6c4d6fdb96038458934a546a1b5f7035f2")
  (:PATH "raw/SPK-04-whole-cache/98831/core.fasl" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-04-writer-pool/out/98831/core.fasl")
   :BYTES 7314 :SHA256
   "5ff2573e01689d70a16f0ff942a358fb435bce9474a2fe192564cc89b9274b07")
  (:PATH "raw/SPK-04-whole-cache/98831/parcheggi.fasl" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-04-writer-pool/out/98831/parcheggi.fasl")
   :BYTES 86732 :SHA256
   "956abbb4c6c696293a045bdddba83265061480b539fd40b74f3496814acfcf39")
  (:PATH "raw/SPK-04-whole-cache/98831/pool.fasl" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-04-writer-pool/out/98831/pool.fasl")
   :BYTES 96532 :SHA256
   "0d2b6df541af20a42fca6e282f9f3f6c4d6fdb96038458934a546a1b5f7035f2")
  (:PATH "raw/SPK-05-whole-cache/31801/core.fasl" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-05-segment-read/out/31801/core.fasl")
   :BYTES 67983 :SHA256
   "8080e51fa442c63be99eb49ad692626500f6c59fa320a764b51f9c68447500f8")
  (:PATH "raw/SPK-05-whole-cache/31801/io.fasl" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-05-segment-read/out/31801/io.fasl")
   :BYTES 62185 :SHA256
   "87b0d7128fdcd1d235eaa522443dd70010f7abdce673e2b4d5258a295e72bcba")
  (:PATH "raw/SPK-05-whole-cache/31801/record.fasl" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-05-segment-read/out/31801/record.fasl")
   :BYTES 24812 :SHA256
   "4dfcff3df064d576b2f63b14eb01321cffb9789e0d4025838769d2811774a798")
  (:PATH "raw/SPK-05-whole-cache/85542/core.fasl" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-05-segment-read/out/85542/core.fasl")
   :BYTES 67983 :SHA256
   "8080e51fa442c63be99eb49ad692626500f6c59fa320a764b51f9c68447500f8")
  (:PATH "raw/SPK-05-whole-cache/85542/io.fasl" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-05-segment-read/out/85542/io.fasl")
   :BYTES 62185 :SHA256
   "87b0d7128fdcd1d235eaa522443dd70010f7abdce673e2b4d5258a295e72bcba")
  (:PATH "raw/SPK-05-whole-cache/85542/record.fasl" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-05-segment-read/out/85542/record.fasl")
   :BYTES 24812 :SHA256
   "4dfcff3df064d576b2f63b14eb01321cffb9789e0d4025838769d2811774a798")
  (:PATH "raw/SPK-05-whole-cache/98857/core.fasl" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-05-segment-read/out/98857/core.fasl")
   :BYTES 67983 :SHA256
   "8080e51fa442c63be99eb49ad692626500f6c59fa320a764b51f9c68447500f8")
  (:PATH "raw/SPK-05-whole-cache/98857/io.fasl" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-05-segment-read/out/98857/io.fasl")
   :BYTES 62185 :SHA256
   "87b0d7128fdcd1d235eaa522443dd70010f7abdce673e2b4d5258a295e72bcba")
  (:PATH "raw/SPK-05-whole-cache/98857/record.fasl" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-05-segment-read/out/98857/record.fasl")
   :BYTES 24812 :SHA256
   "4dfcff3df064d576b2f63b14eb01321cffb9789e0d4025838769d2811774a798")
  (:PATH "raw/SPK-06-whole-cache/31853/controllore.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-06-compaction-load/out/31853/controllore.fasl")
   :BYTES 66797 :SHA256
   "fbc97dc9b8826e47b1da626e911b8b3e337b2f5a755c64a801cd6855a1d31565")
  (:PATH "raw/SPK-06-whole-cache/31853/core.fasl" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-06-compaction-load/out/31853/core.fasl")
   :BYTES 3289 :SHA256
   "9175e2cc54aedf652df3663eac24d44bfb20c7fe8d8d77878fd7e2f1cd176344")
  (:PATH "raw/SPK-06-whole-cache/31853/interferenza.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-06-compaction-load/out/31853/interferenza.fasl")
   :BYTES 102504 :SHA256
   "89997684dd51b4688b457d7d2fc659a7003871528c4ba6ba41f55876e84cf4f7")
  (:PATH "raw/SPK-06-whole-cache/31853/spk05-io.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-06-compaction-load/out/31853/spk05-io.fasl")
   :BYTES 62339 :SHA256
   "1c584ff52f2f8e03d32ae4c55885822fc3e8ac3500347f8cb92051b6a0dc6248")
  (:PATH "raw/SPK-06-whole-cache/31853/spk05-record.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-06-compaction-load/out/31853/spk05-record.fasl")
   :BYTES 24865 :SHA256
   "0d1660ab357739ec52cbd0d3ffe083fe26fcf02065240a024d0bd523b61b467a")
  (:PATH "raw/SPK-06-whole-cache/85567/controllore.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-06-compaction-load/out/85567/controllore.fasl")
   :BYTES 66797 :SHA256
   "fbc97dc9b8826e47b1da626e911b8b3e337b2f5a755c64a801cd6855a1d31565")
  (:PATH "raw/SPK-06-whole-cache/85567/core.fasl" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-06-compaction-load/out/85567/core.fasl")
   :BYTES 3289 :SHA256
   "9175e2cc54aedf652df3663eac24d44bfb20c7fe8d8d77878fd7e2f1cd176344")
  (:PATH "raw/SPK-06-whole-cache/85567/interferenza.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-06-compaction-load/out/85567/interferenza.fasl")
   :BYTES 102504 :SHA256
   "89997684dd51b4688b457d7d2fc659a7003871528c4ba6ba41f55876e84cf4f7")
  (:PATH "raw/SPK-06-whole-cache/85567/spk05-io.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-06-compaction-load/out/85567/spk05-io.fasl")
   :BYTES 62339 :SHA256
   "1c584ff52f2f8e03d32ae4c55885822fc3e8ac3500347f8cb92051b6a0dc6248")
  (:PATH "raw/SPK-06-whole-cache/85567/spk05-record.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-06-compaction-load/out/85567/spk05-record.fasl")
   :BYTES 24865 :SHA256
   "0d1660ab357739ec52cbd0d3ffe083fe26fcf02065240a024d0bd523b61b467a")
  (:PATH "raw/SPK-06-whole-cache/98877/controllore.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-06-compaction-load/out/98877/controllore.fasl")
   :BYTES 66797 :SHA256
   "fbc97dc9b8826e47b1da626e911b8b3e337b2f5a755c64a801cd6855a1d31565")
  (:PATH "raw/SPK-06-whole-cache/98877/core.fasl" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-06-compaction-load/out/98877/core.fasl")
   :BYTES 3289 :SHA256
   "9175e2cc54aedf652df3663eac24d44bfb20c7fe8d8d77878fd7e2f1cd176344")
  (:PATH "raw/SPK-06-whole-cache/98877/interferenza.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-06-compaction-load/out/98877/interferenza.fasl")
   :BYTES 102504 :SHA256
   "89997684dd51b4688b457d7d2fc659a7003871528c4ba6ba41f55876e84cf4f7")
  (:PATH "raw/SPK-06-whole-cache/98877/spk05-io.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-06-compaction-load/out/98877/spk05-io.fasl")
   :BYTES 62339 :SHA256
   "1c584ff52f2f8e03d32ae4c55885822fc3e8ac3500347f8cb92051b6a0dc6248")
  (:PATH "raw/SPK-06-whole-cache/98877/spk05-record.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-06-compaction-load/out/98877/spk05-record.fasl")
   :BYTES 24865 :SHA256
   "0d1660ab357739ec52cbd0d3ffe083fe26fcf02065240a024d0bd523b61b467a")
  (:PATH "raw/SPK-07-whole-cache/suite-4000997202-85610/byte-crash.fasl"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000997202-85610/byte-crash.fasl")
   :BYTES 114100 :SHA256
   "96647e8cbc0d37a1849c55409b74b0e2c63a66f2d5bce05b303d24ff6d94d128")
  (:PATH "raw/SPK-07-whole-cache/suite-4000997202-85610/compaction.fasl"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000997202-85610/compaction.fasl")
   :BYTES 86774 :SHA256
   "f92f6ba3cec3895becf14da975166a2e8bf909040276a2426c483cbc91fdfae9")
  (:PATH "raw/SPK-07-whole-cache/suite-4000997202-85610/core.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000997202-85610/core.fasl")
   :BYTES 64571 :SHA256
   "b81ffe7f431d929c7de2a1b60a14db6dbe10b9f0c923a6062e6e7efff9b302f2")
  (:PATH "raw/SPK-07-whole-cache/suite-4000997202-85610/foundation-batch.fasl"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000997202-85610/foundation-batch.fasl")
   :BYTES 9723 :SHA256
   "2ca71844199bb049b832595f2bf2d8dc69e0dd2111777b82fe4b6eebda3d52ac")
  (:PATH "raw/SPK-07-whole-cache/suite-4000997202-85610/foundation-binary.fasl"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000997202-85610/foundation-binary.fasl")
   :BYTES 9129 :SHA256
   "9468eed2deef143bb752d2abe655ad514f1e93af6ad38aea0ef14d5f3e9b93ba")
  (:PATH
   "raw/SPK-07-whole-cache/suite-4000997202-85610/foundation-conditions.fasl"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000997202-85610/foundation-conditions.fasl")
   :BYTES 6421 :SHA256
   "6950242983bc4bbcc3b06bc9d88c285d839f065c5cc798a2db4b264185a6bea6")
  (:PATH "raw/SPK-07-whole-cache/suite-4000997202-85610/foundation-crc32c.fasl"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000997202-85610/foundation-crc32c.fasl")
   :BYTES 4305 :SHA256
   "1bb71cf917799f1e5d9020e94810af00f603add30ced1433c2d432ef4fcf7e5c")
  (:PATH
   "raw/SPK-07-whole-cache/suite-4000997202-85610/foundation-package.fasl"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000997202-85610/foundation-package.fasl")
   :BYTES 2136 :SHA256
   "b52d42208742ff43e40d4ec4ead62c4cc14e28ac043dceb255cdc85e57b799d7")
  (:PATH "raw/SPK-07-whole-cache/suite-4000997202-85610/foundation-record.fasl"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000997202-85610/foundation-record.fasl")
   :BYTES 36506 :SHA256
   "7fa7ec298382140a99138f3976b1dff51652603e864963dd74090dc45b8be269")
  (:PATH "raw/SPK-07-whole-cache/suite-4000997202-85610/memoria.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000997202-85610/memoria.fasl")
   :BYTES 17411 :SHA256
   "1eee9f9ce0d5ae28d6380e96fd7b40a312bf846591143f7fdc32738450c405d2")
  (:PATH "raw/SPK-07-whole-cache/suite-4000997202-85610/pubblicazione.fasl"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000997202-85610/pubblicazione.fasl")
   :BYTES 86629 :SHA256
   "bb496e6c6621a97d66fcf1087edbaa5f80fe54a221aa3a4bb5bd89d1ebfe2a90")
  (:PATH "raw/SPK-07-whole-cache/suite-4000997202-85610/root-package.fasl"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000997202-85610/root-package.fasl")
   :BYTES 1460 :SHA256
   "c327ad8bd2586651a36b2b3600d25bf3c10a9fc59110cb5ab3d285e642dc92bc")
  (:PATH "raw/SPK-07-whole-cache/suite-4000997202-85610/scadenza.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000997202-85610/scadenza.fasl")
   :BYTES 85840 :SHA256
   "03ae1e70ab75d7fdb757f576747d4b3ee6b41076f2d4eb530b2d6a05c899023c")
  (:PATH "raw/SPK-07-whole-cache/suite-4000997202-85610/seqlock-readers.fasl"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000997202-85610/seqlock-readers.fasl")
   :BYTES 79341 :SHA256
   "2e84ed898745cc224652cced738ecbee70b39bb3f4ad69beddb90d583150be87")
  (:PATH "raw/SPK-07-whole-cache/suite-4000997202-85610/suite.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000997202-85610/suite.fasl")
   :BYTES 3868 :SHA256
   "086953e6343271f6bc931f07838fb1fe87d3f16ac5289df37dd28cd579878d0c")
  (:PATH "raw/SPK-07-whole-cache/suite-4001000407-98950/byte-crash.fasl"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001000407-98950/byte-crash.fasl")
   :BYTES 114100 :SHA256
   "96647e8cbc0d37a1849c55409b74b0e2c63a66f2d5bce05b303d24ff6d94d128")
  (:PATH "raw/SPK-07-whole-cache/suite-4001000407-98950/compaction.fasl"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001000407-98950/compaction.fasl")
   :BYTES 86774 :SHA256
   "f92f6ba3cec3895becf14da975166a2e8bf909040276a2426c483cbc91fdfae9")
  (:PATH "raw/SPK-07-whole-cache/suite-4001000407-98950/core.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001000407-98950/core.fasl")
   :BYTES 64571 :SHA256
   "b81ffe7f431d929c7de2a1b60a14db6dbe10b9f0c923a6062e6e7efff9b302f2")
  (:PATH "raw/SPK-07-whole-cache/suite-4001000407-98950/foundation-batch.fasl"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001000407-98950/foundation-batch.fasl")
   :BYTES 9723 :SHA256
   "2ca71844199bb049b832595f2bf2d8dc69e0dd2111777b82fe4b6eebda3d52ac")
  (:PATH "raw/SPK-07-whole-cache/suite-4001000407-98950/foundation-binary.fasl"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001000407-98950/foundation-binary.fasl")
   :BYTES 9129 :SHA256
   "9468eed2deef143bb752d2abe655ad514f1e93af6ad38aea0ef14d5f3e9b93ba")
  (:PATH
   "raw/SPK-07-whole-cache/suite-4001000407-98950/foundation-conditions.fasl"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001000407-98950/foundation-conditions.fasl")
   :BYTES 6421 :SHA256
   "6950242983bc4bbcc3b06bc9d88c285d839f065c5cc798a2db4b264185a6bea6")
  (:PATH "raw/SPK-07-whole-cache/suite-4001000407-98950/foundation-crc32c.fasl"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001000407-98950/foundation-crc32c.fasl")
   :BYTES 4305 :SHA256
   "1bb71cf917799f1e5d9020e94810af00f603add30ced1433c2d432ef4fcf7e5c")
  (:PATH
   "raw/SPK-07-whole-cache/suite-4001000407-98950/foundation-package.fasl"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001000407-98950/foundation-package.fasl")
   :BYTES 2136 :SHA256
   "b52d42208742ff43e40d4ec4ead62c4cc14e28ac043dceb255cdc85e57b799d7")
  (:PATH "raw/SPK-07-whole-cache/suite-4001000407-98950/foundation-record.fasl"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001000407-98950/foundation-record.fasl")
   :BYTES 36506 :SHA256
   "7fa7ec298382140a99138f3976b1dff51652603e864963dd74090dc45b8be269")
  (:PATH "raw/SPK-07-whole-cache/suite-4001000407-98950/memoria.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001000407-98950/memoria.fasl")
   :BYTES 17411 :SHA256
   "1eee9f9ce0d5ae28d6380e96fd7b40a312bf846591143f7fdc32738450c405d2")
  (:PATH "raw/SPK-07-whole-cache/suite-4001000407-98950/pubblicazione.fasl"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001000407-98950/pubblicazione.fasl")
   :BYTES 86629 :SHA256
   "bb496e6c6621a97d66fcf1087edbaa5f80fe54a221aa3a4bb5bd89d1ebfe2a90")
  (:PATH "raw/SPK-07-whole-cache/suite-4001000407-98950/root-package.fasl"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001000407-98950/root-package.fasl")
   :BYTES 1460 :SHA256
   "c327ad8bd2586651a36b2b3600d25bf3c10a9fc59110cb5ab3d285e642dc92bc")
  (:PATH "raw/SPK-07-whole-cache/suite-4001000407-98950/scadenza.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001000407-98950/scadenza.fasl")
   :BYTES 85840 :SHA256
   "03ae1e70ab75d7fdb757f576747d4b3ee6b41076f2d4eb530b2d6a05c899023c")
  (:PATH "raw/SPK-07-whole-cache/suite-4001000407-98950/seqlock-readers.fasl"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001000407-98950/seqlock-readers.fasl")
   :BYTES 79341 :SHA256
   "2e84ed898745cc224652cced738ecbee70b39bb3f4ad69beddb90d583150be87")
  (:PATH "raw/SPK-07-whole-cache/suite-4001000407-98950/suite.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001000407-98950/suite.fasl")
   :BYTES 3868 :SHA256
   "086953e6343271f6bc931f07838fb1fe87d3f16ac5289df37dd28cd579878d0c")
  (:PATH "raw/SPK-07-whole-cache/suite-4001003415-31893/byte-crash.fasl"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001003415-31893/byte-crash.fasl")
   :BYTES 114100 :SHA256
   "96647e8cbc0d37a1849c55409b74b0e2c63a66f2d5bce05b303d24ff6d94d128")
  (:PATH "raw/SPK-07-whole-cache/suite-4001003415-31893/compaction.fasl"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001003415-31893/compaction.fasl")
   :BYTES 86774 :SHA256
   "f92f6ba3cec3895becf14da975166a2e8bf909040276a2426c483cbc91fdfae9")
  (:PATH "raw/SPK-07-whole-cache/suite-4001003415-31893/core.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001003415-31893/core.fasl")
   :BYTES 64571 :SHA256
   "b81ffe7f431d929c7de2a1b60a14db6dbe10b9f0c923a6062e6e7efff9b302f2")
  (:PATH "raw/SPK-07-whole-cache/suite-4001003415-31893/foundation-batch.fasl"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001003415-31893/foundation-batch.fasl")
   :BYTES 9723 :SHA256
   "2ca71844199bb049b832595f2bf2d8dc69e0dd2111777b82fe4b6eebda3d52ac")
  (:PATH "raw/SPK-07-whole-cache/suite-4001003415-31893/foundation-binary.fasl"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001003415-31893/foundation-binary.fasl")
   :BYTES 9129 :SHA256
   "9468eed2deef143bb752d2abe655ad514f1e93af6ad38aea0ef14d5f3e9b93ba")
  (:PATH
   "raw/SPK-07-whole-cache/suite-4001003415-31893/foundation-conditions.fasl"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001003415-31893/foundation-conditions.fasl")
   :BYTES 6421 :SHA256
   "6950242983bc4bbcc3b06bc9d88c285d839f065c5cc798a2db4b264185a6bea6")
  (:PATH "raw/SPK-07-whole-cache/suite-4001003415-31893/foundation-crc32c.fasl"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001003415-31893/foundation-crc32c.fasl")
   :BYTES 4305 :SHA256
   "1bb71cf917799f1e5d9020e94810af00f603add30ced1433c2d432ef4fcf7e5c")
  (:PATH
   "raw/SPK-07-whole-cache/suite-4001003415-31893/foundation-package.fasl"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001003415-31893/foundation-package.fasl")
   :BYTES 2136 :SHA256
   "b52d42208742ff43e40d4ec4ead62c4cc14e28ac043dceb255cdc85e57b799d7")
  (:PATH "raw/SPK-07-whole-cache/suite-4001003415-31893/foundation-record.fasl"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001003415-31893/foundation-record.fasl")
   :BYTES 36506 :SHA256
   "7fa7ec298382140a99138f3976b1dff51652603e864963dd74090dc45b8be269")
  (:PATH "raw/SPK-07-whole-cache/suite-4001003415-31893/memoria.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001003415-31893/memoria.fasl")
   :BYTES 17411 :SHA256
   "1eee9f9ce0d5ae28d6380e96fd7b40a312bf846591143f7fdc32738450c405d2")
  (:PATH "raw/SPK-07-whole-cache/suite-4001003415-31893/pubblicazione.fasl"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001003415-31893/pubblicazione.fasl")
   :BYTES 86629 :SHA256
   "bb496e6c6621a97d66fcf1087edbaa5f80fe54a221aa3a4bb5bd89d1ebfe2a90")
  (:PATH "raw/SPK-07-whole-cache/suite-4001003415-31893/root-package.fasl"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001003415-31893/root-package.fasl")
   :BYTES 1460 :SHA256
   "c327ad8bd2586651a36b2b3600d25bf3c10a9fc59110cb5ab3d285e642dc92bc")
  (:PATH "raw/SPK-07-whole-cache/suite-4001003415-31893/scadenza.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001003415-31893/scadenza.fasl")
   :BYTES 85840 :SHA256
   "03ae1e70ab75d7fdb757f576747d4b3ee6b41076f2d4eb530b2d6a05c899023c")
  (:PATH "raw/SPK-07-whole-cache/suite-4001003415-31893/seqlock-readers.fasl"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001003415-31893/seqlock-readers.fasl")
   :BYTES 79341 :SHA256
   "2e84ed898745cc224652cced738ecbee70b39bb3f4ad69beddb90d583150be87")
  (:PATH "raw/SPK-07-whole-cache/suite-4001003415-31893/suite.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001003415-31893/suite.fasl")
   :BYTES 3868 :SHA256
   "086953e6343271f6bc931f07838fb1fe87d3f16ac5289df37dd28cd579878d0c")
  (:PATH "raw/SPK-08-whole-cache/process-4000997213-85833/bitmap.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-08-generated-code/out/process-4000997213-85833/bitmap.fasl")
   :BYTES 23564 :SHA256
   "04ab70fd80625a7f6563dfb9b9ff1dd26ed5055631d85363c6d03462b9f4d488")
  (:PATH "raw/SPK-08-whole-cache/process-4000997213-85833/core-bitmap.fasl"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-08-generated-code/out/process-4000997213-85833/core-bitmap.fasl")
   :BYTES 13284 :SHA256
   "88a7250262cd4b7fc222607c406a9417a98cb781e41f211118b8a31d3ce09ede")
  (:PATH "raw/SPK-08-whole-cache/process-4000997213-85833/impronte.fasl"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-08-generated-code/out/process-4000997213-85833/impronte.fasl")
   :BYTES 68379 :SHA256
   "ac5b52db85661670909881c32bcc317f1aed4baf4d5bdafdbc40da662630d49a")
  (:PATH "raw/SPK-08-whole-cache/process-4000997213-85833/simd.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-08-generated-code/out/process-4000997213-85833/simd.fasl")
   :BYTES 20608 :SHA256
   "5736f0491467c0b2c653669bab9d2a1ab30f00b3ccba1cf7637c79fa943cdbfb")
  (:PATH "raw/SPK-08-whole-cache/process-4001000418-99096/bitmap.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-08-generated-code/out/process-4001000418-99096/bitmap.fasl")
   :BYTES 23564 :SHA256
   "04ab70fd80625a7f6563dfb9b9ff1dd26ed5055631d85363c6d03462b9f4d488")
  (:PATH "raw/SPK-08-whole-cache/process-4001000418-99096/core-bitmap.fasl"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-08-generated-code/out/process-4001000418-99096/core-bitmap.fasl")
   :BYTES 13284 :SHA256
   "88a7250262cd4b7fc222607c406a9417a98cb781e41f211118b8a31d3ce09ede")
  (:PATH "raw/SPK-08-whole-cache/process-4001000418-99096/impronte.fasl"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-08-generated-code/out/process-4001000418-99096/impronte.fasl")
   :BYTES 68379 :SHA256
   "ac5b52db85661670909881c32bcc317f1aed4baf4d5bdafdbc40da662630d49a")
  (:PATH "raw/SPK-08-whole-cache/process-4001000418-99096/simd.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-08-generated-code/out/process-4001000418-99096/simd.fasl")
   :BYTES 20608 :SHA256
   "5736f0491467c0b2c653669bab9d2a1ab30f00b3ccba1cf7637c79fa943cdbfb")
  (:PATH "raw/SPK-08-whole-cache/process-4001003426-32086/bitmap.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-08-generated-code/out/process-4001003426-32086/bitmap.fasl")
   :BYTES 23564 :SHA256
   "04ab70fd80625a7f6563dfb9b9ff1dd26ed5055631d85363c6d03462b9f4d488")
  (:PATH "raw/SPK-08-whole-cache/process-4001003426-32086/core-bitmap.fasl"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-08-generated-code/out/process-4001003426-32086/core-bitmap.fasl")
   :BYTES 13284 :SHA256
   "88a7250262cd4b7fc222607c406a9417a98cb781e41f211118b8a31d3ce09ede")
  (:PATH "raw/SPK-08-whole-cache/process-4001003426-32086/impronte.fasl"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-08-generated-code/out/process-4001003426-32086/impronte.fasl")
   :BYTES 68379 :SHA256
   "ac5b52db85661670909881c32bcc317f1aed4baf4d5bdafdbc40da662630d49a")
  (:PATH "raw/SPK-08-whole-cache/process-4001003426-32086/simd.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-08-generated-code/out/process-4001003426-32086/simd.fasl")
   :BYTES 20608 :SHA256
   "5736f0491467c0b2c653669bab9d2a1ab30f00b3ccba1cf7637c79fa943cdbfb")
  (:PATH "raw/SPK-09-whole-cache/core.fasl" :SOURCE
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-09-integrity/out/core.fasl")
   :BYTES 115015 :SHA256
   "649986a8933279f4277eae8e3769aa03146efcd3602e8039c9078190bdd5c04f")
  (:PATH "raw/SPK-10-whole-cache/cbor.fasl" :SOURCE
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-10-v2-limits/out/cbor.fasl")
   :BYTES 83947 :SHA256
   "6c7c312a57dcbd373d219733c63194c7254c9a7d493ab6c58e6c20c822c7c92e")
  (:PATH "raw/SPK-10-whole-cache/codec.fasl" :SOURCE
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-10-v2-limits/out/codec.fasl")
   :BYTES 81666 :SHA256
   "5f5228b7d29da7896e807431aa1883114d4ddc5b3bc884fbc842a1ebdf06fc03")
  (:PATH "raw/SPK-10-whole-cache/core.fasl" :SOURCE
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-10-v2-limits/out/core.fasl")
   :BYTES 15824 :SHA256
   "1e1a39056dff8e7535e98b5622f996551270f0e7af5f82c76c15550a334ad2a9")
  (:PATH "raw/SPK-10-whole-cache/crc.fasl" :SOURCE
   #A((103) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-10-v2-limits/out/crc.fasl")
   :BYTES 115055 :SHA256
   "74fc845672afbb7ef54ee06a10ef40af8fa2f6f3d467c3844dd9400a3be600e2")
  (:PATH "raw/SPK-10-whole-cache/indice.fasl" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-10-v2-limits/out/indice.fasl")
   :BYTES 154885 :SHA256
   "351dacf07ca4e85696d1252943d279748c8660acecc5a732efa5981ef9b40834")
  (:PATH "raw/SPK-10-whole-cache/migrazione.fasl" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-10-v2-limits/out/migrazione.fasl")
   :BYTES 81699 :SHA256
   "e1bb3a21e8663996ccca7bd4d1d905d5e3a8c6d1ac8faa8512ea6bee044a7343")
  (:PATH "raw/historical-PR13-CI-audit/conservazione.lisp" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001001998-command-16221-0/conservazione.lisp")
   :BYTES 1162 :SHA256
   "250a97940f08c2a1b77bab7819885de415b894fe779fe5209ff7c9f803d0c0af")
  (:PATH "raw/historical-PR13-CI-audit/report.lisp" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001001998-command-16221-0/report.lisp")
   :BYTES 268829 :SHA256
   "bec34b582370fd42270232db1c02962c697cf16c6e884a6851a090a3d45b75d8")
  (:PATH "raw/historical-PR13-CI-pass/after/artifacts.json" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/after/artifacts.json")
   :BYTES 2169 :SHA256
   "e51e9ed83fb9e260b42a4b0fa402097d4a9ab050f3b6fddf9c1bab5c92510d1b")
  (:PATH "raw/historical-PR13-CI-pass/after/artifacts.stderr.log" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/after/artifacts.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-PR13-CI-pass/after/commit.json" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/after/commit.json")
   :BYTES 2693 :SHA256
   "667c762ab0752d16b6d770ddc8a099e3c3bcf7e1ac74f4f497272b2a7034898f")
  (:PATH "raw/historical-PR13-CI-pass/after/commit.stderr.log" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/after/commit.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-PR13-CI-pass/after/jobs.json" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/after/jobs.json")
   :BYTES 6307 :SHA256
   "c8a238d1050f6f55e2b9a4769220f45b17aefc2f4478cedd558515ac5ea29d4b")
  (:PATH "raw/historical-PR13-CI-pass/after/jobs.stderr.log" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/after/jobs.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-PR13-CI-pass/after/pr.json" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/after/pr.json")
   :BYTES 19586 :SHA256
   "371b779d2a9abf252e29e4c83aa8bf823db664a4249bc8faf698a45712c944f1")
  (:PATH "raw/historical-PR13-CI-pass/after/pr.stderr.log" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/after/pr.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-PR13-CI-pass/after/repo.json" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/after/repo.json")
   :BYTES 6347 :SHA256
   "2dd0f7559e3518c1a26105fe3dc1d4c86c4eb34a551edb95b017634c30e398c3")
  (:PATH "raw/historical-PR13-CI-pass/after/repo.stderr.log" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/after/repo.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-PR13-CI-pass/after/run.json" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/after/run.json")
   :BYTES 13182 :SHA256
   "46478571bb1197ddb0faaba3c4182e6346f9e3592778002d68db4d09ffb76a21")
  (:PATH "raw/historical-PR13-CI-pass/after/run.stderr.log" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/after/run.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-PR13-CI-pass/after/workflow.json" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/after/workflow.json")
   :BYTES 457 :SHA256
   "92058be93052122365a94ebb3804645b95108599a5f21c88825a1b54ef187e43")
  (:PATH "raw/historical-PR13-CI-pass/after/workflow.stderr.log" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/after/workflow.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-PR13-CI-pass/audit/count-native.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/audit/count-native.lisp")
   :BYTES 119795 :SHA256
   "44346204b5638cd9fea79af672a5d04c2cdc7325ab5f81a176c866430b9573cc")
  (:PATH "raw/historical-PR13-CI-pass/audit/count-native.stderr.log" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/audit/count-native.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-PR13-CI-pass/audit/fetch-native.stderr.log" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/audit/fetch-native.stderr.log")
   :BYTES 125 :SHA256
   "8500cd2372adfdada3335a6c859e7ca70bb084797303db3cb8fd07ee428a8e48")
  (:PATH "raw/historical-PR13-CI-pass/audit/fetch-native.stdout.log" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/audit/fetch-native.stdout.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/historical-PR13-CI-pass/audit/lifetime-cbor-diagnostics.stderr.log"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/audit/lifetime-cbor-diagnostics.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-PR13-CI-pass/audit/lifetime-cbor-diagnostics.txt"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/audit/lifetime-cbor-diagnostics.txt")
   :BYTES 3363 :SHA256
   "3f97304055c14dc7fe212ea505c600ddf46cfbbc144d22f4118ff52c2758443d")
  (:PATH "raw/historical-PR13-CI-pass/audit/native-all-R1-summary.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/audit/native-all-R1-summary.lisp")
   :BYTES 5587 :SHA256
   "1671fd97280c03f77ca4a32117f1e04ac5e20202b068a566cfd43aaa273cddd1")
  (:PATH "raw/historical-PR13-CI-pass/audit/native-all-R1-summary.stderr.log"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/audit/native-all-R1-summary.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-PR13-CI-pass/audit/native-all-R1.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/audit/native-all-R1.lisp")
   :BYTES 74194 :SHA256
   "a7a2dd204b4fd5059519043544633ead59e06b5b1695b07849842111f6b514b9")
  (:PATH "raw/historical-PR13-CI-pass/audit/native-all-R1.stderr.log" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/audit/native-all-R1.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-PR13-CI-pass/audit/native-all-R1.stdout.log" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/audit/native-all-R1.stdout.log")
   :BYTES 1093 :SHA256
   "c4c9e62f6a4680e072f2a66d79583286b4d99ff14e6efd593aeec2f2f8c0b2f8")
  (:PATH "raw/historical-PR13-CI-pass/audit/native-commit.txt" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/audit/native-commit.txt")
   :BYTES 1202 :SHA256
   "f7f26a1a2299e898e967a8bb22be048beed7c5bc75f136bd48caa7dddc329c4c")
  (:PATH "raw/historical-PR13-CI-pass/audit/native-full-tree.dat.gz" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/audit/native-full-tree.dat")
   :BYTES 1109669 :SHA256
   "03bf47363b49d54d0320073ffb70b19c95a049e473f04646cf49294c6113650f" :CODEC
   :GZIP :UNCOMPRESSED-BYTES 6433113 :UNCOMPRESSED-SHA256
   "89b8bd48bad54368f857779c94c9f350ef44956b3b5018a439b3b2b68e19ba05")
  (:PATH "raw/historical-PR13-CI-pass/audit/native-identities.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/audit/native-identities.lisp")
   :BYTES 912 :SHA256
   "b57110fd50a933cfc6d51694cfb440e9dd950083479bf6de1ce28c622301d516")
  (:PATH "raw/historical-PR13-CI-pass/audit/native-identities.stderr.log"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/audit/native-identities.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-PR13-CI-pass/audit/zip-bytes-after.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/audit/zip-bytes-after.lisp")
   :BYTES 915 :SHA256
   "76050c0adc384d468a827779ef409eb9290ebea14d6be2feb1ed29ecd5e4f5ef")
  (:PATH "raw/historical-PR13-CI-pass/audit/zip-bytes-after.stderr.log" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/audit/zip-bytes-after.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-PR13-CI-pass/audit/zip-bytes-before.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/audit/zip-bytes-before.lisp")
   :BYTES 915 :SHA256
   "76050c0adc384d468a827779ef409eb9290ebea14d6be2feb1ed29ecd5e4f5ef")
  (:PATH "raw/historical-PR13-CI-pass/audit/zip-bytes-before.stderr.log"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/audit/zip-bytes-before.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-PR13-CI-pass/before/artifacts.json" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/before/artifacts.json")
   :BYTES 2169 :SHA256
   "e51e9ed83fb9e260b42a4b0fa402097d4a9ab050f3b6fddf9c1bab5c92510d1b")
  (:PATH "raw/historical-PR13-CI-pass/before/artifacts.stderr.log" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/before/artifacts.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-PR13-CI-pass/before/commit-with-files-R1.json" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/before/commit-with-files-R1.json")
   :BYTES 695635 :SHA256
   "df1932ecdbab273a8119fedaf2fc0128c3e461224a7d8645cda3e7448d90551f")
  (:PATH "raw/historical-PR13-CI-pass/before/commit-with-files-R1.stderr.log"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/before/commit-with-files-R1.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-PR13-CI-pass/before/commit.json" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/before/commit.json")
   :BYTES 2693 :SHA256
   "667c762ab0752d16b6d770ddc8a099e3c3bcf7e1ac74f4f497272b2a7034898f")
  (:PATH "raw/historical-PR13-CI-pass/before/commit.stderr.log" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/before/commit.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-PR13-CI-pass/before/jobs.json" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/before/jobs.json")
   :BYTES 6307 :SHA256
   "c8a238d1050f6f55e2b9a4769220f45b17aefc2f4478cedd558515ac5ea29d4b")
  (:PATH "raw/historical-PR13-CI-pass/before/jobs.stderr.log" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/before/jobs.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-PR13-CI-pass/before/pr.json" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/before/pr.json")
   :BYTES 19586 :SHA256
   "371b779d2a9abf252e29e4c83aa8bf823db664a4249bc8faf698a45712c944f1")
  (:PATH "raw/historical-PR13-CI-pass/before/pr.stderr.log" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/before/pr.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-PR13-CI-pass/before/repo.json" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/before/repo.json")
   :BYTES 6347 :SHA256
   "2dd0f7559e3518c1a26105fe3dc1d4c86c4eb34a551edb95b017634c30e398c3")
  (:PATH "raw/historical-PR13-CI-pass/before/repo.stderr.log" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/before/repo.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-PR13-CI-pass/before/run.json" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/before/run.json")
   :BYTES 13182 :SHA256
   "46478571bb1197ddb0faaba3c4182e6346f9e3592778002d68db4d09ffb76a21")
  (:PATH "raw/historical-PR13-CI-pass/before/run.stderr.log" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/before/run.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-PR13-CI-pass/before/workflow.json" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/before/workflow.json")
   :BYTES 457 :SHA256
   "92058be93052122365a94ebb3804645b95108599a5f21c88825a1b54ef187e43")
  (:PATH "raw/historical-PR13-CI-pass/before/workflow.stderr.log" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/before/workflow.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/historical-PR13-CI-pass/listings/prove-documentazione-central.stderr.log"
   :SOURCE
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/listings/prove-documentazione-central.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/historical-PR13-CI-pass/listings/prove-documentazione-central.txt"
   :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/listings/prove-documentazione-central.txt")
   :BYTES 483 :SHA256
   "257fc9fc82f544c02ee634cb3381b3dffc87111ffcdf2a2c25926ecd18941f4f")
  (:PATH
   "raw/historical-PR13-CI-pass/listings/prove-documentazione-gh-download.stderr.log"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/listings/prove-documentazione-gh-download.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/historical-PR13-CI-pass/listings/prove-documentazione-gh-download.stdout.log"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/listings/prove-documentazione-gh-download.stdout.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/historical-PR13-CI-pass/listings/prove-documentazione-paths.stderr.log"
   :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/listings/prove-documentazione-paths.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-PR13-CI-pass/listings/prove-documentazione-paths.txt"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/listings/prove-documentazione-paths.txt")
   :BYTES 83 :SHA256
   "774484872c158a88335787f9b0e3d8181123b1209505547674bbeba39611846b")
  (:PATH
   "raw/historical-PR13-CI-pass/listings/prove-documentazione-zip-test.stderr.log"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/listings/prove-documentazione-zip-test.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/historical-PR13-CI-pass/listings/prove-documentazione-zip-test.stdout.log"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/listings/prove-documentazione-zip-test.stdout.log")
   :BYTES 471 :SHA256
   "86cb88b96b17fdd540f825fd6169dd8b7b4bb074c06b81afcd4ff3324abebcf1")
  (:PATH
   "raw/historical-PR13-CI-pass/listings/prove-macos-latest-central.stderr.log"
   :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/listings/prove-macos-latest-central.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-PR13-CI-pass/listings/prove-macos-latest-central.txt"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/listings/prove-macos-latest-central.txt")
   :BYTES 3690 :SHA256
   "23770434dffa389e620ce34c7e68606f0330bc18d6b432953f771bfeacef4625")
  (:PATH
   "raw/historical-PR13-CI-pass/listings/prove-macos-latest-gh-download.stderr.log"
   :SOURCE
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/listings/prove-macos-latest-gh-download.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/historical-PR13-CI-pass/listings/prove-macos-latest-gh-download.stdout.log"
   :SOURCE
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/listings/prove-macos-latest-gh-download.stdout.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/historical-PR13-CI-pass/listings/prove-macos-latest-paths.stderr.log"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/listings/prove-macos-latest-paths.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-PR13-CI-pass/listings/prove-macos-latest-paths.txt"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/listings/prove-macos-latest-paths.txt")
   :BYTES 1489 :SHA256
   "7c813b381e12c7c25754170e934f19e8a33c7b1c3cb6fcad48868e1bb16eebb0")
  (:PATH
   "raw/historical-PR13-CI-pass/listings/prove-macos-latest-zip-test.stderr.log"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/listings/prove-macos-latest-zip-test.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/historical-PR13-CI-pass/listings/prove-macos-latest-zip-test.stdout.log"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/listings/prove-macos-latest-zip-test.stdout.log")
   :BYTES 2395 :SHA256
   "c29e15a46041969b8efd1a5b2491e70634ff65575fc7e687f2f3ac034c305edb")
  (:PATH
   "raw/historical-PR13-CI-pass/listings/prove-ubuntu-latest-central.stderr.log"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/listings/prove-ubuntu-latest-central.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-PR13-CI-pass/listings/prove-ubuntu-latest-central.txt"
   :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/listings/prove-ubuntu-latest-central.txt")
   :BYTES 3677 :SHA256
   "bd5987ab8214ea6effd8a8b5fdc92d00bb206ce43a7d7e47e6a3c42802facd47")
  (:PATH
   "raw/historical-PR13-CI-pass/listings/prove-ubuntu-latest-gh-download.stderr.log"
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/listings/prove-ubuntu-latest-gh-download.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/historical-PR13-CI-pass/listings/prove-ubuntu-latest-gh-download.stdout.log"
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/listings/prove-ubuntu-latest-gh-download.stdout.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/historical-PR13-CI-pass/listings/prove-ubuntu-latest-paths.stderr.log"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/listings/prove-ubuntu-latest-paths.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-PR13-CI-pass/listings/prove-ubuntu-latest-paths.txt"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/listings/prove-ubuntu-latest-paths.txt")
   :BYTES 1475 :SHA256
   "59fc3e8c869b959708b5ed87cd4a678596a0da9e5e4cb0089cb00a0b866d5f07")
  (:PATH
   "raw/historical-PR13-CI-pass/listings/prove-ubuntu-latest-zip-test.stderr.log"
   :SOURCE
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/listings/prove-ubuntu-latest-zip-test.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/historical-PR13-CI-pass/listings/prove-ubuntu-latest-zip-test.stdout.log"
   :SOURCE
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/listings/prove-ubuntu-latest-zip-test.stdout.log")
   :BYTES 2383 :SHA256
   "d60c45e7b5384ffeed79ca1a870c3357b4368978de105969c900e3f482157227")
  (:PATH "raw/historical-PR13-CI-pass/qualification-note.txt" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/qualification-note.txt")
   :BYTES 3865 :SHA256
   "155c8b2ea0dc22bd0ca3d54c409cf7c9b37e125853703a5bfe42cb782dcf9b62")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-documentazione/4001001243-command-2337-0/conservazione.lisp"
   :SOURCE
   #A((189) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-documentazione/4001001243-command-2337-0/conservazione.lisp")
   :BYTES 1061 :SHA256
   "63eb2a68c73a48ab5a957785fb63b8df1229d034a110e6fda80292f3b1c5dc5e")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-documentazione/4001001243-command-2337-0/report.lisp"
   :SOURCE
   #A((182) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-documentazione/4001001243-command-2337-0/report.lisp")
   :BYTES 191256 :SHA256
   "0d5495289c639820fb3a51006d4193b5581d228a980df078d1b2cc442080ec72")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-macos-latest/4001001363-command-5123-0/conservazione.lisp"
   :SOURCE
   #A((187) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-macos-latest/4001001363-command-5123-0/conservazione.lisp")
   :BYTES 1620 :SHA256
   "98e55939dff4052f5bf5f89a8df5e7f3678f09c54547f8182f62323195a24d33")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-macos-latest/4001001363-command-5123-0/report.lisp"
   :SOURCE
   #A((180) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-macos-latest/4001001363-command-5123-0/report.lisp")
   :BYTES 317 :SHA256
   "7970672404fa2d6c8642404bfbbb26f091cc531fda1f9f1d47d9f022ed017ccd")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-macos-latest/4001001363-command-5123-0/report.lisp.gz"
   :SOURCE
   #A((183) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-macos-latest/4001001363-command-5123-0/report.lisp.gz")
   :BYTES 169248 :SHA256
   "8022d106e3e197c685de943f91e9a0e67fbcf63aaa7e15a1df8df4c6697c5fa6")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-macos-latest/4001001405-reader-self-test-6470-0/completion-exit/isolated-build.lisp"
   :SOURCE
   #A((213) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-macos-latest/4001001405-reader-self-test-6470-0/completion-exit/isolated-build.lisp")
   :BYTES 197 :SHA256
   "1a45dcf8a6d03f1e8866e49280c6f0edb894320c90624d5620fad1e3d546cea9")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-macos-latest/4001001405-reader-self-test-6470-0/completion-exit/stderr.log"
   :SOURCE
   #A((204) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-macos-latest/4001001405-reader-self-test-6470-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-macos-latest/4001001405-reader-self-test-6470-0/completion-exit/stdout.log"
   :SOURCE
   #A((204) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-macos-latest/4001001405-reader-self-test-6470-0/completion-exit/stdout.log")
   :BYTES 105 :SHA256
   "5e630c1b44d68ce71b27d151e76bf367e3cbd941200adc36cdd30e0fe7390531")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-macos-latest/4001001405-reader-self-test-6470-0/report.lisp"
   :SOURCE
   #A((189) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-macos-latest/4001001405-reader-self-test-6470-0/report.lisp")
   :BYTES 1775 :SHA256
   "38ce87179776ce7d98d8ea962712a30427f78814e77179d66b0dff7ec0859d60")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-macos-latest/4001001405-reader-self-test-6470-0/signal/isolated-build.lisp"
   :SOURCE
   #A((204) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-macos-latest/4001001405-reader-self-test-6470-0/signal/isolated-build.lisp")
   :BYTES 247 :SHA256
   "ff5cf55dda241d32ea1b4308172c7dc526436cbf1d546e7471148cee95a873d1")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-macos-latest/4001001405-reader-self-test-6470-0/signal/stderr.log"
   :SOURCE
   #A((195) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-macos-latest/4001001405-reader-self-test-6470-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-macos-latest/4001001405-reader-self-test-6470-0/signal/stdout.log"
   :SOURCE
   #A((195) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-macos-latest/4001001405-reader-self-test-6470-0/signal/stdout.log")
   :BYTES 126 :SHA256
   "3697c68fa71f124c8d05d8cc5d649a744586a10989eb2e67c5bdce6bfc760142")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-macos-latest/4001001405-snapshot-self-test-6463-0/completion-exit/isolated-build.lisp"
   :SOURCE
   #A((215) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-macos-latest/4001001405-snapshot-self-test-6463-0/completion-exit/isolated-build.lisp")
   :BYTES 199 :SHA256
   "b8bb4416a818775bae5c77341eeec2c356a2733f633ac2bc8b6ac3ff955d05e0")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-macos-latest/4001001405-snapshot-self-test-6463-0/completion-exit/stderr.log"
   :SOURCE
   #A((206) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-macos-latest/4001001405-snapshot-self-test-6463-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-macos-latest/4001001405-snapshot-self-test-6463-0/completion-exit/stdout.log"
   :SOURCE
   #A((206) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-macos-latest/4001001405-snapshot-self-test-6463-0/completion-exit/stdout.log")
   :BYTES 107 :SHA256
   "4f22544421d9012fe132a36bf15950cd327ca959b8f9c5ef3d386e0c8b62a25c")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-macos-latest/4001001405-snapshot-self-test-6463-0/report.lisp"
   :SOURCE
   #A((191) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-macos-latest/4001001405-snapshot-self-test-6463-0/report.lisp")
   :BYTES 1793 :SHA256
   "4532195e15e3692cef838278ac5c7db859805a8e547775efea8c83cdbad3a56e")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-macos-latest/4001001405-snapshot-self-test-6463-0/signal/isolated-build.lisp"
   :SOURCE
   #A((206) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-macos-latest/4001001405-snapshot-self-test-6463-0/signal/isolated-build.lisp")
   :BYTES 249 :SHA256
   "a345276e3dfe377c0bbd359793165915b1527938a65250d367ce5ac079feecc1")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-macos-latest/4001001405-snapshot-self-test-6463-0/signal/stderr.log"
   :SOURCE
   #A((197) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-macos-latest/4001001405-snapshot-self-test-6463-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-macos-latest/4001001405-snapshot-self-test-6463-0/signal/stdout.log"
   :SOURCE
   #A((197) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-macos-latest/4001001405-snapshot-self-test-6463-0/signal/stdout.log")
   :BYTES 128 :SHA256
   "e3502e714a0530acb1f0130c4ced4a016607bcb067e3686f6f29704db8423ea5")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-macos-latest/4001001608-check-12988-0/SPK-01.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-macos-latest/4001001608-check-12988-0/SPK-01.lisp")
   :BYTES 27228 :SHA256
   "a41a7d9e99f8d8c576b8701e8c36de79abb09c43b121a00e47127c5b1c99c2f1")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-macos-latest/4001001608-check-12988-0/SPK-02.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-macos-latest/4001001608-check-12988-0/SPK-02.lisp")
   :BYTES 1607 :SHA256
   "0609e5ec4a8b3febad03f49ec70e53864d062196764c49552298cadfa014fe5f")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-macos-latest/4001001608-check-12988-0/SPK-03.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-macos-latest/4001001608-check-12988-0/SPK-03.lisp")
   :BYTES 3610 :SHA256
   "4db98b799e36d73bc3b61475e05345a0db44ab732f5c4b9aa73a24d84f55ce6e")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-macos-latest/4001001608-check-12988-0/SPK-04.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-macos-latest/4001001608-check-12988-0/SPK-04.lisp")
   :BYTES 6752 :SHA256
   "ab237c38d0c82ae948548a7dfc6bd2749617df214d0360c4d625e08e893a798f")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-macos-latest/4001001608-check-12988-0/SPK-05.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-macos-latest/4001001608-check-12988-0/SPK-05.lisp")
   :BYTES 10109 :SHA256
   "8ca72b71d8fe3e9b4120b720d7c538a006cd35fff9cde461c9ccc3138ea18e2b")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-macos-latest/4001001608-check-12988-0/SPK-06.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-macos-latest/4001001608-check-12988-0/SPK-06.lisp")
   :BYTES 23454 :SHA256
   "e76c0110dd535e9b49cf1e9e1b54e1775fffa9d0a6e306d12c5dc38d58188bb2")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-macos-latest/4001001608-check-12988-0/SPK-07.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-macos-latest/4001001608-check-12988-0/SPK-07.lisp")
   :BYTES 318 :SHA256
   "97c210e52e03e0cfb0b3dbd4c6835bda9c3269b2502cc034eca5a768c0eb3913")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-macos-latest/4001001608-check-12988-0/SPK-07.lisp.gz"
   :SOURCE
   #A((182) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-macos-latest/4001001608-check-12988-0/SPK-07.lisp.gz")
   :BYTES 410642 :SHA256
   "a959cbedddc82a248b6fd4445c2e91087ce0c6dc7c043b676077fd1481e28bfa")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-macos-latest/4001001608-check-12988-0/SPK-08.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-macos-latest/4001001608-check-12988-0/SPK-08.lisp")
   :BYTES 291738 :SHA256
   "fb6026eaa2e7336ec5520b2ba96e5458e05461e7ac02971fa746d14267b3b398")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-macos-latest/4001001608-check-12988-0/SPK-09.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-macos-latest/4001001608-check-12988-0/SPK-09.lisp")
   :BYTES 2472 :SHA256
   "a50895bde8f89f2ef4b7d53d433acb289202b4f15b4a47c13093c32067a122f5")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-macos-latest/4001001608-check-12988-0/SPK-10.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-macos-latest/4001001608-check-12988-0/SPK-10.lisp")
   :BYTES 22973 :SHA256
   "df77ab1251a239b54d94f5f290f726a0adcc8cfbf918fb7cf2c546fa2353e06e")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-macos-latest/4001001608-check-12988-0/conservazione.lisp"
   :SOURCE
   #A((186) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-macos-latest/4001001608-check-12988-0/conservazione.lisp")
   :BYTES 2162 :SHA256
   "7b8728405325d7791bb96e08b4a5f0b8d0423fbf14a43ed43e8f7b08a6d1cd2b")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-macos-latest/4001001608-check-12988-0/report.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-macos-latest/4001001608-check-12988-0/report.lisp")
   :BYTES 318 :SHA256
   "ca7f18b5be5745691c44b37bebdcde8dc1d7d2ed1aea1e738f377cbfe5f82916")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-macos-latest/4001001608-check-12988-0/report.lisp.gz"
   :SOURCE
   #A((182) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-macos-latest/4001001608-check-12988-0/report.lisp.gz")
   :BYTES 466961 :SHA256
   "0b6b721d0cb643e08292182745de975f3e563a88ca3c51bf50af7a003e97c4ab")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-ubuntu-latest/4001001242-command-2134-0/conservazione.lisp"
   :SOURCE
   #A((188) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-ubuntu-latest/4001001242-command-2134-0/conservazione.lisp")
   :BYTES 1614 :SHA256
   "401594238a311fcdcf7ef7ac674f105c26a2eda1793e1cdaee7dc6d213fa11f1")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-ubuntu-latest/4001001242-command-2134-0/report.lisp"
   :SOURCE
   #A((181) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-ubuntu-latest/4001001242-command-2134-0/report.lisp")
   :BYTES 317 :SHA256
   "ed4c1fe23e170f94b36491e3852af56152e9c94c03cd023e77a8e89a299994a9")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-ubuntu-latest/4001001242-command-2134-0/report.lisp.gz"
   :SOURCE
   #A((184) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-ubuntu-latest/4001001242-command-2134-0/report.lisp.gz")
   :BYTES 166518 :SHA256
   "7e9d34230b9609e0245598331e2d4c95062ed4a708e8f955654f163ce93f1dbf")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-ubuntu-latest/4001001260-reader-self-test-2483-0/completion-exit/isolated-build.lisp"
   :SOURCE
   #A((214) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-ubuntu-latest/4001001260-reader-self-test-2483-0/completion-exit/isolated-build.lisp")
   :BYTES 197 :SHA256
   "1a45dcf8a6d03f1e8866e49280c6f0edb894320c90624d5620fad1e3d546cea9")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-ubuntu-latest/4001001260-reader-self-test-2483-0/completion-exit/stderr.log"
   :SOURCE
   #A((205) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-ubuntu-latest/4001001260-reader-self-test-2483-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-ubuntu-latest/4001001260-reader-self-test-2483-0/completion-exit/stdout.log"
   :SOURCE
   #A((205) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-ubuntu-latest/4001001260-reader-self-test-2483-0/completion-exit/stdout.log")
   :BYTES 105 :SHA256
   "5e630c1b44d68ce71b27d151e76bf367e3cbd941200adc36cdd30e0fe7390531")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-ubuntu-latest/4001001260-reader-self-test-2483-0/report.lisp"
   :SOURCE
   #A((190) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-ubuntu-latest/4001001260-reader-self-test-2483-0/report.lisp")
   :BYTES 1767 :SHA256
   "6ef3e393fac9db075d74056ad8af6c657846bfe76b6bd78d48b080b2e8ef10fe")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-ubuntu-latest/4001001260-reader-self-test-2483-0/signal/isolated-build.lisp"
   :SOURCE
   #A((205) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-ubuntu-latest/4001001260-reader-self-test-2483-0/signal/isolated-build.lisp")
   :BYTES 247 :SHA256
   "ff5cf55dda241d32ea1b4308172c7dc526436cbf1d546e7471148cee95a873d1")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-ubuntu-latest/4001001260-reader-self-test-2483-0/signal/stderr.log"
   :SOURCE
   #A((196) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-ubuntu-latest/4001001260-reader-self-test-2483-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-ubuntu-latest/4001001260-reader-self-test-2483-0/signal/stdout.log"
   :SOURCE
   #A((196) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-ubuntu-latest/4001001260-reader-self-test-2483-0/signal/stdout.log")
   :BYTES 126 :SHA256
   "3697c68fa71f124c8d05d8cc5d649a744586a10989eb2e67c5bdce6bfc760142")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-ubuntu-latest/4001001260-snapshot-self-test-2477-0/completion-exit/isolated-build.lisp"
   :SOURCE
   #A((216) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-ubuntu-latest/4001001260-snapshot-self-test-2477-0/completion-exit/isolated-build.lisp")
   :BYTES 199 :SHA256
   "b8bb4416a818775bae5c77341eeec2c356a2733f633ac2bc8b6ac3ff955d05e0")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-ubuntu-latest/4001001260-snapshot-self-test-2477-0/completion-exit/stderr.log"
   :SOURCE
   #A((207) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-ubuntu-latest/4001001260-snapshot-self-test-2477-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-ubuntu-latest/4001001260-snapshot-self-test-2477-0/completion-exit/stdout.log"
   :SOURCE
   #A((207) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-ubuntu-latest/4001001260-snapshot-self-test-2477-0/completion-exit/stdout.log")
   :BYTES 107 :SHA256
   "4f22544421d9012fe132a36bf15950cd327ca959b8f9c5ef3d386e0c8b62a25c")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-ubuntu-latest/4001001260-snapshot-self-test-2477-0/report.lisp"
   :SOURCE
   #A((192) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-ubuntu-latest/4001001260-snapshot-self-test-2477-0/report.lisp")
   :BYTES 1787 :SHA256
   "31cb2065268be22db262dcf65aa92983e139aae9f4a6fb826f2587f74e2866b7")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-ubuntu-latest/4001001260-snapshot-self-test-2477-0/signal/isolated-build.lisp"
   :SOURCE
   #A((207) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-ubuntu-latest/4001001260-snapshot-self-test-2477-0/signal/isolated-build.lisp")
   :BYTES 249 :SHA256
   "a345276e3dfe377c0bbd359793165915b1527938a65250d367ce5ac079feecc1")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-ubuntu-latest/4001001260-snapshot-self-test-2477-0/signal/stderr.log"
   :SOURCE
   #A((198) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-ubuntu-latest/4001001260-snapshot-self-test-2477-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-ubuntu-latest/4001001260-snapshot-self-test-2477-0/signal/stdout.log"
   :SOURCE
   #A((198) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-ubuntu-latest/4001001260-snapshot-self-test-2477-0/signal/stdout.log")
   :BYTES 128 :SHA256
   "e3502e714a0530acb1f0130c4ced4a016607bcb067e3686f6f29704db8423ea5")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-ubuntu-latest/4001001348-check-3480-0/SPK-01.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-ubuntu-latest/4001001348-check-3480-0/SPK-01.lisp")
   :BYTES 27226 :SHA256
   "d1f71c4bad17b96cda02a66e40d953df7ea82bb6021122412c64dd55bb51433d")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-ubuntu-latest/4001001348-check-3480-0/SPK-02.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-ubuntu-latest/4001001348-check-3480-0/SPK-02.lisp")
   :BYTES 1605 :SHA256
   "2946f31864f27d9c8d33e71a903139419d668aae045d91314ba88f8c3687305f")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-ubuntu-latest/4001001348-check-3480-0/SPK-03.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-ubuntu-latest/4001001348-check-3480-0/SPK-03.lisp")
   :BYTES 3654 :SHA256
   "e15746dbe0a8eb54bf7d9a3acc920f55a74938c593d81d523a58c4521ef6cea5")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-ubuntu-latest/4001001348-check-3480-0/SPK-04.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-ubuntu-latest/4001001348-check-3480-0/SPK-04.lisp")
   :BYTES 6750 :SHA256
   "032976f915087c0d2aab5901977a65970f2b698292904d36bdfb1eefd84319ee")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-ubuntu-latest/4001001348-check-3480-0/SPK-05.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-ubuntu-latest/4001001348-check-3480-0/SPK-05.lisp")
   :BYTES 9768 :SHA256
   "cb216804219910386a0e10709ad9485fd86e63855446e5421ca7ce54dd9518fc")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-ubuntu-latest/4001001348-check-3480-0/SPK-06.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-ubuntu-latest/4001001348-check-3480-0/SPK-06.lisp")
   :BYTES 22646 :SHA256
   "e19b6ddc0813e50c031d2a60a15504e3c33d9e7cb0cdd660c44f9c86e6e5b6d7")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-ubuntu-latest/4001001348-check-3480-0/SPK-07.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-ubuntu-latest/4001001348-check-3480-0/SPK-07.lisp")
   :BYTES 318 :SHA256
   "3c429d57aa9a68d0fa137b5477c35a78574d817704357cc24b2477af25edd35d")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-ubuntu-latest/4001001348-check-3480-0/SPK-07.lisp.gz"
   :SOURCE
   #A((182) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-ubuntu-latest/4001001348-check-3480-0/SPK-07.lisp.gz")
   :BYTES 412257 :SHA256
   "eeb662636f60e16d7dda0633ce816947f899cb873c88fa63146a28e43977cd30")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-ubuntu-latest/4001001348-check-3480-0/SPK-08.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-ubuntu-latest/4001001348-check-3480-0/SPK-08.lisp")
   :BYTES 269691 :SHA256
   "988472017134d0746177b1404d2ccad6d83b66201590458cc0c4b7c26880a970")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-ubuntu-latest/4001001348-check-3480-0/SPK-09.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-ubuntu-latest/4001001348-check-3480-0/SPK-09.lisp")
   :BYTES 2470 :SHA256
   "2fc1f0612fffe770e6229b4bf46d1c6a251ba9b251125d45c106c2e669f27488")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-ubuntu-latest/4001001348-check-3480-0/SPK-10.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-ubuntu-latest/4001001348-check-3480-0/SPK-10.lisp")
   :BYTES 22959 :SHA256
   "8709aa386d3e71482e180a716a073762204afbceddaba48d9517a8f99b51bc65")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-ubuntu-latest/4001001348-check-3480-0/conservazione.lisp"
   :SOURCE
   #A((186) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-ubuntu-latest/4001001348-check-3480-0/conservazione.lisp")
   :BYTES 2150 :SHA256
   "333c37a0dbf15f5195a2aca2b2c18e0ce62076c15b7c35521e5d0097f621e3b5")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-ubuntu-latest/4001001348-check-3480-0/report.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-ubuntu-latest/4001001348-check-3480-0/report.lisp")
   :BYTES 318 :SHA256
   "af6283e143cb68b37a921245ebd96a3adf982da2d17d93fe6f896ac5ef439ee6")
  (:PATH
   "raw/historical-PR13-CI-pass/raw/prove-ubuntu-latest/4001001348-check-3480-0/report.lisp.gz"
   :SOURCE
   #A((182) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/raw/prove-ubuntu-latest/4001001348-check-3480-0/report.lisp.gz")
   :BYTES 473857 :SHA256
   "127a36768bda494eae1d527da3c00a65a70cd64111ded3dbc9bc90e495950c02")
  (:PATH "raw/historical-PR13-CI-pass/tools/audit.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/tools/audit.lisp")
   :BYTES 32596 :SHA256
   "2dad7e5ed13c84aeb52e62cb75c078bed39902241e6f4ea6853dae30cf120884")
  (:PATH "raw/historical-PR13-CI-pass/tools/count-tests.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/tools/count-tests.lisp")
   :BYTES 14296 :SHA256
   "1cb93fc4901faefaa66fdfe4207f012f51f683f8ab622ec5a25a92aa4512541e")
  (:PATH "raw/historical-PR13-CI-pass/transport-authorization.txt" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/transport-authorization.txt")
   :BYTES 886 :SHA256
   "51fff2af48ef37706cf93401899adbd6d53b3c1538cfd6bb94fe907d101964ab")
  (:PATH "raw/historical-PR13-CI-pass/watch-observation.json" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/watch-observation.json")
   :BYTES 299 :SHA256
   "52550b3e3b6f16d62b034dcb3a0c74cb19f0eda8f2f54997c9e94fa36c838594")
  (:PATH "raw/historical-PR13-CI-pass/zips/prove-documentazione.stderr.log"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/zips/prove-documentazione.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-PR13-CI-pass/zips/prove-documentazione.zip" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/zips/prove-documentazione.zip")
   :BYTES 60753 :SHA256
   "ccad3c44b733b96bc4bde2b2e4e2a12ecfb8138f500abf936bee7c41c69e908f")
  (:PATH "raw/historical-PR13-CI-pass/zips/prove-macos-latest.stderr.log"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/zips/prove-macos-latest.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-PR13-CI-pass/zips/prove-macos-latest.zip" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/zips/prove-macos-latest.zip")
   :BYTES 584442 :SHA256
   "37b7acd7ace7660d3cff57f3af0564cc94fb5f69ca9f9f06da770f337e1f8c8c")
  (:PATH "raw/historical-PR13-CI-pass/zips/prove-ubuntu-latest.stderr.log"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/zips/prove-ubuntu-latest.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-PR13-CI-pass/zips/prove-ubuntu-latest.zip" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38638591424/zips/prove-ubuntu-latest.zip")
   :BYTES 568980 :SHA256
   "1669ea822551faffe3fa00e4118344b9d68b53c017ddd209ab85c5967c042c3c")
  (:PATH "raw/historical-main-CI-failure/after/artifacts.json" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/after/artifacts.json")
   :BYTES 2106 :SHA256
   "d17a31401faa2e447d149676ffda6100de3ab60871160caf11a2ca0f2f5d23c6")
  (:PATH "raw/historical-main-CI-failure/after/artifacts.stderr.log" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/after/artifacts.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-main-CI-failure/after/commit.json" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/after/commit.json")
   :BYTES 2757 :SHA256
   "7f38618a1465c50d17dd9c4d68940b88d1045b4bc3f332260e4465a2dfd8b484")
  (:PATH "raw/historical-main-CI-failure/after/commit.stderr.log" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/after/commit.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-main-CI-failure/after/jobs.json" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/after/jobs.json")
   :BYTES 6244 :SHA256
   "2eeb81bb4e8264dd8bb3b7f30cc3d9123039aea48f9cae952082320d7340f87a")
  (:PATH "raw/historical-main-CI-failure/after/jobs.stderr.log" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/after/jobs.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-main-CI-failure/after/pr.json" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/after/pr.json")
   :BYTES 20611 :SHA256
   "e602e71f2d9d42e38d0059d77756242fce786602c19d0fc3f72c4bd031baec3a")
  (:PATH "raw/historical-main-CI-failure/after/pr.stderr.log" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/after/pr.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-main-CI-failure/after/repo.json" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/after/repo.json")
   :BYTES 6347 :SHA256
   "383bf6cf4436e987e395c1fc54c00e0f6371d5c75a5204599e3b697ca2a609c1")
  (:PATH "raw/historical-main-CI-failure/after/repo.stderr.log" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/after/repo.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-main-CI-failure/after/run.json" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/after/run.json")
   :BYTES 12728 :SHA256
   "b90d3cd00231fb2498370775508182fe2370cf0948702e8a590dfe9806b18bd6")
  (:PATH "raw/historical-main-CI-failure/after/run.stderr.log" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/after/run.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-main-CI-failure/after/workflow.json" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/after/workflow.json")
   :BYTES 457 :SHA256
   "92058be93052122365a94ebb3804645b95108599a5f21c88825a1b54ef187e43")
  (:PATH "raw/historical-main-CI-failure/after/workflow.stderr.log" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/after/workflow.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-main-CI-failure/audit/count-main.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/audit/count-main.lisp")
   :BYTES 119795 :SHA256
   "b2eca43ffed2578f9c027ae02292d9447f954621d45b592fdbedd7adbb788bb6")
  (:PATH "raw/historical-main-CI-failure/audit/count-main.stderr.log" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/audit/count-main.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-main-CI-failure/audit/exact-main-commit.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/audit/exact-main-commit.lisp")
   :BYTES 1017 :SHA256
   "ffef15df4844801bd058e90312a5da3d834a7255da8c0f2428a7cba47d2e4329")
  (:PATH "raw/historical-main-CI-failure/audit/exact-main-commit.stderr.log"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/audit/exact-main-commit.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-main-CI-failure/audit/macos-failure-summary.lisp"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/audit/macos-failure-summary.lisp")
   :BYTES 10749 :SHA256
   "35f074b9e7fd276d0fa54ceb6f20f61622c72077c3c99d590140b2064c70070a")
  (:PATH
   "raw/historical-main-CI-failure/audit/macos-failure-summary.stderr.log"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/audit/macos-failure-summary.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-main-CI-failure/audit/main-commit.txt" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/audit/main-commit.txt")
   :BYTES 1232 :SHA256
   "4c919e1af100c9167e5fca7d514769af1d12bb63c5fada1e7befb25a9ce1def4")
  (:PATH "raw/historical-main-CI-failure/audit/main-full-tree.nul.gz" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/audit/main-full-tree.nul")
   :BYTES 1109669 :SHA256
   "03bf47363b49d54d0320073ffb70b19c95a049e473f04646cf49294c6113650f" :CODEC
   :GZIP :UNCOMPRESSED-BYTES 6433113 :UNCOMPRESSED-SHA256
   "89b8bd48bad54368f857779c94c9f350ef44956b3b5018a439b3b2b68e19ba05")
  (:PATH "raw/historical-main-CI-failure/audit/native-all-R1-observation.lisp"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/audit/native-all-R1-observation.lisp")
   :BYTES 663 :SHA256
   "eac5cc248ce488868431c6ddc90a62f7ae299577931e3ce6c9385ac78882233b")
  (:PATH
   "raw/historical-main-CI-failure/audit/native-all-R1-observation.stderr.log"
   :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/audit/native-all-R1-observation.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-main-CI-failure/audit/native-all-R1.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/audit/native-all-R1.lisp")
   :BYTES 512 :SHA256
   "e9583bc94bff82fd0d228a07df4e5b87819ad80e5a676d2b1c972e57c00a5ff1")
  (:PATH "raw/historical-main-CI-failure/audit/native-all-R1.stderr.log"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/audit/native-all-R1.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-main-CI-failure/audit/native-all-R1.stdout.log"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/audit/native-all-R1.stdout.log")
   :BYTES 825 :SHA256
   "856d54ffece9bb3f41c3b249f3d55ff050dbf58a7d2759595df861c7ab5b52a1")
  (:PATH "raw/historical-main-CI-failure/audit/zip-bytes-after.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/audit/zip-bytes-after.lisp")
   :BYTES 601 :SHA256
   "307e1b61e82f48e4fe3cd1428c7bae71bdd30c95adbf6589e774b71827e7790f")
  (:PATH "raw/historical-main-CI-failure/audit/zip-bytes-after.stderr.log"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/audit/zip-bytes-after.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-main-CI-failure/audit/zip-bytes-before.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/audit/zip-bytes-before.lisp")
   :BYTES 563 :SHA256
   "1a9566497412c6af27e3bf9863b25eb3bb4fcbbd70fbfdca6225392518d149de")
  (:PATH "raw/historical-main-CI-failure/audit/zip-bytes-before.stderr.log"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/audit/zip-bytes-before.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-main-CI-failure/before/artifacts.json" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/before/artifacts.json")
   :BYTES 2106 :SHA256
   "d17a31401faa2e447d149676ffda6100de3ab60871160caf11a2ca0f2f5d23c6")
  (:PATH "raw/historical-main-CI-failure/before/artifacts.stderr.log" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/before/artifacts.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-main-CI-failure/before/commit.json" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/before/commit.json")
   :BYTES 2757 :SHA256
   "7f38618a1465c50d17dd9c4d68940b88d1045b4bc3f332260e4465a2dfd8b484")
  (:PATH "raw/historical-main-CI-failure/before/commit.stderr.log" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/before/commit.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-main-CI-failure/before/jobs.json" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/before/jobs.json")
   :BYTES 6244 :SHA256
   "2eeb81bb4e8264dd8bb3b7f30cc3d9123039aea48f9cae952082320d7340f87a")
  (:PATH "raw/historical-main-CI-failure/before/jobs.stderr.log" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/before/jobs.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-main-CI-failure/before/pr.json" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/before/pr.json")
   :BYTES 20611 :SHA256
   "e602e71f2d9d42e38d0059d77756242fce786602c19d0fc3f72c4bd031baec3a")
  (:PATH "raw/historical-main-CI-failure/before/pr.stderr.log" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/before/pr.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-main-CI-failure/before/repo.json" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/before/repo.json")
   :BYTES 6347 :SHA256
   "383bf6cf4436e987e395c1fc54c00e0f6371d5c75a5204599e3b697ca2a609c1")
  (:PATH "raw/historical-main-CI-failure/before/repo.stderr.log" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/before/repo.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-main-CI-failure/before/run.json" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/before/run.json")
   :BYTES 12728 :SHA256
   "b90d3cd00231fb2498370775508182fe2370cf0948702e8a590dfe9806b18bd6")
  (:PATH "raw/historical-main-CI-failure/before/run.stderr.log" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/before/run.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-main-CI-failure/before/workflow.json" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/before/workflow.json")
   :BYTES 457 :SHA256
   "92058be93052122365a94ebb3804645b95108599a5f21c88825a1b54ef187e43")
  (:PATH "raw/historical-main-CI-failure/before/workflow.stderr.log" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/before/workflow.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/historical-main-CI-failure/listings/prove-documentazione-central.stderr.log"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/listings/prove-documentazione-central.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/historical-main-CI-failure/listings/prove-documentazione-central.txt"
   :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/listings/prove-documentazione-central.txt")
   :BYTES 415 :SHA256
   "e942df66f964421ac84b49bbc4e953f8b0701c647ccd28fe780e5aeda24070de")
  (:PATH
   "raw/historical-main-CI-failure/listings/prove-documentazione-integrity.stderr.log"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/listings/prove-documentazione-integrity.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/historical-main-CI-failure/listings/prove-documentazione-integrity.txt"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/listings/prove-documentazione-integrity.txt")
   :BYTES 335 :SHA256
   "52c19f391136f6031e9aaa8fbf3128b9dc114546e64ff51624f9c6f28c113a8a")
  (:PATH
   "raw/historical-main-CI-failure/listings/prove-documentazione-paths.stderr.log"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/listings/prove-documentazione-paths.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/historical-main-CI-failure/listings/prove-documentazione-paths.txt"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/listings/prove-documentazione-paths.txt")
   :BYTES 83 :SHA256
   "44731da4cdba0c366cb566482fa63dbecc471f61af0170d5771e5d7413a4ad73")
  (:PATH
   "raw/historical-main-CI-failure/listings/prove-macos-latest-central.stderr.log"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/listings/prove-macos-latest-central.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/historical-main-CI-failure/listings/prove-macos-latest-central.txt"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/listings/prove-macos-latest-central.txt")
   :BYTES 517 :SHA256
   "d6174a783b5dad9aa80603a74e0635ef0c8b624e38a5cbc15d5b8b757ae7c425")
  (:PATH
   "raw/historical-main-CI-failure/listings/prove-macos-latest-integrity.stderr.log"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/listings/prove-macos-latest-integrity.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/historical-main-CI-failure/listings/prove-macos-latest-integrity.txt"
   :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/listings/prove-macos-latest-integrity.txt")
   :BYTES 390 :SHA256
   "e4cb143862b5f8b1ab770bab49ead252d36273d8f68e6f83ec9e8c85e2eceac8")
  (:PATH
   "raw/historical-main-CI-failure/listings/prove-macos-latest-paths.stderr.log"
   :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/listings/prove-macos-latest-paths.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-main-CI-failure/listings/prove-macos-latest-paths.txt"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/listings/prove-macos-latest-paths.txt")
   :BYTES 124 :SHA256
   "9a523a7012b6bd68941b8a5c92058872699f19f9b49104bf6d4b72200696c203")
  (:PATH
   "raw/historical-main-CI-failure/listings/prove-ubuntu-latest-central.stderr.log"
   :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/listings/prove-ubuntu-latest-central.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/historical-main-CI-failure/listings/prove-ubuntu-latest-central.txt"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/listings/prove-ubuntu-latest-central.txt")
   :BYTES 3609 :SHA256
   "54f328b299090df306e9b5b92e3b759b27ad47c78ea8600d664f43d7b3f13dd3")
  (:PATH
   "raw/historical-main-CI-failure/listings/prove-ubuntu-latest-integrity.stderr.log"
   :SOURCE
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/listings/prove-ubuntu-latest-integrity.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/historical-main-CI-failure/listings/prove-ubuntu-latest-integrity.txt"
   :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/listings/prove-ubuntu-latest-integrity.txt")
   :BYTES 2247 :SHA256
   "d0620cf030f5419267eaa6db7fb67fe6b108f23e3be3fadb00244e00eb09dc55")
  (:PATH
   "raw/historical-main-CI-failure/listings/prove-ubuntu-latest-paths.stderr.log"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/listings/prove-ubuntu-latest-paths.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/historical-main-CI-failure/listings/prove-ubuntu-latest-paths.txt"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/listings/prove-ubuntu-latest-paths.txt")
   :BYTES 1475 :SHA256
   "04082726a3d2e939122d1da9c88f6ef86c7365cfe9cff7367c7560532d604947")
  (:PATH "raw/historical-main-CI-failure/qualification-note.txt" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/qualification-note.txt")
   :BYTES 2761 :SHA256
   "5ae40064c3ff7f706bafdfc2cf8b7a01ccec0b25bb3cd16ee16d4ac4276b4e3a")
  (:PATH
   "raw/historical-main-CI-failure/raw/prove-documentazione/4001002257-command-2365-0/conservazione.lisp"
   :SOURCE
   #A((188) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-documentazione/4001002257-command-2365-0/conservazione.lisp")
   :BYTES 1061 :SHA256
   "289cdb32ae5db1d50c9eb0ddd1a16f8ef554150bc0def472937655ddc596a7fb")
  (:PATH
   "raw/historical-main-CI-failure/raw/prove-documentazione/4001002257-command-2365-0/report.lisp"
   :SOURCE
   #A((181) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-documentazione/4001002257-command-2365-0/report.lisp")
   :BYTES 191256 :SHA256
   "ea66dfdac665aa10093642a05196087f6d325eb786af8713369bfbc90882205c")
  (:PATH
   "raw/historical-main-CI-failure/raw/prove-macos-latest/4001002360-command-5473-0/conservazione.lisp"
   :SOURCE
   #A((186) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-macos-latest/4001002360-command-5473-0/conservazione.lisp")
   :BYTES 1620 :SHA256
   "beb163a4863eda526022b17e919eeee016e9c1554feacdeac4fe4b9c82946114")
  (:PATH
   "raw/historical-main-CI-failure/raw/prove-macos-latest/4001002360-command-5473-0/report.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-macos-latest/4001002360-command-5473-0/report.lisp")
   :BYTES 317 :SHA256
   "c3b21f7763043aae9ed4064dd0b4bd3ca9e243a0d51c23d48faab924349da5c7")
  (:PATH
   "raw/historical-main-CI-failure/raw/prove-macos-latest/4001002360-command-5473-0/report.lisp.gz"
   :SOURCE
   #A((182) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-macos-latest/4001002360-command-5473-0/report.lisp.gz")
   :BYTES 145074 :SHA256
   "7b940a6d1a7491bbc71fe880c3cc79e654e20208ccacb301110c6cc4dc6e2a91")
  (:PATH
   "raw/historical-main-CI-failure/raw/prove-ubuntu-latest/4001002247-command-2362-0/conservazione.lisp"
   :SOURCE
   #A((187) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-ubuntu-latest/4001002247-command-2362-0/conservazione.lisp")
   :BYTES 1611 :SHA256
   "db9590964f64bcf1ac3c149088872506add2b80c1ba3f9dc82c9749a7280ac12")
  (:PATH
   "raw/historical-main-CI-failure/raw/prove-ubuntu-latest/4001002247-command-2362-0/report.lisp"
   :SOURCE
   #A((180) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-ubuntu-latest/4001002247-command-2362-0/report.lisp")
   :BYTES 317 :SHA256
   "56059c4146a01cccab46fa139107352a9b84d2af11975e7249fcf82f331b203f")
  (:PATH
   "raw/historical-main-CI-failure/raw/prove-ubuntu-latest/4001002247-command-2362-0/report.lisp.gz"
   :SOURCE
   #A((183) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-ubuntu-latest/4001002247-command-2362-0/report.lisp.gz")
   :BYTES 166612 :SHA256
   "9e247afa87cf66db01821dc7f877cfb9af426db5dff8eda9a4eae69474ea3bda")
  (:PATH
   "raw/historical-main-CI-failure/raw/prove-ubuntu-latest/4001002276-reader-self-test-2710-0/completion-exit/isolated-build.lisp"
   :SOURCE
   #A((213) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-ubuntu-latest/4001002276-reader-self-test-2710-0/completion-exit/isolated-build.lisp")
   :BYTES 197 :SHA256
   "1a45dcf8a6d03f1e8866e49280c6f0edb894320c90624d5620fad1e3d546cea9")
  (:PATH
   "raw/historical-main-CI-failure/raw/prove-ubuntu-latest/4001002276-reader-self-test-2710-0/completion-exit/stderr.log"
   :SOURCE
   #A((204) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-ubuntu-latest/4001002276-reader-self-test-2710-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/historical-main-CI-failure/raw/prove-ubuntu-latest/4001002276-reader-self-test-2710-0/completion-exit/stdout.log"
   :SOURCE
   #A((204) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-ubuntu-latest/4001002276-reader-self-test-2710-0/completion-exit/stdout.log")
   :BYTES 105 :SHA256
   "5e630c1b44d68ce71b27d151e76bf367e3cbd941200adc36cdd30e0fe7390531")
  (:PATH
   "raw/historical-main-CI-failure/raw/prove-ubuntu-latest/4001002276-reader-self-test-2710-0/report.lisp"
   :SOURCE
   #A((189) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-ubuntu-latest/4001002276-reader-self-test-2710-0/report.lisp")
   :BYTES 1767 :SHA256
   "8a3a109fc6cf645fcd5c735cf42d0fa8e405e039212e1f775080eb640648c16c")
  (:PATH
   "raw/historical-main-CI-failure/raw/prove-ubuntu-latest/4001002276-reader-self-test-2710-0/signal/isolated-build.lisp"
   :SOURCE
   #A((204) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-ubuntu-latest/4001002276-reader-self-test-2710-0/signal/isolated-build.lisp")
   :BYTES 247 :SHA256
   "ff5cf55dda241d32ea1b4308172c7dc526436cbf1d546e7471148cee95a873d1")
  (:PATH
   "raw/historical-main-CI-failure/raw/prove-ubuntu-latest/4001002276-reader-self-test-2710-0/signal/stderr.log"
   :SOURCE
   #A((195) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-ubuntu-latest/4001002276-reader-self-test-2710-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/historical-main-CI-failure/raw/prove-ubuntu-latest/4001002276-reader-self-test-2710-0/signal/stdout.log"
   :SOURCE
   #A((195) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-ubuntu-latest/4001002276-reader-self-test-2710-0/signal/stdout.log")
   :BYTES 126 :SHA256
   "3697c68fa71f124c8d05d8cc5d649a744586a10989eb2e67c5bdce6bfc760142")
  (:PATH
   "raw/historical-main-CI-failure/raw/prove-ubuntu-latest/4001002276-snapshot-self-test-2704-0/completion-exit/isolated-build.lisp"
   :SOURCE
   #A((215) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-ubuntu-latest/4001002276-snapshot-self-test-2704-0/completion-exit/isolated-build.lisp")
   :BYTES 199 :SHA256
   "b8bb4416a818775bae5c77341eeec2c356a2733f633ac2bc8b6ac3ff955d05e0")
  (:PATH
   "raw/historical-main-CI-failure/raw/prove-ubuntu-latest/4001002276-snapshot-self-test-2704-0/completion-exit/stderr.log"
   :SOURCE
   #A((206) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-ubuntu-latest/4001002276-snapshot-self-test-2704-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/historical-main-CI-failure/raw/prove-ubuntu-latest/4001002276-snapshot-self-test-2704-0/completion-exit/stdout.log"
   :SOURCE
   #A((206) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-ubuntu-latest/4001002276-snapshot-self-test-2704-0/completion-exit/stdout.log")
   :BYTES 107 :SHA256
   "4f22544421d9012fe132a36bf15950cd327ca959b8f9c5ef3d386e0c8b62a25c")
  (:PATH
   "raw/historical-main-CI-failure/raw/prove-ubuntu-latest/4001002276-snapshot-self-test-2704-0/report.lisp"
   :SOURCE
   #A((191) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-ubuntu-latest/4001002276-snapshot-self-test-2704-0/report.lisp")
   :BYTES 1787 :SHA256
   "25c7a052e5b787a5127cd5d9babcdba988750c11e33d905f5f06d3b0373f37a4")
  (:PATH
   "raw/historical-main-CI-failure/raw/prove-ubuntu-latest/4001002276-snapshot-self-test-2704-0/signal/isolated-build.lisp"
   :SOURCE
   #A((206) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-ubuntu-latest/4001002276-snapshot-self-test-2704-0/signal/isolated-build.lisp")
   :BYTES 249 :SHA256
   "a345276e3dfe377c0bbd359793165915b1527938a65250d367ce5ac079feecc1")
  (:PATH
   "raw/historical-main-CI-failure/raw/prove-ubuntu-latest/4001002276-snapshot-self-test-2704-0/signal/stderr.log"
   :SOURCE
   #A((197) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-ubuntu-latest/4001002276-snapshot-self-test-2704-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/historical-main-CI-failure/raw/prove-ubuntu-latest/4001002276-snapshot-self-test-2704-0/signal/stdout.log"
   :SOURCE
   #A((197) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-ubuntu-latest/4001002276-snapshot-self-test-2704-0/signal/stdout.log")
   :BYTES 128 :SHA256
   "e3502e714a0530acb1f0130c4ced4a016607bcb067e3686f6f29704db8423ea5")
  (:PATH
   "raw/historical-main-CI-failure/raw/prove-ubuntu-latest/4001002434-check-3744-0/SPK-01.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-ubuntu-latest/4001002434-check-3744-0/SPK-01.lisp")
   :BYTES 27223 :SHA256
   "8d13dd73e59ffec3baf7be1512f197be6db95c925ce1c61c8d84cf0a9a1d47f9")
  (:PATH
   "raw/historical-main-CI-failure/raw/prove-ubuntu-latest/4001002434-check-3744-0/SPK-02.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-ubuntu-latest/4001002434-check-3744-0/SPK-02.lisp")
   :BYTES 1601 :SHA256
   "a0f069688a4576231a4ca1e2a5a73aeaccf6a6a2521db29bdaaa34ad2be81d02")
  (:PATH
   "raw/historical-main-CI-failure/raw/prove-ubuntu-latest/4001002434-check-3744-0/SPK-03.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-ubuntu-latest/4001002434-check-3744-0/SPK-03.lisp")
   :BYTES 3654 :SHA256
   "382e97e345e0519eebfd10c23d3c9903f5fffe611d774dcc252973430f253f2c")
  (:PATH
   "raw/historical-main-CI-failure/raw/prove-ubuntu-latest/4001002434-check-3744-0/SPK-04.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-ubuntu-latest/4001002434-check-3744-0/SPK-04.lisp")
   :BYTES 6747 :SHA256
   "e1ad3ea76aac7162a33cb2006fb60b38377bcbe3faf31abf70964994e7396874")
  (:PATH
   "raw/historical-main-CI-failure/raw/prove-ubuntu-latest/4001002434-check-3744-0/SPK-05.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-ubuntu-latest/4001002434-check-3744-0/SPK-05.lisp")
   :BYTES 9776 :SHA256
   "3058765d81ab0286f29f46db1b705846b01ac17d92d624f69fce339bed34eae2")
  (:PATH
   "raw/historical-main-CI-failure/raw/prove-ubuntu-latest/4001002434-check-3744-0/SPK-06.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-ubuntu-latest/4001002434-check-3744-0/SPK-06.lisp")
   :BYTES 22445 :SHA256
   "698e2741f95303a1d3ca156aec6a9ece3ceb95ec49e95c6f12a8070c26ec7b00")
  (:PATH
   "raw/historical-main-CI-failure/raw/prove-ubuntu-latest/4001002434-check-3744-0/SPK-07.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-ubuntu-latest/4001002434-check-3744-0/SPK-07.lisp")
   :BYTES 318 :SHA256
   "cfce86db6caf9ba7787014fb816e5f84882bd8f9b8fa0b0df68834d7ef4290fd")
  (:PATH
   "raw/historical-main-CI-failure/raw/prove-ubuntu-latest/4001002434-check-3744-0/SPK-07.lisp.gz"
   :SOURCE
   #A((181) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-ubuntu-latest/4001002434-check-3744-0/SPK-07.lisp.gz")
   :BYTES 412259 :SHA256
   "61300c0dc2c522bc943f36e891a439d3f5808b099f2a7facb703ce8e7a57d987")
  (:PATH
   "raw/historical-main-CI-failure/raw/prove-ubuntu-latest/4001002434-check-3744-0/SPK-08.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-ubuntu-latest/4001002434-check-3744-0/SPK-08.lisp")
   :BYTES 269693 :SHA256
   "0288c9dd1f98d086e1e0437a5b94083803ed72e1c22d3cd244511c2138454723")
  (:PATH
   "raw/historical-main-CI-failure/raw/prove-ubuntu-latest/4001002434-check-3744-0/SPK-09.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-ubuntu-latest/4001002434-check-3744-0/SPK-09.lisp")
   :BYTES 2470 :SHA256
   "b0d3dc16866304b4cc8a950593eadaf7b5791568856c57995d174de2f31604e8")
  (:PATH
   "raw/historical-main-CI-failure/raw/prove-ubuntu-latest/4001002434-check-3744-0/SPK-10.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-ubuntu-latest/4001002434-check-3744-0/SPK-10.lisp")
   :BYTES 22953 :SHA256
   "0317692a7460278c4255c6d11cf08a68b0b6caf0eafbc88136eb57568b76640c")
  (:PATH
   "raw/historical-main-CI-failure/raw/prove-ubuntu-latest/4001002434-check-3744-0/conservazione.lisp"
   :SOURCE
   #A((185) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-ubuntu-latest/4001002434-check-3744-0/conservazione.lisp")
   :BYTES 2150 :SHA256
   "99d3ba4701c914aab1e79a53036d4647a5709018e798548537967a151b8b430a")
  (:PATH
   "raw/historical-main-CI-failure/raw/prove-ubuntu-latest/4001002434-check-3744-0/report.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-ubuntu-latest/4001002434-check-3744-0/report.lisp")
   :BYTES 318 :SHA256
   "56e73e1880e3b184421ddd177743d3c8acccb3feb54915cf6e8715f24123ebd4")
  (:PATH
   "raw/historical-main-CI-failure/raw/prove-ubuntu-latest/4001002434-check-3744-0/report.lisp.gz"
   :SOURCE
   #A((181) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/raw/prove-ubuntu-latest/4001002434-check-3744-0/report.lisp.gz")
   :BYTES 473896 :SHA256
   "c6fa1c962403ab7b846545a767acfff395c9f620f51366cb3e8ff8219a7ac049")
  (:PATH "raw/historical-main-CI-failure/tools/audit.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/tools/audit.lisp")
   :BYTES 32596 :SHA256
   "2dad7e5ed13c84aeb52e62cb75c078bed39902241e6f4ea6853dae30cf120884")
  (:PATH "raw/historical-main-CI-failure/tools/count-tests.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/tools/count-tests.lisp")
   :BYTES 14296 :SHA256
   "1cb93fc4901faefaa66fdfe4207f012f51f683f8ab622ec5a25a92aa4512541e")
  (:PATH "raw/historical-main-CI-failure/transport-authorization.txt" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/transport-authorization.txt")
   :BYTES 1006 :SHA256
   "7427afc7b01be95eb6f8ea5146c0e4778cd86a0f38dd29333ebd48a66626aac5")
  (:PATH "raw/historical-main-CI-failure/watch/initial.json" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/watch/initial.json")
   :BYTES 4099 :SHA256
   "dceb6a9080415cd09c79bdc8c5fea438c41e65e1580cb27b420ca3b37bdbf4a1")
  (:PATH "raw/historical-main-CI-failure/watch/initial.stderr.log" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/watch/initial.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-main-CI-failure/watch/macos-failed-job.json" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/watch/macos-failed-job.json")
   :BYTES 2074 :SHA256
   "c997b0a7350d45d3f5114dcf418c18b871ff79172f82f82505f371cb11a96ec4")
  (:PATH "raw/historical-main-CI-failure/watch/macos-failed-job.stderr.log"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/watch/macos-failed-job.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-main-CI-failure/watch/macos-failed-job.stdout.log"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/watch/macos-failed-job.stdout.log")
   :BYTES 136621 :SHA256
   "d1019a63a286786babef57acd9c749868cfe994f47e56912bdcebd5fbfbb1c71")
  (:PATH "raw/historical-main-CI-failure/watch/macos-failed-log.stderr.log"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/watch/macos-failed-log.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-main-CI-failure/watch/progress.stderr.log" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/watch/progress.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-main-CI-failure/watch/progress.stdout.log" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/watch/progress.stdout.log")
   :BYTES 12942 :SHA256
   "ea595a3db4a025b6c04324c105567e0089df225e0d3896c71e830ac9c24501a3")
  (:PATH
   "raw/historical-main-CI-failure/zips/prove-documentazione.download.stderr.log"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/zips/prove-documentazione.download.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-main-CI-failure/zips/prove-documentazione.zip" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/zips/prove-documentazione.zip")
   :BYTES 60758 :SHA256
   "f56f96338808c2bea65693e7cda50fb0f11cc1d2aeab8266666a934784b6095c")
  (:PATH
   "raw/historical-main-CI-failure/zips/prove-macos-latest.download.stderr.log"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/zips/prove-macos-latest.download.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-main-CI-failure/zips/prove-macos-latest.zip" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/zips/prove-macos-latest.zip")
   :BYTES 146373 :SHA256
   "7086fa261d2bef9fd68ff61613a6ce5b9d251f811fe284d384a3242838f5dabe")
  (:PATH
   "raw/historical-main-CI-failure/zips/prove-ubuntu-latest.download.stderr.log"
   :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/zips/prove-ubuntu-latest.download.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/historical-main-CI-failure/zips/prove-ubuntu-latest.zip" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/main-run-38640790953/zips/prove-ubuntu-latest.zip")
   :BYTES 568912 :SHA256
   "f13cdaea9816f53aaccec3d4f8ab7c02be0aba69e37f06f4c9b63e013d1a0a59")
  (:PATH "raw/historical-main-CI-negative-audit/conservazione.lisp" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001002676-command-21431-0/conservazione.lisp")
   :BYTES 1162 :SHA256
   "18a6d55fcc71cde39889c76ee8a7bb94c2ddcf250ef9c98b6306f486860dead7")
  (:PATH "raw/historical-main-CI-negative-audit/report.lisp" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001002676-command-21431-0/report.lisp")
   :BYTES 193095 :SHA256
   "95b4ce50dadd7a34524d05ca95ef2dc28162a9b919e471fea9b7d63c2bc3099b")
  (:PATH "raw/publication-tools/README.md.txt" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-publication/README.md.txt")
   :BYTES 4435 :SHA256
   "95132ae394d2818595cf09e8f60eb6c12e117624236d1c3e53704fe61af1fe04")
  (:PATH "raw/publication-tools/archive-audit-contract.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-publication/archive-audit-contract.lisp")
   :BYTES 1604 :SHA256
   "fee105c75af4664485abf022011b19aaad724ad1512b38dea4ed646922c6b814")
  (:PATH "raw/publication-tools/audit-F2.lisp" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-publication/audit-F2.lisp")
   :BYTES 41338 :SHA256
   "8c857dc58646dbd85acb2d1231a66f20834db6eac837415a3cd6cf206f476df7")
  (:PATH "raw/publication-tools/audit-batch.lisp" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-publication/audit-batch.lisp")
   :BYTES 26411 :SHA256
   "d17564b38f51cd54e7ae86241c82c0eaa81a41bc9a29ecc70a6f937d59d59173")
  (:PATH "raw/publication-tools/authentication.txt" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-publication/authentication.txt")
   :BYTES 1709 :SHA256
   "c3434c2168a1e0f989e440e6db9699fd1aa70d65d89dbfeaa2ff8cd7433ff0ec")
  (:PATH "raw/publication-tools/batch-sha.lisp" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-publication/batch-sha.lisp")
   :BYTES 5787 :SHA256
   "130f428551e1aa17a946c2614db5dc14adf9ae35309ec2b21c3be5b2d59be1da")
  (:PATH "raw/publication-tools/collector-batch.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-publication/collector-batch.lisp")
   :BYTES 24309 :SHA256
   "e6b2cdecbe1bf1602109161b07c7ce51c6716323238dea10e8f9cb7a96a4facf")
  (:PATH "raw/publication-tools/count-tests.lisp" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-publication/count-tests.lisp")
   :BYTES 14296 :SHA256
   "1cb93fc4901faefaa66fdfe4207f012f51f683f8ab622ec5a25a92aa4512541e")
  (:PATH "raw/publication-tools/manifest.lisp" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-publication/manifest.lisp")
   :BYTES 5042 :SHA256
   "06b681e42bff82860cb342b38c4e281d2ed42e41198decbd77958837aa0f40b9")
  (:PATH "raw/publication-tools/scoped-runner.lisp" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-publication/scoped-runner.lisp")
   :BYTES 1397 :SHA256
   "c1f97d6967f3e1a4c79aae065549a6f5bf76b4c18b6b7a3a123fa9ebf82ebeb7")
  (:PATH "raw/publication-tools/static-read.stderr.log" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-publication/static-read.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/publication-tools/static-read.stdout.log" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-publication/static-read.stdout.log")
   :BYTES 504 :SHA256
   "e0a41307c2fbe65d93bee6588923b52e99541f6d90a0ea0cd121e244a470ae8f")
  (:PATH "semantic-audit-source.txt" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/worker-interleaving-publication/audit-F2.lisp")
   :BYTES 41338 :SHA256
   "8c857dc58646dbd85acb2d1231a66f20834db6eac837415a3cd6cf206f476df7"))
 :LIMITS
 (:COMPLETE-EXPLICIT-GROUPS :RAW-FASL-PRESERVED-AS-DATA :SOURCE-AND-COPY-SHA256
  :LOSSLESS-GZIP-FOR-LARGE-RAW :NO-RESULT-PROMOTION))
