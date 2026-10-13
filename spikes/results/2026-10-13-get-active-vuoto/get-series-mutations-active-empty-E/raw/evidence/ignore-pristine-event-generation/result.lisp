(:DEADLINE-SECONDS 120 :ARGV
 ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--disable-debugger"
  "--script"
  "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/evidence/ignore-pristine-event-generation/driver.lisp"
  "--child"
  "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/evidence/ignore-pristine-event-generation/config.lisp")
 :NAME "ignore-pristine-event-generation" :FILE "src/series/publication.lisp"
 :RESULT :DETECTED :STATUS :OK :COPY-DIRECTORY
 "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/"
 :EVIDENCE-DIRECTORY
 "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/evidence/ignore-pristine-event-generation/"
 :EXPECTED-FAILURE :USED-CONTROLLER-ADMITTED :SUGGESTED-DETECTION-TEST
 ("ARCDOCDB.SERIES.TESTS"
  "TEST-REQ-AFF-004-SERIES-BOOTSTRAP-VIRGIN-GUARDS-AND-EXISTING-READER-ROOT")
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
   "2afb3846f4d034e3ee819075dccf69f2030da2dd67919028a14427c447f9d7bc")
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
   "2afb3846f4d034e3ee819075dccf69f2030da2dd67919028a14427c447f9d7bc")
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
 :CHANGED-PATHS ("src/series/publication.lisp") :CONFIG-SHA256
 "64fe0e704ffa08939070da1b97ed86f70a84c110cfc4b919a5f508f9ed02e7fa"
 :CONFIG-SHA256-AFTER
 "64fe0e704ffa08939070da1b97ed86f70a84c110cfc4b919a5f508f9ed02e7fa"
 :ARTIFACTS-VERIFIED T :CHILD-REPORT
 (:FINISHED-AT-UNIVERSAL-TIME 4000914656 :CONFIG-SHA256-AFTER
  "64fe0e704ffa08939070da1b97ed86f70a84c110cfc4b919a5f508f9ed02e7fa"
  :CONDITION-TYPE "SIMPLE-ERROR" :DIAGNOSTIC "Asserzione fallita: (HANDLER-CASE
                     (PROGN (FUNCALL ARCDOCDB.SERIES.TESTS::THUNK) NIL)
                     (ARCDOCDB.CONDITIONS:ARCDOCDB-ERROR (CONDITION)
                      (ARCDOCDB.FOUNDATION.TESTS::IS (TYPEP CONDITION TYPE))
                      (WHEN ARCDOCDB.SERIES.TESTS::REASON
                        (ARCDOCDB.FOUNDATION.TESTS::IS
                         (EQ ARCDOCDB.SERIES.TESTS::REASON
                             (ARCDOCDB.CONDITIONS:ERROR-REASON CONDITION))))
                      T))"
  :SCHEMA-VERSION 1 :KIND :GET-ACTIVE-INIT-MUTATION-CHILD :STATUS :FAILED
  :PHASE :TESTS :COMPILED T :SUITE-COMPILED T :COMPILED-FILES
  ((:FILE "tests/wal/support.lisp" :SOURCE-SHA256
    "90a47539e5e2898c0a08059207f30bb5551e7ca8fc166f8f6ce7b95afa757295" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/wal/support.fasl"
    :FASL-SHA256
    "4dc90d03d02152230fad2536ae570c4dcccdb54e50d4d6b0f4af09084d71e6dc")
   (:FILE "tests/wal/native.lisp" :SOURCE-SHA256
    "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/wal/native.fasl"
    :FASL-SHA256
    "5ce6af9a86c8879e9a25471016087f8c10e2509855e1b6c595b794b4bd4012cb")
   (:FILE "tests/wal/group.lisp" :SOURCE-SHA256
    "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/wal/group.fasl"
    :FASL-SHA256
    "4b87a062494cbcae2428a4f2c38b6f19961acc807e153a665f4a2b16bdc198de")
   (:FILE "tests/wal/fault.lisp" :SOURCE-SHA256
    "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/wal/fault.fasl"
    :FASL-SHA256
    "c128f7272ba8b46cc21cfecb32f5bbe4fb8f86b83dc34eacb598b94b93e746ce")
   (:FILE "tests/wal/csn.lisp" :SOURCE-SHA256
    "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/wal/csn.fasl"
    :FASL-SHA256
    "47d60bd74b0a6700dc529d32c1b4f44f59168985c17edabf589490cc88673585")
   (:FILE "tests/wal/csn-threads.lisp" :SOURCE-SHA256
    "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/wal/csn-threads.fasl"
    :FASL-SHA256
    "a95e53ba66415b953b87281bd80ac12803c69783506bce9bc0a6f155bdb5652b")
   (:FILE "tests/wal/builder.lisp" :SOURCE-SHA256
    "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/wal/builder.fasl"
    :FASL-SHA256
    "c10acdcefa5d146484364725795e9411125d850b54ce3f3fa5eaabc813dc995d")
   (:FILE "tests/storage/support.lisp" :SOURCE-SHA256
    "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/storage/support.fasl"
    :FASL-SHA256
    "bb87270bb4d057d7eb731bb74291010042d5d9cdb117af23c03aff675a0ae1fe")
   (:FILE "tests/storage/segment-header.lisp" :SOURCE-SHA256
    "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/storage/segment-header.fasl"
    :FASL-SHA256
    "9c1c1807ab13e6d4498dac498664055c0e3120aae76de735092018ea2c25f4b6")
   (:FILE "tests/storage/log-header.lisp" :SOURCE-SHA256
    "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/storage/log-header.fasl"
    :FASL-SHA256
    "865044003e49c5452ec0edde995fa926784a99f5a64f642cf1b0e3559bc63295")
   (:FILE "tests/storage/control-payload.lisp" :SOURCE-SHA256
    "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/storage/control-payload.fasl"
    :FASL-SHA256
    "3f9bf4ae325868773426103db1701a6523f10f3eb4fdb7d7190240fd554cf48a")
   (:FILE "tests/storage/compaction-scan.lisp" :SOURCE-SHA256
    "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/storage/compaction-scan.fasl"
    :FASL-SHA256
    "ca4f9b035243e0336fad31554d56814fa19460d5e9a82df5a6cc33ddac543dfc")
   (:FILE "tests/smoke.lisp" :SOURCE-SHA256
    "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/smoke.fasl"
    :FASL-SHA256
    "cdd0cc384b0aa447b0d7bb00c1a0de3b549594c412357fd43d6ae0de74847a2e")
   (:FILE "tests/series/worker-routing.lisp" :SOURCE-SHA256
    "f495d33f73e3249d1055ea61d65034033367de85edec3db2cac3a63ff449e3f9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/series/worker-routing.fasl"
    :FASL-SHA256
    "8b7ef34f58a7104fdcd37cfdf804b6be887a6f345704f0a507f6a048229993f9")
   (:FILE "tests/series/worker-bridge.lisp" :SOURCE-SHA256
    "c1ee49702e63978a83cb86c4e5bf437a5a40e48fa02b65d3eaf3dca0d2e39176" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/series/worker-bridge.fasl"
    :FASL-SHA256
    "ab9a7ac21591efecc80a317644742cebbc2b39688bfa951a0700d98ed5d4a02f")
   (:FILE "tests/series/threads.lisp" :SOURCE-SHA256
    "b8fe9d7e1c0ca4e18909a0a6f7ac03c8df68dd186fa21e62600be685d6e4c7ae" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/series/threads.fasl"
    :FASL-SHA256
    "610f0cfa1113c522a60304a98329090f3d51213b953a18c82561d66aba5de958")
   (:FILE "tests/series/support.lisp" :SOURCE-SHA256
    "810dd8a69927c75e3399af47b8fff18e4ab88eb41049c50bafee5c041be263b3" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/series/support.fasl"
    :FASL-SHA256
    "2d1fc257cbb398e1406db0e950bd7bcc8f12b3835cfb4a01b539001041c96783")
   (:FILE "tests/series/controller.lisp" :SOURCE-SHA256
    "8bc98ec62e58803cab5613210e1200e0ce296af9aff63b5dff61579c3931670a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/series/controller.fasl"
    :FASL-SHA256
    "fa49086c28b81cd6d2773ef287057dae45cef483f4dbea60d3ce0b1254274957")
   (:FILE "tests/series/boundaries.lisp" :SOURCE-SHA256
    "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/series/boundaries.fasl"
    :FASL-SHA256
    "9de0b7977a9b2e52ae383cbe7c81f5618ff138cd1ac52e73deb09e50d456f1ce")
   (:FILE "tests/scheduler/support.lisp" :SOURCE-SHA256
    "300234f9ac7931f8c8b9bf305498a2742a3b8868dd9158dbab8c7fdceed5a1e4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/scheduler/support.fasl"
    :FASL-SHA256
    "7204c03bbae3959033ba7663d8506f465d651f430d494a34a8225242d9b18853")
   (:FILE "tests/scheduler/lifecycle.lisp" :SOURCE-SHA256
    "eff59c0cf6d9c6c1ddec57a4efa26a8fcaeedc850b77764b818bc1c22eb73e38" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/scheduler/lifecycle.fasl"
    :FASL-SHA256
    "ec9f40d521e7f05360cb880d78a90e566679783281fef08e2a769d462fc7eddd")
   (:FILE "tests/scheduler/controller.lisp" :SOURCE-SHA256
    "e986e3facc9d1b9b4eab0d135259a61d7e0f188a7f268cb2e5ee5f9c700c40be" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/scheduler/controller.fasl"
    :FASL-SHA256
    "6697ec438694a09e667c5699a3e6bebb645ec758f71fc416edecdeb4cbdee60f")
   (:FILE "tests/recovery/support.lisp" :SOURCE-SHA256
    "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/recovery/support.fasl"
    :FASL-SHA256
    "85d54f4d01a5d700a88a6fe8787f5bb0a445d16700398b2488f98fb302b40ed1")
   (:FILE "tests/recovery/scan.lisp" :SOURCE-SHA256
    "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/recovery/scan.fasl"
    :FASL-SHA256
    "e15a77681a5710acb8153105d8ee025ae3ccdc531ce728cbe735f6d89ea5b906")
   (:FILE "tests/recovery/manifest.lisp" :SOURCE-SHA256
    "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/recovery/manifest.fasl"
    :FASL-SHA256
    "e061034675d41e1df22c5dd20f10399c3efa7786f24d34ab6518433f2c6b8f45")
   (:FILE "tests/recovery/manifest-support.lisp" :SOURCE-SHA256
    "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/recovery/manifest-support.fasl"
    :FASL-SHA256
    "486e26f2065ae709b1b9d1038de82dbd37ea68102890f0ad5fc9d7ade34627d6")
   (:FILE "tests/recovery/manifest-audit.lisp" :SOURCE-SHA256
    "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/recovery/manifest-audit.fasl"
    :FASL-SHA256
    "49cf7e3b90620946cbf34e9467ea1646ec01514e3fa7d2d9418f062240391aac")
   (:FILE "tests/recovery/inventory.lisp" :SOURCE-SHA256
    "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/recovery/inventory.fasl"
    :FASL-SHA256
    "f3ce5aac3ab270c9c49ca7abee9779e4fc8a7797269b6a99e447c0a9e3160b67")
   (:FILE "tests/recovery/inventory-support.lisp" :SOURCE-SHA256
    "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/recovery/inventory-support.fasl"
    :FASL-SHA256
    "9780f8f9ac2b8c80f476f3ecd505f3710623634272cb556d59ced8a07cf0cf19")
   (:FILE "tests/recovery/decisions.lisp" :SOURCE-SHA256
    "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/recovery/decisions.fasl"
    :FASL-SHA256
    "071793f29c32a3a1a0205e369c2f883485bdf6efca3e6f4c9336986d56fff288")
   (:FILE "tests/recovery/decisions-support.lisp" :SOURCE-SHA256
    "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/recovery/decisions-support.fasl"
    :FASL-SHA256
    "7d0fb8505daee190d9de5e8616a21d51b327a1b5037a328f3b8d12d996bfa810")
   (:FILE "tests/recovery/decisions-radix.lisp" :SOURCE-SHA256
    "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/recovery/decisions-radix.fasl"
    :FASL-SHA256
    "8447299457208fdaee81561747c8c250555c952ab6b19529a623b18eb1fea921")
   (:FILE "tests/recovery/decisions-audit.lisp" :SOURCE-SHA256
    "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/recovery/decisions-audit.fasl"
    :FASL-SHA256
    "a66a35d9b0a854b5822c9de9b2c6bede4d77a6423d5d8166c1cb50af9379d37f")
   (:FILE "tests/recovery/corruption.lisp" :SOURCE-SHA256
    "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/recovery/corruption.fasl"
    :FASL-SHA256
    "2abdee323ed3d76e053a2445679406d63998971800b2532a0860dbaa25866598")
   (:FILE "tests/read/threads.lisp" :SOURCE-SHA256
    "e2e223b69b08a5d76b9773c6ad4dee13ef2ddbb6f5ababa713cc5654bc7b51c5" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/read/threads.fasl"
    :FASL-SHA256
    "348871ab45363b71091ce4757e421f07e839609f7eb62be82bd6b7e4070840db")
   (:FILE "tests/read/support.lisp" :SOURCE-SHA256
    "8095cc39d49342f6e43f3421b4fced839da02d8d11b4d8ddcd91bd346447e754" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/read/support.fasl"
    :FASL-SHA256
    "47d7b8daa16052aec00b44ecda53bc83d7fd917461e37c38f120634915cec9bd")
   (:FILE "tests/read/lifecycle.lisp" :SOURCE-SHA256
    "c4c4642408816f2e0e809e21d04739b68b9391237e3e46ea0b195ed82857c3a8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/read/lifecycle.fasl"
    :FASL-SHA256
    "70fcc8f39b7b1fc5e18ff254fd57046634b0edacee19d6cd7701621697e37a93")
   (:FILE "tests/mvcc/support.lisp" :SOURCE-SHA256
    "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/mvcc/support.fasl"
    :FASL-SHA256
    "23cd5fed990b4407cfbf0a5bdb7784364b5b220fb4fdc0bd3f084e197f6be7b9")
   (:FILE "tests/mvcc/lifecycle.lisp" :SOURCE-SHA256
    "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/mvcc/lifecycle.fasl"
    :FASL-SHA256
    "edbd7c8beb59b7d1174673a3f274b17bf366d2d20cb160ac81279882a2fe0973")
   (:FILE "tests/mvcc/capture.lisp" :SOURCE-SHA256
    "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/mvcc/capture.fasl"
    :FASL-SHA256
    "aaaaa7cbb3d9e427770ec33a9b4eccbc5e2da7edd751c43159c5b1ae5668383f")
   (:FILE "tests/io/transfer.lisp" :SOURCE-SHA256
    "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/io/transfer.fasl"
    :FASL-SHA256
    "6cb10547746934a21bef5f9d94832cd36359c5567fcdf795602e13df93d55449")
   (:FILE "tests/io/support.lisp" :SOURCE-SHA256
    "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/io/support.fasl"
    :FASL-SHA256
    "71f163a1f13aad8f685471d5f44cf48082eaf777998816421ad6a90eee1c5a8b")
   (:FILE "tests/io/native.lisp" :SOURCE-SHA256
    "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/io/native.fasl"
    :FASL-SHA256
    "b5ba04be6c5dc40bee6e16d730b89a5b39b4d0d27fdbd470e270fdc62d90e3ab")
   (:FILE "tests/index/slots.lisp" :SOURCE-SHA256
    "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/index/slots.fasl"
    :FASL-SHA256
    "2bd9cddef88f119f9b1285e6a9fcb7596b8f7e4ab1353085fdf6ee5dad3fa291")
   (:FILE "tests/index/slot-threads.lisp" :SOURCE-SHA256
    "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/index/slot-threads.fasl"
    :FASL-SHA256
    "f7089481e2aff150bd63bfb9e30dd90bd9ea8b7174aa0c935696af532554c5aa")
   (:FILE "tests/index/slot-support.lisp" :SOURCE-SHA256
    "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/index/slot-support.fasl"
    :FASL-SHA256
    "d969a28223e6ccd1080ecd76d34864a13047a89c785e23b413ada826b775faf9")
   (:FILE "tests/index/rebuild.lisp" :SOURCE-SHA256
    "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/index/rebuild.fasl"
    :FASL-SHA256
    "40b7d974e44046cbc307070624e143ca05867f94d78583e85dc2d4f842fb7a08")
   (:FILE "tests/index/primary.lisp" :SOURCE-SHA256
    "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/index/primary.fasl"
    :FASL-SHA256
    "f6894a9a1344f262b7a4ffdf0cc36226917a1afa9887f2ad0557b5b551444564")
   (:FILE "tests/index/primary-threads.lisp" :SOURCE-SHA256
    "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/index/primary-threads.fasl"
    :FASL-SHA256
    "1f0ece2b0df7830b07151936930649ee2ead11b675d2500afe0414aa9d493289")
   (:FILE "tests/index/primary-support.lisp" :SOURCE-SHA256
    "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/index/primary-support.fasl"
    :FASL-SHA256
    "080ee22886feeca74ab12551f4fc9572cf535c2dcff97e7b41df43f762d63808")
   (:FILE "tests/index/hash-digests.lisp" :SOURCE-SHA256
    "3b3b39f861883cf2017cab8e6488560a6bb3897d63784f00e820a6450d743225" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/index/hash-digests.fasl"
    :FASL-SHA256
    "fa52629533fe96c38cd072e416f15ea3504ebd76ebbb9c1c17bcf4a4c216a277")
   (:FILE "tests/hash/threads.lisp" :SOURCE-SHA256
    "3fc587a57d26a294aebfc6a7aeadf2f61a42a21106c1c57517f891b76b4e750a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/hash/threads.fasl"
    :FASL-SHA256
    "56a8dc7ce30651a864cb04112bc3a32b3d7b441942fa478db81b223d69bcb2dd")
   (:FILE "tests/hash/support.lisp" :SOURCE-SHA256
    "0fae9dc36976af544f83e6051b9cf9d67c9bef0b9e25f1fa2a48fdac48592acb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/hash/support.fasl"
    :FASL-SHA256
    "2d3c67546ccee2f8274ea6b9f02000e1e9e362a88d3afecbce55bbf44802aeac")
   (:FILE "tests/hash/hash64.lisp" :SOURCE-SHA256
    "70606bc68807143cfea9583871474c84efc868d13692cde28488284dee43e0f1" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/hash/hash64.fasl"
    :FASL-SHA256
    "7ea33836ad8bc507e807999ea8277b16b5a0b324ac96ce708b34b9b03357c52c")
   (:FILE "tests/hash/guards.lisp" :SOURCE-SHA256
    "9af5b38443a57d224990a68e93f12f7a4cda306f94c7ccd3ccb50635865d7864" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/hash/guards.fasl"
    :FASL-SHA256
    "f860248c43e3fd4605e65554f340c8cbdc1fde58b8a692d5db6a21e990c7bb39")
   (:FILE "tests/get/support.lisp" :SOURCE-SHA256
    "21f0da34755882f7dcc3ee760528ca39d4731e1a79ea94525c62753b7f60422c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get/support.fasl"
    :FASL-SHA256
    "98ee3064e0fd911b36f7d89d6e5caa98efae5d35563b5b4fcdf8ad82c4903bc7")
   (:FILE "tests/get/segment.lisp" :SOURCE-SHA256
    "e9722f419ce0810c98c28d0e1a74da85d52346a0befff40c1119934519fc6f98" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get/segment.fasl"
    :FASL-SHA256
    "170e025ae6fba52c03f2bff481876f63bf56706cbac0d2afe0bbcb1c55b0850e")
   (:FILE "tests/get/lifecycle.lisp" :SOURCE-SHA256
    "73bf87c2aee7b537dba31fc0ae554272f7d2be5a4c1e9e96ea2f21a17f6f71f5" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get/lifecycle.fasl"
    :FASL-SHA256
    "3268812713908cb97b8b2386ae9fab27c52160b12a112297eac2bc33e9fdf922")
   (:FILE "tests/get-resolver/support.lisp" :SOURCE-SHA256
    "d30a5c8a61b63e339facfee9f7701eb5a3614bbfd1ebef2c46c747d136640f8b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get-resolver/support.fasl"
    :FASL-SHA256
    "89316ac9bc46e0e6d75f2aed03b27ae7103686b3b05c7d09e1c3bfb035895498")
   (:FILE "tests/get-resolver/sort.lisp" :SOURCE-SHA256
    "fd7f97f0fad2e970b972688481c0c132f11c85f5fdcd0f02bee6b0b3f93b97ae" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get-resolver/sort.fasl"
    :FASL-SHA256
    "2ca59b39b6ba329f60edadb1d0412dc31d11f7e6be9f45c8c00186cb801494db")
   (:FILE "tests/get-resolver/read.lisp" :SOURCE-SHA256
    "70e46d1b88716f44309f46b4955928ca7fa2195edd80bb67d5b97732b971e8fb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get-resolver/read.fasl"
    :FASL-SHA256
    "f449e1f78dfe23518b63bae69446204d1dbb0ed761d28231302bcfcbd1ca2b21")
   (:FILE "tests/get-resolver/construction.lisp" :SOURCE-SHA256
    "45cbef3b35db35d60a4cec2516c24f6ef56f5edb2f19f6f07f24fe00c8737b13" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get-resolver/construction.fasl"
    :FASL-SHA256
    "865f374e4e78ac759e08a9699e0ec7a5119171598a8901f45f90299199388291")
   (:FILE "tests/get-performance/threads.lisp" :SOURCE-SHA256
    "05ace5eb351ab49da59611dc1a2a5abedb9d723a2fc6e75a30fc76e507573a90" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get-performance/threads.fasl"
    :FASL-SHA256
    "46e9ea0d265424aaee5523919be6d92e03fe9f5140eb17fb41ccdf6a7c2e1061")
   (:FILE "tests/get-performance/support.lisp" :SOURCE-SHA256
    "e586ed94dcb2aaba00282931cdd83313e4f84a86d4d1ba85e2d56e8b7433ed8d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get-performance/support.fasl"
    :FASL-SHA256
    "54a991ee41c340720bf54bb84ec246e7e65828a20ba6b9e128beab8aa5e0e9f2")
   (:FILE "tests/get-performance/paths.lisp" :SOURCE-SHA256
    "3b8d2c9c93467507ea2bb471d42192eb1fa084b55c0f4263b5ef0d3acf468f55" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get-performance/paths.fasl"
    :FASL-SHA256
    "d9826d570a07f886849b01c92d0fa72c9fddda5316cfc3e42d69e59780dedda4")
   (:FILE "tests/get-performance/guards.lisp" :SOURCE-SHA256
    "c41721b917ed443355ea3707efdd07e7da53a978c0515ab1e5ede5fcc47d63fc" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get-performance/guards.fasl"
    :FASL-SHA256
    "dde21fcc8e4318ead05da3a35447fd05c36ec99e737dcb1b105f89d7e049a1c6")
   (:FILE "tests/get-directory/threads.lisp" :SOURCE-SHA256
    "e6a93ec22bc6f5a31b37ae99d927d1ca3a53893adb2eae21cd89d132a82d1f64" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get-directory/threads.fasl"
    :FASL-SHA256
    "fbcb4fdc89badad429f3d8369ae4ddd252873067dc42704fbd4d1a273ebfc7fa")
   (:FILE "tests/get-directory/support.lisp" :SOURCE-SHA256
    "be3a216a6ec597b63186b6bf3d3e35f3327f3001b1c00535d64b10bcb5d9fe85" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get-directory/support.fasl"
    :FASL-SHA256
    "75658555d233ee609296eb65472b41e603ae706abab17177497a94fd1e7b45c2")
   (:FILE "tests/get-directory/series-support.lisp" :SOURCE-SHA256
    "40f15fbdf42b80515cbfc57eb74bedcbd96d4a9e7e19dc25d8db59f326fe659a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get-directory/series-support.fasl"
    :FASL-SHA256
    "ba994449323916f25ff202dffd82c210771d6013f2c459cdf39fa11f19b0f339")
   (:FILE "tests/get-directory/series-read.lisp" :SOURCE-SHA256
    "4b9856d69cd82c1462c87d16b9eb8e00fb642a46bb22f2f7b01865f7cc2a83a4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get-directory/series-read.fasl"
    :FASL-SHA256
    "f8ac5249e28dbb0c5005d994858383d962659b4d54c10463b0932f7cf5deb54e")
   (:FILE "tests/get-directory/read.lisp" :SOURCE-SHA256
    "a222541b6413bb93ff86a269273f1fa15bfad0d1e4072fc058b023fec5143280" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get-directory/read.fasl"
    :FASL-SHA256
    "08ad157aac6112735e26e4bcb3e093afad9e31f4b91f4f9c1c10c53d1d0e1996")
   (:FILE "tests/get-directory/construction.lisp" :SOURCE-SHA256
    "4ce9aa7064793e908008b9e1055c1e2527d5071006782ea956509c28e8c712d7" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get-directory/construction.fasl"
    :FASL-SHA256
    "2be424620c175ad01320d27577d088630908bef954ab98084e1315e3a1c698f8")
   (:FILE "tests/foundation/support.lisp" :SOURCE-SHA256
    "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/foundation/support.fasl"
    :FASL-SHA256
    "7d1873bfc52c1207a6ed71e5a55dc06e3015f63589fc29dd2cb58d3b44c7419e")
   (:FILE "tests/foundation/record.lisp" :SOURCE-SHA256
    "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/foundation/record.fasl"
    :FASL-SHA256
    "c204a2d230669baa1793eb4f6a5891aed6efe9ababffbd1a8a947cb93868c685")
   (:FILE "tests/foundation/binary.lisp" :SOURCE-SHA256
    "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/foundation/binary.fasl"
    :FASL-SHA256
    "6f2045b9758a401057fef242fc7d0ee2b46b824fd6711137c57509cadeab982c")
   (:FILE "tests/foundation/batch.lisp" :SOURCE-SHA256
    "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/foundation/batch.fasl"
    :FASL-SHA256
    "2e6a15d03e8f0445ec9f7c6a85d99a995aed244e3b943b7d2f84130c13bf06e0")
   (:FILE "tests/execution/worker.lisp" :SOURCE-SHA256
    "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/execution/worker.fasl"
    :FASL-SHA256
    "f79550c3ddb04adf452707165e42574a799df3e79f29757ff164e6deb766e7ec")
   (:FILE "tests/execution/threads.lisp" :SOURCE-SHA256
    "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/execution/threads.fasl"
    :FASL-SHA256
    "0d6e99f0c194e71495d8ef10a47fa81e598092f0af20f2a284ecbc1d610dad67")
   (:FILE "tests/execution/support.lisp" :SOURCE-SHA256
    "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/execution/support.fasl"
    :FASL-SHA256
    "d1c6a48558a4c74698bb0fd848c6244967760b4e0476571740c282c81469c6ce")
   (:FILE "tests/execution/ready.lisp" :SOURCE-SHA256
    "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/execution/ready.fasl"
    :FASL-SHA256
    "630182b0e947331526a9e6649934e1efa98621f6b011af2c3073046ed0096fb3")
   (:FILE "tests/execution/ready-recycle.lisp" :SOURCE-SHA256
    "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/execution/ready-recycle.fasl"
    :FASL-SHA256
    "e35b1e8d7e43fd5e7ca24323dab913140f164cfa8743d4420e9a6300264b06d2")
   (:FILE "tests/execution/queue.lisp" :SOURCE-SHA256
    "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/execution/queue.fasl"
    :FASL-SHA256
    "c174503bf0afb71cd39ffccb787caaaa97e0802d27c3b944cb613810a3f40cab")
   (:FILE "tests/execution/handoff.lisp" :SOURCE-SHA256
    "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/execution/handoff.fasl"
    :FASL-SHA256
    "285af0441c86f85a4e5f27403be89211aa631cab85596cc59a5ff18720555847")
   (:FILE "tests/epochs/threads.lisp" :SOURCE-SHA256
    "54b73e06c61e64f32a3e3af0791891dacb6590e929163dcf0fac95f2c71e66fd" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/epochs/threads.fasl"
    :FASL-SHA256
    "59837ad4bae0c1f887fc990965493d0995d89c48646593e7c17dd0717747917a")
   (:FILE "tests/epochs/support.lisp" :SOURCE-SHA256
    "366be7af4bf6c4ed946b3fa9e97aea6b034c83e3b757d81c54078dc76d229b6d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/epochs/support.fasl"
    :FASL-SHA256
    "f8c0cd56fc40a5a04941f00c738599c2e3b3cc805059f044bba9f959ae851ff6")
   (:FILE "tests/epochs/lifecycle.lisp" :SOURCE-SHA256
    "ddc2fbdad9f97d2e4ff008c167776a50b17b742398306fbd5198dca474559cbf" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/epochs/lifecycle.fasl"
    :FASL-SHA256
    "81e9d51e3fb18e06dc4152220ef234368411c106f7278a2b4a5e40de68c10805")
   (:FILE "tests/csn/threads.lisp" :SOURCE-SHA256
    "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/csn/threads.fasl"
    :FASL-SHA256
    "717a08f96ac323ae799f7c3855254da06c22f3a3acba0af7512fe86b2d4f08e9")
   (:FILE "tests/csn/support.lisp" :SOURCE-SHA256
    "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/csn/support.fasl"
    :FASL-SHA256
    "35bd1fa62b6987f59633cba2b27010e84e98be0d5b2284a6402a08f52343a46c")
   (:FILE "tests/csn/registry.lisp" :SOURCE-SHA256
    "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/csn/registry.fasl"
    :FASL-SHA256
    "be2f2f23b55f5464094196476a07fa5877d888bfcda4e33d484b2d1fb17a7b08")
   (:FILE "tests/codec/utf8.lisp" :SOURCE-SHA256
    "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/utf8.fasl"
    :FASL-SHA256
    "f24bb90c0a02bc2af4e7f172631189da66aad8ba27a12d99a3991c44454bb226")
   (:FILE "tests/codec/threads.lisp" :SOURCE-SHA256
    "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/threads.fasl"
    :FASL-SHA256
    "123552ffca661d348904551211c0ba2d5a394f77243a0dd65b98e218ceaeac69")
   (:FILE "tests/codec/support.lisp" :SOURCE-SHA256
    "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/support.fasl"
    :FASL-SHA256
    "99424604e7902152fceb3b54611d19275b281fff4d3c8029aba75ac8db1ca7a8")
   (:FILE "tests/codec/cbor-write.lisp" :SOURCE-SHA256
    "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-write.fasl"
    :FASL-SHA256
    "30f1519ff5e0f37e0d32c2b17eae3876d6506901186314a1a08e931c08836cc5")
   (:FILE "tests/codec/cbor-write-threads.lisp" :SOURCE-SHA256
    "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-write-threads.fasl"
    :FASL-SHA256
    "c48f1748d05e7a9d05ec7e181bd0816db35fb0c646dc14f0f5bd95efcba0a945")
   (:FILE "tests/codec/cbor-write-support.lisp" :SOURCE-SHA256
    "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-write-support.fasl"
    :FASL-SHA256
    "1b79b11fe1bfb0c89ee8aa1b13a721f4ef2dd6a4f80ea37668c44b20a076221a")
   (:FILE "tests/codec/cbor-write-roundtrip.lisp" :SOURCE-SHA256
    "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-write-roundtrip.fasl"
    :FASL-SHA256
    "1c8253832ef048b1f0f170eb2e4b873ef8d1a0dcfe1e94b2913e57a8787db5e4")
   (:FILE "tests/codec/cbor-threads.lisp" :SOURCE-SHA256
    "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-threads.fasl"
    :FASL-SHA256
    "cbb51ef4b93a2c071d8eb70ddc8b0f50a50d3c664eac4606458bd71c1950318f")
   (:FILE "tests/codec/cbor-support.lisp" :SOURCE-SHA256
    "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-support.fasl"
    :FASL-SHA256
    "19a9dd0e3f30deb51b7a6c1fd929477962ad1aee146faeff5df8900904153e3d")
   (:FILE "tests/codec/cbor-structure.lisp" :SOURCE-SHA256
    "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-structure.fasl"
    :FASL-SHA256
    "768b1ff9a31e285f9483a7fb8cca4a76500b99db512894442cf3456ff17032da")
   (:FILE "tests/codec/cbor-structure-threads.lisp" :SOURCE-SHA256
    "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-structure-threads.fasl"
    :FASL-SHA256
    "2b17bfc6e942ea93ad7930708d3a8f961e80033434916a008bbbf80f9c71ff7a")
   (:FILE "tests/codec/cbor-structure-support.lisp" :SOURCE-SHA256
    "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-structure-support.fasl"
    :FASL-SHA256
    "7ab372275ef6b299eef035ef93debe5d17ccadb7fd13d77b213197762b87e30d")
   (:FILE "tests/codec/cbor-string-write.lisp" :SOURCE-SHA256
    "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-string-write.fasl"
    :FASL-SHA256
    "4687f01593f264105c8f604fe41c36d38225923f6df7d7ad1f4349a09b1ea8ad")
   (:FILE "tests/codec/cbor-string-write-threads.lisp" :SOURCE-SHA256
    "8e07b881a55e2554a429f1c8b2c69f67862ac015217d90d019167d636564d27d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-string-write-threads.fasl"
    :FASL-SHA256
    "1cab88365ac67297785bb93b8100457c9f06b15c7e87ac80ca86d64635daf66f")
   (:FILE "tests/codec/cbor-string-write-support.lisp" :SOURCE-SHA256
    "2cbdb601f442a56456bc637c94e759cc965f44b178268dce3c636c385d34fc39" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-string-write-support.fasl"
    :FASL-SHA256
    "71274e6acd61f0367c50c8b1619ebbe2ba5e996bc0322a0de0764c4f5a886ade")
   (:FILE "tests/codec/cbor-simple-write.lisp" :SOURCE-SHA256
    "958bdd3901cfc41032c09d6c9023b192799981884e09ce3573256ff45bc5329a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-simple-write.fasl"
    :FASL-SHA256
    "04002d166c285d414892ad684bef10c067f1a2943ba11d2c4cec88478302ce9a")
   (:FILE "tests/codec/cbor-simple-write-threads.lisp" :SOURCE-SHA256
    "77074033e75a224fd02e890f98dffa8e97d3a1f8bedd510b00ea55d8ff8687b2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-simple-write-threads.fasl"
    :FASL-SHA256
    "e62f9d8aca1baac4a9682fcc440fdadebf3fa4f4f1d1354e82ada762842ac0a8")
   (:FILE "tests/codec/cbor-simple-write-support.lisp" :SOURCE-SHA256
    "53ceafc72a027a2ff1f787900558ff26f2ff70bbb212f1b37926a6d520fbe86e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-simple-write-support.fasl"
    :FASL-SHA256
    "aa9a4a46b67afbb88bf0b7dac8e54edd1932fdfeaf6b9d239ab5ac7647d300db")
   (:FILE "tests/codec/cbor-minimal.lisp" :SOURCE-SHA256
    "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-minimal.fasl"
    :FASL-SHA256
    "0be5e71585be58e8634faa4661938a42a3877266aa2af4e60be909d9a726ec73")
   (:FILE "tests/codec/cbor-minimal-threads.lisp" :SOURCE-SHA256
    "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-minimal-threads.fasl"
    :FASL-SHA256
    "38c2e7da2a1b3b93156d7430357046ccb25d820be6f1358841d0f6cb789088d7")
   (:FILE "tests/codec/cbor-minimal-support.lisp" :SOURCE-SHA256
    "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-minimal-support.fasl"
    :FASL-SHA256
    "cc57ca1e36a94fd6fc74692234938e8223b13e10f929fe73c45b3e8d59fb7e1f")
   (:FILE "tests/codec/cbor-minimal-scan.lisp" :SOURCE-SHA256
    "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-minimal-scan.fasl"
    :FASL-SHA256
    "04681bd05802345b5a786269331655015b11da2a0a3972fa009d039052424512")
   (:FILE "tests/codec/cbor-minimal-scan-threads.lisp" :SOURCE-SHA256
    "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-minimal-scan-threads.fasl"
    :FASL-SHA256
    "87885681399e1bc9d2044d3258c74ffb9dcccc2a9991a826180a9cbc6e6f84d4")
   (:FILE "tests/codec/cbor-minimal-scan-support.lisp" :SOURCE-SHA256
    "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-minimal-scan-support.fasl"
    :FASL-SHA256
    "b36b80aeb99a5dc2fc232f6a436ebbb0f98fa2cbe1f3f675ebe670fedceeaa6b")
   (:FILE "tests/codec/cbor-minimal-edges.lisp" :SOURCE-SHA256
    "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-minimal-edges.fasl"
    :FASL-SHA256
    "4a0b14d4a5ea7762e2b49b46369908a0c841b8ba195a90f012ca1c6aab8efd4a")
   (:FILE "tests/codec/cbor-header.lisp" :SOURCE-SHA256
    "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-header.fasl"
    :FASL-SHA256
    "372d3f7c3f7fcf36ff709cf0341b19a21e427dbb57bcb01567ef2456151899fc")
   (:FILE "tests/codec/cbor-float-write.lisp" :SOURCE-SHA256
    "2d163a64bff4b9d9b9de576c4a4df05f4d8853f1c3d039e790cbb827be98c8b6" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-float-write.fasl"
    :FASL-SHA256
    "ac58f7fc32cd9db7f2b3b676578a681f703f6aa66b4a82d102073183039c4f2e")
   (:FILE "tests/codec/cbor-float-write-threads.lisp" :SOURCE-SHA256
    "96a1b205c01f75e271684132ff3e48b4da5cf8a01210257b591ec4951f097043" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-float-write-threads.fasl"
    :FASL-SHA256
    "ba812fdb6df89c417a12cd291d8b0db9c953f449d1f58ec34ac8fc452650b430")
   (:FILE "tests/codec/cbor-float-write-support.lisp" :SOURCE-SHA256
    "158f18dcf4b2d7e5562713caa3625aeba16dd1eba21f4413345e8a10b616c748" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-float-write-support.fasl"
    :FASL-SHA256
    "1da2c2980f4f4d37ab2941d157a681b885c34b2898009a34071b804849e3c191")
   (:FILE "src/wal/types.lisp" :SOURCE-SHA256
    "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/wal/types.fasl"
    :FASL-SHA256
    "2d532c3851c5dbb30b2a3fa2ee6af25af71ae3e8c16a628b2c3eaf40157f8d6f")
   (:FILE "src/wal/package.lisp" :SOURCE-SHA256
    "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/wal/package.fasl"
    :FASL-SHA256
    "b87e80745c90e40155908cad0696aab5a3e2ea52f41a2dc5785b4c3a3bbaf000")
   (:FILE "src/wal/group.lisp" :SOURCE-SHA256
    "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/wal/group.fasl"
    :FASL-SHA256
    "38a18f689ec826867287b8f1fc03dd14790be366909b2ffe8ebdee6cb176aee7")
   (:FILE "src/wal/executor.lisp" :SOURCE-SHA256
    "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/wal/executor.fasl"
    :FASL-SHA256
    "f643605556abf5d55613cedd7732ce5f4f92fba1db84696feaebf13fb898c686")
   (:FILE "src/wal/csn.lisp" :SOURCE-SHA256
    "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/wal/csn.fasl"
    :FASL-SHA256
    "78a2b8b202352ea3ed653a2f85b9f606e2e2b3a87692ba064c903c42aee5e11d")
   (:FILE "src/wal/builder.lisp" :SOURCE-SHA256
    "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/wal/builder.fasl"
    :FASL-SHA256
    "302d47fbee3a955d46318d1056942f378da1b467b03fb45f5eb8cd93c80075fa")
   (:FILE "src/storage/segment-header.lisp" :SOURCE-SHA256
    "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/storage/segment-header.fasl"
    :FASL-SHA256
    "9edee61d0bdac1ad4d04af4f674bdcc6f3fe09cd2467a62cb527b17a264c7805")
   (:FILE "src/storage/payload-write.lisp" :SOURCE-SHA256
    "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/storage/payload-write.fasl"
    :FASL-SHA256
    "e893315277352bd50837b2eb4651cefb502f4ea4975ae90d81063e466957d660")
   (:FILE "src/storage/payload-record.lisp" :SOURCE-SHA256
    "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/storage/payload-record.fasl"
    :FASL-SHA256
    "efc600ff6e57d99873bdffbe8e02114e20ad2efdedaf725ff53cf768f540977c")
   (:FILE "src/storage/package.lisp" :SOURCE-SHA256
    "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/storage/package.fasl"
    :FASL-SHA256
    "e4f8d7556011033f6fd8231a319412bcf401746a50b2eda8bb321fed9cc61213")
   (:FILE "src/storage/log-header.lisp" :SOURCE-SHA256
    "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/storage/log-header.fasl"
    :FASL-SHA256
    "89fcde9e3b5f070f895ad294cb9df56f44cf3e42c7c41fcd8c6d0a57e4b40767")
   (:FILE "src/storage/formats.lisp" :SOURCE-SHA256
    "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/storage/formats.fasl"
    :FASL-SHA256
    "178687f4028e0ba3f5198d3f8107d74cd72de78269d636ed8b8aa5571732310e")
   (:FILE "src/storage/control-payload.lisp" :SOURCE-SHA256
    "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/storage/control-payload.fasl"
    :FASL-SHA256
    "6c31691da6ff7fcdcc20fab2ad0ed90dde4c75a512fbac05bfdf91d61629e102")
   (:FILE "src/storage/compaction-scan.lisp" :SOURCE-SHA256
    "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/storage/compaction-scan.fasl"
    :FASL-SHA256
    "ba86fc488d260c4007e8960c8f82acf69fabc9d1b2044be40af5f1372d49216f")
   (:FILE "src/series/worker-types.lisp" :SOURCE-SHA256
    "a366799fd9b938bfaa48b0ffda228ff8369ab9acb5b5ead7f081dfc66ab2c81a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/series/worker-types.fasl"
    :FASL-SHA256
    "b6c44f3756eadacb85ee57b622790d4e0b5b34799b2f237c5eab5b2ff6a56ced")
   (:FILE "src/series/worker-run.lisp" :SOURCE-SHA256
    "f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/series/worker-run.fasl"
    :FASL-SHA256
    "1cdc314b8b8814fc2f6b1fa936add700c6cca618c7a769393e75d7c1163d5eb7")
   (:FILE "src/series/worker-package.lisp" :SOURCE-SHA256
    "dcab7a17e4fabcf256c2eddfb655d18145a1d789dd8d64a889945badc418e4b7" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/series/worker-package.fasl"
    :FASL-SHA256
    "ef33b5bda64e45fb3ffc3880fe8e659024dc40b2ea901f1030278180a26f46c9")
   (:FILE "src/series/worker-boundary.lisp" :SOURCE-SHA256
    "793d401d1b9acc7b67923d815560f277f3d390ca050740f735f07d88dbacfe73" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/series/worker-boundary.fasl"
    :FASL-SHA256
    "3f915c9b6b6d07e7c263a691cda21f47423ec887c264c73891d97c902e8909be")
   (:FILE "src/series/types.lisp" :SOURCE-SHA256
    "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/series/types.fasl"
    :FASL-SHA256
    "e55b6926af9be957551495e241aad752e6b6a0ce61bd7e287bdb74eda8c4cef7")
   (:FILE "src/series/routing-types.lisp" :SOURCE-SHA256
    "31ae51c0fb11a802164a4d1e11ec63f835a2c67b52c751c5685bcc8947e5e0f1" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/series/routing-types.fasl"
    :FASL-SHA256
    "87d30b70a5eab360e4867f657bd090f0c708ad2991e0ebc9b1530e720a8b48b9")
   (:FILE "src/series/routing-select.lisp" :SOURCE-SHA256
    "796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/series/routing-select.fasl"
    :FASL-SHA256
    "fc642d2310590ba22a2a07734009ddcbf4753add682579c4a0eed00e689759ca")
   (:FILE "src/series/routing-build.lisp" :SOURCE-SHA256
    "70135e73ecb1f6080683dd615c47a50530485061797382d74441743cd9a0f92d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/series/routing-build.fasl"
    :FASL-SHA256
    "45522fe0dfc9528193413143475b4fe7a43449cb00c040dda61cce40a2a3e83b")
   (:FILE "src/series/retirement.lisp" :SOURCE-SHA256
    "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/series/retirement.fasl"
    :FASL-SHA256
    "ac7ccf666738373162df09785f4beba0f61d9591e36d32d20b0ad4bc84b41b25")
   (:FILE "src/series/query.lisp" :SOURCE-SHA256
    "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/series/query.fasl"
    :FASL-SHA256
    "e61e4e715997b3dfa23db32993dd01fdb8176ae6ea1c550c3b188bae6267dd97")
   (:FILE "src/series/publication.lisp" :SOURCE-SHA256
    "2afb3846f4d034e3ee819075dccf69f2030da2dd67919028a14427c447f9d7bc" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/series/publication.fasl"
    :FASL-SHA256
    "74f30f2574cf32f2b752a80bd32e735d91ddd1d2b76953a56e95086c2149ed7a")
   (:FILE "src/series/package.lisp" :SOURCE-SHA256
    "9a402f5225860c483dec9064a84d6462d28f5377a27977a63f64a5fbdbdd3764" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/series/package.fasl"
    :FASL-SHA256
    "4a890681724d676a19875f0f6b8577cde1c8a1b386012db2c6edaca054941427")
   (:FILE "src/series/ownership.lisp" :SOURCE-SHA256
    "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/series/ownership.fasl"
    :FASL-SHA256
    "0393c6d13fa3ab2339ca319b172696d4c5e497e68eba5d238a6e67018fd16f16")
   (:FILE "src/series/io-events.lisp" :SOURCE-SHA256
    "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/series/io-events.fasl"
    :FASL-SHA256
    "245988459cd4a1469551f44b42735ede2095a7b24786c24823ab0cb055bdd333")
   (:FILE "src/series/events.lisp" :SOURCE-SHA256
    "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/series/events.fasl"
    :FASL-SHA256
    "7a476ecf6cdfcaa1177364da475eabab23b26425d0b8721dfaef98c3568bbd95")
   (:FILE "src/scheduler/update.lisp" :SOURCE-SHA256
    "e35a704ee0b9445c559a768de048169a8e39837a6df21843d8df58215c482472" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/scheduler/update.fasl"
    :FASL-SHA256
    "56fa77fa9d496278b8bb305f56485cdcb83d22f6b5dc65ca9d0b21b67e6d5a21")
   (:FILE "src/scheduler/types.lisp" :SOURCE-SHA256
    "3b174be0919f8b27312ada4071d831c3753d62bb12be99d7e9394c48dcab474a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/scheduler/types.fasl"
    :FASL-SHA256
    "e25b611a52c90e00ca1670be6b8252fc9edd39a700e80a4d5c2821bdb0a9974c")
   (:FILE "src/scheduler/read.lisp" :SOURCE-SHA256
    "5cdc1e5b7ba97c9aab66a5acaf74336b0df33144e24104e0242b7fc2552a1ae2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/scheduler/read.fasl"
    :FASL-SHA256
    "3e3589b0840e799d4b1066cb0c8e1b0ce3db0c048bf87d8b24eaeef71e0e2c6a")
   (:FILE "src/scheduler/policy.lisp" :SOURCE-SHA256
    "92b3ca3a81ae0b3ac342a63e5fe5c5d7524091a63065b0232c14c57ee80c4aac" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/scheduler/policy.fasl"
    :FASL-SHA256
    "5f05355242dda48f23cf519b3ed4b7d9afda75032de23e1792a1ab599f122b05")
   (:FILE "src/scheduler/package.lisp" :SOURCE-SHA256
    "5a139172de1648b30e09fdc6fc068141299c2034702f8d5b5f44bb0de14a3112" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/scheduler/package.fasl"
    :FASL-SHA256
    "9a17d3bc9ae47d76e5ba540a9fe90ef523df0025ef6ef4c5f4f6acaf8e20ee0c")
   (:FILE "src/scheduler/lifecycle-worker.lisp" :SOURCE-SHA256
    "ec8b462ff3f5f7a6435f0f0c01b62034d8de2a784a9e354d469a0adfec9cf837" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/scheduler/lifecycle-worker.fasl"
    :FASL-SHA256
    "8f401b80f628b6076a160d4f5267554d7e492812585dd4a6c636bd0f48111b6e")
   (:FILE "src/scheduler/lifecycle-update.lisp" :SOURCE-SHA256
    "2020e46809e9fe8fa74e061a420b8085679d5f461eabd8b044f3975c1024800e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/scheduler/lifecycle-update.fasl"
    :FASL-SHA256
    "83e6049f730fae247699abd45897a3597f4e38c7dc6c261f9d65d408274b2bd0")
   (:FILE "src/scheduler/lifecycle-types.lisp" :SOURCE-SHA256
    "4fe980e00f1d273e9b8278cd2daace6b4a9e4ab948ddfac83b79f4b0c537cb7c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/scheduler/lifecycle-types.fasl"
    :FASL-SHA256
    "02776383b8caed999e6f421fe4b38f4a9416d88ea6f88fbfb30c2c218800527f")
   (:FILE "src/scheduler/lifecycle-read.lisp" :SOURCE-SHA256
    "c60e1d5f67eeafb216b374fa001d27f87d1a734c5d066fc092902c0301069200" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/scheduler/lifecycle-read.fasl"
    :FASL-SHA256
    "43c8340d7bc4b17ac226d66f0d5d502ab0f1fa8b237f2b8b479bd4778cff42dd")
   (:FILE "src/scheduler/lifecycle-build.lisp" :SOURCE-SHA256
    "d6d67faf8721f26e7fcd228d6ab9a7dfdc36ff5ec56c67ed9e5fb6d914006a9e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/scheduler/lifecycle-build.fasl"
    :FASL-SHA256
    "bbaa5689b96c2a0dfbf5f047c02d977ae78b97094d6c4a5d5af1443c6c7e45c1")
   (:FILE "src/scheduler/build.lisp" :SOURCE-SHA256
    "58baf595f221826c64e3fb38344242c3bdf403d65904193bf1a8e06e09d7c336" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/scheduler/build.fasl"
    :FASL-SHA256
    "364a01b11abb25d77ec934e1a1eab891795eddbbc93266742ec1cb719a859e79")
   (:FILE "src/recovery/scan.lisp" :SOURCE-SHA256
    "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/recovery/scan.fasl"
    :FASL-SHA256
    "970b59f99abb99e279aef5adc1a6b7d9d81a13b78394dfa34869136d3978454f")
   (:FILE "src/recovery/package.lisp" :SOURCE-SHA256
    "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/recovery/package.fasl"
    :FASL-SHA256
    "b4a311ccb3f6b5aa57141dd42bcbb049c6c2aab0d1ee452868e51af9e5f9536a")
   (:FILE "src/recovery/manifest-types.lisp" :SOURCE-SHA256
    "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/recovery/manifest-types.fasl"
    :FASL-SHA256
    "a9ed4a020fa7198f82c7370287b257e911b3f9ba6bfe4d8b1ff438889a6ef9c1")
   (:FILE "src/recovery/manifest-query.lisp" :SOURCE-SHA256
    "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/recovery/manifest-query.fasl"
    :FASL-SHA256
    "4351a7b48462f67f2c13d7f578bf055260edf546c58edcacaf3eaf4082ba2481")
   (:FILE "src/recovery/manifest-package.lisp" :SOURCE-SHA256
    "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/recovery/manifest-package.fasl"
    :FASL-SHA256
    "ebf3fe885b45a30d5e0cb5df4276dd4eea10b65bf25ce9363cba0904b3a79ec1")
   (:FILE "src/recovery/manifest-fold.lisp" :SOURCE-SHA256
    "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/recovery/manifest-fold.fasl"
    :FASL-SHA256
    "6638dc06c6ed7e5dcd260482eb940e8ae4bff9c6e7badb18ab9a9d3b1bb9be83")
   (:FILE "src/recovery/manifest-decode.lisp" :SOURCE-SHA256
    "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/recovery/manifest-decode.fasl"
    :FASL-SHA256
    "b2ead6b4ce6d4a8928cf6045e6e79ffdc4f497243f574f234424c216382ab8cb")
   (:FILE "src/recovery/manifest-build.lisp" :SOURCE-SHA256
    "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/recovery/manifest-build.fasl"
    :FASL-SHA256
    "0267a0fd7a674a25216b842f40069f45d2edca0ee0147c42cc607616f25843e5")
   (:FILE "src/recovery/inventory-types.lisp" :SOURCE-SHA256
    "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/recovery/inventory-types.fasl"
    :FASL-SHA256
    "3413a6ff728606296e69c8814872576c1d4e16d45d0dd39bd846f6e6858ae48e")
   (:FILE "src/recovery/inventory-query.lisp" :SOURCE-SHA256
    "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/recovery/inventory-query.fasl"
    :FASL-SHA256
    "ea36f99acadc588399b59d097cf6726d147ed9bf69e45245bbc3b960f48566e9")
   (:FILE "src/recovery/inventory-build.lisp" :SOURCE-SHA256
    "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/recovery/inventory-build.fasl"
    :FASL-SHA256
    "c936abdba6c64ceee63c7bc4135079b4c7940e450c7b466425cbfa470832ce42")
   (:FILE "src/recovery/decisions-types.lisp" :SOURCE-SHA256
    "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/recovery/decisions-types.fasl"
    :FASL-SHA256
    "99c708bbbeddedc1b9f149472c994c3ad2d72491eded8620afdc200f1840b827")
   (:FILE "src/recovery/decisions-sort.lisp" :SOURCE-SHA256
    "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/recovery/decisions-sort.fasl"
    :FASL-SHA256
    "4a5b2f2bb1032d54b6f3f71e08cca325e04d93c4079c77bf0aa57fe513ae722d")
   (:FILE "src/recovery/decisions-radix.lisp" :SOURCE-SHA256
    "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/recovery/decisions-radix.fasl"
    :FASL-SHA256
    "0be52c288df2cde2e30c8eb6729b2a81bde855b31afafca97fe307ddef55f09c")
   (:FILE "src/recovery/decisions-query.lisp" :SOURCE-SHA256
    "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/recovery/decisions-query.fasl"
    :FASL-SHA256
    "ebc32365e13473e39b367e699b6bd11875e4fa81b51e647e7fed04318a23981f")
   (:FILE "src/recovery/decisions-package.lisp" :SOURCE-SHA256
    "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/recovery/decisions-package.fasl"
    :FASL-SHA256
    "00dd77afba442318995d335a1bffc359035e7b5935c8c526c608500c377b2343")
   (:FILE "src/recovery/decisions-build.lisp" :SOURCE-SHA256
    "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/recovery/decisions-build.fasl"
    :FASL-SHA256
    "8d291a74b9db6c55f66a68395def3a3c1534aaa8b73d0f0cf611f23cc5cd10f2")
   (:FILE "src/read/types.lisp" :SOURCE-SHA256
    "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/read/types.fasl"
    :FASL-SHA256
    "02c3119cd1e830a3de8127bfe07ee2115dfd2af661317d9bb3472190f007ddef")
   (:FILE "src/read/task.lisp" :SOURCE-SHA256
    "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/read/task.fasl"
    :FASL-SHA256
    "020eacf0771efc49a611f1afb30f628515e5d9eeeb428411f81a30fce4c49049")
   (:FILE "src/read/package.lisp" :SOURCE-SHA256
    "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/read/package.fasl"
    :FASL-SHA256
    "d69a2d78e93e791eb1abc6f983824093e0d9b1a2f5345cfe13930aaa1ac031a3")
   (:FILE "src/read/core.lisp" :SOURCE-SHA256
    "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/read/core.fasl"
    :FASL-SHA256
    "248e0280d00a9fdefdb9ae29b7d27544b4ad6978824d07b99bededc8f7360eed")
   (:FILE "src/package.lisp" :SOURCE-SHA256
    "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/package.fasl"
    :FASL-SHA256
    "47726637c826e3dd3ef08e0fc5c3afdc6f083001055bd81c47abab91b5203dcd")
   (:FILE "src/mvcc/types.lisp" :SOURCE-SHA256
    "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/mvcc/types.fasl"
    :FASL-SHA256
    "dc8129f836f2d247220e95208b3782b208bbc5a62a94455d9b84aa10d732edfc")
   (:FILE "src/mvcc/snapshots-types.lisp" :SOURCE-SHA256
    "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/mvcc/snapshots-types.fasl"
    :FASL-SHA256
    "dbef88bf4e71948c8433b9a79f191a6fbc6d5978a43910e9cb2c9b306245a423")
   (:FILE "src/mvcc/snapshots-register.lisp" :SOURCE-SHA256
    "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/mvcc/snapshots-register.fasl"
    :FASL-SHA256
    "6db5fed7c9e97d43dc199cd1e2d65da8eb0de52e7fdb0b4ca16f63e78d168b3e")
   (:FILE "src/mvcc/snapshots-read.lisp" :SOURCE-SHA256
    "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/mvcc/snapshots-read.fasl"
    :FASL-SHA256
    "dbd04d5875b8fc2644d507e482944760d49a8f03484228eb057c3f01077ea1f2")
   (:FILE "src/mvcc/snapshots-lifecycle.lisp" :SOURCE-SHA256
    "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/mvcc/snapshots-lifecycle.fasl"
    :FASL-SHA256
    "257c3e9f482b5119048c7f5ee6d91da49339200b418eb629fb073606114f6915")
   (:FILE "src/mvcc/snapshots-csn.lisp" :SOURCE-SHA256
    "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/mvcc/snapshots-csn.fasl"
    :FASL-SHA256
    "6a41c0b2c500f9ff281b55753d67566b552dcf01d415265cc06dbd9717cf9c57")
   (:FILE "src/mvcc/snapshots-core.lisp" :SOURCE-SHA256
    "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/mvcc/snapshots-core.fasl"
    :FASL-SHA256
    "8ee7a50028ad860933196c30832eff44bdfcf9c5b071e333ec1fb611e7f4e2f0")
   (:FILE "src/mvcc/package.lisp" :SOURCE-SHA256
    "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/mvcc/package.fasl"
    :FASL-SHA256
    "1edd7048993867b0d0a7d5cf15fb3f3cfe85470f3d7f2965bcd4f788f312d4f5")
   (:FILE "src/io/types.lisp" :SOURCE-SHA256
    "63e3c4af997e26aaa48cb1df6298aaf97bb3971b88e59e8b7fa2c3736617450a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/io/types.fasl"
    :FASL-SHA256
    "c51f5f053916ba3b453df92e36f2035bddadc4f4fd1dd33177eef6da26b8558c")
   (:FILE "src/io/transfer.lisp" :SOURCE-SHA256
    "c807f294d0211e8433f8f0332ab6ba3ce7d9ae7de3818f43af7ff8d7fcfd341a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/io/transfer.fasl"
    :FASL-SHA256
    "e52c6843884a4dfa5e098155e3286004792777bfc4b0e7496bd0b5ea3c53aa7a")
   (:FILE "src/io/package.lisp" :SOURCE-SHA256
    "a2437f320b170b4e8df8684ee9b61ab317b8aa10d3c107461450551ff7aec4bd" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/io/package.fasl"
    :FASL-SHA256
    "12f77139ef198d1fb15eb1456cbeae0cd469e656e930eaed95cf58878d5f858d")
   (:FILE "src/io/native.lisp" :SOURCE-SHA256
    "74f63dbb2137a344054e82c6707e6262473b3332ff66a85f79ecfee9fd50f9b4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/io/native.fasl"
    :FASL-SHA256
    "0f494a352371b0b811347a8f5b3fb80a74a09fa1ea7ef87d0930603e61348994")
   (:FILE "src/io/lifecycle.lisp" :SOURCE-SHA256
    "baa1f763fe0f394a14d381b753dcb1be1e90eb03eaff5d6469465b5d4eca015f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/io/lifecycle.fasl"
    :FASL-SHA256
    "81f99eac4b0b7bfa4a31079e2d06da7d73497089caf161672f8473d54296ce8d")
   (:FILE "src/io/identity.lisp" :SOURCE-SHA256
    "d2b6f7932b66f2ef74241e573ed253cf9b710f217cd570ef23f6671614d90a2c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/io/identity.fasl"
    :FASL-SHA256
    "ce4d7bfc3463811b486c14f1c4abbc1d047ee973970187e35c3c770dd226f826")
   (:FILE "src/io/identity-types.lisp" :SOURCE-SHA256
    "5794dd5094f34c24e7e09e4a7937f1988d85ea9cd37e478abaf836273da5d5c1" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/io/identity-types.fasl"
    :FASL-SHA256
    "9a14808470ab05c497d3aae1e0a2889c1f5ecc93b7e8ae462f391015946fa424")
   (:FILE "src/io/flush.lisp" :SOURCE-SHA256
    "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/io/flush.fasl"
    :FASL-SHA256
    "a15f8a460948d5a5e6019dd4e45e039e538de3d1185a554102f3622cfda9fe79")
   (:FILE "src/index/write.lisp" :SOURCE-SHA256
    "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/write.fasl"
    :FASL-SHA256
    "15d10b2755bb69b1fc6e2a7f11f442110e6adedd07be348c6632f2f936c9757d")
   (:FILE "src/index/validation.lisp" :SOURCE-SHA256
    "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/validation.fasl"
    :FASL-SHA256
    "ddce706deb4faa104420c94e7681593751186604cc97ad8c659d1ec8e9f3d0e9")
   (:FILE "src/index/types.lisp" :SOURCE-SHA256
    "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/types.fasl"
    :FASL-SHA256
    "831b005a02f3af7eb2a478a7d6446f8dcd1c2b953bc6c712e8c2fd9caffe3f54")
   (:FILE "src/index/relocate.lisp" :SOURCE-SHA256
    "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/relocate.fasl"
    :FASL-SHA256
    "2920fd08c350d75f2893b7c2c4fa810bee9d61db0290739ab4e3e29ab95b18b8")
   (:FILE "src/index/rebuild.lisp" :SOURCE-SHA256
    "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/rebuild.fasl"
    :FASL-SHA256
    "002cc1102b316eb26d3d15e09d0ac5e8c8dc84f9a4da06518c672d4d898895d6")
   (:FILE "src/index/rebuild-scan.lisp" :SOURCE-SHA256
    "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/rebuild-scan.fasl"
    :FASL-SHA256
    "f4cc8b450bb7612568f25e4b3df7ccab1cc63f0965ad477f06831e510f5abc1e")
   (:FILE "src/index/rebuild-copy.lisp" :SOURCE-SHA256
    "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/rebuild-copy.fasl"
    :FASL-SHA256
    "86eb308066bc682471c6c4918262ff2afd2044639aba58db54b9c5bdf656d489")
   (:FILE "src/index/rebuild-budget.lisp" :SOURCE-SHA256
    "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/rebuild-budget.fasl"
    :FASL-SHA256
    "a75f85aaa62baaaee96b3c280d32d4c3398d06e74c35fbcc15d62fea50bc0c2f")
   (:FILE "src/index/read.lisp" :SOURCE-SHA256
    "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/read.fasl"
    :FASL-SHA256
    "81e32f625e0fb16d5009c381ff54b0db09729061963d8f176e33e00d9e7892e2")
   (:FILE "src/index/primary-write.lisp" :SOURCE-SHA256
    "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/primary-write.fasl"
    :FASL-SHA256
    "e8af2a84a375485ee1c275b0796a9d404bb94edbf2a49313dbdbddbc9ce4410e")
   (:FILE "src/index/primary-types.lisp" :SOURCE-SHA256
    "f17ca0dcd8a538b921f00044e23872b28272638c4435eacd30f0509422505e64" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/primary-types.fasl"
    :FASL-SHA256
    "76c8ee7640e0887e90612923dd4b15e626e72064bfe7ee70d03cc128b7af3c74")
   (:FILE "src/index/primary-relocate.lisp" :SOURCE-SHA256
    "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/primary-relocate.fasl"
    :FASL-SHA256
    "f66b064c3ccd4924550c96661f3a597153326361b08b3f551435e37a9200acfc")
   (:FILE "src/index/primary-read.lisp" :SOURCE-SHA256
    "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/primary-read.fasl"
    :FASL-SHA256
    "8848956feca016270aa7ac205ad93e1ef4444564c7066a45afc0def2072c8c5b")
   (:FILE "src/index/primary-probe.lisp" :SOURCE-SHA256
    "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/primary-probe.fasl"
    :FASL-SHA256
    "a836b3449795aeed1eba287e11ed115b76001d767773187b87a49ea5396ada3c")
   (:FILE "src/index/primary-package.lisp" :SOURCE-SHA256
    "0682eb9a61596506b6788bd0285f9808db2496246caae64ab3203182ed46b860" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/primary-package.fasl"
    :FASL-SHA256
    "5d30d424a0226c49d1686626554df112f58beb7132b2c8be19a76aff01fee03d")
   (:FILE "src/index/primary-directory.lisp" :SOURCE-SHA256
    "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/primary-directory.fasl"
    :FASL-SHA256
    "0a09b285e11db4a37513ae931efd8074365787fcd8866d257fafc71c790d44d2")
   (:FILE "src/index/primary-core.lisp" :SOURCE-SHA256
    "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/primary-core.fasl"
    :FASL-SHA256
    "dcf52796846ecf757c8858d25d53626e949f14512aca416b46b0e4950bf3a4c1")
   (:FILE "src/index/primary-build.lisp" :SOURCE-SHA256
    "06ca5ac8c03504e2d2f973873e5cabf7518c090cd1f8f2118c46e0ea2f9bf37b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/primary-build.fasl"
    :FASL-SHA256
    "677598d927a20456bd4eee73cba7bf3a54b007541b6fb596fa2490c9b33ccb4f")
   (:FILE "src/index/primary-arena.lisp" :SOURCE-SHA256
    "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/primary-arena.fasl"
    :FASL-SHA256
    "dc156411c16c8efe2726b860f51c352c76b53b3fbf86a37fc216304941018d8f")
   (:FILE "src/index/package.lisp" :SOURCE-SHA256
    "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/package.fasl"
    :FASL-SHA256
    "49f0fabae75a2c6a942238c7fdb5b87868bd0e7f41ad9c418063cc4ad9dc40cb")
   (:FILE "src/index/hash-seed.lisp" :SOURCE-SHA256
    "ae86514101e95737747ba58a4f0c5dc1ddb44d2b3a18bceb8fd0d0756b57a7a1" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/hash-seed.fasl"
    :FASL-SHA256
    "b51e6e26d539bd65d1f84b8a609d8815a1260a7cb3a87fe7140a4d09853e801c")
   (:FILE "src/index/hash-digests.lisp" :SOURCE-SHA256
    "924bb7dab91ff56c1e909f2b06dff5f74b443ac6442e379498f29b25f1fa2673" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/hash-digests.fasl"
    :FASL-SHA256
    "35ed3f525f01f6c660b3574636663d972123ab7fc9759c80f5187b8431ff1005")
   (:FILE "src/index/core.lisp" :SOURCE-SHA256
    "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/core.fasl"
    :FASL-SHA256
    "e7e209f6b6f92ac77678526d8c39ad3c2fc2ff962496461364bec1a85b6bcd1e")
   (:FILE "src/hash/package.lisp" :SOURCE-SHA256
    "1e7668fa26fc1a8e3b3cfe824aa3e08b30b57441d5f90d44453fc3a9259a10d0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/hash/package.fasl"
    :FASL-SHA256
    "42860c0c8f9b66e747339a6f130bc994cd961ad78a3651ae1009be3f076a83e8")
   (:FILE "src/hash/hash64.lisp" :SOURCE-SHA256
    "99e4c8394a8f877ce1f552f15a57a082c0ec81015e87119ee4ffea28cf3ae77f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/hash/hash64.fasl"
    :FASL-SHA256
    "c01c00a10bc4381a22e040f9c3498d953fb5d8e4a1419e8a0750a960101e19a6")
   (:FILE "src/hash/blocks.lisp" :SOURCE-SHA256
    "5f5dff95ae6c34dfc15538c537ba2fa8d34ba2376ad66ad9975745ea13a2175f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/hash/blocks.fasl"
    :FASL-SHA256
    "97701a07892155aefa7e31b8cce12d1bf5fc642250cb750f46b45d7e0d7b1e4d")
   (:FILE "src/hash/arithmetic.lisp" :SOURCE-SHA256
    "c439e534b768acb123d69b921b85e1e56683aa8335bbc87efba95fe95f256fa9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/hash/arithmetic.fasl"
    :FASL-SHA256
    "888658d837da3c5b12a9fe9191c47509824433066660c5c4e966bb791ac6890f")
   (:FILE "src/get/types.lisp" :SOURCE-SHA256
    "653b23a6e719cd1f55e7c58b4d7e8143aec5983992ba210d0eac1f4c8682f623" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get/types.fasl"
    :FASL-SHA256
    "15e56303555403a8717e312526860b86f9229bbc3c58f0e830ead1dfc256d790")
   (:FILE "src/get/target.lisp" :SOURCE-SHA256
    "9f682f735e49108cad176a6143ec99e1be64da98f29cae0b52f9b49cdea34250" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get/target.fasl"
    :FASL-SHA256
    "83adb19c1095f8586d6e8f14a03fa43bc209de7ac86eddf90b08dd00382bcc99")
   (:FILE "src/get/segment.lisp" :SOURCE-SHA256
    "4a486528cb2c1cc3471cb4b332d4314d24011889e1f885db6fd5600bb077eea3" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get/segment.fasl"
    :FASL-SHA256
    "4bec3e7bbae382cd2906af0b09dcf3751d39575f980105dd5ca461d415a49621")
   (:FILE "src/get/package.lisp" :SOURCE-SHA256
    "87b795779aef0c4b918a039d182daddd22b902a9ad10c763df4364b7e630151c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get/package.fasl"
    :FASL-SHA256
    "68cb4976224cfa3109d18f9b36e54015685899a4485e0caca6962f452c92f869")
   (:FILE "src/get/lookup.lisp" :SOURCE-SHA256
    "9d1042d4cf1e7bd9c6d1153de12b2459e7a2724e47bd32534cd7ae56cb274c5f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get/lookup.fasl"
    :FASL-SHA256
    "6bc2c805548b54fcffb5fa761e5c4a6fe9a80a7b467b50ad0ebb1b08c9c86da2")
   (:FILE "src/get/lifecycle.lisp" :SOURCE-SHA256
    "885ba4141114ea411cac37c9b5f924aaa7f9f2a5ba311ebf92a392e5da1e3c59" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get/lifecycle.fasl"
    :FASL-SHA256
    "8189883d66a17eccecec8bbd3aad8d34bd3bb93fb21d4725da57e0c4e5886127")
   (:FILE "src/get/build.lisp" :SOURCE-SHA256
    "bcfc4916e9a85833dc151c4ce176bc905f2c03b6bc6d636f97a60df0d8c16739" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get/build.fasl"
    :FASL-SHA256
    "536218017b066209cfa7f2db82a67d702eeb44d36b03ad825dcf012b3f7e258f")
   (:FILE "src/get-resolver/types.lisp" :SOURCE-SHA256
    "b847d6c388f4d052a2d707b7c410cc7c2ef60482fb5cd9ef384c016c31d1dc00" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-resolver/types.fasl"
    :FASL-SHA256
    "0e5793ccfa60c8e97799a0505a69bc244aa7efe0229984cb7965729e0172c96c")
   (:FILE "src/get-resolver/sort.lisp" :SOURCE-SHA256
    "974bf44efeb1cd26c5e9db0601aea295c8f1a18234894ad9d41938a2880e2255" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-resolver/sort.fasl"
    :FASL-SHA256
    "3318cc36a0359c44b99c45edce9bea18c2f72fac3f0dd841109acbbb049ab926")
   (:FILE "src/get-resolver/scan.lisp" :SOURCE-SHA256
    "35a1780c6bf66364ef94c4151fa91f02eebe359f0ca0639985d2a907fd9d512d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-resolver/scan.fasl"
    :FASL-SHA256
    "b209643b0d26034de7f9bc2861df0ccbdbdb956d91a1400906710f98cb38c82e")
   (:FILE "src/get-resolver/rows.lisp" :SOURCE-SHA256
    "d9db85d788006fc7ad1f9a7cdeef28b992605de7fac8c295dd7fdc51f5511854" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-resolver/rows.fasl"
    :FASL-SHA256
    "9952b1955ab51d4e429b8e1a7ac0e890dc264b064fbcefea39c027ddb8cdb4c5")
   (:FILE "src/get-resolver/read.lisp" :SOURCE-SHA256
    "dd100bb17e15589124916767f8a690ae683ac8c462102c778639f917a5f1924d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-resolver/read.fasl"
    :FASL-SHA256
    "12ca3f78c1249e43c081f45c38905b47d585823808bf06c035937567f4df39aa")
   (:FILE "src/get-resolver/package.lisp" :SOURCE-SHA256
    "663a5a15a630ed2b9042a3a3365598358df97d3dd1cd3d7610b283526281f39a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-resolver/package.fasl"
    :FASL-SHA256
    "b36e3341ff734e3fd36efd9dffba69b9dbebdc0ae16a03371a13f5aaf03382b5")
   (:FILE "src/get-resolver/build.lisp" :SOURCE-SHA256
    "c649c80c2b510669fc1c0a7f15b3080b7fb46a3423a1e49db5bb9ff248176e0a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-resolver/build.fasl"
    :FASL-SHA256
    "27b6f9c6a67de60576eff0eac339a596091f447671dde8cbc0f2be5348c1558e")
   (:FILE "src/get-resolver/active-types.lisp" :SOURCE-SHA256
    "a3cb954a265b263e0e03d2f1a80824589670efbf89adcd69007987d26df2e29a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-resolver/active-types.fasl"
    :FASL-SHA256
    "782eca3063f59bd8f52e995401fa3c4d5e64c56f15a24ef2729d08ee3d2f1dcc")
   (:FILE "src/get-resolver/active-scan.lisp" :SOURCE-SHA256
    "97dd4f59d4449334b113e9403a208007ed1a398a9b53f88bda3e3c0bbf3a1067" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-resolver/active-scan.fasl"
    :FASL-SHA256
    "72814e2ac1353914fb793455ab7a5d22b73ea780524daffd353ccc74d1480717")
   (:FILE "src/get-resolver/active-read.lisp" :SOURCE-SHA256
    "47630e5d42c785e39e15dd714177cd86159129a5391d82321385f92317bea659" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-resolver/active-read.fasl"
    :FASL-SHA256
    "8efa334baba67e25631be2cefc5e905b20f7bfb2e92774f3a3d6d2fe5ac82f10")
   (:FILE "src/get-resolver/active-preflight.lisp" :SOURCE-SHA256
    "eb56f5704666cac3a88ec97f58f70c7d61db2e8feea6a094db4c468a1a2775a9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-resolver/active-preflight.fasl"
    :FASL-SHA256
    "9070f3295d0d73340c2080cc768fa3531465441cfa596150c958cd8e0aa97ada")
   (:FILE "src/get-resolver/active-init.lisp" :SOURCE-SHA256
    "2f9380674cf4b590b071ab9d769a4b79292f544d920c0fc5ff33146dde7686f6" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-resolver/active-init.fasl"
    :FASL-SHA256
    "3c299bf5e9186a2ba0531abadc351448aae3becd6a7b00833369e21696a93562")
   (:FILE "src/get-resolver/active-directory.lisp" :SOURCE-SHA256
    "c2b9a9ac3209270e9949720473908460548430a8098c9199fb55d2317a87682b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-resolver/active-directory.fasl"
    :FASL-SHA256
    "a9d56c4444d237f78af8f3c52b10553a309907b395c44e296962e6e16ccada57")
   (:FILE "src/get-resolver/active-build.lisp" :SOURCE-SHA256
    "0eed95930d41c515965ae8ab0a14fbb94597a42ea38b86f205ea0938cf4631de" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-resolver/active-build.fasl"
    :FASL-SHA256
    "6e8e622e3891724ad050017a3409be8d353c462b1972797d4f36c521b9c8ed47")
   (:FILE "src/get-directory/types.lisp" :SOURCE-SHA256
    "0e2348291a4994f45bd1f6fe5efdc66041d2fdce18641d1af11b6c850ed69b2b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-directory/types.fasl"
    :FASL-SHA256
    "12c347d1fc7e4d5c57874c1ab449f0a91ee0bb1bef06e0fbdb201aac12e67027")
   (:FILE "src/get-directory/sources-types.lisp" :SOURCE-SHA256
    "862342b07d6a8aae834aaf3da4149682fcd1dcbdae971adad640597583547099" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-directory/sources-types.fasl"
    :FASL-SHA256
    "5eaf74ca3b8c0b0884fd7a86c69571281d300af53a33a54af95885cd087bbd82")
   (:FILE "src/get-directory/sources-read.lisp" :SOURCE-SHA256
    "ee4a3b81322fbd51ce928be0b73e9bc180af7ed39f936b68ec9a152dd2a180c2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-directory/sources-read.fasl"
    :FASL-SHA256
    "e4e9ef62b84337a6e2ecb84320a085c6a9a25f333c7cf887d3bb29f81e496954")
   (:FILE "src/get-directory/read.lisp" :SOURCE-SHA256
    "a2287eb7e91bed84f3727baaf81376bbe5bf5df15cde1ea268c6d2fa66fe0a5d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-directory/read.fasl"
    :FASL-SHA256
    "a60f6aa535ad583b175e77a81f990ede1e04918cfe1d0d068ecff3a4eb29e0a5")
   (:FILE "src/get-directory/package.lisp" :SOURCE-SHA256
    "e779202c8df502749a81d0c6f9f0d505d000e09231f3679b1a91303fbcbf36f9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-directory/package.fasl"
    :FASL-SHA256
    "8de8255d9075c1dc507b0dcb55e5b94da1c41e91179fbb2071ea04d960cdf7bf")
   (:FILE "src/get-directory/build.lisp" :SOURCE-SHA256
    "9bebb3cd9d66a8ec2fd0c72ad828e00ab2347093642653da45ef263bc855f947" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-directory/build.fasl"
    :FASL-SHA256
    "543fd3f6d7ee46fc9523642d46ae84827b23da818793f069bbf5fa13ae4a26ab")
   (:FILE "src/foundation/record.lisp" :SOURCE-SHA256
    "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/foundation/record.fasl"
    :FASL-SHA256
    "876c400ae1806c212a46ae67b7344b798a20596e4889250fdb64124e4b3f7684")
   (:FILE "src/foundation/package.lisp" :SOURCE-SHA256
    "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/foundation/package.fasl"
    :FASL-SHA256
    "d7d04bcc0eca2eff64de4f7db59540287e3b1626e539d64e2406271e7b95c6d0")
   (:FILE "src/foundation/crc32c.lisp" :SOURCE-SHA256
    "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/foundation/crc32c.fasl"
    :FASL-SHA256
    "9addc0105f93762236052380c96c2753edc50f25e2aa32bbc3257225375d31ca")
   (:FILE "src/foundation/conditions.lisp" :SOURCE-SHA256
    "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/foundation/conditions.fasl"
    :FASL-SHA256
    "45374e95c9bf0b004337e9c246ac908708f3bd8d159423e4ce4922fe8dc67587")
   (:FILE "src/foundation/binary.lisp" :SOURCE-SHA256
    "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/foundation/binary.fasl"
    :FASL-SHA256
    "3590983c92ff3df63f8f63c8df0e3f89a8d7d2fede7a4b53fe01747b7e3d7da0")
   (:FILE "src/foundation/batch.lisp" :SOURCE-SHA256
    "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/foundation/batch.fasl"
    :FASL-SHA256
    "42e42b3f57c6b79ff48beabc05445a717ec8f368c227d393ad0dcdd23d67c969")
   (:FILE "src/execution/writer.lisp" :SOURCE-SHA256
    "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/execution/writer.fasl"
    :FASL-SHA256
    "dea2201609a2ff2fcf98594a2fde979269aaa31acc66c5bcf9141d6ae5177217")
   (:FILE "src/execution/worker-types.lisp" :SOURCE-SHA256
    "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/execution/worker-types.fasl"
    :FASL-SHA256
    "74166ffef192e8c0fd0bb0d5679f8f191913c1428c2cec4a622a91ced1c09c43")
   (:FILE "src/execution/worker-run.lisp" :SOURCE-SHA256
    "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/execution/worker-run.fasl"
    :FASL-SHA256
    "3db2fb0803fc982df007c32cb20ea75f7116431a0b6a4695fa1b86909dca2ca1")
   (:FILE "src/execution/worker-claim.lisp" :SOURCE-SHA256
    "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/execution/worker-claim.fasl"
    :FASL-SHA256
    "b1a616f9f35fceb2dda41b5f82e3f2d8bf81dd4f62652a1171b1ac874d0c733b")
   (:FILE "src/execution/worker-boundary.lisp" :SOURCE-SHA256
    "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/execution/worker-boundary.fasl"
    :FASL-SHA256
    "c67527cb310fa906e116eb1d910d9d40c7606da80121fdba11bc445c1211572b")
   (:FILE "src/execution/ready.lisp" :SOURCE-SHA256
    "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/execution/ready.fasl"
    :FASL-SHA256
    "ce484828120f068d9f23281417a4a7889585af79a36cdbb09299b12451734b4c")
   (:FILE "src/execution/ready-types.lisp" :SOURCE-SHA256
    "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/execution/ready-types.fasl"
    :FASL-SHA256
    "6a19e2eef04bd4a406e94a0d150aa2cd3467bc46c0251600761e15fd0b0c50a2")
   (:FILE "src/execution/ready-recycle.lisp" :SOURCE-SHA256
    "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/execution/ready-recycle.fasl"
    :FASL-SHA256
    "37af48b853533077d59c17a3167e077b7ad893209544a8768e21ea4a5c55c143")
   (:FILE "src/execution/queue.lisp" :SOURCE-SHA256
    "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/execution/queue.fasl"
    :FASL-SHA256
    "3340fc7c976494992aa3394ac1d4e0375c4b15a4a8c4ed8d3f3b89f59071e753")
   (:FILE "src/execution/package.lisp" :SOURCE-SHA256
    "833e501e6ee6e3acb8a6d37139c4605a05e06c425a35318adbcf651aa2f9db30" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/execution/package.fasl"
    :FASL-SHA256
    "db40a17d577d5b92ab715eb587218795f38f74d91b471b725255a876c3aeadcb")
   (:FILE "src/execution/handoff.lisp" :SOURCE-SHA256
    "3ce9f47008416f210173fd3a83ee7665b2103f26039d36e2601b31e5e3ebd72a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/execution/handoff.fasl"
    :FASL-SHA256
    "b0c457d6b6c9cb931aebeb6af4cb8c2007b13c6254a547247fb54e712450a555")
   (:FILE "src/epochs/types.lisp" :SOURCE-SHA256
    "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/epochs/types.fasl"
    :FASL-SHA256
    "ce74a96879317a757b0f0c860a9af8e1c1b262a73769b9c8a88ed3f406c5df40")
   (:FILE "src/epochs/retire.lisp" :SOURCE-SHA256
    "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/epochs/retire.fasl"
    :FASL-SHA256
    "b661fbf0671b70198c9d68a874530fe3e78dfdec22ec9d44f5a87e4b2639fb6d")
   (:FILE "src/epochs/reclaim.lisp" :SOURCE-SHA256
    "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/epochs/reclaim.fasl"
    :FASL-SHA256
    "664c67ffbf96c7971e4fa1bf1c33ab64b03405c6a38a5f3341b89002f1526e97")
   (:FILE "src/epochs/read.lisp" :SOURCE-SHA256
    "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/epochs/read.fasl"
    :FASL-SHA256
    "d09448add6700ef19f486a7c04823a3de1983396e3f93296195da9876f3625ac")
   (:FILE "src/epochs/package.lisp" :SOURCE-SHA256
    "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/epochs/package.fasl"
    :FASL-SHA256
    "360bc51e035c436e107d0c3842c510c8fa161e8b4fe218aeb46ce04a54b24d76")
   (:FILE "src/epochs/core.lisp" :SOURCE-SHA256
    "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/epochs/core.fasl"
    :FASL-SHA256
    "85159ccc4394b56771a4b1e55e592cadb1e70da170cd492d7e6e938119fdfa16")
   (:FILE "src/csn/registry.lisp" :SOURCE-SHA256
    "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/csn/registry.fasl"
    :FASL-SHA256
    "f0a7b3b724ecb06a130033bba12db8e9ca5c5fff57b9c2f5fec0e81ec02bc6e6")
   (:FILE "src/csn/package.lisp" :SOURCE-SHA256
    "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/csn/package.fasl"
    :FASL-SHA256
    "3cb588e0b3fd4662f8801ae499da2479db773ea9aa806913f6e0961651f27877")
   (:FILE "src/control/types.lisp" :SOURCE-SHA256
    "7f7932e0c38d3fa26273342df2be2da436024ff9a9a647c8a3dc5c65c452f563" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/control/types.fasl"
    :FASL-SHA256
    "d8c2e130df21343e4ab3b5010602b6a4921591191b68e35821a7c935c1371030")
   (:FILE "src/control/transfer.lisp" :SOURCE-SHA256
    "6e257bfb6ce8e6d11263cc6788de4fc35657a82e159af7b46341c3bb208e0275" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/control/transfer.fasl"
    :FASL-SHA256
    "1a60b49490ef7c583d9e698584a639101a4ff46c9acb801b517b65ae93bf97c6")
   (:FILE "src/control/prepare.lisp" :SOURCE-SHA256
    "878b15074bfcb3f3aec784e78e545f1ae617539b9ddcb975504880cb000b7f87" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/control/prepare.fasl"
    :FASL-SHA256
    "3bce5bf294a1747fd2372d2c041d53645b4a591f33eaf90677ca9f8e5886241f")
   (:FILE "src/control/preflight.lisp" :SOURCE-SHA256
    "48326533ac0934cb3b1e3fc7657ef48f38912b6c08e9e38367301905f7711584" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/control/preflight.fasl"
    :FASL-SHA256
    "4b2e47c63926b573f4ddafd36573c0bc6555be70e1e3c88d308b12a1406c6193")
   (:FILE "src/control/package.lisp" :SOURCE-SHA256
    "405b91843049e7f9e38896535ad615886443852b39eb0687c29e44dbd675429d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/control/package.fasl"
    :FASL-SHA256
    "966bf696459f720b90135a165d08f17d597a1cc9d696ffb9e0a96021b25c2471")
   (:FILE "src/control/dependency.lisp" :SOURCE-SHA256
    "f328344e4824fd53d03a0476b45fb87efada43ddee895e13afd76ac44413d128" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/control/dependency.fasl"
    :FASL-SHA256
    "ecef765926fb072dc2cff9cfc766747387d82936072b72a5e90fa1d85b8c094b")
   (:FILE "src/control/build.lisp" :SOURCE-SHA256
    "1904e81a6cebbb178598a41e1b2283240fc21506781b1e31da407610ce0f519c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/control/build.fasl"
    :FASL-SHA256
    "fb9955302c48b2440120258bf7564454c01097548f893d8edb6b4e7a99616499")
   (:FILE "src/codec/utf8.lisp" :SOURCE-SHA256
    "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/codec/utf8.fasl"
    :FASL-SHA256
    "4c08122be34596338bed60623368913ba5a70baed18771d05ddedfa0bbf0708a")
   (:FILE "src/codec/package.lisp" :SOURCE-SHA256
    "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/codec/package.fasl"
    :FASL-SHA256
    "d799d469afbd50b206bdbc86d22c2ebd34006222ccd0c3079becdb56c0d96566")
   (:FILE "src/codec/cbor-write.lisp" :SOURCE-SHA256
    "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/codec/cbor-write.fasl"
    :FASL-SHA256
    "be2bd4784add695aadd7473efc916b64fe81ae3d27c03cf5a7312b180985c151")
   (:FILE "src/codec/cbor-string-write.lisp" :SOURCE-SHA256
    "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/codec/cbor-string-write.fasl"
    :FASL-SHA256
    "373a488b29d0526c6067bf10297244516a09927266eb3f682cdae55bc193fb90")
   (:FILE "src/codec/cbor-space.lisp" :SOURCE-SHA256
    "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/codec/cbor-space.fasl"
    :FASL-SHA256
    "837fce6685af9a2cfc37887776ef20ecc5a7f30b1d973361100eed71a60f84dd")
   (:FILE "src/codec/cbor-simple-write.lisp" :SOURCE-SHA256
    "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/codec/cbor-simple-write.fasl"
    :FASL-SHA256
    "b69c856878f423580dd4459558b8bd095f805a46be2c0118635ce47d569389e7")
   (:FILE "src/codec/cbor-scan.lisp" :SOURCE-SHA256
    "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/codec/cbor-scan.fasl"
    :FASL-SHA256
    "1b8a733309bab7f4a1d91f0ef6f75f6235bec80b3cb791ada8035a7502ca2987")
   (:FILE "src/codec/cbor-scan-stack.lisp" :SOURCE-SHA256
    "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/codec/cbor-scan-stack.fasl"
    :FASL-SHA256
    "f843391be58ddc924dcd1defdaaf0db52403d4bf960dec0c22d64d6e79332467")
   (:FILE "src/codec/cbor-scan-minimal.lisp" :SOURCE-SHA256
    "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/codec/cbor-scan-minimal.fasl"
    :FASL-SHA256
    "319a7b59414447927d8e12c97b914c26e61631584f10f279f520d566796703a2")
   (:FILE "src/codec/cbor-scan-items.lisp" :SOURCE-SHA256
    "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/codec/cbor-scan-items.fasl"
    :FASL-SHA256
    "9902d158d4a032afd7bc6f57637e8d8876c1d0e15b2ad8c91608c11e54320296")
   (:FILE "src/codec/cbor-scan-input.lisp" :SOURCE-SHA256
    "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/codec/cbor-scan-input.fasl"
    :FASL-SHA256
    "88af22f8f785432ed0386b455c225db84880d16003defc8fed7077195cacef24")
   (:FILE "src/codec/cbor-package.lisp" :SOURCE-SHA256
    "c2a6fe51760c871705e4cf213ada92fed140fac26cf177d06889e18ab87fb45b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/codec/cbor-package.fasl"
    :FASL-SHA256
    "966c985144524f2e4c835d136432fcc6e77249f18ddfcea58af9d5a3e2a77dae")
   (:FILE "src/codec/cbor-minimal.lisp" :SOURCE-SHA256
    "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/codec/cbor-minimal.fasl"
    :FASL-SHA256
    "7510bcbc5d48155a24e82792738c9618ac878b29ab27f244cac5802ad322db6d")
   (:FILE "src/codec/cbor-header.lisp" :SOURCE-SHA256
    "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/codec/cbor-header.fasl"
    :FASL-SHA256
    "f89164df2727e1f01cb6232e35164497d9aaa78d80463cd653401fc6f6364eaa")
   (:FILE "src/codec/cbor-float-write.lisp" :SOURCE-SHA256
    "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/codec/cbor-float-write.fasl"
    :FASL-SHA256
    "63e9669f26ae4bfba62e1dc7261ef25c4e0d4c5274dd1147cc07b04d63bc5f14")
   (:FILE "src/codec/cbor-float-narrow.lisp" :SOURCE-SHA256
    "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/codec/cbor-float-narrow.fasl"
    :FASL-SHA256
    "024530f5ac62785c10b32f72206bc93918b15dbe22a315301072ae9141835fa4")
   (:FILE "src/codec/cbor-float-minimal.lisp" :SOURCE-SHA256
    "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/codec/cbor-float-minimal.fasl"
    :FASL-SHA256
    "f7d2141c95f4740d7cb77ec80010a7d66cb74c70a004ed63fe082e2c557fa53d")
   (:FILE "src/cache/write.lisp" :SOURCE-SHA256
    "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/cache/write.fasl"
    :FASL-SHA256
    "5c5e64feae8af03f33f9f71753a15c8cc0cbff6e142fca07d16e3237c8498f7d")
   (:FILE "src/cache/types.lisp" :SOURCE-SHA256
    "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/cache/types.fasl"
    :FASL-SHA256
    "53445b714af2366d496da69ba661038b6fd9a3de0d88870fae2d07b7f2f86b8e")
   (:FILE "src/cache/read.lisp" :SOURCE-SHA256
    "5700e43ae8ee859e96bdecb5953af43a712fd9e6ec23a53565759676bb07f85a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/cache/read.fasl"
    :FASL-SHA256
    "d80f60e3e8ae5097c289525c7a970c1af01a113a7bf27ea73da1a918631381e3")
   (:FILE "src/cache/package.lisp" :SOURCE-SHA256
    "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/cache/package.fasl"
    :FASL-SHA256
    "5df60800781d9d0ae6c2b49ed484f5caddd734a2619ad106af1abbc9af801c44")
   (:FILE "src/cache/core.lisp" :SOURCE-SHA256
    "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/cache/core.fasl"
    :FASL-SHA256
    "26a131d2df8b9e3f7e1f3801591d4890c5e1493b1b7d3dfa7cc4fb7403042bf8")
   (:FILE "src/cache/clock.lisp" :SOURCE-SHA256
    "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/cache/clock.fasl"
    :FASL-SHA256
    "8b3a9f1e338a4edd59b5b5c0856095da8496ee792cc6731cfbee0971b8293f40")
   (:FILE "src/cache/build.lisp" :SOURCE-SHA256
    "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/cache/build.fasl"
    :FASL-SHA256
    "fb312f2b21ebd5da8cda0bd6fe2650f25fade82cd5ed29dbe937de38b26f7694")
   (:FILE "src/active/types.lisp" :SOURCE-SHA256
    "48fe584096fc253ef182ab428c1887e443af06d75aaa938df660c77e60b39bfb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/active/types.fasl"
    :FASL-SHA256
    "b69ba6c8b0c0a48ecb7c6a74fdc532dba79272d468b16fb7905d012e8a170d3f")
   (:FILE "src/active/source.lisp" :SOURCE-SHA256
    "ff96fe360b46190ecc08ee9e05a813715dc3399054f93693f9309012aec6547d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/active/source.fasl"
    :FASL-SHA256
    "40097a2bfe2203ee66ddf0a6711120f53970cda75e7fdf2e6d13e9e82a224380")
   (:FILE "src/active/prepare.lisp" :SOURCE-SHA256
    "7b45fb01132c45c9bec76f374edaa8de91ac6bb2d61ae5c359e1fa10c6346f53" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/active/prepare.fasl"
    :FASL-SHA256
    "5cacd7b51052165a449798fb610627d776a5bdf0d5d2ca7bf3f6069d786c1e21")
   (:FILE "src/active/preflight.lisp" :SOURCE-SHA256
    "ef7b592daecc223d78cbcda138b5938abc01593b486482bec06f2721cfd955a2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/active/preflight.fasl"
    :FASL-SHA256
    "5611e08dd7563105253271708cdedd5d060a13963f823c3d090b4834c1d6b131")
   (:FILE "src/active/package.lisp" :SOURCE-SHA256
    "4a6fa4187ef5d44aec4e65d57ee6d6046485f283cc9009c1d94263bee745fa3b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/active/package.fasl"
    :FASL-SHA256
    "3e27482a6470b02b2b5768d371528209cc00cdc27dd3a250a436306ffd1f12e8"))
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
    "TEST-REQ-AFF-004-SERIES-BOOTSTRAP-NIL-STALE-AND-REPEATED-BEFORE-EFFECT"))
  :FAILED-TEST
  ("ARCDOCDB.SERIES.TESTS"
   "TEST-REQ-AFF-004-SERIES-BOOTSTRAP-VIRGIN-GUARDS-AND-EXISTING-READER-ROOT")
  :FAILURE-KIND :ASSERTION :SOURCE-MANIFEST
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
    "2afb3846f4d034e3ee819075dccf69f2030da2dd67919028a14427c447f9d7bc")
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
  "64fe0e704ffa08939070da1b97ed86f70a84c110cfc4b919a5f508f9ed02e7fa"
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
    "2afb3846f4d034e3ee819075dccf69f2030da2dd67919028a14427c447f9d7bc")
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
 :EXIT-CODE 1 :SIGNAL NIL)
