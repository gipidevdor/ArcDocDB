(:DEADLINE-SECONDS 120 :ARGV
 ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--disable-debugger"
  "--script"
  "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/evidence/baseline/driver.lisp"
  "--child"
  "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/evidence/baseline/config.lisp")
 :NAME "baseline" :FILE NIL :RESULT :BASELINE-PASSED :STATUS :OK
 :COPY-DIRECTORY
 "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/"
 :EVIDENCE-DIRECTORY
 "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/evidence/baseline/"
 :EXPECTED-FAILURE NIL :SUGGESTED-DETECTION-TEST NIL :EXPECTED-TESTS
 (("ARCDOCDB.SERIES.TESTS"
   "TEST-REQ-WAL-006-SERIES-BOOTSTRAP-CAPACITY-OFFSET-CSN-AND-EFFECT-BOUNDARIES")
  ("ARCDOCDB.SERIES.TESTS"
   "TEST-REQ-WAL-006-SERIES-BOOTSTRAP-ACCEPTS-OPAQUE-NON-NIL-VALUES")
  ("ARCDOCDB.SERIES.TESTS"
   "TEST-REQ-AFF-004-SERIES-BOOTSTRAP-NIL-STALE-AND-REPEATED-BEFORE-EFFECT")
  ("ARCDOCDB.SERIES.TESTS"
   "TEST-REQ-AFF-004-SERIES-BOOTSTRAP-VIRGIN-GUARDS-AND-EXISTING-READER-ROOT")
  ("ARCDOCDB.SERIES.TESTS"
   "TEST-REQ-WAL-006-SERIES-BOOTSTRAP-REFUSES-USED-EMPTY-RING-WITH-NIL-ROOT")
  ("ARCDOCDB.SERIES.TESTS"
   "TEST-REQ-WAL-006-SERIES-BOOTSTRAP-FIRST-COMMIT-REQUIRES-INITIAL-ROOT-IDENTITY")
  ("ARCDOCDB.SERIES.TESTS"
   "TEST-REQ-AFF-001-SERIES-BOOTSTRAP-HEALTH-AND-RING-PRECEDE-EFFECT")
  ("ARCDOCDB.SERIES.TESTS"
   "TEST-REQ-AFF-001-SERIES-BOOTSTRAP-ACQUIRED-EFFECT-EXIT-PRESERVES-CAUSE-AND-ROOTS")
  ("ARCDOCDB.SERIES.TESTS"
   "TEST-REQ-AFF-001-SERIES-BOOTSTRAP-PREEXISTING-EFFECT-KEEPS-OUTER-OWNERSHIP")
  ("ARCDOCDB.SERIES.TESTS"
   "TEST-REQ-AFF-001-SERIES-BOOTSTRAP-CAS-CORRUPTION-KEEPS-FIRST-CONDITION-AND-FAULTS-ARCHIVE")
  ("ARCDOCDB.SERIES.TESTS"
   "TEST-REQ-AFF-001-SERIES-BOOTSTRAP-INCOMPLETE-END-PRESERVES-ERROR-AND-NONLOCAL-EXIT")
  ("ARCDOCDB.SERIES.TESTS"
   "TEST-REQ-CON-002-SERIES-BOOTSTRAP-READERS-SEE-ONLY-NIL-OR-COMPLETE-ROOT")
  ("ARCDOCDB.SERIES.TESTS"
   "TEST-REQ-CON-001-SERIES-BOOTSTRAP-FOREIGN-THREAD-CANNOT-USE-OWNER-LEASE")
  ("ARCDOCDB.GET.DIRECTORY.TESTS"
   "TEST-REQ-WAL-006-SERIES-GET-EMPTY-ACTIVE-INITIALIZATION-NATIVE-V1-V2")
  ("ARCDOCDB.GET.DIRECTORY.TESTS"
   "TEST-REQ-WAL-006-SERIES-GET-INITIAL-CONTROLLER-ROOT-AND-NIL-REFUSAL")
  ("ARCDOCDB.GET.DIRECTORY.TESTS"
   "TEST-REQ-IDX-001-SERIES-GET-EMPTY-ACTIVE-CLOSED-BEFORE-FIRST-BATCH-NATIVE-V1-V2")
  ("ARCDOCDB.GET.DIRECTORY.TESTS"
   "TEST-REQ-AFF-004-SERIES-GET-EMPTY-ACTIVE-CANDIDATE-FAULTED-NATIVE-V1-V2")
  ("ARCDOCDB.GET.DIRECTORY.TESTS"
   "TEST-REQ-WAL-006-SERIES-GET-EMPTY-ACTIVE-FIRST-BATCH-PUBLISH-AND-REUSE-NATIVE-V1-V2")
  ("ARCDOCDB.GET.DIRECTORY.TESTS"
   "TEST-REQ-WAL-006-SERIES-GET-EMPTY-ACTIVE-REPEATED-INITIALIZATION-REFUSED")
  ("ARCDOCDB.GET.DIRECTORY.TESTS"
   "TEST-REQ-WAL-006-SERIES-GET-EMPTY-ACTIVE-FOREIGN-OWNER-BEFORE-INITIALIZATION")
  ("ARCDOCDB.GET.DIRECTORY.TESTS"
   "TEST-REQ-WAL-006-SERIES-GET-EMPTY-ACTIVE-DUPLICATE-BEFORE-INITIALIZATION")
  ("ARCDOCDB.GET.DIRECTORY.TESTS"
   "TEST-REQ-CON-002-SERIES-GET-EMPTY-ACTIVE-LEASE-BEFORE-CHECKS")
  ("ARCDOCDB.GET.DIRECTORY.TESTS"
   "TEST-REQ-WAL-006-SERIES-GET-EMPTY-ACTIVE-FILE-FRONTIER-REFUSED")
  ("ARCDOCDB.GET.DIRECTORY.TESTS"
   "TEST-REQ-CMP-007-SERIES-GET-EMPTY-ACTIVE-FIXTURE-CLEANUP-NATIVE-V1-V2")
  ("ARCDOCDB.GET.DIRECTORY.TESTS"
   "TEST-REQ-WAL-006-SERIES-GET-EMPTY-ACTIVE-CLOSED-CAPABILITIES-REFUSED"))
 :PRODUCER-RECORD
 "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/report.lisp"
 :PRODUCER-CLOSED T :CHILD-LAUNCHED T :CHILD-REAPED T :TIMED-OUT NIL :CLEANUP
 :REAPED :DIAGNOSTIC NIL :SOURCE-MANIFEST-BEFORE
 ((:FILE "arcdocdb.asd" :SHA256
   "94b6664c5f86352d2fc34898fc41c2779148480966337dc3cd8b27290f80f518")
  (:FILE "src/active/package.lisp" :SHA256
   "4a6fa4187ef5d44aec4e65d57ee6d6046485f283cc9009c1d94263bee745fa3b")
  (:FILE "src/active/preflight.lisp" :SHA256
   "ef7b592daecc223d78cbcda138b5938abc01593b486482bec06f2721cfd955a2")
  (:FILE "src/active/prepare.lisp" :SHA256
   "7b45fb01132c45c9bec76f374edaa8de91ac6bb2d61ae5c359e1fa10c6346f53")
  (:FILE "src/active/source.lisp" :SHA256
   "ff96fe360b46190ecc08ee9e05a813715dc3399054f93693f9309012aec6547d")
  (:FILE "src/active/types.lisp" :SHA256
   "48fe584096fc253ef182ab428c1887e443af06d75aaa938df660c77e60b39bfb")
  (:FILE "src/cache/build.lisp" :SHA256
   "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0")
  (:FILE "src/cache/clock.lisp" :SHA256
   "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f")
  (:FILE "src/cache/core.lisp" :SHA256
   "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4")
  (:FILE "src/cache/package.lisp" :SHA256
   "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848")
  (:FILE "src/cache/read.lisp" :SHA256
   "5700e43ae8ee859e96bdecb5953af43a712fd9e6ec23a53565759676bb07f85a")
  (:FILE "src/cache/types.lisp" :SHA256
   "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30")
  (:FILE "src/cache/write.lisp" :SHA256
   "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8")
  (:FILE "src/codec/cbor-float-minimal.lisp" :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:FILE "src/codec/cbor-float-narrow.lisp" :SHA256
   "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb")
  (:FILE "src/codec/cbor-float-write.lisp" :SHA256
   "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442")
  (:FILE "src/codec/cbor-header.lisp" :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:FILE "src/codec/cbor-minimal.lisp" :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:FILE "src/codec/cbor-package.lisp" :SHA256
   "c2a6fe51760c871705e4cf213ada92fed140fac26cf177d06889e18ab87fb45b")
  (:FILE "src/codec/cbor-scan-input.lisp" :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:FILE "src/codec/cbor-scan-items.lisp" :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:FILE "src/codec/cbor-scan-minimal.lisp" :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:FILE "src/codec/cbor-scan-stack.lisp" :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:FILE "src/codec/cbor-scan.lisp" :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:FILE "src/codec/cbor-simple-write.lisp" :SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e")
  (:FILE "src/codec/cbor-space.lisp" :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:FILE "src/codec/cbor-string-write.lisp" :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727")
  (:FILE "src/codec/cbor-write.lisp" :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:FILE "src/codec/package.lisp" :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:FILE "src/codec/utf8.lisp" :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:FILE "src/control/build.lisp" :SHA256
   "1904e81a6cebbb178598a41e1b2283240fc21506781b1e31da407610ce0f519c")
  (:FILE "src/control/dependency.lisp" :SHA256
   "f328344e4824fd53d03a0476b45fb87efada43ddee895e13afd76ac44413d128")
  (:FILE "src/control/package.lisp" :SHA256
   "405b91843049e7f9e38896535ad615886443852b39eb0687c29e44dbd675429d")
  (:FILE "src/control/preflight.lisp" :SHA256
   "48326533ac0934cb3b1e3fc7657ef48f38912b6c08e9e38367301905f7711584")
  (:FILE "src/control/prepare.lisp" :SHA256
   "878b15074bfcb3f3aec784e78e545f1ae617539b9ddcb975504880cb000b7f87")
  (:FILE "src/control/transfer.lisp" :SHA256
   "6e257bfb6ce8e6d11263cc6788de4fc35657a82e159af7b46341c3bb208e0275")
  (:FILE "src/control/types.lisp" :SHA256
   "7f7932e0c38d3fa26273342df2be2da436024ff9a9a647c8a3dc5c65c452f563")
  (:FILE "src/csn/package.lisp" :SHA256
   "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0")
  (:FILE "src/csn/registry.lisp" :SHA256
   "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a")
  (:FILE "src/epochs/core.lisp" :SHA256
   "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399")
  (:FILE "src/epochs/package.lisp" :SHA256
   "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd")
  (:FILE "src/epochs/read.lisp" :SHA256
   "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905")
  (:FILE "src/epochs/reclaim.lisp" :SHA256
   "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202")
  (:FILE "src/epochs/retire.lisp" :SHA256
   "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b")
  (:FILE "src/epochs/types.lisp" :SHA256
   "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097")
  (:FILE "src/execution/handoff.lisp" :SHA256
   "3ce9f47008416f210173fd3a83ee7665b2103f26039d36e2601b31e5e3ebd72a")
  (:FILE "src/execution/package.lisp" :SHA256
   "833e501e6ee6e3acb8a6d37139c4605a05e06c425a35318adbcf651aa2f9db30")
  (:FILE "src/execution/queue.lisp" :SHA256
   "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90")
  (:FILE "src/execution/ready-recycle.lisp" :SHA256
   "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b")
  (:FILE "src/execution/ready-types.lisp" :SHA256
   "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f")
  (:FILE "src/execution/ready.lisp" :SHA256
   "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327")
  (:FILE "src/execution/worker-boundary.lisp" :SHA256
   "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a")
  (:FILE "src/execution/worker-claim.lisp" :SHA256
   "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e")
  (:FILE "src/execution/worker-run.lisp" :SHA256
   "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542")
  (:FILE "src/execution/worker-types.lisp" :SHA256
   "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317")
  (:FILE "src/execution/writer.lisp" :SHA256
   "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105")
  (:FILE "src/foundation/batch.lisp" :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:FILE "src/foundation/binary.lisp" :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:FILE "src/foundation/conditions.lisp" :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:FILE "src/foundation/crc32c.lisp" :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:FILE "src/foundation/package.lisp" :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:FILE "src/foundation/record.lisp" :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:FILE "src/get-directory/build.lisp" :SHA256
   "9bebb3cd9d66a8ec2fd0c72ad828e00ab2347093642653da45ef263bc855f947")
  (:FILE "src/get-directory/package.lisp" :SHA256
   "e779202c8df502749a81d0c6f9f0d505d000e09231f3679b1a91303fbcbf36f9")
  (:FILE "src/get-directory/read.lisp" :SHA256
   "a2287eb7e91bed84f3727baaf81376bbe5bf5df15cde1ea268c6d2fa66fe0a5d")
  (:FILE "src/get-directory/sources-read.lisp" :SHA256
   "ee4a3b81322fbd51ce928be0b73e9bc180af7ed39f936b68ec9a152dd2a180c2")
  (:FILE "src/get-directory/sources-types.lisp" :SHA256
   "862342b07d6a8aae834aaf3da4149682fcd1dcbdae971adad640597583547099")
  (:FILE "src/get-directory/types.lisp" :SHA256
   "0e2348291a4994f45bd1f6fe5efdc66041d2fdce18641d1af11b6c850ed69b2b")
  (:FILE "src/get-resolver/active-build.lisp" :SHA256
   "0eed95930d41c515965ae8ab0a14fbb94597a42ea38b86f205ea0938cf4631de")
  (:FILE "src/get-resolver/active-directory.lisp" :SHA256
   "c2b9a9ac3209270e9949720473908460548430a8098c9199fb55d2317a87682b")
  (:FILE "src/get-resolver/active-init.lisp" :SHA256
   "2f9380674cf4b590b071ab9d769a4b79292f544d920c0fc5ff33146dde7686f6")
  (:FILE "src/get-resolver/active-preflight.lisp" :SHA256
   "eb56f5704666cac3a88ec97f58f70c7d61db2e8feea6a094db4c468a1a2775a9")
  (:FILE "src/get-resolver/active-read.lisp" :SHA256
   "47630e5d42c785e39e15dd714177cd86159129a5391d82321385f92317bea659")
  (:FILE "src/get-resolver/active-scan.lisp" :SHA256
   "97dd4f59d4449334b113e9403a208007ed1a398a9b53f88bda3e3c0bbf3a1067")
  (:FILE "src/get-resolver/active-types.lisp" :SHA256
   "a3cb954a265b263e0e03d2f1a80824589670efbf89adcd69007987d26df2e29a")
  (:FILE "src/get-resolver/build.lisp" :SHA256
   "c649c80c2b510669fc1c0a7f15b3080b7fb46a3423a1e49db5bb9ff248176e0a")
  (:FILE "src/get-resolver/package.lisp" :SHA256
   "663a5a15a630ed2b9042a3a3365598358df97d3dd1cd3d7610b283526281f39a")
  (:FILE "src/get-resolver/read.lisp" :SHA256
   "dd100bb17e15589124916767f8a690ae683ac8c462102c778639f917a5f1924d")
  (:FILE "src/get-resolver/rows.lisp" :SHA256
   "d9db85d788006fc7ad1f9a7cdeef28b992605de7fac8c295dd7fdc51f5511854")
  (:FILE "src/get-resolver/scan.lisp" :SHA256
   "35a1780c6bf66364ef94c4151fa91f02eebe359f0ca0639985d2a907fd9d512d")
  (:FILE "src/get-resolver/sort.lisp" :SHA256
   "974bf44efeb1cd26c5e9db0601aea295c8f1a18234894ad9d41938a2880e2255")
  (:FILE "src/get-resolver/types.lisp" :SHA256
   "b847d6c388f4d052a2d707b7c410cc7c2ef60482fb5cd9ef384c016c31d1dc00")
  (:FILE "src/get/build.lisp" :SHA256
   "bcfc4916e9a85833dc151c4ce176bc905f2c03b6bc6d636f97a60df0d8c16739")
  (:FILE "src/get/lifecycle.lisp" :SHA256
   "885ba4141114ea411cac37c9b5f924aaa7f9f2a5ba311ebf92a392e5da1e3c59")
  (:FILE "src/get/lookup.lisp" :SHA256
   "9d1042d4cf1e7bd9c6d1153de12b2459e7a2724e47bd32534cd7ae56cb274c5f")
  (:FILE "src/get/package.lisp" :SHA256
   "87b795779aef0c4b918a039d182daddd22b902a9ad10c763df4364b7e630151c")
  (:FILE "src/get/segment.lisp" :SHA256
   "4a486528cb2c1cc3471cb4b332d4314d24011889e1f885db6fd5600bb077eea3")
  (:FILE "src/get/target.lisp" :SHA256
   "9f682f735e49108cad176a6143ec99e1be64da98f29cae0b52f9b49cdea34250")
  (:FILE "src/get/types.lisp" :SHA256
   "653b23a6e719cd1f55e7c58b4d7e8143aec5983992ba210d0eac1f4c8682f623")
  (:FILE "src/hash/arithmetic.lisp" :SHA256
   "c439e534b768acb123d69b921b85e1e56683aa8335bbc87efba95fe95f256fa9")
  (:FILE "src/hash/blocks.lisp" :SHA256
   "5f5dff95ae6c34dfc15538c537ba2fa8d34ba2376ad66ad9975745ea13a2175f")
  (:FILE "src/hash/hash64.lisp" :SHA256
   "99e4c8394a8f877ce1f552f15a57a082c0ec81015e87119ee4ffea28cf3ae77f")
  (:FILE "src/hash/package.lisp" :SHA256
   "1e7668fa26fc1a8e3b3cfe824aa3e08b30b57441d5f90d44453fc3a9259a10d0")
  (:FILE "src/index/core.lisp" :SHA256
   "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff")
  (:FILE "src/index/hash-digests.lisp" :SHA256
   "924bb7dab91ff56c1e909f2b06dff5f74b443ac6442e379498f29b25f1fa2673")
  (:FILE "src/index/hash-seed.lisp" :SHA256
   "ae86514101e95737747ba58a4f0c5dc1ddb44d2b3a18bceb8fd0d0756b57a7a1")
  (:FILE "src/index/package.lisp" :SHA256
   "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507")
  (:FILE "src/index/primary-arena.lisp" :SHA256
   "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5")
  (:FILE "src/index/primary-build.lisp" :SHA256
   "06ca5ac8c03504e2d2f973873e5cabf7518c090cd1f8f2118c46e0ea2f9bf37b")
  (:FILE "src/index/primary-core.lisp" :SHA256
   "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e")
  (:FILE "src/index/primary-directory.lisp" :SHA256
   "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd")
  (:FILE "src/index/primary-package.lisp" :SHA256
   "0682eb9a61596506b6788bd0285f9808db2496246caae64ab3203182ed46b860")
  (:FILE "src/index/primary-probe.lisp" :SHA256
   "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4")
  (:FILE "src/index/primary-read.lisp" :SHA256
   "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f")
  (:FILE "src/index/primary-relocate.lisp" :SHA256
   "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20")
  (:FILE "src/index/primary-types.lisp" :SHA256
   "f17ca0dcd8a538b921f00044e23872b28272638c4435eacd30f0509422505e64")
  (:FILE "src/index/primary-write.lisp" :SHA256
   "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655")
  (:FILE "src/index/read.lisp" :SHA256
   "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7")
  (:FILE "src/index/rebuild-budget.lisp" :SHA256
   "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0")
  (:FILE "src/index/rebuild-copy.lisp" :SHA256
   "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee")
  (:FILE "src/index/rebuild-scan.lisp" :SHA256
   "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e")
  (:FILE "src/index/rebuild.lisp" :SHA256
   "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1")
  (:FILE "src/index/relocate.lisp" :SHA256
   "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc")
  (:FILE "src/index/types.lisp" :SHA256
   "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e")
  (:FILE "src/index/validation.lisp" :SHA256
   "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a")
  (:FILE "src/index/write.lisp" :SHA256
   "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28")
  (:FILE "src/io/flush.lisp" :SHA256
   "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325")
  (:FILE "src/io/identity-types.lisp" :SHA256
   "5794dd5094f34c24e7e09e4a7937f1988d85ea9cd37e478abaf836273da5d5c1")
  (:FILE "src/io/identity.lisp" :SHA256
   "d2b6f7932b66f2ef74241e573ed253cf9b710f217cd570ef23f6671614d90a2c")
  (:FILE "src/io/lifecycle.lisp" :SHA256
   "baa1f763fe0f394a14d381b753dcb1be1e90eb03eaff5d6469465b5d4eca015f")
  (:FILE "src/io/native.lisp" :SHA256
   "74f63dbb2137a344054e82c6707e6262473b3332ff66a85f79ecfee9fd50f9b4")
  (:FILE "src/io/package.lisp" :SHA256
   "a2437f320b170b4e8df8684ee9b61ab317b8aa10d3c107461450551ff7aec4bd")
  (:FILE "src/io/transfer.lisp" :SHA256
   "c807f294d0211e8433f8f0332ab6ba3ce7d9ae7de3818f43af7ff8d7fcfd341a")
  (:FILE "src/io/types.lisp" :SHA256
   "63e3c4af997e26aaa48cb1df6298aaf97bb3971b88e59e8b7fa2c3736617450a")
  (:FILE "src/mvcc/package.lisp" :SHA256
   "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c")
  (:FILE "src/mvcc/snapshots-core.lisp" :SHA256
   "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998")
  (:FILE "src/mvcc/snapshots-csn.lisp" :SHA256
   "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77")
  (:FILE "src/mvcc/snapshots-lifecycle.lisp" :SHA256
   "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082")
  (:FILE "src/mvcc/snapshots-read.lisp" :SHA256
   "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9")
  (:FILE "src/mvcc/snapshots-register.lisp" :SHA256
   "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b")
  (:FILE "src/mvcc/snapshots-types.lisp" :SHA256
   "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f")
  (:FILE "src/mvcc/types.lisp" :SHA256
   "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50")
  (:FILE "src/package.lisp" :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:FILE "src/read/core.lisp" :SHA256
   "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f")
  (:FILE "src/read/package.lisp" :SHA256
   "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df")
  (:FILE "src/read/task.lisp" :SHA256
   "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2")
  (:FILE "src/read/types.lisp" :SHA256
   "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c")
  (:FILE "src/recovery/decisions-build.lisp" :SHA256
   "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115")
  (:FILE "src/recovery/decisions-package.lisp" :SHA256
   "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39")
  (:FILE "src/recovery/decisions-query.lisp" :SHA256
   "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24")
  (:FILE "src/recovery/decisions-radix.lisp" :SHA256
   "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54")
  (:FILE "src/recovery/decisions-sort.lisp" :SHA256
   "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2")
  (:FILE "src/recovery/decisions-types.lisp" :SHA256
   "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c")
  (:FILE "src/recovery/inventory-build.lisp" :SHA256
   "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e")
  (:FILE "src/recovery/inventory-query.lisp" :SHA256
   "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb")
  (:FILE "src/recovery/inventory-types.lisp" :SHA256
   "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9")
  (:FILE "src/recovery/manifest-build.lisp" :SHA256
   "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471")
  (:FILE "src/recovery/manifest-decode.lisp" :SHA256
   "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779")
  (:FILE "src/recovery/manifest-fold.lisp" :SHA256
   "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730")
  (:FILE "src/recovery/manifest-package.lisp" :SHA256
   "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc")
  (:FILE "src/recovery/manifest-query.lisp" :SHA256
   "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b")
  (:FILE "src/recovery/manifest-types.lisp" :SHA256
   "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10")
  (:FILE "src/recovery/package.lisp" :SHA256
   "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9")
  (:FILE "src/recovery/scan.lisp" :SHA256
   "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218")
  (:FILE "src/scheduler/build.lisp" :SHA256
   "58baf595f221826c64e3fb38344242c3bdf403d65904193bf1a8e06e09d7c336")
  (:FILE "src/scheduler/lifecycle-build.lisp" :SHA256
   "d6d67faf8721f26e7fcd228d6ab9a7dfdc36ff5ec56c67ed9e5fb6d914006a9e")
  (:FILE "src/scheduler/lifecycle-read.lisp" :SHA256
   "c60e1d5f67eeafb216b374fa001d27f87d1a734c5d066fc092902c0301069200")
  (:FILE "src/scheduler/lifecycle-types.lisp" :SHA256
   "4fe980e00f1d273e9b8278cd2daace6b4a9e4ab948ddfac83b79f4b0c537cb7c")
  (:FILE "src/scheduler/lifecycle-update.lisp" :SHA256
   "2020e46809e9fe8fa74e061a420b8085679d5f461eabd8b044f3975c1024800e")
  (:FILE "src/scheduler/lifecycle-worker.lisp" :SHA256
   "ec8b462ff3f5f7a6435f0f0c01b62034d8de2a784a9e354d469a0adfec9cf837")
  (:FILE "src/scheduler/package.lisp" :SHA256
   "5a139172de1648b30e09fdc6fc068141299c2034702f8d5b5f44bb0de14a3112")
  (:FILE "src/scheduler/policy.lisp" :SHA256
   "92b3ca3a81ae0b3ac342a63e5fe5c5d7524091a63065b0232c14c57ee80c4aac")
  (:FILE "src/scheduler/read.lisp" :SHA256
   "5cdc1e5b7ba97c9aab66a5acaf74336b0df33144e24104e0242b7fc2552a1ae2")
  (:FILE "src/scheduler/types.lisp" :SHA256
   "3b174be0919f8b27312ada4071d831c3753d62bb12be99d7e9394c48dcab474a")
  (:FILE "src/scheduler/update.lisp" :SHA256
   "e35a704ee0b9445c559a768de048169a8e39837a6df21843d8df58215c482472")
  (:FILE "src/series/events.lisp" :SHA256
   "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7")
  (:FILE "src/series/io-events.lisp" :SHA256
   "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546")
  (:FILE "src/series/ownership.lisp" :SHA256
   "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4")
  (:FILE "src/series/package.lisp" :SHA256
   "9a402f5225860c483dec9064a84d6462d28f5377a27977a63f64a5fbdbdd3764")
  (:FILE "src/series/publication.lisp" :SHA256
   "5de121c83ea6bd1243e420d9d898102aebb054cd1fa7ac79fcde9bf0792a95d8")
  (:FILE "src/series/query.lisp" :SHA256
   "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9")
  (:FILE "src/series/retirement.lisp" :SHA256
   "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059")
  (:FILE "src/series/routing-build.lisp" :SHA256
   "70135e73ecb1f6080683dd615c47a50530485061797382d74441743cd9a0f92d")
  (:FILE "src/series/routing-select.lisp" :SHA256
   "796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a")
  (:FILE "src/series/routing-types.lisp" :SHA256
   "31ae51c0fb11a802164a4d1e11ec63f835a2c67b52c751c5685bcc8947e5e0f1")
  (:FILE "src/series/types.lisp" :SHA256
   "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9")
  (:FILE "src/series/worker-boundary.lisp" :SHA256
   "793d401d1b9acc7b67923d815560f277f3d390ca050740f735f07d88dbacfe73")
  (:FILE "src/series/worker-package.lisp" :SHA256
   "dcab7a17e4fabcf256c2eddfb655d18145a1d789dd8d64a889945badc418e4b7")
  (:FILE "src/series/worker-run.lisp" :SHA256
   "f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f")
  (:FILE "src/series/worker-types.lisp" :SHA256
   "a366799fd9b938bfaa48b0ffda228ff8369ab9acb5b5ead7f081dfc66ab2c81a")
  (:FILE "src/storage/compaction-scan.lisp" :SHA256
   "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d")
  (:FILE "src/storage/control-payload.lisp" :SHA256
   "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491")
  (:FILE "src/storage/formats.lisp" :SHA256
   "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f")
  (:FILE "src/storage/log-header.lisp" :SHA256
   "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81")
  (:FILE "src/storage/package.lisp" :SHA256
   "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e")
  (:FILE "src/storage/payload-record.lisp" :SHA256
   "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7")
  (:FILE "src/storage/payload-write.lisp" :SHA256
   "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc")
  (:FILE "src/storage/segment-header.lisp" :SHA256
   "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011")
  (:FILE "src/wal/builder.lisp" :SHA256
   "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0")
  (:FILE "src/wal/csn.lisp" :SHA256
   "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810")
  (:FILE "src/wal/executor.lisp" :SHA256
   "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8")
  (:FILE "src/wal/group.lisp" :SHA256
   "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b")
  (:FILE "src/wal/package.lisp" :SHA256
   "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89")
  (:FILE "src/wal/types.lisp" :SHA256
   "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e")
  (:FILE "tests/codec/cbor-float-write-support.lisp" :SHA256
   "158f18dcf4b2d7e5562713caa3625aeba16dd1eba21f4413345e8a10b616c748")
  (:FILE "tests/codec/cbor-float-write-threads.lisp" :SHA256
   "96a1b205c01f75e271684132ff3e48b4da5cf8a01210257b591ec4951f097043")
  (:FILE "tests/codec/cbor-float-write.lisp" :SHA256
   "2d163a64bff4b9d9b9de576c4a4df05f4d8853f1c3d039e790cbb827be98c8b6")
  (:FILE "tests/codec/cbor-header.lisp" :SHA256
   "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815")
  (:FILE "tests/codec/cbor-minimal-edges.lisp" :SHA256
   "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70")
  (:FILE "tests/codec/cbor-minimal-scan-support.lisp" :SHA256
   "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421")
  (:FILE "tests/codec/cbor-minimal-scan-threads.lisp" :SHA256
   "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660")
  (:FILE "tests/codec/cbor-minimal-scan.lisp" :SHA256
   "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8")
  (:FILE "tests/codec/cbor-minimal-support.lisp" :SHA256
   "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a")
  (:FILE "tests/codec/cbor-minimal-threads.lisp" :SHA256
   "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2")
  (:FILE "tests/codec/cbor-minimal.lisp" :SHA256
   "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3")
  (:FILE "tests/codec/cbor-simple-write-support.lisp" :SHA256
   "53ceafc72a027a2ff1f787900558ff26f2ff70bbb212f1b37926a6d520fbe86e")
  (:FILE "tests/codec/cbor-simple-write-threads.lisp" :SHA256
   "77074033e75a224fd02e890f98dffa8e97d3a1f8bedd510b00ea55d8ff8687b2")
  (:FILE "tests/codec/cbor-simple-write.lisp" :SHA256
   "958bdd3901cfc41032c09d6c9023b192799981884e09ce3573256ff45bc5329a")
  (:FILE "tests/codec/cbor-string-write-support.lisp" :SHA256
   "2cbdb601f442a56456bc637c94e759cc965f44b178268dce3c636c385d34fc39")
  (:FILE "tests/codec/cbor-string-write-threads.lisp" :SHA256
   "8e07b881a55e2554a429f1c8b2c69f67862ac015217d90d019167d636564d27d")
  (:FILE "tests/codec/cbor-string-write.lisp" :SHA256
   "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115")
  (:FILE "tests/codec/cbor-structure-support.lisp" :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:FILE "tests/codec/cbor-structure-threads.lisp" :SHA256
   "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645")
  (:FILE "tests/codec/cbor-structure.lisp" :SHA256
   "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110")
  (:FILE "tests/codec/cbor-support.lisp" :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:FILE "tests/codec/cbor-threads.lisp" :SHA256
   "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14")
  (:FILE "tests/codec/cbor-write-roundtrip.lisp" :SHA256
   "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344")
  (:FILE "tests/codec/cbor-write-support.lisp" :SHA256
   "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6")
  (:FILE "tests/codec/cbor-write-threads.lisp" :SHA256
   "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb")
  (:FILE "tests/codec/cbor-write.lisp" :SHA256
   "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3")
  (:FILE "tests/codec/support.lisp" :SHA256
   "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96")
  (:FILE "tests/codec/threads.lisp" :SHA256
   "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337")
  (:FILE "tests/codec/utf8.lisp" :SHA256
   "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100")
  (:FILE "tests/csn/registry.lisp" :SHA256
   "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950")
  (:FILE "tests/csn/support.lisp" :SHA256
   "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db")
  (:FILE "tests/csn/threads.lisp" :SHA256
   "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2")
  (:FILE "tests/epochs/lifecycle.lisp" :SHA256
   "ddc2fbdad9f97d2e4ff008c167776a50b17b742398306fbd5198dca474559cbf")
  (:FILE "tests/epochs/support.lisp" :SHA256
   "366be7af4bf6c4ed946b3fa9e97aea6b034c83e3b757d81c54078dc76d229b6d")
  (:FILE "tests/epochs/threads.lisp" :SHA256
   "54b73e06c61e64f32a3e3af0791891dacb6590e929163dcf0fac95f2c71e66fd")
  (:FILE "tests/execution/handoff.lisp" :SHA256
   "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e")
  (:FILE "tests/execution/queue.lisp" :SHA256
   "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722")
  (:FILE "tests/execution/ready-recycle.lisp" :SHA256
   "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae")
  (:FILE "tests/execution/ready.lisp" :SHA256
   "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e")
  (:FILE "tests/execution/support.lisp" :SHA256
   "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43")
  (:FILE "tests/execution/threads.lisp" :SHA256
   "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359")
  (:FILE "tests/execution/worker.lisp" :SHA256
   "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06")
  (:FILE "tests/foundation/batch.lisp" :SHA256
   "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183")
  (:FILE "tests/foundation/binary.lisp" :SHA256
   "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe")
  (:FILE "tests/foundation/record.lisp" :SHA256
   "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8")
  (:FILE "tests/foundation/support.lisp" :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:FILE "tests/get-directory/construction.lisp" :SHA256
   "4ce9aa7064793e908008b9e1055c1e2527d5071006782ea956509c28e8c712d7")
  (:FILE "tests/get-directory/read.lisp" :SHA256
   "a222541b6413bb93ff86a269273f1fa15bfad0d1e4072fc058b023fec5143280")
  (:FILE "tests/get-directory/series-read.lisp" :SHA256
   "4b9856d69cd82c1462c87d16b9eb8e00fb642a46bb22f2f7b01865f7cc2a83a4")
  (:FILE "tests/get-directory/series-support.lisp" :SHA256
   "40f15fbdf42b80515cbfc57eb74bedcbd96d4a9e7e19dc25d8db59f326fe659a")
  (:FILE "tests/get-directory/support.lisp" :SHA256
   "be3a216a6ec597b63186b6bf3d3e35f3327f3001b1c00535d64b10bcb5d9fe85")
  (:FILE "tests/get-directory/threads.lisp" :SHA256
   "e6a93ec22bc6f5a31b37ae99d927d1ca3a53893adb2eae21cd89d132a82d1f64")
  (:FILE "tests/get-performance/guards.lisp" :SHA256
   "c41721b917ed443355ea3707efdd07e7da53a978c0515ab1e5ede5fcc47d63fc")
  (:FILE "tests/get-performance/paths.lisp" :SHA256
   "3b8d2c9c93467507ea2bb471d42192eb1fa084b55c0f4263b5ef0d3acf468f55")
  (:FILE "tests/get-performance/support.lisp" :SHA256
   "e586ed94dcb2aaba00282931cdd83313e4f84a86d4d1ba85e2d56e8b7433ed8d")
  (:FILE "tests/get-performance/threads.lisp" :SHA256
   "05ace5eb351ab49da59611dc1a2a5abedb9d723a2fc6e75a30fc76e507573a90")
  (:FILE "tests/get-resolver/construction.lisp" :SHA256
   "45cbef3b35db35d60a4cec2516c24f6ef56f5edb2f19f6f07f24fe00c8737b13")
  (:FILE "tests/get-resolver/read.lisp" :SHA256
   "70e46d1b88716f44309f46b4955928ca7fa2195edd80bb67d5b97732b971e8fb")
  (:FILE "tests/get-resolver/sort.lisp" :SHA256
   "fd7f97f0fad2e970b972688481c0c132f11c85f5fdcd0f02bee6b0b3f93b97ae")
  (:FILE "tests/get-resolver/support.lisp" :SHA256
   "d30a5c8a61b63e339facfee9f7701eb5a3614bbfd1ebef2c46c747d136640f8b")
  (:FILE "tests/get/lifecycle.lisp" :SHA256
   "73bf87c2aee7b537dba31fc0ae554272f7d2be5a4c1e9e96ea2f21a17f6f71f5")
  (:FILE "tests/get/segment.lisp" :SHA256
   "e9722f419ce0810c98c28d0e1a74da85d52346a0befff40c1119934519fc6f98")
  (:FILE "tests/get/support.lisp" :SHA256
   "21f0da34755882f7dcc3ee760528ca39d4731e1a79ea94525c62753b7f60422c")
  (:FILE "tests/hash/guards.lisp" :SHA256
   "9af5b38443a57d224990a68e93f12f7a4cda306f94c7ccd3ccb50635865d7864")
  (:FILE "tests/hash/hash64.lisp" :SHA256
   "70606bc68807143cfea9583871474c84efc868d13692cde28488284dee43e0f1")
  (:FILE "tests/hash/support.lisp" :SHA256
   "0fae9dc36976af544f83e6051b9cf9d67c9bef0b9e25f1fa2a48fdac48592acb")
  (:FILE "tests/hash/threads.lisp" :SHA256
   "3fc587a57d26a294aebfc6a7aeadf2f61a42a21106c1c57517f891b76b4e750a")
  (:FILE "tests/index/hash-digests.lisp" :SHA256
   "3b3b39f861883cf2017cab8e6488560a6bb3897d63784f00e820a6450d743225")
  (:FILE "tests/index/primary-support.lisp" :SHA256
   "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a")
  (:FILE "tests/index/primary-threads.lisp" :SHA256
   "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2")
  (:FILE "tests/index/primary.lisp" :SHA256
   "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696")
  (:FILE "tests/index/rebuild.lisp" :SHA256
   "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1")
  (:FILE "tests/index/slot-support.lisp" :SHA256
   "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31")
  (:FILE "tests/index/slot-threads.lisp" :SHA256
   "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f")
  (:FILE "tests/index/slots.lisp" :SHA256
   "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb")
  (:FILE "tests/io/native.lisp" :SHA256
   "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0")
  (:FILE "tests/io/support.lisp" :SHA256
   "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50")
  (:FILE "tests/io/transfer.lisp" :SHA256
   "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd")
  (:FILE "tests/lint-fixtures/bad.lisp" :SHA256
   "ac8912ce6cc1101f2ebc305a50c0565879547b527d7ca0aeac900ee06bf26652")
  (:FILE "tests/lint-fixtures/good.lisp" :SHA256
   "05ce84f8fd12d9af48252601bcc92d6d60335b53f39b01a9fe2697c4bdaa8cee")
  (:FILE "tests/lint-fixtures/keyword-barrier.lisp" :SHA256
   "e26dab117e9526ace35bb45b92f977065d33fcc4404c40fd4fc3c77749689a96")
  (:FILE "tests/lint-fixtures/qualified-reader.lisp" :SHA256
   "835229bdc1a0ed0c08511cd6121e1f1bc4284da2cfba951b72cd1a74a6040d35")
  (:FILE "tests/mvcc/capture.lisp" :SHA256
   "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35")
  (:FILE "tests/mvcc/lifecycle.lisp" :SHA256
   "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16")
  (:FILE "tests/mvcc/support.lisp" :SHA256
   "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290")
  (:FILE "tests/read/lifecycle.lisp" :SHA256
   "c4c4642408816f2e0e809e21d04739b68b9391237e3e46ea0b195ed82857c3a8")
  (:FILE "tests/read/support.lisp" :SHA256
   "8095cc39d49342f6e43f3421b4fced839da02d8d11b4d8ddcd91bd346447e754")
  (:FILE "tests/read/threads.lisp" :SHA256
   "e2e223b69b08a5d76b9773c6ad4dee13ef2ddbb6f5ababa713cc5654bc7b51c5")
  (:FILE "tests/recovery/corruption.lisp" :SHA256
   "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c")
  (:FILE "tests/recovery/decisions-audit.lisp" :SHA256
   "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0")
  (:FILE "tests/recovery/decisions-radix.lisp" :SHA256
   "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0")
  (:FILE "tests/recovery/decisions-support.lisp" :SHA256
   "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4")
  (:FILE "tests/recovery/decisions.lisp" :SHA256
   "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e")
  (:FILE "tests/recovery/inventory-support.lisp" :SHA256
   "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27")
  (:FILE "tests/recovery/inventory.lisp" :SHA256
   "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9")
  (:FILE "tests/recovery/manifest-audit.lisp" :SHA256
   "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6")
  (:FILE "tests/recovery/manifest-support.lisp" :SHA256
   "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830")
  (:FILE "tests/recovery/manifest.lisp" :SHA256
   "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd")
  (:FILE "tests/recovery/scan.lisp" :SHA256
   "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b")
  (:FILE "tests/recovery/support.lisp" :SHA256
   "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204")
  (:FILE "tests/scheduler/controller.lisp" :SHA256
   "e986e3facc9d1b9b4eab0d135259a61d7e0f188a7f268cb2e5ee5f9c700c40be")
  (:FILE "tests/scheduler/lifecycle.lisp" :SHA256
   "eff59c0cf6d9c6c1ddec57a4efa26a8fcaeedc850b77764b818bc1c22eb73e38")
  (:FILE "tests/scheduler/support.lisp" :SHA256
   "300234f9ac7931f8c8b9bf305498a2742a3b8868dd9158dbab8c7fdceed5a1e4")
  (:FILE "tests/series/boundaries.lisp" :SHA256
   "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8")
  (:FILE "tests/series/controller.lisp" :SHA256
   "8bc98ec62e58803cab5613210e1200e0ce296af9aff63b5dff61579c3931670a")
  (:FILE "tests/series/support.lisp" :SHA256
   "810dd8a69927c75e3399af47b8fff18e4ab88eb41049c50bafee5c041be263b3")
  (:FILE "tests/series/threads.lisp" :SHA256
   "b8fe9d7e1c0ca4e18909a0a6f7ac03c8df68dd186fa21e62600be685d6e4c7ae")
  (:FILE "tests/series/worker-bridge.lisp" :SHA256
   "c1ee49702e63978a83cb86c4e5bf437a5a40e48fa02b65d3eaf3dca0d2e39176")
  (:FILE "tests/series/worker-routing.lisp" :SHA256
   "f495d33f73e3249d1055ea61d65034033367de85edec3db2cac3a63ff449e3f9")
  (:FILE "tests/smoke.lisp" :SHA256
   "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8")
  (:FILE "tests/storage/compaction-scan.lisp" :SHA256
   "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5")
  (:FILE "tests/storage/control-payload.lisp" :SHA256
   "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae")
  (:FILE "tests/storage/log-header.lisp" :SHA256
   "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e")
  (:FILE "tests/storage/segment-header.lisp" :SHA256
   "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df")
  (:FILE "tests/storage/support.lisp" :SHA256
   "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625")
  (:FILE "tests/wal/builder.lisp" :SHA256
   "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6")
  (:FILE "tests/wal/csn-threads.lisp" :SHA256
   "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c")
  (:FILE "tests/wal/csn.lisp" :SHA256
   "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a")
  (:FILE "tests/wal/fault.lisp" :SHA256
   "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875")
  (:FILE "tests/wal/group.lisp" :SHA256
   "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e")
  (:FILE "tests/wal/native.lisp" :SHA256
   "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7")
  (:FILE "tests/wal/support.lisp" :SHA256
   "90a47539e5e2898c0a08059207f30bb5551e7ca8fc166f8f6ce7b95afa757295")
  (:FILE "tools/get-active-init-mutation.lisp" :SHA256
   "1768a06137f021e83e0be65821b13af80ac96f0ddcdd86659660522f40fda716")
  (:FILE "tools/evidence-storage.lisp" :SHA256
   "8f287772a41b1ebe0e7b3ecc3826a4148082efed428a9749655977e62a9c15a6"))
 :SOURCE-MANIFEST-AFTER
 ((:FILE "arcdocdb.asd" :SHA256
   "94b6664c5f86352d2fc34898fc41c2779148480966337dc3cd8b27290f80f518")
  (:FILE "src/active/package.lisp" :SHA256
   "4a6fa4187ef5d44aec4e65d57ee6d6046485f283cc9009c1d94263bee745fa3b")
  (:FILE "src/active/preflight.lisp" :SHA256
   "ef7b592daecc223d78cbcda138b5938abc01593b486482bec06f2721cfd955a2")
  (:FILE "src/active/prepare.lisp" :SHA256
   "7b45fb01132c45c9bec76f374edaa8de91ac6bb2d61ae5c359e1fa10c6346f53")
  (:FILE "src/active/source.lisp" :SHA256
   "ff96fe360b46190ecc08ee9e05a813715dc3399054f93693f9309012aec6547d")
  (:FILE "src/active/types.lisp" :SHA256
   "48fe584096fc253ef182ab428c1887e443af06d75aaa938df660c77e60b39bfb")
  (:FILE "src/cache/build.lisp" :SHA256
   "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0")
  (:FILE "src/cache/clock.lisp" :SHA256
   "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f")
  (:FILE "src/cache/core.lisp" :SHA256
   "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4")
  (:FILE "src/cache/package.lisp" :SHA256
   "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848")
  (:FILE "src/cache/read.lisp" :SHA256
   "5700e43ae8ee859e96bdecb5953af43a712fd9e6ec23a53565759676bb07f85a")
  (:FILE "src/cache/types.lisp" :SHA256
   "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30")
  (:FILE "src/cache/write.lisp" :SHA256
   "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8")
  (:FILE "src/codec/cbor-float-minimal.lisp" :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:FILE "src/codec/cbor-float-narrow.lisp" :SHA256
   "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb")
  (:FILE "src/codec/cbor-float-write.lisp" :SHA256
   "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442")
  (:FILE "src/codec/cbor-header.lisp" :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:FILE "src/codec/cbor-minimal.lisp" :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:FILE "src/codec/cbor-package.lisp" :SHA256
   "c2a6fe51760c871705e4cf213ada92fed140fac26cf177d06889e18ab87fb45b")
  (:FILE "src/codec/cbor-scan-input.lisp" :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:FILE "src/codec/cbor-scan-items.lisp" :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:FILE "src/codec/cbor-scan-minimal.lisp" :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:FILE "src/codec/cbor-scan-stack.lisp" :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:FILE "src/codec/cbor-scan.lisp" :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:FILE "src/codec/cbor-simple-write.lisp" :SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e")
  (:FILE "src/codec/cbor-space.lisp" :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:FILE "src/codec/cbor-string-write.lisp" :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727")
  (:FILE "src/codec/cbor-write.lisp" :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:FILE "src/codec/package.lisp" :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:FILE "src/codec/utf8.lisp" :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:FILE "src/control/build.lisp" :SHA256
   "1904e81a6cebbb178598a41e1b2283240fc21506781b1e31da407610ce0f519c")
  (:FILE "src/control/dependency.lisp" :SHA256
   "f328344e4824fd53d03a0476b45fb87efada43ddee895e13afd76ac44413d128")
  (:FILE "src/control/package.lisp" :SHA256
   "405b91843049e7f9e38896535ad615886443852b39eb0687c29e44dbd675429d")
  (:FILE "src/control/preflight.lisp" :SHA256
   "48326533ac0934cb3b1e3fc7657ef48f38912b6c08e9e38367301905f7711584")
  (:FILE "src/control/prepare.lisp" :SHA256
   "878b15074bfcb3f3aec784e78e545f1ae617539b9ddcb975504880cb000b7f87")
  (:FILE "src/control/transfer.lisp" :SHA256
   "6e257bfb6ce8e6d11263cc6788de4fc35657a82e159af7b46341c3bb208e0275")
  (:FILE "src/control/types.lisp" :SHA256
   "7f7932e0c38d3fa26273342df2be2da436024ff9a9a647c8a3dc5c65c452f563")
  (:FILE "src/csn/package.lisp" :SHA256
   "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0")
  (:FILE "src/csn/registry.lisp" :SHA256
   "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a")
  (:FILE "src/epochs/core.lisp" :SHA256
   "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399")
  (:FILE "src/epochs/package.lisp" :SHA256
   "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd")
  (:FILE "src/epochs/read.lisp" :SHA256
   "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905")
  (:FILE "src/epochs/reclaim.lisp" :SHA256
   "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202")
  (:FILE "src/epochs/retire.lisp" :SHA256
   "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b")
  (:FILE "src/epochs/types.lisp" :SHA256
   "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097")
  (:FILE "src/execution/handoff.lisp" :SHA256
   "3ce9f47008416f210173fd3a83ee7665b2103f26039d36e2601b31e5e3ebd72a")
  (:FILE "src/execution/package.lisp" :SHA256
   "833e501e6ee6e3acb8a6d37139c4605a05e06c425a35318adbcf651aa2f9db30")
  (:FILE "src/execution/queue.lisp" :SHA256
   "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90")
  (:FILE "src/execution/ready-recycle.lisp" :SHA256
   "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b")
  (:FILE "src/execution/ready-types.lisp" :SHA256
   "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f")
  (:FILE "src/execution/ready.lisp" :SHA256
   "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327")
  (:FILE "src/execution/worker-boundary.lisp" :SHA256
   "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a")
  (:FILE "src/execution/worker-claim.lisp" :SHA256
   "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e")
  (:FILE "src/execution/worker-run.lisp" :SHA256
   "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542")
  (:FILE "src/execution/worker-types.lisp" :SHA256
   "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317")
  (:FILE "src/execution/writer.lisp" :SHA256
   "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105")
  (:FILE "src/foundation/batch.lisp" :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:FILE "src/foundation/binary.lisp" :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:FILE "src/foundation/conditions.lisp" :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:FILE "src/foundation/crc32c.lisp" :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:FILE "src/foundation/package.lisp" :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:FILE "src/foundation/record.lisp" :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:FILE "src/get-directory/build.lisp" :SHA256
   "9bebb3cd9d66a8ec2fd0c72ad828e00ab2347093642653da45ef263bc855f947")
  (:FILE "src/get-directory/package.lisp" :SHA256
   "e779202c8df502749a81d0c6f9f0d505d000e09231f3679b1a91303fbcbf36f9")
  (:FILE "src/get-directory/read.lisp" :SHA256
   "a2287eb7e91bed84f3727baaf81376bbe5bf5df15cde1ea268c6d2fa66fe0a5d")
  (:FILE "src/get-directory/sources-read.lisp" :SHA256
   "ee4a3b81322fbd51ce928be0b73e9bc180af7ed39f936b68ec9a152dd2a180c2")
  (:FILE "src/get-directory/sources-types.lisp" :SHA256
   "862342b07d6a8aae834aaf3da4149682fcd1dcbdae971adad640597583547099")
  (:FILE "src/get-directory/types.lisp" :SHA256
   "0e2348291a4994f45bd1f6fe5efdc66041d2fdce18641d1af11b6c850ed69b2b")
  (:FILE "src/get-resolver/active-build.lisp" :SHA256
   "0eed95930d41c515965ae8ab0a14fbb94597a42ea38b86f205ea0938cf4631de")
  (:FILE "src/get-resolver/active-directory.lisp" :SHA256
   "c2b9a9ac3209270e9949720473908460548430a8098c9199fb55d2317a87682b")
  (:FILE "src/get-resolver/active-init.lisp" :SHA256
   "2f9380674cf4b590b071ab9d769a4b79292f544d920c0fc5ff33146dde7686f6")
  (:FILE "src/get-resolver/active-preflight.lisp" :SHA256
   "eb56f5704666cac3a88ec97f58f70c7d61db2e8feea6a094db4c468a1a2775a9")
  (:FILE "src/get-resolver/active-read.lisp" :SHA256
   "47630e5d42c785e39e15dd714177cd86159129a5391d82321385f92317bea659")
  (:FILE "src/get-resolver/active-scan.lisp" :SHA256
   "97dd4f59d4449334b113e9403a208007ed1a398a9b53f88bda3e3c0bbf3a1067")
  (:FILE "src/get-resolver/active-types.lisp" :SHA256
   "a3cb954a265b263e0e03d2f1a80824589670efbf89adcd69007987d26df2e29a")
  (:FILE "src/get-resolver/build.lisp" :SHA256
   "c649c80c2b510669fc1c0a7f15b3080b7fb46a3423a1e49db5bb9ff248176e0a")
  (:FILE "src/get-resolver/package.lisp" :SHA256
   "663a5a15a630ed2b9042a3a3365598358df97d3dd1cd3d7610b283526281f39a")
  (:FILE "src/get-resolver/read.lisp" :SHA256
   "dd100bb17e15589124916767f8a690ae683ac8c462102c778639f917a5f1924d")
  (:FILE "src/get-resolver/rows.lisp" :SHA256
   "d9db85d788006fc7ad1f9a7cdeef28b992605de7fac8c295dd7fdc51f5511854")
  (:FILE "src/get-resolver/scan.lisp" :SHA256
   "35a1780c6bf66364ef94c4151fa91f02eebe359f0ca0639985d2a907fd9d512d")
  (:FILE "src/get-resolver/sort.lisp" :SHA256
   "974bf44efeb1cd26c5e9db0601aea295c8f1a18234894ad9d41938a2880e2255")
  (:FILE "src/get-resolver/types.lisp" :SHA256
   "b847d6c388f4d052a2d707b7c410cc7c2ef60482fb5cd9ef384c016c31d1dc00")
  (:FILE "src/get/build.lisp" :SHA256
   "bcfc4916e9a85833dc151c4ce176bc905f2c03b6bc6d636f97a60df0d8c16739")
  (:FILE "src/get/lifecycle.lisp" :SHA256
   "885ba4141114ea411cac37c9b5f924aaa7f9f2a5ba311ebf92a392e5da1e3c59")
  (:FILE "src/get/lookup.lisp" :SHA256
   "9d1042d4cf1e7bd9c6d1153de12b2459e7a2724e47bd32534cd7ae56cb274c5f")
  (:FILE "src/get/package.lisp" :SHA256
   "87b795779aef0c4b918a039d182daddd22b902a9ad10c763df4364b7e630151c")
  (:FILE "src/get/segment.lisp" :SHA256
   "4a486528cb2c1cc3471cb4b332d4314d24011889e1f885db6fd5600bb077eea3")
  (:FILE "src/get/target.lisp" :SHA256
   "9f682f735e49108cad176a6143ec99e1be64da98f29cae0b52f9b49cdea34250")
  (:FILE "src/get/types.lisp" :SHA256
   "653b23a6e719cd1f55e7c58b4d7e8143aec5983992ba210d0eac1f4c8682f623")
  (:FILE "src/hash/arithmetic.lisp" :SHA256
   "c439e534b768acb123d69b921b85e1e56683aa8335bbc87efba95fe95f256fa9")
  (:FILE "src/hash/blocks.lisp" :SHA256
   "5f5dff95ae6c34dfc15538c537ba2fa8d34ba2376ad66ad9975745ea13a2175f")
  (:FILE "src/hash/hash64.lisp" :SHA256
   "99e4c8394a8f877ce1f552f15a57a082c0ec81015e87119ee4ffea28cf3ae77f")
  (:FILE "src/hash/package.lisp" :SHA256
   "1e7668fa26fc1a8e3b3cfe824aa3e08b30b57441d5f90d44453fc3a9259a10d0")
  (:FILE "src/index/core.lisp" :SHA256
   "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff")
  (:FILE "src/index/hash-digests.lisp" :SHA256
   "924bb7dab91ff56c1e909f2b06dff5f74b443ac6442e379498f29b25f1fa2673")
  (:FILE "src/index/hash-seed.lisp" :SHA256
   "ae86514101e95737747ba58a4f0c5dc1ddb44d2b3a18bceb8fd0d0756b57a7a1")
  (:FILE "src/index/package.lisp" :SHA256
   "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507")
  (:FILE "src/index/primary-arena.lisp" :SHA256
   "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5")
  (:FILE "src/index/primary-build.lisp" :SHA256
   "06ca5ac8c03504e2d2f973873e5cabf7518c090cd1f8f2118c46e0ea2f9bf37b")
  (:FILE "src/index/primary-core.lisp" :SHA256
   "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e")
  (:FILE "src/index/primary-directory.lisp" :SHA256
   "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd")
  (:FILE "src/index/primary-package.lisp" :SHA256
   "0682eb9a61596506b6788bd0285f9808db2496246caae64ab3203182ed46b860")
  (:FILE "src/index/primary-probe.lisp" :SHA256
   "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4")
  (:FILE "src/index/primary-read.lisp" :SHA256
   "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f")
  (:FILE "src/index/primary-relocate.lisp" :SHA256
   "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20")
  (:FILE "src/index/primary-types.lisp" :SHA256
   "f17ca0dcd8a538b921f00044e23872b28272638c4435eacd30f0509422505e64")
  (:FILE "src/index/primary-write.lisp" :SHA256
   "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655")
  (:FILE "src/index/read.lisp" :SHA256
   "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7")
  (:FILE "src/index/rebuild-budget.lisp" :SHA256
   "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0")
  (:FILE "src/index/rebuild-copy.lisp" :SHA256
   "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee")
  (:FILE "src/index/rebuild-scan.lisp" :SHA256
   "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e")
  (:FILE "src/index/rebuild.lisp" :SHA256
   "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1")
  (:FILE "src/index/relocate.lisp" :SHA256
   "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc")
  (:FILE "src/index/types.lisp" :SHA256
   "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e")
  (:FILE "src/index/validation.lisp" :SHA256
   "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a")
  (:FILE "src/index/write.lisp" :SHA256
   "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28")
  (:FILE "src/io/flush.lisp" :SHA256
   "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325")
  (:FILE "src/io/identity-types.lisp" :SHA256
   "5794dd5094f34c24e7e09e4a7937f1988d85ea9cd37e478abaf836273da5d5c1")
  (:FILE "src/io/identity.lisp" :SHA256
   "d2b6f7932b66f2ef74241e573ed253cf9b710f217cd570ef23f6671614d90a2c")
  (:FILE "src/io/lifecycle.lisp" :SHA256
   "baa1f763fe0f394a14d381b753dcb1be1e90eb03eaff5d6469465b5d4eca015f")
  (:FILE "src/io/native.lisp" :SHA256
   "74f63dbb2137a344054e82c6707e6262473b3332ff66a85f79ecfee9fd50f9b4")
  (:FILE "src/io/package.lisp" :SHA256
   "a2437f320b170b4e8df8684ee9b61ab317b8aa10d3c107461450551ff7aec4bd")
  (:FILE "src/io/transfer.lisp" :SHA256
   "c807f294d0211e8433f8f0332ab6ba3ce7d9ae7de3818f43af7ff8d7fcfd341a")
  (:FILE "src/io/types.lisp" :SHA256
   "63e3c4af997e26aaa48cb1df6298aaf97bb3971b88e59e8b7fa2c3736617450a")
  (:FILE "src/mvcc/package.lisp" :SHA256
   "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c")
  (:FILE "src/mvcc/snapshots-core.lisp" :SHA256
   "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998")
  (:FILE "src/mvcc/snapshots-csn.lisp" :SHA256
   "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77")
  (:FILE "src/mvcc/snapshots-lifecycle.lisp" :SHA256
   "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082")
  (:FILE "src/mvcc/snapshots-read.lisp" :SHA256
   "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9")
  (:FILE "src/mvcc/snapshots-register.lisp" :SHA256
   "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b")
  (:FILE "src/mvcc/snapshots-types.lisp" :SHA256
   "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f")
  (:FILE "src/mvcc/types.lisp" :SHA256
   "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50")
  (:FILE "src/package.lisp" :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:FILE "src/read/core.lisp" :SHA256
   "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f")
  (:FILE "src/read/package.lisp" :SHA256
   "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df")
  (:FILE "src/read/task.lisp" :SHA256
   "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2")
  (:FILE "src/read/types.lisp" :SHA256
   "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c")
  (:FILE "src/recovery/decisions-build.lisp" :SHA256
   "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115")
  (:FILE "src/recovery/decisions-package.lisp" :SHA256
   "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39")
  (:FILE "src/recovery/decisions-query.lisp" :SHA256
   "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24")
  (:FILE "src/recovery/decisions-radix.lisp" :SHA256
   "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54")
  (:FILE "src/recovery/decisions-sort.lisp" :SHA256
   "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2")
  (:FILE "src/recovery/decisions-types.lisp" :SHA256
   "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c")
  (:FILE "src/recovery/inventory-build.lisp" :SHA256
   "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e")
  (:FILE "src/recovery/inventory-query.lisp" :SHA256
   "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb")
  (:FILE "src/recovery/inventory-types.lisp" :SHA256
   "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9")
  (:FILE "src/recovery/manifest-build.lisp" :SHA256
   "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471")
  (:FILE "src/recovery/manifest-decode.lisp" :SHA256
   "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779")
  (:FILE "src/recovery/manifest-fold.lisp" :SHA256
   "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730")
  (:FILE "src/recovery/manifest-package.lisp" :SHA256
   "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc")
  (:FILE "src/recovery/manifest-query.lisp" :SHA256
   "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b")
  (:FILE "src/recovery/manifest-types.lisp" :SHA256
   "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10")
  (:FILE "src/recovery/package.lisp" :SHA256
   "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9")
  (:FILE "src/recovery/scan.lisp" :SHA256
   "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218")
  (:FILE "src/scheduler/build.lisp" :SHA256
   "58baf595f221826c64e3fb38344242c3bdf403d65904193bf1a8e06e09d7c336")
  (:FILE "src/scheduler/lifecycle-build.lisp" :SHA256
   "d6d67faf8721f26e7fcd228d6ab9a7dfdc36ff5ec56c67ed9e5fb6d914006a9e")
  (:FILE "src/scheduler/lifecycle-read.lisp" :SHA256
   "c60e1d5f67eeafb216b374fa001d27f87d1a734c5d066fc092902c0301069200")
  (:FILE "src/scheduler/lifecycle-types.lisp" :SHA256
   "4fe980e00f1d273e9b8278cd2daace6b4a9e4ab948ddfac83b79f4b0c537cb7c")
  (:FILE "src/scheduler/lifecycle-update.lisp" :SHA256
   "2020e46809e9fe8fa74e061a420b8085679d5f461eabd8b044f3975c1024800e")
  (:FILE "src/scheduler/lifecycle-worker.lisp" :SHA256
   "ec8b462ff3f5f7a6435f0f0c01b62034d8de2a784a9e354d469a0adfec9cf837")
  (:FILE "src/scheduler/package.lisp" :SHA256
   "5a139172de1648b30e09fdc6fc068141299c2034702f8d5b5f44bb0de14a3112")
  (:FILE "src/scheduler/policy.lisp" :SHA256
   "92b3ca3a81ae0b3ac342a63e5fe5c5d7524091a63065b0232c14c57ee80c4aac")
  (:FILE "src/scheduler/read.lisp" :SHA256
   "5cdc1e5b7ba97c9aab66a5acaf74336b0df33144e24104e0242b7fc2552a1ae2")
  (:FILE "src/scheduler/types.lisp" :SHA256
   "3b174be0919f8b27312ada4071d831c3753d62bb12be99d7e9394c48dcab474a")
  (:FILE "src/scheduler/update.lisp" :SHA256
   "e35a704ee0b9445c559a768de048169a8e39837a6df21843d8df58215c482472")
  (:FILE "src/series/events.lisp" :SHA256
   "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7")
  (:FILE "src/series/io-events.lisp" :SHA256
   "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546")
  (:FILE "src/series/ownership.lisp" :SHA256
   "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4")
  (:FILE "src/series/package.lisp" :SHA256
   "9a402f5225860c483dec9064a84d6462d28f5377a27977a63f64a5fbdbdd3764")
  (:FILE "src/series/publication.lisp" :SHA256
   "5de121c83ea6bd1243e420d9d898102aebb054cd1fa7ac79fcde9bf0792a95d8")
  (:FILE "src/series/query.lisp" :SHA256
   "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9")
  (:FILE "src/series/retirement.lisp" :SHA256
   "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059")
  (:FILE "src/series/routing-build.lisp" :SHA256
   "70135e73ecb1f6080683dd615c47a50530485061797382d74441743cd9a0f92d")
  (:FILE "src/series/routing-select.lisp" :SHA256
   "796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a")
  (:FILE "src/series/routing-types.lisp" :SHA256
   "31ae51c0fb11a802164a4d1e11ec63f835a2c67b52c751c5685bcc8947e5e0f1")
  (:FILE "src/series/types.lisp" :SHA256
   "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9")
  (:FILE "src/series/worker-boundary.lisp" :SHA256
   "793d401d1b9acc7b67923d815560f277f3d390ca050740f735f07d88dbacfe73")
  (:FILE "src/series/worker-package.lisp" :SHA256
   "dcab7a17e4fabcf256c2eddfb655d18145a1d789dd8d64a889945badc418e4b7")
  (:FILE "src/series/worker-run.lisp" :SHA256
   "f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f")
  (:FILE "src/series/worker-types.lisp" :SHA256
   "a366799fd9b938bfaa48b0ffda228ff8369ab9acb5b5ead7f081dfc66ab2c81a")
  (:FILE "src/storage/compaction-scan.lisp" :SHA256
   "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d")
  (:FILE "src/storage/control-payload.lisp" :SHA256
   "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491")
  (:FILE "src/storage/formats.lisp" :SHA256
   "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f")
  (:FILE "src/storage/log-header.lisp" :SHA256
   "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81")
  (:FILE "src/storage/package.lisp" :SHA256
   "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e")
  (:FILE "src/storage/payload-record.lisp" :SHA256
   "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7")
  (:FILE "src/storage/payload-write.lisp" :SHA256
   "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc")
  (:FILE "src/storage/segment-header.lisp" :SHA256
   "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011")
  (:FILE "src/wal/builder.lisp" :SHA256
   "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0")
  (:FILE "src/wal/csn.lisp" :SHA256
   "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810")
  (:FILE "src/wal/executor.lisp" :SHA256
   "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8")
  (:FILE "src/wal/group.lisp" :SHA256
   "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b")
  (:FILE "src/wal/package.lisp" :SHA256
   "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89")
  (:FILE "src/wal/types.lisp" :SHA256
   "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e")
  (:FILE "tests/codec/cbor-float-write-support.lisp" :SHA256
   "158f18dcf4b2d7e5562713caa3625aeba16dd1eba21f4413345e8a10b616c748")
  (:FILE "tests/codec/cbor-float-write-threads.lisp" :SHA256
   "96a1b205c01f75e271684132ff3e48b4da5cf8a01210257b591ec4951f097043")
  (:FILE "tests/codec/cbor-float-write.lisp" :SHA256
   "2d163a64bff4b9d9b9de576c4a4df05f4d8853f1c3d039e790cbb827be98c8b6")
  (:FILE "tests/codec/cbor-header.lisp" :SHA256
   "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815")
  (:FILE "tests/codec/cbor-minimal-edges.lisp" :SHA256
   "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70")
  (:FILE "tests/codec/cbor-minimal-scan-support.lisp" :SHA256
   "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421")
  (:FILE "tests/codec/cbor-minimal-scan-threads.lisp" :SHA256
   "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660")
  (:FILE "tests/codec/cbor-minimal-scan.lisp" :SHA256
   "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8")
  (:FILE "tests/codec/cbor-minimal-support.lisp" :SHA256
   "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a")
  (:FILE "tests/codec/cbor-minimal-threads.lisp" :SHA256
   "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2")
  (:FILE "tests/codec/cbor-minimal.lisp" :SHA256
   "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3")
  (:FILE "tests/codec/cbor-simple-write-support.lisp" :SHA256
   "53ceafc72a027a2ff1f787900558ff26f2ff70bbb212f1b37926a6d520fbe86e")
  (:FILE "tests/codec/cbor-simple-write-threads.lisp" :SHA256
   "77074033e75a224fd02e890f98dffa8e97d3a1f8bedd510b00ea55d8ff8687b2")
  (:FILE "tests/codec/cbor-simple-write.lisp" :SHA256
   "958bdd3901cfc41032c09d6c9023b192799981884e09ce3573256ff45bc5329a")
  (:FILE "tests/codec/cbor-string-write-support.lisp" :SHA256
   "2cbdb601f442a56456bc637c94e759cc965f44b178268dce3c636c385d34fc39")
  (:FILE "tests/codec/cbor-string-write-threads.lisp" :SHA256
   "8e07b881a55e2554a429f1c8b2c69f67862ac015217d90d019167d636564d27d")
  (:FILE "tests/codec/cbor-string-write.lisp" :SHA256
   "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115")
  (:FILE "tests/codec/cbor-structure-support.lisp" :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:FILE "tests/codec/cbor-structure-threads.lisp" :SHA256
   "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645")
  (:FILE "tests/codec/cbor-structure.lisp" :SHA256
   "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110")
  (:FILE "tests/codec/cbor-support.lisp" :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:FILE "tests/codec/cbor-threads.lisp" :SHA256
   "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14")
  (:FILE "tests/codec/cbor-write-roundtrip.lisp" :SHA256
   "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344")
  (:FILE "tests/codec/cbor-write-support.lisp" :SHA256
   "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6")
  (:FILE "tests/codec/cbor-write-threads.lisp" :SHA256
   "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb")
  (:FILE "tests/codec/cbor-write.lisp" :SHA256
   "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3")
  (:FILE "tests/codec/support.lisp" :SHA256
   "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96")
  (:FILE "tests/codec/threads.lisp" :SHA256
   "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337")
  (:FILE "tests/codec/utf8.lisp" :SHA256
   "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100")
  (:FILE "tests/csn/registry.lisp" :SHA256
   "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950")
  (:FILE "tests/csn/support.lisp" :SHA256
   "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db")
  (:FILE "tests/csn/threads.lisp" :SHA256
   "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2")
  (:FILE "tests/epochs/lifecycle.lisp" :SHA256
   "ddc2fbdad9f97d2e4ff008c167776a50b17b742398306fbd5198dca474559cbf")
  (:FILE "tests/epochs/support.lisp" :SHA256
   "366be7af4bf6c4ed946b3fa9e97aea6b034c83e3b757d81c54078dc76d229b6d")
  (:FILE "tests/epochs/threads.lisp" :SHA256
   "54b73e06c61e64f32a3e3af0791891dacb6590e929163dcf0fac95f2c71e66fd")
  (:FILE "tests/execution/handoff.lisp" :SHA256
   "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e")
  (:FILE "tests/execution/queue.lisp" :SHA256
   "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722")
  (:FILE "tests/execution/ready-recycle.lisp" :SHA256
   "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae")
  (:FILE "tests/execution/ready.lisp" :SHA256
   "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e")
  (:FILE "tests/execution/support.lisp" :SHA256
   "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43")
  (:FILE "tests/execution/threads.lisp" :SHA256
   "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359")
  (:FILE "tests/execution/worker.lisp" :SHA256
   "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06")
  (:FILE "tests/foundation/batch.lisp" :SHA256
   "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183")
  (:FILE "tests/foundation/binary.lisp" :SHA256
   "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe")
  (:FILE "tests/foundation/record.lisp" :SHA256
   "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8")
  (:FILE "tests/foundation/support.lisp" :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:FILE "tests/get-directory/construction.lisp" :SHA256
   "4ce9aa7064793e908008b9e1055c1e2527d5071006782ea956509c28e8c712d7")
  (:FILE "tests/get-directory/read.lisp" :SHA256
   "a222541b6413bb93ff86a269273f1fa15bfad0d1e4072fc058b023fec5143280")
  (:FILE "tests/get-directory/series-read.lisp" :SHA256
   "4b9856d69cd82c1462c87d16b9eb8e00fb642a46bb22f2f7b01865f7cc2a83a4")
  (:FILE "tests/get-directory/series-support.lisp" :SHA256
   "40f15fbdf42b80515cbfc57eb74bedcbd96d4a9e7e19dc25d8db59f326fe659a")
  (:FILE "tests/get-directory/support.lisp" :SHA256
   "be3a216a6ec597b63186b6bf3d3e35f3327f3001b1c00535d64b10bcb5d9fe85")
  (:FILE "tests/get-directory/threads.lisp" :SHA256
   "e6a93ec22bc6f5a31b37ae99d927d1ca3a53893adb2eae21cd89d132a82d1f64")
  (:FILE "tests/get-performance/guards.lisp" :SHA256
   "c41721b917ed443355ea3707efdd07e7da53a978c0515ab1e5ede5fcc47d63fc")
  (:FILE "tests/get-performance/paths.lisp" :SHA256
   "3b8d2c9c93467507ea2bb471d42192eb1fa084b55c0f4263b5ef0d3acf468f55")
  (:FILE "tests/get-performance/support.lisp" :SHA256
   "e586ed94dcb2aaba00282931cdd83313e4f84a86d4d1ba85e2d56e8b7433ed8d")
  (:FILE "tests/get-performance/threads.lisp" :SHA256
   "05ace5eb351ab49da59611dc1a2a5abedb9d723a2fc6e75a30fc76e507573a90")
  (:FILE "tests/get-resolver/construction.lisp" :SHA256
   "45cbef3b35db35d60a4cec2516c24f6ef56f5edb2f19f6f07f24fe00c8737b13")
  (:FILE "tests/get-resolver/read.lisp" :SHA256
   "70e46d1b88716f44309f46b4955928ca7fa2195edd80bb67d5b97732b971e8fb")
  (:FILE "tests/get-resolver/sort.lisp" :SHA256
   "fd7f97f0fad2e970b972688481c0c132f11c85f5fdcd0f02bee6b0b3f93b97ae")
  (:FILE "tests/get-resolver/support.lisp" :SHA256
   "d30a5c8a61b63e339facfee9f7701eb5a3614bbfd1ebef2c46c747d136640f8b")
  (:FILE "tests/get/lifecycle.lisp" :SHA256
   "73bf87c2aee7b537dba31fc0ae554272f7d2be5a4c1e9e96ea2f21a17f6f71f5")
  (:FILE "tests/get/segment.lisp" :SHA256
   "e9722f419ce0810c98c28d0e1a74da85d52346a0befff40c1119934519fc6f98")
  (:FILE "tests/get/support.lisp" :SHA256
   "21f0da34755882f7dcc3ee760528ca39d4731e1a79ea94525c62753b7f60422c")
  (:FILE "tests/hash/guards.lisp" :SHA256
   "9af5b38443a57d224990a68e93f12f7a4cda306f94c7ccd3ccb50635865d7864")
  (:FILE "tests/hash/hash64.lisp" :SHA256
   "70606bc68807143cfea9583871474c84efc868d13692cde28488284dee43e0f1")
  (:FILE "tests/hash/support.lisp" :SHA256
   "0fae9dc36976af544f83e6051b9cf9d67c9bef0b9e25f1fa2a48fdac48592acb")
  (:FILE "tests/hash/threads.lisp" :SHA256
   "3fc587a57d26a294aebfc6a7aeadf2f61a42a21106c1c57517f891b76b4e750a")
  (:FILE "tests/index/hash-digests.lisp" :SHA256
   "3b3b39f861883cf2017cab8e6488560a6bb3897d63784f00e820a6450d743225")
  (:FILE "tests/index/primary-support.lisp" :SHA256
   "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a")
  (:FILE "tests/index/primary-threads.lisp" :SHA256
   "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2")
  (:FILE "tests/index/primary.lisp" :SHA256
   "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696")
  (:FILE "tests/index/rebuild.lisp" :SHA256
   "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1")
  (:FILE "tests/index/slot-support.lisp" :SHA256
   "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31")
  (:FILE "tests/index/slot-threads.lisp" :SHA256
   "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f")
  (:FILE "tests/index/slots.lisp" :SHA256
   "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb")
  (:FILE "tests/io/native.lisp" :SHA256
   "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0")
  (:FILE "tests/io/support.lisp" :SHA256
   "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50")
  (:FILE "tests/io/transfer.lisp" :SHA256
   "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd")
  (:FILE "tests/lint-fixtures/bad.lisp" :SHA256
   "ac8912ce6cc1101f2ebc305a50c0565879547b527d7ca0aeac900ee06bf26652")
  (:FILE "tests/lint-fixtures/good.lisp" :SHA256
   "05ce84f8fd12d9af48252601bcc92d6d60335b53f39b01a9fe2697c4bdaa8cee")
  (:FILE "tests/lint-fixtures/keyword-barrier.lisp" :SHA256
   "e26dab117e9526ace35bb45b92f977065d33fcc4404c40fd4fc3c77749689a96")
  (:FILE "tests/lint-fixtures/qualified-reader.lisp" :SHA256
   "835229bdc1a0ed0c08511cd6121e1f1bc4284da2cfba951b72cd1a74a6040d35")
  (:FILE "tests/mvcc/capture.lisp" :SHA256
   "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35")
  (:FILE "tests/mvcc/lifecycle.lisp" :SHA256
   "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16")
  (:FILE "tests/mvcc/support.lisp" :SHA256
   "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290")
  (:FILE "tests/read/lifecycle.lisp" :SHA256
   "c4c4642408816f2e0e809e21d04739b68b9391237e3e46ea0b195ed82857c3a8")
  (:FILE "tests/read/support.lisp" :SHA256
   "8095cc39d49342f6e43f3421b4fced839da02d8d11b4d8ddcd91bd346447e754")
  (:FILE "tests/read/threads.lisp" :SHA256
   "e2e223b69b08a5d76b9773c6ad4dee13ef2ddbb6f5ababa713cc5654bc7b51c5")
  (:FILE "tests/recovery/corruption.lisp" :SHA256
   "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c")
  (:FILE "tests/recovery/decisions-audit.lisp" :SHA256
   "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0")
  (:FILE "tests/recovery/decisions-radix.lisp" :SHA256
   "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0")
  (:FILE "tests/recovery/decisions-support.lisp" :SHA256
   "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4")
  (:FILE "tests/recovery/decisions.lisp" :SHA256
   "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e")
  (:FILE "tests/recovery/inventory-support.lisp" :SHA256
   "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27")
  (:FILE "tests/recovery/inventory.lisp" :SHA256
   "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9")
  (:FILE "tests/recovery/manifest-audit.lisp" :SHA256
   "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6")
  (:FILE "tests/recovery/manifest-support.lisp" :SHA256
   "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830")
  (:FILE "tests/recovery/manifest.lisp" :SHA256
   "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd")
  (:FILE "tests/recovery/scan.lisp" :SHA256
   "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b")
  (:FILE "tests/recovery/support.lisp" :SHA256
   "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204")
  (:FILE "tests/scheduler/controller.lisp" :SHA256
   "e986e3facc9d1b9b4eab0d135259a61d7e0f188a7f268cb2e5ee5f9c700c40be")
  (:FILE "tests/scheduler/lifecycle.lisp" :SHA256
   "eff59c0cf6d9c6c1ddec57a4efa26a8fcaeedc850b77764b818bc1c22eb73e38")
  (:FILE "tests/scheduler/support.lisp" :SHA256
   "300234f9ac7931f8c8b9bf305498a2742a3b8868dd9158dbab8c7fdceed5a1e4")
  (:FILE "tests/series/boundaries.lisp" :SHA256
   "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8")
  (:FILE "tests/series/controller.lisp" :SHA256
   "8bc98ec62e58803cab5613210e1200e0ce296af9aff63b5dff61579c3931670a")
  (:FILE "tests/series/support.lisp" :SHA256
   "810dd8a69927c75e3399af47b8fff18e4ab88eb41049c50bafee5c041be263b3")
  (:FILE "tests/series/threads.lisp" :SHA256
   "b8fe9d7e1c0ca4e18909a0a6f7ac03c8df68dd186fa21e62600be685d6e4c7ae")
  (:FILE "tests/series/worker-bridge.lisp" :SHA256
   "c1ee49702e63978a83cb86c4e5bf437a5a40e48fa02b65d3eaf3dca0d2e39176")
  (:FILE "tests/series/worker-routing.lisp" :SHA256
   "f495d33f73e3249d1055ea61d65034033367de85edec3db2cac3a63ff449e3f9")
  (:FILE "tests/smoke.lisp" :SHA256
   "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8")
  (:FILE "tests/storage/compaction-scan.lisp" :SHA256
   "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5")
  (:FILE "tests/storage/control-payload.lisp" :SHA256
   "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae")
  (:FILE "tests/storage/log-header.lisp" :SHA256
   "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e")
  (:FILE "tests/storage/segment-header.lisp" :SHA256
   "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df")
  (:FILE "tests/storage/support.lisp" :SHA256
   "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625")
  (:FILE "tests/wal/builder.lisp" :SHA256
   "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6")
  (:FILE "tests/wal/csn-threads.lisp" :SHA256
   "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c")
  (:FILE "tests/wal/csn.lisp" :SHA256
   "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a")
  (:FILE "tests/wal/fault.lisp" :SHA256
   "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875")
  (:FILE "tests/wal/group.lisp" :SHA256
   "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e")
  (:FILE "tests/wal/native.lisp" :SHA256
   "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7")
  (:FILE "tests/wal/support.lisp" :SHA256
   "90a47539e5e2898c0a08059207f30bb5551e7ca8fc166f8f6ce7b95afa757295")
  (:FILE "tools/get-active-init-mutation.lisp" :SHA256
   "1768a06137f021e83e0be65821b13af80ac96f0ddcdd86659660522f40fda716")
  (:FILE "tools/evidence-storage.lisp" :SHA256
   "8f287772a41b1ebe0e7b3ecc3826a4148082efed428a9749655977e62a9c15a6"))
 :CHANGED-PATHS NIL :CONFIG-SHA256
 "718d1db906b694f023c48f4e4a81e687d878d86096b2d784394aabb8d0527dff"
 :CONFIG-SHA256-AFTER
 "718d1db906b694f023c48f4e4a81e687d878d86096b2d784394aabb8d0527dff"
 :ARTIFACTS-VERIFIED T :CHILD-REPORT
 (:FINISHED-AT-UNIVERSAL-TIME 4000914639 :CONFIG-SHA256-AFTER
  "718d1db906b694f023c48f4e4a81e687d878d86096b2d784394aabb8d0527dff"
  :SCHEMA-VERSION 1 :KIND :GET-ACTIVE-INIT-MUTATION-CHILD :STATUS :OK :PHASE
  :COMPLETE :COMPILED T :SUITE-COMPILED T :COMPILED-FILES
  ((:FILE "tests/wal/support.lisp" :SOURCE-SHA256
    "90a47539e5e2898c0a08059207f30bb5551e7ca8fc166f8f6ce7b95afa757295" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/wal/support.fasl"
    :FASL-SHA256
    "dac89dac731a0a911b3c597b26ec11aacabb41eb934aceb8b8cec29b3a61e0b8")
   (:FILE "tests/wal/native.lisp" :SOURCE-SHA256
    "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/wal/native.fasl"
    :FASL-SHA256
    "8201d68fbae104612e6bb34c9f6cfc55a026635feb661d5f7638a50038ba468f")
   (:FILE "tests/wal/group.lisp" :SOURCE-SHA256
    "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/wal/group.fasl"
    :FASL-SHA256
    "131f01baf451010f4e7af99c6c75315662e28ccddff2fb566014c04c4b7e19ab")
   (:FILE "tests/wal/fault.lisp" :SOURCE-SHA256
    "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/wal/fault.fasl"
    :FASL-SHA256
    "7ee2aa14935c9bb23e28e51a744a1efa997d3ed5ccccc900d60ae29b51c32a48")
   (:FILE "tests/wal/csn.lisp" :SOURCE-SHA256
    "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/wal/csn.fasl"
    :FASL-SHA256
    "d3a1d20209f68060de73dc9b4a9b1a2bf3a24b6fae283c6388f4aef8a87c9752")
   (:FILE "tests/wal/csn-threads.lisp" :SOURCE-SHA256
    "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/wal/csn-threads.fasl"
    :FASL-SHA256
    "8542cdd14e7e25fd2db4501454a50b05fd41ba747bb29d6db6e367bb661988cb")
   (:FILE "tests/wal/builder.lisp" :SOURCE-SHA256
    "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/wal/builder.fasl"
    :FASL-SHA256
    "e02a3c80b702d31349c6e7dfe4ceee8a72aa78b285a215cb9030efa50945080a")
   (:FILE "tests/storage/support.lisp" :SOURCE-SHA256
    "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/storage/support.fasl"
    :FASL-SHA256
    "651e4e8e8d83038a42d17d2a9d041e2f4291fb3d343f75b51a3d760188ad6d7e")
   (:FILE "tests/storage/segment-header.lisp" :SOURCE-SHA256
    "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/storage/segment-header.fasl"
    :FASL-SHA256
    "829b17ecc0283dda0b9b5232c364f194512698560e62b99c8efce931b2759e42")
   (:FILE "tests/storage/log-header.lisp" :SOURCE-SHA256
    "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/storage/log-header.fasl"
    :FASL-SHA256
    "f62460909d2282c3d53f43239e861354320c13a8e6e569f876380f421b38ea53")
   (:FILE "tests/storage/control-payload.lisp" :SOURCE-SHA256
    "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/storage/control-payload.fasl"
    :FASL-SHA256
    "05c429bfe54de1bb87ad403e5028940235e3cd2882762c85b8313852d9afc6a2")
   (:FILE "tests/storage/compaction-scan.lisp" :SOURCE-SHA256
    "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/storage/compaction-scan.fasl"
    :FASL-SHA256
    "30af76cc8a0c5411b34fc8468284e0fcd49496f83fee173641d46051ebff126a")
   (:FILE "tests/smoke.lisp" :SOURCE-SHA256
    "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/smoke.fasl"
    :FASL-SHA256
    "5b4af18c0ec9c5a87b622a0733d2f03e7b20ccec36e444f593df823080804df3")
   (:FILE "tests/series/worker-routing.lisp" :SOURCE-SHA256
    "f495d33f73e3249d1055ea61d65034033367de85edec3db2cac3a63ff449e3f9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/series/worker-routing.fasl"
    :FASL-SHA256
    "8f01d310a1b34a93ae65a988ec80c14cee1f9973ab01e4343e26fbc25840549e")
   (:FILE "tests/series/worker-bridge.lisp" :SOURCE-SHA256
    "c1ee49702e63978a83cb86c4e5bf437a5a40e48fa02b65d3eaf3dca0d2e39176" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/series/worker-bridge.fasl"
    :FASL-SHA256
    "730b9b355cd419f761249f937c747d05f6c0b51c772fa06954d1c06395740ca2")
   (:FILE "tests/series/threads.lisp" :SOURCE-SHA256
    "b8fe9d7e1c0ca4e18909a0a6f7ac03c8df68dd186fa21e62600be685d6e4c7ae" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/series/threads.fasl"
    :FASL-SHA256
    "7392280ace57b15eca6aa3c3cd6aeab6322579e8869da70a6f413165ecba54e0")
   (:FILE "tests/series/support.lisp" :SOURCE-SHA256
    "810dd8a69927c75e3399af47b8fff18e4ab88eb41049c50bafee5c041be263b3" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/series/support.fasl"
    :FASL-SHA256
    "3aafb4731376f0f7717aa4eb9cae3569e47c041c06696aaf2a1a56fcb9114cb5")
   (:FILE "tests/series/controller.lisp" :SOURCE-SHA256
    "8bc98ec62e58803cab5613210e1200e0ce296af9aff63b5dff61579c3931670a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/series/controller.fasl"
    :FASL-SHA256
    "1f906de332dc374b2c7c1f9c56acd124a769cb1b0d3486269155cb0375635b12")
   (:FILE "tests/series/boundaries.lisp" :SOURCE-SHA256
    "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/series/boundaries.fasl"
    :FASL-SHA256
    "c342fefe797976ea8052de7e2bf54b08f219411263d6d2783faa590d01709243")
   (:FILE "tests/scheduler/support.lisp" :SOURCE-SHA256
    "300234f9ac7931f8c8b9bf305498a2742a3b8868dd9158dbab8c7fdceed5a1e4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/scheduler/support.fasl"
    :FASL-SHA256
    "d49ba35dcb8448b47c3e37baa4d563054f572bc9124321ad1cd2d9e4d9f16970")
   (:FILE "tests/scheduler/lifecycle.lisp" :SOURCE-SHA256
    "eff59c0cf6d9c6c1ddec57a4efa26a8fcaeedc850b77764b818bc1c22eb73e38" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/scheduler/lifecycle.fasl"
    :FASL-SHA256
    "f29474ea8297870919186bb85f24546d2c8a0c3db5bccab9d2fa8a1860a0d10c")
   (:FILE "tests/scheduler/controller.lisp" :SOURCE-SHA256
    "e986e3facc9d1b9b4eab0d135259a61d7e0f188a7f268cb2e5ee5f9c700c40be" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/scheduler/controller.fasl"
    :FASL-SHA256
    "51ae353f0aece2a3db908abfa79a229b9f750e4f02026af2418322b221c74e83")
   (:FILE "tests/recovery/support.lisp" :SOURCE-SHA256
    "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/recovery/support.fasl"
    :FASL-SHA256
    "e5789c8bc351a4d9a6502b8c696d8fac0e58f83be0e651833d071fa3d2d09513")
   (:FILE "tests/recovery/scan.lisp" :SOURCE-SHA256
    "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/recovery/scan.fasl"
    :FASL-SHA256
    "e03dcb446ad4f3fa5e789fd3dcbaeeb169a3f71a56b19f5467d56e32a0acb41b")
   (:FILE "tests/recovery/manifest.lisp" :SOURCE-SHA256
    "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/recovery/manifest.fasl"
    :FASL-SHA256
    "6feae44dcf29029e048f801be3b8c215d3b85121c29cdfcb1c5a3986ff45bc0e")
   (:FILE "tests/recovery/manifest-support.lisp" :SOURCE-SHA256
    "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/recovery/manifest-support.fasl"
    :FASL-SHA256
    "41ff112cffe3e29eca003f6ab1e4c14bfd3cdf2896ac09982c2c05c28d4c07bc")
   (:FILE "tests/recovery/manifest-audit.lisp" :SOURCE-SHA256
    "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/recovery/manifest-audit.fasl"
    :FASL-SHA256
    "49ac0c12b91d12631d54e870029705d71be6c883b9277e32fe18c33bfc349f9b")
   (:FILE "tests/recovery/inventory.lisp" :SOURCE-SHA256
    "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/recovery/inventory.fasl"
    :FASL-SHA256
    "a642842947d8114d3b4b3fd2fba271bd9a852f2a36eccd60a7848b3bad49196f")
   (:FILE "tests/recovery/inventory-support.lisp" :SOURCE-SHA256
    "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/recovery/inventory-support.fasl"
    :FASL-SHA256
    "836a222db9074393b04c192adc758a56db7a303d2edc1e4b492e0a06fe1eb521")
   (:FILE "tests/recovery/decisions.lisp" :SOURCE-SHA256
    "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/recovery/decisions.fasl"
    :FASL-SHA256
    "751a2bc6f7c94b41a19877ca6128bc28d2c44adfb1ca7a0aee1f606863aa7c23")
   (:FILE "tests/recovery/decisions-support.lisp" :SOURCE-SHA256
    "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/recovery/decisions-support.fasl"
    :FASL-SHA256
    "36cf15903ffda4c9f7490be64532db9536f0bf849c2b94f7075217486627d8f9")
   (:FILE "tests/recovery/decisions-radix.lisp" :SOURCE-SHA256
    "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/recovery/decisions-radix.fasl"
    :FASL-SHA256
    "1568ebdd8b1c8d651fab559646f2e83ca39f4da7262fe0da22b14625d4be31f8")
   (:FILE "tests/recovery/decisions-audit.lisp" :SOURCE-SHA256
    "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/recovery/decisions-audit.fasl"
    :FASL-SHA256
    "365d9a5650d4955c04b98042f1134cc038b699450b952fdd062a721fb127df11")
   (:FILE "tests/recovery/corruption.lisp" :SOURCE-SHA256
    "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/recovery/corruption.fasl"
    :FASL-SHA256
    "e64b78b935055ecc044440b0f7b3aa143423c4f73971d49e6b2f9cdbb0763ef9")
   (:FILE "tests/read/threads.lisp" :SOURCE-SHA256
    "e2e223b69b08a5d76b9773c6ad4dee13ef2ddbb6f5ababa713cc5654bc7b51c5" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/read/threads.fasl"
    :FASL-SHA256
    "7576cd66fc36cf867cdce8ab17eb5140cb7cfe79a041afccc9931a885df5c702")
   (:FILE "tests/read/support.lisp" :SOURCE-SHA256
    "8095cc39d49342f6e43f3421b4fced839da02d8d11b4d8ddcd91bd346447e754" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/read/support.fasl"
    :FASL-SHA256
    "b4069faf35bd5990e5ded8fdfda87cc418b0483862b975a7089f2596093f2bfc")
   (:FILE "tests/read/lifecycle.lisp" :SOURCE-SHA256
    "c4c4642408816f2e0e809e21d04739b68b9391237e3e46ea0b195ed82857c3a8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/read/lifecycle.fasl"
    :FASL-SHA256
    "be78ccaa4262fb7b80e4999281c6134f937030c8c4b79a9b1739289731f66eee")
   (:FILE "tests/mvcc/support.lisp" :SOURCE-SHA256
    "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/mvcc/support.fasl"
    :FASL-SHA256
    "4a76eec9ce157e56427036e9d7dcbf03bda04f88520f62678c8131ca28590855")
   (:FILE "tests/mvcc/lifecycle.lisp" :SOURCE-SHA256
    "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/mvcc/lifecycle.fasl"
    :FASL-SHA256
    "a365f46a42f5133f0473a36817dcdec94ad6e7c35cedc9e5996f8275d160b4ed")
   (:FILE "tests/mvcc/capture.lisp" :SOURCE-SHA256
    "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/mvcc/capture.fasl"
    :FASL-SHA256
    "58775d58fcce301bd770ef38e407d1cb41e4a09158841016246b168f53ea44df")
   (:FILE "tests/io/transfer.lisp" :SOURCE-SHA256
    "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/io/transfer.fasl"
    :FASL-SHA256
    "c5198142ddb79b9c43a23158e52cfb98b689999245b6b6626a84dae3157ba53c")
   (:FILE "tests/io/support.lisp" :SOURCE-SHA256
    "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/io/support.fasl"
    :FASL-SHA256
    "444b2f1a46cc1eb4138fd6983077afd4cb0696570f89e767410a9ca67e182935")
   (:FILE "tests/io/native.lisp" :SOURCE-SHA256
    "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/io/native.fasl"
    :FASL-SHA256
    "2ddb2b25bb613882263df7b99d6f2b1a9d31e7db877e7a6823b18377b4a9663b")
   (:FILE "tests/index/slots.lisp" :SOURCE-SHA256
    "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/index/slots.fasl"
    :FASL-SHA256
    "8fb325a508d9abf9c715ce2e22738dfb88461077f489a8a1fd01b7c6a583c5ab")
   (:FILE "tests/index/slot-threads.lisp" :SOURCE-SHA256
    "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/index/slot-threads.fasl"
    :FASL-SHA256
    "5914c8e3716f76c81ac53b5178a73c3f90a7dbeda6c0d065f0d2fcdf72b4ae59")
   (:FILE "tests/index/slot-support.lisp" :SOURCE-SHA256
    "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/index/slot-support.fasl"
    :FASL-SHA256
    "b73db0dab8ae1d2eebb6369b73d3bd73bfdef4eea99b43acc34536f990304258")
   (:FILE "tests/index/rebuild.lisp" :SOURCE-SHA256
    "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/index/rebuild.fasl"
    :FASL-SHA256
    "ef27b0923d5c069755ffa72d761dfe40a85c332449a910fb05825ad241f7d117")
   (:FILE "tests/index/primary.lisp" :SOURCE-SHA256
    "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/index/primary.fasl"
    :FASL-SHA256
    "748827cab59f8d8baeff428762875d4709260d7308a2f89bac65af4db1604815")
   (:FILE "tests/index/primary-threads.lisp" :SOURCE-SHA256
    "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/index/primary-threads.fasl"
    :FASL-SHA256
    "d39833f5ce4eff6f52207b78fa77ae7e14e9c992f21cf0f0f0ed75d14c204b43")
   (:FILE "tests/index/primary-support.lisp" :SOURCE-SHA256
    "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/index/primary-support.fasl"
    :FASL-SHA256
    "6ee93e036ad4c6ca12b9f8ac8a0e6f0efe507900a20ad84ad41b00ae0e8d3fb7")
   (:FILE "tests/index/hash-digests.lisp" :SOURCE-SHA256
    "3b3b39f861883cf2017cab8e6488560a6bb3897d63784f00e820a6450d743225" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/index/hash-digests.fasl"
    :FASL-SHA256
    "a6dfa762db517d271992d7fd92072926f8b107b9f3f42c6c0be644be7326bb88")
   (:FILE "tests/hash/threads.lisp" :SOURCE-SHA256
    "3fc587a57d26a294aebfc6a7aeadf2f61a42a21106c1c57517f891b76b4e750a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/hash/threads.fasl"
    :FASL-SHA256
    "9ac25d7f013ca67b1a8a1016442dcbbfefeb12f0aa9db2107475e60a4fa3c0d1")
   (:FILE "tests/hash/support.lisp" :SOURCE-SHA256
    "0fae9dc36976af544f83e6051b9cf9d67c9bef0b9e25f1fa2a48fdac48592acb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/hash/support.fasl"
    :FASL-SHA256
    "30f8f1b268d4b6a36cc20bce6fa8bc1192a8b4c0fe981fd36be98bcd69a339a5")
   (:FILE "tests/hash/hash64.lisp" :SOURCE-SHA256
    "70606bc68807143cfea9583871474c84efc868d13692cde28488284dee43e0f1" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/hash/hash64.fasl"
    :FASL-SHA256
    "d8b014fb791f6daf764c98a82f6d9e2a69d3491eddcb996620d90919434daf22")
   (:FILE "tests/hash/guards.lisp" :SOURCE-SHA256
    "9af5b38443a57d224990a68e93f12f7a4cda306f94c7ccd3ccb50635865d7864" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/hash/guards.fasl"
    :FASL-SHA256
    "26aa5ac82c9c8713c4b74d8769c63e2464c56364982113d9a55475c48f842039")
   (:FILE "tests/get/support.lisp" :SOURCE-SHA256
    "21f0da34755882f7dcc3ee760528ca39d4731e1a79ea94525c62753b7f60422c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/get/support.fasl"
    :FASL-SHA256
    "e47b587e48f7cfcf4127d35b74d68213c4210c06d9b6e5f6baa90c527bf340e6")
   (:FILE "tests/get/segment.lisp" :SOURCE-SHA256
    "e9722f419ce0810c98c28d0e1a74da85d52346a0befff40c1119934519fc6f98" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/get/segment.fasl"
    :FASL-SHA256
    "cba2a86826250fb1d8d17cd37ced0ed7c145177ff03d4a86bce9093c564cc127")
   (:FILE "tests/get/lifecycle.lisp" :SOURCE-SHA256
    "73bf87c2aee7b537dba31fc0ae554272f7d2be5a4c1e9e96ea2f21a17f6f71f5" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/get/lifecycle.fasl"
    :FASL-SHA256
    "4928a188dcddb35ebc3002bf84a2204535603b85f98e02193b671b24657c575e")
   (:FILE "tests/get-resolver/support.lisp" :SOURCE-SHA256
    "d30a5c8a61b63e339facfee9f7701eb5a3614bbfd1ebef2c46c747d136640f8b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/get-resolver/support.fasl"
    :FASL-SHA256
    "06ab2eda5cd4611289cd5282e313c674e88d377878e9d964b39fa3d51b05daf7")
   (:FILE "tests/get-resolver/sort.lisp" :SOURCE-SHA256
    "fd7f97f0fad2e970b972688481c0c132f11c85f5fdcd0f02bee6b0b3f93b97ae" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/get-resolver/sort.fasl"
    :FASL-SHA256
    "2e9c5c4603cbc24d497487cf74656a2d6d50e3910020f19a9189cbf987480efb")
   (:FILE "tests/get-resolver/read.lisp" :SOURCE-SHA256
    "70e46d1b88716f44309f46b4955928ca7fa2195edd80bb67d5b97732b971e8fb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/get-resolver/read.fasl"
    :FASL-SHA256
    "7e0a73cfc44fadbbc30352a80b5f2e1ba39c946d4c6259e19f2a8749e4fe7103")
   (:FILE "tests/get-resolver/construction.lisp" :SOURCE-SHA256
    "45cbef3b35db35d60a4cec2516c24f6ef56f5edb2f19f6f07f24fe00c8737b13" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/get-resolver/construction.fasl"
    :FASL-SHA256
    "560cdfe1e89375e6d8f64c2f1c120595a17ba892c9cc75c7530e09b5fec7e798")
   (:FILE "tests/get-performance/threads.lisp" :SOURCE-SHA256
    "05ace5eb351ab49da59611dc1a2a5abedb9d723a2fc6e75a30fc76e507573a90" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/get-performance/threads.fasl"
    :FASL-SHA256
    "01b3231357e31bcd98e3e33f169ef418d5888c4d6c1d7b447e5d35b95e50b1d6")
   (:FILE "tests/get-performance/support.lisp" :SOURCE-SHA256
    "e586ed94dcb2aaba00282931cdd83313e4f84a86d4d1ba85e2d56e8b7433ed8d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/get-performance/support.fasl"
    :FASL-SHA256
    "f7d4e80558094fd56d9cd8cbef2956943848dc8cfdbba2637ba2b14f096efddb")
   (:FILE "tests/get-performance/paths.lisp" :SOURCE-SHA256
    "3b8d2c9c93467507ea2bb471d42192eb1fa084b55c0f4263b5ef0d3acf468f55" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/get-performance/paths.fasl"
    :FASL-SHA256
    "24f6dfc335b0ccd811a9d961c463448e9bd5e6fae02d213800770558512ad197")
   (:FILE "tests/get-performance/guards.lisp" :SOURCE-SHA256
    "c41721b917ed443355ea3707efdd07e7da53a978c0515ab1e5ede5fcc47d63fc" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/get-performance/guards.fasl"
    :FASL-SHA256
    "040e4a783c9270837c29dd0b214c6811423e889b1e2acc149fd7b1d21c849671")
   (:FILE "tests/get-directory/threads.lisp" :SOURCE-SHA256
    "e6a93ec22bc6f5a31b37ae99d927d1ca3a53893adb2eae21cd89d132a82d1f64" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/get-directory/threads.fasl"
    :FASL-SHA256
    "d67b35a1b06be6ec3325a9d7b7426a42f542b86b18d56a1627abf8dc4aaa8ae5")
   (:FILE "tests/get-directory/support.lisp" :SOURCE-SHA256
    "be3a216a6ec597b63186b6bf3d3e35f3327f3001b1c00535d64b10bcb5d9fe85" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/get-directory/support.fasl"
    :FASL-SHA256
    "b459e81470a9913111b7eb8d4f5c47db4a64e2b81064fef2daa885aa4a6745dc")
   (:FILE "tests/get-directory/series-support.lisp" :SOURCE-SHA256
    "40f15fbdf42b80515cbfc57eb74bedcbd96d4a9e7e19dc25d8db59f326fe659a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/get-directory/series-support.fasl"
    :FASL-SHA256
    "0cad2d84492942954f8ddc98905964aa1a65111e7c3d52c7f0f56d43955757b1")
   (:FILE "tests/get-directory/series-read.lisp" :SOURCE-SHA256
    "4b9856d69cd82c1462c87d16b9eb8e00fb642a46bb22f2f7b01865f7cc2a83a4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/get-directory/series-read.fasl"
    :FASL-SHA256
    "8d828f77b10a1a1cbabace52e9692dd21db231c80db3fa30f6742d4fcd25a728")
   (:FILE "tests/get-directory/read.lisp" :SOURCE-SHA256
    "a222541b6413bb93ff86a269273f1fa15bfad0d1e4072fc058b023fec5143280" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/get-directory/read.fasl"
    :FASL-SHA256
    "761042684ea44860d2158ac1da1c038e9c13ae1854b91beec40c31d9e70cd15f")
   (:FILE "tests/get-directory/construction.lisp" :SOURCE-SHA256
    "4ce9aa7064793e908008b9e1055c1e2527d5071006782ea956509c28e8c712d7" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/get-directory/construction.fasl"
    :FASL-SHA256
    "6abf88840b68e69afb2a59e1bcbb3806d1063b9362aeaf93ffa9d2688a3e59d8")
   (:FILE "tests/foundation/support.lisp" :SOURCE-SHA256
    "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/foundation/support.fasl"
    :FASL-SHA256
    "6d13e1f1ecbb08d11e968ce551b449af0b7f2ba49be7f86d488bfbcff77c1b9c")
   (:FILE "tests/foundation/record.lisp" :SOURCE-SHA256
    "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/foundation/record.fasl"
    :FASL-SHA256
    "1ce680f01a900c4ed68032066f6338153d357ae79e97ce0c1bcbdfd4959bc5f0")
   (:FILE "tests/foundation/binary.lisp" :SOURCE-SHA256
    "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/foundation/binary.fasl"
    :FASL-SHA256
    "13388e6c57018ffd87c1f0aee0ecd48241e3ffba106fe22c06f1719e403fec05")
   (:FILE "tests/foundation/batch.lisp" :SOURCE-SHA256
    "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/foundation/batch.fasl"
    :FASL-SHA256
    "b158b5be2d3e7af6db632ed61763b2597168992052b06825c60c25de2de2ca18")
   (:FILE "tests/execution/worker.lisp" :SOURCE-SHA256
    "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/execution/worker.fasl"
    :FASL-SHA256
    "c9d38dcbe2c6bde8f532beefed7ef30dfdadd1f80d5f937c7a9e62bc44f6432e")
   (:FILE "tests/execution/threads.lisp" :SOURCE-SHA256
    "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/execution/threads.fasl"
    :FASL-SHA256
    "b2189d4f4a2b96c7a79ef3c22fbb0d8759c9be432719c77f33bc01fb3ac8e069")
   (:FILE "tests/execution/support.lisp" :SOURCE-SHA256
    "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/execution/support.fasl"
    :FASL-SHA256
    "93fdb0bcd2c3e0d4ccd7ee9a936ab760100279ce8eb102c6ea9fb3fab4071cfd")
   (:FILE "tests/execution/ready.lisp" :SOURCE-SHA256
    "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/execution/ready.fasl"
    :FASL-SHA256
    "6892cc3821785fa61d1452b82cf9f266c78135be930d9f10975188163c9423e8")
   (:FILE "tests/execution/ready-recycle.lisp" :SOURCE-SHA256
    "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/execution/ready-recycle.fasl"
    :FASL-SHA256
    "86ddd0eed346ffcaa37311c37d1e350ba827359732ad2e77273dd1302169512a")
   (:FILE "tests/execution/queue.lisp" :SOURCE-SHA256
    "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/execution/queue.fasl"
    :FASL-SHA256
    "734dc05487c2c61ff1786a819f80e8dbbf2bb32e982c3a03620bbaa14e7528ae")
   (:FILE "tests/execution/handoff.lisp" :SOURCE-SHA256
    "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/execution/handoff.fasl"
    :FASL-SHA256
    "eca541cf4bb2e7ef8b6706e7fdff902ff1ed387d814e498cd1d2672e9af300b5")
   (:FILE "tests/epochs/threads.lisp" :SOURCE-SHA256
    "54b73e06c61e64f32a3e3af0791891dacb6590e929163dcf0fac95f2c71e66fd" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/epochs/threads.fasl"
    :FASL-SHA256
    "7389d386c570dec53d70f1b19ff66ac30fda5c02a38cc9dca2f6cec095c75a45")
   (:FILE "tests/epochs/support.lisp" :SOURCE-SHA256
    "366be7af4bf6c4ed946b3fa9e97aea6b034c83e3b757d81c54078dc76d229b6d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/epochs/support.fasl"
    :FASL-SHA256
    "6c5f32c71b37381eb0b14e64b0446cb640ac730e467e475b5ea34722990b9370")
   (:FILE "tests/epochs/lifecycle.lisp" :SOURCE-SHA256
    "ddc2fbdad9f97d2e4ff008c167776a50b17b742398306fbd5198dca474559cbf" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/epochs/lifecycle.fasl"
    :FASL-SHA256
    "1519b2f76cba4a39854a73de6fd702f68f83b5a5cbf79bf5f23fad02095b4014")
   (:FILE "tests/csn/threads.lisp" :SOURCE-SHA256
    "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/csn/threads.fasl"
    :FASL-SHA256
    "704620c32b9a9f6b49ba4183d21a6edba01b877165ee4d16184a52e0c0f8a949")
   (:FILE "tests/csn/support.lisp" :SOURCE-SHA256
    "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/csn/support.fasl"
    :FASL-SHA256
    "db5927ec7f183ef0cc17dd2ed9b351201bc0f384175ca1bb3f19bac050b85894")
   (:FILE "tests/csn/registry.lisp" :SOURCE-SHA256
    "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/csn/registry.fasl"
    :FASL-SHA256
    "1ea86b4149ec753a777d12957edec24d6c38ff314b4a9f5171e711397eab98c1")
   (:FILE "tests/codec/utf8.lisp" :SOURCE-SHA256
    "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/codec/utf8.fasl"
    :FASL-SHA256
    "d13a4108fbbd7d0beec56481635d5c45a4c49d41e73de515032f7b8cd9383ea7")
   (:FILE "tests/codec/threads.lisp" :SOURCE-SHA256
    "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/codec/threads.fasl"
    :FASL-SHA256
    "309f0ad778c652048bef497cf4f667567676d23bd8736934e363ea67ceb81122")
   (:FILE "tests/codec/support.lisp" :SOURCE-SHA256
    "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/codec/support.fasl"
    :FASL-SHA256
    "ed70cdee88bd73912f816f821a18ebdc528f7fd9b0babd60f22b1d95594bf26b")
   (:FILE "tests/codec/cbor-write.lisp" :SOURCE-SHA256
    "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/codec/cbor-write.fasl"
    :FASL-SHA256
    "70c614dbb4da7b1da42e5986c3b6a32c5907e0f3b993100a9cfbf0ac52013e77")
   (:FILE "tests/codec/cbor-write-threads.lisp" :SOURCE-SHA256
    "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/codec/cbor-write-threads.fasl"
    :FASL-SHA256
    "d78e24be1628bafd119925abb56ab4599b4e2dc1c5e4bd2dcaea973465e76cfa")
   (:FILE "tests/codec/cbor-write-support.lisp" :SOURCE-SHA256
    "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/codec/cbor-write-support.fasl"
    :FASL-SHA256
    "18c30d8868ef25528545a434bc5d9ae978a62916a3c27ef7010464db8771287c")
   (:FILE "tests/codec/cbor-write-roundtrip.lisp" :SOURCE-SHA256
    "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/codec/cbor-write-roundtrip.fasl"
    :FASL-SHA256
    "74f95a4d4664f7c4fd0cf9847a5a5ea13c5f207328c70c90610b9da21f707031")
   (:FILE "tests/codec/cbor-threads.lisp" :SOURCE-SHA256
    "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/codec/cbor-threads.fasl"
    :FASL-SHA256
    "174aa0d00690ae4df85d54634fa5ba120f4f9438e71edf10db0b669bf9deccd7")
   (:FILE "tests/codec/cbor-support.lisp" :SOURCE-SHA256
    "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/codec/cbor-support.fasl"
    :FASL-SHA256
    "8cc4607e2f6e7406e7f98edefe3011c967bfeb80ac1e224ccf10c441bd2b71e6")
   (:FILE "tests/codec/cbor-structure.lisp" :SOURCE-SHA256
    "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/codec/cbor-structure.fasl"
    :FASL-SHA256
    "277f08565e7fa8bc6f314247e1e014025b27696227eb32e80fefc9bf63c878fa")
   (:FILE "tests/codec/cbor-structure-threads.lisp" :SOURCE-SHA256
    "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/codec/cbor-structure-threads.fasl"
    :FASL-SHA256
    "8f79d3c7ce36571a504b3a5c9fd44f28e372a6ffb7c5224fd5874c43a43be941")
   (:FILE "tests/codec/cbor-structure-support.lisp" :SOURCE-SHA256
    "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/codec/cbor-structure-support.fasl"
    :FASL-SHA256
    "8bd7706f50f37ff11c7215093a36e7b7ada4d98a2246b6845a6ab612ee36c2f9")
   (:FILE "tests/codec/cbor-string-write.lisp" :SOURCE-SHA256
    "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/codec/cbor-string-write.fasl"
    :FASL-SHA256
    "0e87cb53d3b14642c9429c307ea0a60bd59026b4e9dfc3f547480d14254d74f8")
   (:FILE "tests/codec/cbor-string-write-threads.lisp" :SOURCE-SHA256
    "8e07b881a55e2554a429f1c8b2c69f67862ac015217d90d019167d636564d27d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/codec/cbor-string-write-threads.fasl"
    :FASL-SHA256
    "edf5433e7deaf6d334aee56d74343e0a3811b0f7773d26b10f575094f96da311")
   (:FILE "tests/codec/cbor-string-write-support.lisp" :SOURCE-SHA256
    "2cbdb601f442a56456bc637c94e759cc965f44b178268dce3c636c385d34fc39" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/codec/cbor-string-write-support.fasl"
    :FASL-SHA256
    "b6c8128f7a49256cfa329b633a73ce0628a469e906e5e2040a6afd5a967303cb")
   (:FILE "tests/codec/cbor-simple-write.lisp" :SOURCE-SHA256
    "958bdd3901cfc41032c09d6c9023b192799981884e09ce3573256ff45bc5329a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/codec/cbor-simple-write.fasl"
    :FASL-SHA256
    "e598167646854200e2f32510f41ca2cb2f6d127b47ec7669c381724c9d13aade")
   (:FILE "tests/codec/cbor-simple-write-threads.lisp" :SOURCE-SHA256
    "77074033e75a224fd02e890f98dffa8e97d3a1f8bedd510b00ea55d8ff8687b2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/codec/cbor-simple-write-threads.fasl"
    :FASL-SHA256
    "070f6095424be2b020102f636e0abdc4518d37a5a77a81c089339f6adf43e2f3")
   (:FILE "tests/codec/cbor-simple-write-support.lisp" :SOURCE-SHA256
    "53ceafc72a027a2ff1f787900558ff26f2ff70bbb212f1b37926a6d520fbe86e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/codec/cbor-simple-write-support.fasl"
    :FASL-SHA256
    "a69e1569b132e269cadda10080697e3b71a7d40153f99c538b16f0d5d6eab88a")
   (:FILE "tests/codec/cbor-minimal.lisp" :SOURCE-SHA256
    "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/codec/cbor-minimal.fasl"
    :FASL-SHA256
    "17f6d09031993eb9360a336abcbe7366ca50dd54ca169060f144f764974c1b5f")
   (:FILE "tests/codec/cbor-minimal-threads.lisp" :SOURCE-SHA256
    "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/codec/cbor-minimal-threads.fasl"
    :FASL-SHA256
    "648e530d1d0766bcc47933a38df74f8fe1de19a987990c785f01dc95224aeae0")
   (:FILE "tests/codec/cbor-minimal-support.lisp" :SOURCE-SHA256
    "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/codec/cbor-minimal-support.fasl"
    :FASL-SHA256
    "e5bfb170a62bc1513c44eedae46924871d56f941e506fca2208ac3cabb7a6c72")
   (:FILE "tests/codec/cbor-minimal-scan.lisp" :SOURCE-SHA256
    "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/codec/cbor-minimal-scan.fasl"
    :FASL-SHA256
    "9274fd1c05c534dc6372e0fcde9771e00c7077a8a870db3254e6bb003e65d27f")
   (:FILE "tests/codec/cbor-minimal-scan-threads.lisp" :SOURCE-SHA256
    "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/codec/cbor-minimal-scan-threads.fasl"
    :FASL-SHA256
    "16bddc0ea2bf20811e49150000bbf2e1eb296380cd8ce755a20927b121420ecf")
   (:FILE "tests/codec/cbor-minimal-scan-support.lisp" :SOURCE-SHA256
    "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/codec/cbor-minimal-scan-support.fasl"
    :FASL-SHA256
    "16f71c6d890828101cb2106487bfe244062768ebadc159d2cfb791d9066fa9ce")
   (:FILE "tests/codec/cbor-minimal-edges.lisp" :SOURCE-SHA256
    "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/codec/cbor-minimal-edges.fasl"
    :FASL-SHA256
    "5f7ffd96b49372e9448830f770f041cde407d357522e6ff64388fd7dca8e76d4")
   (:FILE "tests/codec/cbor-header.lisp" :SOURCE-SHA256
    "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/codec/cbor-header.fasl"
    :FASL-SHA256
    "aad6c7ead3aacd7b8df4ee4094c740bbbdd13f2300bcb9f94f42850ba98b5312")
   (:FILE "tests/codec/cbor-float-write.lisp" :SOURCE-SHA256
    "2d163a64bff4b9d9b9de576c4a4df05f4d8853f1c3d039e790cbb827be98c8b6" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/codec/cbor-float-write.fasl"
    :FASL-SHA256
    "f3cdda003d987d5e48152f4f093eac6ea56d9684dc2f1c79bb05748356b9ccbc")
   (:FILE "tests/codec/cbor-float-write-threads.lisp" :SOURCE-SHA256
    "96a1b205c01f75e271684132ff3e48b4da5cf8a01210257b591ec4951f097043" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/codec/cbor-float-write-threads.fasl"
    :FASL-SHA256
    "06ac38221426eb1e94dc31505d5aecf5c4d4696c03fec04f9b7640ded9c8fe99")
   (:FILE "tests/codec/cbor-float-write-support.lisp" :SOURCE-SHA256
    "158f18dcf4b2d7e5562713caa3625aeba16dd1eba21f4413345e8a10b616c748" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/tests/codec/cbor-float-write-support.fasl"
    :FASL-SHA256
    "6da1250d857e003429bd46623c2e4a84739ddb8a24b16b2bf99ee6b4600e5c4b")
   (:FILE "src/wal/types.lisp" :SOURCE-SHA256
    "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/wal/types.fasl"
    :FASL-SHA256
    "1aea53832cf34fdec85ea745da80532cb0b701014d9ead7fb54163e5c69fbf07")
   (:FILE "src/wal/package.lisp" :SOURCE-SHA256
    "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/wal/package.fasl"
    :FASL-SHA256
    "2ca788f4e99d1884240161dac31102605e9c4a21d73510569068d7d1d7d7563d")
   (:FILE "src/wal/group.lisp" :SOURCE-SHA256
    "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/wal/group.fasl"
    :FASL-SHA256
    "879e6f2f5ecca07871613a59fb627e116bc3847360f6398dcff0a37cb68fda60")
   (:FILE "src/wal/executor.lisp" :SOURCE-SHA256
    "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/wal/executor.fasl"
    :FASL-SHA256
    "3daac78d5d5be49946deda1ae1fe2e3605a33f863af26319d940f8a714fe1976")
   (:FILE "src/wal/csn.lisp" :SOURCE-SHA256
    "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/wal/csn.fasl"
    :FASL-SHA256
    "c9345aad372dc8a6b5d4ee6a72f44c202922d945beb73524b5adac23a40121fc")
   (:FILE "src/wal/builder.lisp" :SOURCE-SHA256
    "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/wal/builder.fasl"
    :FASL-SHA256
    "5c5d6200a3cd32858244ee5d11afee2716cb93a536229083874c9d54b27be1da")
   (:FILE "src/storage/segment-header.lisp" :SOURCE-SHA256
    "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/storage/segment-header.fasl"
    :FASL-SHA256
    "2a4ada52c9d632cdcedcb2b00d59fd953b3b4f3fde642feffc80eaf5b35ce38a")
   (:FILE "src/storage/payload-write.lisp" :SOURCE-SHA256
    "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/storage/payload-write.fasl"
    :FASL-SHA256
    "579c38e34eeb9731923eb95e1db77cea02a23ce2545ab895e336e9259aaa986b")
   (:FILE "src/storage/payload-record.lisp" :SOURCE-SHA256
    "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/storage/payload-record.fasl"
    :FASL-SHA256
    "c2ac6a7b7dfe95919e113ac81be2a67c0c34bbc03e534d8d40d1867e27d68309")
   (:FILE "src/storage/package.lisp" :SOURCE-SHA256
    "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/storage/package.fasl"
    :FASL-SHA256
    "3e581378b013b1834bccda4e0ddeff014a33263273e1bcd34b4a374dd55ddf3c")
   (:FILE "src/storage/log-header.lisp" :SOURCE-SHA256
    "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/storage/log-header.fasl"
    :FASL-SHA256
    "58f510e0d12476465074cec4d2590d06106e7cec5a1f62fdf95d59361382578d")
   (:FILE "src/storage/formats.lisp" :SOURCE-SHA256
    "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/storage/formats.fasl"
    :FASL-SHA256
    "7f5e8a4028b7c2cd5aec48c2d34cba11277ba9d5d50c3009396a34e0820e4ddc")
   (:FILE "src/storage/control-payload.lisp" :SOURCE-SHA256
    "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/storage/control-payload.fasl"
    :FASL-SHA256
    "ee6dec4713afda608dc98d77402bb76b649a40e244e207395cb9f533b2838e0d")
   (:FILE "src/storage/compaction-scan.lisp" :SOURCE-SHA256
    "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/storage/compaction-scan.fasl"
    :FASL-SHA256
    "ff7660d279e274a745103da4b7790e815e7492d87a30ca999b614bd72d03a309")
   (:FILE "src/series/worker-types.lisp" :SOURCE-SHA256
    "a366799fd9b938bfaa48b0ffda228ff8369ab9acb5b5ead7f081dfc66ab2c81a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/series/worker-types.fasl"
    :FASL-SHA256
    "f74c15324957a7c930f89369dfbcdee28e58e46b08aa4988ff0f17d72aabd9b0")
   (:FILE "src/series/worker-run.lisp" :SOURCE-SHA256
    "f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/series/worker-run.fasl"
    :FASL-SHA256
    "224a986a8a46063af880fd9e719e7b9d8107554feac172b786ee2ebaab702198")
   (:FILE "src/series/worker-package.lisp" :SOURCE-SHA256
    "dcab7a17e4fabcf256c2eddfb655d18145a1d789dd8d64a889945badc418e4b7" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/series/worker-package.fasl"
    :FASL-SHA256
    "a05d9c2045fabef51cb7108f8e9305f07894adb4bc318202ee4fee4aa1ff78fd")
   (:FILE "src/series/worker-boundary.lisp" :SOURCE-SHA256
    "793d401d1b9acc7b67923d815560f277f3d390ca050740f735f07d88dbacfe73" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/series/worker-boundary.fasl"
    :FASL-SHA256
    "f4760a91ad103dc69985dff9df1e9b767e1b4ef388cd91ed530c86403844912f")
   (:FILE "src/series/types.lisp" :SOURCE-SHA256
    "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/series/types.fasl"
    :FASL-SHA256
    "d83d4f09c871927e40c58a4aae7318f06a5def339bd5aa5e5a96f736376d71dc")
   (:FILE "src/series/routing-types.lisp" :SOURCE-SHA256
    "31ae51c0fb11a802164a4d1e11ec63f835a2c67b52c751c5685bcc8947e5e0f1" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/series/routing-types.fasl"
    :FASL-SHA256
    "d8443258241c1d1562cff89a4503e42cded9d95c54f1df84624858e5a3796031")
   (:FILE "src/series/routing-select.lisp" :SOURCE-SHA256
    "796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/series/routing-select.fasl"
    :FASL-SHA256
    "3a9059fae18df5e33f3c5fee2cc74429c9b0e9781019b0ac7cd77cf6b6c9b99d")
   (:FILE "src/series/routing-build.lisp" :SOURCE-SHA256
    "70135e73ecb1f6080683dd615c47a50530485061797382d74441743cd9a0f92d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/series/routing-build.fasl"
    :FASL-SHA256
    "61d3f3a4d86c03b5ae5c997a9f03d7a3c5d557acd281470d9432960c72c507fa")
   (:FILE "src/series/retirement.lisp" :SOURCE-SHA256
    "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/series/retirement.fasl"
    :FASL-SHA256
    "90254e4919599ef27499ecc8ee3f2542f7685b9c6f65176f190c66788ea21a5f")
   (:FILE "src/series/query.lisp" :SOURCE-SHA256
    "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/series/query.fasl"
    :FASL-SHA256
    "f5ed20895d7a909ad2e6bee76e225e8660239468b6618d86497c2f0c93b8902d")
   (:FILE "src/series/publication.lisp" :SOURCE-SHA256
    "5de121c83ea6bd1243e420d9d898102aebb054cd1fa7ac79fcde9bf0792a95d8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/series/publication.fasl"
    :FASL-SHA256
    "82b1aef38fbce1ebe10baee52d05dcea139aa080ca106e349ae1d35a4937d1dd")
   (:FILE "src/series/package.lisp" :SOURCE-SHA256
    "9a402f5225860c483dec9064a84d6462d28f5377a27977a63f64a5fbdbdd3764" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/series/package.fasl"
    :FASL-SHA256
    "a69ed2de9599a937d7de1c5efa172275c873cc4f667b61cb131a01c922910395")
   (:FILE "src/series/ownership.lisp" :SOURCE-SHA256
    "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/series/ownership.fasl"
    :FASL-SHA256
    "c901d121db0ab4a04e6cfe497a82f04ef72dc3bf88afd3320e825bd175b1c1b0")
   (:FILE "src/series/io-events.lisp" :SOURCE-SHA256
    "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/series/io-events.fasl"
    :FASL-SHA256
    "b56bceee537ccc05347fc7013b2a1e184d3d468febf3cfc6a57690af262bd879")
   (:FILE "src/series/events.lisp" :SOURCE-SHA256
    "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/series/events.fasl"
    :FASL-SHA256
    "67ba4f10ddc67615659d16fe89be85a6da52fbca8dcff866db06e3a18d459b9b")
   (:FILE "src/scheduler/update.lisp" :SOURCE-SHA256
    "e35a704ee0b9445c559a768de048169a8e39837a6df21843d8df58215c482472" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/scheduler/update.fasl"
    :FASL-SHA256
    "83510bbbd7e94c3f4aa6eba0d98d2f51fc7b095191c9df0d563bc217b189727a")
   (:FILE "src/scheduler/types.lisp" :SOURCE-SHA256
    "3b174be0919f8b27312ada4071d831c3753d62bb12be99d7e9394c48dcab474a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/scheduler/types.fasl"
    :FASL-SHA256
    "599d19b83c2eb1d617b316e59ec97f72a1ec2bba17c624ac1a5699eed9e4baf3")
   (:FILE "src/scheduler/read.lisp" :SOURCE-SHA256
    "5cdc1e5b7ba97c9aab66a5acaf74336b0df33144e24104e0242b7fc2552a1ae2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/scheduler/read.fasl"
    :FASL-SHA256
    "45f5afd8a9969cf377ac073655ccd009136f12463afc3ecb23dcadd1be7597d6")
   (:FILE "src/scheduler/policy.lisp" :SOURCE-SHA256
    "92b3ca3a81ae0b3ac342a63e5fe5c5d7524091a63065b0232c14c57ee80c4aac" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/scheduler/policy.fasl"
    :FASL-SHA256
    "f1ed4a014e269cc918afb1aaabc9c70ac6eed54a4d2fe86bd3ce709789664873")
   (:FILE "src/scheduler/package.lisp" :SOURCE-SHA256
    "5a139172de1648b30e09fdc6fc068141299c2034702f8d5b5f44bb0de14a3112" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/scheduler/package.fasl"
    :FASL-SHA256
    "105679488dcc3ec180cc81b47c721e8462505d887ec28293f0010adfdb08c298")
   (:FILE "src/scheduler/lifecycle-worker.lisp" :SOURCE-SHA256
    "ec8b462ff3f5f7a6435f0f0c01b62034d8de2a784a9e354d469a0adfec9cf837" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/scheduler/lifecycle-worker.fasl"
    :FASL-SHA256
    "bc9aad7b611655baf7b5c8ddb52de933341f215b103a359300349fcefd7cf26b")
   (:FILE "src/scheduler/lifecycle-update.lisp" :SOURCE-SHA256
    "2020e46809e9fe8fa74e061a420b8085679d5f461eabd8b044f3975c1024800e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/scheduler/lifecycle-update.fasl"
    :FASL-SHA256
    "40dbbd1c178800bc1d6d3ba909133c102c1d0998a66da3d9f19b9916fbae0b3a")
   (:FILE "src/scheduler/lifecycle-types.lisp" :SOURCE-SHA256
    "4fe980e00f1d273e9b8278cd2daace6b4a9e4ab948ddfac83b79f4b0c537cb7c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/scheduler/lifecycle-types.fasl"
    :FASL-SHA256
    "225d2dfc78c0f3168ddde72608e6657d3d184e705838dbb7372e3b76843862c3")
   (:FILE "src/scheduler/lifecycle-read.lisp" :SOURCE-SHA256
    "c60e1d5f67eeafb216b374fa001d27f87d1a734c5d066fc092902c0301069200" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/scheduler/lifecycle-read.fasl"
    :FASL-SHA256
    "c354ffae26c2416ffc75b54230667fb1bf3141a59e08d1c6f527f0461c73c8a5")
   (:FILE "src/scheduler/lifecycle-build.lisp" :SOURCE-SHA256
    "d6d67faf8721f26e7fcd228d6ab9a7dfdc36ff5ec56c67ed9e5fb6d914006a9e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/scheduler/lifecycle-build.fasl"
    :FASL-SHA256
    "45f0faa3da8cd3d07eb92eebb31dc75172df7ab17aac7695b60f0aa4b69e8feb")
   (:FILE "src/scheduler/build.lisp" :SOURCE-SHA256
    "58baf595f221826c64e3fb38344242c3bdf403d65904193bf1a8e06e09d7c336" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/scheduler/build.fasl"
    :FASL-SHA256
    "934104d8b74cb592473628ac72c341f0112f187118bc26ab5af17f9c86f008bf")
   (:FILE "src/recovery/scan.lisp" :SOURCE-SHA256
    "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/recovery/scan.fasl"
    :FASL-SHA256
    "ab54330eefebffb8a719d2677b939cb8b5ed54e5fb41500603a6c62dccaab358")
   (:FILE "src/recovery/package.lisp" :SOURCE-SHA256
    "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/recovery/package.fasl"
    :FASL-SHA256
    "b50a0ed8acadd2789f5bb68af91b0ba5ce3aa16181958e4a42001afaad87ad08")
   (:FILE "src/recovery/manifest-types.lisp" :SOURCE-SHA256
    "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/recovery/manifest-types.fasl"
    :FASL-SHA256
    "3f5e1e81aa9b3a84db0f642fcd96be8571e9a094b24ceee84f120a59f7e58b2f")
   (:FILE "src/recovery/manifest-query.lisp" :SOURCE-SHA256
    "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/recovery/manifest-query.fasl"
    :FASL-SHA256
    "04c5724c6adce1eb76402176943da182f96d31fcea3101ebebd23ab20da8b24c")
   (:FILE "src/recovery/manifest-package.lisp" :SOURCE-SHA256
    "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/recovery/manifest-package.fasl"
    :FASL-SHA256
    "968ea604c383b345fa42ca848809662dc5c4e3d07cdf16e6e778ca896ff0b2de")
   (:FILE "src/recovery/manifest-fold.lisp" :SOURCE-SHA256
    "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/recovery/manifest-fold.fasl"
    :FASL-SHA256
    "a967c1a08cbb7657e04bc96cd609958d0cb7a56dfeeb28e4000c9b360f0394a2")
   (:FILE "src/recovery/manifest-decode.lisp" :SOURCE-SHA256
    "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/recovery/manifest-decode.fasl"
    :FASL-SHA256
    "21791d9fab5f832982546a008adba986e72238cc8a2b83f5df955ba68d3a95ea")
   (:FILE "src/recovery/manifest-build.lisp" :SOURCE-SHA256
    "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/recovery/manifest-build.fasl"
    :FASL-SHA256
    "e8c091138e3c088de6f15b421be7b1b21320df5ed4f9921d49f8e168bf79dcc0")
   (:FILE "src/recovery/inventory-types.lisp" :SOURCE-SHA256
    "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/recovery/inventory-types.fasl"
    :FASL-SHA256
    "926134854a6a4ddbdd407cfae956cd0b2ff77c99ac19e7ffc90030541ced9feb")
   (:FILE "src/recovery/inventory-query.lisp" :SOURCE-SHA256
    "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/recovery/inventory-query.fasl"
    :FASL-SHA256
    "e4f618ce4ee14cc94e865338065e7702f67bf567b1617fb6c632e04e16a1827e")
   (:FILE "src/recovery/inventory-build.lisp" :SOURCE-SHA256
    "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/recovery/inventory-build.fasl"
    :FASL-SHA256
    "aab5e6f7aa531138172431ac282b821d028c8749985fc6d69a7f955801b1d676")
   (:FILE "src/recovery/decisions-types.lisp" :SOURCE-SHA256
    "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/recovery/decisions-types.fasl"
    :FASL-SHA256
    "992bc0f306bde35a403821e5f9137d679632946ae0c26ffcab75f110e7ee7e8a")
   (:FILE "src/recovery/decisions-sort.lisp" :SOURCE-SHA256
    "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/recovery/decisions-sort.fasl"
    :FASL-SHA256
    "638a096c7f4cbbbec610ecf8d95b4c8ea54dc0933058a0b229a6c8fce9f98595")
   (:FILE "src/recovery/decisions-radix.lisp" :SOURCE-SHA256
    "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/recovery/decisions-radix.fasl"
    :FASL-SHA256
    "cb811dc58d5d07e9450a342cf62141c9ef1f6d1bc7712689ca6974b0da1ffd4b")
   (:FILE "src/recovery/decisions-query.lisp" :SOURCE-SHA256
    "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/recovery/decisions-query.fasl"
    :FASL-SHA256
    "9df50f2875dc03e6e15488a6937359dbd18fd3335ef6e6259461f686791f8b21")
   (:FILE "src/recovery/decisions-package.lisp" :SOURCE-SHA256
    "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/recovery/decisions-package.fasl"
    :FASL-SHA256
    "703293a708b2923e4ccec282f78d3b528ac07ccbdac9fd923b0a325ce66db53f")
   (:FILE "src/recovery/decisions-build.lisp" :SOURCE-SHA256
    "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/recovery/decisions-build.fasl"
    :FASL-SHA256
    "31304ac1feb26c337bfa5acf8bbfcb7081fa15d3ffe08ad5105589123cd9c3a1")
   (:FILE "src/read/types.lisp" :SOURCE-SHA256
    "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/read/types.fasl"
    :FASL-SHA256
    "ce3ad8d18ddd9830200312e0f40855c8d06cbbb8dafd0299a9033b22c9ce2461")
   (:FILE "src/read/task.lisp" :SOURCE-SHA256
    "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/read/task.fasl"
    :FASL-SHA256
    "8ef9784af0f54ce85780f1df1e7f62e1ba8349f3f1b2712bba1244a9a3829aad")
   (:FILE "src/read/package.lisp" :SOURCE-SHA256
    "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/read/package.fasl"
    :FASL-SHA256
    "fd2c756fe79fc86412d159f06a77eceb9efc1a3186b69621ceda3578628f96f6")
   (:FILE "src/read/core.lisp" :SOURCE-SHA256
    "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/read/core.fasl"
    :FASL-SHA256
    "0389c54522be7ff33bfee129c8e4a812155a4c3ec35cc59b0a288e76e8b74f17")
   (:FILE "src/package.lisp" :SOURCE-SHA256
    "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/package.fasl"
    :FASL-SHA256
    "737ff213cd2a23bde81ea7b2b4a98ae410b2de6df9b911b71eb401a31f71de07")
   (:FILE "src/mvcc/types.lisp" :SOURCE-SHA256
    "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/mvcc/types.fasl"
    :FASL-SHA256
    "1f27577357ef711d529d9d33ec947b60bc2807424eaae85a763fa3f7b1910c84")
   (:FILE "src/mvcc/snapshots-types.lisp" :SOURCE-SHA256
    "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/mvcc/snapshots-types.fasl"
    :FASL-SHA256
    "67a600950fec010d2ba2c08a5932ea34d0434cc10c7fb87e5f274d57e59e50f0")
   (:FILE "src/mvcc/snapshots-register.lisp" :SOURCE-SHA256
    "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/mvcc/snapshots-register.fasl"
    :FASL-SHA256
    "4b93ae37a1e40e392851b377dc8348609566ee29c536bd643f9e9c041abd7dd8")
   (:FILE "src/mvcc/snapshots-read.lisp" :SOURCE-SHA256
    "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/mvcc/snapshots-read.fasl"
    :FASL-SHA256
    "c5546a962d319dc9cf311b8877f04701ad873f7fe9cce2a96d5240792fb2b32a")
   (:FILE "src/mvcc/snapshots-lifecycle.lisp" :SOURCE-SHA256
    "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/mvcc/snapshots-lifecycle.fasl"
    :FASL-SHA256
    "883bc783270992cd20e77bcf111c82780628282b56835e1911aa98954aa2dc51")
   (:FILE "src/mvcc/snapshots-csn.lisp" :SOURCE-SHA256
    "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/mvcc/snapshots-csn.fasl"
    :FASL-SHA256
    "6ee7dfba762d9c45ac1d63268b0a67f7f29691b3a310cf4d0d46d14f95fd1410")
   (:FILE "src/mvcc/snapshots-core.lisp" :SOURCE-SHA256
    "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/mvcc/snapshots-core.fasl"
    :FASL-SHA256
    "088e9b48fa7e651281935423d84aa16921c3794c8701d71c9d9200e952101a7a")
   (:FILE "src/mvcc/package.lisp" :SOURCE-SHA256
    "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/mvcc/package.fasl"
    :FASL-SHA256
    "1e27097690b22b5416eb0cf0a67b736aeb87acb2ff31c6473e4c7b354a4cb69e")
   (:FILE "src/io/types.lisp" :SOURCE-SHA256
    "63e3c4af997e26aaa48cb1df6298aaf97bb3971b88e59e8b7fa2c3736617450a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/io/types.fasl"
    :FASL-SHA256
    "8f2c113ac15d2e927d421b60b98b0dbc35e19f8df5849880677690518d179ba2")
   (:FILE "src/io/transfer.lisp" :SOURCE-SHA256
    "c807f294d0211e8433f8f0332ab6ba3ce7d9ae7de3818f43af7ff8d7fcfd341a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/io/transfer.fasl"
    :FASL-SHA256
    "fdbd63f48e6324469d689a5bb3ade374aeb03ee45390793c90ec2fef34030edf")
   (:FILE "src/io/package.lisp" :SOURCE-SHA256
    "a2437f320b170b4e8df8684ee9b61ab317b8aa10d3c107461450551ff7aec4bd" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/io/package.fasl"
    :FASL-SHA256
    "8cd33feeac5efa136dbd751ca85cdf28d34dfca4fdfeeb7b1d3cc1b9b8982bdc")
   (:FILE "src/io/native.lisp" :SOURCE-SHA256
    "74f63dbb2137a344054e82c6707e6262473b3332ff66a85f79ecfee9fd50f9b4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/io/native.fasl"
    :FASL-SHA256
    "444eb5974cd98d6f9184c273bbd574cbf44d7471e9a62690453f4f27a603a937")
   (:FILE "src/io/lifecycle.lisp" :SOURCE-SHA256
    "baa1f763fe0f394a14d381b753dcb1be1e90eb03eaff5d6469465b5d4eca015f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/io/lifecycle.fasl"
    :FASL-SHA256
    "78eb941f63ddecdbddb6b373de021ebd117b746f442faca2e4f7f9e8ecc14205")
   (:FILE "src/io/identity.lisp" :SOURCE-SHA256
    "d2b6f7932b66f2ef74241e573ed253cf9b710f217cd570ef23f6671614d90a2c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/io/identity.fasl"
    :FASL-SHA256
    "b112f3198014921da27ea5c2a865cf77990dfa928aad78d6da16053bb813b352")
   (:FILE "src/io/identity-types.lisp" :SOURCE-SHA256
    "5794dd5094f34c24e7e09e4a7937f1988d85ea9cd37e478abaf836273da5d5c1" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/io/identity-types.fasl"
    :FASL-SHA256
    "016d948be6c2a4723db4e95fb1092d2a9b4063f9044a85c629fc0c087be8c869")
   (:FILE "src/io/flush.lisp" :SOURCE-SHA256
    "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/io/flush.fasl"
    :FASL-SHA256
    "2ece828f7e612f64182d895f461fa922f5439b81f745880c55bd579188402661")
   (:FILE "src/index/write.lisp" :SOURCE-SHA256
    "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/index/write.fasl"
    :FASL-SHA256
    "cdeff96966e7f97c46c0417e21457ecdcd770cdfcc02141aaf606eef72adf114")
   (:FILE "src/index/validation.lisp" :SOURCE-SHA256
    "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/index/validation.fasl"
    :FASL-SHA256
    "1c07af30540c867ae35ccf12c87db5d656384ce8c3b0d2beebafb4d7eb00fa57")
   (:FILE "src/index/types.lisp" :SOURCE-SHA256
    "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/index/types.fasl"
    :FASL-SHA256
    "b94b73ffc08696b482170aca7bd66ead3d05a888f3f5c30c1bcc24a57ddd113e")
   (:FILE "src/index/relocate.lisp" :SOURCE-SHA256
    "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/index/relocate.fasl"
    :FASL-SHA256
    "6a890fea2993a4fc5c68963a91f6ceb1d99660e8d67ed56079afc83df463671c")
   (:FILE "src/index/rebuild.lisp" :SOURCE-SHA256
    "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/index/rebuild.fasl"
    :FASL-SHA256
    "42277c89893c3d100027bab14afe9e2af8717f25b659a39fa6929799eb7c0c86")
   (:FILE "src/index/rebuild-scan.lisp" :SOURCE-SHA256
    "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/index/rebuild-scan.fasl"
    :FASL-SHA256
    "af9fb34ebce43eadd8bdd0a15e5b53dab62595f3108aeb936e4684e1de6493bb")
   (:FILE "src/index/rebuild-copy.lisp" :SOURCE-SHA256
    "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/index/rebuild-copy.fasl"
    :FASL-SHA256
    "0ab84cb8eade192ece18e7ddf8c3871f4e98b17765dd66a7a9c9fec25f146a13")
   (:FILE "src/index/rebuild-budget.lisp" :SOURCE-SHA256
    "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/index/rebuild-budget.fasl"
    :FASL-SHA256
    "56d5a56666b551f7da25c924d262a5aa92de6549b7e63e60a4db0ba7e8fda349")
   (:FILE "src/index/read.lisp" :SOURCE-SHA256
    "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/index/read.fasl"
    :FASL-SHA256
    "9935453225f7060904aef1783d5401dc34adbed3b31b67c30d22599e7adb72f0")
   (:FILE "src/index/primary-write.lisp" :SOURCE-SHA256
    "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/index/primary-write.fasl"
    :FASL-SHA256
    "86d8c4fadd21e0dd5a4be801cf0bff071688f12d5fb4babd74597d4dd84659e5")
   (:FILE "src/index/primary-types.lisp" :SOURCE-SHA256
    "f17ca0dcd8a538b921f00044e23872b28272638c4435eacd30f0509422505e64" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/index/primary-types.fasl"
    :FASL-SHA256
    "607b3fb09164c3b6f0748b2afc4c911fde2bdd975ecf247fd5ffca933b3efc5e")
   (:FILE "src/index/primary-relocate.lisp" :SOURCE-SHA256
    "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/index/primary-relocate.fasl"
    :FASL-SHA256
    "d83e4b846863f59446ca94dd17cc163c8e5959bd1fa55e78b1c20ac130859658")
   (:FILE "src/index/primary-read.lisp" :SOURCE-SHA256
    "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/index/primary-read.fasl"
    :FASL-SHA256
    "9b4976bae035d882eae5fec346294f5b1866214a744b0c26a6ddc10297a775c7")
   (:FILE "src/index/primary-probe.lisp" :SOURCE-SHA256
    "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/index/primary-probe.fasl"
    :FASL-SHA256
    "9985077777a1649675e8eb847cb40fc99021400860994220eefbc1bdff9e404b")
   (:FILE "src/index/primary-package.lisp" :SOURCE-SHA256
    "0682eb9a61596506b6788bd0285f9808db2496246caae64ab3203182ed46b860" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/index/primary-package.fasl"
    :FASL-SHA256
    "24e9def7317410ce0153e13f8c8e3f1f08fd48a782b7a461679071c1b389bfc8")
   (:FILE "src/index/primary-directory.lisp" :SOURCE-SHA256
    "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/index/primary-directory.fasl"
    :FASL-SHA256
    "975b0de64c7666815c4ab931cd699ce6d1abac4c900cdceca8c1566e60eb1f18")
   (:FILE "src/index/primary-core.lisp" :SOURCE-SHA256
    "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/index/primary-core.fasl"
    :FASL-SHA256
    "24f179a33330b622dda65092e8d588c9d34b51dd6c3f02c0c363c402494cc4d9")
   (:FILE "src/index/primary-build.lisp" :SOURCE-SHA256
    "06ca5ac8c03504e2d2f973873e5cabf7518c090cd1f8f2118c46e0ea2f9bf37b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/index/primary-build.fasl"
    :FASL-SHA256
    "9530bb0a2d61bea5b86d360b5f86a319d50ed7bc6794169e4fe91022c9c84848")
   (:FILE "src/index/primary-arena.lisp" :SOURCE-SHA256
    "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/index/primary-arena.fasl"
    :FASL-SHA256
    "406f62d36937d6aa0bf0d7e7e2a08fc53a84f4cce35e1f6f017b86cadd1a669a")
   (:FILE "src/index/package.lisp" :SOURCE-SHA256
    "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/index/package.fasl"
    :FASL-SHA256
    "13e1260ef9d7442abef515bbacf68aeb294d2923e66fbfb1dc04d96465cccfa5")
   (:FILE "src/index/hash-seed.lisp" :SOURCE-SHA256
    "ae86514101e95737747ba58a4f0c5dc1ddb44d2b3a18bceb8fd0d0756b57a7a1" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/index/hash-seed.fasl"
    :FASL-SHA256
    "993ba7e738d759dc5e2c3aa7595abbdaf53df0e74ebd447de1914569c11ebdd8")
   (:FILE "src/index/hash-digests.lisp" :SOURCE-SHA256
    "924bb7dab91ff56c1e909f2b06dff5f74b443ac6442e379498f29b25f1fa2673" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/index/hash-digests.fasl"
    :FASL-SHA256
    "4b58221a76b3f03dd4de80861b61d26d6247635dae8c3822400aed1673b6ffa8")
   (:FILE "src/index/core.lisp" :SOURCE-SHA256
    "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/index/core.fasl"
    :FASL-SHA256
    "1b1cd73806a03acf700da3dde4d6a6e79583a3405ecf740f93f2675859707464")
   (:FILE "src/hash/package.lisp" :SOURCE-SHA256
    "1e7668fa26fc1a8e3b3cfe824aa3e08b30b57441d5f90d44453fc3a9259a10d0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/hash/package.fasl"
    :FASL-SHA256
    "a7952c3f7897db03b932e1e54a9a87e21d681bbbd27595e57357ca0e63bd5474")
   (:FILE "src/hash/hash64.lisp" :SOURCE-SHA256
    "99e4c8394a8f877ce1f552f15a57a082c0ec81015e87119ee4ffea28cf3ae77f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/hash/hash64.fasl"
    :FASL-SHA256
    "5c9317a2f73e98637614eb89335f7d68efe4665e1eff7af23e964ee395615420")
   (:FILE "src/hash/blocks.lisp" :SOURCE-SHA256
    "5f5dff95ae6c34dfc15538c537ba2fa8d34ba2376ad66ad9975745ea13a2175f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/hash/blocks.fasl"
    :FASL-SHA256
    "eed9d178222da280300eb9fc720d0184af05286b9f3e45147959855794e438cf")
   (:FILE "src/hash/arithmetic.lisp" :SOURCE-SHA256
    "c439e534b768acb123d69b921b85e1e56683aa8335bbc87efba95fe95f256fa9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/hash/arithmetic.fasl"
    :FASL-SHA256
    "34a0f70f6924471b59b7ae15fcf6c17ac159538137b30556a94222d60b51ddbf")
   (:FILE "src/get/types.lisp" :SOURCE-SHA256
    "653b23a6e719cd1f55e7c58b4d7e8143aec5983992ba210d0eac1f4c8682f623" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/get/types.fasl"
    :FASL-SHA256
    "869ca8e936d10d2607dd3cd933ff93cd774825cf685b3feb0b663ca26302f077")
   (:FILE "src/get/target.lisp" :SOURCE-SHA256
    "9f682f735e49108cad176a6143ec99e1be64da98f29cae0b52f9b49cdea34250" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/get/target.fasl"
    :FASL-SHA256
    "0c238bbe481b865bc25eb0a5ba20c4223c64620791f8d78eeb36f0d5087ca803")
   (:FILE "src/get/segment.lisp" :SOURCE-SHA256
    "4a486528cb2c1cc3471cb4b332d4314d24011889e1f885db6fd5600bb077eea3" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/get/segment.fasl"
    :FASL-SHA256
    "c652177028497a78c073518a2ff981e12759fac5b27cf10ef85f24d9cc1ab948")
   (:FILE "src/get/package.lisp" :SOURCE-SHA256
    "87b795779aef0c4b918a039d182daddd22b902a9ad10c763df4364b7e630151c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/get/package.fasl"
    :FASL-SHA256
    "cae1bec0523506045092904d5ab6ac9723255105210cc0fbd09d96bbb3dabb1e")
   (:FILE "src/get/lookup.lisp" :SOURCE-SHA256
    "9d1042d4cf1e7bd9c6d1153de12b2459e7a2724e47bd32534cd7ae56cb274c5f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/get/lookup.fasl"
    :FASL-SHA256
    "a3452344b0cf3219b9aeab360eae54f820f3f85b01ede1cd5a17d327ba60c076")
   (:FILE "src/get/lifecycle.lisp" :SOURCE-SHA256
    "885ba4141114ea411cac37c9b5f924aaa7f9f2a5ba311ebf92a392e5da1e3c59" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/get/lifecycle.fasl"
    :FASL-SHA256
    "ac98e04c1ab82c3760c65a2caae61c54b7f4d0c8b67752ffa1e03d8dd42891b7")
   (:FILE "src/get/build.lisp" :SOURCE-SHA256
    "bcfc4916e9a85833dc151c4ce176bc905f2c03b6bc6d636f97a60df0d8c16739" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/get/build.fasl"
    :FASL-SHA256
    "c6b355e098884ef5ecd8aaf5440f04d7d8ae1eb103a37f166af78c14d0f2ea31")
   (:FILE "src/get-resolver/types.lisp" :SOURCE-SHA256
    "b847d6c388f4d052a2d707b7c410cc7c2ef60482fb5cd9ef384c016c31d1dc00" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/get-resolver/types.fasl"
    :FASL-SHA256
    "d5be1c6ed4131640364af6ee4174a0ca1deb5ccb6240cdb7a1e228575f724256")
   (:FILE "src/get-resolver/sort.lisp" :SOURCE-SHA256
    "974bf44efeb1cd26c5e9db0601aea295c8f1a18234894ad9d41938a2880e2255" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/get-resolver/sort.fasl"
    :FASL-SHA256
    "b6e520a8cef1605edc2aeb723a59fa5053fa3328169307f12016578887fc3d25")
   (:FILE "src/get-resolver/scan.lisp" :SOURCE-SHA256
    "35a1780c6bf66364ef94c4151fa91f02eebe359f0ca0639985d2a907fd9d512d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/get-resolver/scan.fasl"
    :FASL-SHA256
    "7f87ee9ded20f934a9dadf1c68d2808eb673ea3dded1cb1adae9db08dd102643")
   (:FILE "src/get-resolver/rows.lisp" :SOURCE-SHA256
    "d9db85d788006fc7ad1f9a7cdeef28b992605de7fac8c295dd7fdc51f5511854" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/get-resolver/rows.fasl"
    :FASL-SHA256
    "f3eb6e41088b18e5a1987aab95b53972ef54503e995578414a1580c6044f2bb9")
   (:FILE "src/get-resolver/read.lisp" :SOURCE-SHA256
    "dd100bb17e15589124916767f8a690ae683ac8c462102c778639f917a5f1924d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/get-resolver/read.fasl"
    :FASL-SHA256
    "9ac3bd4786dca68bbafcc6c74b0748ff5de0ae6c66f6bc3332bcfac2700d8c70")
   (:FILE "src/get-resolver/package.lisp" :SOURCE-SHA256
    "663a5a15a630ed2b9042a3a3365598358df97d3dd1cd3d7610b283526281f39a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/get-resolver/package.fasl"
    :FASL-SHA256
    "f1afd9bd5c9b3319cb1f55e16f737390cb8571f168fc74b0332d76c3ed2dffce")
   (:FILE "src/get-resolver/build.lisp" :SOURCE-SHA256
    "c649c80c2b510669fc1c0a7f15b3080b7fb46a3423a1e49db5bb9ff248176e0a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/get-resolver/build.fasl"
    :FASL-SHA256
    "24cc3308ec11736eda7b1a074b74d98fc3b3ce29892e04d0a91c6178a6b96856")
   (:FILE "src/get-resolver/active-types.lisp" :SOURCE-SHA256
    "a3cb954a265b263e0e03d2f1a80824589670efbf89adcd69007987d26df2e29a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/get-resolver/active-types.fasl"
    :FASL-SHA256
    "3a322f369437a258dfeb7583514eab4e6f070a50bf1ad13c7dff09d9ef54e808")
   (:FILE "src/get-resolver/active-scan.lisp" :SOURCE-SHA256
    "97dd4f59d4449334b113e9403a208007ed1a398a9b53f88bda3e3c0bbf3a1067" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/get-resolver/active-scan.fasl"
    :FASL-SHA256
    "751ab1df1beddc4fad4e1bb25e96e4a4b6465ea4bfe842fd261ce31b951eb772")
   (:FILE "src/get-resolver/active-read.lisp" :SOURCE-SHA256
    "47630e5d42c785e39e15dd714177cd86159129a5391d82321385f92317bea659" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/get-resolver/active-read.fasl"
    :FASL-SHA256
    "68b336b5182ae8615dd94796d66ef8f5799b0de651cf6a0c85d5b8c21be6203e")
   (:FILE "src/get-resolver/active-preflight.lisp" :SOURCE-SHA256
    "eb56f5704666cac3a88ec97f58f70c7d61db2e8feea6a094db4c468a1a2775a9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/get-resolver/active-preflight.fasl"
    :FASL-SHA256
    "c81918b3edf46d88385084850db2993e7bef7a6a7499b970eb434bd1c9c1582e")
   (:FILE "src/get-resolver/active-init.lisp" :SOURCE-SHA256
    "2f9380674cf4b590b071ab9d769a4b79292f544d920c0fc5ff33146dde7686f6" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/get-resolver/active-init.fasl"
    :FASL-SHA256
    "802b398ca481d9b6fbab57bdbb48459eab0492c99c764cf674c8bb2fd46a4c0e")
   (:FILE "src/get-resolver/active-directory.lisp" :SOURCE-SHA256
    "c2b9a9ac3209270e9949720473908460548430a8098c9199fb55d2317a87682b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/get-resolver/active-directory.fasl"
    :FASL-SHA256
    "7faccc8d516f75fb10303a3a87fe745a85edae72828dd00dc037b97b9d5e05a5")
   (:FILE "src/get-resolver/active-build.lisp" :SOURCE-SHA256
    "0eed95930d41c515965ae8ab0a14fbb94597a42ea38b86f205ea0938cf4631de" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/get-resolver/active-build.fasl"
    :FASL-SHA256
    "f74b818e7d14d04006f3d1b9fe4d3af167a07c2f3668501abffa7a67b9d0c301")
   (:FILE "src/get-directory/types.lisp" :SOURCE-SHA256
    "0e2348291a4994f45bd1f6fe5efdc66041d2fdce18641d1af11b6c850ed69b2b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/get-directory/types.fasl"
    :FASL-SHA256
    "c88c53e79bd3f82b2661ec3cc07f2573779ca7fdead6b3a388ad3e217dc4c57d")
   (:FILE "src/get-directory/sources-types.lisp" :SOURCE-SHA256
    "862342b07d6a8aae834aaf3da4149682fcd1dcbdae971adad640597583547099" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/get-directory/sources-types.fasl"
    :FASL-SHA256
    "e4e1e5f144e0c8575dc3d888c3675593a53b1be3c52ebdb7ffa89a92017a9da2")
   (:FILE "src/get-directory/sources-read.lisp" :SOURCE-SHA256
    "ee4a3b81322fbd51ce928be0b73e9bc180af7ed39f936b68ec9a152dd2a180c2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/get-directory/sources-read.fasl"
    :FASL-SHA256
    "d4d9077001ace2d8869e7f37689b06289939bcbb35f43dd7bd240080710d96a9")
   (:FILE "src/get-directory/read.lisp" :SOURCE-SHA256
    "a2287eb7e91bed84f3727baaf81376bbe5bf5df15cde1ea268c6d2fa66fe0a5d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/get-directory/read.fasl"
    :FASL-SHA256
    "d1933aa95bf3a827fb1ee1c22c64d2110f089ea8495f23da155d1dc0100b2fc6")
   (:FILE "src/get-directory/package.lisp" :SOURCE-SHA256
    "e779202c8df502749a81d0c6f9f0d505d000e09231f3679b1a91303fbcbf36f9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/get-directory/package.fasl"
    :FASL-SHA256
    "17c87b3c7ae89850b4e5bbeca2a125b046f75976ae1bec29ac628bd004e3415c")
   (:FILE "src/get-directory/build.lisp" :SOURCE-SHA256
    "9bebb3cd9d66a8ec2fd0c72ad828e00ab2347093642653da45ef263bc855f947" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/get-directory/build.fasl"
    :FASL-SHA256
    "d63986370b26b8f83e3e31938437235dac31be925b19a79ae13f8a719757a2cc")
   (:FILE "src/foundation/record.lisp" :SOURCE-SHA256
    "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/foundation/record.fasl"
    :FASL-SHA256
    "3d5e242ed0a8fb82efbf365f9ab927503b860b04a158b1f26dff8d0cf1f4fd1b")
   (:FILE "src/foundation/package.lisp" :SOURCE-SHA256
    "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/foundation/package.fasl"
    :FASL-SHA256
    "74033e106418d2624cec8f134985dfd6f74c5b2fbc1d95c366c5cabc51b0fad6")
   (:FILE "src/foundation/crc32c.lisp" :SOURCE-SHA256
    "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/foundation/crc32c.fasl"
    :FASL-SHA256
    "3cbac937fbd779159dd7884dd700c8d87b2e792f2d1c284e824a52ce0feda444")
   (:FILE "src/foundation/conditions.lisp" :SOURCE-SHA256
    "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/foundation/conditions.fasl"
    :FASL-SHA256
    "cb50aa68623e2ad3e8b9f59f10ef0a38db3c24808a7f0558ddd112dd9963e3fa")
   (:FILE "src/foundation/binary.lisp" :SOURCE-SHA256
    "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/foundation/binary.fasl"
    :FASL-SHA256
    "8769a20899d1bd6868d2e89d0623cc7f45a9bb5614b5ecb3598dac2f42c66653")
   (:FILE "src/foundation/batch.lisp" :SOURCE-SHA256
    "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/foundation/batch.fasl"
    :FASL-SHA256
    "4b7c1a1793d41f9891be9c134ff773fb532adaaf18f5e918f7b446f6d14f5097")
   (:FILE "src/execution/writer.lisp" :SOURCE-SHA256
    "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/execution/writer.fasl"
    :FASL-SHA256
    "1f48bccf500783c5accdc529e7ca63e9b2055b25096b9f8d0dd8ccf4dd1e900e")
   (:FILE "src/execution/worker-types.lisp" :SOURCE-SHA256
    "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/execution/worker-types.fasl"
    :FASL-SHA256
    "15641a5429a89174e436bc58f6a355589f1c0aaee87525dd421446d20c4f76d3")
   (:FILE "src/execution/worker-run.lisp" :SOURCE-SHA256
    "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/execution/worker-run.fasl"
    :FASL-SHA256
    "b75c740fbaad6f399db50ac3f8c8c4471efa66d6c6641caf0ccd711d0f334ab6")
   (:FILE "src/execution/worker-claim.lisp" :SOURCE-SHA256
    "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/execution/worker-claim.fasl"
    :FASL-SHA256
    "d0008f31c3668d96efeaa9c0389241b24240636b87032fc14ba2dd36e116e447")
   (:FILE "src/execution/worker-boundary.lisp" :SOURCE-SHA256
    "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/execution/worker-boundary.fasl"
    :FASL-SHA256
    "cf1e287ebaad7a460f1c7e3bcfdc714a642f98ce896c34628a355481c4541775")
   (:FILE "src/execution/ready.lisp" :SOURCE-SHA256
    "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/execution/ready.fasl"
    :FASL-SHA256
    "1fa2342ffa48f4d6fd94b8bc79ca6a1dc959e5e6348151d3e03844b70f9fcb53")
   (:FILE "src/execution/ready-types.lisp" :SOURCE-SHA256
    "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/execution/ready-types.fasl"
    :FASL-SHA256
    "9160f007346b393e3bd06171596e54177ae1d15d9757757640bbe798281fdc2d")
   (:FILE "src/execution/ready-recycle.lisp" :SOURCE-SHA256
    "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/execution/ready-recycle.fasl"
    :FASL-SHA256
    "221ef7f43060c26056e0ba68d56579154e69f22e4420053f1d367ffbec643343")
   (:FILE "src/execution/queue.lisp" :SOURCE-SHA256
    "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/execution/queue.fasl"
    :FASL-SHA256
    "422df3765102eb0bfd2bc139353d83ba6451336535e4c192066ef065aac1fc83")
   (:FILE "src/execution/package.lisp" :SOURCE-SHA256
    "833e501e6ee6e3acb8a6d37139c4605a05e06c425a35318adbcf651aa2f9db30" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/execution/package.fasl"
    :FASL-SHA256
    "6e95099ff4e1c93ad12dabaa7485d0dc8977affed0252b0a394c95a2d36ce5f3")
   (:FILE "src/execution/handoff.lisp" :SOURCE-SHA256
    "3ce9f47008416f210173fd3a83ee7665b2103f26039d36e2601b31e5e3ebd72a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/execution/handoff.fasl"
    :FASL-SHA256
    "07770ec60cc977178eafd81a18de99718cbdcb73d1615d8526f64421bfb3412e")
   (:FILE "src/epochs/types.lisp" :SOURCE-SHA256
    "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/epochs/types.fasl"
    :FASL-SHA256
    "ecb48c5b21a0018733a1887855de7d6cbc650655b996111cea3bbc317754f254")
   (:FILE "src/epochs/retire.lisp" :SOURCE-SHA256
    "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/epochs/retire.fasl"
    :FASL-SHA256
    "75922ced52525f35284a5d3eecbdff413e4e4d5522838998333bd097fffc7a70")
   (:FILE "src/epochs/reclaim.lisp" :SOURCE-SHA256
    "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/epochs/reclaim.fasl"
    :FASL-SHA256
    "d1ade22ff27e596dbfc148e20040d3ab04b7b92843ad89eda4c4a50aaad2beb5")
   (:FILE "src/epochs/read.lisp" :SOURCE-SHA256
    "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/epochs/read.fasl"
    :FASL-SHA256
    "d4d1b4f884a062134644cfc65c6a390f11500ec4ca093a18b19c8137d43dac0b")
   (:FILE "src/epochs/package.lisp" :SOURCE-SHA256
    "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/epochs/package.fasl"
    :FASL-SHA256
    "506cc902c610872db7cd4d99352a3cda598673d43766139f50684cc3fcb0d44e")
   (:FILE "src/epochs/core.lisp" :SOURCE-SHA256
    "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/epochs/core.fasl"
    :FASL-SHA256
    "1dc31cd8f79eba3f1e4d129dcbf9c5730ddeb0c7cd62d2adec876c599a7ef720")
   (:FILE "src/csn/registry.lisp" :SOURCE-SHA256
    "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/csn/registry.fasl"
    :FASL-SHA256
    "9b209e51de92ed7ffce5401550c32b995381edf82da9f90248bf28109cb99a7b")
   (:FILE "src/csn/package.lisp" :SOURCE-SHA256
    "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/csn/package.fasl"
    :FASL-SHA256
    "793f2d5e695d90db3b1291de905f917bb49c84ca4819187b07e268edf2bf53f5")
   (:FILE "src/control/types.lisp" :SOURCE-SHA256
    "7f7932e0c38d3fa26273342df2be2da436024ff9a9a647c8a3dc5c65c452f563" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/control/types.fasl"
    :FASL-SHA256
    "fb1ad9886a93dd7dfde0f918c43af9a0d1f1e7836326bd179ec124984b2fbefb")
   (:FILE "src/control/transfer.lisp" :SOURCE-SHA256
    "6e257bfb6ce8e6d11263cc6788de4fc35657a82e159af7b46341c3bb208e0275" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/control/transfer.fasl"
    :FASL-SHA256
    "0bb517e70501b3878d48f0d6c50320bffc3e879db3b64dcbbdcdbd9faae63903")
   (:FILE "src/control/prepare.lisp" :SOURCE-SHA256
    "878b15074bfcb3f3aec784e78e545f1ae617539b9ddcb975504880cb000b7f87" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/control/prepare.fasl"
    :FASL-SHA256
    "392ffef1c4e6107e7df41b2e3670559f952e6571873ca056ff2d2954853c2dd0")
   (:FILE "src/control/preflight.lisp" :SOURCE-SHA256
    "48326533ac0934cb3b1e3fc7657ef48f38912b6c08e9e38367301905f7711584" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/control/preflight.fasl"
    :FASL-SHA256
    "4276692ac234682d11806c81bb40a1298518409b7409fee196253b9162e6a1aa")
   (:FILE "src/control/package.lisp" :SOURCE-SHA256
    "405b91843049e7f9e38896535ad615886443852b39eb0687c29e44dbd675429d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/control/package.fasl"
    :FASL-SHA256
    "b5fcb14ddf96b70c5474dee178ec87caff881759aab1e4e3876d4593a9a7a55d")
   (:FILE "src/control/dependency.lisp" :SOURCE-SHA256
    "f328344e4824fd53d03a0476b45fb87efada43ddee895e13afd76ac44413d128" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/control/dependency.fasl"
    :FASL-SHA256
    "34950c569617dc42ce7800f82103f11d000dcb00b2daa4094ea13905926d4fb8")
   (:FILE "src/control/build.lisp" :SOURCE-SHA256
    "1904e81a6cebbb178598a41e1b2283240fc21506781b1e31da407610ce0f519c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/control/build.fasl"
    :FASL-SHA256
    "15ff39e5e1af5496cce4372b72554754bbf2e44e1718d15fed6eb0d29673b9c9")
   (:FILE "src/codec/utf8.lisp" :SOURCE-SHA256
    "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/codec/utf8.fasl"
    :FASL-SHA256
    "775a5da288f256e5cfe2d7062695938a1f866a690a104c2f41af5d22c760a2b9")
   (:FILE "src/codec/package.lisp" :SOURCE-SHA256
    "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/codec/package.fasl"
    :FASL-SHA256
    "2cf46b48ab2b2d927a92d76c5ac009d44588f64647aa171035b1f7c813d14b8a")
   (:FILE "src/codec/cbor-write.lisp" :SOURCE-SHA256
    "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/codec/cbor-write.fasl"
    :FASL-SHA256
    "f0fc1f3385603ebe36e45d3fe247355af4d335b9d92bc2221b452de621f95b5b")
   (:FILE "src/codec/cbor-string-write.lisp" :SOURCE-SHA256
    "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/codec/cbor-string-write.fasl"
    :FASL-SHA256
    "e19a5162185738730e2a876342cdea9edc6924aa289e9a41cf4e4c9be8940bdf")
   (:FILE "src/codec/cbor-space.lisp" :SOURCE-SHA256
    "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/codec/cbor-space.fasl"
    :FASL-SHA256
    "75ae7fa0bc2796b12a3b8fea68b9c2a4761599ec75084079a454b57d516b7dd1")
   (:FILE "src/codec/cbor-simple-write.lisp" :SOURCE-SHA256
    "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/codec/cbor-simple-write.fasl"
    :FASL-SHA256
    "f82634422272c312b9febd1ada23b8abad1c9d04800acf1e3869fd46f8b53fdb")
   (:FILE "src/codec/cbor-scan.lisp" :SOURCE-SHA256
    "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/codec/cbor-scan.fasl"
    :FASL-SHA256
    "c825c3b3f4ad712c04ebe495cb8f612db8822cac8f0e066c042cc2dd7831cecd")
   (:FILE "src/codec/cbor-scan-stack.lisp" :SOURCE-SHA256
    "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/codec/cbor-scan-stack.fasl"
    :FASL-SHA256
    "28e03f03c208892c3aa888edb1bf57d169ff4fc183f8cbe69a109463751912c0")
   (:FILE "src/codec/cbor-scan-minimal.lisp" :SOURCE-SHA256
    "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/codec/cbor-scan-minimal.fasl"
    :FASL-SHA256
    "fae03f1f6c604a0b8b1d9e9de8188af0ed8db5eaa57b614e499870fa6907eacc")
   (:FILE "src/codec/cbor-scan-items.lisp" :SOURCE-SHA256
    "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/codec/cbor-scan-items.fasl"
    :FASL-SHA256
    "807d0944d7c95ed2833be7ab5afd1a1b40e211f1735fdb00a23db75b58496c60")
   (:FILE "src/codec/cbor-scan-input.lisp" :SOURCE-SHA256
    "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/codec/cbor-scan-input.fasl"
    :FASL-SHA256
    "7f0e3ba04a9a27921ff76fde6803db21a47e824e5d65569a7f05ddb343ab5d08")
   (:FILE "src/codec/cbor-package.lisp" :SOURCE-SHA256
    "c2a6fe51760c871705e4cf213ada92fed140fac26cf177d06889e18ab87fb45b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/codec/cbor-package.fasl"
    :FASL-SHA256
    "fc19255d5de960126c4b907b53ae5f0b70e052580bd9e4acdb5cf19b280b6990")
   (:FILE "src/codec/cbor-minimal.lisp" :SOURCE-SHA256
    "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/codec/cbor-minimal.fasl"
    :FASL-SHA256
    "516f651cef9456d8f5fc86fcc093e72437f47ce0a13a39553adfa848ad4e2619")
   (:FILE "src/codec/cbor-header.lisp" :SOURCE-SHA256
    "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/codec/cbor-header.fasl"
    :FASL-SHA256
    "5ab1396ef77daa611670507b51c653ef5d870369f82db83c054156b2e7982cb9")
   (:FILE "src/codec/cbor-float-write.lisp" :SOURCE-SHA256
    "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/codec/cbor-float-write.fasl"
    :FASL-SHA256
    "867995864983f1d538b13fdfe3e226cd37ad0e853873db79beb0e2d411c69904")
   (:FILE "src/codec/cbor-float-narrow.lisp" :SOURCE-SHA256
    "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/codec/cbor-float-narrow.fasl"
    :FASL-SHA256
    "2e88d8019e3c79fe36d6754cf1121e25fdf4d88c1c6c2a6b990216bfaece6a07")
   (:FILE "src/codec/cbor-float-minimal.lisp" :SOURCE-SHA256
    "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/codec/cbor-float-minimal.fasl"
    :FASL-SHA256
    "e9aaa4aaa18700f3a5f3a46aeaa7eedd59d98b83f0c70bee9a948442bc95426c")
   (:FILE "src/cache/write.lisp" :SOURCE-SHA256
    "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/cache/write.fasl"
    :FASL-SHA256
    "80775f4adaab3df18bef967f4a4427380e6db576bf9e5511b6492a74c494b505")
   (:FILE "src/cache/types.lisp" :SOURCE-SHA256
    "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/cache/types.fasl"
    :FASL-SHA256
    "b148f8674b8c88215d0264dfdfee45b3f83f9bed027d209d88925d29efd6d2d4")
   (:FILE "src/cache/read.lisp" :SOURCE-SHA256
    "5700e43ae8ee859e96bdecb5953af43a712fd9e6ec23a53565759676bb07f85a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/cache/read.fasl"
    :FASL-SHA256
    "dfa186d28816c9564574af306ab19fa4ef565431cd6a4ee30c45e88c66efe156")
   (:FILE "src/cache/package.lisp" :SOURCE-SHA256
    "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/cache/package.fasl"
    :FASL-SHA256
    "975d5eb69bc3de2bbfff4fcb37ec46dd758a0ccdbe838ed233cdf1e877863680")
   (:FILE "src/cache/core.lisp" :SOURCE-SHA256
    "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/cache/core.fasl"
    :FASL-SHA256
    "6710a01d773934da860b780b1a4c9440f7c07f83e40e5eb320419b95a6183488")
   (:FILE "src/cache/clock.lisp" :SOURCE-SHA256
    "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/cache/clock.fasl"
    :FASL-SHA256
    "70c4fef6e44d08f8974983bce2bd104eaaeaa10ffb06c56092d3b01a7b964504")
   (:FILE "src/cache/build.lisp" :SOURCE-SHA256
    "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/cache/build.fasl"
    :FASL-SHA256
    "7186e27df484c13ec6649dd9f59880f39b00be62af5fd6630325e6c3d7f08dba")
   (:FILE "src/active/types.lisp" :SOURCE-SHA256
    "48fe584096fc253ef182ab428c1887e443af06d75aaa938df660c77e60b39bfb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/active/types.fasl"
    :FASL-SHA256
    "a11dcc30c9f02ec3913ae4530b4783d410d82bc6b03eaf92589e115cbbd9aabb")
   (:FILE "src/active/source.lisp" :SOURCE-SHA256
    "ff96fe360b46190ecc08ee9e05a813715dc3399054f93693f9309012aec6547d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/active/source.fasl"
    :FASL-SHA256
    "158b786249ab2157b5b203cd9e553d6ec23d4c39415dba85ea9e1d8f1eeccc7b")
   (:FILE "src/active/prepare.lisp" :SOURCE-SHA256
    "7b45fb01132c45c9bec76f374edaa8de91ac6bb2d61ae5c359e1fa10c6346f53" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/active/prepare.fasl"
    :FASL-SHA256
    "82c699a19b8965b7d6ea0d9b97d96232b57df6d5648a05fe5b1d1ed1d0589db3")
   (:FILE "src/active/preflight.lisp" :SOURCE-SHA256
    "ef7b592daecc223d78cbcda138b5938abc01593b486482bec06f2721cfd955a2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/active/preflight.fasl"
    :FASL-SHA256
    "eadaf67a55f350d9df66e6e8676c28229b06ad4e5a71614bc762291cc8d4ad3a")
   (:FILE "src/active/package.lisp" :SOURCE-SHA256
    "4a6fa4187ef5d44aec4e65d57ee6d6046485f283cc9009c1d94263bee745fa3b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/baseline/fasl/src/active/package.fasl"
    :FASL-SHA256
    "fec853050ddda9273e9f79eaf673605cfe7d00756d2ffacda83ac6565fb83a88"))
  :LOADED-SOURCE-FILES
  ("src/active/package.lisp" "src/active/preflight.lisp"
   "src/active/prepare.lisp" "src/active/source.lisp" "src/active/types.lisp"
   "src/cache/build.lisp" "src/cache/clock.lisp" "src/cache/core.lisp"
   "src/cache/package.lisp" "src/cache/read.lisp" "src/cache/types.lisp"
   "src/cache/write.lisp" "src/codec/cbor-float-minimal.lisp"
   "src/codec/cbor-float-narrow.lisp" "src/codec/cbor-float-write.lisp"
   "src/codec/cbor-header.lisp" "src/codec/cbor-minimal.lisp"
   "src/codec/cbor-package.lisp" "src/codec/cbor-scan-input.lisp"
   "src/codec/cbor-scan-items.lisp" "src/codec/cbor-scan-minimal.lisp"
   "src/codec/cbor-scan-stack.lisp" "src/codec/cbor-scan.lisp"
   "src/codec/cbor-simple-write.lisp" "src/codec/cbor-space.lisp"
   "src/codec/cbor-string-write.lisp" "src/codec/cbor-write.lisp"
   "src/codec/package.lisp" "src/codec/utf8.lisp" "src/control/build.lisp"
   "src/control/dependency.lisp" "src/control/package.lisp"
   "src/control/preflight.lisp" "src/control/prepare.lisp"
   "src/control/transfer.lisp" "src/control/types.lisp" "src/csn/package.lisp"
   "src/csn/registry.lisp" "src/epochs/core.lisp" "src/epochs/package.lisp"
   "src/epochs/read.lisp" "src/epochs/reclaim.lisp" "src/epochs/retire.lisp"
   "src/epochs/types.lisp" "src/execution/handoff.lisp"
   "src/execution/package.lisp" "src/execution/queue.lisp"
   "src/execution/ready-recycle.lisp" "src/execution/ready-types.lisp"
   "src/execution/ready.lisp" "src/execution/worker-boundary.lisp"
   "src/execution/worker-claim.lisp" "src/execution/worker-run.lisp"
   "src/execution/worker-types.lisp" "src/execution/writer.lisp"
   "src/foundation/batch.lisp" "src/foundation/binary.lisp"
   "src/foundation/conditions.lisp" "src/foundation/crc32c.lisp"
   "src/foundation/package.lisp" "src/foundation/record.lisp"
   "src/get-directory/build.lisp" "src/get-directory/package.lisp"
   "src/get-directory/read.lisp" "src/get-directory/sources-read.lisp"
   "src/get-directory/sources-types.lisp" "src/get-directory/types.lisp"
   "src/get-resolver/active-build.lisp"
   "src/get-resolver/active-directory.lisp" "src/get-resolver/active-init.lisp"
   "src/get-resolver/active-preflight.lisp" "src/get-resolver/active-read.lisp"
   "src/get-resolver/active-scan.lisp" "src/get-resolver/active-types.lisp"
   "src/get-resolver/build.lisp" "src/get-resolver/package.lisp"
   "src/get-resolver/read.lisp" "src/get-resolver/rows.lisp"
   "src/get-resolver/scan.lisp" "src/get-resolver/sort.lisp"
   "src/get-resolver/types.lisp" "src/get/build.lisp" "src/get/lifecycle.lisp"
   "src/get/lookup.lisp" "src/get/package.lisp" "src/get/segment.lisp"
   "src/get/target.lisp" "src/get/types.lisp" "src/hash/arithmetic.lisp"
   "src/hash/blocks.lisp" "src/hash/hash64.lisp" "src/hash/package.lisp"
   "src/index/core.lisp" "src/index/hash-digests.lisp"
   "src/index/hash-seed.lisp" "src/index/package.lisp"
   "src/index/primary-arena.lisp" "src/index/primary-build.lisp"
   "src/index/primary-core.lisp" "src/index/primary-directory.lisp"
   "src/index/primary-package.lisp" "src/index/primary-probe.lisp"
   "src/index/primary-read.lisp" "src/index/primary-relocate.lisp"
   "src/index/primary-types.lisp" "src/index/primary-write.lisp"
   "src/index/read.lisp" "src/index/rebuild-budget.lisp"
   "src/index/rebuild-copy.lisp" "src/index/rebuild-scan.lisp"
   "src/index/rebuild.lisp" "src/index/relocate.lisp" "src/index/types.lisp"
   "src/index/validation.lisp" "src/index/write.lisp" "src/io/flush.lisp"
   "src/io/identity-types.lisp" "src/io/identity.lisp" "src/io/lifecycle.lisp"
   "src/io/native.lisp" "src/io/package.lisp" "src/io/transfer.lisp"
   "src/io/types.lisp" "src/mvcc/package.lisp" "src/mvcc/snapshots-core.lisp"
   "src/mvcc/snapshots-csn.lisp" "src/mvcc/snapshots-lifecycle.lisp"
   "src/mvcc/snapshots-read.lisp" "src/mvcc/snapshots-register.lisp"
   "src/mvcc/snapshots-types.lisp" "src/mvcc/types.lisp" "src/package.lisp"
   "src/read/core.lisp" "src/read/package.lisp" "src/read/task.lisp"
   "src/read/types.lisp" "src/recovery/decisions-build.lisp"
   "src/recovery/decisions-package.lisp" "src/recovery/decisions-query.lisp"
   "src/recovery/decisions-radix.lisp" "src/recovery/decisions-sort.lisp"
   "src/recovery/decisions-types.lisp" "src/recovery/inventory-build.lisp"
   "src/recovery/inventory-query.lisp" "src/recovery/inventory-types.lisp"
   "src/recovery/manifest-build.lisp" "src/recovery/manifest-decode.lisp"
   "src/recovery/manifest-fold.lisp" "src/recovery/manifest-package.lisp"
   "src/recovery/manifest-query.lisp" "src/recovery/manifest-types.lisp"
   "src/recovery/package.lisp" "src/recovery/scan.lisp"
   "src/scheduler/build.lisp" "src/scheduler/lifecycle-build.lisp"
   "src/scheduler/lifecycle-read.lisp" "src/scheduler/lifecycle-types.lisp"
   "src/scheduler/lifecycle-update.lisp" "src/scheduler/lifecycle-worker.lisp"
   "src/scheduler/package.lisp" "src/scheduler/policy.lisp"
   "src/scheduler/read.lisp" "src/scheduler/types.lisp"
   "src/scheduler/update.lisp" "src/series/events.lisp"
   "src/series/io-events.lisp" "src/series/ownership.lisp"
   "src/series/package.lisp" "src/series/publication.lisp"
   "src/series/query.lisp" "src/series/retirement.lisp"
   "src/series/routing-build.lisp" "src/series/routing-select.lisp"
   "src/series/routing-types.lisp" "src/series/types.lisp"
   "src/series/worker-boundary.lisp" "src/series/worker-package.lisp"
   "src/series/worker-run.lisp" "src/series/worker-types.lisp"
   "src/storage/compaction-scan.lisp" "src/storage/control-payload.lisp"
   "src/storage/formats.lisp" "src/storage/log-header.lisp"
   "src/storage/package.lisp" "src/storage/payload-record.lisp"
   "src/storage/payload-write.lisp" "src/storage/segment-header.lisp"
   "src/wal/builder.lisp" "src/wal/csn.lisp" "src/wal/executor.lisp"
   "src/wal/group.lisp" "src/wal/package.lisp" "src/wal/types.lisp"
   "tests/codec/cbor-float-write-support.lisp"
   "tests/codec/cbor-float-write-threads.lisp"
   "tests/codec/cbor-float-write.lisp" "tests/codec/cbor-header.lisp"
   "tests/codec/cbor-minimal-edges.lisp"
   "tests/codec/cbor-minimal-scan-support.lisp"
   "tests/codec/cbor-minimal-scan-threads.lisp"
   "tests/codec/cbor-minimal-scan.lisp" "tests/codec/cbor-minimal-support.lisp"
   "tests/codec/cbor-minimal-threads.lisp" "tests/codec/cbor-minimal.lisp"
   "tests/codec/cbor-simple-write-support.lisp"
   "tests/codec/cbor-simple-write-threads.lisp"
   "tests/codec/cbor-simple-write.lisp"
   "tests/codec/cbor-string-write-support.lisp"
   "tests/codec/cbor-string-write-threads.lisp"
   "tests/codec/cbor-string-write.lisp"
   "tests/codec/cbor-structure-support.lisp"
   "tests/codec/cbor-structure-threads.lisp" "tests/codec/cbor-structure.lisp"
   "tests/codec/cbor-support.lisp" "tests/codec/cbor-threads.lisp"
   "tests/codec/cbor-write-roundtrip.lisp"
   "tests/codec/cbor-write-support.lisp" "tests/codec/cbor-write-threads.lisp"
   "tests/codec/cbor-write.lisp" "tests/codec/support.lisp"
   "tests/codec/threads.lisp" "tests/codec/utf8.lisp" "tests/csn/registry.lisp"
   "tests/csn/support.lisp" "tests/csn/threads.lisp"
   "tests/epochs/lifecycle.lisp" "tests/epochs/support.lisp"
   "tests/epochs/threads.lisp" "tests/execution/handoff.lisp"
   "tests/execution/queue.lisp" "tests/execution/ready-recycle.lisp"
   "tests/execution/ready.lisp" "tests/execution/support.lisp"
   "tests/execution/threads.lisp" "tests/execution/worker.lisp"
   "tests/foundation/batch.lisp" "tests/foundation/binary.lisp"
   "tests/foundation/record.lisp" "tests/foundation/support.lisp"
   "tests/get-directory/construction.lisp" "tests/get-directory/read.lisp"
   "tests/get-directory/series-read.lisp"
   "tests/get-directory/series-support.lisp" "tests/get-directory/support.lisp"
   "tests/get-directory/threads.lisp" "tests/get-performance/guards.lisp"
   "tests/get-performance/paths.lisp" "tests/get-performance/support.lisp"
   "tests/get-performance/threads.lisp" "tests/get-resolver/construction.lisp"
   "tests/get-resolver/read.lisp" "tests/get-resolver/sort.lisp"
   "tests/get-resolver/support.lisp" "tests/get/lifecycle.lisp"
   "tests/get/segment.lisp" "tests/get/support.lisp" "tests/hash/guards.lisp"
   "tests/hash/hash64.lisp" "tests/hash/support.lisp" "tests/hash/threads.lisp"
   "tests/index/hash-digests.lisp" "tests/index/primary-support.lisp"
   "tests/index/primary-threads.lisp" "tests/index/primary.lisp"
   "tests/index/rebuild.lisp" "tests/index/slot-support.lisp"
   "tests/index/slot-threads.lisp" "tests/index/slots.lisp"
   "tests/io/native.lisp" "tests/io/support.lisp" "tests/io/transfer.lisp"
   "tests/mvcc/capture.lisp" "tests/mvcc/lifecycle.lisp"
   "tests/mvcc/support.lisp" "tests/read/lifecycle.lisp"
   "tests/read/support.lisp" "tests/read/threads.lisp"
   "tests/recovery/corruption.lisp" "tests/recovery/decisions-audit.lisp"
   "tests/recovery/decisions-radix.lisp"
   "tests/recovery/decisions-support.lisp" "tests/recovery/decisions.lisp"
   "tests/recovery/inventory-support.lisp" "tests/recovery/inventory.lisp"
   "tests/recovery/manifest-audit.lisp" "tests/recovery/manifest-support.lisp"
   "tests/recovery/manifest.lisp" "tests/recovery/scan.lisp"
   "tests/recovery/support.lisp" "tests/scheduler/controller.lisp"
   "tests/scheduler/lifecycle.lisp" "tests/scheduler/support.lisp"
   "tests/series/boundaries.lisp" "tests/series/controller.lisp"
   "tests/series/support.lisp" "tests/series/threads.lisp"
   "tests/series/worker-bridge.lisp" "tests/series/worker-routing.lisp"
   "tests/smoke.lisp" "tests/storage/compaction-scan.lisp"
   "tests/storage/control-payload.lisp" "tests/storage/log-header.lisp"
   "tests/storage/segment-header.lisp" "tests/storage/support.lisp"
   "tests/wal/builder.lisp" "tests/wal/csn-threads.lisp" "tests/wal/csn.lisp"
   "tests/wal/fault.lisp" "tests/wal/group.lisp" "tests/wal/native.lisp"
   "tests/wal/support.lisp")
  :EXPECTED-TESTS
  (("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-WAL-006-SERIES-BOOTSTRAP-CAPACITY-OFFSET-CSN-AND-EFFECT-BOUNDARIES")
   ("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-WAL-006-SERIES-BOOTSTRAP-ACCEPTS-OPAQUE-NON-NIL-VALUES")
   ("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-AFF-004-SERIES-BOOTSTRAP-NIL-STALE-AND-REPEATED-BEFORE-EFFECT")
   ("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-AFF-004-SERIES-BOOTSTRAP-VIRGIN-GUARDS-AND-EXISTING-READER-ROOT")
   ("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-WAL-006-SERIES-BOOTSTRAP-REFUSES-USED-EMPTY-RING-WITH-NIL-ROOT")
   ("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-WAL-006-SERIES-BOOTSTRAP-FIRST-COMMIT-REQUIRES-INITIAL-ROOT-IDENTITY")
   ("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-AFF-001-SERIES-BOOTSTRAP-HEALTH-AND-RING-PRECEDE-EFFECT")
   ("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-AFF-001-SERIES-BOOTSTRAP-ACQUIRED-EFFECT-EXIT-PRESERVES-CAUSE-AND-ROOTS")
   ("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-AFF-001-SERIES-BOOTSTRAP-PREEXISTING-EFFECT-KEEPS-OUTER-OWNERSHIP")
   ("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-AFF-001-SERIES-BOOTSTRAP-CAS-CORRUPTION-KEEPS-FIRST-CONDITION-AND-FAULTS-ARCHIVE")
   ("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-AFF-001-SERIES-BOOTSTRAP-INCOMPLETE-END-PRESERVES-ERROR-AND-NONLOCAL-EXIT")
   ("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-CON-002-SERIES-BOOTSTRAP-READERS-SEE-ONLY-NIL-OR-COMPLETE-ROOT")
   ("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-CON-001-SERIES-BOOTSTRAP-FOREIGN-THREAD-CANNOT-USE-OWNER-LEASE")
   ("ARCDOCDB.GET.DIRECTORY.TESTS"
    "TEST-REQ-WAL-006-SERIES-GET-EMPTY-ACTIVE-INITIALIZATION-NATIVE-V1-V2")
   ("ARCDOCDB.GET.DIRECTORY.TESTS"
    "TEST-REQ-WAL-006-SERIES-GET-INITIAL-CONTROLLER-ROOT-AND-NIL-REFUSAL")
   ("ARCDOCDB.GET.DIRECTORY.TESTS"
    "TEST-REQ-IDX-001-SERIES-GET-EMPTY-ACTIVE-CLOSED-BEFORE-FIRST-BATCH-NATIVE-V1-V2")
   ("ARCDOCDB.GET.DIRECTORY.TESTS"
    "TEST-REQ-AFF-004-SERIES-GET-EMPTY-ACTIVE-CANDIDATE-FAULTED-NATIVE-V1-V2")
   ("ARCDOCDB.GET.DIRECTORY.TESTS"
    "TEST-REQ-WAL-006-SERIES-GET-EMPTY-ACTIVE-FIRST-BATCH-PUBLISH-AND-REUSE-NATIVE-V1-V2")
   ("ARCDOCDB.GET.DIRECTORY.TESTS"
    "TEST-REQ-WAL-006-SERIES-GET-EMPTY-ACTIVE-REPEATED-INITIALIZATION-REFUSED")
   ("ARCDOCDB.GET.DIRECTORY.TESTS"
    "TEST-REQ-WAL-006-SERIES-GET-EMPTY-ACTIVE-FOREIGN-OWNER-BEFORE-INITIALIZATION")
   ("ARCDOCDB.GET.DIRECTORY.TESTS"
    "TEST-REQ-WAL-006-SERIES-GET-EMPTY-ACTIVE-DUPLICATE-BEFORE-INITIALIZATION")
   ("ARCDOCDB.GET.DIRECTORY.TESTS"
    "TEST-REQ-CON-002-SERIES-GET-EMPTY-ACTIVE-LEASE-BEFORE-CHECKS")
   ("ARCDOCDB.GET.DIRECTORY.TESTS"
    "TEST-REQ-WAL-006-SERIES-GET-EMPTY-ACTIVE-FILE-FRONTIER-REFUSED")
   ("ARCDOCDB.GET.DIRECTORY.TESTS"
    "TEST-REQ-CMP-007-SERIES-GET-EMPTY-ACTIVE-FIXTURE-CLEANUP-NATIVE-V1-V2")
   ("ARCDOCDB.GET.DIRECTORY.TESTS"
    "TEST-REQ-WAL-006-SERIES-GET-EMPTY-ACTIVE-CLOSED-CAPABILITIES-REFUSED"))
  :REGISTERED-TESTS
  (("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-WAL-006-SERIES-BOOTSTRAP-CAPACITY-OFFSET-CSN-AND-EFFECT-BOUNDARIES")
   ("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-WAL-006-SERIES-BOOTSTRAP-ACCEPTS-OPAQUE-NON-NIL-VALUES")
   ("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-AFF-004-SERIES-BOOTSTRAP-NIL-STALE-AND-REPEATED-BEFORE-EFFECT")
   ("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-AFF-004-SERIES-BOOTSTRAP-VIRGIN-GUARDS-AND-EXISTING-READER-ROOT")
   ("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-WAL-006-SERIES-BOOTSTRAP-REFUSES-USED-EMPTY-RING-WITH-NIL-ROOT")
   ("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-WAL-006-SERIES-BOOTSTRAP-FIRST-COMMIT-REQUIRES-INITIAL-ROOT-IDENTITY")
   ("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-AFF-001-SERIES-BOOTSTRAP-HEALTH-AND-RING-PRECEDE-EFFECT")
   ("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-AFF-001-SERIES-BOOTSTRAP-ACQUIRED-EFFECT-EXIT-PRESERVES-CAUSE-AND-ROOTS")
   ("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-AFF-001-SERIES-BOOTSTRAP-PREEXISTING-EFFECT-KEEPS-OUTER-OWNERSHIP")
   ("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-AFF-001-SERIES-BOOTSTRAP-CAS-CORRUPTION-KEEPS-FIRST-CONDITION-AND-FAULTS-ARCHIVE")
   ("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-AFF-001-SERIES-BOOTSTRAP-INCOMPLETE-END-PRESERVES-ERROR-AND-NONLOCAL-EXIT")
   ("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-CON-002-SERIES-BOOTSTRAP-READERS-SEE-ONLY-NIL-OR-COMPLETE-ROOT")
   ("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-CON-001-SERIES-BOOTSTRAP-FOREIGN-THREAD-CANNOT-USE-OWNER-LEASE")
   ("ARCDOCDB.GET.DIRECTORY.TESTS"
    "TEST-REQ-WAL-006-SERIES-GET-EMPTY-ACTIVE-INITIALIZATION-NATIVE-V1-V2")
   ("ARCDOCDB.GET.DIRECTORY.TESTS"
    "TEST-REQ-WAL-006-SERIES-GET-INITIAL-CONTROLLER-ROOT-AND-NIL-REFUSAL")
   ("ARCDOCDB.GET.DIRECTORY.TESTS"
    "TEST-REQ-IDX-001-SERIES-GET-EMPTY-ACTIVE-CLOSED-BEFORE-FIRST-BATCH-NATIVE-V1-V2")
   ("ARCDOCDB.GET.DIRECTORY.TESTS"
    "TEST-REQ-AFF-004-SERIES-GET-EMPTY-ACTIVE-CANDIDATE-FAULTED-NATIVE-V1-V2")
   ("ARCDOCDB.GET.DIRECTORY.TESTS"
    "TEST-REQ-WAL-006-SERIES-GET-EMPTY-ACTIVE-FIRST-BATCH-PUBLISH-AND-REUSE-NATIVE-V1-V2")
   ("ARCDOCDB.GET.DIRECTORY.TESTS"
    "TEST-REQ-WAL-006-SERIES-GET-EMPTY-ACTIVE-REPEATED-INITIALIZATION-REFUSED")
   ("ARCDOCDB.GET.DIRECTORY.TESTS"
    "TEST-REQ-WAL-006-SERIES-GET-EMPTY-ACTIVE-FOREIGN-OWNER-BEFORE-INITIALIZATION")
   ("ARCDOCDB.GET.DIRECTORY.TESTS"
    "TEST-REQ-WAL-006-SERIES-GET-EMPTY-ACTIVE-DUPLICATE-BEFORE-INITIALIZATION")
   ("ARCDOCDB.GET.DIRECTORY.TESTS"
    "TEST-REQ-CON-002-SERIES-GET-EMPTY-ACTIVE-LEASE-BEFORE-CHECKS")
   ("ARCDOCDB.GET.DIRECTORY.TESTS"
    "TEST-REQ-WAL-006-SERIES-GET-EMPTY-ACTIVE-FILE-FRONTIER-REFUSED")
   ("ARCDOCDB.GET.DIRECTORY.TESTS"
    "TEST-REQ-CMP-007-SERIES-GET-EMPTY-ACTIVE-FIXTURE-CLEANUP-NATIVE-V1-V2")
   ("ARCDOCDB.GET.DIRECTORY.TESTS"
    "TEST-REQ-WAL-006-SERIES-GET-EMPTY-ACTIVE-CLOSED-CAPABILITIES-REFUSED"))
  :PASSED-TESTS
  (("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-WAL-006-SERIES-BOOTSTRAP-CAPACITY-OFFSET-CSN-AND-EFFECT-BOUNDARIES")
   ("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-WAL-006-SERIES-BOOTSTRAP-ACCEPTS-OPAQUE-NON-NIL-VALUES")
   ("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-AFF-004-SERIES-BOOTSTRAP-NIL-STALE-AND-REPEATED-BEFORE-EFFECT")
   ("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-AFF-004-SERIES-BOOTSTRAP-VIRGIN-GUARDS-AND-EXISTING-READER-ROOT")
   ("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-WAL-006-SERIES-BOOTSTRAP-REFUSES-USED-EMPTY-RING-WITH-NIL-ROOT")
   ("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-WAL-006-SERIES-BOOTSTRAP-FIRST-COMMIT-REQUIRES-INITIAL-ROOT-IDENTITY")
   ("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-AFF-001-SERIES-BOOTSTRAP-HEALTH-AND-RING-PRECEDE-EFFECT")
   ("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-AFF-001-SERIES-BOOTSTRAP-ACQUIRED-EFFECT-EXIT-PRESERVES-CAUSE-AND-ROOTS")
   ("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-AFF-001-SERIES-BOOTSTRAP-PREEXISTING-EFFECT-KEEPS-OUTER-OWNERSHIP")
   ("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-AFF-001-SERIES-BOOTSTRAP-CAS-CORRUPTION-KEEPS-FIRST-CONDITION-AND-FAULTS-ARCHIVE")
   ("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-AFF-001-SERIES-BOOTSTRAP-INCOMPLETE-END-PRESERVES-ERROR-AND-NONLOCAL-EXIT")
   ("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-CON-002-SERIES-BOOTSTRAP-READERS-SEE-ONLY-NIL-OR-COMPLETE-ROOT")
   ("ARCDOCDB.SERIES.TESTS"
    "TEST-REQ-CON-001-SERIES-BOOTSTRAP-FOREIGN-THREAD-CANNOT-USE-OWNER-LEASE")
   ("ARCDOCDB.GET.DIRECTORY.TESTS"
    "TEST-REQ-WAL-006-SERIES-GET-EMPTY-ACTIVE-INITIALIZATION-NATIVE-V1-V2")
   ("ARCDOCDB.GET.DIRECTORY.TESTS"
    "TEST-REQ-WAL-006-SERIES-GET-INITIAL-CONTROLLER-ROOT-AND-NIL-REFUSAL")
   ("ARCDOCDB.GET.DIRECTORY.TESTS"
    "TEST-REQ-IDX-001-SERIES-GET-EMPTY-ACTIVE-CLOSED-BEFORE-FIRST-BATCH-NATIVE-V1-V2")
   ("ARCDOCDB.GET.DIRECTORY.TESTS"
    "TEST-REQ-AFF-004-SERIES-GET-EMPTY-ACTIVE-CANDIDATE-FAULTED-NATIVE-V1-V2")
   ("ARCDOCDB.GET.DIRECTORY.TESTS"
    "TEST-REQ-WAL-006-SERIES-GET-EMPTY-ACTIVE-FIRST-BATCH-PUBLISH-AND-REUSE-NATIVE-V1-V2")
   ("ARCDOCDB.GET.DIRECTORY.TESTS"
    "TEST-REQ-WAL-006-SERIES-GET-EMPTY-ACTIVE-REPEATED-INITIALIZATION-REFUSED")
   ("ARCDOCDB.GET.DIRECTORY.TESTS"
    "TEST-REQ-WAL-006-SERIES-GET-EMPTY-ACTIVE-FOREIGN-OWNER-BEFORE-INITIALIZATION")
   ("ARCDOCDB.GET.DIRECTORY.TESTS"
    "TEST-REQ-WAL-006-SERIES-GET-EMPTY-ACTIVE-DUPLICATE-BEFORE-INITIALIZATION")
   ("ARCDOCDB.GET.DIRECTORY.TESTS"
    "TEST-REQ-CON-002-SERIES-GET-EMPTY-ACTIVE-LEASE-BEFORE-CHECKS")
   ("ARCDOCDB.GET.DIRECTORY.TESTS"
    "TEST-REQ-WAL-006-SERIES-GET-EMPTY-ACTIVE-FILE-FRONTIER-REFUSED")
   ("ARCDOCDB.GET.DIRECTORY.TESTS"
    "TEST-REQ-CMP-007-SERIES-GET-EMPTY-ACTIVE-FIXTURE-CLEANUP-NATIVE-V1-V2")
   ("ARCDOCDB.GET.DIRECTORY.TESTS"
    "TEST-REQ-WAL-006-SERIES-GET-EMPTY-ACTIVE-CLOSED-CAPABILITIES-REFUSED"))
  :FAILED-TEST NIL :FAILURE-KIND NIL :SOURCE-MANIFEST
  ((:FILE "arcdocdb.asd" :SHA256
    "94b6664c5f86352d2fc34898fc41c2779148480966337dc3cd8b27290f80f518")
   (:FILE "src/active/package.lisp" :SHA256
    "4a6fa4187ef5d44aec4e65d57ee6d6046485f283cc9009c1d94263bee745fa3b")
   (:FILE "src/active/preflight.lisp" :SHA256
    "ef7b592daecc223d78cbcda138b5938abc01593b486482bec06f2721cfd955a2")
   (:FILE "src/active/prepare.lisp" :SHA256
    "7b45fb01132c45c9bec76f374edaa8de91ac6bb2d61ae5c359e1fa10c6346f53")
   (:FILE "src/active/source.lisp" :SHA256
    "ff96fe360b46190ecc08ee9e05a813715dc3399054f93693f9309012aec6547d")
   (:FILE "src/active/types.lisp" :SHA256
    "48fe584096fc253ef182ab428c1887e443af06d75aaa938df660c77e60b39bfb")
   (:FILE "src/cache/build.lisp" :SHA256
    "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0")
   (:FILE "src/cache/clock.lisp" :SHA256
    "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f")
   (:FILE "src/cache/core.lisp" :SHA256
    "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4")
   (:FILE "src/cache/package.lisp" :SHA256
    "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848")
   (:FILE "src/cache/read.lisp" :SHA256
    "5700e43ae8ee859e96bdecb5953af43a712fd9e6ec23a53565759676bb07f85a")
   (:FILE "src/cache/types.lisp" :SHA256
    "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30")
   (:FILE "src/cache/write.lisp" :SHA256
    "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8")
   (:FILE "src/codec/cbor-float-minimal.lisp" :SHA256
    "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
   (:FILE "src/codec/cbor-float-narrow.lisp" :SHA256
    "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb")
   (:FILE "src/codec/cbor-float-write.lisp" :SHA256
    "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442")
   (:FILE "src/codec/cbor-header.lisp" :SHA256
    "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
   (:FILE "src/codec/cbor-minimal.lisp" :SHA256
    "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
   (:FILE "src/codec/cbor-package.lisp" :SHA256
    "c2a6fe51760c871705e4cf213ada92fed140fac26cf177d06889e18ab87fb45b")
   (:FILE "src/codec/cbor-scan-input.lisp" :SHA256
    "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
   (:FILE "src/codec/cbor-scan-items.lisp" :SHA256
    "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
   (:FILE "src/codec/cbor-scan-minimal.lisp" :SHA256
    "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
   (:FILE "src/codec/cbor-scan-stack.lisp" :SHA256
    "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
   (:FILE "src/codec/cbor-scan.lisp" :SHA256
    "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
   (:FILE "src/codec/cbor-simple-write.lisp" :SHA256
    "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e")
   (:FILE "src/codec/cbor-space.lisp" :SHA256
    "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
   (:FILE "src/codec/cbor-string-write.lisp" :SHA256
    "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727")
   (:FILE "src/codec/cbor-write.lisp" :SHA256
    "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
   (:FILE "src/codec/package.lisp" :SHA256
    "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
   (:FILE "src/codec/utf8.lisp" :SHA256
    "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
   (:FILE "src/control/build.lisp" :SHA256
    "1904e81a6cebbb178598a41e1b2283240fc21506781b1e31da407610ce0f519c")
   (:FILE "src/control/dependency.lisp" :SHA256
    "f328344e4824fd53d03a0476b45fb87efada43ddee895e13afd76ac44413d128")
   (:FILE "src/control/package.lisp" :SHA256
    "405b91843049e7f9e38896535ad615886443852b39eb0687c29e44dbd675429d")
   (:FILE "src/control/preflight.lisp" :SHA256
    "48326533ac0934cb3b1e3fc7657ef48f38912b6c08e9e38367301905f7711584")
   (:FILE "src/control/prepare.lisp" :SHA256
    "878b15074bfcb3f3aec784e78e545f1ae617539b9ddcb975504880cb000b7f87")
   (:FILE "src/control/transfer.lisp" :SHA256
    "6e257bfb6ce8e6d11263cc6788de4fc35657a82e159af7b46341c3bb208e0275")
   (:FILE "src/control/types.lisp" :SHA256
    "7f7932e0c38d3fa26273342df2be2da436024ff9a9a647c8a3dc5c65c452f563")
   (:FILE "src/csn/package.lisp" :SHA256
    "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0")
   (:FILE "src/csn/registry.lisp" :SHA256
    "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a")
   (:FILE "src/epochs/core.lisp" :SHA256
    "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399")
   (:FILE "src/epochs/package.lisp" :SHA256
    "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd")
   (:FILE "src/epochs/read.lisp" :SHA256
    "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905")
   (:FILE "src/epochs/reclaim.lisp" :SHA256
    "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202")
   (:FILE "src/epochs/retire.lisp" :SHA256
    "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b")
   (:FILE "src/epochs/types.lisp" :SHA256
    "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097")
   (:FILE "src/execution/handoff.lisp" :SHA256
    "3ce9f47008416f210173fd3a83ee7665b2103f26039d36e2601b31e5e3ebd72a")
   (:FILE "src/execution/package.lisp" :SHA256
    "833e501e6ee6e3acb8a6d37139c4605a05e06c425a35318adbcf651aa2f9db30")
   (:FILE "src/execution/queue.lisp" :SHA256
    "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90")
   (:FILE "src/execution/ready-recycle.lisp" :SHA256
    "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b")
   (:FILE "src/execution/ready-types.lisp" :SHA256
    "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f")
   (:FILE "src/execution/ready.lisp" :SHA256
    "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327")
   (:FILE "src/execution/worker-boundary.lisp" :SHA256
    "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a")
   (:FILE "src/execution/worker-claim.lisp" :SHA256
    "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e")
   (:FILE "src/execution/worker-run.lisp" :SHA256
    "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542")
   (:FILE "src/execution/worker-types.lisp" :SHA256
    "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317")
   (:FILE "src/execution/writer.lisp" :SHA256
    "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105")
   (:FILE "src/foundation/batch.lisp" :SHA256
    "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
   (:FILE "src/foundation/binary.lisp" :SHA256
    "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
   (:FILE "src/foundation/conditions.lisp" :SHA256
    "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
   (:FILE "src/foundation/crc32c.lisp" :SHA256
    "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
   (:FILE "src/foundation/package.lisp" :SHA256
    "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
   (:FILE "src/foundation/record.lisp" :SHA256
    "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
   (:FILE "src/get-directory/build.lisp" :SHA256
    "9bebb3cd9d66a8ec2fd0c72ad828e00ab2347093642653da45ef263bc855f947")
   (:FILE "src/get-directory/package.lisp" :SHA256
    "e779202c8df502749a81d0c6f9f0d505d000e09231f3679b1a91303fbcbf36f9")
   (:FILE "src/get-directory/read.lisp" :SHA256
    "a2287eb7e91bed84f3727baaf81376bbe5bf5df15cde1ea268c6d2fa66fe0a5d")
   (:FILE "src/get-directory/sources-read.lisp" :SHA256
    "ee4a3b81322fbd51ce928be0b73e9bc180af7ed39f936b68ec9a152dd2a180c2")
   (:FILE "src/get-directory/sources-types.lisp" :SHA256
    "862342b07d6a8aae834aaf3da4149682fcd1dcbdae971adad640597583547099")
   (:FILE "src/get-directory/types.lisp" :SHA256
    "0e2348291a4994f45bd1f6fe5efdc66041d2fdce18641d1af11b6c850ed69b2b")
   (:FILE "src/get-resolver/active-build.lisp" :SHA256
    "0eed95930d41c515965ae8ab0a14fbb94597a42ea38b86f205ea0938cf4631de")
   (:FILE "src/get-resolver/active-directory.lisp" :SHA256
    "c2b9a9ac3209270e9949720473908460548430a8098c9199fb55d2317a87682b")
   (:FILE "src/get-resolver/active-init.lisp" :SHA256
    "2f9380674cf4b590b071ab9d769a4b79292f544d920c0fc5ff33146dde7686f6")
   (:FILE "src/get-resolver/active-preflight.lisp" :SHA256
    "eb56f5704666cac3a88ec97f58f70c7d61db2e8feea6a094db4c468a1a2775a9")
   (:FILE "src/get-resolver/active-read.lisp" :SHA256
    "47630e5d42c785e39e15dd714177cd86159129a5391d82321385f92317bea659")
   (:FILE "src/get-resolver/active-scan.lisp" :SHA256
    "97dd4f59d4449334b113e9403a208007ed1a398a9b53f88bda3e3c0bbf3a1067")
   (:FILE "src/get-resolver/active-types.lisp" :SHA256
    "a3cb954a265b263e0e03d2f1a80824589670efbf89adcd69007987d26df2e29a")
   (:FILE "src/get-resolver/build.lisp" :SHA256
    "c649c80c2b510669fc1c0a7f15b3080b7fb46a3423a1e49db5bb9ff248176e0a")
   (:FILE "src/get-resolver/package.lisp" :SHA256
    "663a5a15a630ed2b9042a3a3365598358df97d3dd1cd3d7610b283526281f39a")
   (:FILE "src/get-resolver/read.lisp" :SHA256
    "dd100bb17e15589124916767f8a690ae683ac8c462102c778639f917a5f1924d")
   (:FILE "src/get-resolver/rows.lisp" :SHA256
    "d9db85d788006fc7ad1f9a7cdeef28b992605de7fac8c295dd7fdc51f5511854")
   (:FILE "src/get-resolver/scan.lisp" :SHA256
    "35a1780c6bf66364ef94c4151fa91f02eebe359f0ca0639985d2a907fd9d512d")
   (:FILE "src/get-resolver/sort.lisp" :SHA256
    "974bf44efeb1cd26c5e9db0601aea295c8f1a18234894ad9d41938a2880e2255")
   (:FILE "src/get-resolver/types.lisp" :SHA256
    "b847d6c388f4d052a2d707b7c410cc7c2ef60482fb5cd9ef384c016c31d1dc00")
   (:FILE "src/get/build.lisp" :SHA256
    "bcfc4916e9a85833dc151c4ce176bc905f2c03b6bc6d636f97a60df0d8c16739")
   (:FILE "src/get/lifecycle.lisp" :SHA256
    "885ba4141114ea411cac37c9b5f924aaa7f9f2a5ba311ebf92a392e5da1e3c59")
   (:FILE "src/get/lookup.lisp" :SHA256
    "9d1042d4cf1e7bd9c6d1153de12b2459e7a2724e47bd32534cd7ae56cb274c5f")
   (:FILE "src/get/package.lisp" :SHA256
    "87b795779aef0c4b918a039d182daddd22b902a9ad10c763df4364b7e630151c")
   (:FILE "src/get/segment.lisp" :SHA256
    "4a486528cb2c1cc3471cb4b332d4314d24011889e1f885db6fd5600bb077eea3")
   (:FILE "src/get/target.lisp" :SHA256
    "9f682f735e49108cad176a6143ec99e1be64da98f29cae0b52f9b49cdea34250")
   (:FILE "src/get/types.lisp" :SHA256
    "653b23a6e719cd1f55e7c58b4d7e8143aec5983992ba210d0eac1f4c8682f623")
   (:FILE "src/hash/arithmetic.lisp" :SHA256
    "c439e534b768acb123d69b921b85e1e56683aa8335bbc87efba95fe95f256fa9")
   (:FILE "src/hash/blocks.lisp" :SHA256
    "5f5dff95ae6c34dfc15538c537ba2fa8d34ba2376ad66ad9975745ea13a2175f")
   (:FILE "src/hash/hash64.lisp" :SHA256
    "99e4c8394a8f877ce1f552f15a57a082c0ec81015e87119ee4ffea28cf3ae77f")
   (:FILE "src/hash/package.lisp" :SHA256
    "1e7668fa26fc1a8e3b3cfe824aa3e08b30b57441d5f90d44453fc3a9259a10d0")
   (:FILE "src/index/core.lisp" :SHA256
    "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff")
   (:FILE "src/index/hash-digests.lisp" :SHA256
    "924bb7dab91ff56c1e909f2b06dff5f74b443ac6442e379498f29b25f1fa2673")
   (:FILE "src/index/hash-seed.lisp" :SHA256
    "ae86514101e95737747ba58a4f0c5dc1ddb44d2b3a18bceb8fd0d0756b57a7a1")
   (:FILE "src/index/package.lisp" :SHA256
    "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507")
   (:FILE "src/index/primary-arena.lisp" :SHA256
    "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5")
   (:FILE "src/index/primary-build.lisp" :SHA256
    "06ca5ac8c03504e2d2f973873e5cabf7518c090cd1f8f2118c46e0ea2f9bf37b")
   (:FILE "src/index/primary-core.lisp" :SHA256
    "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e")
   (:FILE "src/index/primary-directory.lisp" :SHA256
    "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd")
   (:FILE "src/index/primary-package.lisp" :SHA256
    "0682eb9a61596506b6788bd0285f9808db2496246caae64ab3203182ed46b860")
   (:FILE "src/index/primary-probe.lisp" :SHA256
    "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4")
   (:FILE "src/index/primary-read.lisp" :SHA256
    "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f")
   (:FILE "src/index/primary-relocate.lisp" :SHA256
    "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20")
   (:FILE "src/index/primary-types.lisp" :SHA256
    "f17ca0dcd8a538b921f00044e23872b28272638c4435eacd30f0509422505e64")
   (:FILE "src/index/primary-write.lisp" :SHA256
    "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655")
   (:FILE "src/index/read.lisp" :SHA256
    "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7")
   (:FILE "src/index/rebuild-budget.lisp" :SHA256
    "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0")
   (:FILE "src/index/rebuild-copy.lisp" :SHA256
    "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee")
   (:FILE "src/index/rebuild-scan.lisp" :SHA256
    "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e")
   (:FILE "src/index/rebuild.lisp" :SHA256
    "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1")
   (:FILE "src/index/relocate.lisp" :SHA256
    "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc")
   (:FILE "src/index/types.lisp" :SHA256
    "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e")
   (:FILE "src/index/validation.lisp" :SHA256
    "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a")
   (:FILE "src/index/write.lisp" :SHA256
    "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28")
   (:FILE "src/io/flush.lisp" :SHA256
    "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325")
   (:FILE "src/io/identity-types.lisp" :SHA256
    "5794dd5094f34c24e7e09e4a7937f1988d85ea9cd37e478abaf836273da5d5c1")
   (:FILE "src/io/identity.lisp" :SHA256
    "d2b6f7932b66f2ef74241e573ed253cf9b710f217cd570ef23f6671614d90a2c")
   (:FILE "src/io/lifecycle.lisp" :SHA256
    "baa1f763fe0f394a14d381b753dcb1be1e90eb03eaff5d6469465b5d4eca015f")
   (:FILE "src/io/native.lisp" :SHA256
    "74f63dbb2137a344054e82c6707e6262473b3332ff66a85f79ecfee9fd50f9b4")
   (:FILE "src/io/package.lisp" :SHA256
    "a2437f320b170b4e8df8684ee9b61ab317b8aa10d3c107461450551ff7aec4bd")
   (:FILE "src/io/transfer.lisp" :SHA256
    "c807f294d0211e8433f8f0332ab6ba3ce7d9ae7de3818f43af7ff8d7fcfd341a")
   (:FILE "src/io/types.lisp" :SHA256
    "63e3c4af997e26aaa48cb1df6298aaf97bb3971b88e59e8b7fa2c3736617450a")
   (:FILE "src/mvcc/package.lisp" :SHA256
    "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c")
   (:FILE "src/mvcc/snapshots-core.lisp" :SHA256
    "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998")
   (:FILE "src/mvcc/snapshots-csn.lisp" :SHA256
    "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77")
   (:FILE "src/mvcc/snapshots-lifecycle.lisp" :SHA256
    "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082")
   (:FILE "src/mvcc/snapshots-read.lisp" :SHA256
    "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9")
   (:FILE "src/mvcc/snapshots-register.lisp" :SHA256
    "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b")
   (:FILE "src/mvcc/snapshots-types.lisp" :SHA256
    "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f")
   (:FILE "src/mvcc/types.lisp" :SHA256
    "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50")
   (:FILE "src/package.lisp" :SHA256
    "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
   (:FILE "src/read/core.lisp" :SHA256
    "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f")
   (:FILE "src/read/package.lisp" :SHA256
    "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df")
   (:FILE "src/read/task.lisp" :SHA256
    "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2")
   (:FILE "src/read/types.lisp" :SHA256
    "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c")
   (:FILE "src/recovery/decisions-build.lisp" :SHA256
    "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115")
   (:FILE "src/recovery/decisions-package.lisp" :SHA256
    "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39")
   (:FILE "src/recovery/decisions-query.lisp" :SHA256
    "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24")
   (:FILE "src/recovery/decisions-radix.lisp" :SHA256
    "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54")
   (:FILE "src/recovery/decisions-sort.lisp" :SHA256
    "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2")
   (:FILE "src/recovery/decisions-types.lisp" :SHA256
    "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c")
   (:FILE "src/recovery/inventory-build.lisp" :SHA256
    "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e")
   (:FILE "src/recovery/inventory-query.lisp" :SHA256
    "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb")
   (:FILE "src/recovery/inventory-types.lisp" :SHA256
    "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9")
   (:FILE "src/recovery/manifest-build.lisp" :SHA256
    "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471")
   (:FILE "src/recovery/manifest-decode.lisp" :SHA256
    "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779")
   (:FILE "src/recovery/manifest-fold.lisp" :SHA256
    "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730")
   (:FILE "src/recovery/manifest-package.lisp" :SHA256
    "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc")
   (:FILE "src/recovery/manifest-query.lisp" :SHA256
    "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b")
   (:FILE "src/recovery/manifest-types.lisp" :SHA256
    "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10")
   (:FILE "src/recovery/package.lisp" :SHA256
    "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9")
   (:FILE "src/recovery/scan.lisp" :SHA256
    "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218")
   (:FILE "src/scheduler/build.lisp" :SHA256
    "58baf595f221826c64e3fb38344242c3bdf403d65904193bf1a8e06e09d7c336")
   (:FILE "src/scheduler/lifecycle-build.lisp" :SHA256
    "d6d67faf8721f26e7fcd228d6ab9a7dfdc36ff5ec56c67ed9e5fb6d914006a9e")
   (:FILE "src/scheduler/lifecycle-read.lisp" :SHA256
    "c60e1d5f67eeafb216b374fa001d27f87d1a734c5d066fc092902c0301069200")
   (:FILE "src/scheduler/lifecycle-types.lisp" :SHA256
    "4fe980e00f1d273e9b8278cd2daace6b4a9e4ab948ddfac83b79f4b0c537cb7c")
   (:FILE "src/scheduler/lifecycle-update.lisp" :SHA256
    "2020e46809e9fe8fa74e061a420b8085679d5f461eabd8b044f3975c1024800e")
   (:FILE "src/scheduler/lifecycle-worker.lisp" :SHA256
    "ec8b462ff3f5f7a6435f0f0c01b62034d8de2a784a9e354d469a0adfec9cf837")
   (:FILE "src/scheduler/package.lisp" :SHA256
    "5a139172de1648b30e09fdc6fc068141299c2034702f8d5b5f44bb0de14a3112")
   (:FILE "src/scheduler/policy.lisp" :SHA256
    "92b3ca3a81ae0b3ac342a63e5fe5c5d7524091a63065b0232c14c57ee80c4aac")
   (:FILE "src/scheduler/read.lisp" :SHA256
    "5cdc1e5b7ba97c9aab66a5acaf74336b0df33144e24104e0242b7fc2552a1ae2")
   (:FILE "src/scheduler/types.lisp" :SHA256
    "3b174be0919f8b27312ada4071d831c3753d62bb12be99d7e9394c48dcab474a")
   (:FILE "src/scheduler/update.lisp" :SHA256
    "e35a704ee0b9445c559a768de048169a8e39837a6df21843d8df58215c482472")
   (:FILE "src/series/events.lisp" :SHA256
    "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7")
   (:FILE "src/series/io-events.lisp" :SHA256
    "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546")
   (:FILE "src/series/ownership.lisp" :SHA256
    "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4")
   (:FILE "src/series/package.lisp" :SHA256
    "9a402f5225860c483dec9064a84d6462d28f5377a27977a63f64a5fbdbdd3764")
   (:FILE "src/series/publication.lisp" :SHA256
    "5de121c83ea6bd1243e420d9d898102aebb054cd1fa7ac79fcde9bf0792a95d8")
   (:FILE "src/series/query.lisp" :SHA256
    "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9")
   (:FILE "src/series/retirement.lisp" :SHA256
    "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059")
   (:FILE "src/series/routing-build.lisp" :SHA256
    "70135e73ecb1f6080683dd615c47a50530485061797382d74441743cd9a0f92d")
   (:FILE "src/series/routing-select.lisp" :SHA256
    "796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a")
   (:FILE "src/series/routing-types.lisp" :SHA256
    "31ae51c0fb11a802164a4d1e11ec63f835a2c67b52c751c5685bcc8947e5e0f1")
   (:FILE "src/series/types.lisp" :SHA256
    "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9")
   (:FILE "src/series/worker-boundary.lisp" :SHA256
    "793d401d1b9acc7b67923d815560f277f3d390ca050740f735f07d88dbacfe73")
   (:FILE "src/series/worker-package.lisp" :SHA256
    "dcab7a17e4fabcf256c2eddfb655d18145a1d789dd8d64a889945badc418e4b7")
   (:FILE "src/series/worker-run.lisp" :SHA256
    "f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f")
   (:FILE "src/series/worker-types.lisp" :SHA256
    "a366799fd9b938bfaa48b0ffda228ff8369ab9acb5b5ead7f081dfc66ab2c81a")
   (:FILE "src/storage/compaction-scan.lisp" :SHA256
    "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d")
   (:FILE "src/storage/control-payload.lisp" :SHA256
    "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491")
   (:FILE "src/storage/formats.lisp" :SHA256
    "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f")
   (:FILE "src/storage/log-header.lisp" :SHA256
    "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81")
   (:FILE "src/storage/package.lisp" :SHA256
    "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e")
   (:FILE "src/storage/payload-record.lisp" :SHA256
    "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7")
   (:FILE "src/storage/payload-write.lisp" :SHA256
    "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc")
   (:FILE "src/storage/segment-header.lisp" :SHA256
    "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011")
   (:FILE "src/wal/builder.lisp" :SHA256
    "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0")
   (:FILE "src/wal/csn.lisp" :SHA256
    "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810")
   (:FILE "src/wal/executor.lisp" :SHA256
    "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8")
   (:FILE "src/wal/group.lisp" :SHA256
    "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b")
   (:FILE "src/wal/package.lisp" :SHA256
    "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89")
   (:FILE "src/wal/types.lisp" :SHA256
    "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e")
   (:FILE "tests/codec/cbor-float-write-support.lisp" :SHA256
    "158f18dcf4b2d7e5562713caa3625aeba16dd1eba21f4413345e8a10b616c748")
   (:FILE "tests/codec/cbor-float-write-threads.lisp" :SHA256
    "96a1b205c01f75e271684132ff3e48b4da5cf8a01210257b591ec4951f097043")
   (:FILE "tests/codec/cbor-float-write.lisp" :SHA256
    "2d163a64bff4b9d9b9de576c4a4df05f4d8853f1c3d039e790cbb827be98c8b6")
   (:FILE "tests/codec/cbor-header.lisp" :SHA256
    "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815")
   (:FILE "tests/codec/cbor-minimal-edges.lisp" :SHA256
    "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70")
   (:FILE "tests/codec/cbor-minimal-scan-support.lisp" :SHA256
    "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421")
   (:FILE "tests/codec/cbor-minimal-scan-threads.lisp" :SHA256
    "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660")
   (:FILE "tests/codec/cbor-minimal-scan.lisp" :SHA256
    "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8")
   (:FILE "tests/codec/cbor-minimal-support.lisp" :SHA256
    "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a")
   (:FILE "tests/codec/cbor-minimal-threads.lisp" :SHA256
    "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2")
   (:FILE "tests/codec/cbor-minimal.lisp" :SHA256
    "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3")
   (:FILE "tests/codec/cbor-simple-write-support.lisp" :SHA256
    "53ceafc72a027a2ff1f787900558ff26f2ff70bbb212f1b37926a6d520fbe86e")
   (:FILE "tests/codec/cbor-simple-write-threads.lisp" :SHA256
    "77074033e75a224fd02e890f98dffa8e97d3a1f8bedd510b00ea55d8ff8687b2")
   (:FILE "tests/codec/cbor-simple-write.lisp" :SHA256
    "958bdd3901cfc41032c09d6c9023b192799981884e09ce3573256ff45bc5329a")
   (:FILE "tests/codec/cbor-string-write-support.lisp" :SHA256
    "2cbdb601f442a56456bc637c94e759cc965f44b178268dce3c636c385d34fc39")
   (:FILE "tests/codec/cbor-string-write-threads.lisp" :SHA256
    "8e07b881a55e2554a429f1c8b2c69f67862ac015217d90d019167d636564d27d")
   (:FILE "tests/codec/cbor-string-write.lisp" :SHA256
    "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115")
   (:FILE "tests/codec/cbor-structure-support.lisp" :SHA256
    "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
   (:FILE "tests/codec/cbor-structure-threads.lisp" :SHA256
    "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645")
   (:FILE "tests/codec/cbor-structure.lisp" :SHA256
    "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110")
   (:FILE "tests/codec/cbor-support.lisp" :SHA256
    "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
   (:FILE "tests/codec/cbor-threads.lisp" :SHA256
    "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14")
   (:FILE "tests/codec/cbor-write-roundtrip.lisp" :SHA256
    "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344")
   (:FILE "tests/codec/cbor-write-support.lisp" :SHA256
    "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6")
   (:FILE "tests/codec/cbor-write-threads.lisp" :SHA256
    "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb")
   (:FILE "tests/codec/cbor-write.lisp" :SHA256
    "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3")
   (:FILE "tests/codec/support.lisp" :SHA256
    "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96")
   (:FILE "tests/codec/threads.lisp" :SHA256
    "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337")
   (:FILE "tests/codec/utf8.lisp" :SHA256
    "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100")
   (:FILE "tests/csn/registry.lisp" :SHA256
    "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950")
   (:FILE "tests/csn/support.lisp" :SHA256
    "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db")
   (:FILE "tests/csn/threads.lisp" :SHA256
    "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2")
   (:FILE "tests/epochs/lifecycle.lisp" :SHA256
    "ddc2fbdad9f97d2e4ff008c167776a50b17b742398306fbd5198dca474559cbf")
   (:FILE "tests/epochs/support.lisp" :SHA256
    "366be7af4bf6c4ed946b3fa9e97aea6b034c83e3b757d81c54078dc76d229b6d")
   (:FILE "tests/epochs/threads.lisp" :SHA256
    "54b73e06c61e64f32a3e3af0791891dacb6590e929163dcf0fac95f2c71e66fd")
   (:FILE "tests/execution/handoff.lisp" :SHA256
    "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e")
   (:FILE "tests/execution/queue.lisp" :SHA256
    "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722")
   (:FILE "tests/execution/ready-recycle.lisp" :SHA256
    "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae")
   (:FILE "tests/execution/ready.lisp" :SHA256
    "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e")
   (:FILE "tests/execution/support.lisp" :SHA256
    "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43")
   (:FILE "tests/execution/threads.lisp" :SHA256
    "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359")
   (:FILE "tests/execution/worker.lisp" :SHA256
    "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06")
   (:FILE "tests/foundation/batch.lisp" :SHA256
    "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183")
   (:FILE "tests/foundation/binary.lisp" :SHA256
    "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe")
   (:FILE "tests/foundation/record.lisp" :SHA256
    "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8")
   (:FILE "tests/foundation/support.lisp" :SHA256
    "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
   (:FILE "tests/get-directory/construction.lisp" :SHA256
    "4ce9aa7064793e908008b9e1055c1e2527d5071006782ea956509c28e8c712d7")
   (:FILE "tests/get-directory/read.lisp" :SHA256
    "a222541b6413bb93ff86a269273f1fa15bfad0d1e4072fc058b023fec5143280")
   (:FILE "tests/get-directory/series-read.lisp" :SHA256
    "4b9856d69cd82c1462c87d16b9eb8e00fb642a46bb22f2f7b01865f7cc2a83a4")
   (:FILE "tests/get-directory/series-support.lisp" :SHA256
    "40f15fbdf42b80515cbfc57eb74bedcbd96d4a9e7e19dc25d8db59f326fe659a")
   (:FILE "tests/get-directory/support.lisp" :SHA256
    "be3a216a6ec597b63186b6bf3d3e35f3327f3001b1c00535d64b10bcb5d9fe85")
   (:FILE "tests/get-directory/threads.lisp" :SHA256
    "e6a93ec22bc6f5a31b37ae99d927d1ca3a53893adb2eae21cd89d132a82d1f64")
   (:FILE "tests/get-performance/guards.lisp" :SHA256
    "c41721b917ed443355ea3707efdd07e7da53a978c0515ab1e5ede5fcc47d63fc")
   (:FILE "tests/get-performance/paths.lisp" :SHA256
    "3b8d2c9c93467507ea2bb471d42192eb1fa084b55c0f4263b5ef0d3acf468f55")
   (:FILE "tests/get-performance/support.lisp" :SHA256
    "e586ed94dcb2aaba00282931cdd83313e4f84a86d4d1ba85e2d56e8b7433ed8d")
   (:FILE "tests/get-performance/threads.lisp" :SHA256
    "05ace5eb351ab49da59611dc1a2a5abedb9d723a2fc6e75a30fc76e507573a90")
   (:FILE "tests/get-resolver/construction.lisp" :SHA256
    "45cbef3b35db35d60a4cec2516c24f6ef56f5edb2f19f6f07f24fe00c8737b13")
   (:FILE "tests/get-resolver/read.lisp" :SHA256
    "70e46d1b88716f44309f46b4955928ca7fa2195edd80bb67d5b97732b971e8fb")
   (:FILE "tests/get-resolver/sort.lisp" :SHA256
    "fd7f97f0fad2e970b972688481c0c132f11c85f5fdcd0f02bee6b0b3f93b97ae")
   (:FILE "tests/get-resolver/support.lisp" :SHA256
    "d30a5c8a61b63e339facfee9f7701eb5a3614bbfd1ebef2c46c747d136640f8b")
   (:FILE "tests/get/lifecycle.lisp" :SHA256
    "73bf87c2aee7b537dba31fc0ae554272f7d2be5a4c1e9e96ea2f21a17f6f71f5")
   (:FILE "tests/get/segment.lisp" :SHA256
    "e9722f419ce0810c98c28d0e1a74da85d52346a0befff40c1119934519fc6f98")
   (:FILE "tests/get/support.lisp" :SHA256
    "21f0da34755882f7dcc3ee760528ca39d4731e1a79ea94525c62753b7f60422c")
   (:FILE "tests/hash/guards.lisp" :SHA256
    "9af5b38443a57d224990a68e93f12f7a4cda306f94c7ccd3ccb50635865d7864")
   (:FILE "tests/hash/hash64.lisp" :SHA256
    "70606bc68807143cfea9583871474c84efc868d13692cde28488284dee43e0f1")
   (:FILE "tests/hash/support.lisp" :SHA256
    "0fae9dc36976af544f83e6051b9cf9d67c9bef0b9e25f1fa2a48fdac48592acb")
   (:FILE "tests/hash/threads.lisp" :SHA256
    "3fc587a57d26a294aebfc6a7aeadf2f61a42a21106c1c57517f891b76b4e750a")
   (:FILE "tests/index/hash-digests.lisp" :SHA256
    "3b3b39f861883cf2017cab8e6488560a6bb3897d63784f00e820a6450d743225")
   (:FILE "tests/index/primary-support.lisp" :SHA256
    "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a")
   (:FILE "tests/index/primary-threads.lisp" :SHA256
    "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2")
   (:FILE "tests/index/primary.lisp" :SHA256
    "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696")
   (:FILE "tests/index/rebuild.lisp" :SHA256
    "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1")
   (:FILE "tests/index/slot-support.lisp" :SHA256
    "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31")
   (:FILE "tests/index/slot-threads.lisp" :SHA256
    "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f")
   (:FILE "tests/index/slots.lisp" :SHA256
    "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb")
   (:FILE "tests/io/native.lisp" :SHA256
    "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0")
   (:FILE "tests/io/support.lisp" :SHA256
    "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50")
   (:FILE "tests/io/transfer.lisp" :SHA256
    "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd")
   (:FILE "tests/lint-fixtures/bad.lisp" :SHA256
    "ac8912ce6cc1101f2ebc305a50c0565879547b527d7ca0aeac900ee06bf26652")
   (:FILE "tests/lint-fixtures/good.lisp" :SHA256
    "05ce84f8fd12d9af48252601bcc92d6d60335b53f39b01a9fe2697c4bdaa8cee")
   (:FILE "tests/lint-fixtures/keyword-barrier.lisp" :SHA256
    "e26dab117e9526ace35bb45b92f977065d33fcc4404c40fd4fc3c77749689a96")
   (:FILE "tests/lint-fixtures/qualified-reader.lisp" :SHA256
    "835229bdc1a0ed0c08511cd6121e1f1bc4284da2cfba951b72cd1a74a6040d35")
   (:FILE "tests/mvcc/capture.lisp" :SHA256
    "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35")
   (:FILE "tests/mvcc/lifecycle.lisp" :SHA256
    "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16")
   (:FILE "tests/mvcc/support.lisp" :SHA256
    "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290")
   (:FILE "tests/read/lifecycle.lisp" :SHA256
    "c4c4642408816f2e0e809e21d04739b68b9391237e3e46ea0b195ed82857c3a8")
   (:FILE "tests/read/support.lisp" :SHA256
    "8095cc39d49342f6e43f3421b4fced839da02d8d11b4d8ddcd91bd346447e754")
   (:FILE "tests/read/threads.lisp" :SHA256
    "e2e223b69b08a5d76b9773c6ad4dee13ef2ddbb6f5ababa713cc5654bc7b51c5")
   (:FILE "tests/recovery/corruption.lisp" :SHA256
    "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c")
   (:FILE "tests/recovery/decisions-audit.lisp" :SHA256
    "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0")
   (:FILE "tests/recovery/decisions-radix.lisp" :SHA256
    "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0")
   (:FILE "tests/recovery/decisions-support.lisp" :SHA256
    "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4")
   (:FILE "tests/recovery/decisions.lisp" :SHA256
    "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e")
   (:FILE "tests/recovery/inventory-support.lisp" :SHA256
    "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27")
   (:FILE "tests/recovery/inventory.lisp" :SHA256
    "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9")
   (:FILE "tests/recovery/manifest-audit.lisp" :SHA256
    "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6")
   (:FILE "tests/recovery/manifest-support.lisp" :SHA256
    "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830")
   (:FILE "tests/recovery/manifest.lisp" :SHA256
    "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd")
   (:FILE "tests/recovery/scan.lisp" :SHA256
    "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b")
   (:FILE "tests/recovery/support.lisp" :SHA256
    "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204")
   (:FILE "tests/scheduler/controller.lisp" :SHA256
    "e986e3facc9d1b9b4eab0d135259a61d7e0f188a7f268cb2e5ee5f9c700c40be")
   (:FILE "tests/scheduler/lifecycle.lisp" :SHA256
    "eff59c0cf6d9c6c1ddec57a4efa26a8fcaeedc850b77764b818bc1c22eb73e38")
   (:FILE "tests/scheduler/support.lisp" :SHA256
    "300234f9ac7931f8c8b9bf305498a2742a3b8868dd9158dbab8c7fdceed5a1e4")
   (:FILE "tests/series/boundaries.lisp" :SHA256
    "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8")
   (:FILE "tests/series/controller.lisp" :SHA256
    "8bc98ec62e58803cab5613210e1200e0ce296af9aff63b5dff61579c3931670a")
   (:FILE "tests/series/support.lisp" :SHA256
    "810dd8a69927c75e3399af47b8fff18e4ab88eb41049c50bafee5c041be263b3")
   (:FILE "tests/series/threads.lisp" :SHA256
    "b8fe9d7e1c0ca4e18909a0a6f7ac03c8df68dd186fa21e62600be685d6e4c7ae")
   (:FILE "tests/series/worker-bridge.lisp" :SHA256
    "c1ee49702e63978a83cb86c4e5bf437a5a40e48fa02b65d3eaf3dca0d2e39176")
   (:FILE "tests/series/worker-routing.lisp" :SHA256
    "f495d33f73e3249d1055ea61d65034033367de85edec3db2cac3a63ff449e3f9")
   (:FILE "tests/smoke.lisp" :SHA256
    "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8")
   (:FILE "tests/storage/compaction-scan.lisp" :SHA256
    "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5")
   (:FILE "tests/storage/control-payload.lisp" :SHA256
    "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae")
   (:FILE "tests/storage/log-header.lisp" :SHA256
    "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e")
   (:FILE "tests/storage/segment-header.lisp" :SHA256
    "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df")
   (:FILE "tests/storage/support.lisp" :SHA256
    "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625")
   (:FILE "tests/wal/builder.lisp" :SHA256
    "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6")
   (:FILE "tests/wal/csn-threads.lisp" :SHA256
    "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c")
   (:FILE "tests/wal/csn.lisp" :SHA256
    "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a")
   (:FILE "tests/wal/fault.lisp" :SHA256
    "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875")
   (:FILE "tests/wal/group.lisp" :SHA256
    "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e")
   (:FILE "tests/wal/native.lisp" :SHA256
    "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7")
   (:FILE "tests/wal/support.lisp" :SHA256
    "90a47539e5e2898c0a08059207f30bb5551e7ca8fc166f8f6ce7b95afa757295")
   (:FILE "tools/get-active-init-mutation.lisp" :SHA256
    "1768a06137f021e83e0be65821b13af80ac96f0ddcdd86659660522f40fda716")
   (:FILE "tools/evidence-storage.lisp" :SHA256
    "8f287772a41b1ebe0e7b3ecc3826a4148082efed428a9749655977e62a9c15a6"))
  :CONFIG-SHA256
  "718d1db906b694f023c48f4e4a81e687d878d86096b2d784394aabb8d0527dff"
  :SOURCE-MANIFEST-BEFORE
  ((:FILE "arcdocdb.asd" :SHA256
    "94b6664c5f86352d2fc34898fc41c2779148480966337dc3cd8b27290f80f518")
   (:FILE "src/active/package.lisp" :SHA256
    "4a6fa4187ef5d44aec4e65d57ee6d6046485f283cc9009c1d94263bee745fa3b")
   (:FILE "src/active/preflight.lisp" :SHA256
    "ef7b592daecc223d78cbcda138b5938abc01593b486482bec06f2721cfd955a2")
   (:FILE "src/active/prepare.lisp" :SHA256
    "7b45fb01132c45c9bec76f374edaa8de91ac6bb2d61ae5c359e1fa10c6346f53")
   (:FILE "src/active/source.lisp" :SHA256
    "ff96fe360b46190ecc08ee9e05a813715dc3399054f93693f9309012aec6547d")
   (:FILE "src/active/types.lisp" :SHA256
    "48fe584096fc253ef182ab428c1887e443af06d75aaa938df660c77e60b39bfb")
   (:FILE "src/cache/build.lisp" :SHA256
    "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0")
   (:FILE "src/cache/clock.lisp" :SHA256
    "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f")
   (:FILE "src/cache/core.lisp" :SHA256
    "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4")
   (:FILE "src/cache/package.lisp" :SHA256
    "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848")
   (:FILE "src/cache/read.lisp" :SHA256
    "5700e43ae8ee859e96bdecb5953af43a712fd9e6ec23a53565759676bb07f85a")
   (:FILE "src/cache/types.lisp" :SHA256
    "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30")
   (:FILE "src/cache/write.lisp" :SHA256
    "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8")
   (:FILE "src/codec/cbor-float-minimal.lisp" :SHA256
    "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
   (:FILE "src/codec/cbor-float-narrow.lisp" :SHA256
    "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb")
   (:FILE "src/codec/cbor-float-write.lisp" :SHA256
    "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442")
   (:FILE "src/codec/cbor-header.lisp" :SHA256
    "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
   (:FILE "src/codec/cbor-minimal.lisp" :SHA256
    "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
   (:FILE "src/codec/cbor-package.lisp" :SHA256
    "c2a6fe51760c871705e4cf213ada92fed140fac26cf177d06889e18ab87fb45b")
   (:FILE "src/codec/cbor-scan-input.lisp" :SHA256
    "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
   (:FILE "src/codec/cbor-scan-items.lisp" :SHA256
    "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
   (:FILE "src/codec/cbor-scan-minimal.lisp" :SHA256
    "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
   (:FILE "src/codec/cbor-scan-stack.lisp" :SHA256
    "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
   (:FILE "src/codec/cbor-scan.lisp" :SHA256
    "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
   (:FILE "src/codec/cbor-simple-write.lisp" :SHA256
    "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e")
   (:FILE "src/codec/cbor-space.lisp" :SHA256
    "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
   (:FILE "src/codec/cbor-string-write.lisp" :SHA256
    "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727")
   (:FILE "src/codec/cbor-write.lisp" :SHA256
    "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
   (:FILE "src/codec/package.lisp" :SHA256
    "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
   (:FILE "src/codec/utf8.lisp" :SHA256
    "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
   (:FILE "src/control/build.lisp" :SHA256
    "1904e81a6cebbb178598a41e1b2283240fc21506781b1e31da407610ce0f519c")
   (:FILE "src/control/dependency.lisp" :SHA256
    "f328344e4824fd53d03a0476b45fb87efada43ddee895e13afd76ac44413d128")
   (:FILE "src/control/package.lisp" :SHA256
    "405b91843049e7f9e38896535ad615886443852b39eb0687c29e44dbd675429d")
   (:FILE "src/control/preflight.lisp" :SHA256
    "48326533ac0934cb3b1e3fc7657ef48f38912b6c08e9e38367301905f7711584")
   (:FILE "src/control/prepare.lisp" :SHA256
    "878b15074bfcb3f3aec784e78e545f1ae617539b9ddcb975504880cb000b7f87")
   (:FILE "src/control/transfer.lisp" :SHA256
    "6e257bfb6ce8e6d11263cc6788de4fc35657a82e159af7b46341c3bb208e0275")
   (:FILE "src/control/types.lisp" :SHA256
    "7f7932e0c38d3fa26273342df2be2da436024ff9a9a647c8a3dc5c65c452f563")
   (:FILE "src/csn/package.lisp" :SHA256
    "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0")
   (:FILE "src/csn/registry.lisp" :SHA256
    "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a")
   (:FILE "src/epochs/core.lisp" :SHA256
    "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399")
   (:FILE "src/epochs/package.lisp" :SHA256
    "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd")
   (:FILE "src/epochs/read.lisp" :SHA256
    "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905")
   (:FILE "src/epochs/reclaim.lisp" :SHA256
    "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202")
   (:FILE "src/epochs/retire.lisp" :SHA256
    "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b")
   (:FILE "src/epochs/types.lisp" :SHA256
    "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097")
   (:FILE "src/execution/handoff.lisp" :SHA256
    "3ce9f47008416f210173fd3a83ee7665b2103f26039d36e2601b31e5e3ebd72a")
   (:FILE "src/execution/package.lisp" :SHA256
    "833e501e6ee6e3acb8a6d37139c4605a05e06c425a35318adbcf651aa2f9db30")
   (:FILE "src/execution/queue.lisp" :SHA256
    "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90")
   (:FILE "src/execution/ready-recycle.lisp" :SHA256
    "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b")
   (:FILE "src/execution/ready-types.lisp" :SHA256
    "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f")
   (:FILE "src/execution/ready.lisp" :SHA256
    "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327")
   (:FILE "src/execution/worker-boundary.lisp" :SHA256
    "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a")
   (:FILE "src/execution/worker-claim.lisp" :SHA256
    "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e")
   (:FILE "src/execution/worker-run.lisp" :SHA256
    "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542")
   (:FILE "src/execution/worker-types.lisp" :SHA256
    "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317")
   (:FILE "src/execution/writer.lisp" :SHA256
    "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105")
   (:FILE "src/foundation/batch.lisp" :SHA256
    "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
   (:FILE "src/foundation/binary.lisp" :SHA256
    "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
   (:FILE "src/foundation/conditions.lisp" :SHA256
    "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
   (:FILE "src/foundation/crc32c.lisp" :SHA256
    "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
   (:FILE "src/foundation/package.lisp" :SHA256
    "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
   (:FILE "src/foundation/record.lisp" :SHA256
    "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
   (:FILE "src/get-directory/build.lisp" :SHA256
    "9bebb3cd9d66a8ec2fd0c72ad828e00ab2347093642653da45ef263bc855f947")
   (:FILE "src/get-directory/package.lisp" :SHA256
    "e779202c8df502749a81d0c6f9f0d505d000e09231f3679b1a91303fbcbf36f9")
   (:FILE "src/get-directory/read.lisp" :SHA256
    "a2287eb7e91bed84f3727baaf81376bbe5bf5df15cde1ea268c6d2fa66fe0a5d")
   (:FILE "src/get-directory/sources-read.lisp" :SHA256
    "ee4a3b81322fbd51ce928be0b73e9bc180af7ed39f936b68ec9a152dd2a180c2")
   (:FILE "src/get-directory/sources-types.lisp" :SHA256
    "862342b07d6a8aae834aaf3da4149682fcd1dcbdae971adad640597583547099")
   (:FILE "src/get-directory/types.lisp" :SHA256
    "0e2348291a4994f45bd1f6fe5efdc66041d2fdce18641d1af11b6c850ed69b2b")
   (:FILE "src/get-resolver/active-build.lisp" :SHA256
    "0eed95930d41c515965ae8ab0a14fbb94597a42ea38b86f205ea0938cf4631de")
   (:FILE "src/get-resolver/active-directory.lisp" :SHA256
    "c2b9a9ac3209270e9949720473908460548430a8098c9199fb55d2317a87682b")
   (:FILE "src/get-resolver/active-init.lisp" :SHA256
    "2f9380674cf4b590b071ab9d769a4b79292f544d920c0fc5ff33146dde7686f6")
   (:FILE "src/get-resolver/active-preflight.lisp" :SHA256
    "eb56f5704666cac3a88ec97f58f70c7d61db2e8feea6a094db4c468a1a2775a9")
   (:FILE "src/get-resolver/active-read.lisp" :SHA256
    "47630e5d42c785e39e15dd714177cd86159129a5391d82321385f92317bea659")
   (:FILE "src/get-resolver/active-scan.lisp" :SHA256
    "97dd4f59d4449334b113e9403a208007ed1a398a9b53f88bda3e3c0bbf3a1067")
   (:FILE "src/get-resolver/active-types.lisp" :SHA256
    "a3cb954a265b263e0e03d2f1a80824589670efbf89adcd69007987d26df2e29a")
   (:FILE "src/get-resolver/build.lisp" :SHA256
    "c649c80c2b510669fc1c0a7f15b3080b7fb46a3423a1e49db5bb9ff248176e0a")
   (:FILE "src/get-resolver/package.lisp" :SHA256
    "663a5a15a630ed2b9042a3a3365598358df97d3dd1cd3d7610b283526281f39a")
   (:FILE "src/get-resolver/read.lisp" :SHA256
    "dd100bb17e15589124916767f8a690ae683ac8c462102c778639f917a5f1924d")
   (:FILE "src/get-resolver/rows.lisp" :SHA256
    "d9db85d788006fc7ad1f9a7cdeef28b992605de7fac8c295dd7fdc51f5511854")
   (:FILE "src/get-resolver/scan.lisp" :SHA256
    "35a1780c6bf66364ef94c4151fa91f02eebe359f0ca0639985d2a907fd9d512d")
   (:FILE "src/get-resolver/sort.lisp" :SHA256
    "974bf44efeb1cd26c5e9db0601aea295c8f1a18234894ad9d41938a2880e2255")
   (:FILE "src/get-resolver/types.lisp" :SHA256
    "b847d6c388f4d052a2d707b7c410cc7c2ef60482fb5cd9ef384c016c31d1dc00")
   (:FILE "src/get/build.lisp" :SHA256
    "bcfc4916e9a85833dc151c4ce176bc905f2c03b6bc6d636f97a60df0d8c16739")
   (:FILE "src/get/lifecycle.lisp" :SHA256
    "885ba4141114ea411cac37c9b5f924aaa7f9f2a5ba311ebf92a392e5da1e3c59")
   (:FILE "src/get/lookup.lisp" :SHA256
    "9d1042d4cf1e7bd9c6d1153de12b2459e7a2724e47bd32534cd7ae56cb274c5f")
   (:FILE "src/get/package.lisp" :SHA256
    "87b795779aef0c4b918a039d182daddd22b902a9ad10c763df4364b7e630151c")
   (:FILE "src/get/segment.lisp" :SHA256
    "4a486528cb2c1cc3471cb4b332d4314d24011889e1f885db6fd5600bb077eea3")
   (:FILE "src/get/target.lisp" :SHA256
    "9f682f735e49108cad176a6143ec99e1be64da98f29cae0b52f9b49cdea34250")
   (:FILE "src/get/types.lisp" :SHA256
    "653b23a6e719cd1f55e7c58b4d7e8143aec5983992ba210d0eac1f4c8682f623")
   (:FILE "src/hash/arithmetic.lisp" :SHA256
    "c439e534b768acb123d69b921b85e1e56683aa8335bbc87efba95fe95f256fa9")
   (:FILE "src/hash/blocks.lisp" :SHA256
    "5f5dff95ae6c34dfc15538c537ba2fa8d34ba2376ad66ad9975745ea13a2175f")
   (:FILE "src/hash/hash64.lisp" :SHA256
    "99e4c8394a8f877ce1f552f15a57a082c0ec81015e87119ee4ffea28cf3ae77f")
   (:FILE "src/hash/package.lisp" :SHA256
    "1e7668fa26fc1a8e3b3cfe824aa3e08b30b57441d5f90d44453fc3a9259a10d0")
   (:FILE "src/index/core.lisp" :SHA256
    "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff")
   (:FILE "src/index/hash-digests.lisp" :SHA256
    "924bb7dab91ff56c1e909f2b06dff5f74b443ac6442e379498f29b25f1fa2673")
   (:FILE "src/index/hash-seed.lisp" :SHA256
    "ae86514101e95737747ba58a4f0c5dc1ddb44d2b3a18bceb8fd0d0756b57a7a1")
   (:FILE "src/index/package.lisp" :SHA256
    "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507")
   (:FILE "src/index/primary-arena.lisp" :SHA256
    "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5")
   (:FILE "src/index/primary-build.lisp" :SHA256
    "06ca5ac8c03504e2d2f973873e5cabf7518c090cd1f8f2118c46e0ea2f9bf37b")
   (:FILE "src/index/primary-core.lisp" :SHA256
    "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e")
   (:FILE "src/index/primary-directory.lisp" :SHA256
    "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd")
   (:FILE "src/index/primary-package.lisp" :SHA256
    "0682eb9a61596506b6788bd0285f9808db2496246caae64ab3203182ed46b860")
   (:FILE "src/index/primary-probe.lisp" :SHA256
    "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4")
   (:FILE "src/index/primary-read.lisp" :SHA256
    "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f")
   (:FILE "src/index/primary-relocate.lisp" :SHA256
    "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20")
   (:FILE "src/index/primary-types.lisp" :SHA256
    "f17ca0dcd8a538b921f00044e23872b28272638c4435eacd30f0509422505e64")
   (:FILE "src/index/primary-write.lisp" :SHA256
    "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655")
   (:FILE "src/index/read.lisp" :SHA256
    "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7")
   (:FILE "src/index/rebuild-budget.lisp" :SHA256
    "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0")
   (:FILE "src/index/rebuild-copy.lisp" :SHA256
    "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee")
   (:FILE "src/index/rebuild-scan.lisp" :SHA256
    "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e")
   (:FILE "src/index/rebuild.lisp" :SHA256
    "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1")
   (:FILE "src/index/relocate.lisp" :SHA256
    "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc")
   (:FILE "src/index/types.lisp" :SHA256
    "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e")
   (:FILE "src/index/validation.lisp" :SHA256
    "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a")
   (:FILE "src/index/write.lisp" :SHA256
    "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28")
   (:FILE "src/io/flush.lisp" :SHA256
    "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325")
   (:FILE "src/io/identity-types.lisp" :SHA256
    "5794dd5094f34c24e7e09e4a7937f1988d85ea9cd37e478abaf836273da5d5c1")
   (:FILE "src/io/identity.lisp" :SHA256
    "d2b6f7932b66f2ef74241e573ed253cf9b710f217cd570ef23f6671614d90a2c")
   (:FILE "src/io/lifecycle.lisp" :SHA256
    "baa1f763fe0f394a14d381b753dcb1be1e90eb03eaff5d6469465b5d4eca015f")
   (:FILE "src/io/native.lisp" :SHA256
    "74f63dbb2137a344054e82c6707e6262473b3332ff66a85f79ecfee9fd50f9b4")
   (:FILE "src/io/package.lisp" :SHA256
    "a2437f320b170b4e8df8684ee9b61ab317b8aa10d3c107461450551ff7aec4bd")
   (:FILE "src/io/transfer.lisp" :SHA256
    "c807f294d0211e8433f8f0332ab6ba3ce7d9ae7de3818f43af7ff8d7fcfd341a")
   (:FILE "src/io/types.lisp" :SHA256
    "63e3c4af997e26aaa48cb1df6298aaf97bb3971b88e59e8b7fa2c3736617450a")
   (:FILE "src/mvcc/package.lisp" :SHA256
    "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c")
   (:FILE "src/mvcc/snapshots-core.lisp" :SHA256
    "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998")
   (:FILE "src/mvcc/snapshots-csn.lisp" :SHA256
    "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77")
   (:FILE "src/mvcc/snapshots-lifecycle.lisp" :SHA256
    "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082")
   (:FILE "src/mvcc/snapshots-read.lisp" :SHA256
    "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9")
   (:FILE "src/mvcc/snapshots-register.lisp" :SHA256
    "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b")
   (:FILE "src/mvcc/snapshots-types.lisp" :SHA256
    "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f")
   (:FILE "src/mvcc/types.lisp" :SHA256
    "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50")
   (:FILE "src/package.lisp" :SHA256
    "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
   (:FILE "src/read/core.lisp" :SHA256
    "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f")
   (:FILE "src/read/package.lisp" :SHA256
    "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df")
   (:FILE "src/read/task.lisp" :SHA256
    "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2")
   (:FILE "src/read/types.lisp" :SHA256
    "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c")
   (:FILE "src/recovery/decisions-build.lisp" :SHA256
    "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115")
   (:FILE "src/recovery/decisions-package.lisp" :SHA256
    "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39")
   (:FILE "src/recovery/decisions-query.lisp" :SHA256
    "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24")
   (:FILE "src/recovery/decisions-radix.lisp" :SHA256
    "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54")
   (:FILE "src/recovery/decisions-sort.lisp" :SHA256
    "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2")
   (:FILE "src/recovery/decisions-types.lisp" :SHA256
    "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c")
   (:FILE "src/recovery/inventory-build.lisp" :SHA256
    "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e")
   (:FILE "src/recovery/inventory-query.lisp" :SHA256
    "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb")
   (:FILE "src/recovery/inventory-types.lisp" :SHA256
    "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9")
   (:FILE "src/recovery/manifest-build.lisp" :SHA256
    "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471")
   (:FILE "src/recovery/manifest-decode.lisp" :SHA256
    "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779")
   (:FILE "src/recovery/manifest-fold.lisp" :SHA256
    "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730")
   (:FILE "src/recovery/manifest-package.lisp" :SHA256
    "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc")
   (:FILE "src/recovery/manifest-query.lisp" :SHA256
    "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b")
   (:FILE "src/recovery/manifest-types.lisp" :SHA256
    "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10")
   (:FILE "src/recovery/package.lisp" :SHA256
    "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9")
   (:FILE "src/recovery/scan.lisp" :SHA256
    "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218")
   (:FILE "src/scheduler/build.lisp" :SHA256
    "58baf595f221826c64e3fb38344242c3bdf403d65904193bf1a8e06e09d7c336")
   (:FILE "src/scheduler/lifecycle-build.lisp" :SHA256
    "d6d67faf8721f26e7fcd228d6ab9a7dfdc36ff5ec56c67ed9e5fb6d914006a9e")
   (:FILE "src/scheduler/lifecycle-read.lisp" :SHA256
    "c60e1d5f67eeafb216b374fa001d27f87d1a734c5d066fc092902c0301069200")
   (:FILE "src/scheduler/lifecycle-types.lisp" :SHA256
    "4fe980e00f1d273e9b8278cd2daace6b4a9e4ab948ddfac83b79f4b0c537cb7c")
   (:FILE "src/scheduler/lifecycle-update.lisp" :SHA256
    "2020e46809e9fe8fa74e061a420b8085679d5f461eabd8b044f3975c1024800e")
   (:FILE "src/scheduler/lifecycle-worker.lisp" :SHA256
    "ec8b462ff3f5f7a6435f0f0c01b62034d8de2a784a9e354d469a0adfec9cf837")
   (:FILE "src/scheduler/package.lisp" :SHA256
    "5a139172de1648b30e09fdc6fc068141299c2034702f8d5b5f44bb0de14a3112")
   (:FILE "src/scheduler/policy.lisp" :SHA256
    "92b3ca3a81ae0b3ac342a63e5fe5c5d7524091a63065b0232c14c57ee80c4aac")
   (:FILE "src/scheduler/read.lisp" :SHA256
    "5cdc1e5b7ba97c9aab66a5acaf74336b0df33144e24104e0242b7fc2552a1ae2")
   (:FILE "src/scheduler/types.lisp" :SHA256
    "3b174be0919f8b27312ada4071d831c3753d62bb12be99d7e9394c48dcab474a")
   (:FILE "src/scheduler/update.lisp" :SHA256
    "e35a704ee0b9445c559a768de048169a8e39837a6df21843d8df58215c482472")
   (:FILE "src/series/events.lisp" :SHA256
    "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7")
   (:FILE "src/series/io-events.lisp" :SHA256
    "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546")
   (:FILE "src/series/ownership.lisp" :SHA256
    "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4")
   (:FILE "src/series/package.lisp" :SHA256
    "9a402f5225860c483dec9064a84d6462d28f5377a27977a63f64a5fbdbdd3764")
   (:FILE "src/series/publication.lisp" :SHA256
    "5de121c83ea6bd1243e420d9d898102aebb054cd1fa7ac79fcde9bf0792a95d8")
   (:FILE "src/series/query.lisp" :SHA256
    "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9")
   (:FILE "src/series/retirement.lisp" :SHA256
    "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059")
   (:FILE "src/series/routing-build.lisp" :SHA256
    "70135e73ecb1f6080683dd615c47a50530485061797382d74441743cd9a0f92d")
   (:FILE "src/series/routing-select.lisp" :SHA256
    "796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a")
   (:FILE "src/series/routing-types.lisp" :SHA256
    "31ae51c0fb11a802164a4d1e11ec63f835a2c67b52c751c5685bcc8947e5e0f1")
   (:FILE "src/series/types.lisp" :SHA256
    "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9")
   (:FILE "src/series/worker-boundary.lisp" :SHA256
    "793d401d1b9acc7b67923d815560f277f3d390ca050740f735f07d88dbacfe73")
   (:FILE "src/series/worker-package.lisp" :SHA256
    "dcab7a17e4fabcf256c2eddfb655d18145a1d789dd8d64a889945badc418e4b7")
   (:FILE "src/series/worker-run.lisp" :SHA256
    "f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f")
   (:FILE "src/series/worker-types.lisp" :SHA256
    "a366799fd9b938bfaa48b0ffda228ff8369ab9acb5b5ead7f081dfc66ab2c81a")
   (:FILE "src/storage/compaction-scan.lisp" :SHA256
    "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d")
   (:FILE "src/storage/control-payload.lisp" :SHA256
    "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491")
   (:FILE "src/storage/formats.lisp" :SHA256
    "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f")
   (:FILE "src/storage/log-header.lisp" :SHA256
    "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81")
   (:FILE "src/storage/package.lisp" :SHA256
    "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e")
   (:FILE "src/storage/payload-record.lisp" :SHA256
    "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7")
   (:FILE "src/storage/payload-write.lisp" :SHA256
    "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc")
   (:FILE "src/storage/segment-header.lisp" :SHA256
    "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011")
   (:FILE "src/wal/builder.lisp" :SHA256
    "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0")
   (:FILE "src/wal/csn.lisp" :SHA256
    "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810")
   (:FILE "src/wal/executor.lisp" :SHA256
    "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8")
   (:FILE "src/wal/group.lisp" :SHA256
    "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b")
   (:FILE "src/wal/package.lisp" :SHA256
    "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89")
   (:FILE "src/wal/types.lisp" :SHA256
    "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e")
   (:FILE "tests/codec/cbor-float-write-support.lisp" :SHA256
    "158f18dcf4b2d7e5562713caa3625aeba16dd1eba21f4413345e8a10b616c748")
   (:FILE "tests/codec/cbor-float-write-threads.lisp" :SHA256
    "96a1b205c01f75e271684132ff3e48b4da5cf8a01210257b591ec4951f097043")
   (:FILE "tests/codec/cbor-float-write.lisp" :SHA256
    "2d163a64bff4b9d9b9de576c4a4df05f4d8853f1c3d039e790cbb827be98c8b6")
   (:FILE "tests/codec/cbor-header.lisp" :SHA256
    "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815")
   (:FILE "tests/codec/cbor-minimal-edges.lisp" :SHA256
    "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70")
   (:FILE "tests/codec/cbor-minimal-scan-support.lisp" :SHA256
    "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421")
   (:FILE "tests/codec/cbor-minimal-scan-threads.lisp" :SHA256
    "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660")
   (:FILE "tests/codec/cbor-minimal-scan.lisp" :SHA256
    "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8")
   (:FILE "tests/codec/cbor-minimal-support.lisp" :SHA256
    "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a")
   (:FILE "tests/codec/cbor-minimal-threads.lisp" :SHA256
    "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2")
   (:FILE "tests/codec/cbor-minimal.lisp" :SHA256
    "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3")
   (:FILE "tests/codec/cbor-simple-write-support.lisp" :SHA256
    "53ceafc72a027a2ff1f787900558ff26f2ff70bbb212f1b37926a6d520fbe86e")
   (:FILE "tests/codec/cbor-simple-write-threads.lisp" :SHA256
    "77074033e75a224fd02e890f98dffa8e97d3a1f8bedd510b00ea55d8ff8687b2")
   (:FILE "tests/codec/cbor-simple-write.lisp" :SHA256
    "958bdd3901cfc41032c09d6c9023b192799981884e09ce3573256ff45bc5329a")
   (:FILE "tests/codec/cbor-string-write-support.lisp" :SHA256
    "2cbdb601f442a56456bc637c94e759cc965f44b178268dce3c636c385d34fc39")
   (:FILE "tests/codec/cbor-string-write-threads.lisp" :SHA256
    "8e07b881a55e2554a429f1c8b2c69f67862ac015217d90d019167d636564d27d")
   (:FILE "tests/codec/cbor-string-write.lisp" :SHA256
    "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115")
   (:FILE "tests/codec/cbor-structure-support.lisp" :SHA256
    "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
   (:FILE "tests/codec/cbor-structure-threads.lisp" :SHA256
    "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645")
   (:FILE "tests/codec/cbor-structure.lisp" :SHA256
    "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110")
   (:FILE "tests/codec/cbor-support.lisp" :SHA256
    "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
   (:FILE "tests/codec/cbor-threads.lisp" :SHA256
    "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14")
   (:FILE "tests/codec/cbor-write-roundtrip.lisp" :SHA256
    "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344")
   (:FILE "tests/codec/cbor-write-support.lisp" :SHA256
    "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6")
   (:FILE "tests/codec/cbor-write-threads.lisp" :SHA256
    "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb")
   (:FILE "tests/codec/cbor-write.lisp" :SHA256
    "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3")
   (:FILE "tests/codec/support.lisp" :SHA256
    "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96")
   (:FILE "tests/codec/threads.lisp" :SHA256
    "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337")
   (:FILE "tests/codec/utf8.lisp" :SHA256
    "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100")
   (:FILE "tests/csn/registry.lisp" :SHA256
    "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950")
   (:FILE "tests/csn/support.lisp" :SHA256
    "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db")
   (:FILE "tests/csn/threads.lisp" :SHA256
    "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2")
   (:FILE "tests/epochs/lifecycle.lisp" :SHA256
    "ddc2fbdad9f97d2e4ff008c167776a50b17b742398306fbd5198dca474559cbf")
   (:FILE "tests/epochs/support.lisp" :SHA256
    "366be7af4bf6c4ed946b3fa9e97aea6b034c83e3b757d81c54078dc76d229b6d")
   (:FILE "tests/epochs/threads.lisp" :SHA256
    "54b73e06c61e64f32a3e3af0791891dacb6590e929163dcf0fac95f2c71e66fd")
   (:FILE "tests/execution/handoff.lisp" :SHA256
    "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e")
   (:FILE "tests/execution/queue.lisp" :SHA256
    "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722")
   (:FILE "tests/execution/ready-recycle.lisp" :SHA256
    "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae")
   (:FILE "tests/execution/ready.lisp" :SHA256
    "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e")
   (:FILE "tests/execution/support.lisp" :SHA256
    "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43")
   (:FILE "tests/execution/threads.lisp" :SHA256
    "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359")
   (:FILE "tests/execution/worker.lisp" :SHA256
    "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06")
   (:FILE "tests/foundation/batch.lisp" :SHA256
    "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183")
   (:FILE "tests/foundation/binary.lisp" :SHA256
    "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe")
   (:FILE "tests/foundation/record.lisp" :SHA256
    "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8")
   (:FILE "tests/foundation/support.lisp" :SHA256
    "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
   (:FILE "tests/get-directory/construction.lisp" :SHA256
    "4ce9aa7064793e908008b9e1055c1e2527d5071006782ea956509c28e8c712d7")
   (:FILE "tests/get-directory/read.lisp" :SHA256
    "a222541b6413bb93ff86a269273f1fa15bfad0d1e4072fc058b023fec5143280")
   (:FILE "tests/get-directory/series-read.lisp" :SHA256
    "4b9856d69cd82c1462c87d16b9eb8e00fb642a46bb22f2f7b01865f7cc2a83a4")
   (:FILE "tests/get-directory/series-support.lisp" :SHA256
    "40f15fbdf42b80515cbfc57eb74bedcbd96d4a9e7e19dc25d8db59f326fe659a")
   (:FILE "tests/get-directory/support.lisp" :SHA256
    "be3a216a6ec597b63186b6bf3d3e35f3327f3001b1c00535d64b10bcb5d9fe85")
   (:FILE "tests/get-directory/threads.lisp" :SHA256
    "e6a93ec22bc6f5a31b37ae99d927d1ca3a53893adb2eae21cd89d132a82d1f64")
   (:FILE "tests/get-performance/guards.lisp" :SHA256
    "c41721b917ed443355ea3707efdd07e7da53a978c0515ab1e5ede5fcc47d63fc")
   (:FILE "tests/get-performance/paths.lisp" :SHA256
    "3b8d2c9c93467507ea2bb471d42192eb1fa084b55c0f4263b5ef0d3acf468f55")
   (:FILE "tests/get-performance/support.lisp" :SHA256
    "e586ed94dcb2aaba00282931cdd83313e4f84a86d4d1ba85e2d56e8b7433ed8d")
   (:FILE "tests/get-performance/threads.lisp" :SHA256
    "05ace5eb351ab49da59611dc1a2a5abedb9d723a2fc6e75a30fc76e507573a90")
   (:FILE "tests/get-resolver/construction.lisp" :SHA256
    "45cbef3b35db35d60a4cec2516c24f6ef56f5edb2f19f6f07f24fe00c8737b13")
   (:FILE "tests/get-resolver/read.lisp" :SHA256
    "70e46d1b88716f44309f46b4955928ca7fa2195edd80bb67d5b97732b971e8fb")
   (:FILE "tests/get-resolver/sort.lisp" :SHA256
    "fd7f97f0fad2e970b972688481c0c132f11c85f5fdcd0f02bee6b0b3f93b97ae")
   (:FILE "tests/get-resolver/support.lisp" :SHA256
    "d30a5c8a61b63e339facfee9f7701eb5a3614bbfd1ebef2c46c747d136640f8b")
   (:FILE "tests/get/lifecycle.lisp" :SHA256
    "73bf87c2aee7b537dba31fc0ae554272f7d2be5a4c1e9e96ea2f21a17f6f71f5")
   (:FILE "tests/get/segment.lisp" :SHA256
    "e9722f419ce0810c98c28d0e1a74da85d52346a0befff40c1119934519fc6f98")
   (:FILE "tests/get/support.lisp" :SHA256
    "21f0da34755882f7dcc3ee760528ca39d4731e1a79ea94525c62753b7f60422c")
   (:FILE "tests/hash/guards.lisp" :SHA256
    "9af5b38443a57d224990a68e93f12f7a4cda306f94c7ccd3ccb50635865d7864")
   (:FILE "tests/hash/hash64.lisp" :SHA256
    "70606bc68807143cfea9583871474c84efc868d13692cde28488284dee43e0f1")
   (:FILE "tests/hash/support.lisp" :SHA256
    "0fae9dc36976af544f83e6051b9cf9d67c9bef0b9e25f1fa2a48fdac48592acb")
   (:FILE "tests/hash/threads.lisp" :SHA256
    "3fc587a57d26a294aebfc6a7aeadf2f61a42a21106c1c57517f891b76b4e750a")
   (:FILE "tests/index/hash-digests.lisp" :SHA256
    "3b3b39f861883cf2017cab8e6488560a6bb3897d63784f00e820a6450d743225")
   (:FILE "tests/index/primary-support.lisp" :SHA256
    "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a")
   (:FILE "tests/index/primary-threads.lisp" :SHA256
    "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2")
   (:FILE "tests/index/primary.lisp" :SHA256
    "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696")
   (:FILE "tests/index/rebuild.lisp" :SHA256
    "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1")
   (:FILE "tests/index/slot-support.lisp" :SHA256
    "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31")
   (:FILE "tests/index/slot-threads.lisp" :SHA256
    "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f")
   (:FILE "tests/index/slots.lisp" :SHA256
    "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb")
   (:FILE "tests/io/native.lisp" :SHA256
    "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0")
   (:FILE "tests/io/support.lisp" :SHA256
    "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50")
   (:FILE "tests/io/transfer.lisp" :SHA256
    "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd")
   (:FILE "tests/lint-fixtures/bad.lisp" :SHA256
    "ac8912ce6cc1101f2ebc305a50c0565879547b527d7ca0aeac900ee06bf26652")
   (:FILE "tests/lint-fixtures/good.lisp" :SHA256
    "05ce84f8fd12d9af48252601bcc92d6d60335b53f39b01a9fe2697c4bdaa8cee")
   (:FILE "tests/lint-fixtures/keyword-barrier.lisp" :SHA256
    "e26dab117e9526ace35bb45b92f977065d33fcc4404c40fd4fc3c77749689a96")
   (:FILE "tests/lint-fixtures/qualified-reader.lisp" :SHA256
    "835229bdc1a0ed0c08511cd6121e1f1bc4284da2cfba951b72cd1a74a6040d35")
   (:FILE "tests/mvcc/capture.lisp" :SHA256
    "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35")
   (:FILE "tests/mvcc/lifecycle.lisp" :SHA256
    "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16")
   (:FILE "tests/mvcc/support.lisp" :SHA256
    "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290")
   (:FILE "tests/read/lifecycle.lisp" :SHA256
    "c4c4642408816f2e0e809e21d04739b68b9391237e3e46ea0b195ed82857c3a8")
   (:FILE "tests/read/support.lisp" :SHA256
    "8095cc39d49342f6e43f3421b4fced839da02d8d11b4d8ddcd91bd346447e754")
   (:FILE "tests/read/threads.lisp" :SHA256
    "e2e223b69b08a5d76b9773c6ad4dee13ef2ddbb6f5ababa713cc5654bc7b51c5")
   (:FILE "tests/recovery/corruption.lisp" :SHA256
    "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c")
   (:FILE "tests/recovery/decisions-audit.lisp" :SHA256
    "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0")
   (:FILE "tests/recovery/decisions-radix.lisp" :SHA256
    "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0")
   (:FILE "tests/recovery/decisions-support.lisp" :SHA256
    "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4")
   (:FILE "tests/recovery/decisions.lisp" :SHA256
    "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e")
   (:FILE "tests/recovery/inventory-support.lisp" :SHA256
    "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27")
   (:FILE "tests/recovery/inventory.lisp" :SHA256
    "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9")
   (:FILE "tests/recovery/manifest-audit.lisp" :SHA256
    "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6")
   (:FILE "tests/recovery/manifest-support.lisp" :SHA256
    "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830")
   (:FILE "tests/recovery/manifest.lisp" :SHA256
    "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd")
   (:FILE "tests/recovery/scan.lisp" :SHA256
    "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b")
   (:FILE "tests/recovery/support.lisp" :SHA256
    "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204")
   (:FILE "tests/scheduler/controller.lisp" :SHA256
    "e986e3facc9d1b9b4eab0d135259a61d7e0f188a7f268cb2e5ee5f9c700c40be")
   (:FILE "tests/scheduler/lifecycle.lisp" :SHA256
    "eff59c0cf6d9c6c1ddec57a4efa26a8fcaeedc850b77764b818bc1c22eb73e38")
   (:FILE "tests/scheduler/support.lisp" :SHA256
    "300234f9ac7931f8c8b9bf305498a2742a3b8868dd9158dbab8c7fdceed5a1e4")
   (:FILE "tests/series/boundaries.lisp" :SHA256
    "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8")
   (:FILE "tests/series/controller.lisp" :SHA256
    "8bc98ec62e58803cab5613210e1200e0ce296af9aff63b5dff61579c3931670a")
   (:FILE "tests/series/support.lisp" :SHA256
    "810dd8a69927c75e3399af47b8fff18e4ab88eb41049c50bafee5c041be263b3")
   (:FILE "tests/series/threads.lisp" :SHA256
    "b8fe9d7e1c0ca4e18909a0a6f7ac03c8df68dd186fa21e62600be685d6e4c7ae")
   (:FILE "tests/series/worker-bridge.lisp" :SHA256
    "c1ee49702e63978a83cb86c4e5bf437a5a40e48fa02b65d3eaf3dca0d2e39176")
   (:FILE "tests/series/worker-routing.lisp" :SHA256
    "f495d33f73e3249d1055ea61d65034033367de85edec3db2cac3a63ff449e3f9")
   (:FILE "tests/smoke.lisp" :SHA256
    "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8")
   (:FILE "tests/storage/compaction-scan.lisp" :SHA256
    "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5")
   (:FILE "tests/storage/control-payload.lisp" :SHA256
    "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae")
   (:FILE "tests/storage/log-header.lisp" :SHA256
    "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e")
   (:FILE "tests/storage/segment-header.lisp" :SHA256
    "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df")
   (:FILE "tests/storage/support.lisp" :SHA256
    "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625")
   (:FILE "tests/wal/builder.lisp" :SHA256
    "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6")
   (:FILE "tests/wal/csn-threads.lisp" :SHA256
    "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c")
   (:FILE "tests/wal/csn.lisp" :SHA256
    "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a")
   (:FILE "tests/wal/fault.lisp" :SHA256
    "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875")
   (:FILE "tests/wal/group.lisp" :SHA256
    "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e")
   (:FILE "tests/wal/native.lisp" :SHA256
    "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7")
   (:FILE "tests/wal/support.lisp" :SHA256
    "90a47539e5e2898c0a08059207f30bb5551e7ca8fc166f8f6ce7b95afa757295")
   (:FILE "tools/get-active-init-mutation.lisp" :SHA256
    "1768a06137f021e83e0be65821b13af80ac96f0ddcdd86659660522f40fda716")
   (:FILE "tools/evidence-storage.lisp" :SHA256
    "8f287772a41b1ebe0e7b3ecc3826a4148082efed428a9749655977e62a9c15a6")))
 :EXIT-CODE 0 :SIGNAL NIL)
