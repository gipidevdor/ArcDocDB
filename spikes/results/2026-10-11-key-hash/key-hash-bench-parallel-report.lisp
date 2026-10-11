(:SCHEMA-VERSION 1 :KIND :KEY-HASH-BENCHMARK :STATUS :OK :EXIT-CODE 0 :MODE
 #A((7) BASE-CHAR . "--bench") :PARALLEL-REQUESTED T :BASE-COUNT 100000
 :REPLICAS 5 :WARMUP-CAP 256 :RECORDED-AT 4000706172 :SBCL
 #A((5) BASE-CHAR . "2.6.9") :MACHINE #A((5) BASE-CHAR . "ARM64") :OS
 #A((6) BASE-CHAR . "Darwin") :SAFETY 3 :COVERAGE :DISABLED
 :TIMER-UNITS-PER-SECOND 1000000 :PREREGISTRATION
 ((:LENGTH 0 :ITERATIONS 100000 :MAX-ITERATIONS 100000 :WARMUP 256)
  (:LENGTH 1 :ITERATIONS 100000 :MAX-ITERATIONS 100000 :WARMUP 256)
  (:LENGTH 7 :ITERATIONS 100000 :MAX-ITERATIONS 100000 :WARMUP 256)
  (:LENGTH 8 :ITERATIONS 100000 :MAX-ITERATIONS 100000 :WARMUP 256)
  (:LENGTH 16 :ITERATIONS 100000 :MAX-ITERATIONS 100000 :WARMUP 256)
  (:LENGTH 31 :ITERATIONS 100000 :MAX-ITERATIONS 100000 :WARMUP 256)
  (:LENGTH 32 :ITERATIONS 100000 :MAX-ITERATIONS 100000 :WARMUP 256)
  (:LENGTH 33 :ITERATIONS 100000 :MAX-ITERATIONS 100000 :WARMUP 256)
  (:LENGTH 64 :ITERATIONS 100000 :MAX-ITERATIONS 100000 :WARMUP 256)
  (:LENGTH 256 :ITERATIONS 25000 :MAX-ITERATIONS 25000 :WARMUP 256)
  (:LENGTH 1024 :ITERATIONS 6250 :MAX-ITERATIONS 6250 :WARMUP 256)
  (:LENGTH 65535 :ITERATIONS 98 :MAX-ITERATIONS 98 :WARMUP 98))
 :PUBLIC-FTYPE
 (FUNCTION (T T T T T)
  (VALUES (UNSIGNED-BYTE 32) (UNSIGNED-BYTE 32) &OPTIONAL))
 :SOURCE-FREEZE
 ((:PATH
   #A((79) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/cache/build.lisp")
   :SHA256 "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0")
  (:PATH
   #A((79) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/cache/clock.lisp")
   :SHA256 "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f")
  (:PATH
   #A((78) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/cache/core.lisp")
   :SHA256 "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4")
  (:PATH
   #A((81) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/cache/package.lisp")
   :SHA256 "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848")
  (:PATH
   #A((78) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/cache/read.lisp")
   :SHA256 "bf2232802b2f3648514dfb76f20e571797f981ebb3138f79fc1b42477df045e8")
  (:PATH
   #A((79) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/cache/types.lisp")
   :SHA256 "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30")
  (:PATH
   #A((79) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/cache/write.lisp")
   :SHA256 "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8")
  (:PATH
   #A((92) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/codec/cbor-float-minimal.lisp")
   :SHA256 "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH
   #A((85) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/codec/cbor-header.lisp")
   :SHA256 "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH
   #A((86) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/codec/cbor-minimal.lisp")
   :SHA256 "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH
   #A((86) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/codec/cbor-package.lisp")
   :SHA256 "11c474d9de6cb42c86884c41c09e8dfde025a0216c97a80dbc7a13c271d3b93d")
  (:PATH
   #A((89) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/codec/cbor-scan-input.lisp")
   :SHA256 "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH
   #A((89) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/codec/cbor-scan-items.lisp")
   :SHA256 "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH
   #A((91) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/codec/cbor-scan-minimal.lisp")
   :SHA256 "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH
   #A((89) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/codec/cbor-scan-stack.lisp")
   :SHA256 "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH
   #A((83) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/codec/cbor-scan.lisp")
   :SHA256 "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH
   #A((84) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/codec/cbor-space.lisp")
   :SHA256 "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH
   #A((84) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/codec/cbor-write.lisp")
   :SHA256 "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH
   #A((81) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/codec/package.lisp")
   :SHA256 "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH
   #A((78) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/codec/utf8.lisp")
   :SHA256 "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH
   #A((79) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/csn/package.lisp")
   :SHA256 "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0")
  (:PATH
   #A((80) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/csn/registry.lisp")
   :SHA256 "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a")
  (:PATH
   #A((79) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/epochs/core.lisp")
   :SHA256 "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399")
  (:PATH
   #A((82) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/epochs/package.lisp")
   :SHA256 "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd")
  (:PATH
   #A((79) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/epochs/read.lisp")
   :SHA256 "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905")
  (:PATH
   #A((82) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/epochs/reclaim.lisp")
   :SHA256 "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202")
  (:PATH
   #A((81) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/epochs/retire.lisp")
   :SHA256 "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b")
  (:PATH
   #A((80) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/epochs/types.lisp")
   :SHA256 "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097")
  (:PATH
   #A((85) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/execution/handoff.lisp")
   :SHA256 "ee90c809ef51134efa21e08b819e5530304efaf9f9e26b63c7e4afbf6d48e607")
  (:PATH
   #A((85) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/execution/package.lisp")
   :SHA256 "bbe8cdb6f7e74d7139f5e472a915cc74b43e34bd27ecac1c5fd364f723a2a643")
  (:PATH
   #A((83) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/execution/queue.lisp")
   :SHA256 "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90")
  (:PATH
   #A((91) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/execution/ready-recycle.lisp")
   :SHA256 "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b")
  (:PATH
   #A((89) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/execution/ready-types.lisp")
   :SHA256 "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f")
  (:PATH
   #A((83) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/execution/ready.lisp")
   :SHA256 "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327")
  (:PATH
   #A((93) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/execution/worker-boundary.lisp")
   :SHA256 "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a")
  (:PATH
   #A((90) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/execution/worker-claim.lisp")
   :SHA256 "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e")
  (:PATH
   #A((88) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/execution/worker-run.lisp")
   :SHA256 "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542")
  (:PATH
   #A((90) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/execution/worker-types.lisp")
   :SHA256 "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317")
  (:PATH
   #A((84) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/execution/writer.lisp")
   :SHA256 "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105")
  (:PATH
   #A((84) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/foundation/batch.lisp")
   :SHA256 "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH
   #A((85) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/foundation/binary.lisp")
   :SHA256 "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH
   #A((89) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/foundation/conditions.lisp")
   :SHA256 "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH
   #A((85) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/foundation/crc32c.lisp")
   :SHA256 "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH
   #A((86) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/foundation/package.lisp")
   :SHA256 "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH
   #A((85) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/foundation/record.lisp")
   :SHA256 "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH
   #A((83) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/hash/arithmetic.lisp")
   :SHA256 "c439e534b768acb123d69b921b85e1e56683aa8335bbc87efba95fe95f256fa9")
  (:PATH
   #A((79) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/hash/blocks.lisp")
   :SHA256 "5f5dff95ae6c34dfc15538c537ba2fa8d34ba2376ad66ad9975745ea13a2175f")
  (:PATH
   #A((79) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/hash/hash64.lisp")
   :SHA256 "99e4c8394a8f877ce1f552f15a57a082c0ec81015e87119ee4ffea28cf3ae77f")
  (:PATH
   #A((80) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/hash/package.lisp")
   :SHA256 "1e7668fa26fc1a8e3b3cfe824aa3e08b30b57441d5f90d44453fc3a9259a10d0")
  (:PATH
   #A((78) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/index/core.lisp")
   :SHA256 "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff")
  (:PATH
   #A((86) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/index/hash-digests.lisp")
   :SHA256 "924bb7dab91ff56c1e909f2b06dff5f74b443ac6442e379498f29b25f1fa2673")
  (:PATH
   #A((83) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/index/hash-seed.lisp")
   :SHA256 "ae86514101e95737747ba58a4f0c5dc1ddb44d2b3a18bceb8fd0d0756b57a7a1")
  (:PATH
   #A((81) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/index/package.lisp")
   :SHA256 "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507")
  (:PATH
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/index/primary-arena.lisp")
   :SHA256 "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5")
  (:PATH
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/index/primary-build.lisp")
   :SHA256 "06ca5ac8c03504e2d2f973873e5cabf7518c090cd1f8f2118c46e0ea2f9bf37b")
  (:PATH
   #A((86) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/index/primary-core.lisp")
   :SHA256 "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e")
  (:PATH
   #A((91) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/index/primary-directory.lisp")
   :SHA256 "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd")
  (:PATH
   #A((89) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/index/primary-package.lisp")
   :SHA256 "0682eb9a61596506b6788bd0285f9808db2496246caae64ab3203182ed46b860")
  (:PATH
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/index/primary-probe.lisp")
   :SHA256 "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4")
  (:PATH
   #A((86) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/index/primary-read.lisp")
   :SHA256 "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f")
  (:PATH
   #A((90) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/index/primary-relocate.lisp")
   :SHA256 "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20")
  (:PATH
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/index/primary-types.lisp")
   :SHA256 "f17ca0dcd8a538b921f00044e23872b28272638c4435eacd30f0509422505e64")
  (:PATH
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/index/primary-write.lisp")
   :SHA256 "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655")
  (:PATH
   #A((78) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/index/read.lisp")
   :SHA256 "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7")
  (:PATH
   #A((88) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/index/rebuild-budget.lisp")
   :SHA256 "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0")
  (:PATH
   #A((86) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/index/rebuild-copy.lisp")
   :SHA256 "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee")
  (:PATH
   #A((86) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/index/rebuild-scan.lisp")
   :SHA256 "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e")
  (:PATH
   #A((81) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/index/rebuild.lisp")
   :SHA256 "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1")
  (:PATH
   #A((82) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/index/relocate.lisp")
   :SHA256 "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc")
  (:PATH
   #A((79) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/index/types.lisp")
   :SHA256 "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e")
  (:PATH
   #A((84) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/index/validation.lisp")
   :SHA256 "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a")
  (:PATH
   #A((79) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/index/write.lisp")
   :SHA256 "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28")
  (:PATH
   #A((76) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/io/flush.lisp")
   :SHA256 "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325")
  (:PATH
   #A((80) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/io/lifecycle.lisp")
   :SHA256 "baa1f763fe0f394a14d381b753dcb1be1e90eb03eaff5d6469465b5d4eca015f")
  (:PATH
   #A((77) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/io/native.lisp")
   :SHA256 "b8cf3ce1ff7b4fa9def8a602ab768c0e9a321f8d6cdce6e5b2b7ded2fe3d97dd")
  (:PATH
   #A((78) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/io/package.lisp")
   :SHA256 "118eba04ab2aa87a2d86e0b0269dbeacaa485457acebbc12c57317ae465a89c0")
  (:PATH
   #A((79) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/io/transfer.lisp")
   :SHA256 "3748328cf85e1c007900a63bdd0f159f38a8d7cd3577c92c56fc68692b9b7bcf")
  (:PATH
   #A((76) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/io/types.lisp")
   :SHA256 "50c7eeea91af232fca7103ce5a25535958d73836f01cb45a20c7120b88b1336b")
  (:PATH
   #A((80) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/mvcc/package.lisp")
   :SHA256 "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c")
  (:PATH
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/mvcc/snapshots-core.lisp")
   :SHA256 "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998")
  (:PATH
   #A((86) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/mvcc/snapshots-csn.lisp")
   :SHA256 "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77")
  (:PATH
   #A((92) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/mvcc/snapshots-lifecycle.lisp")
   :SHA256 "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082")
  (:PATH
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/mvcc/snapshots-read.lisp")
   :SHA256 "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9")
  (:PATH
   #A((91) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/mvcc/snapshots-register.lisp")
   :SHA256 "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b")
  (:PATH
   #A((88) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/mvcc/snapshots-types.lisp")
   :SHA256 "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f")
  (:PATH
   #A((78) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/mvcc/types.lisp")
   :SHA256 "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50")
  (:PATH
   #A((75) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/package.lisp")
   :SHA256 "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH
   #A((77) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/read/core.lisp")
   :SHA256 "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f")
  (:PATH
   #A((80) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/read/package.lisp")
   :SHA256 "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df")
  (:PATH
   #A((77) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/read/task.lisp")
   :SHA256 "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2")
  (:PATH
   #A((78) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/read/types.lisp")
   :SHA256 "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c")
  (:PATH
   #A((92) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/recovery/decisions-build.lisp")
   :SHA256 "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115")
  (:PATH
   #A((94) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/recovery/decisions-package.lisp")
   :SHA256 "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39")
  (:PATH
   #A((92) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/recovery/decisions-query.lisp")
   :SHA256 "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24")
  (:PATH
   #A((92) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/recovery/decisions-radix.lisp")
   :SHA256 "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54")
  (:PATH
   #A((91) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/recovery/decisions-sort.lisp")
   :SHA256 "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2")
  (:PATH
   #A((92) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/recovery/decisions-types.lisp")
   :SHA256 "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c")
  (:PATH
   #A((92) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/recovery/inventory-build.lisp")
   :SHA256 "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e")
  (:PATH
   #A((92) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/recovery/inventory-query.lisp")
   :SHA256 "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb")
  (:PATH
   #A((92) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/recovery/inventory-types.lisp")
   :SHA256 "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9")
  (:PATH
   #A((91) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/recovery/manifest-build.lisp")
   :SHA256 "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471")
  (:PATH
   #A((92) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/recovery/manifest-decode.lisp")
   :SHA256 "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779")
  (:PATH
   #A((90) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/recovery/manifest-fold.lisp")
   :SHA256 "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730")
  (:PATH
   #A((93) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/recovery/manifest-package.lisp")
   :SHA256 "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc")
  (:PATH
   #A((91) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/recovery/manifest-query.lisp")
   :SHA256 "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b")
  (:PATH
   #A((91) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/recovery/manifest-types.lisp")
   :SHA256 "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10")
  (:PATH
   #A((84) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/recovery/package.lisp")
   :SHA256 "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9")
  (:PATH
   #A((81) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/recovery/scan.lisp")
   :SHA256 "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218")
  (:PATH
   #A((81) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/series/events.lisp")
   :SHA256 "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7")
  (:PATH
   #A((84) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/series/io-events.lisp")
   :SHA256 "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546")
  (:PATH
   #A((84) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/series/ownership.lisp")
   :SHA256 "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4")
  (:PATH
   #A((82) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/series/package.lisp")
   :SHA256 "7433162105df63d324141167e6dcf6bfee74611aa1cf7291cc6c92f41f3c7408")
  (:PATH
   #A((86) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/series/publication.lisp")
   :SHA256 "288cb3fa41fad76a0e6919dfa0b2fce2beef15f5880129393bee35bc8795c762")
  (:PATH
   #A((80) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/series/query.lisp")
   :SHA256 "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9")
  (:PATH
   #A((85) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/series/retirement.lisp")
   :SHA256 "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059")
  (:PATH
   #A((80) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/series/types.lisp")
   :SHA256 "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9")
  (:PATH
   #A((91) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/storage/compaction-scan.lisp")
   :SHA256 "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d")
  (:PATH
   #A((91) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/storage/control-payload.lisp")
   :SHA256 "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491")
  (:PATH
   #A((83) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/storage/formats.lisp")
   :SHA256 "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f")
  (:PATH
   #A((86) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/storage/log-header.lisp")
   :SHA256 "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81")
  (:PATH
   #A((83) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/storage/package.lisp")
   :SHA256 "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e")
  (:PATH
   #A((90) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/storage/payload-record.lisp")
   :SHA256 "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7")
  (:PATH
   #A((89) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/storage/payload-write.lisp")
   :SHA256 "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc")
  (:PATH
   #A((90) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/storage/segment-header.lisp")
   :SHA256 "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011")
  (:PATH
   #A((79) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/wal/builder.lisp")
   :SHA256 "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0")
  (:PATH
   #A((75) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/wal/csn.lisp")
   :SHA256 "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810")
  (:PATH
   #A((80) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/wal/executor.lisp")
   :SHA256 "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8")
  (:PATH
   #A((77) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/wal/group.lisp")
   :SHA256 "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b")
  (:PATH
   #A((79) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/wal/package.lisp")
   :SHA256 "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89")
  (:PATH
   #A((77) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/src/wal/types.lisp")
   :SHA256 "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e")
  (:PATH
   #A((71) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/arcdocdb.asd")
   :SHA256 "a34233e3cd44fa0e263f2d4f97d80e7611b14a9a7a7497055ab8d94092612a0b")
  (:PATH
   #A((101) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/docs/implementazione/hash-chiavi-metodo.md")
   :SHA256 "8108804cc70c6f0cf52b3423931004d7a4e68868338dd03b57eb61c10f763745")
  (:PATH
   #A((86) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/tools/evidence-storage.lisp")
   :SHA256 "8f287772a41b1ebe0e7b3ecc3826a4148082efed428a9749655977e62a9c15a6")
  (:PATH
   #A((84) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/tools/key-hash-bench.lisp")
   :SHA256 "ecda9a421c7ab96c0510b6a97b8beef5226c9b7112cfc3c8073586dd2edd4a6f"))
 :SOURCE-FREEZE-VERIFIED T :SENSOR
 (:SCHEMA-VERSION 1 :KIND :KEY-HASH-SENSOR :STATUS :OK :METRICS
  ((:KIND :SENSOR-EMPTY :WORKLOAD
    (:NAME #A((12) BASE-CHAR . "sensor-empty") :PRIMITIVE :XXH64) :STATUS :OK
    :LENGTH 0 :SEED-CASE NIL :REPLICA NIL :WORKERS 1 :ITERATIONS 20000
    :COMPLETED 20000 :BYTES 0 :HEAP-BYTES 0 :RAW-TICKS 19 :SECONDS 1.9d-5
    :TIME-QUALITY :MEASURED :NS-PER-CALL 0.95d0 :BYTES-PER-SECOND 0.0d0
    :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL :SINK-HIGH 0 :SINK-LOW 0
    :EXPECTED-HIGH 0 :EXPECTED-LOW 0 :BUFFER-UNCHANGED NIL :DIAGNOSTIC NIL)
   (:KIND :SENSOR-POSITIVE :WORKLOAD
    (:NAME #A((15) BASE-CHAR . "sensor-positive") :PRIMITIVE :XXH64) :STATUS
    :OK :LENGTH 0 :SEED-CASE NIL :REPLICA NIL :WORKERS 1 :ITERATIONS 4
    :COMPLETED 4 :BYTES 0 :HEAP-BYTES 4194368 :RAW-TICKS 7 :SECONDS 7.0d-6
    :TIME-QUALITY :MEASURED :NS-PER-CALL 1750.0d0 :BYTES-PER-SECOND 0.0d0
    :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL :SINK-HIGH 0 :SINK-LOW 0
    :EXPECTED-HIGH 0 :EXPECTED-LOW 0 :BUFFER-UNCHANGED NIL :DIAGNOSTIC NIL))
  :EMPTY-HEAP-BYTES 0 :POSITIVE-HEAP-BYTES 4194368 :RETAINED-BYTES 4194304
  :MISSING-FIELDS-REJECTED 24 :NEGATIVE-FIELDS-REJECTED 12 :ALIAS-GUARD T
  :FREEZE-GUARD T :NONZERO-STATUS-GUARD T)
 :PRODUCT-SELF-TEST
 (:STATUS :OK :ORACLE :INDEPENDENT-COLD-XXH64 :ANCHORS 3 :FIXTURES 24
  :EDGE-SPANS 24 :EMPTY-VECTORS 2 :NEGATIVE-CASES 26 :INTERLEAVED-RECHECK T)
 :METRICS
 ((:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 0
   :SEED-CASE :ZERO :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 0 :HEAP-BYTES 0 :RAW-TICKS 1270 :SECONDS 0.00127d0 :TIME-QUALITY
   :MEASURED :NS-PER-CALL 12.7d0 :BYTES-PER-SECOND 0.0d0 :COUNTER-SCOPE
   :WHOLE-PROCESS :WORKER-RESULTS NIL :SINK-HIGH 4014398263 :SINK-LOW
   1373170073 :EXPECTED-HIGH 4014398263 :EXPECTED-LOW 1373170073
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 0
   :SEED-CASE :ZERO :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 0 :HEAP-BYTES 0 :RAW-TICKS 1304 :SECONDS 0.001304d0 :TIME-QUALITY
   :MEASURED :NS-PER-CALL 13.04d0 :BYTES-PER-SECOND 0.0d0 :COUNTER-SCOPE
   :WHOLE-PROCESS :WORKER-RESULTS NIL :SINK-HIGH 4014398263 :SINK-LOW
   1373170073 :EXPECTED-HIGH 4014398263 :EXPECTED-LOW 1373170073
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 0
   :SEED-CASE :ZERO :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 0 :HEAP-BYTES 0 :RAW-TICKS 1298 :SECONDS 0.001298d0 :TIME-QUALITY
   :MEASURED :NS-PER-CALL 12.98d0 :BYTES-PER-SECOND 0.0d0 :COUNTER-SCOPE
   :WHOLE-PROCESS :WORKER-RESULTS NIL :SINK-HIGH 4014398263 :SINK-LOW
   1373170073 :EXPECTED-HIGH 4014398263 :EXPECTED-LOW 1373170073
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 0
   :SEED-CASE :ZERO :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 0 :HEAP-BYTES 0 :RAW-TICKS 1288 :SECONDS 0.001288d0 :TIME-QUALITY
   :MEASURED :NS-PER-CALL 12.88d0 :BYTES-PER-SECOND 0.0d0 :COUNTER-SCOPE
   :WHOLE-PROCESS :WORKER-RESULTS NIL :SINK-HIGH 4014398263 :SINK-LOW
   1373170073 :EXPECTED-HIGH 4014398263 :EXPECTED-LOW 1373170073
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 0
   :SEED-CASE :ZERO :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 0 :HEAP-BYTES 0 :RAW-TICKS 1297 :SECONDS 0.001297d0 :TIME-QUALITY
   :MEASURED :NS-PER-CALL 12.97d0 :BYTES-PER-SECOND 0.0d0 :COUNTER-SCOPE
   :WHOLE-PROCESS :WORKER-RESULTS NIL :SINK-HIGH 4014398263 :SINK-LOW
   1373170073 :EXPECTED-HIGH 4014398263 :EXPECTED-LOW 1373170073
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 0
   :SEED-CASE :MAX :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 0 :HEAP-BYTES 0 :RAW-TICKS 1299 :SECONDS 0.001299d0 :TIME-QUALITY
   :MEASURED :NS-PER-CALL 12.99d0 :BYTES-PER-SECOND 0.0d0 :COUNTER-SCOPE
   :WHOLE-PROCESS :WORKER-RESULTS NIL :SINK-HIGH 697257092 :SINK-LOW 2991543168
   :EXPECTED-HIGH 697257092 :EXPECTED-LOW 2991543168 :BUFFER-UNCHANGED T
   :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 0
   :SEED-CASE :MAX :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 0 :HEAP-BYTES 0 :RAW-TICKS 1309 :SECONDS 0.001309d0 :TIME-QUALITY
   :MEASURED :NS-PER-CALL 13.09d0 :BYTES-PER-SECOND 0.0d0 :COUNTER-SCOPE
   :WHOLE-PROCESS :WORKER-RESULTS NIL :SINK-HIGH 697257092 :SINK-LOW 2991543168
   :EXPECTED-HIGH 697257092 :EXPECTED-LOW 2991543168 :BUFFER-UNCHANGED T
   :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 0
   :SEED-CASE :MAX :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 0 :HEAP-BYTES 0 :RAW-TICKS 1312 :SECONDS 0.001312d0 :TIME-QUALITY
   :MEASURED :NS-PER-CALL 13.12d0 :BYTES-PER-SECOND 0.0d0 :COUNTER-SCOPE
   :WHOLE-PROCESS :WORKER-RESULTS NIL :SINK-HIGH 697257092 :SINK-LOW 2991543168
   :EXPECTED-HIGH 697257092 :EXPECTED-LOW 2991543168 :BUFFER-UNCHANGED T
   :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 0
   :SEED-CASE :MAX :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 0 :HEAP-BYTES 0 :RAW-TICKS 1302 :SECONDS 0.001302d0 :TIME-QUALITY
   :MEASURED :NS-PER-CALL 13.02d0 :BYTES-PER-SECOND 0.0d0 :COUNTER-SCOPE
   :WHOLE-PROCESS :WORKER-RESULTS NIL :SINK-HIGH 697257092 :SINK-LOW 2991543168
   :EXPECTED-HIGH 697257092 :EXPECTED-LOW 2991543168 :BUFFER-UNCHANGED T
   :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 0
   :SEED-CASE :MAX :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 0 :HEAP-BYTES 0 :RAW-TICKS 1301 :SECONDS 0.001301d0 :TIME-QUALITY
   :MEASURED :NS-PER-CALL 13.01d0 :BYTES-PER-SECOND 0.0d0 :COUNTER-SCOPE
   :WHOLE-PROCESS :WORKER-RESULTS NIL :SINK-HIGH 697257092 :SINK-LOW 2991543168
   :EXPECTED-HIGH 697257092 :EXPECTED-LOW 2991543168 :BUFFER-UNCHANGED T
   :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 1
   :SEED-CASE :ZERO :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 100000 :HEAP-BYTES 0 :RAW-TICKS 1427 :SECONDS 0.001427d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 14.27d0 :BYTES-PER-SECOND
   7.00770847932726d7 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2775575122 :SINK-LOW 1566858293 :EXPECTED-HIGH 2775575122
   :EXPECTED-LOW 1566858293 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 1
   :SEED-CASE :ZERO :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 100000 :HEAP-BYTES 0 :RAW-TICKS 1423 :SECONDS 0.001423d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 14.23d0 :BYTES-PER-SECOND
   7.02740688685875d7 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2775575122 :SINK-LOW 1566858293 :EXPECTED-HIGH 2775575122
   :EXPECTED-LOW 1566858293 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 1
   :SEED-CASE :ZERO :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 100000 :HEAP-BYTES 0 :RAW-TICKS 1422 :SECONDS 0.001422d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 14.22d0 :BYTES-PER-SECOND
   7.032348804500704d7 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2775575122 :SINK-LOW 1566858293 :EXPECTED-HIGH 2775575122
   :EXPECTED-LOW 1566858293 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 1
   :SEED-CASE :ZERO :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 100000 :HEAP-BYTES 0 :RAW-TICKS 1426 :SECONDS 0.001426d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 14.26d0 :BYTES-PER-SECOND
   7.012622720897616d7 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2775575122 :SINK-LOW 1566858293 :EXPECTED-HIGH 2775575122
   :EXPECTED-LOW 1566858293 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 1
   :SEED-CASE :ZERO :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 100000 :HEAP-BYTES 0 :RAW-TICKS 1434 :SECONDS 0.001434d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 14.34d0 :BYTES-PER-SECOND
   6.97350069735007d7 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2775575122 :SINK-LOW 1566858293 :EXPECTED-HIGH 2775575122
   :EXPECTED-LOW 1566858293 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 1
   :SEED-CASE :MAX :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 100000 :HEAP-BYTES 0 :RAW-TICKS 1429 :SECONDS 0.001429d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 14.29d0 :BYTES-PER-SECOND
   6.997900629811057d7 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2913883710 :SINK-LOW 3003520362 :EXPECTED-HIGH 2913883710
   :EXPECTED-LOW 3003520362 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 1
   :SEED-CASE :MAX :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 100000 :HEAP-BYTES 0 :RAW-TICKS 1428 :SECONDS 0.001428d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 14.28d0 :BYTES-PER-SECOND
   7.00280112044818d7 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2913883710 :SINK-LOW 3003520362 :EXPECTED-HIGH 2913883710
   :EXPECTED-LOW 3003520362 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 1
   :SEED-CASE :MAX :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 100000 :HEAP-BYTES 0 :RAW-TICKS 1427 :SECONDS 0.001427d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 14.27d0 :BYTES-PER-SECOND
   7.00770847932726d7 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2913883710 :SINK-LOW 3003520362 :EXPECTED-HIGH 2913883710
   :EXPECTED-LOW 3003520362 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 1
   :SEED-CASE :MAX :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 100000 :HEAP-BYTES 0 :RAW-TICKS 1423 :SECONDS 0.001423d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 14.23d0 :BYTES-PER-SECOND
   7.02740688685875d7 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2913883710 :SINK-LOW 3003520362 :EXPECTED-HIGH 2913883710
   :EXPECTED-LOW 3003520362 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 1
   :SEED-CASE :MAX :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 100000 :HEAP-BYTES 0 :RAW-TICKS 1426 :SECONDS 0.001426d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 14.26d0 :BYTES-PER-SECOND
   7.012622720897616d7 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2913883710 :SINK-LOW 3003520362 :EXPECTED-HIGH 2913883710
   :EXPECTED-LOW 3003520362 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 7
   :SEED-CASE :ZERO :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 700000 :HEAP-BYTES 0 :RAW-TICKS 1991 :SECONDS 0.001991d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.910000000000004d0 :BYTES-PER-SECOND
   3.515821195379206d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2383629478 :SINK-LOW 1558117133 :EXPECTED-HIGH 2383629478
   :EXPECTED-LOW 1558117133 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 7
   :SEED-CASE :ZERO :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 700000 :HEAP-BYTES 0 :RAW-TICKS 1982 :SECONDS 0.001982d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.819999999999997d0 :BYTES-PER-SECOND
   3.5317860746720487d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2383629478 :SINK-LOW 1558117133 :EXPECTED-HIGH 2383629478
   :EXPECTED-LOW 1558117133 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 7
   :SEED-CASE :ZERO :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 700000 :HEAP-BYTES 0 :RAW-TICKS 1995 :SECONDS 0.001995d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.95d0 :BYTES-PER-SECOND
   3.5087719298245615d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2383629478 :SINK-LOW 1558117133 :EXPECTED-HIGH 2383629478
   :EXPECTED-LOW 1558117133 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 7
   :SEED-CASE :ZERO :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 700000 :HEAP-BYTES 0 :RAW-TICKS 2239 :SECONDS 0.002239d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 22.39d0 :BYTES-PER-SECOND
   3.1263957123715943d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2383629478 :SINK-LOW 1558117133 :EXPECTED-HIGH 2383629478
   :EXPECTED-LOW 1558117133 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 7
   :SEED-CASE :ZERO :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 700000 :HEAP-BYTES 0 :RAW-TICKS 1991 :SECONDS 0.001991d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.910000000000004d0 :BYTES-PER-SECOND
   3.515821195379206d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2383629478 :SINK-LOW 1558117133 :EXPECTED-HIGH 2383629478
   :EXPECTED-LOW 1558117133 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 7
   :SEED-CASE :MAX :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 700000 :HEAP-BYTES 0 :RAW-TICKS 1996 :SECONDS 0.001996d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.96d0 :BYTES-PER-SECOND
   3.5070140280561125d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1617286543 :SINK-LOW 2598239346 :EXPECTED-HIGH 1617286543
   :EXPECTED-LOW 2598239346 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 7
   :SEED-CASE :MAX :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 700000 :HEAP-BYTES 0 :RAW-TICKS 1990 :SECONDS 0.00199d0 :TIME-QUALITY
   :MEASURED :NS-PER-CALL 19.9d0 :BYTES-PER-SECOND 3.517587939698492d8
   :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL :SINK-HIGH 1617286543
   :SINK-LOW 2598239346 :EXPECTED-HIGH 1617286543 :EXPECTED-LOW 2598239346
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 7
   :SEED-CASE :MAX :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 700000 :HEAP-BYTES 0 :RAW-TICKS 1982 :SECONDS 0.001982d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.819999999999997d0 :BYTES-PER-SECOND
   3.5317860746720487d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1617286543 :SINK-LOW 2598239346 :EXPECTED-HIGH 1617286543
   :EXPECTED-LOW 2598239346 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 7
   :SEED-CASE :MAX :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 700000 :HEAP-BYTES 0 :RAW-TICKS 1972 :SECONDS 0.001972d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.72d0 :BYTES-PER-SECOND
   3.549695740365112d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1617286543 :SINK-LOW 2598239346 :EXPECTED-HIGH 1617286543
   :EXPECTED-LOW 2598239346 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 7
   :SEED-CASE :MAX :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 700000 :HEAP-BYTES 0 :RAW-TICKS 1982 :SECONDS 0.001982d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.819999999999997d0 :BYTES-PER-SECOND
   3.5317860746720487d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1617286543 :SINK-LOW 2598239346 :EXPECTED-HIGH 1617286543
   :EXPECTED-LOW 2598239346 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 8
   :SEED-CASE :ZERO :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 800000 :HEAP-BYTES 0 :RAW-TICKS 1909 :SECONDS 0.001909d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.09d0 :BYTES-PER-SECOND
   4.190675746464117d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 702377167 :SINK-LOW 3479502890 :EXPECTED-HIGH 702377167
   :EXPECTED-LOW 3479502890 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 8
   :SEED-CASE :ZERO :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 800000 :HEAP-BYTES 0 :RAW-TICKS 2019 :SECONDS 0.002019d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 20.19d0 :BYTES-PER-SECOND
   3.96235760277365d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 702377167 :SINK-LOW 3479502890 :EXPECTED-HIGH 702377167
   :EXPECTED-LOW 3479502890 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 8
   :SEED-CASE :ZERO :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 800000 :HEAP-BYTES 0 :RAW-TICKS 1931 :SECONDS 0.001931d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.31d0 :BYTES-PER-SECOND
   4.142931123770067d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 702377167 :SINK-LOW 3479502890 :EXPECTED-HIGH 702377167
   :EXPECTED-LOW 3479502890 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 8
   :SEED-CASE :ZERO :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 800000 :HEAP-BYTES 0 :RAW-TICKS 1913 :SECONDS 0.001913d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.13d0 :BYTES-PER-SECOND
   4.181913225300575d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 702377167 :SINK-LOW 3479502890 :EXPECTED-HIGH 702377167
   :EXPECTED-LOW 3479502890 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 8
   :SEED-CASE :ZERO :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 800000 :HEAP-BYTES 0 :RAW-TICKS 1903 :SECONDS 0.001903d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.03d0 :BYTES-PER-SECOND
   4.203888596952181d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 702377167 :SINK-LOW 3479502890 :EXPECTED-HIGH 702377167
   :EXPECTED-LOW 3479502890 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 8
   :SEED-CASE :MAX :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 800000 :HEAP-BYTES 0 :RAW-TICKS 2104 :SECONDS 0.002104d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 21.04d0 :BYTES-PER-SECOND
   3.802281368821293d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 4030851251 :SINK-LOW 530277268 :EXPECTED-HIGH 4030851251
   :EXPECTED-LOW 530277268 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 8
   :SEED-CASE :MAX :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 800000 :HEAP-BYTES 0 :RAW-TICKS 1910 :SECONDS 0.00191d0 :TIME-QUALITY
   :MEASURED :NS-PER-CALL 19.1d0 :BYTES-PER-SECOND 4.18848167539267d8
   :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL :SINK-HIGH 4030851251
   :SINK-LOW 530277268 :EXPECTED-HIGH 4030851251 :EXPECTED-LOW 530277268
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 8
   :SEED-CASE :MAX :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 800000 :HEAP-BYTES 0 :RAW-TICKS 1919 :SECONDS 0.001919d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.19d0 :BYTES-PER-SECOND
   4.1688379364252216d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 4030851251 :SINK-LOW 530277268 :EXPECTED-HIGH 4030851251
   :EXPECTED-LOW 530277268 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 8
   :SEED-CASE :MAX :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 800000 :HEAP-BYTES 0 :RAW-TICKS 2077 :SECONDS 0.002077d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 20.769999999999996d0 :BYTES-PER-SECOND
   3.8517091959557056d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 4030851251 :SINK-LOW 530277268 :EXPECTED-HIGH 4030851251
   :EXPECTED-LOW 530277268 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 8
   :SEED-CASE :MAX :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 800000 :HEAP-BYTES 0 :RAW-TICKS 1916 :SECONDS 0.001916d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.16d0 :BYTES-PER-SECOND
   4.175365344467641d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 4030851251 :SINK-LOW 530277268 :EXPECTED-HIGH 4030851251
   :EXPECTED-LOW 530277268 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 1600000 :HEAP-BYTES 0 :RAW-TICKS 2589 :SECONDS 0.002589d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 25.89d0 :BYTES-PER-SECOND
   6.179992275009656d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2488434274 :SINK-LOW 3965313052 :EXPECTED-HIGH 2488434274
   :EXPECTED-LOW 3965313052 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 1600000 :HEAP-BYTES 0 :RAW-TICKS 2639 :SECONDS 0.002639d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 26.39d0 :BYTES-PER-SECOND
   6.062902614626753d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2488434274 :SINK-LOW 3965313052 :EXPECTED-HIGH 2488434274
   :EXPECTED-LOW 3965313052 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 1600000 :HEAP-BYTES 0 :RAW-TICKS 2592 :SECONDS 0.002592d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 25.92d0 :BYTES-PER-SECOND
   6.172839506172839d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2488434274 :SINK-LOW 3965313052 :EXPECTED-HIGH 2488434274
   :EXPECTED-LOW 3965313052 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 1600000 :HEAP-BYTES 0 :RAW-TICKS 2596 :SECONDS 0.002596d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 25.96d0 :BYTES-PER-SECOND
   6.163328197226503d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2488434274 :SINK-LOW 3965313052 :EXPECTED-HIGH 2488434274
   :EXPECTED-LOW 3965313052 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 1600000 :HEAP-BYTES 0 :RAW-TICKS 2615 :SECONDS 0.002615d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 26.15d0 :BYTES-PER-SECOND
   6.118546845124283d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2488434274 :SINK-LOW 3965313052 :EXPECTED-HIGH 2488434274
   :EXPECTED-LOW 3965313052 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :MAX :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 1600000 :HEAP-BYTES 0 :RAW-TICKS 2594 :SECONDS 0.002594d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 25.94d0 :BYTES-PER-SECOND
   6.168080185042405d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1968933113 :SINK-LOW 2654859235 :EXPECTED-HIGH 1968933113
   :EXPECTED-LOW 2654859235 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :MAX :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 1600000 :HEAP-BYTES 0 :RAW-TICKS 2592 :SECONDS 0.002592d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 25.92d0 :BYTES-PER-SECOND
   6.172839506172839d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1968933113 :SINK-LOW 2654859235 :EXPECTED-HIGH 1968933113
   :EXPECTED-LOW 2654859235 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :MAX :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 1600000 :HEAP-BYTES 0 :RAW-TICKS 2591 :SECONDS 0.002591d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 25.91d0 :BYTES-PER-SECOND
   6.175221922037823d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1968933113 :SINK-LOW 2654859235 :EXPECTED-HIGH 1968933113
   :EXPECTED-LOW 2654859235 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :MAX :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 1600000 :HEAP-BYTES 0 :RAW-TICKS 2596 :SECONDS 0.002596d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 25.96d0 :BYTES-PER-SECOND
   6.163328197226503d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1968933113 :SINK-LOW 2654859235 :EXPECTED-HIGH 1968933113
   :EXPECTED-LOW 2654859235 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :MAX :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 1600000 :HEAP-BYTES 0 :RAW-TICKS 2591 :SECONDS 0.002591d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 25.91d0 :BYTES-PER-SECOND
   6.175221922037823d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1968933113 :SINK-LOW 2654859235 :EXPECTED-HIGH 1968933113
   :EXPECTED-LOW 2654859235 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3100000 :HEAP-BYTES 0 :RAW-TICKS 3922 :SECONDS 0.003922d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 39.22d0 :BYTES-PER-SECOND
   7.90413054563998d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1146898289 :SINK-LOW 3956010695 :EXPECTED-HIGH 1146898289
   :EXPECTED-LOW 3956010695 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3100000 :HEAP-BYTES 0 :RAW-TICKS 3919 :SECONDS 0.003919d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 39.19d0 :BYTES-PER-SECOND
   7.910181168665476d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1146898289 :SINK-LOW 3956010695 :EXPECTED-HIGH 1146898289
   :EXPECTED-LOW 3956010695 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3100000 :HEAP-BYTES 0 :RAW-TICKS 3927 :SECONDS 0.003927d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 39.27d0 :BYTES-PER-SECOND
   7.894066717596129d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1146898289 :SINK-LOW 3956010695 :EXPECTED-HIGH 1146898289
   :EXPECTED-LOW 3956010695 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3100000 :HEAP-BYTES 0 :RAW-TICKS 3927 :SECONDS 0.003927d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 39.27d0 :BYTES-PER-SECOND
   7.894066717596129d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1146898289 :SINK-LOW 3956010695 :EXPECTED-HIGH 1146898289
   :EXPECTED-LOW 3956010695 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3100000 :HEAP-BYTES 0 :RAW-TICKS 3925 :SECONDS 0.003925d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 39.24999999999999d0 :BYTES-PER-SECOND
   7.898089171974523d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1146898289 :SINK-LOW 3956010695 :EXPECTED-HIGH 1146898289
   :EXPECTED-LOW 3956010695 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :MAX :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3100000 :HEAP-BYTES 0 :RAW-TICKS 3927 :SECONDS 0.003927d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 39.27d0 :BYTES-PER-SECOND
   7.894066717596129d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3805149864 :SINK-LOW 3424211333 :EXPECTED-HIGH 3805149864
   :EXPECTED-LOW 3424211333 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :MAX :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3100000 :HEAP-BYTES 0 :RAW-TICKS 3934 :SECONDS 0.003934d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 39.34d0 :BYTES-PER-SECOND
   7.88002033553635d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3805149864 :SINK-LOW 3424211333 :EXPECTED-HIGH 3805149864
   :EXPECTED-LOW 3424211333 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :MAX :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3100000 :HEAP-BYTES 0 :RAW-TICKS 3920 :SECONDS 0.00392d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 39.2d0 :BYTES-PER-SECOND
   7.908163265306122d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3805149864 :SINK-LOW 3424211333 :EXPECTED-HIGH 3805149864
   :EXPECTED-LOW 3424211333 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :MAX :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3100000 :HEAP-BYTES 0 :RAW-TICKS 3910 :SECONDS 0.00391d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 39.1d0 :BYTES-PER-SECOND
   7.928388746803068d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3805149864 :SINK-LOW 3424211333 :EXPECTED-HIGH 3805149864
   :EXPECTED-LOW 3424211333 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :MAX :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3100000 :HEAP-BYTES 0 :RAW-TICKS 3940 :SECONDS 0.00394d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 39.4d0 :BYTES-PER-SECOND
   7.868020304568528d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3805149864 :SINK-LOW 3424211333 :EXPECTED-HIGH 3805149864
   :EXPECTED-LOW 3424211333 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3200000 :HEAP-BYTES 0 :RAW-TICKS 3953 :SECONDS 0.003953d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 39.53d0 :BYTES-PER-SECOND
   8.095117632178093d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3363602882 :SINK-LOW 1789286091 :EXPECTED-HIGH 3363602882
   :EXPECTED-LOW 1789286091 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3200000 :HEAP-BYTES 0 :RAW-TICKS 4086 :SECONDS 0.004086d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 40.86d0 :BYTES-PER-SECOND
   7.831620166421928d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3363602882 :SINK-LOW 1789286091 :EXPECTED-HIGH 3363602882
   :EXPECTED-LOW 1789286091 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3200000 :HEAP-BYTES 0 :RAW-TICKS 3956 :SECONDS 0.003956d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 39.56d0 :BYTES-PER-SECOND
   8.088978766430738d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3363602882 :SINK-LOW 1789286091 :EXPECTED-HIGH 3363602882
   :EXPECTED-LOW 1789286091 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3200000 :HEAP-BYTES 0 :RAW-TICKS 3956 :SECONDS 0.003956d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 39.56d0 :BYTES-PER-SECOND
   8.088978766430738d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3363602882 :SINK-LOW 1789286091 :EXPECTED-HIGH 3363602882
   :EXPECTED-LOW 1789286091 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3200000 :HEAP-BYTES 0 :RAW-TICKS 3941 :SECONDS 0.003941d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 39.41d0 :BYTES-PER-SECOND
   8.119766556711495d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3363602882 :SINK-LOW 1789286091 :EXPECTED-HIGH 3363602882
   :EXPECTED-LOW 1789286091 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :MAX :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3200000 :HEAP-BYTES 0 :RAW-TICKS 4085 :SECONDS 0.004085d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 40.85d0 :BYTES-PER-SECOND
   7.833537331701347d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1949789789 :SINK-LOW 2753243215 :EXPECTED-HIGH 1949789789
   :EXPECTED-LOW 2753243215 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :MAX :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3200000 :HEAP-BYTES 0 :RAW-TICKS 3972 :SECONDS 0.003972d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 39.72d0 :BYTES-PER-SECOND
   8.056394763343405d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1949789789 :SINK-LOW 2753243215 :EXPECTED-HIGH 1949789789
   :EXPECTED-LOW 2753243215 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :MAX :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3200000 :HEAP-BYTES 0 :RAW-TICKS 4055 :SECONDS 0.004055d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 40.55d0 :BYTES-PER-SECOND
   7.891491985203453d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1949789789 :SINK-LOW 2753243215 :EXPECTED-HIGH 1949789789
   :EXPECTED-LOW 2753243215 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :MAX :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3200000 :HEAP-BYTES 0 :RAW-TICKS 4046 :SECONDS 0.004046d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 40.46d0 :BYTES-PER-SECOND
   7.909045971329708d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1949789789 :SINK-LOW 2753243215 :EXPECTED-HIGH 1949789789
   :EXPECTED-LOW 2753243215 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :MAX :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3200000 :HEAP-BYTES 0 :RAW-TICKS 4039 :SECONDS 0.004039d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 40.39d0 :BYTES-PER-SECOND
   7.92275315672196d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1949789789 :SINK-LOW 2753243215 :EXPECTED-HIGH 1949789789
   :EXPECTED-LOW 2753243215 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3300000 :HEAP-BYTES 0 :RAW-TICKS 4140 :SECONDS 0.00414d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 41.4d0 :BYTES-PER-SECOND
   7.971014492753624d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 788434019 :SINK-LOW 1354428606 :EXPECTED-HIGH 788434019
   :EXPECTED-LOW 1354428606 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3300000 :HEAP-BYTES 0 :RAW-TICKS 4229 :SECONDS 0.004229d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 42.29d0 :BYTES-PER-SECOND
   7.803263182785528d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 788434019 :SINK-LOW 1354428606 :EXPECTED-HIGH 788434019
   :EXPECTED-LOW 1354428606 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3300000 :HEAP-BYTES 0 :RAW-TICKS 4249 :SECONDS 0.004249d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 42.49d0 :BYTES-PER-SECOND
   7.7665333019534d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 788434019 :SINK-LOW 1354428606 :EXPECTED-HIGH 788434019
   :EXPECTED-LOW 1354428606 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3300000 :HEAP-BYTES 0 :RAW-TICKS 4207 :SECONDS 0.004207d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 42.07d0 :BYTES-PER-SECOND
   7.844069408129308d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 788434019 :SINK-LOW 1354428606 :EXPECTED-HIGH 788434019
   :EXPECTED-LOW 1354428606 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3300000 :HEAP-BYTES 0 :RAW-TICKS 4205 :SECONDS 0.004205d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 42.05d0 :BYTES-PER-SECOND
   7.847800237812128d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 788434019 :SINK-LOW 1354428606 :EXPECTED-HIGH 788434019
   :EXPECTED-LOW 1354428606 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :MAX :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3300000 :HEAP-BYTES 0 :RAW-TICKS 4232 :SECONDS 0.004232d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 42.32d0 :BYTES-PER-SECOND
   7.79773156899811d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 246156341 :SINK-LOW 3263108042 :EXPECTED-HIGH 246156341
   :EXPECTED-LOW 3263108042 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :MAX :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3300000 :HEAP-BYTES 0 :RAW-TICKS 4159 :SECONDS 0.004159d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 41.59d0 :BYTES-PER-SECOND
   7.934599663380619d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 246156341 :SINK-LOW 3263108042 :EXPECTED-HIGH 246156341
   :EXPECTED-LOW 3263108042 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :MAX :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3300000 :HEAP-BYTES 0 :RAW-TICKS 4241 :SECONDS 0.004241d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 42.41d0 :BYTES-PER-SECOND
   7.78118368309361d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 246156341 :SINK-LOW 3263108042 :EXPECTED-HIGH 246156341
   :EXPECTED-LOW 3263108042 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :MAX :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3300000 :HEAP-BYTES 0 :RAW-TICKS 4141 :SECONDS 0.004141d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 41.41d0 :BYTES-PER-SECOND
   7.969089591886019d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 246156341 :SINK-LOW 3263108042 :EXPECTED-HIGH 246156341
   :EXPECTED-LOW 3263108042 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :MAX :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3300000 :HEAP-BYTES 0 :RAW-TICKS 4245 :SECONDS 0.004245d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 42.45d0 :BYTES-PER-SECOND
   7.773851590106008d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 246156341 :SINK-LOW 3263108042 :EXPECTED-HIGH 246156341
   :EXPECTED-LOW 3263108042 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 6189 :SECONDS 0.006189d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 61.89d0 :BYTES-PER-SECOND
   1.0340927451930845d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 931690014 :SINK-LOW 3112436852 :EXPECTED-HIGH 931690014
   :EXPECTED-LOW 3112436852 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 6056 :SECONDS 0.006056d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 60.56d0 :BYTES-PER-SECOND
   1.0568031704095113d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 931690014 :SINK-LOW 3112436852 :EXPECTED-HIGH 931690014
   :EXPECTED-LOW 3112436852 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 5872 :SECONDS 0.005872d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 58.72d0 :BYTES-PER-SECOND
   1.0899182561307902d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 931690014 :SINK-LOW 3112436852 :EXPECTED-HIGH 931690014
   :EXPECTED-LOW 3112436852 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 5897 :SECONDS 0.005897d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 58.97d0 :BYTES-PER-SECOND
   1.0852976089537053d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 931690014 :SINK-LOW 3112436852 :EXPECTED-HIGH 931690014
   :EXPECTED-LOW 3112436852 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 5901 :SECONDS 0.005901d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 59.01d0 :BYTES-PER-SECOND
   1.0845619386544654d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 931690014 :SINK-LOW 3112436852 :EXPECTED-HIGH 931690014
   :EXPECTED-LOW 3112436852 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :MAX :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 5928 :SECONDS 0.005928d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 59.28d0 :BYTES-PER-SECOND
   1.0796221322537112d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1854669567 :SINK-LOW 3500381958 :EXPECTED-HIGH 1854669567
   :EXPECTED-LOW 3500381958 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :MAX :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 5903 :SECONDS 0.005903d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 59.03d0 :BYTES-PER-SECOND
   1.0841944773843808d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1854669567 :SINK-LOW 3500381958 :EXPECTED-HIGH 1854669567
   :EXPECTED-LOW 3500381958 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :MAX :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 5919 :SECONDS 0.005919d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 59.19d0 :BYTES-PER-SECOND
   1.0812637269809089d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1854669567 :SINK-LOW 3500381958 :EXPECTED-HIGH 1854669567
   :EXPECTED-LOW 3500381958 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :MAX :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 5913 :SECONDS 0.005913d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 59.13d0 :BYTES-PER-SECOND
   1.082360899712498d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1854669567 :SINK-LOW 3500381958 :EXPECTED-HIGH 1854669567
   :EXPECTED-LOW 3500381958 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :MAX :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 5899 :SECONDS 0.005899d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 58.99d0 :BYTES-PER-SECOND
   1.0849296490930667d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1854669567 :SINK-LOW 3500381958 :EXPECTED-HIGH 1854669567
   :EXPECTED-LOW 3500381958 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 1 :ITERATIONS 25000 :COMPLETED
   25000 :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 4212 :SECONDS 0.004212d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 168.48d0 :BYTES-PER-SECOND
   1.519468186134853d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3650340472 :SINK-LOW 91924045 :EXPECTED-HIGH 3650340472
   :EXPECTED-LOW 91924045 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 1 :ITERATIONS 25000 :COMPLETED
   25000 :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 4212 :SECONDS 0.004212d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 168.48d0 :BYTES-PER-SECOND
   1.519468186134853d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3650340472 :SINK-LOW 91924045 :EXPECTED-HIGH 3650340472
   :EXPECTED-LOW 91924045 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 1 :ITERATIONS 25000 :COMPLETED
   25000 :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 4196 :SECONDS 0.004196d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 167.84d0 :BYTES-PER-SECOND
   1.5252621544327931d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3650340472 :SINK-LOW 91924045 :EXPECTED-HIGH 3650340472
   :EXPECTED-LOW 91924045 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 1 :ITERATIONS 25000 :COMPLETED
   25000 :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 4188 :SECONDS 0.004188d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 167.52d0 :BYTES-PER-SECOND
   1.5281757402101243d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3650340472 :SINK-LOW 91924045 :EXPECTED-HIGH 3650340472
   :EXPECTED-LOW 91924045 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 1 :ITERATIONS 25000 :COMPLETED
   25000 :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 4203 :SECONDS 0.004203d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 168.12d0 :BYTES-PER-SECOND
   1.522721865334285d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3650340472 :SINK-LOW 91924045 :EXPECTED-HIGH 3650340472
   :EXPECTED-LOW 91924045 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :MAX :REPLICA 0 :WORKERS 1 :ITERATIONS 25000 :COMPLETED 25000
   :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 4187 :SECONDS 0.004187d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 167.48d0 :BYTES-PER-SECOND
   1.528540721280153d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3822163365 :SINK-LOW 3634861316 :EXPECTED-HIGH 3822163365
   :EXPECTED-LOW 3634861316 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :MAX :REPLICA 1 :WORKERS 1 :ITERATIONS 25000 :COMPLETED 25000
   :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 4186 :SECONDS 0.004186d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 167.43999999999997d0 :BYTES-PER-SECOND
   1.5289058767319639d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3822163365 :SINK-LOW 3634861316 :EXPECTED-HIGH 3822163365
   :EXPECTED-LOW 3634861316 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :MAX :REPLICA 2 :WORKERS 1 :ITERATIONS 25000 :COMPLETED 25000
   :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 4189 :SECONDS 0.004189d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 167.56d0 :BYTES-PER-SECOND
   1.5278109333969922d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3822163365 :SINK-LOW 3634861316 :EXPECTED-HIGH 3822163365
   :EXPECTED-LOW 3634861316 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :MAX :REPLICA 3 :WORKERS 1 :ITERATIONS 25000 :COMPLETED 25000
   :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 4187 :SECONDS 0.004187d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 167.48d0 :BYTES-PER-SECOND
   1.528540721280153d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3822163365 :SINK-LOW 3634861316 :EXPECTED-HIGH 3822163365
   :EXPECTED-LOW 3634861316 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :MAX :REPLICA 4 :WORKERS 1 :ITERATIONS 25000 :COMPLETED 25000
   :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 4190 :SECONDS 0.00419d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 167.6d0 :BYTES-PER-SECOND
   1.5274463007159903d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3822163365 :SINK-LOW 3634861316 :EXPECTED-HIGH 3822163365
   :EXPECTED-LOW 3634861316 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 1 :ITERATIONS 6250 :COMPLETED 6250
   :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 3750 :SECONDS 0.00375d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 600.0d0 :BYTES-PER-SECOND
   1.7066666666666667d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 314608995 :SINK-LOW 2823576381 :EXPECTED-HIGH 314608995
   :EXPECTED-LOW 2823576381 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 1 :ITERATIONS 6250 :COMPLETED 6250
   :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 3752 :SECONDS 0.003752d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 600.32d0 :BYTES-PER-SECOND
   1.7057569296375265d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 314608995 :SINK-LOW 2823576381 :EXPECTED-HIGH 314608995
   :EXPECTED-LOW 2823576381 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 1 :ITERATIONS 6250 :COMPLETED 6250
   :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 3752 :SECONDS 0.003752d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 600.32d0 :BYTES-PER-SECOND
   1.7057569296375265d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 314608995 :SINK-LOW 2823576381 :EXPECTED-HIGH 314608995
   :EXPECTED-LOW 2823576381 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 1 :ITERATIONS 6250 :COMPLETED 6250
   :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 3762 :SECONDS 0.003762d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 601.92d0 :BYTES-PER-SECOND
   1.7012227538543327d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 314608995 :SINK-LOW 2823576381 :EXPECTED-HIGH 314608995
   :EXPECTED-LOW 2823576381 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 1 :ITERATIONS 6250 :COMPLETED 6250
   :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 3752 :SECONDS 0.003752d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 600.32d0 :BYTES-PER-SECOND
   1.7057569296375265d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 314608995 :SINK-LOW 2823576381 :EXPECTED-HIGH 314608995
   :EXPECTED-LOW 2823576381 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :MAX :REPLICA 0 :WORKERS 1 :ITERATIONS 6250 :COMPLETED 6250
   :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 3755 :SECONDS 0.003755d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 600.8d0 :BYTES-PER-SECOND
   1.7043941411451397d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3518727484 :SINK-LOW 598906486 :EXPECTED-HIGH 3518727484
   :EXPECTED-LOW 598906486 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :MAX :REPLICA 1 :WORKERS 1 :ITERATIONS 6250 :COMPLETED 6250
   :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 3750 :SECONDS 0.00375d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 600.0d0 :BYTES-PER-SECOND
   1.7066666666666667d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3518727484 :SINK-LOW 598906486 :EXPECTED-HIGH 3518727484
   :EXPECTED-LOW 598906486 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :MAX :REPLICA 2 :WORKERS 1 :ITERATIONS 6250 :COMPLETED 6250
   :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 3757 :SECONDS 0.003757d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 601.12d0 :BYTES-PER-SECOND
   1.7034868245940912d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3518727484 :SINK-LOW 598906486 :EXPECTED-HIGH 3518727484
   :EXPECTED-LOW 598906486 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :MAX :REPLICA 3 :WORKERS 1 :ITERATIONS 6250 :COMPLETED 6250
   :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 3752 :SECONDS 0.003752d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 600.32d0 :BYTES-PER-SECOND
   1.7057569296375265d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3518727484 :SINK-LOW 598906486 :EXPECTED-HIGH 3518727484
   :EXPECTED-LOW 598906486 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :MAX :REPLICA 4 :WORKERS 1 :ITERATIONS 6250 :COMPLETED 6250
   :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 3754 :SECONDS 0.003754d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 600.64d0 :BYTES-PER-SECOND
   1.7048481619605753d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3518727484 :SINK-LOW 598906486 :EXPECTED-HIGH 3518727484
   :EXPECTED-LOW 598906486 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 1 :ITERATIONS 98 :COMPLETED 98
   :BYTES 6422430 :HEAP-BYTES 0 :RAW-TICKS 3541 :SECONDS 0.003541d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 36132.65306122449d0 :BYTES-PER-SECOND
   1.8137334086416268d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2954450432 :SINK-LOW 4000006553 :EXPECTED-HIGH 2954450432
   :EXPECTED-LOW 4000006553 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 1 :ITERATIONS 98 :COMPLETED 98
   :BYTES 6422430 :HEAP-BYTES 0 :RAW-TICKS 3560 :SECONDS 0.00356d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 36326.5306122449d0 :BYTES-PER-SECOND
   1.804053370786517d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2954450432 :SINK-LOW 4000006553 :EXPECTED-HIGH 2954450432
   :EXPECTED-LOW 4000006553 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 1 :ITERATIONS 98 :COMPLETED 98
   :BYTES 6422430 :HEAP-BYTES 0 :RAW-TICKS 3568 :SECONDS 0.003568d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 36408.163265306124d0 :BYTES-PER-SECOND
   1.800008408071749d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2954450432 :SINK-LOW 4000006553 :EXPECTED-HIGH 2954450432
   :EXPECTED-LOW 4000006553 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 1 :ITERATIONS 98 :COMPLETED 98
   :BYTES 6422430 :HEAP-BYTES 0 :RAW-TICKS 3572 :SECONDS 0.003572d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 36448.97959183674d0 :BYTES-PER-SECOND
   1.7979927211646137d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2954450432 :SINK-LOW 4000006553 :EXPECTED-HIGH 2954450432
   :EXPECTED-LOW 4000006553 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 1 :ITERATIONS 98 :COMPLETED 98
   :BYTES 6422430 :HEAP-BYTES 0 :RAW-TICKS 3566 :SECONDS 0.003566d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 36387.755102040814d0 :BYTES-PER-SECOND
   1.8010179472798653d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2954450432 :SINK-LOW 4000006553 :EXPECTED-HIGH 2954450432
   :EXPECTED-LOW 4000006553 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :MAX :REPLICA 0 :WORKERS 1 :ITERATIONS 98 :COMPLETED 98
   :BYTES 6422430 :HEAP-BYTES 0 :RAW-TICKS 3568 :SECONDS 0.003568d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 36408.163265306124d0 :BYTES-PER-SECOND
   1.800008408071749d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 4158245344 :SINK-LOW 2314362413 :EXPECTED-HIGH 4158245344
   :EXPECTED-LOW 2314362413 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :MAX :REPLICA 1 :WORKERS 1 :ITERATIONS 98 :COMPLETED 98
   :BYTES 6422430 :HEAP-BYTES 0 :RAW-TICKS 3554 :SECONDS 0.003554d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 36265.30612244898d0 :BYTES-PER-SECOND
   1.8070990433314576d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 4158245344 :SINK-LOW 2314362413 :EXPECTED-HIGH 4158245344
   :EXPECTED-LOW 2314362413 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :MAX :REPLICA 2 :WORKERS 1 :ITERATIONS 98 :COMPLETED 98
   :BYTES 6422430 :HEAP-BYTES 0 :RAW-TICKS 3553 :SECONDS 0.003553d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 36255.102040816324d0 :BYTES-PER-SECOND
   1.8076076555023923d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 4158245344 :SINK-LOW 2314362413 :EXPECTED-HIGH 4158245344
   :EXPECTED-LOW 2314362413 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :MAX :REPLICA 3 :WORKERS 1 :ITERATIONS 98 :COMPLETED 98
   :BYTES 6422430 :HEAP-BYTES 0 :RAW-TICKS 3569 :SECONDS 0.003569d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 36418.36734693877d0 :BYTES-PER-SECOND
   1.7995040627626786d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 4158245344 :SINK-LOW 2314362413 :EXPECTED-HIGH 4158245344
   :EXPECTED-LOW 2314362413 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :MAX :REPLICA 4 :WORKERS 1 :ITERATIONS 98 :COMPLETED 98
   :BYTES 6422430 :HEAP-BYTES 0 :RAW-TICKS 3568 :SECONDS 0.003568d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 36408.163265306124d0 :BYTES-PER-SECOND
   1.800008408071749d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 4158245344 :SINK-LOW 2314362413 :EXPECTED-HIGH 4158245344
   :EXPECTED-LOW 2314362413 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   0 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 0 :HEAP-BYTES 65520 :RAW-TICKS 1323 :SECONDS 0.001323d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 13.23d0 :BYTES-PER-SECOND 0.0d0
   :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 4014398263 :SINK-LOW 1373170073
     :EXPECTED-HIGH 4014398263 :EXPECTED-LOW 1373170073 :RAW-TICKS 1293
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   0 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 0 :HEAP-BYTES 65520 :RAW-TICKS 1310 :SECONDS 0.00131d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 13.1d0 :BYTES-PER-SECOND 0.0d0
   :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 4014398263 :SINK-LOW 1373170073
     :EXPECTED-HIGH 4014398263 :EXPECTED-LOW 1373170073 :RAW-TICKS 1284
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   0 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 0 :HEAP-BYTES 65520 :RAW-TICKS 1319 :SECONDS 0.001319d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 13.19d0 :BYTES-PER-SECOND 0.0d0
   :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 4014398263 :SINK-LOW 1373170073
     :EXPECTED-HIGH 4014398263 :EXPECTED-LOW 1373170073 :RAW-TICKS 1299
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   0 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 0 :HEAP-BYTES 65520 :RAW-TICKS 1301 :SECONDS 0.001301d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 13.01d0 :BYTES-PER-SECOND 0.0d0
   :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 4014398263 :SINK-LOW 1373170073
     :EXPECTED-HIGH 4014398263 :EXPECTED-LOW 1373170073 :RAW-TICKS 1283
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   0 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 0 :HEAP-BYTES 65520 :RAW-TICKS 1298 :SECONDS 0.001298d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 12.98d0 :BYTES-PER-SECOND 0.0d0
   :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 4014398263 :SINK-LOW 1373170073
     :EXPECTED-HIGH 4014398263 :EXPECTED-LOW 1373170073 :RAW-TICKS 1280
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   0 :SEED-CASE :MAX :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 0 :HEAP-BYTES 65520 :RAW-TICKS 1321 :SECONDS 0.001321d0 :TIME-QUALITY
   :MEASURED :NS-PER-CALL 13.21d0 :BYTES-PER-SECOND 0.0d0 :COUNTER-SCOPE
   :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 697257092
     :SINK-LOW 2991543168 :EXPECTED-HIGH 697257092 :EXPECTED-LOW 2991543168
     :RAW-TICKS 1300 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   0 :SEED-CASE :MAX :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 0 :HEAP-BYTES 65520 :RAW-TICKS 1319 :SECONDS 0.001319d0 :TIME-QUALITY
   :MEASURED :NS-PER-CALL 13.19d0 :BYTES-PER-SECOND 0.0d0 :COUNTER-SCOPE
   :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 697257092
     :SINK-LOW 2991543168 :EXPECTED-HIGH 697257092 :EXPECTED-LOW 2991543168
     :RAW-TICKS 1296 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   0 :SEED-CASE :MAX :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 0 :HEAP-BYTES 65520 :RAW-TICKS 1302 :SECONDS 0.001302d0 :TIME-QUALITY
   :MEASURED :NS-PER-CALL 13.02d0 :BYTES-PER-SECOND 0.0d0 :COUNTER-SCOPE
   :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 697257092
     :SINK-LOW 2991543168 :EXPECTED-HIGH 697257092 :EXPECTED-LOW 2991543168
     :RAW-TICKS 1283 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   0 :SEED-CASE :MAX :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 0 :HEAP-BYTES 65520 :RAW-TICKS 1314 :SECONDS 0.001314d0 :TIME-QUALITY
   :MEASURED :NS-PER-CALL 13.14d0 :BYTES-PER-SECOND 0.0d0 :COUNTER-SCOPE
   :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 697257092
     :SINK-LOW 2991543168 :EXPECTED-HIGH 697257092 :EXPECTED-LOW 2991543168
     :RAW-TICKS 1293 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   0 :SEED-CASE :MAX :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 0 :HEAP-BYTES 65520 :RAW-TICKS 1303 :SECONDS 0.001303d0 :TIME-QUALITY
   :MEASURED :NS-PER-CALL 13.03d0 :BYTES-PER-SECOND 0.0d0 :COUNTER-SCOPE
   :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 697257092
     :SINK-LOW 2991543168 :EXPECTED-HIGH 697257092 :EXPECTED-LOW 2991543168
     :RAW-TICKS 1279 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 100000 :HEAP-BYTES 65520 :RAW-TICKS 1438 :SECONDS 0.001438d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 14.38d0 :BYTES-PER-SECOND
   6.954102920723227d7 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2775575122 :SINK-LOW 1566858293
     :EXPECTED-HIGH 2775575122 :EXPECTED-LOW 1566858293 :RAW-TICKS 1419
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 100000 :HEAP-BYTES 65520 :RAW-TICKS 1440 :SECONDS 0.00144d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 14.4d0 :BYTES-PER-SECOND
   6.944444444444443d7 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2775575122 :SINK-LOW 1566858293
     :EXPECTED-HIGH 2775575122 :EXPECTED-LOW 1566858293 :RAW-TICKS 1421
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 100000 :HEAP-BYTES 65520 :RAW-TICKS 1444 :SECONDS 0.001444d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 14.44d0 :BYTES-PER-SECOND
   6.925207756232688d7 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2775575122 :SINK-LOW 1566858293
     :EXPECTED-HIGH 2775575122 :EXPECTED-LOW 1566858293 :RAW-TICKS 1422
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 100000 :HEAP-BYTES 65520 :RAW-TICKS 1451 :SECONDS 0.001451d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 14.51d0 :BYTES-PER-SECOND
   6.891798759476224d7 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2775575122 :SINK-LOW 1566858293
     :EXPECTED-HIGH 2775575122 :EXPECTED-LOW 1566858293 :RAW-TICKS 1431
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 100000 :HEAP-BYTES 65520 :RAW-TICKS 1457 :SECONDS 0.001457d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 14.57d0 :BYTES-PER-SECOND
   6.863417982155113d7 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2775575122 :SINK-LOW 1566858293
     :EXPECTED-HIGH 2775575122 :EXPECTED-LOW 1566858293 :RAW-TICKS 1431
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1 :SEED-CASE :MAX :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 100000 :HEAP-BYTES 65520 :RAW-TICKS 1450 :SECONDS 0.00145d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 14.5d0 :BYTES-PER-SECOND
   6.896551724137932d7 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 2913883710
     :SINK-LOW 3003520362 :EXPECTED-HIGH 2913883710 :EXPECTED-LOW 3003520362
     :RAW-TICKS 1427 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1 :SEED-CASE :MAX :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 100000 :HEAP-BYTES 65520 :RAW-TICKS 1450 :SECONDS 0.00145d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 14.5d0 :BYTES-PER-SECOND
   6.896551724137932d7 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 2913883710
     :SINK-LOW 3003520362 :EXPECTED-HIGH 2913883710 :EXPECTED-LOW 3003520362
     :RAW-TICKS 1431 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1 :SEED-CASE :MAX :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 100000 :HEAP-BYTES 65520 :RAW-TICKS 1449 :SECONDS 0.001449d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 14.49d0 :BYTES-PER-SECOND
   6.901311249137336d7 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 2913883710
     :SINK-LOW 3003520362 :EXPECTED-HIGH 2913883710 :EXPECTED-LOW 3003520362
     :RAW-TICKS 1424 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1 :SEED-CASE :MAX :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 100000 :HEAP-BYTES 65520 :RAW-TICKS 1451 :SECONDS 0.001451d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 14.51d0 :BYTES-PER-SECOND
   6.891798759476224d7 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 2913883710
     :SINK-LOW 3003520362 :EXPECTED-HIGH 2913883710 :EXPECTED-LOW 3003520362
     :RAW-TICKS 1426 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1 :SEED-CASE :MAX :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 100000 :HEAP-BYTES 65520 :RAW-TICKS 1443 :SECONDS 0.001443d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 14.43d0 :BYTES-PER-SECOND
   6.93000693000693d7 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 2913883710
     :SINK-LOW 3003520362 :EXPECTED-HIGH 2913883710 :EXPECTED-LOW 3003520362
     :RAW-TICKS 1421 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   7 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 700000 :HEAP-BYTES 65520 :RAW-TICKS 1985 :SECONDS 0.001985d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.849999999999998d0 :BYTES-PER-SECOND
   3.5264483627204037d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2383629478 :SINK-LOW 1558117133
     :EXPECTED-HIGH 2383629478 :EXPECTED-LOW 1558117133 :RAW-TICKS 1964
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   7 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 700000 :HEAP-BYTES 65520 :RAW-TICKS 1996 :SECONDS 0.001996d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.96d0 :BYTES-PER-SECOND
   3.5070140280561125d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2383629478 :SINK-LOW 1558117133
     :EXPECTED-HIGH 2383629478 :EXPECTED-LOW 1558117133 :RAW-TICKS 1974
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   7 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 700000 :HEAP-BYTES 65520 :RAW-TICKS 1994 :SECONDS 0.001994d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.94d0 :BYTES-PER-SECOND
   3.510531594784353d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2383629478 :SINK-LOW 1558117133
     :EXPECTED-HIGH 2383629478 :EXPECTED-LOW 1558117133 :RAW-TICKS 1973
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   7 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 700000 :HEAP-BYTES 65520 :RAW-TICKS 2009 :SECONDS 0.002009d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 20.09d0 :BYTES-PER-SECOND
   3.4843205574912894d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2383629478 :SINK-LOW 1558117133
     :EXPECTED-HIGH 2383629478 :EXPECTED-LOW 1558117133 :RAW-TICKS 1981
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   7 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 700000 :HEAP-BYTES 65520 :RAW-TICKS 1993 :SECONDS 0.001993d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.93d0 :BYTES-PER-SECOND
   3.512293025589563d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2383629478 :SINK-LOW 1558117133
     :EXPECTED-HIGH 2383629478 :EXPECTED-LOW 1558117133 :RAW-TICKS 1970
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   7 :SEED-CASE :MAX :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 700000 :HEAP-BYTES 65520 :RAW-TICKS 1974 :SECONDS 0.001974d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.74d0 :BYTES-PER-SECOND
   3.546099290780142d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1617286543
     :SINK-LOW 2598239346 :EXPECTED-HIGH 1617286543 :EXPECTED-LOW 2598239346
     :RAW-TICKS 1958 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   7 :SEED-CASE :MAX :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 700000 :HEAP-BYTES 65520 :RAW-TICKS 2052 :SECONDS 0.002052d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 20.52d0 :BYTES-PER-SECOND
   3.41130604288499d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1617286543
     :SINK-LOW 2598239346 :EXPECTED-HIGH 1617286543 :EXPECTED-LOW 2598239346
     :RAW-TICKS 1979 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   7 :SEED-CASE :MAX :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 700000 :HEAP-BYTES 65520 :RAW-TICKS 1995 :SECONDS 0.001995d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.95d0 :BYTES-PER-SECOND
   3.5087719298245615d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1617286543
     :SINK-LOW 2598239346 :EXPECTED-HIGH 1617286543 :EXPECTED-LOW 2598239346
     :RAW-TICKS 1973 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   7 :SEED-CASE :MAX :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 700000 :HEAP-BYTES 65520 :RAW-TICKS 2013 :SECONDS 0.002013d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 20.13d0 :BYTES-PER-SECOND
   3.477396920019871d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1617286543
     :SINK-LOW 2598239346 :EXPECTED-HIGH 1617286543 :EXPECTED-LOW 2598239346
     :RAW-TICKS 1982 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   7 :SEED-CASE :MAX :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 700000 :HEAP-BYTES 65520 :RAW-TICKS 1985 :SECONDS 0.001985d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.849999999999998d0 :BYTES-PER-SECOND
   3.5264483627204037d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1617286543
     :SINK-LOW 2598239346 :EXPECTED-HIGH 1617286543 :EXPECTED-LOW 2598239346
     :RAW-TICKS 1963 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   8 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 800000 :HEAP-BYTES 65520 :RAW-TICKS 1924 :SECONDS 0.001924d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.24d0 :BYTES-PER-SECOND
   4.158004158004158d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 702377167 :SINK-LOW 3479502890
     :EXPECTED-HIGH 702377167 :EXPECTED-LOW 3479502890 :RAW-TICKS 1903
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   8 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 800000 :HEAP-BYTES 65520 :RAW-TICKS 1929 :SECONDS 0.001929d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.29d0 :BYTES-PER-SECOND
   4.1472265422498703d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 702377167 :SINK-LOW 3479502890
     :EXPECTED-HIGH 702377167 :EXPECTED-LOW 3479502890 :RAW-TICKS 1909
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   8 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 800000 :HEAP-BYTES 65520 :RAW-TICKS 1931 :SECONDS 0.001931d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.31d0 :BYTES-PER-SECOND
   4.142931123770067d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 702377167 :SINK-LOW 3479502890
     :EXPECTED-HIGH 702377167 :EXPECTED-LOW 3479502890 :RAW-TICKS 1909
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   8 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 800000 :HEAP-BYTES 65520 :RAW-TICKS 1930 :SECONDS 0.00193d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.3d0 :BYTES-PER-SECOND
   4.1450777202072537d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 702377167 :SINK-LOW 3479502890
     :EXPECTED-HIGH 702377167 :EXPECTED-LOW 3479502890 :RAW-TICKS 1908
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   8 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 800000 :HEAP-BYTES 65520 :RAW-TICKS 1924 :SECONDS 0.001924d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.24d0 :BYTES-PER-SECOND
   4.158004158004158d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 702377167 :SINK-LOW 3479502890
     :EXPECTED-HIGH 702377167 :EXPECTED-LOW 3479502890 :RAW-TICKS 1903
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   8 :SEED-CASE :MAX :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 800000 :HEAP-BYTES 65520 :RAW-TICKS 1943 :SECONDS 0.001943d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.43d0 :BYTES-PER-SECOND
   4.117344312918168d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 4030851251
     :SINK-LOW 530277268 :EXPECTED-HIGH 4030851251 :EXPECTED-LOW 530277268
     :RAW-TICKS 1919 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   8 :SEED-CASE :MAX :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 800000 :HEAP-BYTES 65520 :RAW-TICKS 1932 :SECONDS 0.001932d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.32d0 :BYTES-PER-SECOND
   4.1407867494824016d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 4030851251
     :SINK-LOW 530277268 :EXPECTED-HIGH 4030851251 :EXPECTED-LOW 530277268
     :RAW-TICKS 1909 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   8 :SEED-CASE :MAX :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 800000 :HEAP-BYTES 65520 :RAW-TICKS 1939 :SECONDS 0.001939d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.39d0 :BYTES-PER-SECOND
   4.1258380608561116d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 4030851251
     :SINK-LOW 530277268 :EXPECTED-HIGH 4030851251 :EXPECTED-LOW 530277268
     :RAW-TICKS 1916 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   8 :SEED-CASE :MAX :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 800000 :HEAP-BYTES 65520 :RAW-TICKS 1937 :SECONDS 0.001937d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.37d0 :BYTES-PER-SECOND
   4.130098089829634d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 4030851251
     :SINK-LOW 530277268 :EXPECTED-HIGH 4030851251 :EXPECTED-LOW 530277268
     :RAW-TICKS 1916 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   8 :SEED-CASE :MAX :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 800000 :HEAP-BYTES 65520 :RAW-TICKS 1930 :SECONDS 0.00193d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.3d0 :BYTES-PER-SECOND
   4.1450777202072537d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 4030851251
     :SINK-LOW 530277268 :EXPECTED-HIGH 4030851251 :EXPECTED-LOW 530277268
     :RAW-TICKS 1906 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 1600000 :HEAP-BYTES 65520 :RAW-TICKS 2599 :SECONDS 0.002599d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 25.99d0 :BYTES-PER-SECOND
   6.156213928434013d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2488434274 :SINK-LOW 3965313052
     :EXPECTED-HIGH 2488434274 :EXPECTED-LOW 3965313052 :RAW-TICKS 2575
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 1600000 :HEAP-BYTES 65520 :RAW-TICKS 2594 :SECONDS 0.002594d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 25.94d0 :BYTES-PER-SECOND
   6.168080185042405d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2488434274 :SINK-LOW 3965313052
     :EXPECTED-HIGH 2488434274 :EXPECTED-LOW 3965313052 :RAW-TICKS 2572
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 1600000 :HEAP-BYTES 65520 :RAW-TICKS 2591 :SECONDS 0.002591d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 25.91d0 :BYTES-PER-SECOND
   6.175221922037823d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2488434274 :SINK-LOW 3965313052
     :EXPECTED-HIGH 2488434274 :EXPECTED-LOW 3965313052 :RAW-TICKS 2571
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 1600000 :HEAP-BYTES 65520 :RAW-TICKS 2586 :SECONDS 0.002586d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 25.86d0 :BYTES-PER-SECOND
   6.187161639597834d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2488434274 :SINK-LOW 3965313052
     :EXPECTED-HIGH 2488434274 :EXPECTED-LOW 3965313052 :RAW-TICKS 2566
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 1600000 :HEAP-BYTES 65520 :RAW-TICKS 2585 :SECONDS 0.002585d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 25.85d0 :BYTES-PER-SECOND
   6.189555125725338d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2488434274 :SINK-LOW 3965313052
     :EXPECTED-HIGH 2488434274 :EXPECTED-LOW 3965313052 :RAW-TICKS 2566
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :MAX :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 1600000 :HEAP-BYTES 65520 :RAW-TICKS 2601 :SECONDS 0.002601d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 26.01d0 :BYTES-PER-SECOND
   6.151480199923106d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1968933113
     :SINK-LOW 2654859235 :EXPECTED-HIGH 1968933113 :EXPECTED-LOW 2654859235
     :RAW-TICKS 2574 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :MAX :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 1600000 :HEAP-BYTES 65520 :RAW-TICKS 2593 :SECONDS 0.002593d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 25.93d0 :BYTES-PER-SECOND
   6.170458927882762d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1968933113
     :SINK-LOW 2654859235 :EXPECTED-HIGH 1968933113 :EXPECTED-LOW 2654859235
     :RAW-TICKS 2569 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :MAX :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 1600000 :HEAP-BYTES 65520 :RAW-TICKS 2598 :SECONDS 0.002598d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 25.98d0 :BYTES-PER-SECOND
   6.158583525789069d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1968933113
     :SINK-LOW 2654859235 :EXPECTED-HIGH 1968933113 :EXPECTED-LOW 2654859235
     :RAW-TICKS 2573 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :MAX :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 1600000 :HEAP-BYTES 65520 :RAW-TICKS 2598 :SECONDS 0.002598d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 25.98d0 :BYTES-PER-SECOND
   6.158583525789069d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1968933113
     :SINK-LOW 2654859235 :EXPECTED-HIGH 1968933113 :EXPECTED-LOW 2654859235
     :RAW-TICKS 2573 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :MAX :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 1600000 :HEAP-BYTES 65520 :RAW-TICKS 2599 :SECONDS 0.002599d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 25.99d0 :BYTES-PER-SECOND
   6.156213928434013d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1968933113
     :SINK-LOW 2654859235 :EXPECTED-HIGH 1968933113 :EXPECTED-LOW 2654859235
     :RAW-TICKS 2575 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3100000 :HEAP-BYTES 65520 :RAW-TICKS 3922 :SECONDS 0.003922d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 39.22d0 :BYTES-PER-SECOND
   7.90413054563998d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 1146898289 :SINK-LOW 3956010695
     :EXPECTED-HIGH 1146898289 :EXPECTED-LOW 3956010695 :RAW-TICKS 3899
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3100000 :HEAP-BYTES 65520 :RAW-TICKS 3909 :SECONDS 0.003909d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 39.09d0 :BYTES-PER-SECOND
   7.930416986441544d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 1146898289 :SINK-LOW 3956010695
     :EXPECTED-HIGH 1146898289 :EXPECTED-LOW 3956010695 :RAW-TICKS 3885
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3100000 :HEAP-BYTES 65520 :RAW-TICKS 3916 :SECONDS 0.003916d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 39.16d0 :BYTES-PER-SECOND
   7.916241062308477d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 1146898289 :SINK-LOW 3956010695
     :EXPECTED-HIGH 1146898289 :EXPECTED-LOW 3956010695 :RAW-TICKS 3892
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3100000 :HEAP-BYTES 65520 :RAW-TICKS 3916 :SECONDS 0.003916d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 39.16d0 :BYTES-PER-SECOND
   7.916241062308477d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 1146898289 :SINK-LOW 3956010695
     :EXPECTED-HIGH 1146898289 :EXPECTED-LOW 3956010695 :RAW-TICKS 3894
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3100000 :HEAP-BYTES 65520 :RAW-TICKS 3913 :SECONDS 0.003913d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 39.13d0 :BYTES-PER-SECOND
   7.922310247891643d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 1146898289 :SINK-LOW 3956010695
     :EXPECTED-HIGH 1146898289 :EXPECTED-LOW 3956010695 :RAW-TICKS 3891
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :MAX :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3100000 :HEAP-BYTES 65520 :RAW-TICKS 3908 :SECONDS 0.003908d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 39.08d0 :BYTES-PER-SECOND
   7.932446264073695d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3805149864
     :SINK-LOW 3424211333 :EXPECTED-HIGH 3805149864 :EXPECTED-LOW 3424211333
     :RAW-TICKS 3887 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :MAX :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3100000 :HEAP-BYTES 65520 :RAW-TICKS 3861 :SECONDS 0.003861d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 38.61d0 :BYTES-PER-SECOND
   8.02900802900803d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3805149864
     :SINK-LOW 3424211333 :EXPECTED-HIGH 3805149864 :EXPECTED-LOW 3424211333
     :RAW-TICKS 3839 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :MAX :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3100000 :HEAP-BYTES 65520 :RAW-TICKS 3898 :SECONDS 0.003898d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 38.98d0 :BYTES-PER-SECOND
   7.952796305797845d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3805149864
     :SINK-LOW 3424211333 :EXPECTED-HIGH 3805149864 :EXPECTED-LOW 3424211333
     :RAW-TICKS 3873 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :MAX :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3100000 :HEAP-BYTES 65520 :RAW-TICKS 3923 :SECONDS 0.003923d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 39.230000000000004d0 :BYTES-PER-SECOND
   7.902115727759367d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3805149864
     :SINK-LOW 3424211333 :EXPECTED-HIGH 3805149864 :EXPECTED-LOW 3424211333
     :RAW-TICKS 3898 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :MAX :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3100000 :HEAP-BYTES 65520 :RAW-TICKS 3912 :SECONDS 0.003912d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 39.12d0 :BYTES-PER-SECOND
   7.924335378323109d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3805149864
     :SINK-LOW 3424211333 :EXPECTED-HIGH 3805149864 :EXPECTED-LOW 3424211333
     :RAW-TICKS 3889 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3200000 :HEAP-BYTES 65520 :RAW-TICKS 4033 :SECONDS 0.004033d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 40.33d0 :BYTES-PER-SECOND
   7.934540044631788d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 3363602882 :SINK-LOW 1789286091
     :EXPECTED-HIGH 3363602882 :EXPECTED-LOW 1789286091 :RAW-TICKS 4006
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3200000 :HEAP-BYTES 65520 :RAW-TICKS 4011 :SECONDS 0.004011d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 40.11d0 :BYTES-PER-SECOND
   7.978060334081277d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 3363602882 :SINK-LOW 1789286091
     :EXPECTED-HIGH 3363602882 :EXPECTED-LOW 1789286091 :RAW-TICKS 3989
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3200000 :HEAP-BYTES 65520 :RAW-TICKS 4090 :SECONDS 0.00409d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 40.9d0 :BYTES-PER-SECOND
   7.8239608801956d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 3363602882 :SINK-LOW 1789286091
     :EXPECTED-HIGH 3363602882 :EXPECTED-LOW 1789286091 :RAW-TICKS 4055
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3200000 :HEAP-BYTES 65520 :RAW-TICKS 4040 :SECONDS 0.00404d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 40.4d0 :BYTES-PER-SECOND
   7.92079207920792d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 3363602882 :SINK-LOW 1789286091
     :EXPECTED-HIGH 3363602882 :EXPECTED-LOW 1789286091 :RAW-TICKS 4012
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3200000 :HEAP-BYTES 65520 :RAW-TICKS 4029 :SECONDS 0.004029d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 40.28999999999999d0 :BYTES-PER-SECOND
   7.942417473318442d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 3363602882 :SINK-LOW 1789286091
     :EXPECTED-HIGH 3363602882 :EXPECTED-LOW 1789286091 :RAW-TICKS 3994
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :MAX :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3200000 :HEAP-BYTES 65520 :RAW-TICKS 4021 :SECONDS 0.004021d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 40.21000000000001d0 :BYTES-PER-SECOND
   7.95821934842079d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1949789789
     :SINK-LOW 2753243215 :EXPECTED-HIGH 1949789789 :EXPECTED-LOW 2753243215
     :RAW-TICKS 3987 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :MAX :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3200000 :HEAP-BYTES 65520 :RAW-TICKS 4037 :SECONDS 0.004037d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 40.37d0 :BYTES-PER-SECOND
   7.926678226405747d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1949789789
     :SINK-LOW 2753243215 :EXPECTED-HIGH 1949789789 :EXPECTED-LOW 2753243215
     :RAW-TICKS 3994 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :MAX :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3200000 :HEAP-BYTES 65520 :RAW-TICKS 4089 :SECONDS 0.004089d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 40.88999999999999d0 :BYTES-PER-SECOND
   7.825874296894107d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1949789789
     :SINK-LOW 2753243215 :EXPECTED-HIGH 1949789789 :EXPECTED-LOW 2753243215
     :RAW-TICKS 4047 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :MAX :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3200000 :HEAP-BYTES 65520 :RAW-TICKS 4081 :SECONDS 0.004081d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 40.81d0 :BYTES-PER-SECOND
   7.841215388385199d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1949789789
     :SINK-LOW 2753243215 :EXPECTED-HIGH 1949789789 :EXPECTED-LOW 2753243215
     :RAW-TICKS 4033 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :MAX :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3200000 :HEAP-BYTES 65520 :RAW-TICKS 4242 :SECONDS 0.004242d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 42.42d0 :BYTES-PER-SECOND
   7.543611504007543d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1949789789
     :SINK-LOW 2753243215 :EXPECTED-HIGH 1949789789 :EXPECTED-LOW 2753243215
     :RAW-TICKS 4191 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3300000 :HEAP-BYTES 65520 :RAW-TICKS 4178 :SECONDS 0.004178d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 41.78d0 :BYTES-PER-SECOND
   7.898516036381043d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 788434019 :SINK-LOW 1354428606
     :EXPECTED-HIGH 788434019 :EXPECTED-LOW 1354428606 :RAW-TICKS 4150
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3300000 :HEAP-BYTES 65520 :RAW-TICKS 4179 :SECONDS 0.004179d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 41.790000000000006d0 :BYTES-PER-SECOND
   7.896625987078247d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 788434019 :SINK-LOW 1354428606
     :EXPECTED-HIGH 788434019 :EXPECTED-LOW 1354428606 :RAW-TICKS 4161
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3300000 :HEAP-BYTES 65520 :RAW-TICKS 4198 :SECONDS 0.004198d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 41.98d0 :BYTES-PER-SECOND
   7.86088613625536d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 788434019 :SINK-LOW 1354428606
     :EXPECTED-HIGH 788434019 :EXPECTED-LOW 1354428606 :RAW-TICKS 4169
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3300000 :HEAP-BYTES 65520 :RAW-TICKS 4202 :SECONDS 0.004202d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 42.02d0 :BYTES-PER-SECOND
   7.853403141361257d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 788434019 :SINK-LOW 1354428606
     :EXPECTED-HIGH 788434019 :EXPECTED-LOW 1354428606 :RAW-TICKS 4182
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3300000 :HEAP-BYTES 65520 :RAW-TICKS 4190 :SECONDS 0.00419d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 41.9d0 :BYTES-PER-SECOND
   7.875894988066826d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 788434019 :SINK-LOW 1354428606
     :EXPECTED-HIGH 788434019 :EXPECTED-LOW 1354428606 :RAW-TICKS 4167
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :MAX :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3300000 :HEAP-BYTES 65520 :RAW-TICKS 4255 :SECONDS 0.004255d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 42.55d0 :BYTES-PER-SECOND
   7.755581668625146d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 246156341
     :SINK-LOW 3263108042 :EXPECTED-HIGH 246156341 :EXPECTED-LOW 3263108042
     :RAW-TICKS 4233 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :MAX :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3300000 :HEAP-BYTES 65520 :RAW-TICKS 4188 :SECONDS 0.004188d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 41.88d0 :BYTES-PER-SECOND
   7.879656160458453d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 246156341
     :SINK-LOW 3263108042 :EXPECTED-HIGH 246156341 :EXPECTED-LOW 3263108042
     :RAW-TICKS 4164 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :MAX :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3300000 :HEAP-BYTES 65520 :RAW-TICKS 4255 :SECONDS 0.004255d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 42.55d0 :BYTES-PER-SECOND
   7.755581668625146d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 246156341
     :SINK-LOW 3263108042 :EXPECTED-HIGH 246156341 :EXPECTED-LOW 3263108042
     :RAW-TICKS 4237 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :MAX :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3300000 :HEAP-BYTES 65520 :RAW-TICKS 4176 :SECONDS 0.004176d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 41.76d0 :BYTES-PER-SECOND
   7.902298850574713d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 246156341
     :SINK-LOW 3263108042 :EXPECTED-HIGH 246156341 :EXPECTED-LOW 3263108042
     :RAW-TICKS 4157 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :MAX :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3300000 :HEAP-BYTES 65520 :RAW-TICKS 4200 :SECONDS 0.0042d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 42.0d0 :BYTES-PER-SECOND
   7.857142857142857d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 246156341
     :SINK-LOW 3263108042 :EXPECTED-HIGH 246156341 :EXPECTED-LOW 3263108042
     :RAW-TICKS 4178 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 6400000 :HEAP-BYTES 65520 :RAW-TICKS 5827 :SECONDS 0.005827d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 58.27d0 :BYTES-PER-SECOND
   1.098335335507122d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 931690014 :SINK-LOW 3112436852
     :EXPECTED-HIGH 931690014 :EXPECTED-LOW 3112436852 :RAW-TICKS 5807
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 6400000 :HEAP-BYTES 65520 :RAW-TICKS 5859 :SECONDS 0.005859d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 58.59d0 :BYTES-PER-SECOND
   1.092336576207544d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 931690014 :SINK-LOW 3112436852
     :EXPECTED-HIGH 931690014 :EXPECTED-LOW 3112436852 :RAW-TICKS 5835
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 6400000 :HEAP-BYTES 65520 :RAW-TICKS 5863 :SECONDS 0.005863d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 58.63d0 :BYTES-PER-SECOND
   1.0915913354937744d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 931690014 :SINK-LOW 3112436852
     :EXPECTED-HIGH 931690014 :EXPECTED-LOW 3112436852 :RAW-TICKS 5842
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 6400000 :HEAP-BYTES 65520 :RAW-TICKS 5856 :SECONDS 0.005856d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 58.56d0 :BYTES-PER-SECOND
   1.092896174863388d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 931690014 :SINK-LOW 3112436852
     :EXPECTED-HIGH 931690014 :EXPECTED-LOW 3112436852 :RAW-TICKS 5832
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 6400000 :HEAP-BYTES 65520 :RAW-TICKS 5862 :SECONDS 0.005862d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 58.62d0 :BYTES-PER-SECOND
   1.0917775503241215d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 931690014 :SINK-LOW 3112436852
     :EXPECTED-HIGH 931690014 :EXPECTED-LOW 3112436852 :RAW-TICKS 5839
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :MAX :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 6400000 :HEAP-BYTES 65520 :RAW-TICKS 5899 :SECONDS 0.005899d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 58.99d0 :BYTES-PER-SECOND
   1.0849296490930667d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1854669567
     :SINK-LOW 3500381958 :EXPECTED-HIGH 1854669567 :EXPECTED-LOW 3500381958
     :RAW-TICKS 5876 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :MAX :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 6400000 :HEAP-BYTES 65520 :RAW-TICKS 6110 :SECONDS 0.00611d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 61.1d0 :BYTES-PER-SECOND
   1.0474631751227496d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1854669567
     :SINK-LOW 3500381958 :EXPECTED-HIGH 1854669567 :EXPECTED-LOW 3500381958
     :RAW-TICKS 6085 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :MAX :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 6400000 :HEAP-BYTES 65520 :RAW-TICKS 5861 :SECONDS 0.005861d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 58.61d0 :BYTES-PER-SECOND
   1.0919638286981745d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1854669567
     :SINK-LOW 3500381958 :EXPECTED-HIGH 1854669567 :EXPECTED-LOW 3500381958
     :RAW-TICKS 5839 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :MAX :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 6400000 :HEAP-BYTES 65520 :RAW-TICKS 5879 :SECONDS 0.005879d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 58.79d0 :BYTES-PER-SECOND
   1.088620513692805d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1854669567
     :SINK-LOW 3500381958 :EXPECTED-HIGH 1854669567 :EXPECTED-LOW 3500381958
     :RAW-TICKS 5851 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :MAX :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 6400000 :HEAP-BYTES 65520 :RAW-TICKS 5895 :SECONDS 0.005895d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 58.95d0 :BYTES-PER-SECOND
   1.085665818490246d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1854669567
     :SINK-LOW 3500381958 :EXPECTED-HIGH 1854669567 :EXPECTED-LOW 3500381958
     :RAW-TICKS 5863 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 1 :ITERATIONS 25000 :COMPLETED
   25000 :BYTES 6400000 :HEAP-BYTES 65520 :RAW-TICKS 4290 :SECONDS 0.00429d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 171.6d0 :BYTES-PER-SECOND
   1.4918414918414917d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 3650340472 :SINK-LOW 91924045
     :EXPECTED-HIGH 3650340472 :EXPECTED-LOW 91924045 :RAW-TICKS 4240
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 1 :ITERATIONS 25000 :COMPLETED
   25000 :BYTES 6400000 :HEAP-BYTES 65520 :RAW-TICKS 4214 :SECONDS 0.004214d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 168.56d0 :BYTES-PER-SECOND
   1.5187470336971998d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 3650340472 :SINK-LOW 91924045
     :EXPECTED-HIGH 3650340472 :EXPECTED-LOW 91924045 :RAW-TICKS 4186
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 1 :ITERATIONS 25000 :COMPLETED
   25000 :BYTES 6400000 :HEAP-BYTES 65520 :RAW-TICKS 4243 :SECONDS 0.004243d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 169.72d0 :BYTES-PER-SECOND
   1.5083667216592033d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 3650340472 :SINK-LOW 91924045
     :EXPECTED-HIGH 3650340472 :EXPECTED-LOW 91924045 :RAW-TICKS 4217
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 1 :ITERATIONS 25000 :COMPLETED
   25000 :BYTES 6400000 :HEAP-BYTES 65520 :RAW-TICKS 4211 :SECONDS 0.004211d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 168.44d0 :BYTES-PER-SECOND
   1.5198290192353358d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 3650340472 :SINK-LOW 91924045
     :EXPECTED-HIGH 3650340472 :EXPECTED-LOW 91924045 :RAW-TICKS 4188
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 1 :ITERATIONS 25000 :COMPLETED
   25000 :BYTES 6400000 :HEAP-BYTES 65520 :RAW-TICKS 4246 :SECONDS 0.004246d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 169.84d0 :BYTES-PER-SECOND
   1.5073009891662743d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 3650340472 :SINK-LOW 91924045
     :EXPECTED-HIGH 3650340472 :EXPECTED-LOW 91924045 :RAW-TICKS 4221
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :MAX :REPLICA 0 :WORKERS 1 :ITERATIONS 25000 :COMPLETED 25000
   :BYTES 6400000 :HEAP-BYTES 65520 :RAW-TICKS 4213 :SECONDS 0.004213d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 168.52d0 :BYTES-PER-SECOND
   1.5191075243294566d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3822163365
     :SINK-LOW 3634861316 :EXPECTED-HIGH 3822163365 :EXPECTED-LOW 3634861316
     :RAW-TICKS 4187 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :MAX :REPLICA 1 :WORKERS 1 :ITERATIONS 25000 :COMPLETED 25000
   :BYTES 6400000 :HEAP-BYTES 65520 :RAW-TICKS 4237 :SECONDS 0.004237d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 169.48d0 :BYTES-PER-SECOND
   1.5105027141845644d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3822163365
     :SINK-LOW 3634861316 :EXPECTED-HIGH 3822163365 :EXPECTED-LOW 3634861316
     :RAW-TICKS 4212 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :MAX :REPLICA 2 :WORKERS 1 :ITERATIONS 25000 :COMPLETED 25000
   :BYTES 6400000 :HEAP-BYTES 65520 :RAW-TICKS 4199 :SECONDS 0.004199d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 167.96d0 :BYTES-PER-SECOND
   1.5241724220052395d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3822163365
     :SINK-LOW 3634861316 :EXPECTED-HIGH 3822163365 :EXPECTED-LOW 3634861316
     :RAW-TICKS 4177 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :MAX :REPLICA 3 :WORKERS 1 :ITERATIONS 25000 :COMPLETED 25000
   :BYTES 6400000 :HEAP-BYTES 65520 :RAW-TICKS 4241 :SECONDS 0.004241d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 169.64d0 :BYTES-PER-SECOND
   1.509078047630276d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3822163365
     :SINK-LOW 3634861316 :EXPECTED-HIGH 3822163365 :EXPECTED-LOW 3634861316
     :RAW-TICKS 4210 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :MAX :REPLICA 4 :WORKERS 1 :ITERATIONS 25000 :COMPLETED 25000
   :BYTES 6400000 :HEAP-BYTES 65520 :RAW-TICKS 4211 :SECONDS 0.004211d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 168.44d0 :BYTES-PER-SECOND
   1.5198290192353358d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3822163365
     :SINK-LOW 3634861316 :EXPECTED-HIGH 3822163365 :EXPECTED-LOW 3634861316
     :RAW-TICKS 4187 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 1 :ITERATIONS 6250 :COMPLETED 6250
   :BYTES 6400000 :HEAP-BYTES 65520 :RAW-TICKS 3770 :SECONDS 0.00377d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 603.2d0 :BYTES-PER-SECOND
   1.6976127320954907d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 314608995 :SINK-LOW 2823576381
     :EXPECTED-HIGH 314608995 :EXPECTED-LOW 2823576381 :RAW-TICKS 3753
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 1 :ITERATIONS 6250 :COMPLETED 6250
   :BYTES 6400000 :HEAP-BYTES 65520 :RAW-TICKS 3773 :SECONDS 0.003773d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 603.68d0 :BYTES-PER-SECOND
   1.6962629207527168d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 314608995 :SINK-LOW 2823576381
     :EXPECTED-HIGH 314608995 :EXPECTED-LOW 2823576381 :RAW-TICKS 3752
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 1 :ITERATIONS 6250 :COMPLETED 6250
   :BYTES 6400000 :HEAP-BYTES 65520 :RAW-TICKS 3779 :SECONDS 0.003779d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 604.64d0 :BYTES-PER-SECOND
   1.693569727441122d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 314608995 :SINK-LOW 2823576381
     :EXPECTED-HIGH 314608995 :EXPECTED-LOW 2823576381 :RAW-TICKS 3753
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 1 :ITERATIONS 6250 :COMPLETED 6250
   :BYTES 6400000 :HEAP-BYTES 65520 :RAW-TICKS 3774 :SECONDS 0.003774d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 603.84d0 :BYTES-PER-SECOND
   1.695813460519343d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 314608995 :SINK-LOW 2823576381
     :EXPECTED-HIGH 314608995 :EXPECTED-LOW 2823576381 :RAW-TICKS 3750
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 1 :ITERATIONS 6250 :COMPLETED 6250
   :BYTES 6400000 :HEAP-BYTES 65520 :RAW-TICKS 3767 :SECONDS 0.003767d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 602.72d0 :BYTES-PER-SECOND
   1.6989646933899655d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 314608995 :SINK-LOW 2823576381
     :EXPECTED-HIGH 314608995 :EXPECTED-LOW 2823576381 :RAW-TICKS 3745
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :MAX :REPLICA 0 :WORKERS 1 :ITERATIONS 6250 :COMPLETED 6250
   :BYTES 6400000 :HEAP-BYTES 65520 :RAW-TICKS 3771 :SECONDS 0.003771d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 603.36d0 :BYTES-PER-SECOND
   1.6971625563511004d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3518727484 :SINK-LOW
     598906486 :EXPECTED-HIGH 3518727484 :EXPECTED-LOW 598906486 :RAW-TICKS
     3747 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :MAX :REPLICA 1 :WORKERS 1 :ITERATIONS 6250 :COMPLETED 6250
   :BYTES 6400000 :HEAP-BYTES 65520 :RAW-TICKS 3779 :SECONDS 0.003779d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 604.64d0 :BYTES-PER-SECOND
   1.693569727441122d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3518727484 :SINK-LOW
     598906486 :EXPECTED-HIGH 3518727484 :EXPECTED-LOW 598906486 :RAW-TICKS
     3752 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :MAX :REPLICA 2 :WORKERS 1 :ITERATIONS 6250 :COMPLETED 6250
   :BYTES 6400000 :HEAP-BYTES 65520 :RAW-TICKS 3786 :SECONDS 0.003786d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 605.76d0 :BYTES-PER-SECOND
   1.6904384574749076d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3518727484 :SINK-LOW
     598906486 :EXPECTED-HIGH 3518727484 :EXPECTED-LOW 598906486 :RAW-TICKS
     3750 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :MAX :REPLICA 3 :WORKERS 1 :ITERATIONS 6250 :COMPLETED 6250
   :BYTES 6400000 :HEAP-BYTES 65520 :RAW-TICKS 3772 :SECONDS 0.003772d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 603.52d0 :BYTES-PER-SECOND
   1.696712619300106d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3518727484 :SINK-LOW
     598906486 :EXPECTED-HIGH 3518727484 :EXPECTED-LOW 598906486 :RAW-TICKS
     3745 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :MAX :REPLICA 4 :WORKERS 1 :ITERATIONS 6250 :COMPLETED 6250
   :BYTES 6400000 :HEAP-BYTES 65520 :RAW-TICKS 3790 :SECONDS 0.00379d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 606.4d0 :BYTES-PER-SECOND
   1.6886543535620053d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3518727484 :SINK-LOW
     598906486 :EXPECTED-HIGH 3518727484 :EXPECTED-LOW 598906486 :RAW-TICKS
     3751 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 1 :ITERATIONS 98 :COMPLETED 98
   :BYTES 6422430 :HEAP-BYTES 65520 :RAW-TICKS 3607 :SECONDS 0.003607d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 36806.12244897959d0 :BYTES-PER-SECOND
   1.7805461602439702d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2954450432 :SINK-LOW 4000006553
     :EXPECTED-HIGH 2954450432 :EXPECTED-LOW 4000006553 :RAW-TICKS 3586
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 1 :ITERATIONS 98 :COMPLETED 98
   :BYTES 6422430 :HEAP-BYTES 65520 :RAW-TICKS 3581 :SECONDS 0.003581d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 36540.816326530614d0 :BYTES-PER-SECOND
   1.7934738899748673d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2954450432 :SINK-LOW 4000006553
     :EXPECTED-HIGH 2954450432 :EXPECTED-LOW 4000006553 :RAW-TICKS 3562
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 1 :ITERATIONS 98 :COMPLETED 98
   :BYTES 6422430 :HEAP-BYTES 65520 :RAW-TICKS 3605 :SECONDS 0.003605d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 36785.71428571428d0 :BYTES-PER-SECOND
   1.7815339805825243d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2954450432 :SINK-LOW 4000006553
     :EXPECTED-HIGH 2954450432 :EXPECTED-LOW 4000006553 :RAW-TICKS 3579
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 1 :ITERATIONS 98 :COMPLETED 98
   :BYTES 6422430 :HEAP-BYTES 65520 :RAW-TICKS 3609 :SECONDS 0.003609d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 36826.5306122449d0 :BYTES-PER-SECOND
   1.7795594347464674d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2954450432 :SINK-LOW 4000006553
     :EXPECTED-HIGH 2954450432 :EXPECTED-LOW 4000006553 :RAW-TICKS 3580
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 1 :ITERATIONS 98 :COMPLETED 98
   :BYTES 6422430 :HEAP-BYTES 65520 :RAW-TICKS 3811 :SECONDS 0.003811d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 38887.755102040814d0 :BYTES-PER-SECOND
   1.6852348464969823d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2954450432 :SINK-LOW 4000006553
     :EXPECTED-HIGH 2954450432 :EXPECTED-LOW 4000006553 :RAW-TICKS 3772
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :MAX :REPLICA 0 :WORKERS 1 :ITERATIONS 98 :COMPLETED 98
   :BYTES 6422430 :HEAP-BYTES 65520 :RAW-TICKS 9676 :SECONDS 0.009676d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 98734.69387755102d0 :BYTES-PER-SECOND
   6.637484497726333d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 4158245344 :SINK-LOW
     2314362413 :EXPECTED-HIGH 4158245344 :EXPECTED-LOW 2314362413 :RAW-TICKS
     3534 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :MAX :REPLICA 1 :WORKERS 1 :ITERATIONS 98 :COMPLETED 98
   :BYTES 6422430 :HEAP-BYTES 65520 :RAW-TICKS 3595 :SECONDS 0.003595d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 36683.67346938775d0 :BYTES-PER-SECOND
   1.786489568845619d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 4158245344 :SINK-LOW
     2314362413 :EXPECTED-HIGH 4158245344 :EXPECTED-LOW 2314362413 :RAW-TICKS
     3573 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :MAX :REPLICA 2 :WORKERS 1 :ITERATIONS 98 :COMPLETED 98
   :BYTES 6422430 :HEAP-BYTES 65520 :RAW-TICKS 3585 :SECONDS 0.003585d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 36581.63265306123d0 :BYTES-PER-SECOND
   1.7914728033472803d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 4158245344 :SINK-LOW
     2314362413 :EXPECTED-HIGH 4158245344 :EXPECTED-LOW 2314362413 :RAW-TICKS
     3561 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :MAX :REPLICA 3 :WORKERS 1 :ITERATIONS 98 :COMPLETED 98
   :BYTES 6422430 :HEAP-BYTES 65520 :RAW-TICKS 3598 :SECONDS 0.003598d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 36714.28571428572d0 :BYTES-PER-SECOND
   1.785d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 4158245344 :SINK-LOW
     2314362413 :EXPECTED-HIGH 4158245344 :EXPECTED-LOW 2314362413 :RAW-TICKS
     3571 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :MAX :REPLICA 4 :WORKERS 1 :ITERATIONS 98 :COMPLETED 98
   :BYTES 6422430 :HEAP-BYTES 65520 :RAW-TICKS 3610 :SECONDS 0.00361d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 36836.73469387755d0 :BYTES-PER-SECOND
   1.7790664819944599d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 4158245344 :SINK-LOW
     2314362413 :EXPECTED-HIGH 4158245344 :EXPECTED-LOW 2314362413 :RAW-TICKS
     3580 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   0 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 0 :HEAP-BYTES 65520 :RAW-TICKS 1297 :SECONDS 0.001297d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 6.485d0 :BYTES-PER-SECOND 0.0d0
   :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 4014398263 :SINK-LOW 1373170073
     :EXPECTED-HIGH 4014398263 :EXPECTED-LOW 1373170073 :RAW-TICKS 1275
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 1186811877
     :SINK-LOW 1546318433 :EXPECTED-HIGH 1186811877 :EXPECTED-LOW 1546318433
     :RAW-TICKS 1285 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   0 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 0 :HEAP-BYTES 131040 :RAW-TICKS 1318 :SECONDS 0.001318d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 6.59d0 :BYTES-PER-SECOND 0.0d0
   :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 4014398263 :SINK-LOW 1373170073
     :EXPECTED-HIGH 4014398263 :EXPECTED-LOW 1373170073 :RAW-TICKS 1292
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 1186811877
     :SINK-LOW 1546318433 :EXPECTED-HIGH 1186811877 :EXPECTED-LOW 1546318433
     :RAW-TICKS 1293 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   0 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 0 :HEAP-BYTES 131040 :RAW-TICKS 1326 :SECONDS 0.001326d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 6.63d0 :BYTES-PER-SECOND 0.0d0
   :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 4014398263 :SINK-LOW 1373170073
     :EXPECTED-HIGH 4014398263 :EXPECTED-LOW 1373170073 :RAW-TICKS 1268
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 1186811877
     :SINK-LOW 1546318433 :EXPECTED-HIGH 1186811877 :EXPECTED-LOW 1546318433
     :RAW-TICKS 1309 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   0 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 0 :HEAP-BYTES 131040 :RAW-TICKS 1327 :SECONDS 0.001327d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 6.635d0 :BYTES-PER-SECOND 0.0d0
   :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 4014398263 :SINK-LOW 1373170073
     :EXPECTED-HIGH 4014398263 :EXPECTED-LOW 1373170073 :RAW-TICKS 1297
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 1186811877
     :SINK-LOW 1546318433 :EXPECTED-HIGH 1186811877 :EXPECTED-LOW 1546318433
     :RAW-TICKS 1295 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   0 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 0 :HEAP-BYTES 131040 :RAW-TICKS 1317 :SECONDS 0.001317d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 6.585d0 :BYTES-PER-SECOND 0.0d0
   :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 4014398263 :SINK-LOW 1373170073
     :EXPECTED-HIGH 4014398263 :EXPECTED-LOW 1373170073 :RAW-TICKS 1298
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 1186811877
     :SINK-LOW 1546318433 :EXPECTED-HIGH 1186811877 :EXPECTED-LOW 1546318433
     :RAW-TICKS 1277 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   0 :SEED-CASE :MAX :REPLICA 0 :WORKERS 2 :ITERATIONS 100000 :COMPLETED 200000
   :BYTES 0 :HEAP-BYTES 131040 :RAW-TICKS 1321 :SECONDS 0.001321d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 6.605d0 :BYTES-PER-SECOND 0.0d0
   :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 697257092
     :SINK-LOW 2991543168 :EXPECTED-HIGH 697257092 :EXPECTED-LOW 2991543168
     :RAW-TICKS 1281 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 3722978317
     :SINK-LOW 2816790877 :EXPECTED-HIGH 3722978317 :EXPECTED-LOW 2816790877
     :RAW-TICKS 1301 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   0 :SEED-CASE :MAX :REPLICA 1 :WORKERS 2 :ITERATIONS 100000 :COMPLETED 200000
   :BYTES 0 :HEAP-BYTES 131040 :RAW-TICKS 1320 :SECONDS 0.00132d0 :TIME-QUALITY
   :MEASURED :NS-PER-CALL 6.6d0 :BYTES-PER-SECOND 0.0d0 :COUNTER-SCOPE
   :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 697257092
     :SINK-LOW 2991543168 :EXPECTED-HIGH 697257092 :EXPECTED-LOW 2991543168
     :RAW-TICKS 1291 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 3722978317
     :SINK-LOW 2816790877 :EXPECTED-HIGH 3722978317 :EXPECTED-LOW 2816790877
     :RAW-TICKS 1300 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   0 :SEED-CASE :MAX :REPLICA 2 :WORKERS 2 :ITERATIONS 100000 :COMPLETED 200000
   :BYTES 0 :HEAP-BYTES 131040 :RAW-TICKS 1296 :SECONDS 0.001296d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 6.48d0 :BYTES-PER-SECOND 0.0d0
   :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 697257092
     :SINK-LOW 2991543168 :EXPECTED-HIGH 697257092 :EXPECTED-LOW 2991543168
     :RAW-TICKS 1277 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 3722978317
     :SINK-LOW 2816790877 :EXPECTED-HIGH 3722978317 :EXPECTED-LOW 2816790877
     :RAW-TICKS 1276 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   0 :SEED-CASE :MAX :REPLICA 3 :WORKERS 2 :ITERATIONS 100000 :COMPLETED 200000
   :BYTES 0 :HEAP-BYTES 131040 :RAW-TICKS 1307 :SECONDS 0.001307d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 6.535d0 :BYTES-PER-SECOND 0.0d0
   :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 697257092
     :SINK-LOW 2991543168 :EXPECTED-HIGH 697257092 :EXPECTED-LOW 2991543168
     :RAW-TICKS 1281 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 3722978317
     :SINK-LOW 2816790877 :EXPECTED-HIGH 3722978317 :EXPECTED-LOW 2816790877
     :RAW-TICKS 1295 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   0 :SEED-CASE :MAX :REPLICA 4 :WORKERS 2 :ITERATIONS 100000 :COMPLETED 200000
   :BYTES 0 :HEAP-BYTES 131040 :RAW-TICKS 1307 :SECONDS 0.001307d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 6.535d0 :BYTES-PER-SECOND 0.0d0
   :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 697257092
     :SINK-LOW 2991543168 :EXPECTED-HIGH 697257092 :EXPECTED-LOW 2991543168
     :RAW-TICKS 1277 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 3722978317
     :SINK-LOW 2816790877 :EXPECTED-HIGH 3722978317 :EXPECTED-LOW 2816790877
     :RAW-TICKS 1277 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 200000 :HEAP-BYTES 131040 :RAW-TICKS 1446 :SECONDS 0.001446d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 7.23d0 :BYTES-PER-SECOND
   1.3831258644536653d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2775575122 :SINK-LOW 1566858293
     :EXPECTED-HIGH 2775575122 :EXPECTED-LOW 1566858293 :RAW-TICKS 1422
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 904040975
     :SINK-LOW 1912771314 :EXPECTED-HIGH 904040975 :EXPECTED-LOW 1912771314
     :RAW-TICKS 1420 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 200000 :HEAP-BYTES 131040 :RAW-TICKS 1448 :SECONDS 0.001448d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 7.24d0 :BYTES-PER-SECOND
   1.3812154696132597d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2775575122 :SINK-LOW 1566858293
     :EXPECTED-HIGH 2775575122 :EXPECTED-LOW 1566858293 :RAW-TICKS 1425
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 904040975
     :SINK-LOW 1912771314 :EXPECTED-HIGH 904040975 :EXPECTED-LOW 1912771314
     :RAW-TICKS 1419 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 200000 :HEAP-BYTES 131040 :RAW-TICKS 1448 :SECONDS 0.001448d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 7.24d0 :BYTES-PER-SECOND
   1.3812154696132597d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2775575122 :SINK-LOW 1566858293
     :EXPECTED-HIGH 2775575122 :EXPECTED-LOW 1566858293 :RAW-TICKS 1429
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 904040975
     :SINK-LOW 1912771314 :EXPECTED-HIGH 904040975 :EXPECTED-LOW 1912771314
     :RAW-TICKS 1416 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 200000 :HEAP-BYTES 131040 :RAW-TICKS 1465 :SECONDS 0.001465d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 7.325d0 :BYTES-PER-SECOND
   1.3651877133105803d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2775575122 :SINK-LOW 1566858293
     :EXPECTED-HIGH 2775575122 :EXPECTED-LOW 1566858293 :RAW-TICKS 1410
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 904040975
     :SINK-LOW 1912771314 :EXPECTED-HIGH 904040975 :EXPECTED-LOW 1912771314
     :RAW-TICKS 1423 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 200000 :HEAP-BYTES 131040 :RAW-TICKS 1458 :SECONDS 0.001458d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 7.29d0 :BYTES-PER-SECOND
   1.3717421124828532d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2775575122 :SINK-LOW 1566858293
     :EXPECTED-HIGH 2775575122 :EXPECTED-LOW 1566858293 :RAW-TICKS 1429
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 904040975
     :SINK-LOW 1912771314 :EXPECTED-HIGH 904040975 :EXPECTED-LOW 1912771314
     :RAW-TICKS 1416 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1 :SEED-CASE :MAX :REPLICA 0 :WORKERS 2 :ITERATIONS 100000 :COMPLETED 200000
   :BYTES 200000 :HEAP-BYTES 131040 :RAW-TICKS 1440 :SECONDS 0.00144d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 7.2d0 :BYTES-PER-SECOND
   1.3888888888888887d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 2913883710
     :SINK-LOW 3003520362 :EXPECTED-HIGH 2913883710 :EXPECTED-LOW 3003520362
     :RAW-TICKS 1416 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 923570546
     :SINK-LOW 2656363360 :EXPECTED-HIGH 923570546 :EXPECTED-LOW 2656363360
     :RAW-TICKS 1419 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1 :SEED-CASE :MAX :REPLICA 1 :WORKERS 2 :ITERATIONS 100000 :COMPLETED 200000
   :BYTES 200000 :HEAP-BYTES 131040 :RAW-TICKS 1434 :SECONDS 0.001434d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 7.17d0 :BYTES-PER-SECOND
   1.394700139470014d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 2913883710
     :SINK-LOW 3003520362 :EXPECTED-HIGH 2913883710 :EXPECTED-LOW 3003520362
     :RAW-TICKS 1415 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 923570546
     :SINK-LOW 2656363360 :EXPECTED-HIGH 923570546 :EXPECTED-LOW 2656363360
     :RAW-TICKS 1426 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1 :SEED-CASE :MAX :REPLICA 2 :WORKERS 2 :ITERATIONS 100000 :COMPLETED 200000
   :BYTES 200000 :HEAP-BYTES 131040 :RAW-TICKS 1443 :SECONDS 0.001443d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 7.215d0 :BYTES-PER-SECOND
   1.386001386001386d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 2913883710
     :SINK-LOW 3003520362 :EXPECTED-HIGH 2913883710 :EXPECTED-LOW 3003520362
     :RAW-TICKS 1417 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 923570546
     :SINK-LOW 2656363360 :EXPECTED-HIGH 923570546 :EXPECTED-LOW 2656363360
     :RAW-TICKS 1414 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1 :SEED-CASE :MAX :REPLICA 3 :WORKERS 2 :ITERATIONS 100000 :COMPLETED 200000
   :BYTES 200000 :HEAP-BYTES 131040 :RAW-TICKS 1463 :SECONDS 0.001463d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 7.315d0 :BYTES-PER-SECOND
   1.367053998632946d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 2913883710
     :SINK-LOW 3003520362 :EXPECTED-HIGH 2913883710 :EXPECTED-LOW 3003520362
     :RAW-TICKS 1412 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 923570546
     :SINK-LOW 2656363360 :EXPECTED-HIGH 923570546 :EXPECTED-LOW 2656363360
     :RAW-TICKS 1420 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1 :SEED-CASE :MAX :REPLICA 4 :WORKERS 2 :ITERATIONS 100000 :COMPLETED 200000
   :BYTES 200000 :HEAP-BYTES 131040 :RAW-TICKS 1564 :SECONDS 0.001564d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 7.82d0 :BYTES-PER-SECOND
   1.278772378516624d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 2913883710
     :SINK-LOW 3003520362 :EXPECTED-HIGH 2913883710 :EXPECTED-LOW 3003520362
     :RAW-TICKS 1418 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 923570546
     :SINK-LOW 2656363360 :EXPECTED-HIGH 923570546 :EXPECTED-LOW 2656363360
     :RAW-TICKS 1539 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   7 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 1400000 :HEAP-BYTES 65520 :RAW-TICKS 2022 :SECONDS 0.002022d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 10.11d0 :BYTES-PER-SECOND
   6.923837784371909d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2383629478 :SINK-LOW 1558117133
     :EXPECTED-HIGH 2383629478 :EXPECTED-LOW 1558117133 :RAW-TICKS 1969
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 4045868682
     :SINK-LOW 4193195113 :EXPECTED-HIGH 4045868682 :EXPECTED-LOW 4193195113
     :RAW-TICKS 1981 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   7 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 1400000 :HEAP-BYTES 131040 :RAW-TICKS 2023 :SECONDS 0.002023d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 10.115d0 :BYTES-PER-SECOND
   6.920415224913495d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2383629478 :SINK-LOW 1558117133
     :EXPECTED-HIGH 2383629478 :EXPECTED-LOW 1558117133 :RAW-TICKS 1975
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 4045868682
     :SINK-LOW 4193195113 :EXPECTED-HIGH 4045868682 :EXPECTED-LOW 4193195113
     :RAW-TICKS 1973 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   7 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 1400000 :HEAP-BYTES 131040 :RAW-TICKS 2091 :SECONDS 0.002091d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 10.455d0 :BYTES-PER-SECOND
   6.695361071257771d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2383629478 :SINK-LOW 1558117133
     :EXPECTED-HIGH 2383629478 :EXPECTED-LOW 1558117133 :RAW-TICKS 2021
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 4045868682
     :SINK-LOW 4193195113 :EXPECTED-HIGH 4045868682 :EXPECTED-LOW 4193195113
     :RAW-TICKS 2073 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   7 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 1400000 :HEAP-BYTES 131040 :RAW-TICKS 2019 :SECONDS 0.002019d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 10.095d0 :BYTES-PER-SECOND
   6.934125804853889d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2383629478 :SINK-LOW 1558117133
     :EXPECTED-HIGH 2383629478 :EXPECTED-LOW 1558117133 :RAW-TICKS 1970
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 4045868682
     :SINK-LOW 4193195113 :EXPECTED-HIGH 4045868682 :EXPECTED-LOW 4193195113
     :RAW-TICKS 2003 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   7 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 1400000 :HEAP-BYTES 131040 :RAW-TICKS 2132 :SECONDS 0.002132d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 10.66d0 :BYTES-PER-SECOND
   6.566604127579737d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2383629478 :SINK-LOW 1558117133
     :EXPECTED-HIGH 2383629478 :EXPECTED-LOW 1558117133 :RAW-TICKS 2015
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 4045868682
     :SINK-LOW 4193195113 :EXPECTED-HIGH 4045868682 :EXPECTED-LOW 4193195113
     :RAW-TICKS 2115 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   7 :SEED-CASE :MAX :REPLICA 0 :WORKERS 2 :ITERATIONS 100000 :COMPLETED 200000
   :BYTES 1400000 :HEAP-BYTES 131040 :RAW-TICKS 1992 :SECONDS 0.001992d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 9.959999999999999d0 :BYTES-PER-SECOND
   7.028112449799198d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1617286543
     :SINK-LOW 2598239346 :EXPECTED-HIGH 1617286543 :EXPECTED-LOW 2598239346
     :RAW-TICKS 1967 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 3737399893
     :SINK-LOW 2162173856 :EXPECTED-HIGH 3737399893 :EXPECTED-LOW 2162173856
     :RAW-TICKS 1972 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   7 :SEED-CASE :MAX :REPLICA 1 :WORKERS 2 :ITERATIONS 100000 :COMPLETED 200000
   :BYTES 1400000 :HEAP-BYTES 131040 :RAW-TICKS 1993 :SECONDS 0.001993d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 9.965d0 :BYTES-PER-SECOND
   7.024586051179127d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1617286543
     :SINK-LOW 2598239346 :EXPECTED-HIGH 1617286543 :EXPECTED-LOW 2598239346
     :RAW-TICKS 1965 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 3737399893
     :SINK-LOW 2162173856 :EXPECTED-HIGH 3737399893 :EXPECTED-LOW 2162173856
     :RAW-TICKS 1970 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   7 :SEED-CASE :MAX :REPLICA 2 :WORKERS 2 :ITERATIONS 100000 :COMPLETED 200000
   :BYTES 1400000 :HEAP-BYTES 131040 :RAW-TICKS 2005 :SECONDS 0.002005d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 10.024999999999999d0 :BYTES-PER-SECOND
   6.982543640897756d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1617286543
     :SINK-LOW 2598239346 :EXPECTED-HIGH 1617286543 :EXPECTED-LOW 2598239346
     :RAW-TICKS 1962 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 3737399893
     :SINK-LOW 2162173856 :EXPECTED-HIGH 3737399893 :EXPECTED-LOW 2162173856
     :RAW-TICKS 1985 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   7 :SEED-CASE :MAX :REPLICA 3 :WORKERS 2 :ITERATIONS 100000 :COMPLETED 200000
   :BYTES 1400000 :HEAP-BYTES 131040 :RAW-TICKS 2043 :SECONDS 0.002043d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 10.215d0 :BYTES-PER-SECOND
   6.852667645619187d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1617286543
     :SINK-LOW 2598239346 :EXPECTED-HIGH 1617286543 :EXPECTED-LOW 2598239346
     :RAW-TICKS 2014 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 3737399893
     :SINK-LOW 2162173856 :EXPECTED-HIGH 3737399893 :EXPECTED-LOW 2162173856
     :RAW-TICKS 1981 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   7 :SEED-CASE :MAX :REPLICA 4 :WORKERS 2 :ITERATIONS 100000 :COMPLETED 200000
   :BYTES 1400000 :HEAP-BYTES 131040 :RAW-TICKS 2483 :SECONDS 0.002483d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 12.415d0 :BYTES-PER-SECOND
   5.638340716874748d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1617286543
     :SINK-LOW 2598239346 :EXPECTED-HIGH 1617286543 :EXPECTED-LOW 2598239346
     :RAW-TICKS 2397 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 3737399893
     :SINK-LOW 2162173856 :EXPECTED-HIGH 3737399893 :EXPECTED-LOW 2162173856
     :RAW-TICKS 2457 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   8 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 1600000 :HEAP-BYTES 131040 :RAW-TICKS 2008 :SECONDS 0.002008d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 10.04d0 :BYTES-PER-SECOND
   7.968127490039841d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 702377167 :SINK-LOW 3479502890
     :EXPECTED-HIGH 702377167 :EXPECTED-LOW 3479502890 :RAW-TICKS 1925
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3141161100
     :SINK-LOW 48415383 :EXPECTED-HIGH 3141161100 :EXPECTED-LOW 48415383
     :RAW-TICKS 1987 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   8 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 1600000 :HEAP-BYTES 131040 :RAW-TICKS 1990 :SECONDS 0.00199d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 9.95d0 :BYTES-PER-SECOND
   8.040201005025126d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 702377167 :SINK-LOW 3479502890
     :EXPECTED-HIGH 702377167 :EXPECTED-LOW 3479502890 :RAW-TICKS 1950
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3141161100
     :SINK-LOW 48415383 :EXPECTED-HIGH 3141161100 :EXPECTED-LOW 48415383
     :RAW-TICKS 1926 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   8 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 1600000 :HEAP-BYTES 131040 :RAW-TICKS 2058 :SECONDS 0.002058d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 10.29d0 :BYTES-PER-SECOND
   7.774538386783285d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 702377167 :SINK-LOW 3479502890
     :EXPECTED-HIGH 702377167 :EXPECTED-LOW 3479502890 :RAW-TICKS 2034
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3141161100
     :SINK-LOW 48415383 :EXPECTED-HIGH 3141161100 :EXPECTED-LOW 48415383
     :RAW-TICKS 1910 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   8 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 1600000 :HEAP-BYTES 131040 :RAW-TICKS 2296 :SECONDS 0.002296d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 11.48d0 :BYTES-PER-SECOND
   6.968641114982579d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 702377167 :SINK-LOW 3479502890
     :EXPECTED-HIGH 702377167 :EXPECTED-LOW 3479502890 :RAW-TICKS 2241
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3141161100
     :SINK-LOW 48415383 :EXPECTED-HIGH 3141161100 :EXPECTED-LOW 48415383
     :RAW-TICKS 2173 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   8 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 1600000 :HEAP-BYTES 131040 :RAW-TICKS 2114 :SECONDS 0.002114d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 10.57d0 :BYTES-PER-SECOND
   7.568590350047303d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 702377167 :SINK-LOW 3479502890
     :EXPECTED-HIGH 702377167 :EXPECTED-LOW 3479502890 :RAW-TICKS 2063
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3141161100
     :SINK-LOW 48415383 :EXPECTED-HIGH 3141161100 :EXPECTED-LOW 48415383
     :RAW-TICKS 1901 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   8 :SEED-CASE :MAX :REPLICA 0 :WORKERS 2 :ITERATIONS 100000 :COMPLETED 200000
   :BYTES 1600000 :HEAP-BYTES 131040 :RAW-TICKS 2513 :SECONDS 0.002513d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 12.565d0 :BYTES-PER-SECOND
   6.366892160764027d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 4030851251
     :SINK-LOW 530277268 :EXPECTED-HIGH 4030851251 :EXPECTED-LOW 530277268
     :RAW-TICKS 2049 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 3233511409
     :SINK-LOW 4219093468 :EXPECTED-HIGH 3233511409 :EXPECTED-LOW 4219093468
     :RAW-TICKS 2487 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   8 :SEED-CASE :MAX :REPLICA 1 :WORKERS 2 :ITERATIONS 100000 :COMPLETED 200000
   :BYTES 1600000 :HEAP-BYTES 131040 :RAW-TICKS 1960 :SECONDS 0.00196d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 9.8d0 :BYTES-PER-SECOND
   8.16326530612245d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 4030851251
     :SINK-LOW 530277268 :EXPECTED-HIGH 4030851251 :EXPECTED-LOW 530277268
     :RAW-TICKS 1905 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 3233511409
     :SINK-LOW 4219093468 :EXPECTED-HIGH 3233511409 :EXPECTED-LOW 4219093468
     :RAW-TICKS 1900 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   8 :SEED-CASE :MAX :REPLICA 2 :WORKERS 2 :ITERATIONS 100000 :COMPLETED 200000
   :BYTES 1600000 :HEAP-BYTES 131040 :RAW-TICKS 2098 :SECONDS 0.002098d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 10.49d0 :BYTES-PER-SECOND
   7.626310772163966d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 4030851251
     :SINK-LOW 530277268 :EXPECTED-HIGH 4030851251 :EXPECTED-LOW 530277268
     :RAW-TICKS 1952 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 3233511409
     :SINK-LOW 4219093468 :EXPECTED-HIGH 3233511409 :EXPECTED-LOW 4219093468
     :RAW-TICKS 2074 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   8 :SEED-CASE :MAX :REPLICA 3 :WORKERS 2 :ITERATIONS 100000 :COMPLETED 200000
   :BYTES 1600000 :HEAP-BYTES 131040 :RAW-TICKS 2194 :SECONDS 0.002194d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 10.97d0 :BYTES-PER-SECOND
   7.292616226071103d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 4030851251
     :SINK-LOW 530277268 :EXPECTED-HIGH 4030851251 :EXPECTED-LOW 530277268
     :RAW-TICKS 1909 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 3233511409
     :SINK-LOW 4219093468 :EXPECTED-HIGH 3233511409 :EXPECTED-LOW 4219093468
     :RAW-TICKS 2156 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   8 :SEED-CASE :MAX :REPLICA 4 :WORKERS 2 :ITERATIONS 100000 :COMPLETED 200000
   :BYTES 1600000 :HEAP-BYTES 131040 :RAW-TICKS 1932 :SECONDS 0.001932d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 9.66d0 :BYTES-PER-SECOND
   8.281573498964803d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 4030851251
     :SINK-LOW 530277268 :EXPECTED-HIGH 4030851251 :EXPECTED-LOW 530277268
     :RAW-TICKS 1904 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 3233511409
     :SINK-LOW 4219093468 :EXPECTED-HIGH 3233511409 :EXPECTED-LOW 4219093468
     :RAW-TICKS 1910 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 3200000 :HEAP-BYTES 131040 :RAW-TICKS 2603 :SECONDS 0.002603d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 13.015d0 :BYTES-PER-SECOND
   1.2293507491356127d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2488434274 :SINK-LOW 3965313052
     :EXPECTED-HIGH 2488434274 :EXPECTED-LOW 3965313052 :RAW-TICKS 2576
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 2663371641
     :SINK-LOW 3498500992 :EXPECTED-HIGH 2663371641 :EXPECTED-LOW 3498500992
     :RAW-TICKS 2576 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 3200000 :HEAP-BYTES 131040 :RAW-TICKS 2595 :SECONDS 0.002595d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 12.975d0 :BYTES-PER-SECOND
   1.233140655105973d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2488434274 :SINK-LOW 3965313052
     :EXPECTED-HIGH 2488434274 :EXPECTED-LOW 3965313052 :RAW-TICKS 2570
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 2663371641
     :SINK-LOW 3498500992 :EXPECTED-HIGH 2663371641 :EXPECTED-LOW 3498500992
     :RAW-TICKS 2571 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 3200000 :HEAP-BYTES 131040 :RAW-TICKS 2604 :SECONDS 0.002604d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 13.02d0 :BYTES-PER-SECOND
   1.228878648233487d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2488434274 :SINK-LOW 3965313052
     :EXPECTED-HIGH 2488434274 :EXPECTED-LOW 3965313052 :RAW-TICKS 2574
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 2663371641
     :SINK-LOW 3498500992 :EXPECTED-HIGH 2663371641 :EXPECTED-LOW 3498500992
     :RAW-TICKS 2574 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 3200000 :HEAP-BYTES 131040 :RAW-TICKS 2597 :SECONDS 0.002597d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 12.985d0 :BYTES-PER-SECOND
   1.2321909896033885d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2488434274 :SINK-LOW 3965313052
     :EXPECTED-HIGH 2488434274 :EXPECTED-LOW 3965313052 :RAW-TICKS 2571
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 2663371641
     :SINK-LOW 3498500992 :EXPECTED-HIGH 2663371641 :EXPECTED-LOW 3498500992
     :RAW-TICKS 2577 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 3200000 :HEAP-BYTES 131040 :RAW-TICKS 2589 :SECONDS 0.002589d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 12.945d0 :BYTES-PER-SECOND
   1.2359984550019312d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2488434274 :SINK-LOW 3965313052
     :EXPECTED-HIGH 2488434274 :EXPECTED-LOW 3965313052 :RAW-TICKS 2570
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 2663371641
     :SINK-LOW 3498500992 :EXPECTED-HIGH 2663371641 :EXPECTED-LOW 3498500992
     :RAW-TICKS 2564 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :MAX :REPLICA 0 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 3200000 :HEAP-BYTES 131040 :RAW-TICKS 2596 :SECONDS 0.002596d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 12.98d0 :BYTES-PER-SECOND
   1.2326656394453006d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1968933113
     :SINK-LOW 2654859235 :EXPECTED-HIGH 1968933113 :EXPECTED-LOW 2654859235
     :RAW-TICKS 2576 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 720460080
     :SINK-LOW 2942183124 :EXPECTED-HIGH 720460080 :EXPECTED-LOW 2942183124
     :RAW-TICKS 2571 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :MAX :REPLICA 1 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 3200000 :HEAP-BYTES 131040 :RAW-TICKS 2590 :SECONDS 0.00259d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 12.95d0 :BYTES-PER-SECOND
   1.2355212355212357d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1968933113
     :SINK-LOW 2654859235 :EXPECTED-HIGH 1968933113 :EXPECTED-LOW 2654859235
     :RAW-TICKS 2570 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 720460080
     :SINK-LOW 2942183124 :EXPECTED-HIGH 720460080 :EXPECTED-LOW 2942183124
     :RAW-TICKS 2573 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :MAX :REPLICA 2 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 3200000 :HEAP-BYTES 131040 :RAW-TICKS 2605 :SECONDS 0.002605d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 13.025d0 :BYTES-PER-SECOND
   1.2284069097888675d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1968933113
     :SINK-LOW 2654859235 :EXPECTED-HIGH 1968933113 :EXPECTED-LOW 2654859235
     :RAW-TICKS 2580 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 720460080
     :SINK-LOW 2942183124 :EXPECTED-HIGH 720460080 :EXPECTED-LOW 2942183124
     :RAW-TICKS 2576 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :MAX :REPLICA 3 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 3200000 :HEAP-BYTES 131040 :RAW-TICKS 2651 :SECONDS 0.002651d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 13.255d0 :BYTES-PER-SECOND
   1.2070916635231988d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1968933113
     :SINK-LOW 2654859235 :EXPECTED-HIGH 1968933113 :EXPECTED-LOW 2654859235
     :RAW-TICKS 2573 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 720460080
     :SINK-LOW 2942183124 :EXPECTED-HIGH 720460080 :EXPECTED-LOW 2942183124
     :RAW-TICKS 2587 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :MAX :REPLICA 4 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 3200000 :HEAP-BYTES 131040 :RAW-TICKS 2614 :SECONDS 0.002614d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 13.07d0 :BYTES-PER-SECOND
   1.224177505738332d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1968933113
     :SINK-LOW 2654859235 :EXPECTED-HIGH 1968933113 :EXPECTED-LOW 2654859235
     :RAW-TICKS 2572 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 720460080
     :SINK-LOW 2942183124 :EXPECTED-HIGH 720460080 :EXPECTED-LOW 2942183124
     :RAW-TICKS 2571 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 6200000 :HEAP-BYTES 131040 :RAW-TICKS 3914 :SECONDS 0.003914d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.57d0 :BYTES-PER-SECOND
   1.5840572304547777d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 1146898289 :SINK-LOW 3956010695
     :EXPECTED-HIGH 1146898289 :EXPECTED-LOW 3956010695 :RAW-TICKS 3870
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3369139433
     :SINK-LOW 218486121 :EXPECTED-HIGH 3369139433 :EXPECTED-LOW 218486121
     :RAW-TICKS 3880 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 6200000 :HEAP-BYTES 131040 :RAW-TICKS 3943 :SECONDS 0.003943d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.715000000000003d0 :BYTES-PER-SECOND
   1.5724067968551862d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 1146898289 :SINK-LOW 3956010695
     :EXPECTED-HIGH 1146898289 :EXPECTED-LOW 3956010695 :RAW-TICKS 3875
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3369139433
     :SINK-LOW 218486121 :EXPECTED-HIGH 3369139433 :EXPECTED-LOW 218486121
     :RAW-TICKS 3879 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 6200000 :HEAP-BYTES 131040 :RAW-TICKS 3900 :SECONDS 0.0039d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.5d0 :BYTES-PER-SECOND
   1.5897435897435899d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 1146898289 :SINK-LOW 3956010695
     :EXPECTED-HIGH 1146898289 :EXPECTED-LOW 3956010695 :RAW-TICKS 3874
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3369139433
     :SINK-LOW 218486121 :EXPECTED-HIGH 3369139433 :EXPECTED-LOW 218486121
     :RAW-TICKS 3884 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 6200000 :HEAP-BYTES 131040 :RAW-TICKS 3900 :SECONDS 0.0039d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.5d0 :BYTES-PER-SECOND
   1.5897435897435899d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 1146898289 :SINK-LOW 3956010695
     :EXPECTED-HIGH 1146898289 :EXPECTED-LOW 3956010695 :RAW-TICKS 3871
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3369139433
     :SINK-LOW 218486121 :EXPECTED-HIGH 3369139433 :EXPECTED-LOW 218486121
     :RAW-TICKS 3888 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 6200000 :HEAP-BYTES 131040 :RAW-TICKS 3912 :SECONDS 0.003912d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.56d0 :BYTES-PER-SECOND
   1.5848670756646218d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 1146898289 :SINK-LOW 3956010695
     :EXPECTED-HIGH 1146898289 :EXPECTED-LOW 3956010695 :RAW-TICKS 3875
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3369139433
     :SINK-LOW 218486121 :EXPECTED-HIGH 3369139433 :EXPECTED-LOW 218486121
     :RAW-TICKS 3891 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :MAX :REPLICA 0 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 6200000 :HEAP-BYTES 131040 :RAW-TICKS 3905 :SECONDS 0.003905d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.525d0 :BYTES-PER-SECOND
   1.587708066581306d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3805149864
     :SINK-LOW 3424211333 :EXPECTED-HIGH 3805149864 :EXPECTED-LOW 3424211333
     :RAW-TICKS 3875 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 2964015274
     :SINK-LOW 2798110636 :EXPECTED-HIGH 2964015274 :EXPECTED-LOW 2798110636
     :RAW-TICKS 3887 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :MAX :REPLICA 1 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 6200000 :HEAP-BYTES 131040 :RAW-TICKS 3942 :SECONDS 0.003942d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.71d0 :BYTES-PER-SECOND
   1.5728056823947234d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3805149864
     :SINK-LOW 3424211333 :EXPECTED-HIGH 3805149864 :EXPECTED-LOW 3424211333
     :RAW-TICKS 3869 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 2964015274
     :SINK-LOW 2798110636 :EXPECTED-HIGH 2964015274 :EXPECTED-LOW 2798110636
     :RAW-TICKS 3920 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :MAX :REPLICA 2 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 6200000 :HEAP-BYTES 131040 :RAW-TICKS 3920 :SECONDS 0.00392d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.6d0 :BYTES-PER-SECOND
   1.5816326530612245d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3805149864
     :SINK-LOW 3424211333 :EXPECTED-HIGH 3805149864 :EXPECTED-LOW 3424211333
     :RAW-TICKS 3865 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 2964015274
     :SINK-LOW 2798110636 :EXPECTED-HIGH 2964015274 :EXPECTED-LOW 2798110636
     :RAW-TICKS 3886 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :MAX :REPLICA 3 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 6200000 :HEAP-BYTES 131040 :RAW-TICKS 3916 :SECONDS 0.003916d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.58d0 :BYTES-PER-SECOND
   1.5832482124616954d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3805149864
     :SINK-LOW 3424211333 :EXPECTED-HIGH 3805149864 :EXPECTED-LOW 3424211333
     :RAW-TICKS 3862 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 2964015274
     :SINK-LOW 2798110636 :EXPECTED-HIGH 2964015274 :EXPECTED-LOW 2798110636
     :RAW-TICKS 3885 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :MAX :REPLICA 4 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 6200000 :HEAP-BYTES 131040 :RAW-TICKS 3921 :SECONDS 0.003921d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.605d0 :BYTES-PER-SECOND
   1.5812292782453456d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3805149864
     :SINK-LOW 3424211333 :EXPECTED-HIGH 3805149864 :EXPECTED-LOW 3424211333
     :RAW-TICKS 3867 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 2964015274
     :SINK-LOW 2798110636 :EXPECTED-HIGH 2964015274 :EXPECTED-LOW 2798110636
     :RAW-TICKS 3894 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 6400000 :HEAP-BYTES 131040 :RAW-TICKS 4232 :SECONDS 0.004232d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 21.16d0 :BYTES-PER-SECOND
   1.5122873345935729d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 3363602882 :SINK-LOW 1789286091
     :EXPECTED-HIGH 3363602882 :EXPECTED-LOW 1789286091 :RAW-TICKS 4173
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3201968708
     :SINK-LOW 1702133910 :EXPECTED-HIGH 3201968708 :EXPECTED-LOW 1702133910
     :RAW-TICKS 4213 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 6400000 :HEAP-BYTES 131040 :RAW-TICKS 4093 :SECONDS 0.004093d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 20.465000000000003d0 :BYTES-PER-SECOND
   1.5636452479843636d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 3363602882 :SINK-LOW 1789286091
     :EXPECTED-HIGH 3363602882 :EXPECTED-LOW 1789286091 :RAW-TICKS 4060
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3201968708
     :SINK-LOW 1702133910 :EXPECTED-HIGH 3201968708 :EXPECTED-LOW 1702133910
     :RAW-TICKS 4023 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 6400000 :HEAP-BYTES 131040 :RAW-TICKS 4003 :SECONDS 0.004003d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 20.014999999999997d0 :BYTES-PER-SECOND
   1.598800899325506d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 3363602882 :SINK-LOW 1789286091
     :EXPECTED-HIGH 3363602882 :EXPECTED-LOW 1789286091 :RAW-TICKS 3978
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3201968708
     :SINK-LOW 1702133910 :EXPECTED-HIGH 3201968708 :EXPECTED-LOW 1702133910
     :RAW-TICKS 3976 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 4028 :SECONDS 0.004028d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 20.14d0 :BYTES-PER-SECOND
   1.5888778550148957d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 3363602882 :SINK-LOW 1789286091
     :EXPECTED-HIGH 3363602882 :EXPECTED-LOW 1789286091 :RAW-TICKS 3991
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3201968708
     :SINK-LOW 1702133910 :EXPECTED-HIGH 3201968708 :EXPECTED-LOW 1702133910
     :RAW-TICKS 3975 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 6400000 :HEAP-BYTES 131040 :RAW-TICKS 4057 :SECONDS 0.004057d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 20.285d0 :BYTES-PER-SECOND
   1.5775203352230713d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 3363602882 :SINK-LOW 1789286091
     :EXPECTED-HIGH 3363602882 :EXPECTED-LOW 1789286091 :RAW-TICKS 3990
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3201968708
     :SINK-LOW 1702133910 :EXPECTED-HIGH 3201968708 :EXPECTED-LOW 1702133910
     :RAW-TICKS 4030 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :MAX :REPLICA 0 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 6400000 :HEAP-BYTES 131040 :RAW-TICKS 4026 :SECONDS 0.004026d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 20.13d0 :BYTES-PER-SECOND
   1.5896671634376552d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1949789789
     :SINK-LOW 2753243215 :EXPECTED-HIGH 1949789789 :EXPECTED-LOW 2753243215
     :RAW-TICKS 4006 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 510052928
     :SINK-LOW 585018757 :EXPECTED-HIGH 510052928 :EXPECTED-LOW 585018757
     :RAW-TICKS 3976 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :MAX :REPLICA 1 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 6400000 :HEAP-BYTES 131040 :RAW-TICKS 4037 :SECONDS 0.004037d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 20.185d0 :BYTES-PER-SECOND
   1.5853356452811494d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1949789789
     :SINK-LOW 2753243215 :EXPECTED-HIGH 1949789789 :EXPECTED-LOW 2753243215
     :RAW-TICKS 3991 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 510052928
     :SINK-LOW 585018757 :EXPECTED-HIGH 510052928 :EXPECTED-LOW 585018757
     :RAW-TICKS 4017 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :MAX :REPLICA 2 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 6400000 :HEAP-BYTES 131040 :RAW-TICKS 4021 :SECONDS 0.004021d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 20.105000000000004d0 :BYTES-PER-SECOND
   1.591643869684158d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1949789789
     :SINK-LOW 2753243215 :EXPECTED-HIGH 1949789789 :EXPECTED-LOW 2753243215
     :RAW-TICKS 3991 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 510052928
     :SINK-LOW 585018757 :EXPECTED-HIGH 510052928 :EXPECTED-LOW 585018757
     :RAW-TICKS 3994 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :MAX :REPLICA 3 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 6400000 :HEAP-BYTES 131040 :RAW-TICKS 4010 :SECONDS 0.00401d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 20.049999999999997d0 :BYTES-PER-SECOND
   1.5960099750623443d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1949789789
     :SINK-LOW 2753243215 :EXPECTED-HIGH 1949789789 :EXPECTED-LOW 2753243215
     :RAW-TICKS 3989 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 510052928
     :SINK-LOW 585018757 :EXPECTED-HIGH 510052928 :EXPECTED-LOW 585018757
     :RAW-TICKS 3980 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :MAX :REPLICA 4 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 6400000 :HEAP-BYTES 131040 :RAW-TICKS 4023 :SECONDS 0.004023d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 20.115d0 :BYTES-PER-SECOND
   1.590852597564007d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1949789789
     :SINK-LOW 2753243215 :EXPECTED-HIGH 1949789789 :EXPECTED-LOW 2753243215
     :RAW-TICKS 3994 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 510052928
     :SINK-LOW 585018757 :EXPECTED-HIGH 510052928 :EXPECTED-LOW 585018757
     :RAW-TICKS 3992 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 6600000 :HEAP-BYTES 131040 :RAW-TICKS 4243 :SECONDS 0.004243d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 21.215d0 :BYTES-PER-SECOND
   1.5555031817110534d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 788434019 :SINK-LOW 1354428606
     :EXPECTED-HIGH 788434019 :EXPECTED-LOW 1354428606 :RAW-TICKS 4170
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3430793333
     :SINK-LOW 121908282 :EXPECTED-HIGH 3430793333 :EXPECTED-LOW 121908282
     :RAW-TICKS 4224 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 6600000 :HEAP-BYTES 131040 :RAW-TICKS 4225 :SECONDS 0.004225d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 21.125d0 :BYTES-PER-SECOND
   1.5621301775147932d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 788434019 :SINK-LOW 1354428606
     :EXPECTED-HIGH 788434019 :EXPECTED-LOW 1354428606 :RAW-TICKS 4165
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3430793333
     :SINK-LOW 121908282 :EXPECTED-HIGH 3430793333 :EXPECTED-LOW 121908282
     :RAW-TICKS 4205 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 6600000 :HEAP-BYTES 131040 :RAW-TICKS 4207 :SECONDS 0.004207d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 21.035d0 :BYTES-PER-SECOND
   1.5688138816258616d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 788434019 :SINK-LOW 1354428606
     :EXPECTED-HIGH 788434019 :EXPECTED-LOW 1354428606 :RAW-TICKS 4163
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3430793333
     :SINK-LOW 121908282 :EXPECTED-HIGH 3430793333 :EXPECTED-LOW 121908282
     :RAW-TICKS 4186 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 6600000 :HEAP-BYTES 131040 :RAW-TICKS 4189 :SECONDS 0.004189d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 20.945d0 :BYTES-PER-SECOND
   1.575555025065648d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 788434019 :SINK-LOW 1354428606
     :EXPECTED-HIGH 788434019 :EXPECTED-LOW 1354428606 :RAW-TICKS 4164
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3430793333
     :SINK-LOW 121908282 :EXPECTED-HIGH 3430793333 :EXPECTED-LOW 121908282
     :RAW-TICKS 4177 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 6600000 :HEAP-BYTES 131040 :RAW-TICKS 4180 :SECONDS 0.00418d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 20.9d0 :BYTES-PER-SECOND
   1.5789473684210527d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 788434019 :SINK-LOW 1354428606
     :EXPECTED-HIGH 788434019 :EXPECTED-LOW 1354428606 :RAW-TICKS 4162
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3430793333
     :SINK-LOW 121908282 :EXPECTED-HIGH 3430793333 :EXPECTED-LOW 121908282
     :RAW-TICKS 4159 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :MAX :REPLICA 0 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 6600000 :HEAP-BYTES 131040 :RAW-TICKS 4175 :SECONDS 0.004175d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 20.875d0 :BYTES-PER-SECOND
   1.5808383233532934d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 246156341
     :SINK-LOW 3263108042 :EXPECTED-HIGH 246156341 :EXPECTED-LOW 3263108042
     :RAW-TICKS 4152 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1447544752
     :SINK-LOW 3400689237 :EXPECTED-HIGH 1447544752 :EXPECTED-LOW 3400689237
     :RAW-TICKS 4162 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :MAX :REPLICA 1 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 6600000 :HEAP-BYTES 131040 :RAW-TICKS 4449 :SECONDS 0.004449d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 22.245d0 :BYTES-PER-SECOND
   1.48347943358058d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 246156341
     :SINK-LOW 3263108042 :EXPECTED-HIGH 246156341 :EXPECTED-LOW 3263108042
     :RAW-TICKS 4425 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1447544752
     :SINK-LOW 3400689237 :EXPECTED-HIGH 1447544752 :EXPECTED-LOW 3400689237
     :RAW-TICKS 4338 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :MAX :REPLICA 2 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 6600000 :HEAP-BYTES 131040 :RAW-TICKS 4200 :SECONDS 0.0042d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 21.0d0 :BYTES-PER-SECOND
   1.5714285714285715d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 246156341
     :SINK-LOW 3263108042 :EXPECTED-HIGH 246156341 :EXPECTED-LOW 3263108042
     :RAW-TICKS 4175 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1447544752
     :SINK-LOW 3400689237 :EXPECTED-HIGH 1447544752 :EXPECTED-LOW 3400689237
     :RAW-TICKS 4147 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :MAX :REPLICA 3 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 6600000 :HEAP-BYTES 131040 :RAW-TICKS 4194 :SECONDS 0.004194d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 20.97d0 :BYTES-PER-SECOND
   1.5736766809728184d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 246156341
     :SINK-LOW 3263108042 :EXPECTED-HIGH 246156341 :EXPECTED-LOW 3263108042
     :RAW-TICKS 4171 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1447544752
     :SINK-LOW 3400689237 :EXPECTED-HIGH 1447544752 :EXPECTED-LOW 3400689237
     :RAW-TICKS 4161 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :MAX :REPLICA 4 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 6600000 :HEAP-BYTES 131040 :RAW-TICKS 4201 :SECONDS 0.004201d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 21.005d0 :BYTES-PER-SECOND
   1.5710545108307545d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 246156341
     :SINK-LOW 3263108042 :EXPECTED-HIGH 246156341 :EXPECTED-LOW 3263108042
     :RAW-TICKS 4176 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1447544752
     :SINK-LOW 3400689237 :EXPECTED-HIGH 1447544752 :EXPECTED-LOW 3400689237
     :RAW-TICKS 4172 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 12800000 :HEAP-BYTES 131040 :RAW-TICKS 6080 :SECONDS 0.00608d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 30.4d0 :BYTES-PER-SECOND
   2.1052631578947368d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 931690014 :SINK-LOW 3112436852
     :EXPECTED-HIGH 931690014 :EXPECTED-LOW 3112436852 :RAW-TICKS 6050
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 1505835051
     :SINK-LOW 3743177252 :EXPECTED-HIGH 1505835051 :EXPECTED-LOW 3743177252
     :RAW-TICKS 5857 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 12800000 :HEAP-BYTES 131040 :RAW-TICKS 5894 :SECONDS
   0.005894d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 29.47d0 :BYTES-PER-SECOND
   2.171700033932813d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 931690014 :SINK-LOW 3112436852
     :EXPECTED-HIGH 931690014 :EXPECTED-LOW 3112436852 :RAW-TICKS 5860
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 1505835051
     :SINK-LOW 3743177252 :EXPECTED-HIGH 1505835051 :EXPECTED-LOW 3743177252
     :RAW-TICKS 5878 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 12800000 :HEAP-BYTES 131040 :RAW-TICKS 5867 :SECONDS
   0.005867d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 29.335d0 :BYTES-PER-SECOND
   2.181694221919209d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 931690014 :SINK-LOW 3112436852
     :EXPECTED-HIGH 931690014 :EXPECTED-LOW 3112436852 :RAW-TICKS 5844
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 1505835051
     :SINK-LOW 3743177252 :EXPECTED-HIGH 1505835051 :EXPECTED-LOW 3743177252
     :RAW-TICKS 5851 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 12800000 :HEAP-BYTES 131040 :RAW-TICKS 5866 :SECONDS
   0.005866d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 29.33d0 :BYTES-PER-SECOND
   2.1820661438799863d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 931690014 :SINK-LOW 3112436852
     :EXPECTED-HIGH 931690014 :EXPECTED-LOW 3112436852 :RAW-TICKS 5841
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 1505835051
     :SINK-LOW 3743177252 :EXPECTED-HIGH 1505835051 :EXPECTED-LOW 3743177252
     :RAW-TICKS 5842 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 12800000 :HEAP-BYTES 131040 :RAW-TICKS 5935 :SECONDS
   0.005935d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 29.675d0 :BYTES-PER-SECOND
   2.156697556866049d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 931690014 :SINK-LOW 3112436852
     :EXPECTED-HIGH 931690014 :EXPECTED-LOW 3112436852 :RAW-TICKS 5828
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 1505835051
     :SINK-LOW 3743177252 :EXPECTED-HIGH 1505835051 :EXPECTED-LOW 3743177252
     :RAW-TICKS 5852 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :MAX :REPLICA 0 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 12800000 :HEAP-BYTES 131040 :RAW-TICKS 6024 :SECONDS
   0.006024d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 30.12d0 :BYTES-PER-SECOND
   2.1248339973439577d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1854669567
     :SINK-LOW 3500381958 :EXPECTED-HIGH 1854669567 :EXPECTED-LOW 3500381958
     :RAW-TICKS 5859 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1416522479
     :SINK-LOW 2753777158 :EXPECTED-HIGH 1416522479 :EXPECTED-LOW 2753777158
     :RAW-TICKS 6008 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :MAX :REPLICA 1 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 12800000 :HEAP-BYTES 131040 :RAW-TICKS 5916 :SECONDS
   0.005916d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 29.58d0 :BYTES-PER-SECOND
   2.1636240703177824d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1854669567
     :SINK-LOW 3500381958 :EXPECTED-HIGH 1854669567 :EXPECTED-LOW 3500381958
     :RAW-TICKS 5855 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1416522479
     :SINK-LOW 2753777158 :EXPECTED-HIGH 1416522479 :EXPECTED-LOW 2753777158
     :RAW-TICKS 5893 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :MAX :REPLICA 2 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 12800000 :HEAP-BYTES 131040 :RAW-TICKS 5923 :SECONDS
   0.005923d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 29.615d0 :BYTES-PER-SECOND
   2.1610670268445044d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1854669567
     :SINK-LOW 3500381958 :EXPECTED-HIGH 1854669567 :EXPECTED-LOW 3500381958
     :RAW-TICKS 5849 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1416522479
     :SINK-LOW 2753777158 :EXPECTED-HIGH 1416522479 :EXPECTED-LOW 2753777158
     :RAW-TICKS 5905 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :MAX :REPLICA 3 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 12800000 :HEAP-BYTES 131040 :RAW-TICKS 5922 :SECONDS
   0.005922d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 29.61d0 :BYTES-PER-SECOND
   2.1614319486659913d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1854669567
     :SINK-LOW 3500381958 :EXPECTED-HIGH 1854669567 :EXPECTED-LOW 3500381958
     :RAW-TICKS 5845 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1416522479
     :SINK-LOW 2753777158 :EXPECTED-HIGH 1416522479 :EXPECTED-LOW 2753777158
     :RAW-TICKS 5906 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :MAX :REPLICA 4 :WORKERS 2 :ITERATIONS 100000 :COMPLETED
   200000 :BYTES 12800000 :HEAP-BYTES 131040 :RAW-TICKS 5918 :SECONDS
   0.005918d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 29.59d0 :BYTES-PER-SECOND
   2.162892869212572d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1854669567
     :SINK-LOW 3500381958 :EXPECTED-HIGH 1854669567 :EXPECTED-LOW 3500381958
     :RAW-TICKS 5852 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1416522479
     :SINK-LOW 2753777158 :EXPECTED-HIGH 1416522479 :EXPECTED-LOW 2753777158
     :RAW-TICKS 5899 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 2 :ITERATIONS 25000 :COMPLETED
   50000 :BYTES 12800000 :HEAP-BYTES 131040 :RAW-TICKS 4408 :SECONDS 0.004408d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 88.16d0 :BYTES-PER-SECOND
   2.903811252268603d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 3650340472 :SINK-LOW 91924045
     :EXPECTED-HIGH 3650340472 :EXPECTED-LOW 91924045 :RAW-TICKS 4384
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 998813170
     :SINK-LOW 563060723 :EXPECTED-HIGH 998813170 :EXPECTED-LOW 563060723
     :RAW-TICKS 4216 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 2 :ITERATIONS 25000 :COMPLETED
   50000 :BYTES 12800000 :HEAP-BYTES 131040 :RAW-TICKS 4217 :SECONDS 0.004217d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 84.34d0 :BYTES-PER-SECOND
   3.0353331752430634d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 3650340472 :SINK-LOW 91924045
     :EXPECTED-HIGH 3650340472 :EXPECTED-LOW 91924045 :RAW-TICKS 4186
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 998813170
     :SINK-LOW 563060723 :EXPECTED-HIGH 998813170 :EXPECTED-LOW 563060723
     :RAW-TICKS 4184 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 2 :ITERATIONS 25000 :COMPLETED
   50000 :BYTES 12800000 :HEAP-BYTES 131040 :RAW-TICKS 4202 :SECONDS 0.004202d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 84.04d0 :BYTES-PER-SECOND
   3.0461684911946692d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 3650340472 :SINK-LOW 91924045
     :EXPECTED-HIGH 3650340472 :EXPECTED-LOW 91924045 :RAW-TICKS 4178
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 998813170
     :SINK-LOW 563060723 :EXPECTED-HIGH 998813170 :EXPECTED-LOW 563060723
     :RAW-TICKS 4186 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 2 :ITERATIONS 25000 :COMPLETED
   50000 :BYTES 12800000 :HEAP-BYTES 131040 :RAW-TICKS 4222 :SECONDS 0.004222d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 84.44d0 :BYTES-PER-SECOND
   3.0317385125532923d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 3650340472 :SINK-LOW 91924045
     :EXPECTED-HIGH 3650340472 :EXPECTED-LOW 91924045 :RAW-TICKS 4190
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 998813170
     :SINK-LOW 563060723 :EXPECTED-HIGH 998813170 :EXPECTED-LOW 563060723
     :RAW-TICKS 4180 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 2 :ITERATIONS 25000 :COMPLETED
   50000 :BYTES 12800000 :HEAP-BYTES 131040 :RAW-TICKS 4207 :SECONDS 0.004207d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 84.14d0 :BYTES-PER-SECOND
   3.0425481340622773d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 3650340472 :SINK-LOW 91924045
     :EXPECTED-HIGH 3650340472 :EXPECTED-LOW 91924045 :RAW-TICKS 4187
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 998813170
     :SINK-LOW 563060723 :EXPECTED-HIGH 998813170 :EXPECTED-LOW 563060723
     :RAW-TICKS 4182 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :MAX :REPLICA 0 :WORKERS 2 :ITERATIONS 25000 :COMPLETED 50000
   :BYTES 12800000 :HEAP-BYTES 131040 :RAW-TICKS 4487 :SECONDS 0.004487d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 89.74d0 :BYTES-PER-SECOND
   2.8526855359928684d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3822163365
     :SINK-LOW 3634861316 :EXPECTED-HIGH 3822163365 :EXPECTED-LOW 3634861316
     :RAW-TICKS 4368 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1042287200
     :SINK-LOW 2602565293 :EXPECTED-HIGH 1042287200 :EXPECTED-LOW 2602565293
     :RAW-TICKS 4210 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :MAX :REPLICA 1 :WORKERS 2 :ITERATIONS 25000 :COMPLETED 50000
   :BYTES 12800000 :HEAP-BYTES 131040 :RAW-TICKS 4209 :SECONDS 0.004209d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 84.18d0 :BYTES-PER-SECOND
   3.041102399619862d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3822163365
     :SINK-LOW 3634861316 :EXPECTED-HIGH 3822163365 :EXPECTED-LOW 3634861316
     :RAW-TICKS 4182 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1042287200
     :SINK-LOW 2602565293 :EXPECTED-HIGH 1042287200 :EXPECTED-LOW 2602565293
     :RAW-TICKS 4181 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :MAX :REPLICA 2 :WORKERS 2 :ITERATIONS 25000 :COMPLETED 50000
   :BYTES 12800000 :HEAP-BYTES 131040 :RAW-TICKS 5805 :SECONDS 0.005805d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 116.1d0 :BYTES-PER-SECOND
   2.2049956933677864d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3822163365
     :SINK-LOW 3634861316 :EXPECTED-HIGH 3822163365 :EXPECTED-LOW 3634861316
     :RAW-TICKS 4784 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1042287200
     :SINK-LOW 2602565293 :EXPECTED-HIGH 1042287200 :EXPECTED-LOW 2602565293
     :RAW-TICKS 4736 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :MAX :REPLICA 3 :WORKERS 2 :ITERATIONS 25000 :COMPLETED 50000
   :BYTES 12800000 :HEAP-BYTES 131040 :RAW-TICKS 11952 :SECONDS 0.011952d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 239.04d0 :BYTES-PER-SECOND
   1.0709504685408299d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3822163365
     :SINK-LOW 3634861316 :EXPECTED-HIGH 3822163365 :EXPECTED-LOW 3634861316
     :RAW-TICKS 9682 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1042287200
     :SINK-LOW 2602565293 :EXPECTED-HIGH 1042287200 :EXPECTED-LOW 2602565293
     :RAW-TICKS 11197 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :MAX :REPLICA 4 :WORKERS 2 :ITERATIONS 25000 :COMPLETED 50000
   :BYTES 12800000 :HEAP-BYTES 131040 :RAW-TICKS 6392 :SECONDS 0.006392d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 127.84d0 :BYTES-PER-SECOND
   2.0025031289111388d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3822163365
     :SINK-LOW 3634861316 :EXPECTED-HIGH 3822163365 :EXPECTED-LOW 3634861316
     :RAW-TICKS 5895 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1042287200
     :SINK-LOW 2602565293 :EXPECTED-HIGH 1042287200 :EXPECTED-LOW 2602565293
     :RAW-TICKS 4184 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 2 :ITERATIONS 6250 :COMPLETED
   12500 :BYTES 12800000 :HEAP-BYTES 131040 :RAW-TICKS 4770 :SECONDS 0.00477d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 381.6d0 :BYTES-PER-SECOND
   2.6834381551362686d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 314608995 :SINK-LOW 2823576381
     :EXPECTED-HIGH 314608995 :EXPECTED-LOW 2823576381 :RAW-TICKS 3743
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 2371232589 :SINK-LOW
     666793452 :EXPECTED-HIGH 2371232589 :EXPECTED-LOW 666793452 :RAW-TICKS
     3749 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 2 :ITERATIONS 6250 :COMPLETED
   12500 :BYTES 12800000 :HEAP-BYTES 131040 :RAW-TICKS 3790 :SECONDS 0.00379d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 303.2d0 :BYTES-PER-SECOND
   3.3773087071240106d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 314608995 :SINK-LOW 2823576381
     :EXPECTED-HIGH 314608995 :EXPECTED-LOW 2823576381 :RAW-TICKS 3742
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 2371232589 :SINK-LOW
     666793452 :EXPECTED-HIGH 2371232589 :EXPECTED-LOW 666793452 :RAW-TICKS
     3748 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 2 :ITERATIONS 6250 :COMPLETED
   12500 :BYTES 12800000 :HEAP-BYTES 131040 :RAW-TICKS 5788 :SECONDS 0.005788d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 463.04d0 :BYTES-PER-SECOND
   2.21147201105736d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 314608995 :SINK-LOW 2823576381
     :EXPECTED-HIGH 314608995 :EXPECTED-LOW 2823576381 :RAW-TICKS 5549
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 2371232589 :SINK-LOW
     666793452 :EXPECTED-HIGH 2371232589 :EXPECTED-LOW 666793452 :RAW-TICKS
     4803 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 2 :ITERATIONS 6250 :COMPLETED
   12500 :BYTES 12800000 :HEAP-BYTES 131040 :RAW-TICKS 4132 :SECONDS 0.004132d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 330.56000000000006d0 :BYTES-PER-SECOND
   3.0977734753146176d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 314608995 :SINK-LOW 2823576381
     :EXPECTED-HIGH 314608995 :EXPECTED-LOW 2823576381 :RAW-TICKS 4093
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 2371232589 :SINK-LOW
     666793452 :EXPECTED-HIGH 2371232589 :EXPECTED-LOW 666793452 :RAW-TICKS
     3855 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 2 :ITERATIONS 6250 :COMPLETED
   12500 :BYTES 12800000 :HEAP-BYTES 131040 :RAW-TICKS 4336 :SECONDS 0.004336d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 346.88d0 :BYTES-PER-SECOND
   2.952029520295203d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 314608995 :SINK-LOW 2823576381
     :EXPECTED-HIGH 314608995 :EXPECTED-LOW 2823576381 :RAW-TICKS 3749
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 2371232589 :SINK-LOW
     666793452 :EXPECTED-HIGH 2371232589 :EXPECTED-LOW 666793452 :RAW-TICKS
     3821 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :MAX :REPLICA 0 :WORKERS 2 :ITERATIONS 6250 :COMPLETED 12500
   :BYTES 12800000 :HEAP-BYTES 131040 :RAW-TICKS 3764 :SECONDS 0.003764d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 301.12d0 :BYTES-PER-SECOND
   3.400637619553666d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3518727484 :SINK-LOW
     598906486 :EXPECTED-HIGH 3518727484 :EXPECTED-LOW 598906486 :RAW-TICKS
     3742 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 26602956 :SINK-LOW
     3388797188 :EXPECTED-HIGH 26602956 :EXPECTED-LOW 3388797188 :RAW-TICKS
     3732 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :MAX :REPLICA 1 :WORKERS 2 :ITERATIONS 6250 :COMPLETED 12500
   :BYTES 12800000 :HEAP-BYTES 131040 :RAW-TICKS 3773 :SECONDS 0.003773d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 301.84d0 :BYTES-PER-SECOND
   3.3925258415054336d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3518727484 :SINK-LOW
     598906486 :EXPECTED-HIGH 3518727484 :EXPECTED-LOW 598906486 :RAW-TICKS
     3745 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 26602956 :SINK-LOW
     3388797188 :EXPECTED-HIGH 26602956 :EXPECTED-LOW 3388797188 :RAW-TICKS
     3741 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :MAX :REPLICA 2 :WORKERS 2 :ITERATIONS 6250 :COMPLETED 12500
   :BYTES 12800000 :HEAP-BYTES 131040 :RAW-TICKS 3755 :SECONDS 0.003755d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 300.4d0 :BYTES-PER-SECOND
   3.4087882822902794d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3518727484 :SINK-LOW
     598906486 :EXPECTED-HIGH 3518727484 :EXPECTED-LOW 598906486 :RAW-TICKS
     3733 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 26602956 :SINK-LOW
     3388797188 :EXPECTED-HIGH 26602956 :EXPECTED-LOW 3388797188 :RAW-TICKS
     3745 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :MAX :REPLICA 3 :WORKERS 2 :ITERATIONS 6250 :COMPLETED 12500
   :BYTES 12800000 :HEAP-BYTES 131040 :RAW-TICKS 3770 :SECONDS 0.00377d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 301.6d0 :BYTES-PER-SECOND
   3.3952254641909814d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3518727484 :SINK-LOW
     598906486 :EXPECTED-HIGH 3518727484 :EXPECTED-LOW 598906486 :RAW-TICKS
     3742 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 26602956 :SINK-LOW
     3388797188 :EXPECTED-HIGH 26602956 :EXPECTED-LOW 3388797188 :RAW-TICKS
     3750 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :MAX :REPLICA 4 :WORKERS 2 :ITERATIONS 6250 :COMPLETED 12500
   :BYTES 12800000 :HEAP-BYTES 131040 :RAW-TICKS 3763 :SECONDS 0.003763d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 301.04d0 :BYTES-PER-SECOND
   3.4015413234121714d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3518727484 :SINK-LOW
     598906486 :EXPECTED-HIGH 3518727484 :EXPECTED-LOW 598906486 :RAW-TICKS
     3745 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 26602956 :SINK-LOW
     3388797188 :EXPECTED-HIGH 26602956 :EXPECTED-LOW 3388797188 :RAW-TICKS
     3741 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 2 :ITERATIONS 98 :COMPLETED 196
   :BYTES 12844860 :HEAP-BYTES 131040 :RAW-TICKS 3580 :SECONDS 0.00358d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 18265.30612244898d0 :BYTES-PER-SECOND
   3.587949720670391d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2954450432 :SINK-LOW 4000006553
     :EXPECTED-HIGH 2954450432 :EXPECTED-LOW 4000006553 :RAW-TICKS 3558
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3775466461 :SINK-LOW
     921643877 :EXPECTED-HIGH 3775466461 :EXPECTED-LOW 921643877 :RAW-TICKS
     3554 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 2 :ITERATIONS 98 :COMPLETED 196
   :BYTES 12844860 :HEAP-BYTES 131040 :RAW-TICKS 3611 :SECONDS 0.003611d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 18423.469387755104d0 :BYTES-PER-SECOND
   3.557147604541678d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2954450432 :SINK-LOW 4000006553
     :EXPECTED-HIGH 2954450432 :EXPECTED-LOW 4000006553 :RAW-TICKS 3580
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3775466461 :SINK-LOW
     921643877 :EXPECTED-HIGH 3775466461 :EXPECTED-LOW 921643877 :RAW-TICKS
     3581 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 2 :ITERATIONS 98 :COMPLETED 196
   :BYTES 12844860 :HEAP-BYTES 131040 :RAW-TICKS 3578 :SECONDS 0.003578d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 18255.102040816328d0 :BYTES-PER-SECOND
   3.589955282280604d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2954450432 :SINK-LOW 4000006553
     :EXPECTED-HIGH 2954450432 :EXPECTED-LOW 4000006553 :RAW-TICKS 3531
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3775466461 :SINK-LOW
     921643877 :EXPECTED-HIGH 3775466461 :EXPECTED-LOW 921643877 :RAW-TICKS
     3561 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 2 :ITERATIONS 98 :COMPLETED 196
   :BYTES 12844860 :HEAP-BYTES 131040 :RAW-TICKS 3599 :SECONDS 0.003599d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 18362.244897959183d0 :BYTES-PER-SECOND
   3.5690080577938313d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2954450432 :SINK-LOW 4000006553
     :EXPECTED-HIGH 2954450432 :EXPECTED-LOW 4000006553 :RAW-TICKS 3580
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3775466461 :SINK-LOW
     921643877 :EXPECTED-HIGH 3775466461 :EXPECTED-LOW 921643877 :RAW-TICKS
     3557 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 2 :ITERATIONS 98 :COMPLETED 196
   :BYTES 12844860 :HEAP-BYTES 131040 :RAW-TICKS 3621 :SECONDS 0.003621d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 18474.48979591837d0 :BYTES-PER-SECOND
   3.5473239436619716d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2954450432 :SINK-LOW 4000006553
     :EXPECTED-HIGH 2954450432 :EXPECTED-LOW 4000006553 :RAW-TICKS 3564
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3775466461 :SINK-LOW
     921643877 :EXPECTED-HIGH 3775466461 :EXPECTED-LOW 921643877 :RAW-TICKS
     3567 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :MAX :REPLICA 0 :WORKERS 2 :ITERATIONS 98 :COMPLETED 196
   :BYTES 12844860 :HEAP-BYTES 131040 :RAW-TICKS 3595 :SECONDS 0.003595d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 18341.836734693876d0 :BYTES-PER-SECOND
   3.572979137691238d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 4158245344 :SINK-LOW
     2314362413 :EXPECTED-HIGH 4158245344 :EXPECTED-LOW 2314362413 :RAW-TICKS
     3571 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1633038806 :SINK-LOW
     944731975 :EXPECTED-HIGH 1633038806 :EXPECTED-LOW 944731975 :RAW-TICKS
     3571 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :MAX :REPLICA 1 :WORKERS 2 :ITERATIONS 98 :COMPLETED 196
   :BYTES 12844860 :HEAP-BYTES 131040 :RAW-TICKS 3861 :SECONDS 0.003861d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19698.979591836734d0 :BYTES-PER-SECOND
   3.326822066822067d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 4158245344 :SINK-LOW
     2314362413 :EXPECTED-HIGH 4158245344 :EXPECTED-LOW 2314362413 :RAW-TICKS
     3838 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1633038806 :SINK-LOW
     944731975 :EXPECTED-HIGH 1633038806 :EXPECTED-LOW 944731975 :RAW-TICKS
     3768 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :MAX :REPLICA 2 :WORKERS 2 :ITERATIONS 98 :COMPLETED 196
   :BYTES 12844860 :HEAP-BYTES 131040 :RAW-TICKS 3594 :SECONDS 0.003594d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 18336.73469387755d0 :BYTES-PER-SECOND
   3.573973288814691d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 4158245344 :SINK-LOW
     2314362413 :EXPECTED-HIGH 4158245344 :EXPECTED-LOW 2314362413 :RAW-TICKS
     3570 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1633038806 :SINK-LOW
     944731975 :EXPECTED-HIGH 1633038806 :EXPECTED-LOW 944731975 :RAW-TICKS
     3564 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :MAX :REPLICA 3 :WORKERS 2 :ITERATIONS 98 :COMPLETED 196
   :BYTES 12844860 :HEAP-BYTES 65520 :RAW-TICKS 3572 :SECONDS 0.003572d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 18224.48979591837d0 :BYTES-PER-SECOND
   3.5959854423292274d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 4158245344 :SINK-LOW
     2314362413 :EXPECTED-HIGH 4158245344 :EXPECTED-LOW 2314362413 :RAW-TICKS
     3552 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1633038806 :SINK-LOW
     944731975 :EXPECTED-HIGH 1633038806 :EXPECTED-LOW 944731975 :RAW-TICKS
     3560 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :MAX :REPLICA 4 :WORKERS 2 :ITERATIONS 98 :COMPLETED 196
   :BYTES 12844860 :HEAP-BYTES 131040 :RAW-TICKS 3586 :SECONDS 0.003586d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 18295.918367346938d0 :BYTES-PER-SECOND
   3.581946458449526d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 4158245344 :SINK-LOW
     2314362413 :EXPECTED-HIGH 4158245344 :EXPECTED-LOW 2314362413 :RAW-TICKS
     3557 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1633038806 :SINK-LOW
     944731975 :EXPECTED-HIGH 1633038806 :EXPECTED-LOW 944731975 :RAW-TICKS
     3561 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   0 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 0 :HEAP-BYTES 262080 :RAW-TICKS 1712 :SECONDS 0.001712d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 4.28d0 :BYTES-PER-SECOND 0.0d0
   :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 4014398263 :SINK-LOW 1373170073
     :EXPECTED-HIGH 4014398263 :EXPECTED-LOW 1373170073 :RAW-TICKS 1273
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 1186811877
     :SINK-LOW 1546318433 :EXPECTED-HIGH 1186811877 :EXPECTED-LOW 1546318433
     :RAW-TICKS 1277 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 2814081832
     :SINK-LOW 2829404875 :EXPECTED-HIGH 2814081832 :EXPECTED-LOW 2829404875
     :RAW-TICKS 1282 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 3637941326
     :SINK-LOW 214480316 :EXPECTED-HIGH 3637941326 :EXPECTED-LOW 214480316
     :RAW-TICKS 1659 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   0 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 0 :HEAP-BYTES 262080 :RAW-TICKS 1744 :SECONDS 0.001744d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 4.36d0 :BYTES-PER-SECOND 0.0d0
   :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 4014398263 :SINK-LOW 1373170073
     :EXPECTED-HIGH 4014398263 :EXPECTED-LOW 1373170073 :RAW-TICKS 1298
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 1186811877
     :SINK-LOW 1546318433 :EXPECTED-HIGH 1186811877 :EXPECTED-LOW 1546318433
     :RAW-TICKS 1651 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 2814081832
     :SINK-LOW 2829404875 :EXPECTED-HIGH 2814081832 :EXPECTED-LOW 2829404875
     :RAW-TICKS 1284 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 3637941326
     :SINK-LOW 214480316 :EXPECTED-HIGH 3637941326 :EXPECTED-LOW 214480316
     :RAW-TICKS 1283 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   0 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 0 :HEAP-BYTES 262080 :RAW-TICKS 1845 :SECONDS 0.001845d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 4.6125d0 :BYTES-PER-SECOND 0.0d0
   :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 4014398263 :SINK-LOW 1373170073
     :EXPECTED-HIGH 4014398263 :EXPECTED-LOW 1373170073 :RAW-TICKS 1695
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 1186811877
     :SINK-LOW 1546318433 :EXPECTED-HIGH 1186811877 :EXPECTED-LOW 1546318433
     :RAW-TICKS 1278 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 2814081832
     :SINK-LOW 2829404875 :EXPECTED-HIGH 2814081832 :EXPECTED-LOW 2829404875
     :RAW-TICKS 1289 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 3637941326
     :SINK-LOW 214480316 :EXPECTED-HIGH 3637941326 :EXPECTED-LOW 214480316
     :RAW-TICKS 1277 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   0 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 0 :HEAP-BYTES 262080 :RAW-TICKS 1676 :SECONDS 0.001676d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 4.19d0 :BYTES-PER-SECOND 0.0d0
   :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 4014398263 :SINK-LOW 1373170073
     :EXPECTED-HIGH 4014398263 :EXPECTED-LOW 1373170073 :RAW-TICKS 1281
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 1186811877
     :SINK-LOW 1546318433 :EXPECTED-HIGH 1186811877 :EXPECTED-LOW 1546318433
     :RAW-TICKS 1618 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 2814081832
     :SINK-LOW 2829404875 :EXPECTED-HIGH 2814081832 :EXPECTED-LOW 2829404875
     :RAW-TICKS 1278 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 3637941326
     :SINK-LOW 214480316 :EXPECTED-HIGH 3637941326 :EXPECTED-LOW 214480316
     :RAW-TICKS 1284 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   0 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 0 :HEAP-BYTES 262080 :RAW-TICKS 1808 :SECONDS 0.001808d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 4.52d0 :BYTES-PER-SECOND 0.0d0
   :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 4014398263 :SINK-LOW 1373170073
     :EXPECTED-HIGH 4014398263 :EXPECTED-LOW 1373170073 :RAW-TICKS 1659
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 1186811877
     :SINK-LOW 1546318433 :EXPECTED-HIGH 1186811877 :EXPECTED-LOW 1546318433
     :RAW-TICKS 1291 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 2814081832
     :SINK-LOW 2829404875 :EXPECTED-HIGH 2814081832 :EXPECTED-LOW 2829404875
     :RAW-TICKS 1282 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 3637941326
     :SINK-LOW 214480316 :EXPECTED-HIGH 3637941326 :EXPECTED-LOW 214480316
     :RAW-TICKS 1279 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   0 :SEED-CASE :MAX :REPLICA 0 :WORKERS 4 :ITERATIONS 100000 :COMPLETED 400000
   :BYTES 0 :HEAP-BYTES 262080 :RAW-TICKS 1727 :SECONDS 0.001727d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 4.3175d0 :BYTES-PER-SECOND 0.0d0
   :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 697257092
     :SINK-LOW 2991543168 :EXPECTED-HIGH 697257092 :EXPECTED-LOW 2991543168
     :RAW-TICKS 1332 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 3722978317
     :SINK-LOW 2816790877 :EXPECTED-HIGH 3722978317 :EXPECTED-LOW 2816790877
     :RAW-TICKS 1659 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 4088036729
     :SINK-LOW 3734579715 :EXPECTED-HIGH 4088036729 :EXPECTED-LOW 3734579715
     :RAW-TICKS 1276 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 2908048798
     :SINK-LOW 3002214809 :EXPECTED-HIGH 2908048798 :EXPECTED-LOW 3002214809
     :RAW-TICKS 1292 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   0 :SEED-CASE :MAX :REPLICA 1 :WORKERS 4 :ITERATIONS 100000 :COMPLETED 400000
   :BYTES 0 :HEAP-BYTES 262080 :RAW-TICKS 1753 :SECONDS 0.001753d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 4.3825d0 :BYTES-PER-SECOND 0.0d0
   :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 697257092
     :SINK-LOW 2991543168 :EXPECTED-HIGH 697257092 :EXPECTED-LOW 2991543168
     :RAW-TICKS 1660 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 3722978317
     :SINK-LOW 2816790877 :EXPECTED-HIGH 3722978317 :EXPECTED-LOW 2816790877
     :RAW-TICKS 1276 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 4088036729
     :SINK-LOW 3734579715 :EXPECTED-HIGH 4088036729 :EXPECTED-LOW 3734579715
     :RAW-TICKS 1286 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 2908048798
     :SINK-LOW 3002214809 :EXPECTED-HIGH 2908048798 :EXPECTED-LOW 3002214809
     :RAW-TICKS 1282 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   0 :SEED-CASE :MAX :REPLICA 2 :WORKERS 4 :ITERATIONS 100000 :COMPLETED 400000
   :BYTES 0 :HEAP-BYTES 262080 :RAW-TICKS 1703 :SECONDS 0.001703d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 4.2575d0 :BYTES-PER-SECOND 0.0d0
   :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 697257092
     :SINK-LOW 2991543168 :EXPECTED-HIGH 697257092 :EXPECTED-LOW 2991543168
     :RAW-TICKS 1290 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 3722978317
     :SINK-LOW 2816790877 :EXPECTED-HIGH 3722978317 :EXPECTED-LOW 2816790877
     :RAW-TICKS 1280 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 4088036729
     :SINK-LOW 3734579715 :EXPECTED-HIGH 4088036729 :EXPECTED-LOW 3734579715
     :RAW-TICKS 1279 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 2908048798
     :SINK-LOW 3002214809 :EXPECTED-HIGH 2908048798 :EXPECTED-LOW 3002214809
     :RAW-TICKS 1665 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   0 :SEED-CASE :MAX :REPLICA 3 :WORKERS 4 :ITERATIONS 100000 :COMPLETED 400000
   :BYTES 0 :HEAP-BYTES 262080 :RAW-TICKS 1786 :SECONDS 0.001786d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 4.465d0 :BYTES-PER-SECOND 0.0d0
   :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 697257092
     :SINK-LOW 2991543168 :EXPECTED-HIGH 697257092 :EXPECTED-LOW 2991543168
     :RAW-TICKS 1652 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 3722978317
     :SINK-LOW 2816790877 :EXPECTED-HIGH 3722978317 :EXPECTED-LOW 2816790877
     :RAW-TICKS 1292 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 4088036729
     :SINK-LOW 3734579715 :EXPECTED-HIGH 4088036729 :EXPECTED-LOW 3734579715
     :RAW-TICKS 1279 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 2908048798
     :SINK-LOW 3002214809 :EXPECTED-HIGH 2908048798 :EXPECTED-LOW 3002214809
     :RAW-TICKS 1274 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   0 :SEED-CASE :MAX :REPLICA 4 :WORKERS 4 :ITERATIONS 100000 :COMPLETED 400000
   :BYTES 0 :HEAP-BYTES 262080 :RAW-TICKS 1758 :SECONDS 0.001758d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 4.395d0 :BYTES-PER-SECOND 0.0d0
   :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 697257092
     :SINK-LOW 2991543168 :EXPECTED-HIGH 697257092 :EXPECTED-LOW 2991543168
     :RAW-TICKS 1658 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 3722978317
     :SINK-LOW 2816790877 :EXPECTED-HIGH 3722978317 :EXPECTED-LOW 2816790877
     :RAW-TICKS 1300 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 4088036729
     :SINK-LOW 3734579715 :EXPECTED-HIGH 4088036729 :EXPECTED-LOW 3734579715
     :RAW-TICKS 1291 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 2908048798
     :SINK-LOW 3002214809 :EXPECTED-HIGH 2908048798 :EXPECTED-LOW 3002214809
     :RAW-TICKS 1271 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 400000 :HEAP-BYTES 262080 :RAW-TICKS 2022 :SECONDS 0.002022d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 5.055d0 :BYTES-PER-SECOND
   1.9782393669634026d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2775575122 :SINK-LOW 1566858293
     :EXPECTED-HIGH 2775575122 :EXPECTED-LOW 1566858293 :RAW-TICKS 1429
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 904040975
     :SINK-LOW 1912771314 :EXPECTED-HIGH 904040975 :EXPECTED-LOW 1912771314
     :RAW-TICKS 1416 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 1743508602
     :SINK-LOW 4280348882 :EXPECTED-HIGH 1743508602 :EXPECTED-LOW 4280348882
     :RAW-TICKS 1953 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 3537875379
     :SINK-LOW 3764490641 :EXPECTED-HIGH 3537875379 :EXPECTED-LOW 3764490641
     :RAW-TICKS 1424 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 400000 :HEAP-BYTES 262080 :RAW-TICKS 1997 :SECONDS 0.001997d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 4.9925d0 :BYTES-PER-SECOND
   2.00300450676014d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2775575122 :SINK-LOW 1566858293
     :EXPECTED-HIGH 2775575122 :EXPECTED-LOW 1566858293 :RAW-TICKS 1413
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 904040975
     :SINK-LOW 1912771314 :EXPECTED-HIGH 904040975 :EXPECTED-LOW 1912771314
     :RAW-TICKS 1885 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 1743508602
     :SINK-LOW 4280348882 :EXPECTED-HIGH 1743508602 :EXPECTED-LOW 4280348882
     :RAW-TICKS 1420 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 3537875379
     :SINK-LOW 3764490641 :EXPECTED-HIGH 3537875379 :EXPECTED-LOW 3764490641
     :RAW-TICKS 1428 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 400000 :HEAP-BYTES 262080 :RAW-TICKS 2020 :SECONDS 0.00202d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 5.05d0 :BYTES-PER-SECOND
   1.98019801980198d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2775575122 :SINK-LOW 1566858293
     :EXPECTED-HIGH 2775575122 :EXPECTED-LOW 1566858293 :RAW-TICKS 1903
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 904040975
     :SINK-LOW 1912771314 :EXPECTED-HIGH 904040975 :EXPECTED-LOW 1912771314
     :RAW-TICKS 1417 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 1743508602
     :SINK-LOW 4280348882 :EXPECTED-HIGH 1743508602 :EXPECTED-LOW 4280348882
     :RAW-TICKS 1445 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 3537875379
     :SINK-LOW 3764490641 :EXPECTED-HIGH 3537875379 :EXPECTED-LOW 3764490641
     :RAW-TICKS 1413 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 400000 :HEAP-BYTES 262080 :RAW-TICKS 2028 :SECONDS 0.002028d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 5.069999999999999d0 :BYTES-PER-SECOND
   1.9723865877712032d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2775575122 :SINK-LOW 1566858293
     :EXPECTED-HIGH 2775575122 :EXPECTED-LOW 1566858293 :RAW-TICKS 1410
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 904040975
     :SINK-LOW 1912771314 :EXPECTED-HIGH 904040975 :EXPECTED-LOW 1912771314
     :RAW-TICKS 1880 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 1743508602
     :SINK-LOW 4280348882 :EXPECTED-HIGH 1743508602 :EXPECTED-LOW 4280348882
     :RAW-TICKS 1420 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 3537875379
     :SINK-LOW 3764490641 :EXPECTED-HIGH 3537875379 :EXPECTED-LOW 3764490641
     :RAW-TICKS 1420 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 400000 :HEAP-BYTES 262080 :RAW-TICKS 2014 :SECONDS 0.002014d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 5.035d0 :BYTES-PER-SECOND
   1.9860973187686196d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2775575122 :SINK-LOW 1566858293
     :EXPECTED-HIGH 2775575122 :EXPECTED-LOW 1566858293 :RAW-TICKS 1893
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 904040975
     :SINK-LOW 1912771314 :EXPECTED-HIGH 904040975 :EXPECTED-LOW 1912771314
     :RAW-TICKS 1424 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 1743508602
     :SINK-LOW 4280348882 :EXPECTED-HIGH 1743508602 :EXPECTED-LOW 4280348882
     :RAW-TICKS 1412 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 3537875379
     :SINK-LOW 3764490641 :EXPECTED-HIGH 3537875379 :EXPECTED-LOW 3764490641
     :RAW-TICKS 1415 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1 :SEED-CASE :MAX :REPLICA 0 :WORKERS 4 :ITERATIONS 100000 :COMPLETED 400000
   :BYTES 400000 :HEAP-BYTES 262080 :RAW-TICKS 2032 :SECONDS 0.002032d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 5.08d0 :BYTES-PER-SECOND
   1.968503937007874d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 2913883710
     :SINK-LOW 3003520362 :EXPECTED-HIGH 2913883710 :EXPECTED-LOW 3003520362
     :RAW-TICKS 1888 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 923570546
     :SINK-LOW 2656363360 :EXPECTED-HIGH 923570546 :EXPECTED-LOW 2656363360
     :RAW-TICKS 1414 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 789480791
     :SINK-LOW 4134004507 :EXPECTED-HIGH 789480791 :EXPECTED-LOW 4134004507
     :RAW-TICKS 1418 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 3260669291
     :SINK-LOW 535927105 :EXPECTED-HIGH 3260669291 :EXPECTED-LOW 535927105
     :RAW-TICKS 1413 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1 :SEED-CASE :MAX :REPLICA 1 :WORKERS 4 :ITERATIONS 100000 :COMPLETED 400000
   :BYTES 400000 :HEAP-BYTES 262080 :RAW-TICKS 1973 :SECONDS 0.001973d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 4.9325d0 :BYTES-PER-SECOND
   2.0273694880892044d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 2913883710
     :SINK-LOW 3003520362 :EXPECTED-HIGH 2913883710 :EXPECTED-LOW 3003520362
     :RAW-TICKS 1412 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 923570546
     :SINK-LOW 2656363360 :EXPECTED-HIGH 923570546 :EXPECTED-LOW 2656363360
     :RAW-TICKS 1901 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 789480791
     :SINK-LOW 4134004507 :EXPECTED-HIGH 789480791 :EXPECTED-LOW 4134004507
     :RAW-TICKS 1417 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 3260669291
     :SINK-LOW 535927105 :EXPECTED-HIGH 3260669291 :EXPECTED-LOW 535927105
     :RAW-TICKS 1413 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1 :SEED-CASE :MAX :REPLICA 2 :WORKERS 4 :ITERATIONS 100000 :COMPLETED 400000
   :BYTES 400000 :HEAP-BYTES 262080 :RAW-TICKS 1972 :SECONDS 0.001972d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 4.93d0 :BYTES-PER-SECOND
   2.028397565922921d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 2913883710
     :SINK-LOW 3003520362 :EXPECTED-HIGH 2913883710 :EXPECTED-LOW 3003520362
     :RAW-TICKS 1417 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 923570546
     :SINK-LOW 2656363360 :EXPECTED-HIGH 923570546 :EXPECTED-LOW 2656363360
     :RAW-TICKS 1413 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 789480791
     :SINK-LOW 4134004507 :EXPECTED-HIGH 789480791 :EXPECTED-LOW 4134004507
     :RAW-TICKS 1428 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 3260669291
     :SINK-LOW 535927105 :EXPECTED-HIGH 3260669291 :EXPECTED-LOW 535927105
     :RAW-TICKS 1941 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1 :SEED-CASE :MAX :REPLICA 3 :WORKERS 4 :ITERATIONS 100000 :COMPLETED 400000
   :BYTES 400000 :HEAP-BYTES 262080 :RAW-TICKS 2055 :SECONDS 0.002055d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 5.1375d0 :BYTES-PER-SECOND
   1.9464720194647202d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 2913883710
     :SINK-LOW 3003520362 :EXPECTED-HIGH 2913883710 :EXPECTED-LOW 3003520362
     :RAW-TICKS 1907 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 923570546
     :SINK-LOW 2656363360 :EXPECTED-HIGH 923570546 :EXPECTED-LOW 2656363360
     :RAW-TICKS 1424 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 789480791
     :SINK-LOW 4134004507 :EXPECTED-HIGH 789480791 :EXPECTED-LOW 4134004507
     :RAW-TICKS 1421 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 3260669291
     :SINK-LOW 535927105 :EXPECTED-HIGH 3260669291 :EXPECTED-LOW 535927105
     :RAW-TICKS 1413 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1 :SEED-CASE :MAX :REPLICA 4 :WORKERS 4 :ITERATIONS 100000 :COMPLETED 400000
   :BYTES 400000 :HEAP-BYTES 262080 :RAW-TICKS 1998 :SECONDS 0.001998d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 4.995000000000001d0 :BYTES-PER-SECOND
   2.0020020020020017d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 2913883710
     :SINK-LOW 3003520362 :EXPECTED-HIGH 2913883710 :EXPECTED-LOW 3003520362
     :RAW-TICKS 1892 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 923570546
     :SINK-LOW 2656363360 :EXPECTED-HIGH 923570546 :EXPECTED-LOW 2656363360
     :RAW-TICKS 1413 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 789480791
     :SINK-LOW 4134004507 :EXPECTED-HIGH 789480791 :EXPECTED-LOW 4134004507
     :RAW-TICKS 1421 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 3260669291
     :SINK-LOW 535927105 :EXPECTED-HIGH 3260669291 :EXPECTED-LOW 535927105
     :RAW-TICKS 1418 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   7 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 2800000 :HEAP-BYTES 262080 :RAW-TICKS 2732 :SECONDS 0.002732d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 6.83d0 :BYTES-PER-SECOND
   1.0248901903367497d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2383629478 :SINK-LOW 1558117133
     :EXPECTED-HIGH 2383629478 :EXPECTED-LOW 1558117133 :RAW-TICKS 2621
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 4045868682
     :SINK-LOW 4193195113 :EXPECTED-HIGH 4045868682 :EXPECTED-LOW 4193195113
     :RAW-TICKS 1956 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 3206496666
     :SINK-LOW 1045468069 :EXPECTED-HIGH 3206496666 :EXPECTED-LOW 1045468069
     :RAW-TICKS 1967 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 206164486
     :SINK-LOW 69227111 :EXPECTED-HIGH 206164486 :EXPECTED-LOW 69227111
     :RAW-TICKS 1971 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   7 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 2800000 :HEAP-BYTES 262080 :RAW-TICKS 2728 :SECONDS 0.002728d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 6.82d0 :BYTES-PER-SECOND
   1.0263929618768328d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2383629478 :SINK-LOW 1558117133
     :EXPECTED-HIGH 2383629478 :EXPECTED-LOW 1558117133 :RAW-TICKS 1978
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 4045868682
     :SINK-LOW 4193195113 :EXPECTED-HIGH 4045868682 :EXPECTED-LOW 4193195113
     :RAW-TICKS 1976 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 3206496666
     :SINK-LOW 1045468069 :EXPECTED-HIGH 3206496666 :EXPECTED-LOW 1045468069
     :RAW-TICKS 2653 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 206164486
     :SINK-LOW 69227111 :EXPECTED-HIGH 206164486 :EXPECTED-LOW 69227111
     :RAW-TICKS 1968 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   7 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 2800000 :HEAP-BYTES 262080 :RAW-TICKS 2737 :SECONDS 0.002737d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 6.8425d0 :BYTES-PER-SECOND
   1.0230179028132993d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2383629478 :SINK-LOW 1558117133
     :EXPECTED-HIGH 2383629478 :EXPECTED-LOW 1558117133 :RAW-TICKS 2649
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 4045868682
     :SINK-LOW 4193195113 :EXPECTED-HIGH 4045868682 :EXPECTED-LOW 4193195113
     :RAW-TICKS 1953 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 3206496666
     :SINK-LOW 1045468069 :EXPECTED-HIGH 3206496666 :EXPECTED-LOW 1045468069
     :RAW-TICKS 1974 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 206164486
     :SINK-LOW 69227111 :EXPECTED-HIGH 206164486 :EXPECTED-LOW 69227111
     :RAW-TICKS 1969 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   7 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 2800000 :HEAP-BYTES 262080 :RAW-TICKS 2838 :SECONDS 0.002838d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 7.095d0 :BYTES-PER-SECOND
   9.866102889358704d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2383629478 :SINK-LOW 1558117133
     :EXPECTED-HIGH 2383629478 :EXPECTED-LOW 1558117133 :RAW-TICKS 1957
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 4045868682
     :SINK-LOW 4193195113 :EXPECTED-HIGH 4045868682 :EXPECTED-LOW 4193195113
     :RAW-TICKS 1995 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 3206496666
     :SINK-LOW 1045468069 :EXPECTED-HIGH 3206496666 :EXPECTED-LOW 1045468069
     :RAW-TICKS 1973 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 206164486
     :SINK-LOW 69227111 :EXPECTED-HIGH 206164486 :EXPECTED-LOW 69227111
     :RAW-TICKS 2806 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   7 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 2800000 :HEAP-BYTES 262080 :RAW-TICKS 2750 :SECONDS 0.00275d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 6.875d0 :BYTES-PER-SECOND
   1.0181818181818182d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2383629478 :SINK-LOW 1558117133
     :EXPECTED-HIGH 2383629478 :EXPECTED-LOW 1558117133 :RAW-TICKS 1967
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 4045868682
     :SINK-LOW 4193195113 :EXPECTED-HIGH 4045868682 :EXPECTED-LOW 4193195113
     :RAW-TICKS 2682 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 3206496666
     :SINK-LOW 1045468069 :EXPECTED-HIGH 3206496666 :EXPECTED-LOW 1045468069
     :RAW-TICKS 1971 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 206164486
     :SINK-LOW 69227111 :EXPECTED-HIGH 206164486 :EXPECTED-LOW 69227111
     :RAW-TICKS 1970 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   7 :SEED-CASE :MAX :REPLICA 0 :WORKERS 4 :ITERATIONS 100000 :COMPLETED 400000
   :BYTES 2800000 :HEAP-BYTES 262080 :RAW-TICKS 2758 :SECONDS 0.002758d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 6.895d0 :BYTES-PER-SECOND
   1.0152284263959391d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1617286543
     :SINK-LOW 2598239346 :EXPECTED-HIGH 1617286543 :EXPECTED-LOW 2598239346
     :RAW-TICKS 1975 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 3737399893
     :SINK-LOW 2162173856 :EXPECTED-HIGH 3737399893 :EXPECTED-LOW 2162173856
     :RAW-TICKS 2002 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 1316655237
     :SINK-LOW 3068803652 :EXPECTED-HIGH 1316655237 :EXPECTED-LOW 3068803652
     :RAW-TICKS 2685 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 4289611565
     :SINK-LOW 2023254360 :EXPECTED-HIGH 4289611565 :EXPECTED-LOW 2023254360
     :RAW-TICKS 1973 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   7 :SEED-CASE :MAX :REPLICA 1 :WORKERS 4 :ITERATIONS 100000 :COMPLETED 400000
   :BYTES 2800000 :HEAP-BYTES 262080 :RAW-TICKS 2706 :SECONDS 0.002706d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 6.765d0 :BYTES-PER-SECOND
   1.0347376201034738d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1617286543
     :SINK-LOW 2598239346 :EXPECTED-HIGH 1617286543 :EXPECTED-LOW 2598239346
     :RAW-TICKS 1976 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 3737399893
     :SINK-LOW 2162173856 :EXPECTED-HIGH 3737399893 :EXPECTED-LOW 2162173856
     :RAW-TICKS 2628 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 1316655237
     :SINK-LOW 3068803652 :EXPECTED-HIGH 1316655237 :EXPECTED-LOW 3068803652
     :RAW-TICKS 1978 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 4289611565
     :SINK-LOW 2023254360 :EXPECTED-HIGH 4289611565 :EXPECTED-LOW 2023254360
     :RAW-TICKS 1966 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   7 :SEED-CASE :MAX :REPLICA 2 :WORKERS 4 :ITERATIONS 100000 :COMPLETED 400000
   :BYTES 2800000 :HEAP-BYTES 262080 :RAW-TICKS 2698 :SECONDS 0.002698d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 6.745d0 :BYTES-PER-SECOND
   1.0378057820607858d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1617286543
     :SINK-LOW 2598239346 :EXPECTED-HIGH 1617286543 :EXPECTED-LOW 2598239346
     :RAW-TICKS 1980 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 3737399893
     :SINK-LOW 2162173856 :EXPECTED-HIGH 3737399893 :EXPECTED-LOW 2162173856
     :RAW-TICKS 2644 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 1316655237
     :SINK-LOW 3068803652 :EXPECTED-HIGH 1316655237 :EXPECTED-LOW 3068803652
     :RAW-TICKS 1971 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 4289611565
     :SINK-LOW 2023254360 :EXPECTED-HIGH 4289611565 :EXPECTED-LOW 2023254360
     :RAW-TICKS 1964 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   7 :SEED-CASE :MAX :REPLICA 3 :WORKERS 4 :ITERATIONS 100000 :COMPLETED 400000
   :BYTES 2800000 :HEAP-BYTES 262080 :RAW-TICKS 2700 :SECONDS 0.0027d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 6.75d0 :BYTES-PER-SECOND
   1.037037037037037d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1617286543
     :SINK-LOW 2598239346 :EXPECTED-HIGH 1617286543 :EXPECTED-LOW 2598239346
     :RAW-TICKS 1971 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 3737399893
     :SINK-LOW 2162173856 :EXPECTED-HIGH 3737399893 :EXPECTED-LOW 2162173856
     :RAW-TICKS 2649 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 1316655237
     :SINK-LOW 3068803652 :EXPECTED-HIGH 1316655237 :EXPECTED-LOW 3068803652
     :RAW-TICKS 1976 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 4289611565
     :SINK-LOW 2023254360 :EXPECTED-HIGH 4289611565 :EXPECTED-LOW 2023254360
     :RAW-TICKS 1965 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   7 :SEED-CASE :MAX :REPLICA 4 :WORKERS 4 :ITERATIONS 100000 :COMPLETED 400000
   :BYTES 2800000 :HEAP-BYTES 262080 :RAW-TICKS 2710 :SECONDS 0.00271d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 6.775d0 :BYTES-PER-SECOND
   1.033210332103321d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1617286543
     :SINK-LOW 2598239346 :EXPECTED-HIGH 1617286543 :EXPECTED-LOW 2598239346
     :RAW-TICKS 2623 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 3737399893
     :SINK-LOW 2162173856 :EXPECTED-HIGH 3737399893 :EXPECTED-LOW 2162173856
     :RAW-TICKS 1971 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 1316655237
     :SINK-LOW 3068803652 :EXPECTED-HIGH 1316655237 :EXPECTED-LOW 3068803652
     :RAW-TICKS 1984 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 4289611565
     :SINK-LOW 2023254360 :EXPECTED-HIGH 4289611565 :EXPECTED-LOW 2023254360
     :RAW-TICKS 1963 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   8 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 3200000 :HEAP-BYTES 262080 :RAW-TICKS 2604 :SECONDS 0.002604d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 6.51d0 :BYTES-PER-SECOND
   1.228878648233487d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 702377167 :SINK-LOW 3479502890
     :EXPECTED-HIGH 702377167 :EXPECTED-LOW 3479502890 :RAW-TICKS 1913
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3141161100
     :SINK-LOW 48415383 :EXPECTED-HIGH 3141161100 :EXPECTED-LOW 48415383
     :RAW-TICKS 1901 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 2083102838
     :SINK-LOW 256697360 :EXPECTED-HIGH 2083102838 :EXPECTED-LOW 256697360
     :RAW-TICKS 2538 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 3534694634
     :SINK-LOW 4263031 :EXPECTED-HIGH 3534694634 :EXPECTED-LOW 4263031
     :RAW-TICKS 1914 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   8 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 3200000 :HEAP-BYTES 262080 :RAW-TICKS 2580 :SECONDS 0.00258d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 6.45d0 :BYTES-PER-SECOND
   1.2403100775193799d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 702377167 :SINK-LOW 3479502890
     :EXPECTED-HIGH 702377167 :EXPECTED-LOW 3479502890 :RAW-TICKS 1903
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3141161100
     :SINK-LOW 48415383 :EXPECTED-HIGH 3141161100 :EXPECTED-LOW 48415383
     :RAW-TICKS 2518 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 2083102838
     :SINK-LOW 256697360 :EXPECTED-HIGH 2083102838 :EXPECTED-LOW 256697360
     :RAW-TICKS 1898 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 3534694634
     :SINK-LOW 4263031 :EXPECTED-HIGH 3534694634 :EXPECTED-LOW 4263031
     :RAW-TICKS 1906 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   8 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 3200000 :HEAP-BYTES 262080 :RAW-TICKS 2681 :SECONDS 0.002681d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 6.7025d0 :BYTES-PER-SECOND
   1.1935844834017158d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 702377167 :SINK-LOW 3479502890
     :EXPECTED-HIGH 702377167 :EXPECTED-LOW 3479502890 :RAW-TICKS 1899
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3141161100
     :SINK-LOW 48415383 :EXPECTED-HIGH 3141161100 :EXPECTED-LOW 48415383
     :RAW-TICKS 1899 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 2083102838
     :SINK-LOW 256697360 :EXPECTED-HIGH 2083102838 :EXPECTED-LOW 256697360
     :RAW-TICKS 2511 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 3534694634
     :SINK-LOW 4263031 :EXPECTED-HIGH 3534694634 :EXPECTED-LOW 4263031
     :RAW-TICKS 2555 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   8 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 3200000 :HEAP-BYTES 262080 :RAW-TICKS 2837 :SECONDS 0.002837d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 7.0925d0 :BYTES-PER-SECOND
   1.1279520620373633d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 702377167 :SINK-LOW 3479502890
     :EXPECTED-HIGH 702377167 :EXPECTED-LOW 3479502890 :RAW-TICKS 2193
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3141161100
     :SINK-LOW 48415383 :EXPECTED-HIGH 3141161100 :EXPECTED-LOW 48415383
     :RAW-TICKS 1898 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 2083102838
     :SINK-LOW 256697360 :EXPECTED-HIGH 2083102838 :EXPECTED-LOW 256697360
     :RAW-TICKS 1955 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 3534694634
     :SINK-LOW 4263031 :EXPECTED-HIGH 3534694634 :EXPECTED-LOW 4263031
     :RAW-TICKS 2804 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   8 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 3200000 :HEAP-BYTES 262080 :RAW-TICKS 2614 :SECONDS 0.002614d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 6.535d0 :BYTES-PER-SECOND
   1.224177505738332d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 702377167 :SINK-LOW 3479502890
     :EXPECTED-HIGH 702377167 :EXPECTED-LOW 3479502890 :RAW-TICKS 2495
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3141161100
     :SINK-LOW 48415383 :EXPECTED-HIGH 3141161100 :EXPECTED-LOW 48415383
     :RAW-TICKS 1901 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 2083102838
     :SINK-LOW 256697360 :EXPECTED-HIGH 2083102838 :EXPECTED-LOW 256697360
     :RAW-TICKS 1995 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 3534694634
     :SINK-LOW 4263031 :EXPECTED-HIGH 3534694634 :EXPECTED-LOW 4263031
     :RAW-TICKS 1898 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   8 :SEED-CASE :MAX :REPLICA 0 :WORKERS 4 :ITERATIONS 100000 :COMPLETED 400000
   :BYTES 3200000 :HEAP-BYTES 262080 :RAW-TICKS 2520 :SECONDS 0.00252d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 6.3d0 :BYTES-PER-SECOND
   1.2698412698412697d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 4030851251
     :SINK-LOW 530277268 :EXPECTED-HIGH 4030851251 :EXPECTED-LOW 530277268
     :RAW-TICKS 1969 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 3233511409
     :SINK-LOW 4219093468 :EXPECTED-HIGH 3233511409 :EXPECTED-LOW 4219093468
     :RAW-TICKS 1900 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 1845672230
     :SINK-LOW 2846907110 :EXPECTED-HIGH 1845672230 :EXPECTED-LOW 2846907110
     :RAW-TICKS 1905 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 1615076251
     :SINK-LOW 3312183068 :EXPECTED-HIGH 1615076251 :EXPECTED-LOW 3312183068
     :RAW-TICKS 2492 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   8 :SEED-CASE :MAX :REPLICA 1 :WORKERS 4 :ITERATIONS 100000 :COMPLETED 400000
   :BYTES 3200000 :HEAP-BYTES 262080 :RAW-TICKS 2547 :SECONDS 0.002547d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 6.3675d0 :BYTES-PER-SECOND
   1.2563800549666276d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 4030851251
     :SINK-LOW 530277268 :EXPECTED-HIGH 4030851251 :EXPECTED-LOW 530277268
     :RAW-TICKS 1899 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 3233511409
     :SINK-LOW 4219093468 :EXPECTED-HIGH 3233511409 :EXPECTED-LOW 4219093468
     :RAW-TICKS 2482 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 1845672230
     :SINK-LOW 2846907110 :EXPECTED-HIGH 1845672230 :EXPECTED-LOW 2846907110
     :RAW-TICKS 1905 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 1615076251
     :SINK-LOW 3312183068 :EXPECTED-HIGH 1615076251 :EXPECTED-LOW 3312183068
     :RAW-TICKS 1901 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   8 :SEED-CASE :MAX :REPLICA 2 :WORKERS 4 :ITERATIONS 100000 :COMPLETED 400000
   :BYTES 3200000 :HEAP-BYTES 262080 :RAW-TICKS 2983 :SECONDS 0.002983d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 7.4575d0 :BYTES-PER-SECOND
   1.0727455581629232d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 4030851251
     :SINK-LOW 530277268 :EXPECTED-HIGH 4030851251 :EXPECTED-LOW 530277268
     :RAW-TICKS 1924 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 3233511409
     :SINK-LOW 4219093468 :EXPECTED-HIGH 3233511409 :EXPECTED-LOW 4219093468
     :RAW-TICKS 2884 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 1845672230
     :SINK-LOW 2846907110 :EXPECTED-HIGH 1845672230 :EXPECTED-LOW 2846907110
     :RAW-TICKS 2790 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 1615076251
     :SINK-LOW 3312183068 :EXPECTED-HIGH 1615076251 :EXPECTED-LOW 3312183068
     :RAW-TICKS 1906 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   8 :SEED-CASE :MAX :REPLICA 3 :WORKERS 4 :ITERATIONS 100000 :COMPLETED 400000
   :BYTES 3200000 :HEAP-BYTES 262080 :RAW-TICKS 2559 :SECONDS 0.002559d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 6.3975d0 :BYTES-PER-SECOND
   1.2504884720593982d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 4030851251
     :SINK-LOW 530277268 :EXPECTED-HIGH 4030851251 :EXPECTED-LOW 530277268
     :RAW-TICKS 1975 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 3233511409
     :SINK-LOW 4219093468 :EXPECTED-HIGH 3233511409 :EXPECTED-LOW 4219093468
     :RAW-TICKS 2496 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 1845672230
     :SINK-LOW 2846907110 :EXPECTED-HIGH 1845672230 :EXPECTED-LOW 2846907110
     :RAW-TICKS 1905 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 1615076251
     :SINK-LOW 3312183068 :EXPECTED-HIGH 1615076251 :EXPECTED-LOW 3312183068
     :RAW-TICKS 1903 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   8 :SEED-CASE :MAX :REPLICA 4 :WORKERS 4 :ITERATIONS 100000 :COMPLETED 400000
   :BYTES 3200000 :HEAP-BYTES 262080 :RAW-TICKS 2649 :SECONDS 0.002649d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 6.6225d0 :BYTES-PER-SECOND
   1.20800302000755d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 4030851251
     :SINK-LOW 530277268 :EXPECTED-HIGH 4030851251 :EXPECTED-LOW 530277268
     :RAW-TICKS 2518 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 3233511409
     :SINK-LOW 4219093468 :EXPECTED-HIGH 3233511409 :EXPECTED-LOW 4219093468
     :RAW-TICKS 1909 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 1845672230
     :SINK-LOW 2846907110 :EXPECTED-HIGH 1845672230 :EXPECTED-LOW 2846907110
     :RAW-TICKS 1908 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 1615076251
     :SINK-LOW 3312183068 :EXPECTED-HIGH 1615076251 :EXPECTED-LOW 3312183068
     :RAW-TICKS 1940 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 6400000 :HEAP-BYTES 262080 :RAW-TICKS 3536 :SECONDS 0.003536d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 8.84d0 :BYTES-PER-SECOND
   1.8099547511312218d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2488434274 :SINK-LOW 3965313052
     :EXPECTED-HIGH 2488434274 :EXPECTED-LOW 3965313052 :RAW-TICKS 3422
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 2663371641
     :SINK-LOW 3498500992 :EXPECTED-HIGH 2663371641 :EXPECTED-LOW 3498500992
     :RAW-TICKS 2568 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 1638734613
     :SINK-LOW 2332819673 :EXPECTED-HIGH 1638734613 :EXPECTED-LOW 2332819673
     :RAW-TICKS 2564 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 2521208261
     :SINK-LOW 3146005900 :EXPECTED-HIGH 2521208261 :EXPECTED-LOW 3146005900
     :RAW-TICKS 2567 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 6400000 :HEAP-BYTES 262080 :RAW-TICKS 3668 :SECONDS 0.003668d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 9.17d0 :BYTES-PER-SECOND
   1.7448200654307525d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2488434274 :SINK-LOW 3965313052
     :EXPECTED-HIGH 2488434274 :EXPECTED-LOW 3965313052 :RAW-TICKS 2585
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 2663371641
     :SINK-LOW 3498500992 :EXPECTED-HIGH 2663371641 :EXPECTED-LOW 3498500992
     :RAW-TICKS 3194 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 1638734613
     :SINK-LOW 2332819673 :EXPECTED-HIGH 1638734613 :EXPECTED-LOW 2332819673
     :RAW-TICKS 2567 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 2521208261
     :SINK-LOW 3146005900 :EXPECTED-HIGH 2521208261 :EXPECTED-LOW 3146005900
     :RAW-TICKS 2565 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 6400000 :HEAP-BYTES 262080 :RAW-TICKS 2965 :SECONDS 0.002965d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 7.4125d0 :BYTES-PER-SECOND
   2.1585160202360873d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2488434274 :SINK-LOW 3965313052
     :EXPECTED-HIGH 2488434274 :EXPECTED-LOW 3965313052 :RAW-TICKS 2586
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 2663371641
     :SINK-LOW 3498500992 :EXPECTED-HIGH 2663371641 :EXPECTED-LOW 3498500992
     :RAW-TICKS 2890 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 1638734613
     :SINK-LOW 2332819673 :EXPECTED-HIGH 1638734613 :EXPECTED-LOW 2332819673
     :RAW-TICKS 2611 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 2521208261
     :SINK-LOW 3146005900 :EXPECTED-HIGH 2521208261 :EXPECTED-LOW 3146005900
     :RAW-TICKS 2569 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 6400000 :HEAP-BYTES 262080 :RAW-TICKS 3500 :SECONDS 0.0035d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 8.75d0 :BYTES-PER-SECOND
   1.8285714285714285d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2488434274 :SINK-LOW 3965313052
     :EXPECTED-HIGH 2488434274 :EXPECTED-LOW 3965313052 :RAW-TICKS 2586
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 2663371641
     :SINK-LOW 3498500992 :EXPECTED-HIGH 2663371641 :EXPECTED-LOW 3498500992
     :RAW-TICKS 2568 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 1638734613
     :SINK-LOW 2332819673 :EXPECTED-HIGH 1638734613 :EXPECTED-LOW 2332819673
     :RAW-TICKS 3395 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 2521208261
     :SINK-LOW 3146005900 :EXPECTED-HIGH 2521208261 :EXPECTED-LOW 3146005900
     :RAW-TICKS 2569 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 6400000 :HEAP-BYTES 262080 :RAW-TICKS 5302 :SECONDS 0.005302d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 13.255d0 :BYTES-PER-SECOND
   1.2070916635231988d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2488434274 :SINK-LOW 3965313052
     :EXPECTED-HIGH 2488434274 :EXPECTED-LOW 3965313052 :RAW-TICKS 2610
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 2663371641
     :SINK-LOW 3498500992 :EXPECTED-HIGH 2663371641 :EXPECTED-LOW 3498500992
     :RAW-TICKS 2566 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 1638734613
     :SINK-LOW 2332819673 :EXPECTED-HIGH 1638734613 :EXPECTED-LOW 2332819673
     :RAW-TICKS 2568 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 2521208261
     :SINK-LOW 3146005900 :EXPECTED-HIGH 2521208261 :EXPECTED-LOW 3146005900
     :RAW-TICKS 2566 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :MAX :REPLICA 0 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 6400000 :HEAP-BYTES 262080 :RAW-TICKS 5209 :SECONDS 0.005209d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 13.0225d0 :BYTES-PER-SECOND
   1.2286427337300825d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1968933113
     :SINK-LOW 2654859235 :EXPECTED-HIGH 1968933113 :EXPECTED-LOW 2654859235
     :RAW-TICKS 2589 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 720460080
     :SINK-LOW 2942183124 :EXPECTED-HIGH 720460080 :EXPECTED-LOW 2942183124
     :RAW-TICKS 2569 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 1589008113
     :SINK-LOW 120282697 :EXPECTED-HIGH 1589008113 :EXPECTED-LOW 120282697
     :RAW-TICKS 2562 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 2550575438
     :SINK-LOW 2338601653 :EXPECTED-HIGH 2550575438 :EXPECTED-LOW 2338601653
     :RAW-TICKS 2562 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :MAX :REPLICA 1 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 6400000 :HEAP-BYTES 262080 :RAW-TICKS 5284 :SECONDS 0.005284d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 13.21d0 :BYTES-PER-SECOND
   1.2112036336109009d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1968933113
     :SINK-LOW 2654859235 :EXPECTED-HIGH 1968933113 :EXPECTED-LOW 2654859235
     :RAW-TICKS 2589 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 720460080
     :SINK-LOW 2942183124 :EXPECTED-HIGH 720460080 :EXPECTED-LOW 2942183124
     :RAW-TICKS 2566 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 1589008113
     :SINK-LOW 120282697 :EXPECTED-HIGH 1589008113 :EXPECTED-LOW 120282697
     :RAW-TICKS 2561 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 2550575438
     :SINK-LOW 2338601653 :EXPECTED-HIGH 2550575438 :EXPECTED-LOW 2338601653
     :RAW-TICKS 2567 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :MAX :REPLICA 2 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 6400000 :HEAP-BYTES 262080 :RAW-TICKS 5496 :SECONDS 0.005496d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 13.74d0 :BYTES-PER-SECOND
   1.1644832605531294d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1968933113
     :SINK-LOW 2654859235 :EXPECTED-HIGH 1968933113 :EXPECTED-LOW 2654859235
     :RAW-TICKS 2631 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 720460080
     :SINK-LOW 2942183124 :EXPECTED-HIGH 720460080 :EXPECTED-LOW 2942183124
     :RAW-TICKS 2654 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 1589008113
     :SINK-LOW 120282697 :EXPECTED-HIGH 1589008113 :EXPECTED-LOW 120282697
     :RAW-TICKS 2568 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 2550575438
     :SINK-LOW 2338601653 :EXPECTED-HIGH 2550575438 :EXPECTED-LOW 2338601653
     :RAW-TICKS 2573 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :MAX :REPLICA 3 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 6400000 :HEAP-BYTES 262080 :RAW-TICKS 5579 :SECONDS 0.005579d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 13.9475d0 :BYTES-PER-SECOND
   1.147158989066141d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1968933113
     :SINK-LOW 2654859235 :EXPECTED-HIGH 1968933113 :EXPECTED-LOW 2654859235
     :RAW-TICKS 2589 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 720460080
     :SINK-LOW 2942183124 :EXPECTED-HIGH 720460080 :EXPECTED-LOW 2942183124
     :RAW-TICKS 4652 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 1589008113
     :SINK-LOW 120282697 :EXPECTED-HIGH 1589008113 :EXPECTED-LOW 120282697
     :RAW-TICKS 2672 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 2550575438
     :SINK-LOW 2338601653 :EXPECTED-HIGH 2550575438 :EXPECTED-LOW 2338601653
     :RAW-TICKS 2568 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :MAX :REPLICA 4 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 6400000 :HEAP-BYTES 262080 :RAW-TICKS 3372 :SECONDS 0.003372d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 8.43d0 :BYTES-PER-SECOND
   1.8979833926453145d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1968933113
     :SINK-LOW 2654859235 :EXPECTED-HIGH 1968933113 :EXPECTED-LOW 2654859235
     :RAW-TICKS 2602 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 720460080
     :SINK-LOW 2942183124 :EXPECTED-HIGH 720460080 :EXPECTED-LOW 2942183124
     :RAW-TICKS 2679 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 1589008113
     :SINK-LOW 120282697 :EXPECTED-HIGH 1589008113 :EXPECTED-LOW 120282697
     :RAW-TICKS 2565 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 2550575438
     :SINK-LOW 2338601653 :EXPECTED-HIGH 2550575438 :EXPECTED-LOW 2338601653
     :RAW-TICKS 3346 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 12400000 :HEAP-BYTES 262080 :RAW-TICKS 4881 :SECONDS
   0.004881d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 12.2025d0 :BYTES-PER-SECOND
   2.540463019872977d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 1146898289 :SINK-LOW 3956010695
     :EXPECTED-HIGH 1146898289 :EXPECTED-LOW 3956010695 :RAW-TICKS 4155
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3369139433
     :SINK-LOW 218486121 :EXPECTED-HIGH 3369139433 :EXPECTED-LOW 218486121
     :RAW-TICKS 3897 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 1219137581
     :SINK-LOW 1925573001 :EXPECTED-HIGH 1219137581 :EXPECTED-LOW 1925573001
     :RAW-TICKS 3897 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 1615644071
     :SINK-LOW 3131688365 :EXPECTED-HIGH 1615644071 :EXPECTED-LOW 3131688365
     :RAW-TICKS 4855 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 12400000 :HEAP-BYTES 262080 :RAW-TICKS 5213 :SECONDS
   0.005213d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 13.0325d0 :BYTES-PER-SECOND
   2.3786687128333015d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 1146898289 :SINK-LOW 3956010695
     :EXPECTED-HIGH 1146898289 :EXPECTED-LOW 3956010695 :RAW-TICKS 5115
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3369139433
     :SINK-LOW 218486121 :EXPECTED-HIGH 3369139433 :EXPECTED-LOW 218486121
     :RAW-TICKS 3859 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 1219137581
     :SINK-LOW 1925573001 :EXPECTED-HIGH 1219137581 :EXPECTED-LOW 1925573001
     :RAW-TICKS 3899 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 1615644071
     :SINK-LOW 3131688365 :EXPECTED-HIGH 1615644071 :EXPECTED-LOW 3131688365
     :RAW-TICKS 3881 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 12400000 :HEAP-BYTES 262080 :RAW-TICKS 4791 :SECONDS
   0.004791d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 11.9775d0 :BYTES-PER-SECOND
   2.5881861824253807d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 1146898289 :SINK-LOW 3956010695
     :EXPECTED-HIGH 1146898289 :EXPECTED-LOW 3956010695 :RAW-TICKS 4686
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3369139433
     :SINK-LOW 218486121 :EXPECTED-HIGH 3369139433 :EXPECTED-LOW 218486121
     :RAW-TICKS 3865 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 1219137581
     :SINK-LOW 1925573001 :EXPECTED-HIGH 1219137581 :EXPECTED-LOW 1925573001
     :RAW-TICKS 3892 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 1615644071
     :SINK-LOW 3131688365 :EXPECTED-HIGH 1615644071 :EXPECTED-LOW 3131688365
     :RAW-TICKS 3866 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 12400000 :HEAP-BYTES 262080 :RAW-TICKS 5157 :SECONDS
   0.005157d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 12.8925d0 :BYTES-PER-SECOND
   2.4044987395772734d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 1146898289 :SINK-LOW 3956010695
     :EXPECTED-HIGH 1146898289 :EXPECTED-LOW 3956010695 :RAW-TICKS 3885
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3369139433
     :SINK-LOW 218486121 :EXPECTED-HIGH 3369139433 :EXPECTED-LOW 218486121
     :RAW-TICKS 5092 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 1219137581
     :SINK-LOW 1925573001 :EXPECTED-HIGH 1219137581 :EXPECTED-LOW 1925573001
     :RAW-TICKS 3886 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 1615644071
     :SINK-LOW 3131688365 :EXPECTED-HIGH 1615644071 :EXPECTED-LOW 3131688365
     :RAW-TICKS 3859 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 12400000 :HEAP-BYTES 262080 :RAW-TICKS 4585 :SECONDS
   0.004585d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 11.4625d0 :BYTES-PER-SECOND
   2.7044711014176664d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 1146898289 :SINK-LOW 3956010695
     :EXPECTED-HIGH 1146898289 :EXPECTED-LOW 3956010695 :RAW-TICKS 3896
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3369139433
     :SINK-LOW 218486121 :EXPECTED-HIGH 3369139433 :EXPECTED-LOW 218486121
     :RAW-TICKS 4512 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 1219137581
     :SINK-LOW 1925573001 :EXPECTED-HIGH 1219137581 :EXPECTED-LOW 1925573001
     :RAW-TICKS 3889 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 1615644071
     :SINK-LOW 3131688365 :EXPECTED-HIGH 1615644071 :EXPECTED-LOW 3131688365
     :RAW-TICKS 3878 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :MAX :REPLICA 0 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 12400000 :HEAP-BYTES 262080 :RAW-TICKS 3979 :SECONDS
   0.003979d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 9.9475d0 :BYTES-PER-SECOND
   3.1163608946971602d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3805149864
     :SINK-LOW 3424211333 :EXPECTED-HIGH 3805149864 :EXPECTED-LOW 3424211333
     :RAW-TICKS 3857 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 2964015274
     :SINK-LOW 2798110636 :EXPECTED-HIGH 2964015274 :EXPECTED-LOW 2798110636
     :RAW-TICKS 3894 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 2361353254
     :SINK-LOW 3843642160 :EXPECTED-HIGH 2361353254 :EXPECTED-LOW 3843642160
     :RAW-TICKS 3880 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 119819848
     :SINK-LOW 3367467320 :EXPECTED-HIGH 119819848 :EXPECTED-LOW 3367467320
     :RAW-TICKS 3872 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :MAX :REPLICA 1 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 12400000 :HEAP-BYTES 262080 :RAW-TICKS 5534 :SECONDS
   0.005534d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 13.835d0 :BYTES-PER-SECOND
   2.240693892302132d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3805149864
     :SINK-LOW 3424211333 :EXPECTED-HIGH 3805149864 :EXPECTED-LOW 3424211333
     :RAW-TICKS 3885 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 2964015274
     :SINK-LOW 2798110636 :EXPECTED-HIGH 2964015274 :EXPECTED-LOW 2798110636
     :RAW-TICKS 3886 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 2361353254
     :SINK-LOW 3843642160 :EXPECTED-HIGH 2361353254 :EXPECTED-LOW 3843642160
     :RAW-TICKS 5447 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 119819848
     :SINK-LOW 3367467320 :EXPECTED-HIGH 119819848 :EXPECTED-LOW 3367467320
     :RAW-TICKS 3884 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :MAX :REPLICA 2 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 12400000 :HEAP-BYTES 262080 :RAW-TICKS 4916 :SECONDS
   0.004916d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 12.29d0 :BYTES-PER-SECOND
   2.5223759153783565d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3805149864
     :SINK-LOW 3424211333 :EXPECTED-HIGH 3805149864 :EXPECTED-LOW 3424211333
     :RAW-TICKS 3904 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 2964015274
     :SINK-LOW 2798110636 :EXPECTED-HIGH 2964015274 :EXPECTED-LOW 2798110636
     :RAW-TICKS 3925 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 2361353254
     :SINK-LOW 3843642160 :EXPECTED-HIGH 2361353254 :EXPECTED-LOW 3843642160
     :RAW-TICKS 4171 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 119819848
     :SINK-LOW 3367467320 :EXPECTED-HIGH 119819848 :EXPECTED-LOW 3367467320
     :RAW-TICKS 4883 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :MAX :REPLICA 3 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 12400000 :HEAP-BYTES 262080 :RAW-TICKS 4805 :SECONDS
   0.004805d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 12.0125d0 :BYTES-PER-SECOND
   2.5806451612903223d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3805149864
     :SINK-LOW 3424211333 :EXPECTED-HIGH 3805149864 :EXPECTED-LOW 3424211333
     :RAW-TICKS 3936 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 2964015274
     :SINK-LOW 2798110636 :EXPECTED-HIGH 2964015274 :EXPECTED-LOW 2798110636
     :RAW-TICKS 3857 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 2361353254
     :SINK-LOW 3843642160 :EXPECTED-HIGH 2361353254 :EXPECTED-LOW 3843642160
     :RAW-TICKS 3865 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 119819848
     :SINK-LOW 3367467320 :EXPECTED-HIGH 119819848 :EXPECTED-LOW 3367467320
     :RAW-TICKS 4719 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :MAX :REPLICA 4 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 12400000 :HEAP-BYTES 262080 :RAW-TICKS 5193 :SECONDS
   0.005193d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 12.9825d0 :BYTES-PER-SECOND
   2.387829770845369d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3805149864
     :SINK-LOW 3424211333 :EXPECTED-HIGH 3805149864 :EXPECTED-LOW 3424211333
     :RAW-TICKS 5065 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 2964015274
     :SINK-LOW 2798110636 :EXPECTED-HIGH 2964015274 :EXPECTED-LOW 2798110636
     :RAW-TICKS 3882 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 2361353254
     :SINK-LOW 3843642160 :EXPECTED-HIGH 2361353254 :EXPECTED-LOW 3843642160
     :RAW-TICKS 3889 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 119819848
     :SINK-LOW 3367467320 :EXPECTED-HIGH 119819848 :EXPECTED-LOW 3367467320
     :RAW-TICKS 3886 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 12800000 :HEAP-BYTES 262080 :RAW-TICKS 4212 :SECONDS
   0.004212d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 10.53d0 :BYTES-PER-SECOND
   3.038936372269706d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 3363602882 :SINK-LOW 1789286091
     :EXPECTED-HIGH 3363602882 :EXPECTED-LOW 1789286091 :RAW-TICKS 3987
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3201968708
     :SINK-LOW 1702133910 :EXPECTED-HIGH 3201968708 :EXPECTED-LOW 1702133910
     :RAW-TICKS 4107 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 2330136033
     :SINK-LOW 193898623 :EXPECTED-HIGH 2330136033 :EXPECTED-LOW 193898623
     :RAW-TICKS 4034 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 495378139
     :SINK-LOW 3963289450 :EXPECTED-HIGH 495378139 :EXPECTED-LOW 3963289450
     :RAW-TICKS 4023 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 12800000 :HEAP-BYTES 262080 :RAW-TICKS 7991 :SECONDS
   0.007991d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 19.9775d0 :BYTES-PER-SECOND
   1.601802027280691d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 3363602882 :SINK-LOW 1789286091
     :EXPECTED-HIGH 3363602882 :EXPECTED-LOW 1789286091 :RAW-TICKS 4025
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3201968708
     :SINK-LOW 1702133910 :EXPECTED-HIGH 3201968708 :EXPECTED-LOW 1702133910
     :RAW-TICKS 3979 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 2330136033
     :SINK-LOW 193898623 :EXPECTED-HIGH 2330136033 :EXPECTED-LOW 193898623
     :RAW-TICKS 4023 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 495378139
     :SINK-LOW 3963289450 :EXPECTED-HIGH 495378139 :EXPECTED-LOW 3963289450
     :RAW-TICKS 3966 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 12800000 :HEAP-BYTES 262080 :RAW-TICKS 6792 :SECONDS
   0.006792d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 16.98d0 :BYTES-PER-SECOND
   1.884570082449941d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 3363602882 :SINK-LOW 1789286091
     :EXPECTED-HIGH 3363602882 :EXPECTED-LOW 1789286091 :RAW-TICKS 6639
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3201968708
     :SINK-LOW 1702133910 :EXPECTED-HIGH 3201968708 :EXPECTED-LOW 1702133910
     :RAW-TICKS 3893 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 2330136033
     :SINK-LOW 193898623 :EXPECTED-HIGH 2330136033 :EXPECTED-LOW 193898623
     :RAW-TICKS 5268 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 495378139
     :SINK-LOW 3963289450 :EXPECTED-HIGH 495378139 :EXPECTED-LOW 3963289450
     :RAW-TICKS 4990 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 12800000 :HEAP-BYTES 262080 :RAW-TICKS 6495 :SECONDS
   0.006495d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 16.2375d0 :BYTES-PER-SECOND
   1.970746728252502d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 3363602882 :SINK-LOW 1789286091
     :EXPECTED-HIGH 3363602882 :EXPECTED-LOW 1789286091 :RAW-TICKS 3974
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3201968708
     :SINK-LOW 1702133910 :EXPECTED-HIGH 3201968708 :EXPECTED-LOW 1702133910
     :RAW-TICKS 6361 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 2330136033
     :SINK-LOW 193898623 :EXPECTED-HIGH 2330136033 :EXPECTED-LOW 193898623
     :RAW-TICKS 3986 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 495378139
     :SINK-LOW 3963289450 :EXPECTED-HIGH 495378139 :EXPECTED-LOW 3963289450
     :RAW-TICKS 5894 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 12800000 :HEAP-BYTES 262080 :RAW-TICKS 8220 :SECONDS 0.00822d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 20.55d0 :BYTES-PER-SECOND
   1.5571776155717762d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 3363602882 :SINK-LOW 1789286091
     :EXPECTED-HIGH 3363602882 :EXPECTED-LOW 1789286091 :RAW-TICKS 3917
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3201968708
     :SINK-LOW 1702133910 :EXPECTED-HIGH 3201968708 :EXPECTED-LOW 1702133910
     :RAW-TICKS 3969 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 2330136033
     :SINK-LOW 193898623 :EXPECTED-HIGH 2330136033 :EXPECTED-LOW 193898623
     :RAW-TICKS 3991 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 495378139
     :SINK-LOW 3963289450 :EXPECTED-HIGH 495378139 :EXPECTED-LOW 3963289450
     :RAW-TICKS 4183 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :MAX :REPLICA 0 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 12800000 :HEAP-BYTES 262080 :RAW-TICKS 7837 :SECONDS
   0.007837d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 19.5925d0 :BYTES-PER-SECOND
   1.633278040066352d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1949789789
     :SINK-LOW 2753243215 :EXPECTED-HIGH 1949789789 :EXPECTED-LOW 2753243215
     :RAW-TICKS 3981 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 510052928
     :SINK-LOW 585018757 :EXPECTED-HIGH 510052928 :EXPECTED-LOW 585018757
     :RAW-TICKS 4013 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 1886531475
     :SINK-LOW 1613883356 :EXPECTED-HIGH 1886531475 :EXPECTED-LOW 1613883356
     :RAW-TICKS 3910 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 2950725007
     :SINK-LOW 1819630980 :EXPECTED-HIGH 2950725007 :EXPECTED-LOW 1819630980
     :RAW-TICKS 3857 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :MAX :REPLICA 1 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 12800000 :HEAP-BYTES 262080 :RAW-TICKS 8108 :SECONDS
   0.008108d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 20.270000000000003d0
   :BYTES-PER-SECOND 1.578687715836211d9 :COUNTER-SCOPE :WHOLE-PROCESS
   :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1949789789
     :SINK-LOW 2753243215 :EXPECTED-HIGH 1949789789 :EXPECTED-LOW 2753243215
     :RAW-TICKS 3971 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 510052928
     :SINK-LOW 585018757 :EXPECTED-HIGH 510052928 :EXPECTED-LOW 585018757
     :RAW-TICKS 4004 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 1886531475
     :SINK-LOW 1613883356 :EXPECTED-HIGH 1886531475 :EXPECTED-LOW 1613883356
     :RAW-TICKS 4025 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 2950725007
     :SINK-LOW 1819630980 :EXPECTED-HIGH 2950725007 :EXPECTED-LOW 1819630980
     :RAW-TICKS 3996 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :MAX :REPLICA 2 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 12800000 :HEAP-BYTES 262080 :RAW-TICKS 7839 :SECONDS
   0.007839d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 19.597500000000004d0
   :BYTES-PER-SECOND 1.6328613343538716d9 :COUNTER-SCOPE :WHOLE-PROCESS
   :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1949789789
     :SINK-LOW 2753243215 :EXPECTED-HIGH 1949789789 :EXPECTED-LOW 2753243215
     :RAW-TICKS 3975 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 510052928
     :SINK-LOW 585018757 :EXPECTED-HIGH 510052928 :EXPECTED-LOW 585018757
     :RAW-TICKS 3884 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 1886531475
     :SINK-LOW 1613883356 :EXPECTED-HIGH 1886531475 :EXPECTED-LOW 1613883356
     :RAW-TICKS 4004 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 2950725007
     :SINK-LOW 1819630980 :EXPECTED-HIGH 2950725007 :EXPECTED-LOW 1819630980
     :RAW-TICKS 3885 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :MAX :REPLICA 3 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 12800000 :HEAP-BYTES 262080 :RAW-TICKS 8042 :SECONDS
   0.008042d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 20.105000000000004d0
   :BYTES-PER-SECOND 1.591643869684158d9 :COUNTER-SCOPE :WHOLE-PROCESS
   :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1949789789
     :SINK-LOW 2753243215 :EXPECTED-HIGH 1949789789 :EXPECTED-LOW 2753243215
     :RAW-TICKS 4096 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 510052928
     :SINK-LOW 585018757 :EXPECTED-HIGH 510052928 :EXPECTED-LOW 585018757
     :RAW-TICKS 3955 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 1886531475
     :SINK-LOW 1613883356 :EXPECTED-HIGH 1886531475 :EXPECTED-LOW 1613883356
     :RAW-TICKS 3991 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 2950725007
     :SINK-LOW 1819630980 :EXPECTED-HIGH 2950725007 :EXPECTED-LOW 1819630980
     :RAW-TICKS 4012 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :MAX :REPLICA 4 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 12800000 :HEAP-BYTES 262080 :RAW-TICKS 8102 :SECONDS
   0.008102d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 20.255d0 :BYTES-PER-SECOND
   1.5798568254751914d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1949789789
     :SINK-LOW 2753243215 :EXPECTED-HIGH 1949789789 :EXPECTED-LOW 2753243215
     :RAW-TICKS 3884 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 510052928
     :SINK-LOW 585018757 :EXPECTED-HIGH 510052928 :EXPECTED-LOW 585018757
     :RAW-TICKS 4025 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 1886531475
     :SINK-LOW 1613883356 :EXPECTED-HIGH 1886531475 :EXPECTED-LOW 1613883356
     :RAW-TICKS 3972 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 2950725007
     :SINK-LOW 1819630980 :EXPECTED-HIGH 2950725007 :EXPECTED-LOW 1819630980
     :RAW-TICKS 4000 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 13200000 :HEAP-BYTES 262080 :RAW-TICKS 8217 :SECONDS
   0.008217d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 20.5425d0 :BYTES-PER-SECOND
   1.606425702811245d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 788434019 :SINK-LOW 1354428606
     :EXPECTED-HIGH 788434019 :EXPECTED-LOW 1354428606 :RAW-TICKS 4157
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3430793333
     :SINK-LOW 121908282 :EXPECTED-HIGH 3430793333 :EXPECTED-LOW 121908282
     :RAW-TICKS 4072 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 2500673524
     :SINK-LOW 1280770924 :EXPECTED-HIGH 2500673524 :EXPECTED-LOW 1280770924
     :RAW-TICKS 4158 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 3595463084
     :SINK-LOW 2469228081 :EXPECTED-HIGH 3595463084 :EXPECTED-LOW 2469228081
     :RAW-TICKS 4074 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 13200000 :HEAP-BYTES 262080 :RAW-TICKS 9740 :SECONDS 0.00974d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 24.35d0 :BYTES-PER-SECOND
   1.3552361396303902d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 788434019 :SINK-LOW 1354428606
     :EXPECTED-HIGH 788434019 :EXPECTED-LOW 1354428606 :RAW-TICKS 4060
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3430793333
     :SINK-LOW 121908282 :EXPECTED-HIGH 3430793333 :EXPECTED-LOW 121908282
     :RAW-TICKS 6100 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 2500673524
     :SINK-LOW 1280770924 :EXPECTED-HIGH 2500673524 :EXPECTED-LOW 1280770924
     :RAW-TICKS 5342 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 3595463084
     :SINK-LOW 2469228081 :EXPECTED-HIGH 3595463084 :EXPECTED-LOW 2469228081
     :RAW-TICKS 5478 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 13200000 :HEAP-BYTES 262080 :RAW-TICKS 8374 :SECONDS
   0.008374d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 20.935d0 :BYTES-PER-SECOND
   1.5763076188201578d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 788434019 :SINK-LOW 1354428606
     :EXPECTED-HIGH 788434019 :EXPECTED-LOW 1354428606 :RAW-TICKS 4170
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3430793333
     :SINK-LOW 121908282 :EXPECTED-HIGH 3430793333 :EXPECTED-LOW 121908282
     :RAW-TICKS 4182 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 2500673524
     :SINK-LOW 1280770924 :EXPECTED-HIGH 2500673524 :EXPECTED-LOW 1280770924
     :RAW-TICKS 4163 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 3595463084
     :SINK-LOW 2469228081 :EXPECTED-HIGH 3595463084 :EXPECTED-LOW 2469228081
     :RAW-TICKS 4144 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 13200000 :HEAP-BYTES 262080 :RAW-TICKS 8435 :SECONDS
   0.008435d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 21.0875d0 :BYTES-PER-SECOND
   1.5649081209247184d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 788434019 :SINK-LOW 1354428606
     :EXPECTED-HIGH 788434019 :EXPECTED-LOW 1354428606 :RAW-TICKS 4154
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3430793333
     :SINK-LOW 121908282 :EXPECTED-HIGH 3430793333 :EXPECTED-LOW 121908282
     :RAW-TICKS 4872 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 2500673524
     :SINK-LOW 1280770924 :EXPECTED-HIGH 2500673524 :EXPECTED-LOW 1280770924
     :RAW-TICKS 4146 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 3595463084
     :SINK-LOW 2469228081 :EXPECTED-HIGH 3595463084 :EXPECTED-LOW 2469228081
     :RAW-TICKS 5835 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 13200000 :HEAP-BYTES 262080 :RAW-TICKS 10213 :SECONDS
   0.010213d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 25.5325d0 :BYTES-PER-SECOND
   1.2924703808871047d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 788434019 :SINK-LOW 1354428606
     :EXPECTED-HIGH 788434019 :EXPECTED-LOW 1354428606 :RAW-TICKS 4164
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3430793333
     :SINK-LOW 121908282 :EXPECTED-HIGH 3430793333 :EXPECTED-LOW 121908282
     :RAW-TICKS 5957 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 2500673524
     :SINK-LOW 1280770924 :EXPECTED-HIGH 2500673524 :EXPECTED-LOW 1280770924
     :RAW-TICKS 4154 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 3595463084
     :SINK-LOW 2469228081 :EXPECTED-HIGH 3595463084 :EXPECTED-LOW 2469228081
     :RAW-TICKS 4197 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :MAX :REPLICA 0 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 13200000 :HEAP-BYTES 262080 :RAW-TICKS 9832 :SECONDS
   0.009832d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 24.58d0 :BYTES-PER-SECOND
   1.342554922701383d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 246156341
     :SINK-LOW 3263108042 :EXPECTED-HIGH 246156341 :EXPECTED-LOW 3263108042
     :RAW-TICKS 4814 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1447544752
     :SINK-LOW 3400689237 :EXPECTED-HIGH 1447544752 :EXPECTED-LOW 3400689237
     :RAW-TICKS 4841 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 4044346189
     :SINK-LOW 3260688401 :EXPECTED-HIGH 4044346189 :EXPECTED-LOW 3260688401
     :RAW-TICKS 4856 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 3395138120
     :SINK-LOW 2416737044 :EXPECTED-HIGH 3395138120 :EXPECTED-LOW 2416737044
     :RAW-TICKS 4827 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :MAX :REPLICA 1 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 13200000 :HEAP-BYTES 262080 :RAW-TICKS 9908 :SECONDS
   0.009908d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 24.77d0 :BYTES-PER-SECOND
   1.3322567622123537d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 246156341
     :SINK-LOW 3263108042 :EXPECTED-HIGH 246156341 :EXPECTED-LOW 3263108042
     :RAW-TICKS 4819 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1447544752
     :SINK-LOW 3400689237 :EXPECTED-HIGH 1447544752 :EXPECTED-LOW 3400689237
     :RAW-TICKS 4835 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 4044346189
     :SINK-LOW 3260688401 :EXPECTED-HIGH 4044346189 :EXPECTED-LOW 3260688401
     :RAW-TICKS 4829 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 3395138120
     :SINK-LOW 2416737044 :EXPECTED-HIGH 3395138120 :EXPECTED-LOW 2416737044
     :RAW-TICKS 4899 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :MAX :REPLICA 2 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 13200000 :HEAP-BYTES 262080 :RAW-TICKS 9905 :SECONDS
   0.009905d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 24.7625d0 :BYTES-PER-SECOND
   1.332660272589601d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 246156341
     :SINK-LOW 3263108042 :EXPECTED-HIGH 246156341 :EXPECTED-LOW 3263108042
     :RAW-TICKS 4917 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1447544752
     :SINK-LOW 3400689237 :EXPECTED-HIGH 1447544752 :EXPECTED-LOW 3400689237
     :RAW-TICKS 4841 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 4044346189
     :SINK-LOW 3260688401 :EXPECTED-HIGH 4044346189 :EXPECTED-LOW 3260688401
     :RAW-TICKS 4814 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 3395138120
     :SINK-LOW 2416737044 :EXPECTED-HIGH 3395138120 :EXPECTED-LOW 2416737044
     :RAW-TICKS 4798 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :MAX :REPLICA 3 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 13200000 :HEAP-BYTES 262080 :RAW-TICKS 6372 :SECONDS
   0.006372d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 15.93d0 :BYTES-PER-SECOND
   2.0715630885122411d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 246156341
     :SINK-LOW 3263108042 :EXPECTED-HIGH 246156341 :EXPECTED-LOW 3263108042
     :RAW-TICKS 4882 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1447544752
     :SINK-LOW 3400689237 :EXPECTED-HIGH 1447544752 :EXPECTED-LOW 3400689237
     :RAW-TICKS 5421 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 4044346189
     :SINK-LOW 3260688401 :EXPECTED-HIGH 4044346189 :EXPECTED-LOW 3260688401
     :RAW-TICKS 6306 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 3395138120
     :SINK-LOW 2416737044 :EXPECTED-HIGH 3395138120 :EXPECTED-LOW 2416737044
     :RAW-TICKS 4824 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :MAX :REPLICA 4 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 13200000 :HEAP-BYTES 262080 :RAW-TICKS 6432 :SECONDS
   0.006432d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 16.08d0 :BYTES-PER-SECOND
   2.0522388059701493d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 246156341
     :SINK-LOW 3263108042 :EXPECTED-HIGH 246156341 :EXPECTED-LOW 3263108042
     :RAW-TICKS 4895 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1447544752
     :SINK-LOW 3400689237 :EXPECTED-HIGH 1447544752 :EXPECTED-LOW 3400689237
     :RAW-TICKS 5124 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 4044346189
     :SINK-LOW 3260688401 :EXPECTED-HIGH 4044346189 :EXPECTED-LOW 3260688401
     :RAW-TICKS 6284 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 3395138120
     :SINK-LOW 2416737044 :EXPECTED-HIGH 3395138120 :EXPECTED-LOW 2416737044
     :RAW-TICKS 6059 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 25600000 :HEAP-BYTES 262080 :RAW-TICKS 8906 :SECONDS
   0.008906d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 22.265d0 :BYTES-PER-SECOND
   2.874466651695486d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 931690014 :SINK-LOW 3112436852
     :EXPECTED-HIGH 931690014 :EXPECTED-LOW 3112436852 :RAW-TICKS 8780
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 1505835051
     :SINK-LOW 3743177252 :EXPECTED-HIGH 1505835051 :EXPECTED-LOW 3743177252
     :RAW-TICKS 8005 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 1141866063
     :SINK-LOW 4139692541 :EXPECTED-HIGH 1141866063 :EXPECTED-LOW 4139692541
     :RAW-TICKS 6748 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 1912498435
     :SINK-LOW 1510496551 :EXPECTED-HIGH 1912498435 :EXPECTED-LOW 1510496551
     :RAW-TICKS 6783 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 25600000 :HEAP-BYTES 262080 :RAW-TICKS 8567 :SECONDS
   0.008567d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 21.4175d0 :BYTES-PER-SECOND
   2.9882105754639897d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 931690014 :SINK-LOW 3112436852
     :EXPECTED-HIGH 931690014 :EXPECTED-LOW 3112436852 :RAW-TICKS 5890
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 1505835051
     :SINK-LOW 3743177252 :EXPECTED-HIGH 1505835051 :EXPECTED-LOW 3743177252
     :RAW-TICKS 5846 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 1141866063
     :SINK-LOW 4139692541 :EXPECTED-HIGH 1141866063 :EXPECTED-LOW 4139692541
     :RAW-TICKS 8424 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 1912498435
     :SINK-LOW 1510496551 :EXPECTED-HIGH 1912498435 :EXPECTED-LOW 1510496551
     :RAW-TICKS 8467 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 25600000 :HEAP-BYTES 262080 :RAW-TICKS 8513 :SECONDS
   0.008513d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 21.2825d0 :BYTES-PER-SECOND
   3.0071655115705395d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 931690014 :SINK-LOW 3112436852
     :EXPECTED-HIGH 931690014 :EXPECTED-LOW 3112436852 :RAW-TICKS 6413
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 1505835051
     :SINK-LOW 3743177252 :EXPECTED-HIGH 1505835051 :EXPECTED-LOW 3743177252
     :RAW-TICKS 8398 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 1141866063
     :SINK-LOW 4139692541 :EXPECTED-HIGH 1141866063 :EXPECTED-LOW 4139692541
     :RAW-TICKS 6780 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 1912498435
     :SINK-LOW 1510496551 :EXPECTED-HIGH 1912498435 :EXPECTED-LOW 1510496551
     :RAW-TICKS 5829 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 25600000 :HEAP-BYTES 262080 :RAW-TICKS 8324 :SECONDS
   0.008324d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 20.81d0 :BYTES-PER-SECOND
   3.0754444978375783d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 931690014 :SINK-LOW 3112436852
     :EXPECTED-HIGH 931690014 :EXPECTED-LOW 3112436852 :RAW-TICKS 7952
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 1505835051
     :SINK-LOW 3743177252 :EXPECTED-HIGH 1505835051 :EXPECTED-LOW 3743177252
     :RAW-TICKS 8254 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 1141866063
     :SINK-LOW 4139692541 :EXPECTED-HIGH 1141866063 :EXPECTED-LOW 4139692541
     :RAW-TICKS 6055 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 1912498435
     :SINK-LOW 1510496551 :EXPECTED-HIGH 1912498435 :EXPECTED-LOW 1510496551
     :RAW-TICKS 5828 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 25600000 :HEAP-BYTES 262080 :RAW-TICKS 8341 :SECONDS
   0.008341d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 20.8525d0 :BYTES-PER-SECOND
   3.0691763577508693d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 931690014 :SINK-LOW 3112436852
     :EXPECTED-HIGH 931690014 :EXPECTED-LOW 3112436852 :RAW-TICKS 8180
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 1505835051
     :SINK-LOW 3743177252 :EXPECTED-HIGH 1505835051 :EXPECTED-LOW 3743177252
     :RAW-TICKS 5814 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 1141866063
     :SINK-LOW 4139692541 :EXPECTED-HIGH 1141866063 :EXPECTED-LOW 4139692541
     :RAW-TICKS 6920 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 1912498435
     :SINK-LOW 1510496551 :EXPECTED-HIGH 1912498435 :EXPECTED-LOW 1510496551
     :RAW-TICKS 5842 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :MAX :REPLICA 0 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 25600000 :HEAP-BYTES 262080 :RAW-TICKS 8477 :SECONDS
   0.008477d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 21.1925d0 :BYTES-PER-SECOND
   3.0199362982187095d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1854669567
     :SINK-LOW 3500381958 :EXPECTED-HIGH 1854669567 :EXPECTED-LOW 3500381958
     :RAW-TICKS 8339 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1416522479
     :SINK-LOW 2753777158 :EXPECTED-HIGH 1416522479 :EXPECTED-LOW 2753777158
     :RAW-TICKS 5831 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 736439762
     :SINK-LOW 4017799148 :EXPECTED-HIGH 736439762 :EXPECTED-LOW 4017799148
     :RAW-TICKS 8157 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 134937909
     :SINK-LOW 831079957 :EXPECTED-HIGH 134937909 :EXPECTED-LOW 831079957
     :RAW-TICKS 5982 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :MAX :REPLICA 1 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 25600000 :HEAP-BYTES 262080 :RAW-TICKS 9399 :SECONDS
   0.009399d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 23.4975d0 :BYTES-PER-SECOND
   2.7236940100010643d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1854669567
     :SINK-LOW 3500381958 :EXPECTED-HIGH 1854669567 :EXPECTED-LOW 3500381958
     :RAW-TICKS 9277 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1416522479
     :SINK-LOW 2753777158 :EXPECTED-HIGH 1416522479 :EXPECTED-LOW 2753777158
     :RAW-TICKS 5868 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 736439762
     :SINK-LOW 4017799148 :EXPECTED-HIGH 736439762 :EXPECTED-LOW 4017799148
     :RAW-TICKS 8733 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 134937909
     :SINK-LOW 831079957 :EXPECTED-HIGH 134937909 :EXPECTED-LOW 831079957
     :RAW-TICKS 7362 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :MAX :REPLICA 2 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 25600000 :HEAP-BYTES 262080 :RAW-TICKS 9969 :SECONDS
   0.009969d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 24.9225d0 :BYTES-PER-SECOND
   2.5679606781021166d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1854669567
     :SINK-LOW 3500381958 :EXPECTED-HIGH 1854669567 :EXPECTED-LOW 3500381958
     :RAW-TICKS 9750 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1416522479
     :SINK-LOW 2753777158 :EXPECTED-HIGH 1416522479 :EXPECTED-LOW 2753777158
     :RAW-TICKS 7073 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 736439762
     :SINK-LOW 4017799148 :EXPECTED-HIGH 736439762 :EXPECTED-LOW 4017799148
     :RAW-TICKS 9594 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 134937909
     :SINK-LOW 831079957 :EXPECTED-HIGH 134937909 :EXPECTED-LOW 831079957
     :RAW-TICKS 7241 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :MAX :REPLICA 3 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 25600000 :HEAP-BYTES 262080 :RAW-TICKS 9075 :SECONDS
   0.009075d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 22.6875d0 :BYTES-PER-SECOND
   2.8209366391184573d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1854669567
     :SINK-LOW 3500381958 :EXPECTED-HIGH 1854669567 :EXPECTED-LOW 3500381958
     :RAW-TICKS 7176 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1416522479
     :SINK-LOW 2753777158 :EXPECTED-HIGH 1416522479 :EXPECTED-LOW 2753777158
     :RAW-TICKS 8941 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 736439762
     :SINK-LOW 4017799148 :EXPECTED-HIGH 736439762 :EXPECTED-LOW 4017799148
     :RAW-TICKS 8460 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 134937909
     :SINK-LOW 831079957 :EXPECTED-HIGH 134937909 :EXPECTED-LOW 831079957
     :RAW-TICKS 6167 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :MAX :REPLICA 4 :WORKERS 4 :ITERATIONS 100000 :COMPLETED
   400000 :BYTES 25600000 :HEAP-BYTES 262080 :RAW-TICKS 8533 :SECONDS
   0.008533d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 21.3325d0 :BYTES-PER-SECOND
   3.0001171920778155d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 1854669567
     :SINK-LOW 3500381958 :EXPECTED-HIGH 1854669567 :EXPECTED-LOW 3500381958
     :RAW-TICKS 6509 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1416522479
     :SINK-LOW 2753777158 :EXPECTED-HIGH 1416522479 :EXPECTED-LOW 2753777158
     :RAW-TICKS 8411 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 736439762
     :SINK-LOW 4017799148 :EXPECTED-HIGH 736439762 :EXPECTED-LOW 4017799148
     :RAW-TICKS 8465 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 100000 :COMPLETED
     100000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 134937909
     :SINK-LOW 831079957 :EXPECTED-HIGH 134937909 :EXPECTED-LOW 831079957
     :RAW-TICKS 6491 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 4 :ITERATIONS 25000 :COMPLETED
   100000 :BYTES 25600000 :HEAP-BYTES 262080 :RAW-TICKS 6096 :SECONDS
   0.006096d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 60.96d0 :BYTES-PER-SECOND
   4.199475065616798d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 3650340472 :SINK-LOW 91924045
     :EXPECTED-HIGH 3650340472 :EXPECTED-LOW 91924045 :RAW-TICKS 5925
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 998813170
     :SINK-LOW 563060723 :EXPECTED-HIGH 998813170 :EXPECTED-LOW 563060723
     :RAW-TICKS 5925 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 1246837787
     :SINK-LOW 1991661114 :EXPECTED-HIGH 1246837787 :EXPECTED-LOW 1991661114
     :RAW-TICKS 4175 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 2078374745
     :SINK-LOW 672468098 :EXPECTED-HIGH 2078374745 :EXPECTED-LOW 672468098
     :RAW-TICKS 4184 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 4 :ITERATIONS 25000 :COMPLETED
   100000 :BYTES 25600000 :HEAP-BYTES 262080 :RAW-TICKS 6046 :SECONDS
   0.006046d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 60.46d0 :BYTES-PER-SECOND
   4.2342044326827655d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 3650340472 :SINK-LOW 91924045
     :EXPECTED-HIGH 3650340472 :EXPECTED-LOW 91924045 :RAW-TICKS 4165
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 998813170
     :SINK-LOW 563060723 :EXPECTED-HIGH 998813170 :EXPECTED-LOW 563060723
     :RAW-TICKS 5926 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 1246837787
     :SINK-LOW 1991661114 :EXPECTED-HIGH 1246837787 :EXPECTED-LOW 1991661114
     :RAW-TICKS 5927 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 2078374745
     :SINK-LOW 672468098 :EXPECTED-HIGH 2078374745 :EXPECTED-LOW 672468098
     :RAW-TICKS 4182 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 4 :ITERATIONS 25000 :COMPLETED
   100000 :BYTES 25600000 :HEAP-BYTES 262080 :RAW-TICKS 6057 :SECONDS
   0.006057d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 60.57d0 :BYTES-PER-SECOND
   4.226514776291894d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 3650340472 :SINK-LOW 91924045
     :EXPECTED-HIGH 3650340472 :EXPECTED-LOW 91924045 :RAW-TICKS 5943
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 998813170
     :SINK-LOW 563060723 :EXPECTED-HIGH 998813170 :EXPECTED-LOW 563060723
     :RAW-TICKS 4201 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 1246837787
     :SINK-LOW 1991661114 :EXPECTED-HIGH 1246837787 :EXPECTED-LOW 1991661114
     :RAW-TICKS 4185 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 2078374745
     :SINK-LOW 672468098 :EXPECTED-HIGH 2078374745 :EXPECTED-LOW 672468098
     :RAW-TICKS 5951 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 4 :ITERATIONS 25000 :COMPLETED
   100000 :BYTES 25600000 :HEAP-BYTES 262080 :RAW-TICKS 6821 :SECONDS
   0.006821d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 68.21d0 :BYTES-PER-SECOND
   3.75311537897669d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 3650340472 :SINK-LOW 91924045
     :EXPECTED-HIGH 3650340472 :EXPECTED-LOW 91924045 :RAW-TICKS 4181
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 998813170
     :SINK-LOW 563060723 :EXPECTED-HIGH 998813170 :EXPECTED-LOW 563060723
     :RAW-TICKS 4369 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 1246837787
     :SINK-LOW 1991661114 :EXPECTED-HIGH 1246837787 :EXPECTED-LOW 1991661114
     :RAW-TICKS 6712 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 2078374745
     :SINK-LOW 672468098 :EXPECTED-HIGH 2078374745 :EXPECTED-LOW 672468098
     :RAW-TICKS 5949 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 4 :ITERATIONS 25000 :COMPLETED
   100000 :BYTES 25600000 :HEAP-BYTES 262080 :RAW-TICKS 6908 :SECONDS
   0.006908d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 69.08d0 :BYTES-PER-SECOND
   3.705848291835553d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 3650340472 :SINK-LOW 91924045
     :EXPECTED-HIGH 3650340472 :EXPECTED-LOW 91924045 :RAW-TICKS 6743
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 998813170
     :SINK-LOW 563060723 :EXPECTED-HIGH 998813170 :EXPECTED-LOW 563060723
     :RAW-TICKS 4682 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 1246837787
     :SINK-LOW 1991661114 :EXPECTED-HIGH 1246837787 :EXPECTED-LOW 1991661114
     :RAW-TICKS 4203 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 2078374745
     :SINK-LOW 672468098 :EXPECTED-HIGH 2078374745 :EXPECTED-LOW 672468098
     :RAW-TICKS 6136 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :MAX :REPLICA 0 :WORKERS 4 :ITERATIONS 25000 :COMPLETED
   100000 :BYTES 25600000 :HEAP-BYTES 262080 :RAW-TICKS 7050 :SECONDS 0.00705d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 70.5d0 :BYTES-PER-SECOND
   3.6312056737588654d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3822163365
     :SINK-LOW 3634861316 :EXPECTED-HIGH 3822163365 :EXPECTED-LOW 3634861316
     :RAW-TICKS 4933 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1042287200
     :SINK-LOW 2602565293 :EXPECTED-HIGH 1042287200 :EXPECTED-LOW 2602565293
     :RAW-TICKS 6882 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 2464860224
     :SINK-LOW 4270557447 :EXPECTED-HIGH 2464860224 :EXPECTED-LOW 4270557447
     :RAW-TICKS 6334 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 1719692698
     :SINK-LOW 3458219453 :EXPECTED-HIGH 1719692698 :EXPECTED-LOW 3458219453
     :RAW-TICKS 5801 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :MAX :REPLICA 1 :WORKERS 4 :ITERATIONS 25000 :COMPLETED
   100000 :BYTES 25600000 :HEAP-BYTES 262080 :RAW-TICKS 7186 :SECONDS
   0.007186d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 71.86d0 :BYTES-PER-SECOND
   3.562482605065405d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3822163365
     :SINK-LOW 3634861316 :EXPECTED-HIGH 3822163365 :EXPECTED-LOW 3634861316
     :RAW-TICKS 6180 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1042287200
     :SINK-LOW 2602565293 :EXPECTED-HIGH 1042287200 :EXPECTED-LOW 2602565293
     :RAW-TICKS 6837 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 2464860224
     :SINK-LOW 4270557447 :EXPECTED-HIGH 2464860224 :EXPECTED-LOW 4270557447
     :RAW-TICKS 7103 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 1719692698
     :SINK-LOW 3458219453 :EXPECTED-HIGH 1719692698 :EXPECTED-LOW 3458219453
     :RAW-TICKS 4206 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :MAX :REPLICA 2 :WORKERS 4 :ITERATIONS 25000 :COMPLETED
   100000 :BYTES 25600000 :HEAP-BYTES 262080 :RAW-TICKS 7181 :SECONDS
   0.007181d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 71.81d0 :BYTES-PER-SECOND
   3.564963097061691d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3822163365
     :SINK-LOW 3634861316 :EXPECTED-HIGH 3822163365 :EXPECTED-LOW 3634861316
     :RAW-TICKS 4852 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1042287200
     :SINK-LOW 2602565293 :EXPECTED-HIGH 1042287200 :EXPECTED-LOW 2602565293
     :RAW-TICKS 7066 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 2464860224
     :SINK-LOW 4270557447 :EXPECTED-HIGH 2464860224 :EXPECTED-LOW 4270557447
     :RAW-TICKS 6901 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 1719692698
     :SINK-LOW 3458219453 :EXPECTED-HIGH 1719692698 :EXPECTED-LOW 3458219453
     :RAW-TICKS 6404 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :MAX :REPLICA 3 :WORKERS 4 :ITERATIONS 25000 :COMPLETED
   100000 :BYTES 25600000 :HEAP-BYTES 262080 :RAW-TICKS 6902 :SECONDS
   0.006902d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 69.02d0 :BYTES-PER-SECOND
   3.709069834830484d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3822163365
     :SINK-LOW 3634861316 :EXPECTED-HIGH 3822163365 :EXPECTED-LOW 3634861316
     :RAW-TICKS 6685 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1042287200
     :SINK-LOW 2602565293 :EXPECTED-HIGH 1042287200 :EXPECTED-LOW 2602565293
     :RAW-TICKS 4204 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 2464860224
     :SINK-LOW 4270557447 :EXPECTED-HIGH 2464860224 :EXPECTED-LOW 4270557447
     :RAW-TICKS 5999 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 1719692698
     :SINK-LOW 3458219453 :EXPECTED-HIGH 1719692698 :EXPECTED-LOW 3458219453
     :RAW-TICKS 4331 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :MAX :REPLICA 4 :WORKERS 4 :ITERATIONS 25000 :COMPLETED
   100000 :BYTES 25600000 :HEAP-BYTES 262080 :RAW-TICKS 7083 :SECONDS
   0.007083d0 :TIME-QUALITY :MEASURED :NS-PER-CALL 70.83d0 :BYTES-PER-SECOND
   3.6142877311873503d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3822163365
     :SINK-LOW 3634861316 :EXPECTED-HIGH 3822163365 :EXPECTED-LOW 3634861316
     :RAW-TICKS 6145 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1042287200
     :SINK-LOW 2602565293 :EXPECTED-HIGH 1042287200 :EXPECTED-LOW 2602565293
     :RAW-TICKS 6887 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 2464860224
     :SINK-LOW 4270557447 :EXPECTED-HIGH 2464860224 :EXPECTED-LOW 4270557447
     :RAW-TICKS 6217 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 25000 :COMPLETED
     25000 :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 1719692698
     :SINK-LOW 3458219453 :EXPECTED-HIGH 1719692698 :EXPECTED-LOW 3458219453
     :RAW-TICKS 4187 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 4 :ITERATIONS 6250 :COMPLETED
   25000 :BYTES 25600000 :HEAP-BYTES 262080 :RAW-TICKS 6385 :SECONDS 0.006385d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 255.4d0 :BYTES-PER-SECOND
   4.009397024275646d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 314608995 :SINK-LOW 2823576381
     :EXPECTED-HIGH 314608995 :EXPECTED-LOW 2823576381 :RAW-TICKS 5839
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 2371232589 :SINK-LOW
     666793452 :EXPECTED-HIGH 2371232589 :EXPECTED-LOW 666793452 :RAW-TICKS
     4358 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 2869719954 :SINK-LOW
     3612617347 :EXPECTED-HIGH 2869719954 :EXPECTED-LOW 3612617347 :RAW-TICKS
     6302 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 3386938691 :SINK-LOW
     3247628390 :EXPECTED-HIGH 3386938691 :EXPECTED-LOW 3247628390 :RAW-TICKS
     4392 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 4 :ITERATIONS 6250 :COMPLETED
   25000 :BYTES 25600000 :HEAP-BYTES 262080 :RAW-TICKS 9943 :SECONDS 0.009943d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 397.72d0 :BYTES-PER-SECOND
   2.574675651211908d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 314608995 :SINK-LOW 2823576381
     :EXPECTED-HIGH 314608995 :EXPECTED-LOW 2823576381 :RAW-TICKS 6474
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 2371232589 :SINK-LOW
     666793452 :EXPECTED-HIGH 2371232589 :EXPECTED-LOW 666793452 :RAW-TICKS
     9585 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 2869719954 :SINK-LOW
     3612617347 :EXPECTED-HIGH 2869719954 :EXPECTED-LOW 3612617347 :RAW-TICKS
     9130 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 3386938691 :SINK-LOW
     3247628390 :EXPECTED-HIGH 3386938691 :EXPECTED-LOW 3247628390 :RAW-TICKS
     3750 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 4 :ITERATIONS 6250 :COMPLETED
   25000 :BYTES 25600000 :HEAP-BYTES 262080 :RAW-TICKS 7240 :SECONDS 0.00724d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 289.6d0 :BYTES-PER-SECOND
   3.5359116022099447d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 314608995 :SINK-LOW 2823576381
     :EXPECTED-HIGH 314608995 :EXPECTED-LOW 2823576381 :RAW-TICKS 7041
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 2371232589 :SINK-LOW
     666793452 :EXPECTED-HIGH 2371232589 :EXPECTED-LOW 666793452 :RAW-TICKS
     5920 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 2869719954 :SINK-LOW
     3612617347 :EXPECTED-HIGH 2869719954 :EXPECTED-LOW 3612617347 :RAW-TICKS
     6580 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 3386938691 :SINK-LOW
     3247628390 :EXPECTED-HIGH 3386938691 :EXPECTED-LOW 3247628390 :RAW-TICKS
     4376 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 4 :ITERATIONS 6250 :COMPLETED
   25000 :BYTES 25600000 :HEAP-BYTES 262080 :RAW-TICKS 6789 :SECONDS 0.006789d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 271.56d0 :BYTES-PER-SECOND
   3.770805715127412d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 314608995 :SINK-LOW 2823576381
     :EXPECTED-HIGH 314608995 :EXPECTED-LOW 2823576381 :RAW-TICKS 6615
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 2371232589 :SINK-LOW
     666793452 :EXPECTED-HIGH 2371232589 :EXPECTED-LOW 666793452 :RAW-TICKS
     6659 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 2869719954 :SINK-LOW
     3612617347 :EXPECTED-HIGH 2869719954 :EXPECTED-LOW 3612617347 :RAW-TICKS
     6031 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 3386938691 :SINK-LOW
     3247628390 :EXPECTED-HIGH 3386938691 :EXPECTED-LOW 3247628390 :RAW-TICKS
     4369 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 4 :ITERATIONS 6250 :COMPLETED
   25000 :BYTES 25600000 :HEAP-BYTES 262080 :RAW-TICKS 6330 :SECONDS 0.00633d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 253.2d0 :BYTES-PER-SECOND
   4.044233807266983d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 314608995 :SINK-LOW 2823576381
     :EXPECTED-HIGH 314608995 :EXPECTED-LOW 2823576381 :RAW-TICKS 4754
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 2371232589 :SINK-LOW
     666793452 :EXPECTED-HIGH 2371232589 :EXPECTED-LOW 666793452 :RAW-TICKS
     5059 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 2869719954 :SINK-LOW
     3612617347 :EXPECTED-HIGH 2869719954 :EXPECTED-LOW 3612617347 :RAW-TICKS
     6215 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 3386938691 :SINK-LOW
     3247628390 :EXPECTED-HIGH 3386938691 :EXPECTED-LOW 3247628390 :RAW-TICKS
     5561 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :MAX :REPLICA 0 :WORKERS 4 :ITERATIONS 6250 :COMPLETED 25000
   :BYTES 25600000 :HEAP-BYTES 262080 :RAW-TICKS 8020 :SECONDS 0.00802d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 320.79999999999995d0 :BYTES-PER-SECOND
   3.1920199501246886d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3518727484 :SINK-LOW
     598906486 :EXPECTED-HIGH 3518727484 :EXPECTED-LOW 598906486 :RAW-TICKS
     4335 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 26602956 :SINK-LOW
     3388797188 :EXPECTED-HIGH 26602956 :EXPECTED-LOW 3388797188 :RAW-TICKS
     7512 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 3512704860 :SINK-LOW
     2921192416 :EXPECTED-HIGH 3512704860 :EXPECTED-LOW 2921192416 :RAW-TICKS
     7845 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 2268130392 :SINK-LOW
     657902069 :EXPECTED-HIGH 2268130392 :EXPECTED-LOW 657902069 :RAW-TICKS
     6751 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :MAX :REPLICA 1 :WORKERS 4 :ITERATIONS 6250 :COMPLETED 25000
   :BYTES 25600000 :HEAP-BYTES 262080 :RAW-TICKS 12746 :SECONDS 0.012746d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 509.84d0 :BYTES-PER-SECOND
   2.0084732465087085d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3518727484 :SINK-LOW
     598906486 :EXPECTED-HIGH 3518727484 :EXPECTED-LOW 598906486 :RAW-TICKS
     11294 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 26602956 :SINK-LOW
     3388797188 :EXPECTED-HIGH 26602956 :EXPECTED-LOW 3388797188 :RAW-TICKS
     4383 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 3512704860 :SINK-LOW
     2921192416 :EXPECTED-HIGH 3512704860 :EXPECTED-LOW 2921192416 :RAW-TICKS
     11472 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 2268130392 :SINK-LOW
     657902069 :EXPECTED-HIGH 2268130392 :EXPECTED-LOW 657902069 :RAW-TICKS
     5711 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :MAX :REPLICA 2 :WORKERS 4 :ITERATIONS 6250 :COMPLETED 25000
   :BYTES 25600000 :HEAP-BYTES 262080 :RAW-TICKS 7717 :SECONDS 0.007717d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 308.68d0 :BYTES-PER-SECOND
   3.3173513023195543d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3518727484 :SINK-LOW
     598906486 :EXPECTED-HIGH 3518727484 :EXPECTED-LOW 598906486 :RAW-TICKS
     6349 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 26602956 :SINK-LOW
     3388797188 :EXPECTED-HIGH 26602956 :EXPECTED-LOW 3388797188 :RAW-TICKS
     5369 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 3512704860 :SINK-LOW
     2921192416 :EXPECTED-HIGH 3512704860 :EXPECTED-LOW 2921192416 :RAW-TICKS
     7517 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 2268130392 :SINK-LOW
     657902069 :EXPECTED-HIGH 2268130392 :EXPECTED-LOW 657902069 :RAW-TICKS
     7054 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :MAX :REPLICA 3 :WORKERS 4 :ITERATIONS 6250 :COMPLETED 25000
   :BYTES 25600000 :HEAP-BYTES 262080 :RAW-TICKS 13313 :SECONDS 0.013313d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 532.52d0 :BYTES-PER-SECOND
   1.9229324720198302d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3518727484 :SINK-LOW
     598906486 :EXPECTED-HIGH 3518727484 :EXPECTED-LOW 598906486 :RAW-TICKS
     8739 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 26602956 :SINK-LOW
     3388797188 :EXPECTED-HIGH 26602956 :EXPECTED-LOW 3388797188 :RAW-TICKS
     7236 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 3512704860 :SINK-LOW
     2921192416 :EXPECTED-HIGH 3512704860 :EXPECTED-LOW 2921192416 :RAW-TICKS
     13195 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 2268130392 :SINK-LOW
     657902069 :EXPECTED-HIGH 2268130392 :EXPECTED-LOW 657902069 :RAW-TICKS
     4363 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :MAX :REPLICA 4 :WORKERS 4 :ITERATIONS 6250 :COMPLETED 25000
   :BYTES 25600000 :HEAP-BYTES 262080 :RAW-TICKS 8032 :SECONDS 0.008032d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 321.28d0 :BYTES-PER-SECOND
   3.1872509960159364d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 3518727484 :SINK-LOW
     598906486 :EXPECTED-HIGH 3518727484 :EXPECTED-LOW 598906486 :RAW-TICKS
     7817 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 26602956 :SINK-LOW
     3388797188 :EXPECTED-HIGH 26602956 :EXPECTED-LOW 3388797188 :RAW-TICKS
     4341 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 3512704860 :SINK-LOW
     2921192416 :EXPECTED-HIGH 3512704860 :EXPECTED-LOW 2921192416 :RAW-TICKS
     7273 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 6250 :COMPLETED 6250
     :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 2268130392 :SINK-LOW
     657902069 :EXPECTED-HIGH 2268130392 :EXPECTED-LOW 657902069 :RAW-TICKS
     6323 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 4 :ITERATIONS 98 :COMPLETED 392
   :BYTES 25689720 :HEAP-BYTES 262080 :RAW-TICKS 10880 :SECONDS 0.01088d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 27755.102040816328d0 :BYTES-PER-SECOND
   2.3611875d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2954450432 :SINK-LOW 4000006553
     :EXPECTED-HIGH 2954450432 :EXPECTED-LOW 4000006553 :RAW-TICKS 7123
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3775466461 :SINK-LOW
     921643877 :EXPECTED-HIGH 3775466461 :EXPECTED-LOW 921643877 :RAW-TICKS
     5104 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 1917432989 :SINK-LOW
     1634449878 :EXPECTED-HIGH 1917432989 :EXPECTED-LOW 1634449878 :RAW-TICKS
     10729 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 562990 :SINK-LOW
     3439007810 :EXPECTED-HIGH 562990 :EXPECTED-LOW 3439007810 :RAW-TICKS 8992
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 4 :ITERATIONS 98 :COMPLETED 392
   :BYTES 25689720 :HEAP-BYTES 262080 :RAW-TICKS 13962 :SECONDS 0.013962d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 35617.34693877551d0 :BYTES-PER-SECOND
   1.8399742157284057d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2954450432 :SINK-LOW 4000006553
     :EXPECTED-HIGH 2954450432 :EXPECTED-LOW 4000006553 :RAW-TICKS 4123
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3775466461 :SINK-LOW
     921643877 :EXPECTED-HIGH 3775466461 :EXPECTED-LOW 921643877 :RAW-TICKS
     4131 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 1917432989 :SINK-LOW
     1634449878 :EXPECTED-HIGH 1917432989 :EXPECTED-LOW 1634449878 :RAW-TICKS
     4350 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 562990 :SINK-LOW
     3439007810 :EXPECTED-HIGH 562990 :EXPECTED-LOW 3439007810 :RAW-TICKS 4134
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 4 :ITERATIONS 98 :COMPLETED 392
   :BYTES 25689720 :HEAP-BYTES 262080 :RAW-TICKS 10337 :SECONDS 0.010337d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 26369.897959183672d0 :BYTES-PER-SECOND
   2.4852200831962852d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2954450432 :SINK-LOW 4000006553
     :EXPECTED-HIGH 2954450432 :EXPECTED-LOW 4000006553 :RAW-TICKS 7146
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3775466461 :SINK-LOW
     921643877 :EXPECTED-HIGH 3775466461 :EXPECTED-LOW 921643877 :RAW-TICKS
     4119 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 1917432989 :SINK-LOW
     1634449878 :EXPECTED-HIGH 1917432989 :EXPECTED-LOW 1634449878 :RAW-TICKS
     8530 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 562990 :SINK-LOW
     3439007810 :EXPECTED-HIGH 562990 :EXPECTED-LOW 3439007810 :RAW-TICKS 6566
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 4 :ITERATIONS 98 :COMPLETED 392
   :BYTES 25689720 :HEAP-BYTES 262080 :RAW-TICKS 6708 :SECONDS 0.006708d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 17112.244897959183d0 :BYTES-PER-SECOND
   3.829713774597495d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2954450432 :SINK-LOW 4000006553
     :EXPECTED-HIGH 2954450432 :EXPECTED-LOW 4000006553 :RAW-TICKS 4106
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3775466461 :SINK-LOW
     921643877 :EXPECTED-HIGH 3775466461 :EXPECTED-LOW 921643877 :RAW-TICKS
     6216 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 1917432989 :SINK-LOW
     1634449878 :EXPECTED-HIGH 1917432989 :EXPECTED-LOW 1634449878 :RAW-TICKS
     4146 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 562990 :SINK-LOW
     3439007810 :EXPECTED-HIGH 562990 :EXPECTED-LOW 3439007810 :RAW-TICKS 6678
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 4 :ITERATIONS 98 :COMPLETED 392
   :BYTES 25689720 :HEAP-BYTES 262080 :RAW-TICKS 8843 :SECONDS 0.008843d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 22558.673469387755d0 :BYTES-PER-SECOND
   2.905091032455049d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 0 :SEED-LOW 0 :SINK-HIGH 2954450432 :SINK-LOW 4000006553
     :EXPECTED-HIGH 2954450432 :EXPECTED-LOW 4000006553 :RAW-TICKS 4181
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 2654435761 :SEED-LOW 2246822519 :SINK-HIGH 3775466461 :SINK-LOW
     921643877 :EXPECTED-HIGH 3775466461 :EXPECTED-LOW 921643877 :RAW-TICKS
     5652 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 1013904226 :SEED-LOW 198677742 :SINK-HIGH 1917432989 :SINK-LOW
     1634449878 :EXPECTED-HIGH 1917432989 :EXPECTED-LOW 1634449878 :RAW-TICKS
     8731 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 3668339987 :SEED-LOW 2445500261 :SINK-HIGH 562990 :SINK-LOW
     3439007810 :EXPECTED-HIGH 562990 :EXPECTED-LOW 3439007810 :RAW-TICKS 4130
     :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :MAX :REPLICA 0 :WORKERS 4 :ITERATIONS 98 :COMPLETED 392
   :BYTES 25689720 :HEAP-BYTES 262080 :RAW-TICKS 9132 :SECONDS 0.009132d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 23295.918367346938d0 :BYTES-PER-SECOND
   2.8131537450722733d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 4158245344 :SINK-LOW
     2314362413 :EXPECTED-HIGH 4158245344 :EXPECTED-LOW 2314362413 :RAW-TICKS
     4140 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1633038806 :SINK-LOW
     944731975 :EXPECTED-HIGH 1633038806 :EXPECTED-LOW 944731975 :RAW-TICKS
     5754 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 946029211 :SINK-LOW
     3831161377 :EXPECTED-HIGH 946029211 :EXPECTED-LOW 3831161377 :RAW-TICKS
     4867 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 388624673 :SINK-LOW
     1173937453 :EXPECTED-HIGH 388624673 :EXPECTED-LOW 1173937453 :RAW-TICKS
     4317 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :MAX :REPLICA 1 :WORKERS 4 :ITERATIONS 98 :COMPLETED 392
   :BYTES 25689720 :HEAP-BYTES 262080 :RAW-TICKS 16378 :SECONDS 0.016378d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 41780.61224489796d0 :BYTES-PER-SECOND
   1.568550494565881d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 4158245344 :SINK-LOW
     2314362413 :EXPECTED-HIGH 4158245344 :EXPECTED-LOW 2314362413 :RAW-TICKS
     4133 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1633038806 :SINK-LOW
     944731975 :EXPECTED-HIGH 1633038806 :EXPECTED-LOW 944731975 :RAW-TICKS
     4123 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 946029211 :SINK-LOW
     3831161377 :EXPECTED-HIGH 946029211 :EXPECTED-LOW 3831161377 :RAW-TICKS
     4121 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 388624673 :SINK-LOW
     1173937453 :EXPECTED-HIGH 388624673 :EXPECTED-LOW 1173937453 :RAW-TICKS
     4138 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :MAX :REPLICA 2 :WORKERS 4 :ITERATIONS 98 :COMPLETED 392
   :BYTES 25689720 :HEAP-BYTES 262080 :RAW-TICKS 7116 :SECONDS 0.007116d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 18153.061224489797d0 :BYTES-PER-SECOND
   3.6101349072512646d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 4158245344 :SINK-LOW
     2314362413 :EXPECTED-HIGH 4158245344 :EXPECTED-LOW 2314362413 :RAW-TICKS
     4099 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1633038806 :SINK-LOW
     944731975 :EXPECTED-HIGH 1633038806 :EXPECTED-LOW 944731975 :RAW-TICKS
     5195 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 946029211 :SINK-LOW
     3831161377 :EXPECTED-HIGH 946029211 :EXPECTED-LOW 3831161377 :RAW-TICKS
     6072 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 388624673 :SINK-LOW
     1173937453 :EXPECTED-HIGH 388624673 :EXPECTED-LOW 1173937453 :RAW-TICKS
     7084 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :MAX :REPLICA 3 :WORKERS 4 :ITERATIONS 98 :COMPLETED 392
   :BYTES 25689720 :HEAP-BYTES 262080 :RAW-TICKS 6340 :SECONDS 0.00634d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 16173.469387755102d0 :BYTES-PER-SECOND
   4.052006309148265d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 4158245344 :SINK-LOW
     2314362413 :EXPECTED-HIGH 4158245344 :EXPECTED-LOW 2314362413 :RAW-TICKS
     4105 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1633038806 :SINK-LOW
     944731975 :EXPECTED-HIGH 1633038806 :EXPECTED-LOW 944731975 :RAW-TICKS
     4218 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 946029211 :SINK-LOW
     3831161377 :EXPECTED-HIGH 946029211 :EXPECTED-LOW 3831161377 :RAW-TICKS
     5713 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 388624673 :SINK-LOW
     1173937453 :EXPECTED-HIGH 388624673 :EXPECTED-LOW 1173937453 :RAW-TICKS
     6308 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :PARALLEL :WORKLOAD
   (:NAME #A((8) BASE-CHAR . "parallel") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :MAX :REPLICA 4 :WORKERS 4 :ITERATIONS 98 :COMPLETED 392
   :BYTES 25689720 :HEAP-BYTES 262080 :RAW-TICKS 6360 :SECONDS 0.00636d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 16224.489795918367d0 :BYTES-PER-SECOND
   4.039264150943396d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS
   ((:WORKER 0 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 4294967295 :SEED-LOW 4294967295 :SINK-HIGH 4158245344 :SINK-LOW
     2314362413 :EXPECTED-HIGH 4158245344 :EXPECTED-LOW 2314362413 :RAW-TICKS
     4120 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 1 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 1640531534 :SEED-LOW 2048144776 :SINK-HIGH 1633038806 :SINK-LOW
     944731975 :EXPECTED-HIGH 1633038806 :EXPECTED-LOW 944731975 :RAW-TICKS
     6186 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 2 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 3281063069 :SEED-LOW 4096289553 :SINK-HIGH 946029211 :SINK-LOW
     3831161377 :EXPECTED-HIGH 946029211 :EXPECTED-LOW 3831161377 :RAW-TICKS
     4124 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
    (:WORKER 3 :STATUS :OK :READY T :JOINED T :ITERATIONS 98 :COMPLETED 98
     :SEED-HIGH 626627308 :SEED-LOW 1849467034 :SINK-HIGH 388624673 :SINK-LOW
     1173937453 :EXPECTED-HIGH 388624673 :EXPECTED-LOW 1173937453 :RAW-TICKS
     5975 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
   :SINK-HIGH NIL :SINK-LOW NIL :EXPECTED-HIGH NIL :EXPECTED-LOW NIL
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
 :DIAGNOSTIC NIL :LIMITS
 (:XXH64-ORIGINAL :SPAN-0-THROUGH-65535 :NON-CRYPTOGRAPHIC :EXPLICIT-U32-SEED
  :CALL-VALIDATION-AND-COUNTER-OVERHEAD :WHOLE-PROCESS-HEAP
  :PARALLEL-GATE-AND-JOIN-OVERHEAD :NO-DB-THROUGHPUT :NO-BASELINE-SUBTRACTION
  :NO-PERFORMANCE-THRESHOLD :SEED-LIFECYCLE-FUTURE :EXTERNAL-LOAD-UNCONTROLLED))
