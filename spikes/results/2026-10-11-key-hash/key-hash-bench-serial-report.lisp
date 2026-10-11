(:SCHEMA-VERSION 1 :KIND :KEY-HASH-BENCHMARK :STATUS :OK :EXIT-CODE 0 :MODE
 #A((7) BASE-CHAR . "--bench") :PARALLEL-REQUESTED NIL :BASE-COUNT 100000
 :REPLICAS 5 :WARMUP-CAP 256 :RECORDED-AT 4000706119 :SBCL
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
    :COMPLETED 20000 :BYTES 0 :HEAP-BYTES 0 :RAW-TICKS 20 :SECONDS 2.0d-5
    :TIME-QUALITY :MEASURED :NS-PER-CALL 1.0d0 :BYTES-PER-SECOND 0.0d0
    :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL :SINK-HIGH 0 :SINK-LOW 0
    :EXPECTED-HIGH 0 :EXPECTED-LOW 0 :BUFFER-UNCHANGED NIL :DIAGNOSTIC NIL)
   (:KIND :SENSOR-POSITIVE :WORKLOAD
    (:NAME #A((15) BASE-CHAR . "sensor-positive") :PRIMITIVE :XXH64) :STATUS
    :OK :LENGTH 0 :SEED-CASE NIL :REPLICA NIL :WORKERS 1 :ITERATIONS 4
    :COMPLETED 4 :BYTES 0 :HEAP-BYTES 4194368 :RAW-TICKS 12 :SECONDS 1.2d-5
    :TIME-QUALITY :MEASURED :NS-PER-CALL 3000.0d0 :BYTES-PER-SECOND 0.0d0
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
   :BYTES 0 :HEAP-BYTES 0 :RAW-TICKS 1291 :SECONDS 0.001291d0 :TIME-QUALITY
   :MEASURED :NS-PER-CALL 12.91d0 :BYTES-PER-SECOND 0.0d0 :COUNTER-SCOPE
   :WHOLE-PROCESS :WORKER-RESULTS NIL :SINK-HIGH 4014398263 :SINK-LOW
   1373170073 :EXPECTED-HIGH 4014398263 :EXPECTED-LOW 1373170073
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 0
   :SEED-CASE :ZERO :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 0 :HEAP-BYTES 0 :RAW-TICKS 1314 :SECONDS 0.001314d0 :TIME-QUALITY
   :MEASURED :NS-PER-CALL 13.14d0 :BYTES-PER-SECOND 0.0d0 :COUNTER-SCOPE
   :WHOLE-PROCESS :WORKER-RESULTS NIL :SINK-HIGH 4014398263 :SINK-LOW
   1373170073 :EXPECTED-HIGH 4014398263 :EXPECTED-LOW 1373170073
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 0
   :SEED-CASE :ZERO :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 0 :HEAP-BYTES 0 :RAW-TICKS 1301 :SECONDS 0.001301d0 :TIME-QUALITY
   :MEASURED :NS-PER-CALL 13.01d0 :BYTES-PER-SECOND 0.0d0 :COUNTER-SCOPE
   :WHOLE-PROCESS :WORKER-RESULTS NIL :SINK-HIGH 4014398263 :SINK-LOW
   1373170073 :EXPECTED-HIGH 4014398263 :EXPECTED-LOW 1373170073
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 0
   :SEED-CASE :ZERO :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 0 :HEAP-BYTES 0 :RAW-TICKS 1298 :SECONDS 0.001298d0 :TIME-QUALITY
   :MEASURED :NS-PER-CALL 12.98d0 :BYTES-PER-SECOND 0.0d0 :COUNTER-SCOPE
   :WHOLE-PROCESS :WORKER-RESULTS NIL :SINK-HIGH 4014398263 :SINK-LOW
   1373170073 :EXPECTED-HIGH 4014398263 :EXPECTED-LOW 1373170073
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 0
   :SEED-CASE :ZERO :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 0 :HEAP-BYTES 0 :RAW-TICKS 1322 :SECONDS 0.001322d0 :TIME-QUALITY
   :MEASURED :NS-PER-CALL 13.22d0 :BYTES-PER-SECOND 0.0d0 :COUNTER-SCOPE
   :WHOLE-PROCESS :WORKER-RESULTS NIL :SINK-HIGH 4014398263 :SINK-LOW
   1373170073 :EXPECTED-HIGH 4014398263 :EXPECTED-LOW 1373170073
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 0
   :SEED-CASE :MAX :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 0 :HEAP-BYTES 0 :RAW-TICKS 1313 :SECONDS 0.001313d0 :TIME-QUALITY
   :MEASURED :NS-PER-CALL 13.13d0 :BYTES-PER-SECOND 0.0d0 :COUNTER-SCOPE
   :WHOLE-PROCESS :WORKER-RESULTS NIL :SINK-HIGH 697257092 :SINK-LOW 2991543168
   :EXPECTED-HIGH 697257092 :EXPECTED-LOW 2991543168 :BUFFER-UNCHANGED T
   :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 0
   :SEED-CASE :MAX :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 0 :HEAP-BYTES 0 :RAW-TICKS 1305 :SECONDS 0.001305d0 :TIME-QUALITY
   :MEASURED :NS-PER-CALL 13.05d0 :BYTES-PER-SECOND 0.0d0 :COUNTER-SCOPE
   :WHOLE-PROCESS :WORKER-RESULTS NIL :SINK-HIGH 697257092 :SINK-LOW 2991543168
   :EXPECTED-HIGH 697257092 :EXPECTED-LOW 2991543168 :BUFFER-UNCHANGED T
   :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 0
   :SEED-CASE :MAX :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 0 :HEAP-BYTES 0 :RAW-TICKS 1301 :SECONDS 0.001301d0 :TIME-QUALITY
   :MEASURED :NS-PER-CALL 13.01d0 :BYTES-PER-SECOND 0.0d0 :COUNTER-SCOPE
   :WHOLE-PROCESS :WORKER-RESULTS NIL :SINK-HIGH 697257092 :SINK-LOW 2991543168
   :EXPECTED-HIGH 697257092 :EXPECTED-LOW 2991543168 :BUFFER-UNCHANGED T
   :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 0
   :SEED-CASE :MAX :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 0 :HEAP-BYTES 0 :RAW-TICKS 1313 :SECONDS 0.001313d0 :TIME-QUALITY
   :MEASURED :NS-PER-CALL 13.13d0 :BYTES-PER-SECOND 0.0d0 :COUNTER-SCOPE
   :WHOLE-PROCESS :WORKER-RESULTS NIL :SINK-HIGH 697257092 :SINK-LOW 2991543168
   :EXPECTED-HIGH 697257092 :EXPECTED-LOW 2991543168 :BUFFER-UNCHANGED T
   :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 0
   :SEED-CASE :MAX :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 0 :HEAP-BYTES 0 :RAW-TICKS 1300 :SECONDS 0.0013d0 :TIME-QUALITY
   :MEASURED :NS-PER-CALL 13.0d0 :BYTES-PER-SECOND 0.0d0 :COUNTER-SCOPE
   :WHOLE-PROCESS :WORKER-RESULTS NIL :SINK-HIGH 697257092 :SINK-LOW 2991543168
   :EXPECTED-HIGH 697257092 :EXPECTED-LOW 2991543168 :BUFFER-UNCHANGED T
   :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 1
   :SEED-CASE :ZERO :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 100000 :HEAP-BYTES 0 :RAW-TICKS 1424 :SECONDS 0.001424d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 14.24d0 :BYTES-PER-SECOND
   7.02247191011236d7 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2775575122 :SINK-LOW 1566858293 :EXPECTED-HIGH 2775575122
   :EXPECTED-LOW 1566858293 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 1
   :SEED-CASE :ZERO :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 100000 :HEAP-BYTES 0 :RAW-TICKS 1426 :SECONDS 0.001426d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 14.26d0 :BYTES-PER-SECOND
   7.012622720897616d7 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2775575122 :SINK-LOW 1566858293 :EXPECTED-HIGH 2775575122
   :EXPECTED-LOW 1566858293 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 1
   :SEED-CASE :ZERO :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 100000 :HEAP-BYTES 0 :RAW-TICKS 1435 :SECONDS 0.001435d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 14.35d0 :BYTES-PER-SECOND
   6.968641114982578d7 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2775575122 :SINK-LOW 1566858293 :EXPECTED-HIGH 2775575122
   :EXPECTED-LOW 1566858293 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 1
   :SEED-CASE :ZERO :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 100000 :HEAP-BYTES 0 :RAW-TICKS 1433 :SECONDS 0.001433d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 14.33d0 :BYTES-PER-SECOND
   6.978367062107466d7 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2775575122 :SINK-LOW 1566858293 :EXPECTED-HIGH 2775575122
   :EXPECTED-LOW 1566858293 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 1
   :SEED-CASE :ZERO :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 100000 :HEAP-BYTES 0 :RAW-TICKS 1429 :SECONDS 0.001429d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 14.29d0 :BYTES-PER-SECOND
   6.997900629811057d7 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2775575122 :SINK-LOW 1566858293 :EXPECTED-HIGH 2775575122
   :EXPECTED-LOW 1566858293 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 1
   :SEED-CASE :MAX :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 100000 :HEAP-BYTES 0 :RAW-TICKS 1425 :SECONDS 0.001425d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 14.25d0 :BYTES-PER-SECOND
   7.017543859649123d7 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2913883710 :SINK-LOW 3003520362 :EXPECTED-HIGH 2913883710
   :EXPECTED-LOW 3003520362 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 1
   :SEED-CASE :MAX :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 100000 :HEAP-BYTES 0 :RAW-TICKS 1426 :SECONDS 0.001426d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 14.26d0 :BYTES-PER-SECOND
   7.012622720897616d7 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2913883710 :SINK-LOW 3003520362 :EXPECTED-HIGH 2913883710
   :EXPECTED-LOW 3003520362 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 1
   :SEED-CASE :MAX :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 100000 :HEAP-BYTES 0 :RAW-TICKS 1439 :SECONDS 0.001439d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 14.39d0 :BYTES-PER-SECOND
   6.949270326615706d7 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2913883710 :SINK-LOW 3003520362 :EXPECTED-HIGH 2913883710
   :EXPECTED-LOW 3003520362 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 1
   :SEED-CASE :MAX :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 100000 :HEAP-BYTES 0 :RAW-TICKS 1429 :SECONDS 0.001429d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 14.29d0 :BYTES-PER-SECOND
   6.997900629811057d7 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2913883710 :SINK-LOW 3003520362 :EXPECTED-HIGH 2913883710
   :EXPECTED-LOW 3003520362 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 1
   :SEED-CASE :MAX :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 100000 :HEAP-BYTES 0 :RAW-TICKS 1432 :SECONDS 0.001432d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 14.32d0 :BYTES-PER-SECOND
   6.983240223463687d7 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2913883710 :SINK-LOW 3003520362 :EXPECTED-HIGH 2913883710
   :EXPECTED-LOW 3003520362 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 7
   :SEED-CASE :ZERO :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 700000 :HEAP-BYTES 0 :RAW-TICKS 1989 :SECONDS 0.001989d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.889999999999997d0 :BYTES-PER-SECOND
   3.519356460532931d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2383629478 :SINK-LOW 1558117133 :EXPECTED-HIGH 2383629478
   :EXPECTED-LOW 1558117133 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 7
   :SEED-CASE :ZERO :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 700000 :HEAP-BYTES 0 :RAW-TICKS 1992 :SECONDS 0.001992d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.919999999999998d0 :BYTES-PER-SECOND
   3.514056224899599d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2383629478 :SINK-LOW 1558117133 :EXPECTED-HIGH 2383629478
   :EXPECTED-LOW 1558117133 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 7
   :SEED-CASE :ZERO :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 700000 :HEAP-BYTES 0 :RAW-TICKS 1998 :SECONDS 0.001998d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.980000000000004d0 :BYTES-PER-SECOND
   3.503503503503503d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2383629478 :SINK-LOW 1558117133 :EXPECTED-HIGH 2383629478
   :EXPECTED-LOW 1558117133 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 7
   :SEED-CASE :ZERO :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 700000 :HEAP-BYTES 0 :RAW-TICKS 2009 :SECONDS 0.002009d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 20.09d0 :BYTES-PER-SECOND
   3.4843205574912894d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2383629478 :SINK-LOW 1558117133 :EXPECTED-HIGH 2383629478
   :EXPECTED-LOW 1558117133 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 7
   :SEED-CASE :ZERO :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 700000 :HEAP-BYTES 0 :RAW-TICKS 1997 :SECONDS 0.001997d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.97d0 :BYTES-PER-SECOND
   3.505257886830245d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2383629478 :SINK-LOW 1558117133 :EXPECTED-HIGH 2383629478
   :EXPECTED-LOW 1558117133 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 7
   :SEED-CASE :MAX :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 700000 :HEAP-BYTES 0 :RAW-TICKS 1987 :SECONDS 0.001987d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.87d0 :BYTES-PER-SECOND
   3.5228988424760944d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1617286543 :SINK-LOW 2598239346 :EXPECTED-HIGH 1617286543
   :EXPECTED-LOW 2598239346 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 7
   :SEED-CASE :MAX :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 700000 :HEAP-BYTES 0 :RAW-TICKS 1988 :SECONDS 0.001988d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.880000000000003d0 :BYTES-PER-SECOND
   3.52112676056338d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1617286543 :SINK-LOW 2598239346 :EXPECTED-HIGH 1617286543
   :EXPECTED-LOW 2598239346 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 7
   :SEED-CASE :MAX :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 700000 :HEAP-BYTES 0 :RAW-TICKS 2013 :SECONDS 0.002013d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 20.13d0 :BYTES-PER-SECOND
   3.477396920019871d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1617286543 :SINK-LOW 2598239346 :EXPECTED-HIGH 1617286543
   :EXPECTED-LOW 2598239346 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 7
   :SEED-CASE :MAX :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 700000 :HEAP-BYTES 0 :RAW-TICKS 1989 :SECONDS 0.001989d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.889999999999997d0 :BYTES-PER-SECOND
   3.519356460532931d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1617286543 :SINK-LOW 2598239346 :EXPECTED-HIGH 1617286543
   :EXPECTED-LOW 2598239346 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 7
   :SEED-CASE :MAX :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 700000 :HEAP-BYTES 0 :RAW-TICKS 1976 :SECONDS 0.001976d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.76d0 :BYTES-PER-SECOND
   3.5425101214574903d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1617286543 :SINK-LOW 2598239346 :EXPECTED-HIGH 1617286543
   :EXPECTED-LOW 2598239346 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 8
   :SEED-CASE :ZERO :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 800000 :HEAP-BYTES 0 :RAW-TICKS 2047 :SECONDS 0.002047d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 20.470000000000002d0 :BYTES-PER-SECOND
   3.908158280410356d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 702377167 :SINK-LOW 3479502890 :EXPECTED-HIGH 702377167
   :EXPECTED-LOW 3479502890 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 8
   :SEED-CASE :ZERO :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 800000 :HEAP-BYTES 0 :RAW-TICKS 1989 :SECONDS 0.001989d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.889999999999997d0 :BYTES-PER-SECOND
   4.022121669180493d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 702377167 :SINK-LOW 3479502890 :EXPECTED-HIGH 702377167
   :EXPECTED-LOW 3479502890 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 8
   :SEED-CASE :ZERO :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 800000 :HEAP-BYTES 0 :RAW-TICKS 2083 :SECONDS 0.002083d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 20.830000000000002d0 :BYTES-PER-SECOND
   3.840614498319731d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 702377167 :SINK-LOW 3479502890 :EXPECTED-HIGH 702377167
   :EXPECTED-LOW 3479502890 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 8
   :SEED-CASE :ZERO :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 800000 :HEAP-BYTES 0 :RAW-TICKS 1979 :SECONDS 0.001979d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.79d0 :BYTES-PER-SECOND
   4.0424456796361804d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 702377167 :SINK-LOW 3479502890 :EXPECTED-HIGH 702377167
   :EXPECTED-LOW 3479502890 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 8
   :SEED-CASE :ZERO :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 800000 :HEAP-BYTES 0 :RAW-TICKS 2048 :SECONDS 0.002048d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 20.48d0 :BYTES-PER-SECOND 3.90625d8
   :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL :SINK-HIGH 702377167
   :SINK-LOW 3479502890 :EXPECTED-HIGH 702377167 :EXPECTED-LOW 3479502890
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 8
   :SEED-CASE :MAX :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 800000 :HEAP-BYTES 0 :RAW-TICKS 1914 :SECONDS 0.001914d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.14d0 :BYTES-PER-SECOND
   4.1797283176593524d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 4030851251 :SINK-LOW 530277268 :EXPECTED-HIGH 4030851251
   :EXPECTED-LOW 530277268 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 8
   :SEED-CASE :MAX :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 800000 :HEAP-BYTES 0 :RAW-TICKS 1921 :SECONDS 0.001921d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.21d0 :BYTES-PER-SECOND
   4.164497657470068d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 4030851251 :SINK-LOW 530277268 :EXPECTED-HIGH 4030851251
   :EXPECTED-LOW 530277268 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 8
   :SEED-CASE :MAX :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 800000 :HEAP-BYTES 0 :RAW-TICKS 1914 :SECONDS 0.001914d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.14d0 :BYTES-PER-SECOND
   4.1797283176593524d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 4030851251 :SINK-LOW 530277268 :EXPECTED-HIGH 4030851251
   :EXPECTED-LOW 530277268 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 8
   :SEED-CASE :MAX :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 800000 :HEAP-BYTES 0 :RAW-TICKS 1920 :SECONDS 0.00192d0 :TIME-QUALITY
   :MEASURED :NS-PER-CALL 19.2d0 :BYTES-PER-SECOND 4.166666666666666d8
   :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL :SINK-HIGH 4030851251
   :SINK-LOW 530277268 :EXPECTED-HIGH 4030851251 :EXPECTED-LOW 530277268
   :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH 8
   :SEED-CASE :MAX :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED 100000
   :BYTES 800000 :HEAP-BYTES 0 :RAW-TICKS 1921 :SECONDS 0.001921d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 19.21d0 :BYTES-PER-SECOND
   4.164497657470068d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 4030851251 :SINK-LOW 530277268 :EXPECTED-HIGH 4030851251
   :EXPECTED-LOW 530277268 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 1600000 :HEAP-BYTES 0 :RAW-TICKS 2592 :SECONDS 0.002592d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 25.92d0 :BYTES-PER-SECOND
   6.172839506172839d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2488434274 :SINK-LOW 3965313052 :EXPECTED-HIGH 2488434274
   :EXPECTED-LOW 3965313052 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 1600000 :HEAP-BYTES 0 :RAW-TICKS 2598 :SECONDS 0.002598d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 25.98d0 :BYTES-PER-SECOND
   6.158583525789069d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2488434274 :SINK-LOW 3965313052 :EXPECTED-HIGH 2488434274
   :EXPECTED-LOW 3965313052 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 1600000 :HEAP-BYTES 0 :RAW-TICKS 2588 :SECONDS 0.002588d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 25.88d0 :BYTES-PER-SECOND
   6.182380216383307d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2488434274 :SINK-LOW 3965313052 :EXPECTED-HIGH 2488434274
   :EXPECTED-LOW 3965313052 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 1600000 :HEAP-BYTES 0 :RAW-TICKS 2595 :SECONDS 0.002595d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 25.95d0 :BYTES-PER-SECOND
   6.165703275529865d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2488434274 :SINK-LOW 3965313052 :EXPECTED-HIGH 2488434274
   :EXPECTED-LOW 3965313052 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 1600000 :HEAP-BYTES 0 :RAW-TICKS 2590 :SECONDS 0.00259d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 25.9d0 :BYTES-PER-SECOND
   6.177606177606179d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2488434274 :SINK-LOW 3965313052 :EXPECTED-HIGH 2488434274
   :EXPECTED-LOW 3965313052 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   16 :SEED-CASE :MAX :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 1600000 :HEAP-BYTES 0 :RAW-TICKS 2593 :SECONDS 0.002593d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 25.93d0 :BYTES-PER-SECOND
   6.170458927882762d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
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
   100000 :BYTES 1600000 :HEAP-BYTES 0 :RAW-TICKS 2593 :SECONDS 0.002593d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 25.93d0 :BYTES-PER-SECOND
   6.170458927882762d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
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
   100000 :BYTES 1600000 :HEAP-BYTES 0 :RAW-TICKS 2621 :SECONDS 0.002621d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 26.21d0 :BYTES-PER-SECOND
   6.104540251812285d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1968933113 :SINK-LOW 2654859235 :EXPECTED-HIGH 1968933113
   :EXPECTED-LOW 2654859235 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3100000 :HEAP-BYTES 0 :RAW-TICKS 3932 :SECONDS 0.003932d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 39.31999999999999d0 :BYTES-PER-SECOND
   7.884028484231944d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1146898289 :SINK-LOW 3956010695 :EXPECTED-HIGH 1146898289
   :EXPECTED-LOW 3956010695 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3100000 :HEAP-BYTES 0 :RAW-TICKS 3923 :SECONDS 0.003923d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 39.230000000000004d0 :BYTES-PER-SECOND
   7.902115727759367d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1146898289 :SINK-LOW 3956010695 :EXPECTED-HIGH 1146898289
   :EXPECTED-LOW 3956010695 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3100000 :HEAP-BYTES 0 :RAW-TICKS 3938 :SECONDS 0.003938d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 39.379999999999995d0 :BYTES-PER-SECOND
   7.872016251904521d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1146898289 :SINK-LOW 3956010695 :EXPECTED-HIGH 1146898289
   :EXPECTED-LOW 3956010695 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3100000 :HEAP-BYTES 0 :RAW-TICKS 3915 :SECONDS 0.003915d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 39.15d0 :BYTES-PER-SECOND
   7.918263090676883d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1146898289 :SINK-LOW 3956010695 :EXPECTED-HIGH 1146898289
   :EXPECTED-LOW 3956010695 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3100000 :HEAP-BYTES 0 :RAW-TICKS 3950 :SECONDS 0.00395d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 39.50000000000001d0 :BYTES-PER-SECOND
   7.848101265822784d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1146898289 :SINK-LOW 3956010695 :EXPECTED-HIGH 1146898289
   :EXPECTED-LOW 3956010695 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :MAX :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3100000 :HEAP-BYTES 0 :RAW-TICKS 3942 :SECONDS 0.003942d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 39.42d0 :BYTES-PER-SECOND
   7.864028411973617d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3805149864 :SINK-LOW 3424211333 :EXPECTED-HIGH 3805149864
   :EXPECTED-LOW 3424211333 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :MAX :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3100000 :HEAP-BYTES 0 :RAW-TICKS 3925 :SECONDS 0.003925d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 39.24999999999999d0 :BYTES-PER-SECOND
   7.898089171974523d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3805149864 :SINK-LOW 3424211333 :EXPECTED-HIGH 3805149864
   :EXPECTED-LOW 3424211333 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :MAX :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3100000 :HEAP-BYTES 0 :RAW-TICKS 3936 :SECONDS 0.003936d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 39.36000000000001d0 :BYTES-PER-SECOND
   7.876016260162601d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3805149864 :SINK-LOW 3424211333 :EXPECTED-HIGH 3805149864
   :EXPECTED-LOW 3424211333 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :MAX :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3100000 :HEAP-BYTES 0 :RAW-TICKS 3961 :SECONDS 0.003961d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 39.61d0 :BYTES-PER-SECOND
   7.82630648826054d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3805149864 :SINK-LOW 3424211333 :EXPECTED-HIGH 3805149864
   :EXPECTED-LOW 3424211333 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   31 :SEED-CASE :MAX :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3100000 :HEAP-BYTES 0 :RAW-TICKS 3936 :SECONDS 0.003936d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 39.36000000000001d0 :BYTES-PER-SECOND
   7.876016260162601d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3805149864 :SINK-LOW 3424211333 :EXPECTED-HIGH 3805149864
   :EXPECTED-LOW 3424211333 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3200000 :HEAP-BYTES 0 :RAW-TICKS 4100 :SECONDS 0.0041d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 41.00000000000001d0 :BYTES-PER-SECOND
   7.804878048780487d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3363602882 :SINK-LOW 1789286091 :EXPECTED-HIGH 3363602882
   :EXPECTED-LOW 1789286091 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3200000 :HEAP-BYTES 0 :RAW-TICKS 4087 :SECONDS 0.004087d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 40.870000000000005d0 :BYTES-PER-SECOND
   7.829703939319794d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3363602882 :SINK-LOW 1789286091 :EXPECTED-HIGH 3363602882
   :EXPECTED-LOW 1789286091 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3200000 :HEAP-BYTES 0 :RAW-TICKS 4041 :SECONDS 0.004041d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 40.410000000000004d0 :BYTES-PER-SECOND
   7.918831972284087d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3363602882 :SINK-LOW 1789286091 :EXPECTED-HIGH 3363602882
   :EXPECTED-LOW 1789286091 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3200000 :HEAP-BYTES 0 :RAW-TICKS 4061 :SECONDS 0.004061d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 40.61000000000001d0 :BYTES-PER-SECOND
   7.879832553558236d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3363602882 :SINK-LOW 1789286091 :EXPECTED-HIGH 3363602882
   :EXPECTED-LOW 1789286091 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3200000 :HEAP-BYTES 0 :RAW-TICKS 4062 :SECONDS 0.004062d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 40.62d0 :BYTES-PER-SECOND
   7.877892663712457d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3363602882 :SINK-LOW 1789286091 :EXPECTED-HIGH 3363602882
   :EXPECTED-LOW 1789286091 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :MAX :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3200000 :HEAP-BYTES 0 :RAW-TICKS 4058 :SECONDS 0.004058d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 40.58d0 :BYTES-PER-SECOND
   7.885657959586003d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1949789789 :SINK-LOW 2753243215 :EXPECTED-HIGH 1949789789
   :EXPECTED-LOW 2753243215 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :MAX :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3200000 :HEAP-BYTES 0 :RAW-TICKS 4041 :SECONDS 0.004041d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 40.410000000000004d0 :BYTES-PER-SECOND
   7.918831972284087d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1949789789 :SINK-LOW 2753243215 :EXPECTED-HIGH 1949789789
   :EXPECTED-LOW 2753243215 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :MAX :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3200000 :HEAP-BYTES 0 :RAW-TICKS 4031 :SECONDS 0.004031d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 40.31d0 :BYTES-PER-SECOND
   7.938476804763086d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1949789789 :SINK-LOW 2753243215 :EXPECTED-HIGH 1949789789
   :EXPECTED-LOW 2753243215 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :MAX :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3200000 :HEAP-BYTES 0 :RAW-TICKS 4044 :SECONDS 0.004044d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 40.44d0 :BYTES-PER-SECOND
   7.91295746785361d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1949789789 :SINK-LOW 2753243215 :EXPECTED-HIGH 1949789789
   :EXPECTED-LOW 2753243215 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   32 :SEED-CASE :MAX :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3200000 :HEAP-BYTES 0 :RAW-TICKS 4048 :SECONDS 0.004048d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 40.480000000000004d0 :BYTES-PER-SECOND
   7.905138339920948d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1949789789 :SINK-LOW 2753243215 :EXPECTED-HIGH 1949789789
   :EXPECTED-LOW 2753243215 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3300000 :HEAP-BYTES 0 :RAW-TICKS 4243 :SECONDS 0.004243d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 42.43d0 :BYTES-PER-SECOND
   7.777515908555267d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 788434019 :SINK-LOW 1354428606 :EXPECTED-HIGH 788434019
   :EXPECTED-LOW 1354428606 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3300000 :HEAP-BYTES 0 :RAW-TICKS 4224 :SECONDS 0.004224d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 42.24d0 :BYTES-PER-SECOND
   7.812499999999999d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 788434019 :SINK-LOW 1354428606 :EXPECTED-HIGH 788434019
   :EXPECTED-LOW 1354428606 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3300000 :HEAP-BYTES 0 :RAW-TICKS 4250 :SECONDS 0.00425d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 42.5d0 :BYTES-PER-SECOND
   7.764705882352941d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 788434019 :SINK-LOW 1354428606 :EXPECTED-HIGH 788434019
   :EXPECTED-LOW 1354428606 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3300000 :HEAP-BYTES 0 :RAW-TICKS 4237 :SECONDS 0.004237d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 42.37d0 :BYTES-PER-SECOND
   7.788529620014161d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 788434019 :SINK-LOW 1354428606 :EXPECTED-HIGH 788434019
   :EXPECTED-LOW 1354428606 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3300000 :HEAP-BYTES 0 :RAW-TICKS 4253 :SECONDS 0.004253d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 42.53d0 :BYTES-PER-SECOND
   7.759228779684929d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 788434019 :SINK-LOW 1354428606 :EXPECTED-HIGH 788434019
   :EXPECTED-LOW 1354428606 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :MAX :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3300000 :HEAP-BYTES 0 :RAW-TICKS 4121 :SECONDS 0.004121d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 41.209999999999994d0 :BYTES-PER-SECOND
   8.007765105556904d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 246156341 :SINK-LOW 3263108042 :EXPECTED-HIGH 246156341
   :EXPECTED-LOW 3263108042 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :MAX :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3300000 :HEAP-BYTES 0 :RAW-TICKS 4225 :SECONDS 0.004225d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 42.25d0 :BYTES-PER-SECOND
   7.810650887573966d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 246156341 :SINK-LOW 3263108042 :EXPECTED-HIGH 246156341
   :EXPECTED-LOW 3263108042 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :MAX :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3300000 :HEAP-BYTES 0 :RAW-TICKS 4224 :SECONDS 0.004224d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 42.24d0 :BYTES-PER-SECOND
   7.812499999999999d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 246156341 :SINK-LOW 3263108042 :EXPECTED-HIGH 246156341
   :EXPECTED-LOW 3263108042 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :MAX :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3300000 :HEAP-BYTES 0 :RAW-TICKS 4253 :SECONDS 0.004253d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 42.53d0 :BYTES-PER-SECOND
   7.759228779684929d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 246156341 :SINK-LOW 3263108042 :EXPECTED-HIGH 246156341
   :EXPECTED-LOW 3263108042 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   33 :SEED-CASE :MAX :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 3300000 :HEAP-BYTES 0 :RAW-TICKS 4242 :SECONDS 0.004242d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 42.42d0 :BYTES-PER-SECOND
   7.779349363507779d8 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 246156341 :SINK-LOW 3263108042 :EXPECTED-HIGH 246156341
   :EXPECTED-LOW 3263108042 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 5934 :SECONDS 0.005934d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 59.34d0 :BYTES-PER-SECOND
   1.0785305021907651d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 931690014 :SINK-LOW 3112436852 :EXPECTED-HIGH 931690014
   :EXPECTED-LOW 3112436852 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 5924 :SECONDS 0.005924d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 59.24d0 :BYTES-PER-SECOND
   1.0803511141120865d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 931690014 :SINK-LOW 3112436852 :EXPECTED-HIGH 931690014
   :EXPECTED-LOW 3112436852 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 5946 :SECONDS 0.005946d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 59.46d0 :BYTES-PER-SECOND
   1.0763538513286242d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 931690014 :SINK-LOW 3112436852 :EXPECTED-HIGH 931690014
   :EXPECTED-LOW 3112436852 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 5950 :SECONDS 0.00595d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 59.5d0 :BYTES-PER-SECOND
   1.0756302521008403d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 931690014 :SINK-LOW 3112436852 :EXPECTED-HIGH 931690014
   :EXPECTED-LOW 3112436852 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 5918 :SECONDS 0.005918d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 59.18d0 :BYTES-PER-SECOND
   1.081446434606286d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 931690014 :SINK-LOW 3112436852 :EXPECTED-HIGH 931690014
   :EXPECTED-LOW 3112436852 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :MAX :REPLICA 0 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 5948 :SECONDS 0.005948d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 59.48d0 :BYTES-PER-SECOND
   1.0759919300605245d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1854669567 :SINK-LOW 3500381958 :EXPECTED-HIGH 1854669567
   :EXPECTED-LOW 3500381958 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :MAX :REPLICA 1 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 5937 :SECONDS 0.005937d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 59.37d0 :BYTES-PER-SECOND
   1.077985514569648d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1854669567 :SINK-LOW 3500381958 :EXPECTED-HIGH 1854669567
   :EXPECTED-LOW 3500381958 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :MAX :REPLICA 2 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 5941 :SECONDS 0.005941d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 59.41d0 :BYTES-PER-SECOND
   1.0772597205857599d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1854669567 :SINK-LOW 3500381958 :EXPECTED-HIGH 1854669567
   :EXPECTED-LOW 3500381958 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :MAX :REPLICA 3 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 5933 :SECONDS 0.005933d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 59.33d0 :BYTES-PER-SECOND
   1.0787122872071464d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1854669567 :SINK-LOW 3500381958 :EXPECTED-HIGH 1854669567
   :EXPECTED-LOW 3500381958 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   64 :SEED-CASE :MAX :REPLICA 4 :WORKERS 1 :ITERATIONS 100000 :COMPLETED
   100000 :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 5915 :SECONDS 0.005915d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 59.15d0 :BYTES-PER-SECOND
   1.0819949281487744d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 1854669567 :SINK-LOW 3500381958 :EXPECTED-HIGH 1854669567
   :EXPECTED-LOW 3500381958 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 1 :ITERATIONS 25000 :COMPLETED
   25000 :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 4200 :SECONDS 0.0042d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 168.0d0 :BYTES-PER-SECOND
   1.5238095238095238d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3650340472 :SINK-LOW 91924045 :EXPECTED-HIGH 3650340472
   :EXPECTED-LOW 91924045 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 1 :ITERATIONS 25000 :COMPLETED
   25000 :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 4214 :SECONDS 0.004214d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 168.56d0 :BYTES-PER-SECOND
   1.5187470336971998d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3650340472 :SINK-LOW 91924045 :EXPECTED-HIGH 3650340472
   :EXPECTED-LOW 91924045 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 1 :ITERATIONS 25000 :COMPLETED
   25000 :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 4200 :SECONDS 0.0042d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 168.0d0 :BYTES-PER-SECOND
   1.5238095238095238d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3650340472 :SINK-LOW 91924045 :EXPECTED-HIGH 3650340472
   :EXPECTED-LOW 91924045 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 1 :ITERATIONS 25000 :COMPLETED
   25000 :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 4227 :SECONDS 0.004227d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 169.08d0 :BYTES-PER-SECOND
   1.5140761769576533d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3650340472 :SINK-LOW 91924045 :EXPECTED-HIGH 3650340472
   :EXPECTED-LOW 91924045 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 1 :ITERATIONS 25000 :COMPLETED
   25000 :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 4235 :SECONDS 0.004235d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 169.4d0 :BYTES-PER-SECOND
   1.511216056670602d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3650340472 :SINK-LOW 91924045 :EXPECTED-HIGH 3650340472
   :EXPECTED-LOW 91924045 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :MAX :REPLICA 0 :WORKERS 1 :ITERATIONS 25000 :COMPLETED 25000
   :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 4208 :SECONDS 0.004208d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 168.32d0 :BYTES-PER-SECOND
   1.5209125475285172d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3822163365 :SINK-LOW 3634861316 :EXPECTED-HIGH 3822163365
   :EXPECTED-LOW 3634861316 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :MAX :REPLICA 1 :WORKERS 1 :ITERATIONS 25000 :COMPLETED 25000
   :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 4192 :SECONDS 0.004192d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 167.68d0 :BYTES-PER-SECOND
   1.5267175572519083d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3822163365 :SINK-LOW 3634861316 :EXPECTED-HIGH 3822163365
   :EXPECTED-LOW 3634861316 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :MAX :REPLICA 2 :WORKERS 1 :ITERATIONS 25000 :COMPLETED 25000
   :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 4197 :SECONDS 0.004197d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 167.88d0 :BYTES-PER-SECOND
   1.5248987371932333d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3822163365 :SINK-LOW 3634861316 :EXPECTED-HIGH 3822163365
   :EXPECTED-LOW 3634861316 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :MAX :REPLICA 3 :WORKERS 1 :ITERATIONS 25000 :COMPLETED 25000
   :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 4232 :SECONDS 0.004232d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 169.28d0 :BYTES-PER-SECOND
   1.5122873345935729d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3822163365 :SINK-LOW 3634861316 :EXPECTED-HIGH 3822163365
   :EXPECTED-LOW 3634861316 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   256 :SEED-CASE :MAX :REPLICA 4 :WORKERS 1 :ITERATIONS 25000 :COMPLETED 25000
   :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 4191 :SECONDS 0.004191d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 167.64000000000001d0 :BYTES-PER-SECOND
   1.527081842042472d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3822163365 :SINK-LOW 3634861316 :EXPECTED-HIGH 3822163365
   :EXPECTED-LOW 3634861316 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 1 :ITERATIONS 6250 :COMPLETED 6250
   :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 3767 :SECONDS 0.003767d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 602.72d0 :BYTES-PER-SECOND
   1.6989646933899655d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 314608995 :SINK-LOW 2823576381 :EXPECTED-HIGH 314608995
   :EXPECTED-LOW 2823576381 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 1 :ITERATIONS 6250 :COMPLETED 6250
   :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 3753 :SECONDS 0.003753d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 600.48d0 :BYTES-PER-SECOND
   1.7053024247268853d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 314608995 :SINK-LOW 2823576381 :EXPECTED-HIGH 314608995
   :EXPECTED-LOW 2823576381 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 1 :ITERATIONS 6250 :COMPLETED 6250
   :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 3767 :SECONDS 0.003767d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 602.72d0 :BYTES-PER-SECOND
   1.6989646933899655d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 314608995 :SINK-LOW 2823576381 :EXPECTED-HIGH 314608995
   :EXPECTED-LOW 2823576381 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 1 :ITERATIONS 6250 :COMPLETED 6250
   :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 3744 :SECONDS 0.003744d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 599.04d0 :BYTES-PER-SECOND
   1.7094017094017093d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 314608995 :SINK-LOW 2823576381 :EXPECTED-HIGH 314608995
   :EXPECTED-LOW 2823576381 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 1 :ITERATIONS 6250 :COMPLETED 6250
   :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 3768 :SECONDS 0.003768d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 602.88d0 :BYTES-PER-SECOND
   1.6985138004246285d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 314608995 :SINK-LOW 2823576381 :EXPECTED-HIGH 314608995
   :EXPECTED-LOW 2823576381 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :MAX :REPLICA 0 :WORKERS 1 :ITERATIONS 6250 :COMPLETED 6250
   :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 3752 :SECONDS 0.003752d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 600.32d0 :BYTES-PER-SECOND
   1.7057569296375265d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3518727484 :SINK-LOW 598906486 :EXPECTED-HIGH 3518727484
   :EXPECTED-LOW 598906486 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :MAX :REPLICA 1 :WORKERS 1 :ITERATIONS 6250 :COMPLETED 6250
   :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 3786 :SECONDS 0.003786d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 605.76d0 :BYTES-PER-SECOND
   1.6904384574749076d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3518727484 :SINK-LOW 598906486 :EXPECTED-HIGH 3518727484
   :EXPECTED-LOW 598906486 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :MAX :REPLICA 2 :WORKERS 1 :ITERATIONS 6250 :COMPLETED 6250
   :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 3754 :SECONDS 0.003754d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 600.64d0 :BYTES-PER-SECOND
   1.7048481619605753d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3518727484 :SINK-LOW 598906486 :EXPECTED-HIGH 3518727484
   :EXPECTED-LOW 598906486 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :MAX :REPLICA 3 :WORKERS 1 :ITERATIONS 6250 :COMPLETED 6250
   :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 3774 :SECONDS 0.003774d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 603.84d0 :BYTES-PER-SECOND
   1.695813460519343d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3518727484 :SINK-LOW 598906486 :EXPECTED-HIGH 3518727484
   :EXPECTED-LOW 598906486 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   1024 :SEED-CASE :MAX :REPLICA 4 :WORKERS 1 :ITERATIONS 6250 :COMPLETED 6250
   :BYTES 6400000 :HEAP-BYTES 0 :RAW-TICKS 3752 :SECONDS 0.003752d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 600.32d0 :BYTES-PER-SECOND
   1.7057569296375265d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 3518727484 :SINK-LOW 598906486 :EXPECTED-HIGH 3518727484
   :EXPECTED-LOW 598906486 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :ZERO :REPLICA 0 :WORKERS 1 :ITERATIONS 98 :COMPLETED 98
   :BYTES 6422430 :HEAP-BYTES 0 :RAW-TICKS 3535 :SECONDS 0.003535d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 36071.42857142857d0 :BYTES-PER-SECOND
   1.816811881188119d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2954450432 :SINK-LOW 4000006553 :EXPECTED-HIGH 2954450432
   :EXPECTED-LOW 4000006553 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :ZERO :REPLICA 1 :WORKERS 1 :ITERATIONS 98 :COMPLETED 98
   :BYTES 6422430 :HEAP-BYTES 0 :RAW-TICKS 3579 :SECONDS 0.003579d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 36520.4081632653d0 :BYTES-PER-SECOND
   1.7944761106454315d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2954450432 :SINK-LOW 4000006553 :EXPECTED-HIGH 2954450432
   :EXPECTED-LOW 4000006553 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :ZERO :REPLICA 2 :WORKERS 1 :ITERATIONS 98 :COMPLETED 98
   :BYTES 6422430 :HEAP-BYTES 0 :RAW-TICKS 3543 :SECONDS 0.003543d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 36153.06122448979d0 :BYTES-PER-SECOND
   1.812709568162574d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2954450432 :SINK-LOW 4000006553 :EXPECTED-HIGH 2954450432
   :EXPECTED-LOW 4000006553 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :ZERO :REPLICA 3 :WORKERS 1 :ITERATIONS 98 :COMPLETED 98
   :BYTES 6422430 :HEAP-BYTES 0 :RAW-TICKS 3593 :SECONDS 0.003593d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 36663.26530612245d0 :BYTES-PER-SECOND
   1.7874839966601727d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2954450432 :SINK-LOW 4000006553 :EXPECTED-HIGH 2954450432
   :EXPECTED-LOW 4000006553 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :ZERO :REPLICA 4 :WORKERS 1 :ITERATIONS 98 :COMPLETED 98
   :BYTES 6422430 :HEAP-BYTES 0 :RAW-TICKS 3586 :SECONDS 0.003586d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 36591.836734693876d0 :BYTES-PER-SECOND
   1.790973229224763d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 2954450432 :SINK-LOW 4000006553 :EXPECTED-HIGH 2954450432
   :EXPECTED-LOW 4000006553 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :MAX :REPLICA 0 :WORKERS 1 :ITERATIONS 98 :COMPLETED 98
   :BYTES 6422430 :HEAP-BYTES 0 :RAW-TICKS 3604 :SECONDS 0.003604d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 36775.510204081635d0 :BYTES-PER-SECOND
   1.7820283018867924d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 4158245344 :SINK-LOW 2314362413 :EXPECTED-HIGH 4158245344
   :EXPECTED-LOW 2314362413 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :MAX :REPLICA 1 :WORKERS 1 :ITERATIONS 98 :COMPLETED 98
   :BYTES 6422430 :HEAP-BYTES 0 :RAW-TICKS 3584 :SECONDS 0.003584d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 36571.42857142857d0 :BYTES-PER-SECOND
   1.79197265625d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL :SINK-HIGH
   4158245344 :SINK-LOW 2314362413 :EXPECTED-HIGH 4158245344 :EXPECTED-LOW
   2314362413 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :MAX :REPLICA 2 :WORKERS 1 :ITERATIONS 98 :COMPLETED 98
   :BYTES 6422430 :HEAP-BYTES 0 :RAW-TICKS 3561 :SECONDS 0.003561d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 36336.73469387755d0 :BYTES-PER-SECOND
   1.803546756529065d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 4158245344 :SINK-LOW 2314362413 :EXPECTED-HIGH 4158245344
   :EXPECTED-LOW 2314362413 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :MAX :REPLICA 3 :WORKERS 1 :ITERATIONS 98 :COMPLETED 98
   :BYTES 6422430 :HEAP-BYTES 0 :RAW-TICKS 3539 :SECONDS 0.003539d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 36112.244897959186d0 :BYTES-PER-SECOND
   1.8147584063294716d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 4158245344 :SINK-LOW 2314362413 :EXPECTED-HIGH 4158245344
   :EXPECTED-LOW 2314362413 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL)
  (:KIND :SERIAL :WORKLOAD
   (:NAME #A((6) BASE-CHAR . "serial") :PRIMITIVE :XXH64) :STATUS :OK :LENGTH
   65535 :SEED-CASE :MAX :REPLICA 4 :WORKERS 1 :ITERATIONS 98 :COMPLETED 98
   :BYTES 6422430 :HEAP-BYTES 0 :RAW-TICKS 3574 :SECONDS 0.003574d0
   :TIME-QUALITY :MEASURED :NS-PER-CALL 36469.38775510204d0 :BYTES-PER-SECOND
   1.7969865696698377d9 :COUNTER-SCOPE :WHOLE-PROCESS :WORKER-RESULTS NIL
   :SINK-HIGH 4158245344 :SINK-LOW 2314362413 :EXPECTED-HIGH 4158245344
   :EXPECTED-LOW 2314362413 :BUFFER-UNCHANGED T :DIAGNOSTIC NIL))
 :DIAGNOSTIC NIL :LIMITS
 (:XXH64-ORIGINAL :SPAN-0-THROUGH-65535 :NON-CRYPTOGRAPHIC :EXPLICIT-U32-SEED
  :CALL-VALIDATION-AND-COUNTER-OVERHEAD :WHOLE-PROCESS-HEAP
  :PARALLEL-GATE-AND-JOIN-OVERHEAD :NO-DB-THROUGHPUT :NO-BASELINE-SUBTRACTION
  :NO-PERFORMANCE-THRESHOLD :SEED-LIFECYCLE-FUTURE :EXTERNAL-LOAD-UNCONTROLLED))
