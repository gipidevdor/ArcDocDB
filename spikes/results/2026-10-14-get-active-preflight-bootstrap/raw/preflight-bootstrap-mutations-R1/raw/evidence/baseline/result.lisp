(:DEADLINE-SECONDS 120 :ARGV
 ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--disable-debugger"
  "--script"
  "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/evidence/baseline/driver.lisp"
  "--child"
  "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/evidence/baseline/config.lisp")
 :NAME "baseline" :FILE NIL :RESULT :BASELINE-PASSED :STATUS :OK
 :COPY-DIRECTORY
 "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/"
 :EVIDENCE-DIRECTORY
 "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/evidence/baseline/"
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
 "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/report.lisp"
 :PRODUCER-CLOSED T :CHILD-LAUNCHED T :CHILD-REAPED T :TIMED-OUT NIL :CLEANUP
 :REAPED :DIAGNOSTIC NIL :SOURCE-MANIFEST-BEFORE
 ((:FILE "arcdocdb.asd" :SHA256
   "4654aa66e1c48d2ee1768bee076344f8e24ce0f3e04a9ee9ba3d3599b03e0dc1")
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
  (:FILE "src/codec/cbor-array-input.lisp" :SHA256
   "e36efda9d66f532b8221f898a078b7f77dc2a41cdc953ece0b2e08b4ed2417f4")
  (:FILE "src/codec/cbor-array-write.lisp" :SHA256
   "2f71d857991f32aacf6c7a0ecbe5e06bcba9289b20f46e496b3e3737ce6c242b")
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
   "f74f5d1cb0b71658aaeb36518530c2396d132a783cb58109788e434691acb503")
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
   "c6ca23c7b0a8cea48bec2b7017482802f2078b0d58414c6708fbfe5f7d46377d")
  (:FILE "src/control/preflight.lisp" :SHA256
   "48326533ac0934cb3b1e3fc7657ef48f38912b6c08e9e38367301905f7711584")
  (:FILE "src/control/prepare.lisp" :SHA256
   "1226996af2215e3ebf06265e48d43632a1642ccacd312fabd983c5f3bfa7536d")
  (:FILE "src/control/publication-read.lisp" :SHA256
   "cfb12232748e62d1edef6896389e8d54057951c058ee43d70dd346b10c5f582e")
  (:FILE "src/control/publication.lisp" :SHA256
   "3f867f54309b0a2985660dd8145b100eb097c1d7fdfcd917c61d73d082009109")
  (:FILE "src/control/transfer.lisp" :SHA256
   "6e257bfb6ce8e6d11263cc6788de4fc35657a82e159af7b46341c3bb208e0275")
  (:FILE "src/control/types.lisp" :SHA256
   "ad2f45bcd44fed463d60b580a17d89192a1087177573b1633674ed68d252367d")
  (:FILE "src/csn/package.lisp" :SHA256
   "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0")
  (:FILE "src/csn/registry.lisp" :SHA256
   "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a")
  (:FILE "src/dispatch/build.lisp" :SHA256
   "c78d31a753db78baea520e9ea0cccf6e88cad9cca8bc75261a6ff26c2ac01fe5")
  (:FILE "src/dispatch/claim.lisp" :SHA256
   "224e4114b8b91affced874bea9c23cae5c79526e8ddae62e31a0cafcbb763682")
  (:FILE "src/dispatch/package.lisp" :SHA256
   "acb5fd19599e89e821a89bcca8f94064f33cdc71cdfcf204aadcd4fb52dd795f")
  (:FILE "src/dispatch/types.lisp" :SHA256
   "cc44882c565a89de08f5add79333868ebfca4fc3f97bf9104d36375d014d4720")
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
   "88e72ad54b8c8048358cbca2d136c62883d8e700d63d92e807cb14df0082ae6a")
  (:FILE "src/io/namespace.lisp" :SHA256
   "f23b46209fa87bee4deee84dbe3d87bc7a20d0a4f98bdafe7d40391fc42e1b59")
  (:FILE "src/io/native-namespace.lisp" :SHA256
   "3a7ada1ffe09c94714629a3679bf26a56bd5570ff3bf06acbce4be83750a47ad")
  (:FILE "src/io/native.lisp" :SHA256
   "74f63dbb2137a344054e82c6707e6262473b3332ff66a85f79ecfee9fd50f9b4")
  (:FILE "src/io/package.lisp" :SHA256
   "605f51109d723267b326c012602a91e7deff984a040c3440d90665b853e3549c")
  (:FILE "src/io/rename.lisp" :SHA256
   "ef9475701a2da4a44d98f9c88a1f547f3be1f07c649c8c3c956c206c80a55598")
  (:FILE "src/io/transfer.lisp" :SHA256
   "c807f294d0211e8433f8f0332ab6ba3ce7d9ae7de3818f43af7ff8d7fcfd341a")
  (:FILE "src/io/types.lisp" :SHA256
   "68df36ae5167c975261f99d63a6598bca1fe93caca02f39e18812e94fcf1b233")
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
   "a44fd2c3d435e1f6729bf861b6caeb54a184f31c92e7909aad9c18b491f03cdf")
  (:FILE "src/scheduler/policy.lisp" :SHA256
   "92b3ca3a81ae0b3ac342a63e5fe5c5d7524091a63065b0232c14c57ee80c4aac")
  (:FILE "src/scheduler/pool-claim.lisp" :SHA256
   "e384f6091a5fcb506e718e12e77b06ab8dd4233a41024bc57ca3b14425e10b14")
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
  (:FILE "tests/codec/cbor-array-write-support.lisp" :SHA256
   "42a59239bec468dea130b87733a077874a5d9e83ff0f491b20312315bc27ee95")
  (:FILE "tests/codec/cbor-array-write-threads.lisp" :SHA256
   "6be0614da2bafdafe2d853fa7845fb913dbf0cd2673771c2c4b0cca277986e35")
  (:FILE "tests/codec/cbor-array-write.lisp" :SHA256
   "9ed6a20ab5ae2db33ef419986c8ee963898894ce239059eae7866d503fe48098")
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
  (:FILE "tests/get-active/construction.lisp" :SHA256
   "31a21762f3c16950e4b6c0ce48a6ab235d2483476d03d4072d63905f7dd13deb")
  (:FILE "tests/get-active/directory.lisp" :SHA256
   "ea6754ab84b53a4be1722985600e280fde6f73da4ea7eb843e99d66989df6fdf")
  (:FILE "tests/get-active/preflight.lisp" :SHA256
   "c65ef56f5f7498d4355e6a1f640969e3e31724fab9b84b5c3247e4e9d37626e3")
  (:FILE "tests/get-active/read.lisp" :SHA256
   "ef1a15c742518b52bdbeecac6b838b0789b73d631f765a30fd016748769a72e6")
  (:FILE "tests/get-active/support.lisp" :SHA256
   "34c73b5323272a24fc01c132133d3cc74be7c00fa7ddd4ad08b8146bb42d589f")
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
  (:FILE "tests/io/rename-native.lisp" :SHA256
   "b1f43b09af8f4253ce22a4793f9267c7d60df69339a3fc51b9fd83b6a331bce5")
  (:FILE "tests/io/rename.lisp" :SHA256
   "cd14164b36977d927f7e4cf4d70d2068661c47f538228957102a4347a853fa59")
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
  (:FILE "tests/scheduler/dispatch.lisp" :SHA256
   "600eb0b5fdf9a52d020e2f4c638f0f3dba43d9d9711be73eaffff208578821eb")
  (:FILE "tests/scheduler/lifecycle.lisp" :SHA256
   "eff59c0cf6d9c6c1ddec57a4efa26a8fcaeedc850b77764b818bc1c22eb73e38")
  (:FILE "tests/scheduler/pool-claim.lisp" :SHA256
   "f968d57b6ff4dfc3cc31f1b1979afa896d95435093406b36320800783629901f")
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
   "7ebbcbfa8da95a0cdeae81bbbdaf869f19999063a5f283c40b22d1ae81420964")
  (:FILE "tools/evidence-storage.lisp" :SHA256
   "8f287772a41b1ebe0e7b3ecc3826a4148082efed428a9749655977e62a9c15a6"))
 :SOURCE-MANIFEST-AFTER
 ((:FILE "arcdocdb.asd" :SHA256
   "4654aa66e1c48d2ee1768bee076344f8e24ce0f3e04a9ee9ba3d3599b03e0dc1")
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
  (:FILE "src/codec/cbor-array-input.lisp" :SHA256
   "e36efda9d66f532b8221f898a078b7f77dc2a41cdc953ece0b2e08b4ed2417f4")
  (:FILE "src/codec/cbor-array-write.lisp" :SHA256
   "2f71d857991f32aacf6c7a0ecbe5e06bcba9289b20f46e496b3e3737ce6c242b")
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
   "f74f5d1cb0b71658aaeb36518530c2396d132a783cb58109788e434691acb503")
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
   "c6ca23c7b0a8cea48bec2b7017482802f2078b0d58414c6708fbfe5f7d46377d")
  (:FILE "src/control/preflight.lisp" :SHA256
   "48326533ac0934cb3b1e3fc7657ef48f38912b6c08e9e38367301905f7711584")
  (:FILE "src/control/prepare.lisp" :SHA256
   "1226996af2215e3ebf06265e48d43632a1642ccacd312fabd983c5f3bfa7536d")
  (:FILE "src/control/publication-read.lisp" :SHA256
   "cfb12232748e62d1edef6896389e8d54057951c058ee43d70dd346b10c5f582e")
  (:FILE "src/control/publication.lisp" :SHA256
   "3f867f54309b0a2985660dd8145b100eb097c1d7fdfcd917c61d73d082009109")
  (:FILE "src/control/transfer.lisp" :SHA256
   "6e257bfb6ce8e6d11263cc6788de4fc35657a82e159af7b46341c3bb208e0275")
  (:FILE "src/control/types.lisp" :SHA256
   "ad2f45bcd44fed463d60b580a17d89192a1087177573b1633674ed68d252367d")
  (:FILE "src/csn/package.lisp" :SHA256
   "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0")
  (:FILE "src/csn/registry.lisp" :SHA256
   "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a")
  (:FILE "src/dispatch/build.lisp" :SHA256
   "c78d31a753db78baea520e9ea0cccf6e88cad9cca8bc75261a6ff26c2ac01fe5")
  (:FILE "src/dispatch/claim.lisp" :SHA256
   "224e4114b8b91affced874bea9c23cae5c79526e8ddae62e31a0cafcbb763682")
  (:FILE "src/dispatch/package.lisp" :SHA256
   "acb5fd19599e89e821a89bcca8f94064f33cdc71cdfcf204aadcd4fb52dd795f")
  (:FILE "src/dispatch/types.lisp" :SHA256
   "cc44882c565a89de08f5add79333868ebfca4fc3f97bf9104d36375d014d4720")
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
   "88e72ad54b8c8048358cbca2d136c62883d8e700d63d92e807cb14df0082ae6a")
  (:FILE "src/io/namespace.lisp" :SHA256
   "f23b46209fa87bee4deee84dbe3d87bc7a20d0a4f98bdafe7d40391fc42e1b59")
  (:FILE "src/io/native-namespace.lisp" :SHA256
   "3a7ada1ffe09c94714629a3679bf26a56bd5570ff3bf06acbce4be83750a47ad")
  (:FILE "src/io/native.lisp" :SHA256
   "74f63dbb2137a344054e82c6707e6262473b3332ff66a85f79ecfee9fd50f9b4")
  (:FILE "src/io/package.lisp" :SHA256
   "605f51109d723267b326c012602a91e7deff984a040c3440d90665b853e3549c")
  (:FILE "src/io/rename.lisp" :SHA256
   "ef9475701a2da4a44d98f9c88a1f547f3be1f07c649c8c3c956c206c80a55598")
  (:FILE "src/io/transfer.lisp" :SHA256
   "c807f294d0211e8433f8f0332ab6ba3ce7d9ae7de3818f43af7ff8d7fcfd341a")
  (:FILE "src/io/types.lisp" :SHA256
   "68df36ae5167c975261f99d63a6598bca1fe93caca02f39e18812e94fcf1b233")
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
   "a44fd2c3d435e1f6729bf861b6caeb54a184f31c92e7909aad9c18b491f03cdf")
  (:FILE "src/scheduler/policy.lisp" :SHA256
   "92b3ca3a81ae0b3ac342a63e5fe5c5d7524091a63065b0232c14c57ee80c4aac")
  (:FILE "src/scheduler/pool-claim.lisp" :SHA256
   "e384f6091a5fcb506e718e12e77b06ab8dd4233a41024bc57ca3b14425e10b14")
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
  (:FILE "tests/codec/cbor-array-write-support.lisp" :SHA256
   "42a59239bec468dea130b87733a077874a5d9e83ff0f491b20312315bc27ee95")
  (:FILE "tests/codec/cbor-array-write-threads.lisp" :SHA256
   "6be0614da2bafdafe2d853fa7845fb913dbf0cd2673771c2c4b0cca277986e35")
  (:FILE "tests/codec/cbor-array-write.lisp" :SHA256
   "9ed6a20ab5ae2db33ef419986c8ee963898894ce239059eae7866d503fe48098")
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
  (:FILE "tests/get-active/construction.lisp" :SHA256
   "31a21762f3c16950e4b6c0ce48a6ab235d2483476d03d4072d63905f7dd13deb")
  (:FILE "tests/get-active/directory.lisp" :SHA256
   "ea6754ab84b53a4be1722985600e280fde6f73da4ea7eb843e99d66989df6fdf")
  (:FILE "tests/get-active/preflight.lisp" :SHA256
   "c65ef56f5f7498d4355e6a1f640969e3e31724fab9b84b5c3247e4e9d37626e3")
  (:FILE "tests/get-active/read.lisp" :SHA256
   "ef1a15c742518b52bdbeecac6b838b0789b73d631f765a30fd016748769a72e6")
  (:FILE "tests/get-active/support.lisp" :SHA256
   "34c73b5323272a24fc01c132133d3cc74be7c00fa7ddd4ad08b8146bb42d589f")
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
  (:FILE "tests/io/rename-native.lisp" :SHA256
   "b1f43b09af8f4253ce22a4793f9267c7d60df69339a3fc51b9fd83b6a331bce5")
  (:FILE "tests/io/rename.lisp" :SHA256
   "cd14164b36977d927f7e4cf4d70d2068661c47f538228957102a4347a853fa59")
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
  (:FILE "tests/scheduler/dispatch.lisp" :SHA256
   "600eb0b5fdf9a52d020e2f4c638f0f3dba43d9d9711be73eaffff208578821eb")
  (:FILE "tests/scheduler/lifecycle.lisp" :SHA256
   "eff59c0cf6d9c6c1ddec57a4efa26a8fcaeedc850b77764b818bc1c22eb73e38")
  (:FILE "tests/scheduler/pool-claim.lisp" :SHA256
   "f968d57b6ff4dfc3cc31f1b1979afa896d95435093406b36320800783629901f")
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
   "7ebbcbfa8da95a0cdeae81bbbdaf869f19999063a5f283c40b22d1ae81420964")
  (:FILE "tools/evidence-storage.lisp" :SHA256
   "8f287772a41b1ebe0e7b3ecc3826a4148082efed428a9749655977e62a9c15a6"))
 :CHANGED-PATHS NIL :CONFIG-SHA256
 "729a009727e67e08fec5c72daabad19bc07f0d35f8883b93b0a79bb707e44454"
 :CONFIG-SHA256-AFTER
 "729a009727e67e08fec5c72daabad19bc07f0d35f8883b93b0a79bb707e44454"
 :ARTIFACTS-VERIFIED T :CHILD-REPORT
 (:FINISHED-AT-UNIVERSAL-TIME 4000985485 :CONFIG-SHA256-AFTER
  "729a009727e67e08fec5c72daabad19bc07f0d35f8883b93b0a79bb707e44454"
  :SCHEMA-VERSION 1 :KIND :GET-ACTIVE-INIT-MUTATION-CHILD :STATUS :OK :PHASE
  :COMPLETE :COMPILED T :SUITE-COMPILED T :COMPILED-FILES
  ((:FILE "tests/wal/support.lisp" :SOURCE-SHA256
    "90a47539e5e2898c0a08059207f30bb5551e7ca8fc166f8f6ce7b95afa757295" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/wal/support.fasl"
    :FASL-SHA256
    "69d6ff5ae11e8e6de11ca90be6332ec0c47257ee6fc49acadd87fa8a67518d87")
   (:FILE "tests/wal/native.lisp" :SOURCE-SHA256
    "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/wal/native.fasl"
    :FASL-SHA256
    "fd24b93866a6cf54ae3b146ee0775d055b10220cb95a473ee0f024fa86f9b883")
   (:FILE "tests/wal/group.lisp" :SOURCE-SHA256
    "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/wal/group.fasl"
    :FASL-SHA256
    "f8cbba44bdeadb28e7803838a8949f160d81428c7d2a0ce0dcdaeb81e9b44895")
   (:FILE "tests/wal/fault.lisp" :SOURCE-SHA256
    "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/wal/fault.fasl"
    :FASL-SHA256
    "51b0363abbf132eded149e9d54864e051966d7fcc1f44b5ef829d45a7c702f8f")
   (:FILE "tests/wal/csn.lisp" :SOURCE-SHA256
    "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/wal/csn.fasl"
    :FASL-SHA256
    "6359cf4060eac355f3bbd160b229d5aefeedc3980501b01c19d49a251374c195")
   (:FILE "tests/wal/csn-threads.lisp" :SOURCE-SHA256
    "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/wal/csn-threads.fasl"
    :FASL-SHA256
    "b7174f5a0114fb14beee19af0a76acbf8b60a905aca13e98759b20de67767617")
   (:FILE "tests/wal/builder.lisp" :SOURCE-SHA256
    "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/wal/builder.fasl"
    :FASL-SHA256
    "9655dc94308fa8e487d4d0e87a19d84625115c52d74e7efb17f0521d872d368d")
   (:FILE "tests/storage/support.lisp" :SOURCE-SHA256
    "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/storage/support.fasl"
    :FASL-SHA256
    "72fe22e9b6f0b18029ff495908694c61d3870df3bde235b848bf4fa1ab484312")
   (:FILE "tests/storage/segment-header.lisp" :SOURCE-SHA256
    "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/storage/segment-header.fasl"
    :FASL-SHA256
    "ee6b5db2c6f9fa62e66c68622ef1cff3c13fb6d12a7caba47bd2a15a61a49abc")
   (:FILE "tests/storage/log-header.lisp" :SOURCE-SHA256
    "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/storage/log-header.fasl"
    :FASL-SHA256
    "d87527c2d496b143bafc6e1632a8eab12ec760e2613f4ee723e47f16ab9979f8")
   (:FILE "tests/storage/control-payload.lisp" :SOURCE-SHA256
    "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/storage/control-payload.fasl"
    :FASL-SHA256
    "3a90c0ab4820c006bfd4739896cfcbaf5892275f8524e711943637f156006cac")
   (:FILE "tests/storage/compaction-scan.lisp" :SOURCE-SHA256
    "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/storage/compaction-scan.fasl"
    :FASL-SHA256
    "5e5acdb4a5c08c7d0aab0b6d82d28249b1a4fa270f336866063d147a821e70ac")
   (:FILE "tests/smoke.lisp" :SOURCE-SHA256
    "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/smoke.fasl"
    :FASL-SHA256
    "0b7485e6299528096aa6a1e2581b2143e639fe8d80c0ace9fe53429465c10f8b")
   (:FILE "tests/series/worker-routing.lisp" :SOURCE-SHA256
    "f495d33f73e3249d1055ea61d65034033367de85edec3db2cac3a63ff449e3f9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/series/worker-routing.fasl"
    :FASL-SHA256
    "42415c4104e214d7e1a9fd0c7dd5972106f14d7e1cbae85da68a15379db15e96")
   (:FILE "tests/series/worker-bridge.lisp" :SOURCE-SHA256
    "c1ee49702e63978a83cb86c4e5bf437a5a40e48fa02b65d3eaf3dca0d2e39176" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/series/worker-bridge.fasl"
    :FASL-SHA256
    "f021c0deee06d445ef155bdc96925c24708d7236cce76c5ce267a52506dd38d5")
   (:FILE "tests/series/threads.lisp" :SOURCE-SHA256
    "b8fe9d7e1c0ca4e18909a0a6f7ac03c8df68dd186fa21e62600be685d6e4c7ae" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/series/threads.fasl"
    :FASL-SHA256
    "50bc9ba616a1a746cf48e625a648dcfa8d85dbffd821bce2e33301a73e129f62")
   (:FILE "tests/series/support.lisp" :SOURCE-SHA256
    "810dd8a69927c75e3399af47b8fff18e4ab88eb41049c50bafee5c041be263b3" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/series/support.fasl"
    :FASL-SHA256
    "9360323c204c7d9a6c4cd59f4dec5d1460221631c7c94a47a1c27b5c1538ab27")
   (:FILE "tests/series/controller.lisp" :SOURCE-SHA256
    "8bc98ec62e58803cab5613210e1200e0ce296af9aff63b5dff61579c3931670a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/series/controller.fasl"
    :FASL-SHA256
    "ce800ae1f07cd3ba55750bcaff5b041a6fe1ef184c921775c5c47f299984e558")
   (:FILE "tests/series/boundaries.lisp" :SOURCE-SHA256
    "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/series/boundaries.fasl"
    :FASL-SHA256
    "f8cd4dae0617d72f79dabd6f78b2dd50d35367d86e0304573661524db05c9bab")
   (:FILE "tests/scheduler/support.lisp" :SOURCE-SHA256
    "300234f9ac7931f8c8b9bf305498a2742a3b8868dd9158dbab8c7fdceed5a1e4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/scheduler/support.fasl"
    :FASL-SHA256
    "8b3291be93f005a603a85e23756315c94bdfc28084f474cf4a7cef5449fa8e9d")
   (:FILE "tests/scheduler/pool-claim.lisp" :SOURCE-SHA256
    "f968d57b6ff4dfc3cc31f1b1979afa896d95435093406b36320800783629901f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/scheduler/pool-claim.fasl"
    :FASL-SHA256
    "45e8558741cd9ff126602e7ff7244440fc84fa623cbe2a16c6bd420ebd0e497c")
   (:FILE "tests/scheduler/lifecycle.lisp" :SOURCE-SHA256
    "eff59c0cf6d9c6c1ddec57a4efa26a8fcaeedc850b77764b818bc1c22eb73e38" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/scheduler/lifecycle.fasl"
    :FASL-SHA256
    "70122e4c6968129c5b34663ccbac97483e6549087b1530b4b18133a76c78cf0d")
   (:FILE "tests/scheduler/dispatch.lisp" :SOURCE-SHA256
    "600eb0b5fdf9a52d020e2f4c638f0f3dba43d9d9711be73eaffff208578821eb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/scheduler/dispatch.fasl"
    :FASL-SHA256
    "b42af1b37720e54be64c3753c232176be8ccc086fc6f6fac5cd0328cce67349a")
   (:FILE "tests/scheduler/controller.lisp" :SOURCE-SHA256
    "e986e3facc9d1b9b4eab0d135259a61d7e0f188a7f268cb2e5ee5f9c700c40be" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/scheduler/controller.fasl"
    :FASL-SHA256
    "7ec1ed24fe38964ba0c200208bafd78b95bad3c8de292d0dc1775792799ff356")
   (:FILE "tests/recovery/support.lisp" :SOURCE-SHA256
    "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/recovery/support.fasl"
    :FASL-SHA256
    "f18762c4623d9c5330278c5df2dd498e7f38c8d99e0ed8cdd8ac93c4c53bed17")
   (:FILE "tests/recovery/scan.lisp" :SOURCE-SHA256
    "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/recovery/scan.fasl"
    :FASL-SHA256
    "5ad86c1d63bf6a8f60ed4f9a5f989719f8a2952b9553dcb5955d304f4b8541a2")
   (:FILE "tests/recovery/manifest.lisp" :SOURCE-SHA256
    "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/recovery/manifest.fasl"
    :FASL-SHA256
    "07355d62343ba8e7e21c87e3126b78adcb1661c6f1bd6e697af3827e521819ce")
   (:FILE "tests/recovery/manifest-support.lisp" :SOURCE-SHA256
    "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/recovery/manifest-support.fasl"
    :FASL-SHA256
    "f61a0a00b31c9b1406f2d0372500172de4971d17f4e0df5b8d6a3f1b90e5610b")
   (:FILE "tests/recovery/manifest-audit.lisp" :SOURCE-SHA256
    "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/recovery/manifest-audit.fasl"
    :FASL-SHA256
    "9cff95ac83234c9bdf30d26b674431e1111ed88a0b137b54113ee6e95302d606")
   (:FILE "tests/recovery/inventory.lisp" :SOURCE-SHA256
    "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/recovery/inventory.fasl"
    :FASL-SHA256
    "29562c0486a6bd46bfc0f518c3de81b665447b09cff987ebabf64256b844e04a")
   (:FILE "tests/recovery/inventory-support.lisp" :SOURCE-SHA256
    "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/recovery/inventory-support.fasl"
    :FASL-SHA256
    "e6c11471d3fffb7ce53f859796b5e085a8569c6d206aa7b8b04292bcae998c5c")
   (:FILE "tests/recovery/decisions.lisp" :SOURCE-SHA256
    "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/recovery/decisions.fasl"
    :FASL-SHA256
    "c102aa0d6e68b04f7f373666477f47db3274bb435d5514a7fbb33f59cfc1db42")
   (:FILE "tests/recovery/decisions-support.lisp" :SOURCE-SHA256
    "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/recovery/decisions-support.fasl"
    :FASL-SHA256
    "b9b171303a90ed78ff665665b7220ed9f9dcc7e66d1ea51b6b4fba8dd1d4cbaa")
   (:FILE "tests/recovery/decisions-radix.lisp" :SOURCE-SHA256
    "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/recovery/decisions-radix.fasl"
    :FASL-SHA256
    "75f066996476b3f34700ef55ae0fe533d9741d295e2f6631b84e1c271e370b8d")
   (:FILE "tests/recovery/decisions-audit.lisp" :SOURCE-SHA256
    "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/recovery/decisions-audit.fasl"
    :FASL-SHA256
    "2c82e91b031949141f65651172d8d98deb680e1043ecce5e8979665c44213109")
   (:FILE "tests/recovery/corruption.lisp" :SOURCE-SHA256
    "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/recovery/corruption.fasl"
    :FASL-SHA256
    "031ca6fc9c189bdacfefdd4003aee5315eb66d2bacae90038ec2eea21e64ebd2")
   (:FILE "tests/read/threads.lisp" :SOURCE-SHA256
    "e2e223b69b08a5d76b9773c6ad4dee13ef2ddbb6f5ababa713cc5654bc7b51c5" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/read/threads.fasl"
    :FASL-SHA256
    "7f87aacb03d30358aceeb27e0327a7e9ddba5ada14837393c608b398a8e4f492")
   (:FILE "tests/read/support.lisp" :SOURCE-SHA256
    "8095cc39d49342f6e43f3421b4fced839da02d8d11b4d8ddcd91bd346447e754" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/read/support.fasl"
    :FASL-SHA256
    "a9a81dcd0cc9b710b8d7fb114f09453e285f873f138473dcae0c5b17fe986fcc")
   (:FILE "tests/read/lifecycle.lisp" :SOURCE-SHA256
    "c4c4642408816f2e0e809e21d04739b68b9391237e3e46ea0b195ed82857c3a8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/read/lifecycle.fasl"
    :FASL-SHA256
    "88129c7c1383347df5cf6ac8f62b04359e8c6685af3af070b283c74669993c0a")
   (:FILE "tests/mvcc/support.lisp" :SOURCE-SHA256
    "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/mvcc/support.fasl"
    :FASL-SHA256
    "cee7f53dea7d6a955850c9b9a4b234846802bbca1a67242d43fd3538b2a38753")
   (:FILE "tests/mvcc/lifecycle.lisp" :SOURCE-SHA256
    "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/mvcc/lifecycle.fasl"
    :FASL-SHA256
    "4f3a6492ea0477e4505975f2b1a613ae357c65674bb026e24921860253fa3eb4")
   (:FILE "tests/mvcc/capture.lisp" :SOURCE-SHA256
    "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/mvcc/capture.fasl"
    :FASL-SHA256
    "d911c75256a95681ee8a64abaa5f54769d27fb90f0a76124d7de1733f7948ba0")
   (:FILE "tests/io/transfer.lisp" :SOURCE-SHA256
    "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/io/transfer.fasl"
    :FASL-SHA256
    "3134b40105c93119f8ea37a6fcabef2ac37d0cf52d7743e47bd12bb91316fbf2")
   (:FILE "tests/io/support.lisp" :SOURCE-SHA256
    "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/io/support.fasl"
    :FASL-SHA256
    "8b763562ceca1551e16a5e1a39c7f39b59ed7c5fa0756751c06570a29086df8d")
   (:FILE "tests/io/rename.lisp" :SOURCE-SHA256
    "cd14164b36977d927f7e4cf4d70d2068661c47f538228957102a4347a853fa59" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/io/rename.fasl"
    :FASL-SHA256
    "3e72e0dcd3faeaec509c5fd55ed803e7940a487ea0859f49c100edeecf2f2dbd")
   (:FILE "tests/io/rename-native.lisp" :SOURCE-SHA256
    "b1f43b09af8f4253ce22a4793f9267c7d60df69339a3fc51b9fd83b6a331bce5" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/io/rename-native.fasl"
    :FASL-SHA256
    "0f7726e3041353a4a9b160959e43dc04b1ec633051edae8468ed5b7251164175")
   (:FILE "tests/io/native.lisp" :SOURCE-SHA256
    "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/io/native.fasl"
    :FASL-SHA256
    "60e7f21f763e57a449db5232bdf39be0f3c393ae308ad5f8f8b530f0e292d832")
   (:FILE "tests/index/slots.lisp" :SOURCE-SHA256
    "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/index/slots.fasl"
    :FASL-SHA256
    "83e96658af29d301fc29a79f8514bd6dabf6776b54975b0c0a9bb5f092b7924d")
   (:FILE "tests/index/slot-threads.lisp" :SOURCE-SHA256
    "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/index/slot-threads.fasl"
    :FASL-SHA256
    "35169dec996628b25841a6e53d4df9b676dd3910d0923aafa9ad57e3c9035c90")
   (:FILE "tests/index/slot-support.lisp" :SOURCE-SHA256
    "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/index/slot-support.fasl"
    :FASL-SHA256
    "24ed40555c7aff12679c4ab8aff11b1d10ae55f77498c31e9a90d307e2860b9d")
   (:FILE "tests/index/rebuild.lisp" :SOURCE-SHA256
    "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/index/rebuild.fasl"
    :FASL-SHA256
    "3bab19933da71ce45abb84c26fa9f835270516605c4beb977f65f4c685b1fb51")
   (:FILE "tests/index/primary.lisp" :SOURCE-SHA256
    "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/index/primary.fasl"
    :FASL-SHA256
    "c04fd2dd701551850e3e601e91636a9cc19d9180ee9eb179dad0645bea6748c5")
   (:FILE "tests/index/primary-threads.lisp" :SOURCE-SHA256
    "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/index/primary-threads.fasl"
    :FASL-SHA256
    "c7e164adc05471e76fa4be09ff8fdb98c6ad79b457a67ca128adbae76baf43c4")
   (:FILE "tests/index/primary-support.lisp" :SOURCE-SHA256
    "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/index/primary-support.fasl"
    :FASL-SHA256
    "0533d1c6246db5763d7360f440b2f30ee5ad4c4dd637d528e570bb66bed1a5ba")
   (:FILE "tests/index/hash-digests.lisp" :SOURCE-SHA256
    "3b3b39f861883cf2017cab8e6488560a6bb3897d63784f00e820a6450d743225" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/index/hash-digests.fasl"
    :FASL-SHA256
    "d0ad4fb9dbfa1fe8063977c85492418a57767b87d2ecb94241aa67ffb908a3a3")
   (:FILE "tests/hash/threads.lisp" :SOURCE-SHA256
    "3fc587a57d26a294aebfc6a7aeadf2f61a42a21106c1c57517f891b76b4e750a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/hash/threads.fasl"
    :FASL-SHA256
    "8a2ec1b2770398e4dadccf7db34a6bce790e4f904875de3fb091bc5a4a9c7074")
   (:FILE "tests/hash/support.lisp" :SOURCE-SHA256
    "0fae9dc36976af544f83e6051b9cf9d67c9bef0b9e25f1fa2a48fdac48592acb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/hash/support.fasl"
    :FASL-SHA256
    "851d05037f6cf1f38739036ea8920746c133993415e287e7e704c7d7ae7c5bf1")
   (:FILE "tests/hash/hash64.lisp" :SOURCE-SHA256
    "70606bc68807143cfea9583871474c84efc868d13692cde28488284dee43e0f1" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/hash/hash64.fasl"
    :FASL-SHA256
    "0f024c75629ae5795cacb98e28f20e4b5eceaaa46ee41d438714dc9182489738")
   (:FILE "tests/hash/guards.lisp" :SOURCE-SHA256
    "9af5b38443a57d224990a68e93f12f7a4cda306f94c7ccd3ccb50635865d7864" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/hash/guards.fasl"
    :FASL-SHA256
    "4932a135b2896007ed6c179a1032636e7b231c67b720e2fc9afc05374c02ab5d")
   (:FILE "tests/get/support.lisp" :SOURCE-SHA256
    "21f0da34755882f7dcc3ee760528ca39d4731e1a79ea94525c62753b7f60422c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/get/support.fasl"
    :FASL-SHA256
    "5de5b5ab1977338b223716bc3e61b94b8740eca048e7ed436f2b713d66f46bfc")
   (:FILE "tests/get/segment.lisp" :SOURCE-SHA256
    "e9722f419ce0810c98c28d0e1a74da85d52346a0befff40c1119934519fc6f98" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/get/segment.fasl"
    :FASL-SHA256
    "7f3e2aee4302ad0b5d96db6868b3ee4344c734580aa9a277bb9bc7fb3ee3658d")
   (:FILE "tests/get/lifecycle.lisp" :SOURCE-SHA256
    "73bf87c2aee7b537dba31fc0ae554272f7d2be5a4c1e9e96ea2f21a17f6f71f5" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/get/lifecycle.fasl"
    :FASL-SHA256
    "27f38fea3436b868cb7af25d44f4a888e82afbb5bbc377d5df465792a015cd22")
   (:FILE "tests/get-resolver/support.lisp" :SOURCE-SHA256
    "d30a5c8a61b63e339facfee9f7701eb5a3614bbfd1ebef2c46c747d136640f8b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/get-resolver/support.fasl"
    :FASL-SHA256
    "e7ae24247dac5a50c0aae31b95afcd7681a6abc08bc9455beb1e0225959bd755")
   (:FILE "tests/get-resolver/sort.lisp" :SOURCE-SHA256
    "fd7f97f0fad2e970b972688481c0c132f11c85f5fdcd0f02bee6b0b3f93b97ae" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/get-resolver/sort.fasl"
    :FASL-SHA256
    "4af96a83e7d496036b0ec011b64ff4bd67937eb8cc3aeb951aa20fdf76aeb815")
   (:FILE "tests/get-resolver/read.lisp" :SOURCE-SHA256
    "70e46d1b88716f44309f46b4955928ca7fa2195edd80bb67d5b97732b971e8fb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/get-resolver/read.fasl"
    :FASL-SHA256
    "d66578d56b5e5d3af2489b82271de60eda4c89abd5629a3abbc8677ed668a770")
   (:FILE "tests/get-resolver/construction.lisp" :SOURCE-SHA256
    "45cbef3b35db35d60a4cec2516c24f6ef56f5edb2f19f6f07f24fe00c8737b13" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/get-resolver/construction.fasl"
    :FASL-SHA256
    "86caf1463511eff8ad16792dae62637500522a007cef39f0e086ce9c14cb8d0f")
   (:FILE "tests/get-performance/threads.lisp" :SOURCE-SHA256
    "05ace5eb351ab49da59611dc1a2a5abedb9d723a2fc6e75a30fc76e507573a90" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/get-performance/threads.fasl"
    :FASL-SHA256
    "ab1bae6e2244aa031f341a58897e37ac6a231a875b21255c292e2e6aa4c5a6c7")
   (:FILE "tests/get-performance/support.lisp" :SOURCE-SHA256
    "e586ed94dcb2aaba00282931cdd83313e4f84a86d4d1ba85e2d56e8b7433ed8d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/get-performance/support.fasl"
    :FASL-SHA256
    "f8f818e88372fd22acc6a01bb705b23ccc417fb76d9c76b494fa226461715ccd")
   (:FILE "tests/get-performance/paths.lisp" :SOURCE-SHA256
    "3b8d2c9c93467507ea2bb471d42192eb1fa084b55c0f4263b5ef0d3acf468f55" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/get-performance/paths.fasl"
    :FASL-SHA256
    "50d26890f7fd4af00cb1f3d1e36cab4bc932c8bf7d2e5ea801d903410cc1e291")
   (:FILE "tests/get-performance/guards.lisp" :SOURCE-SHA256
    "c41721b917ed443355ea3707efdd07e7da53a978c0515ab1e5ede5fcc47d63fc" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/get-performance/guards.fasl"
    :FASL-SHA256
    "ae366a77586fefa27ed168c6533ba084b0ffb86ec9017ff5afc0eadd44b9707f")
   (:FILE "tests/get-directory/threads.lisp" :SOURCE-SHA256
    "e6a93ec22bc6f5a31b37ae99d927d1ca3a53893adb2eae21cd89d132a82d1f64" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/get-directory/threads.fasl"
    :FASL-SHA256
    "c281ddb2dbf2261de3b37d69a1332eb5fa2f144b50f6a0b0ecfc2d32b0dfa807")
   (:FILE "tests/get-directory/support.lisp" :SOURCE-SHA256
    "be3a216a6ec597b63186b6bf3d3e35f3327f3001b1c00535d64b10bcb5d9fe85" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/get-directory/support.fasl"
    :FASL-SHA256
    "a36acf1199d5b58c323908da2a29a96b9197691ee1965e9ffa02de22a8405d4b")
   (:FILE "tests/get-directory/series-support.lisp" :SOURCE-SHA256
    "40f15fbdf42b80515cbfc57eb74bedcbd96d4a9e7e19dc25d8db59f326fe659a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/get-directory/series-support.fasl"
    :FASL-SHA256
    "f5893521748a37b19cc2d0477f7805ef6f28e6b887e4f2f41f6846b7dfad5c2f")
   (:FILE "tests/get-directory/series-read.lisp" :SOURCE-SHA256
    "4b9856d69cd82c1462c87d16b9eb8e00fb642a46bb22f2f7b01865f7cc2a83a4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/get-directory/series-read.fasl"
    :FASL-SHA256
    "86c5174dad49c130fa90ca6923260a7a4dfd52eade642ab638f4694f83266735")
   (:FILE "tests/get-directory/read.lisp" :SOURCE-SHA256
    "a222541b6413bb93ff86a269273f1fa15bfad0d1e4072fc058b023fec5143280" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/get-directory/read.fasl"
    :FASL-SHA256
    "37bdf2620aacc666f445523ca16980c44d4c8f77c953bd3620d70a4b5192566a")
   (:FILE "tests/get-directory/construction.lisp" :SOURCE-SHA256
    "4ce9aa7064793e908008b9e1055c1e2527d5071006782ea956509c28e8c712d7" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/get-directory/construction.fasl"
    :FASL-SHA256
    "356aa819603eb03271e46487a626bb1b7eb3f4f4a9a2a22e8eac06fec6df5485")
   (:FILE "tests/get-active/support.lisp" :SOURCE-SHA256
    "34c73b5323272a24fc01c132133d3cc74be7c00fa7ddd4ad08b8146bb42d589f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/get-active/support.fasl"
    :FASL-SHA256
    "c8f8757f2127920b70e4d9505706af1549477630df93e6a12899d7cb21294361")
   (:FILE "tests/get-active/read.lisp" :SOURCE-SHA256
    "ef1a15c742518b52bdbeecac6b838b0789b73d631f765a30fd016748769a72e6" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/get-active/read.fasl"
    :FASL-SHA256
    "a0a7c4e9b3e1cc4fb6b2dc792a5267f52d29e7ee0743c39d9eb2d201e1913557")
   (:FILE "tests/get-active/preflight.lisp" :SOURCE-SHA256
    "c65ef56f5f7498d4355e6a1f640969e3e31724fab9b84b5c3247e4e9d37626e3" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/get-active/preflight.fasl"
    :FASL-SHA256
    "897510912d6a6da291466cc0611b43ec49a009979c07f54baa805323bf2d84a5")
   (:FILE "tests/get-active/directory.lisp" :SOURCE-SHA256
    "ea6754ab84b53a4be1722985600e280fde6f73da4ea7eb843e99d66989df6fdf" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/get-active/directory.fasl"
    :FASL-SHA256
    "6fb12e3e9cf308d728429ff6c1ef8f5d3795387d93c028d9961468f9a387974b")
   (:FILE "tests/get-active/construction.lisp" :SOURCE-SHA256
    "31a21762f3c16950e4b6c0ce48a6ab235d2483476d03d4072d63905f7dd13deb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/get-active/construction.fasl"
    :FASL-SHA256
    "a40f577655d42ea812f34e8eeced006cd720318ec9e160283346890372e30a64")
   (:FILE "tests/foundation/support.lisp" :SOURCE-SHA256
    "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/foundation/support.fasl"
    :FASL-SHA256
    "5e94b3bb88ddbcace21d85aea445c37e8e22b219b3acdb28caaca71481849033")
   (:FILE "tests/foundation/record.lisp" :SOURCE-SHA256
    "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/foundation/record.fasl"
    :FASL-SHA256
    "1b850e07c2e0d9c39cc1ca12610118ef159c393cd8742f8a1b203105e65efc0c")
   (:FILE "tests/foundation/binary.lisp" :SOURCE-SHA256
    "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/foundation/binary.fasl"
    :FASL-SHA256
    "7a189a6ce608f71d88398817977d45b0dba32e83485377a32404865feca4eda4")
   (:FILE "tests/foundation/batch.lisp" :SOURCE-SHA256
    "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/foundation/batch.fasl"
    :FASL-SHA256
    "9b90ccd149b90b4053b0413da59e67a51f90334f5c2e38bb549c4c34053db26b")
   (:FILE "tests/execution/worker.lisp" :SOURCE-SHA256
    "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/execution/worker.fasl"
    :FASL-SHA256
    "40ed04f900efb7d4188c3bb4d86e05899de593b5b3235c6760cc3204edc3592e")
   (:FILE "tests/execution/threads.lisp" :SOURCE-SHA256
    "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/execution/threads.fasl"
    :FASL-SHA256
    "d7ece8a6bb60e0a5a965e972ead809267d608a8f5fb37f38169f044c33036c7c")
   (:FILE "tests/execution/support.lisp" :SOURCE-SHA256
    "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/execution/support.fasl"
    :FASL-SHA256
    "1ab2f7fe4f1f3815de79a47961f7557c5a6090ad63e44f452bced9e47a81fb30")
   (:FILE "tests/execution/ready.lisp" :SOURCE-SHA256
    "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/execution/ready.fasl"
    :FASL-SHA256
    "74fe63f59a5fe7c5ceeb3691cb0e6d11d69ad7b28d0215d638a7497180e0ee0c")
   (:FILE "tests/execution/ready-recycle.lisp" :SOURCE-SHA256
    "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/execution/ready-recycle.fasl"
    :FASL-SHA256
    "a034a48ecc01e5f78f7835c40002c490959fb54228b07d6d79a73566c4fc95a8")
   (:FILE "tests/execution/queue.lisp" :SOURCE-SHA256
    "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/execution/queue.fasl"
    :FASL-SHA256
    "0deaff3f6fd77a58f6af5d22be66e84035f1731903a286859f63faa64d4914a0")
   (:FILE "tests/execution/handoff.lisp" :SOURCE-SHA256
    "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/execution/handoff.fasl"
    :FASL-SHA256
    "4764368be76ea4fc3b21853bc382d40e1aee7364e651562d7e05171827dc7161")
   (:FILE "tests/epochs/threads.lisp" :SOURCE-SHA256
    "54b73e06c61e64f32a3e3af0791891dacb6590e929163dcf0fac95f2c71e66fd" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/epochs/threads.fasl"
    :FASL-SHA256
    "af919268fcfb46fa50126fbd392b8944646b9e5008b2c86111653bff70a1836b")
   (:FILE "tests/epochs/support.lisp" :SOURCE-SHA256
    "366be7af4bf6c4ed946b3fa9e97aea6b034c83e3b757d81c54078dc76d229b6d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/epochs/support.fasl"
    :FASL-SHA256
    "edd8a8eae6517c25ee2ef14c6e608a7ac0c7574baa7e2075ea62a82b3338c1c9")
   (:FILE "tests/epochs/lifecycle.lisp" :SOURCE-SHA256
    "ddc2fbdad9f97d2e4ff008c167776a50b17b742398306fbd5198dca474559cbf" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/epochs/lifecycle.fasl"
    :FASL-SHA256
    "2fc9fd503839f5c5dcecbe6921fd77ee542f3e053763ba8150f2f0c47bfa5e1a")
   (:FILE "tests/csn/threads.lisp" :SOURCE-SHA256
    "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/csn/threads.fasl"
    :FASL-SHA256
    "eeb3f13ed60def2c84865e8b7313b88b1e11d0dde8012ecc751b8224131724ea")
   (:FILE "tests/csn/support.lisp" :SOURCE-SHA256
    "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/csn/support.fasl"
    :FASL-SHA256
    "1a9e539558b51019a930b70fd9151ea354ecfdbb39ed1600d3ae1c1cedd5680e")
   (:FILE "tests/csn/registry.lisp" :SOURCE-SHA256
    "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/csn/registry.fasl"
    :FASL-SHA256
    "8c6a1b76de9e49ceab7d8db8e3f28bb1a56410272738f05ce081c24369e1815e")
   (:FILE "tests/codec/utf8.lisp" :SOURCE-SHA256
    "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/codec/utf8.fasl"
    :FASL-SHA256
    "0920d1a01a8b2c5941fc4a452ee2acf4eae196ce10167e208ef3bfd9f2bf2569")
   (:FILE "tests/codec/threads.lisp" :SOURCE-SHA256
    "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/codec/threads.fasl"
    :FASL-SHA256
    "f3a570312ad87257ea8ece4d301f415ff95247085ec24bd336109dccc1aa6825")
   (:FILE "tests/codec/support.lisp" :SOURCE-SHA256
    "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/codec/support.fasl"
    :FASL-SHA256
    "0caff5a6dc4cf9615f9b7006e5793050d40b32492a8c376d670bf34b84555ba6")
   (:FILE "tests/codec/cbor-write.lisp" :SOURCE-SHA256
    "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/codec/cbor-write.fasl"
    :FASL-SHA256
    "11d9b8384f7ab61d646473b2e08d5c2c0cb8b9d26876d9c14f45d15a15bfb79c")
   (:FILE "tests/codec/cbor-write-threads.lisp" :SOURCE-SHA256
    "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/codec/cbor-write-threads.fasl"
    :FASL-SHA256
    "60b074853c4254b3a41a472a5a89db3799eca2903bd8cd82ec101fe9a3607759")
   (:FILE "tests/codec/cbor-write-support.lisp" :SOURCE-SHA256
    "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/codec/cbor-write-support.fasl"
    :FASL-SHA256
    "ff47dd4509b10be7ed6085e6f995fc02f280134ff4e167b2808ba737a8fc6256")
   (:FILE "tests/codec/cbor-write-roundtrip.lisp" :SOURCE-SHA256
    "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/codec/cbor-write-roundtrip.fasl"
    :FASL-SHA256
    "a6bb6b665378a5d704a9811e5d3d7f6bee9d6ef279e55d1c0caffb0202981c4f")
   (:FILE "tests/codec/cbor-threads.lisp" :SOURCE-SHA256
    "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/codec/cbor-threads.fasl"
    :FASL-SHA256
    "3a0e218c91871562029f412dded3321f2c65b6beaa759f8f686327efb24083b1")
   (:FILE "tests/codec/cbor-support.lisp" :SOURCE-SHA256
    "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/codec/cbor-support.fasl"
    :FASL-SHA256
    "240a23b522d92e8e73a1d514772347afd5209cfee72b57a82abcc4f31fcdc1c6")
   (:FILE "tests/codec/cbor-structure.lisp" :SOURCE-SHA256
    "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/codec/cbor-structure.fasl"
    :FASL-SHA256
    "bccaaaa29a294b2878b388b93dbfee3d9dfbd020734db7a790892860081e702f")
   (:FILE "tests/codec/cbor-structure-threads.lisp" :SOURCE-SHA256
    "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/codec/cbor-structure-threads.fasl"
    :FASL-SHA256
    "f20f0a290daec0b488cc6ef822b5aecd93996db18ef0292affe42601a797c345")
   (:FILE "tests/codec/cbor-structure-support.lisp" :SOURCE-SHA256
    "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/codec/cbor-structure-support.fasl"
    :FASL-SHA256
    "4ffd1587cf26a0d73714d92f11dcecda255c3146d59e6a2bdccaa01cc7ef26df")
   (:FILE "tests/codec/cbor-string-write.lisp" :SOURCE-SHA256
    "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/codec/cbor-string-write.fasl"
    :FASL-SHA256
    "fe1644995a4e44deea788dfd5db062e8aa5c5808f839a48dfb5199388b5b068a")
   (:FILE "tests/codec/cbor-string-write-threads.lisp" :SOURCE-SHA256
    "8e07b881a55e2554a429f1c8b2c69f67862ac015217d90d019167d636564d27d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/codec/cbor-string-write-threads.fasl"
    :FASL-SHA256
    "b3544bf3be1088a749f99e99d9cef036f9a78eb5ac00b3d4f789c9f72cb9d9be")
   (:FILE "tests/codec/cbor-string-write-support.lisp" :SOURCE-SHA256
    "2cbdb601f442a56456bc637c94e759cc965f44b178268dce3c636c385d34fc39" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/codec/cbor-string-write-support.fasl"
    :FASL-SHA256
    "14cda726009aaf321ee161ae30df0f64df524fb128ee52bb0232fca5ebd67b78")
   (:FILE "tests/codec/cbor-simple-write.lisp" :SOURCE-SHA256
    "958bdd3901cfc41032c09d6c9023b192799981884e09ce3573256ff45bc5329a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/codec/cbor-simple-write.fasl"
    :FASL-SHA256
    "7b12acbe2852d1124319a2b9623b169080f32465b6cb38cc0d3b8d56e5153ec4")
   (:FILE "tests/codec/cbor-simple-write-threads.lisp" :SOURCE-SHA256
    "77074033e75a224fd02e890f98dffa8e97d3a1f8bedd510b00ea55d8ff8687b2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/codec/cbor-simple-write-threads.fasl"
    :FASL-SHA256
    "9e171ea218495b0f7adfca99e65f32040a2ce868f4e954fdefeb469bc1984801")
   (:FILE "tests/codec/cbor-simple-write-support.lisp" :SOURCE-SHA256
    "53ceafc72a027a2ff1f787900558ff26f2ff70bbb212f1b37926a6d520fbe86e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/codec/cbor-simple-write-support.fasl"
    :FASL-SHA256
    "d8cada368b9b216f6cac92800785336931777f0327c5c5493da362033c4f542a")
   (:FILE "tests/codec/cbor-minimal.lisp" :SOURCE-SHA256
    "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/codec/cbor-minimal.fasl"
    :FASL-SHA256
    "fd1dd9994873be0efd5ae77ac68542cfbbaaae864492f55581123e4f5dfc44a6")
   (:FILE "tests/codec/cbor-minimal-threads.lisp" :SOURCE-SHA256
    "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/codec/cbor-minimal-threads.fasl"
    :FASL-SHA256
    "d733f8e2a4a6eccef3826f43fe17503cbcc2422d29f8706972ff049ff214c30d")
   (:FILE "tests/codec/cbor-minimal-support.lisp" :SOURCE-SHA256
    "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/codec/cbor-minimal-support.fasl"
    :FASL-SHA256
    "3b7c26e9d67346c20c2259cc34cad656bc8c5265c0b37cef78f73f2b33d8bd12")
   (:FILE "tests/codec/cbor-minimal-scan.lisp" :SOURCE-SHA256
    "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/codec/cbor-minimal-scan.fasl"
    :FASL-SHA256
    "db918b739cb35d48f36d2b0e9e687d37bfc1d06b0b49008df1ec9c1c0999ea37")
   (:FILE "tests/codec/cbor-minimal-scan-threads.lisp" :SOURCE-SHA256
    "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/codec/cbor-minimal-scan-threads.fasl"
    :FASL-SHA256
    "b57cd543ebf23f0d48a0a3b66a34cac96c620252acfd3155e405e6fff7cbe141")
   (:FILE "tests/codec/cbor-minimal-scan-support.lisp" :SOURCE-SHA256
    "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/codec/cbor-minimal-scan-support.fasl"
    :FASL-SHA256
    "56fdd29dcbaab46dc71a66ab382de582952eda16edd00a71b07015b4ca0763d2")
   (:FILE "tests/codec/cbor-minimal-edges.lisp" :SOURCE-SHA256
    "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/codec/cbor-minimal-edges.fasl"
    :FASL-SHA256
    "dc7d1ea29c59b4e27f738fd37f23557e2bd12ea2ef1be1e2d9581784a34fdf8a")
   (:FILE "tests/codec/cbor-header.lisp" :SOURCE-SHA256
    "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/codec/cbor-header.fasl"
    :FASL-SHA256
    "7a6b63b750235a900d17c99074b4bc223408055b01f4b5c0db8d8c73db319af5")
   (:FILE "tests/codec/cbor-float-write.lisp" :SOURCE-SHA256
    "2d163a64bff4b9d9b9de576c4a4df05f4d8853f1c3d039e790cbb827be98c8b6" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/codec/cbor-float-write.fasl"
    :FASL-SHA256
    "c5c54ae0f87100dfad6b34409aeca5a45877598492b7850a21c50f17a91f4d2e")
   (:FILE "tests/codec/cbor-float-write-threads.lisp" :SOURCE-SHA256
    "96a1b205c01f75e271684132ff3e48b4da5cf8a01210257b591ec4951f097043" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/codec/cbor-float-write-threads.fasl"
    :FASL-SHA256
    "d7d156954341d7a37ebf071e1cfbca229a6d4e0c26bfb07bd2d358ba959e0a50")
   (:FILE "tests/codec/cbor-float-write-support.lisp" :SOURCE-SHA256
    "158f18dcf4b2d7e5562713caa3625aeba16dd1eba21f4413345e8a10b616c748" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/codec/cbor-float-write-support.fasl"
    :FASL-SHA256
    "81a86c33f27a76ede8b308f9076bd8b57a6b87dd56fbb515f808b1e688c7db39")
   (:FILE "tests/codec/cbor-array-write.lisp" :SOURCE-SHA256
    "9ed6a20ab5ae2db33ef419986c8ee963898894ce239059eae7866d503fe48098" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/codec/cbor-array-write.fasl"
    :FASL-SHA256
    "7919ae8970d350118cd7e648f32e9756844c4a435e93af303bbc38de575635f1")
   (:FILE "tests/codec/cbor-array-write-threads.lisp" :SOURCE-SHA256
    "6be0614da2bafdafe2d853fa7845fb913dbf0cd2673771c2c4b0cca277986e35" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/codec/cbor-array-write-threads.fasl"
    :FASL-SHA256
    "b91f8ac5e4a9f6ae8208164100171463b59261a154788a21c75957076bf02de2")
   (:FILE "tests/codec/cbor-array-write-support.lisp" :SOURCE-SHA256
    "42a59239bec468dea130b87733a077874a5d9e83ff0f491b20312315bc27ee95" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/tests/codec/cbor-array-write-support.fasl"
    :FASL-SHA256
    "0787aaa41aae55457a786d804be8cefaf97d723e14041120b30d82affc96c8b2")
   (:FILE "src/wal/types.lisp" :SOURCE-SHA256
    "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/wal/types.fasl"
    :FASL-SHA256
    "6bc7a3bb092fd9939994deb17fffa4b37d964d8e9baa4dd97f2ea1f6fc1373ff")
   (:FILE "src/wal/package.lisp" :SOURCE-SHA256
    "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/wal/package.fasl"
    :FASL-SHA256
    "cd1c32afeccc6c8e2dd89d84e4ce86a6541597b594c0a384dabf4d369e1410a4")
   (:FILE "src/wal/group.lisp" :SOURCE-SHA256
    "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/wal/group.fasl"
    :FASL-SHA256
    "5fb2b515694f4a69dcb8fe668425134681f482996ba6311d6b00ed5aa1f15b40")
   (:FILE "src/wal/executor.lisp" :SOURCE-SHA256
    "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/wal/executor.fasl"
    :FASL-SHA256
    "d97fcf73ab8ca10e62aafa00e7e8b888bd6dd7eb54937e1023b5573da2696aa5")
   (:FILE "src/wal/csn.lisp" :SOURCE-SHA256
    "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/wal/csn.fasl"
    :FASL-SHA256
    "1b53fad1b9e7f132df24f2841cf51de25984a394cfea4c05911a6e6305d509e4")
   (:FILE "src/wal/builder.lisp" :SOURCE-SHA256
    "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/wal/builder.fasl"
    :FASL-SHA256
    "264c709ec35fe737bbc2638812d2514bffd4fcc2dbf3ee8cbd3bf7231fcb92a6")
   (:FILE "src/storage/segment-header.lisp" :SOURCE-SHA256
    "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/storage/segment-header.fasl"
    :FASL-SHA256
    "ca8b0b6c10e306bec3f1429759ee06a0b87ab1abdc1f6823c449efca5e0a744d")
   (:FILE "src/storage/payload-write.lisp" :SOURCE-SHA256
    "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/storage/payload-write.fasl"
    :FASL-SHA256
    "8e173dd197b9d9b65a8e6e1b2fe4e05f4fa64e94030343aa6c065cb9e8695128")
   (:FILE "src/storage/payload-record.lisp" :SOURCE-SHA256
    "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/storage/payload-record.fasl"
    :FASL-SHA256
    "2f4cc3672dd0d948baddfe3f2b604e4d5f749f9e7c52527df90742ad5b602cba")
   (:FILE "src/storage/package.lisp" :SOURCE-SHA256
    "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/storage/package.fasl"
    :FASL-SHA256
    "3bf82ecc42f1336992015df9988244279204b7a812c307573fbe336e06787d10")
   (:FILE "src/storage/log-header.lisp" :SOURCE-SHA256
    "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/storage/log-header.fasl"
    :FASL-SHA256
    "1d58a7baaca517edc3584b6abaf57110c2393f1fdd8b942365919b9a312fd2c3")
   (:FILE "src/storage/formats.lisp" :SOURCE-SHA256
    "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/storage/formats.fasl"
    :FASL-SHA256
    "404a27c31659da3ad95d0211a44ceb14a1ce655978dfda68a10043c7f109ae5f")
   (:FILE "src/storage/control-payload.lisp" :SOURCE-SHA256
    "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/storage/control-payload.fasl"
    :FASL-SHA256
    "07359138a803346bb1c289c28fc81d7efc705a65bd596f60a6e24f07499e03a2")
   (:FILE "src/storage/compaction-scan.lisp" :SOURCE-SHA256
    "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/storage/compaction-scan.fasl"
    :FASL-SHA256
    "f016e7ed27130b2d80332f934e500536f964f135a2e1b813bb5d6fc52ea7d2aa")
   (:FILE "src/series/worker-types.lisp" :SOURCE-SHA256
    "a366799fd9b938bfaa48b0ffda228ff8369ab9acb5b5ead7f081dfc66ab2c81a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/series/worker-types.fasl"
    :FASL-SHA256
    "468ba7981adb826ba4473cb4b667f8cf38e663bcf927d8b9b96c3d84df7b5f8e")
   (:FILE "src/series/worker-run.lisp" :SOURCE-SHA256
    "f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/series/worker-run.fasl"
    :FASL-SHA256
    "c2cd951839428881f08e31587bbdc5fcaddac6f9d1fff42b7b2724d66da9dedb")
   (:FILE "src/series/worker-package.lisp" :SOURCE-SHA256
    "dcab7a17e4fabcf256c2eddfb655d18145a1d789dd8d64a889945badc418e4b7" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/series/worker-package.fasl"
    :FASL-SHA256
    "ebf9813f37071c21d9b8b845c96ebfec61fd6156ebb7e98a4532bb0b10ecdbc6")
   (:FILE "src/series/worker-boundary.lisp" :SOURCE-SHA256
    "793d401d1b9acc7b67923d815560f277f3d390ca050740f735f07d88dbacfe73" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/series/worker-boundary.fasl"
    :FASL-SHA256
    "83778967cacb6b652bea00c4e0fff803a6e8b5297b915679f54d6d4cd75c3e95")
   (:FILE "src/series/types.lisp" :SOURCE-SHA256
    "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/series/types.fasl"
    :FASL-SHA256
    "43f27b8a0c7ec12222b4719cfcd1a308ea121ed6e5177a94b2f14f615f9d94dd")
   (:FILE "src/series/routing-types.lisp" :SOURCE-SHA256
    "31ae51c0fb11a802164a4d1e11ec63f835a2c67b52c751c5685bcc8947e5e0f1" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/series/routing-types.fasl"
    :FASL-SHA256
    "db5643b44cc0960919a42735aef7a1adc8e3c94dc3ccf30efd2b1a3f5263fcc0")
   (:FILE "src/series/routing-select.lisp" :SOURCE-SHA256
    "796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/series/routing-select.fasl"
    :FASL-SHA256
    "79179b39bf3e7503b228bfd45948c8734006b0aa1bad03f3a80ca5e40c211bb5")
   (:FILE "src/series/routing-build.lisp" :SOURCE-SHA256
    "70135e73ecb1f6080683dd615c47a50530485061797382d74441743cd9a0f92d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/series/routing-build.fasl"
    :FASL-SHA256
    "37d895867c815222fa5eee44d892afd0d0ff28fde2c8c0ce9a80492bfe546554")
   (:FILE "src/series/retirement.lisp" :SOURCE-SHA256
    "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/series/retirement.fasl"
    :FASL-SHA256
    "5eff68300775e5dc06806ebe0500c67e31ccbe1c96429d128514781664b804ea")
   (:FILE "src/series/query.lisp" :SOURCE-SHA256
    "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/series/query.fasl"
    :FASL-SHA256
    "6f8766cd53ce5e36c0dd4dbb7ba13123df6638bfce14d95d4328ca73561328a4")
   (:FILE "src/series/publication.lisp" :SOURCE-SHA256
    "5de121c83ea6bd1243e420d9d898102aebb054cd1fa7ac79fcde9bf0792a95d8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/series/publication.fasl"
    :FASL-SHA256
    "3f94980174846485c3ef425ac5372a2cf78802def27cbf7a613c16f409dcfc84")
   (:FILE "src/series/package.lisp" :SOURCE-SHA256
    "9a402f5225860c483dec9064a84d6462d28f5377a27977a63f64a5fbdbdd3764" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/series/package.fasl"
    :FASL-SHA256
    "8498dbabe56ae9bc938503c91480a2c108778d6e04e8ea70a8472d6337c27e35")
   (:FILE "src/series/ownership.lisp" :SOURCE-SHA256
    "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/series/ownership.fasl"
    :FASL-SHA256
    "08be30a83cc7be4f23a24a2fe4794fd4720cffacb60bad98ece107601aa35576")
   (:FILE "src/series/io-events.lisp" :SOURCE-SHA256
    "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/series/io-events.fasl"
    :FASL-SHA256
    "a1d2e3823fd47d1b5772821cd3b3587425fd77e0508b40950d540795368767e8")
   (:FILE "src/series/events.lisp" :SOURCE-SHA256
    "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/series/events.fasl"
    :FASL-SHA256
    "72a9550d9ce1b67245cdf17649b7cae3a2c79e20598634d9841c9c78a27e763b")
   (:FILE "src/scheduler/update.lisp" :SOURCE-SHA256
    "e35a704ee0b9445c559a768de048169a8e39837a6df21843d8df58215c482472" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/scheduler/update.fasl"
    :FASL-SHA256
    "ab1acf6e15d9985cdf1ef123652d87e0469e3d221e5c64d3c40985d26a8a868d")
   (:FILE "src/scheduler/types.lisp" :SOURCE-SHA256
    "3b174be0919f8b27312ada4071d831c3753d62bb12be99d7e9394c48dcab474a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/scheduler/types.fasl"
    :FASL-SHA256
    "3c3a78259b7911d1e6ea460ed7bb3863de6b368af71560f25d8fc12035cc0772")
   (:FILE "src/scheduler/read.lisp" :SOURCE-SHA256
    "5cdc1e5b7ba97c9aab66a5acaf74336b0df33144e24104e0242b7fc2552a1ae2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/scheduler/read.fasl"
    :FASL-SHA256
    "194c197b1a8847169c54ddc6fd1b1333a750323cae09ffb16d082cb60a9d348e")
   (:FILE "src/scheduler/pool-claim.lisp" :SOURCE-SHA256
    "e384f6091a5fcb506e718e12e77b06ab8dd4233a41024bc57ca3b14425e10b14" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/scheduler/pool-claim.fasl"
    :FASL-SHA256
    "58bd77f282fa2fa6de89a6ab06a101bfcc3138703b2a3d817222a01da3a7b6b0")
   (:FILE "src/scheduler/policy.lisp" :SOURCE-SHA256
    "92b3ca3a81ae0b3ac342a63e5fe5c5d7524091a63065b0232c14c57ee80c4aac" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/scheduler/policy.fasl"
    :FASL-SHA256
    "fcb6b9ca950b3a9b0fcd0da7435fda7bd6177e2e5f9a0f6165e99b8c5c96508a")
   (:FILE "src/scheduler/package.lisp" :SOURCE-SHA256
    "a44fd2c3d435e1f6729bf861b6caeb54a184f31c92e7909aad9c18b491f03cdf" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/scheduler/package.fasl"
    :FASL-SHA256
    "33d74d423cd5f9f75fac7580ae3e4e5eb33ba82957e6aa1f75255242ab706425")
   (:FILE "src/scheduler/lifecycle-worker.lisp" :SOURCE-SHA256
    "ec8b462ff3f5f7a6435f0f0c01b62034d8de2a784a9e354d469a0adfec9cf837" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/scheduler/lifecycle-worker.fasl"
    :FASL-SHA256
    "e8472cb43145920fe8b49912448cf9113b744285c31becf89c54b76495cb4568")
   (:FILE "src/scheduler/lifecycle-update.lisp" :SOURCE-SHA256
    "2020e46809e9fe8fa74e061a420b8085679d5f461eabd8b044f3975c1024800e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/scheduler/lifecycle-update.fasl"
    :FASL-SHA256
    "d7ad6ec6a65486e6f374972a7698c8369d373cda7fe56a32c97aa8d394214fff")
   (:FILE "src/scheduler/lifecycle-types.lisp" :SOURCE-SHA256
    "4fe980e00f1d273e9b8278cd2daace6b4a9e4ab948ddfac83b79f4b0c537cb7c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/scheduler/lifecycle-types.fasl"
    :FASL-SHA256
    "3b2c14a66c05f200e2baa44b5f1ed8c2d9f8c428d6bf5de34e44bae8b5a442f7")
   (:FILE "src/scheduler/lifecycle-read.lisp" :SOURCE-SHA256
    "c60e1d5f67eeafb216b374fa001d27f87d1a734c5d066fc092902c0301069200" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/scheduler/lifecycle-read.fasl"
    :FASL-SHA256
    "ef949bc80e3bc5194bca499d99626bc6c77d2a0189ef3739dfbf0d4e6a600886")
   (:FILE "src/scheduler/lifecycle-build.lisp" :SOURCE-SHA256
    "d6d67faf8721f26e7fcd228d6ab9a7dfdc36ff5ec56c67ed9e5fb6d914006a9e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/scheduler/lifecycle-build.fasl"
    :FASL-SHA256
    "5c5f0bf739d46debfa3e9ac83f87323353f4da03a909355fca1b387f7749cd71")
   (:FILE "src/scheduler/build.lisp" :SOURCE-SHA256
    "58baf595f221826c64e3fb38344242c3bdf403d65904193bf1a8e06e09d7c336" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/scheduler/build.fasl"
    :FASL-SHA256
    "6c54cf2b003780591fdb4f720d38ce4d3fe5c425041f6ae3ac6149752ba005ff")
   (:FILE "src/recovery/scan.lisp" :SOURCE-SHA256
    "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/recovery/scan.fasl"
    :FASL-SHA256
    "81a2011b26de63b8bbd0bfba630e706e7ecccaacc1394cb3bf526566643c6c82")
   (:FILE "src/recovery/package.lisp" :SOURCE-SHA256
    "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/recovery/package.fasl"
    :FASL-SHA256
    "740f61a49353faca8f9940df56bfc98b96aa9542e66423cb2f886010546a4ac9")
   (:FILE "src/recovery/manifest-types.lisp" :SOURCE-SHA256
    "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/recovery/manifest-types.fasl"
    :FASL-SHA256
    "f1200b05437dd45880251f17b2e225c41c28da356ccf211c9911f97d4e421d01")
   (:FILE "src/recovery/manifest-query.lisp" :SOURCE-SHA256
    "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/recovery/manifest-query.fasl"
    :FASL-SHA256
    "98418d134188ff62e07b0ef731e8ef33a9c7da37f1a8b28fe8a8325115e3f789")
   (:FILE "src/recovery/manifest-package.lisp" :SOURCE-SHA256
    "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/recovery/manifest-package.fasl"
    :FASL-SHA256
    "eb8deab04c307ff867180d366c56550033551c77a75652453e736834da42c1e5")
   (:FILE "src/recovery/manifest-fold.lisp" :SOURCE-SHA256
    "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/recovery/manifest-fold.fasl"
    :FASL-SHA256
    "5887fa073cdf269347c066925eb07b5bfb43355ca8e044a5e762d439c807a037")
   (:FILE "src/recovery/manifest-decode.lisp" :SOURCE-SHA256
    "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/recovery/manifest-decode.fasl"
    :FASL-SHA256
    "8e2cf653dded147b0053b4c39a39ba940db579517b0fc413a76dae8eaaf7ac78")
   (:FILE "src/recovery/manifest-build.lisp" :SOURCE-SHA256
    "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/recovery/manifest-build.fasl"
    :FASL-SHA256
    "8838c88843c6ffb3b3496bebe30509c213fdca34d622264a29119e537c092436")
   (:FILE "src/recovery/inventory-types.lisp" :SOURCE-SHA256
    "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/recovery/inventory-types.fasl"
    :FASL-SHA256
    "a980e95a5e34be4163b4fcdda6a1f38561a136f52a96da0104cf2b82303ddffe")
   (:FILE "src/recovery/inventory-query.lisp" :SOURCE-SHA256
    "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/recovery/inventory-query.fasl"
    :FASL-SHA256
    "12469bb2d4c09c65c4041d2b6e16648914c7d5c1149663ca5129634f29bd89d1")
   (:FILE "src/recovery/inventory-build.lisp" :SOURCE-SHA256
    "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/recovery/inventory-build.fasl"
    :FASL-SHA256
    "80fd76c0a48a68ebc4b69b0778c5c5ebfab0a6d269cb72644b8280cb88472260")
   (:FILE "src/recovery/decisions-types.lisp" :SOURCE-SHA256
    "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/recovery/decisions-types.fasl"
    :FASL-SHA256
    "9fbfa3215f88a0461ce537fa7fc1b73e7f1c262946f1ea507ab1d2b0e3c034a6")
   (:FILE "src/recovery/decisions-sort.lisp" :SOURCE-SHA256
    "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/recovery/decisions-sort.fasl"
    :FASL-SHA256
    "63c108e70f073357f0493ab855dca0b55d9afb3c233a66e73d0471d3c02bdeae")
   (:FILE "src/recovery/decisions-radix.lisp" :SOURCE-SHA256
    "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/recovery/decisions-radix.fasl"
    :FASL-SHA256
    "02b338ff80912a89b7356aa033123fd46480e289ef4df7b28a69eec500661f26")
   (:FILE "src/recovery/decisions-query.lisp" :SOURCE-SHA256
    "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/recovery/decisions-query.fasl"
    :FASL-SHA256
    "7fec9a7132174bf7b4e9735e0ea64d5b85925e218b015f849d776f45b7f7d5eb")
   (:FILE "src/recovery/decisions-package.lisp" :SOURCE-SHA256
    "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/recovery/decisions-package.fasl"
    :FASL-SHA256
    "ee8fa9c17b5522344bb1cc1826197c42cffb816ea0fb324a91ac751c25ef8e8f")
   (:FILE "src/recovery/decisions-build.lisp" :SOURCE-SHA256
    "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/recovery/decisions-build.fasl"
    :FASL-SHA256
    "8ae65c09847c9312ebeeb79a5f58db0d229d7b9ff75533b1eb5da9d8d0f0ace0")
   (:FILE "src/read/types.lisp" :SOURCE-SHA256
    "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/read/types.fasl"
    :FASL-SHA256
    "45749ce321868fa7e665f3467b97bb2136689c38412747d1fdaa4fdf71748238")
   (:FILE "src/read/task.lisp" :SOURCE-SHA256
    "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/read/task.fasl"
    :FASL-SHA256
    "7448f8bf20ce15f5afe1d7a196095016e8dd8fd588c30adbf30dc78ececbdd98")
   (:FILE "src/read/package.lisp" :SOURCE-SHA256
    "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/read/package.fasl"
    :FASL-SHA256
    "18e69e17577c17c61cb11ef0662250196bef86138babe7809b2914bfab124348")
   (:FILE "src/read/core.lisp" :SOURCE-SHA256
    "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/read/core.fasl"
    :FASL-SHA256
    "068a1770b0b35a040c7f3998d642e28ddcdfd43721164ec42e4a592a76b038d1")
   (:FILE "src/package.lisp" :SOURCE-SHA256
    "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/package.fasl"
    :FASL-SHA256
    "0542cf4f0f1dcba78fad3b9b183f14a99ac04d23d981cae6457531d9aab4aa6b")
   (:FILE "src/mvcc/types.lisp" :SOURCE-SHA256
    "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/mvcc/types.fasl"
    :FASL-SHA256
    "51947f21fbe4a8b24c311487d9a20863e0649d9e10b802807e998c6011e9257f")
   (:FILE "src/mvcc/snapshots-types.lisp" :SOURCE-SHA256
    "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/mvcc/snapshots-types.fasl"
    :FASL-SHA256
    "b396250691ce51b57235640fb6fc75a97f2ce9d526f03eb93a254a91647e5bdd")
   (:FILE "src/mvcc/snapshots-register.lisp" :SOURCE-SHA256
    "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/mvcc/snapshots-register.fasl"
    :FASL-SHA256
    "c19625af818885be2738818fb095f702ee65dc7ad15ecb32389eb03732d57395")
   (:FILE "src/mvcc/snapshots-read.lisp" :SOURCE-SHA256
    "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/mvcc/snapshots-read.fasl"
    :FASL-SHA256
    "051b86c247036e87623b0b2d4af0f76e0d4d7e4b0ecb577c10d2645a97eb36bd")
   (:FILE "src/mvcc/snapshots-lifecycle.lisp" :SOURCE-SHA256
    "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/mvcc/snapshots-lifecycle.fasl"
    :FASL-SHA256
    "093f33f793da82dc733e579407800a8dc311dbe023c054cdecbf47b76ae34517")
   (:FILE "src/mvcc/snapshots-csn.lisp" :SOURCE-SHA256
    "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/mvcc/snapshots-csn.fasl"
    :FASL-SHA256
    "91bcf06e97d52b745888e547d93f2fcbef725e9f424176fdee5a56846a61313b")
   (:FILE "src/mvcc/snapshots-core.lisp" :SOURCE-SHA256
    "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/mvcc/snapshots-core.fasl"
    :FASL-SHA256
    "e7805e479df41af74b968adc2525f23ef16424dcbefc20a1c9e5162196322eaa")
   (:FILE "src/mvcc/package.lisp" :SOURCE-SHA256
    "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/mvcc/package.fasl"
    :FASL-SHA256
    "74cdfc17b7782badb0751948d41da224512511fa8b28dcb551096486bb817553")
   (:FILE "src/io/types.lisp" :SOURCE-SHA256
    "68df36ae5167c975261f99d63a6598bca1fe93caca02f39e18812e94fcf1b233" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/io/types.fasl"
    :FASL-SHA256
    "4e8be2e7c5085668f6bf1b076bc911f0686fc2432558a81c26ff618b44a2c799")
   (:FILE "src/io/transfer.lisp" :SOURCE-SHA256
    "c807f294d0211e8433f8f0332ab6ba3ce7d9ae7de3818f43af7ff8d7fcfd341a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/io/transfer.fasl"
    :FASL-SHA256
    "236972f388df56e3700de811557de457c7d0c1b430ea87967ab5fffdd56a43f1")
   (:FILE "src/io/rename.lisp" :SOURCE-SHA256
    "ef9475701a2da4a44d98f9c88a1f547f3be1f07c649c8c3c956c206c80a55598" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/io/rename.fasl"
    :FASL-SHA256
    "bd2f0e9e6be086acd45e704917622c06bf4991c61fcd3d9582119038a649c1b3")
   (:FILE "src/io/package.lisp" :SOURCE-SHA256
    "605f51109d723267b326c012602a91e7deff984a040c3440d90665b853e3549c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/io/package.fasl"
    :FASL-SHA256
    "a16ee620dc96e64c30fece5410f63798c01f8a96d7979053d24846d8607c5567")
   (:FILE "src/io/native.lisp" :SOURCE-SHA256
    "74f63dbb2137a344054e82c6707e6262473b3332ff66a85f79ecfee9fd50f9b4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/io/native.fasl"
    :FASL-SHA256
    "dac57f1691b990412ab37be299b1403f724725ac04b003d206ee4416af6a3f72")
   (:FILE "src/io/native-namespace.lisp" :SOURCE-SHA256
    "3a7ada1ffe09c94714629a3679bf26a56bd5570ff3bf06acbce4be83750a47ad" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/io/native-namespace.fasl"
    :FASL-SHA256
    "6de84b6d81ef44031510350ec2cdc2185684b812533271acac8eb1aa8362060b")
   (:FILE "src/io/namespace.lisp" :SOURCE-SHA256
    "f23b46209fa87bee4deee84dbe3d87bc7a20d0a4f98bdafe7d40391fc42e1b59" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/io/namespace.fasl"
    :FASL-SHA256
    "414919154ffe1e89f2a547b1e2a16517f78e370d34094b5da84c2b9b81987588")
   (:FILE "src/io/lifecycle.lisp" :SOURCE-SHA256
    "88e72ad54b8c8048358cbca2d136c62883d8e700d63d92e807cb14df0082ae6a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/io/lifecycle.fasl"
    :FASL-SHA256
    "4d610dac6cba77772b437f27743c559bac831ccd3ba3f770cef2e17447aea64a")
   (:FILE "src/io/identity.lisp" :SOURCE-SHA256
    "d2b6f7932b66f2ef74241e573ed253cf9b710f217cd570ef23f6671614d90a2c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/io/identity.fasl"
    :FASL-SHA256
    "90426ee92f00006a0a80103908d2f7ee7bbeb720785ece521708d09af09ec944")
   (:FILE "src/io/identity-types.lisp" :SOURCE-SHA256
    "5794dd5094f34c24e7e09e4a7937f1988d85ea9cd37e478abaf836273da5d5c1" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/io/identity-types.fasl"
    :FASL-SHA256
    "c1fef7930dd52b326404c74c50f3d07a7187cbfa1abef26ac00c69520a54ec48")
   (:FILE "src/io/flush.lisp" :SOURCE-SHA256
    "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/io/flush.fasl"
    :FASL-SHA256
    "cd8ba1f0dadf4ed2001bdf823ae8d224ddecf5f0a427da53a240744a3b1c0b4e")
   (:FILE "src/index/write.lisp" :SOURCE-SHA256
    "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/index/write.fasl"
    :FASL-SHA256
    "56c606c2b71eaebb14712ce97cbdc45c75059f208f2a1c154c29482e497cfa27")
   (:FILE "src/index/validation.lisp" :SOURCE-SHA256
    "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/index/validation.fasl"
    :FASL-SHA256
    "177a87ee234a55aeff20a2451b66d6b0993cb047ba8bc1914241b5a02c797179")
   (:FILE "src/index/types.lisp" :SOURCE-SHA256
    "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/index/types.fasl"
    :FASL-SHA256
    "ea12106df1f649ebb2142a62d3f54c555e024cc2616a480f9990830a154498f4")
   (:FILE "src/index/relocate.lisp" :SOURCE-SHA256
    "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/index/relocate.fasl"
    :FASL-SHA256
    "6b3e1904e97ac1e27d21d377d95384d50fd369f83150481a98d059b261ceffd8")
   (:FILE "src/index/rebuild.lisp" :SOURCE-SHA256
    "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/index/rebuild.fasl"
    :FASL-SHA256
    "208918c7b0ac224a043d719d5e0248c960d66e7579a9365749d31c2b34a6461a")
   (:FILE "src/index/rebuild-scan.lisp" :SOURCE-SHA256
    "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/index/rebuild-scan.fasl"
    :FASL-SHA256
    "d042185cc0d8356ea0aa7b156c0ff92d67ce47723a8ccb3b4cc282f4ff32c80b")
   (:FILE "src/index/rebuild-copy.lisp" :SOURCE-SHA256
    "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/index/rebuild-copy.fasl"
    :FASL-SHA256
    "68dbba51805becfbb0eaf40033e5438424a553cc80af287cb099917bf76a9a5f")
   (:FILE "src/index/rebuild-budget.lisp" :SOURCE-SHA256
    "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/index/rebuild-budget.fasl"
    :FASL-SHA256
    "cdef6dc946409dbc2d13a10bc4b11e94420eb2dff84b23538ba996ae1fb3882c")
   (:FILE "src/index/read.lisp" :SOURCE-SHA256
    "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/index/read.fasl"
    :FASL-SHA256
    "3213c9e5fb53f3da1f0430168d9f672cca048c63e5a2ac98835a9c27dff8e44b")
   (:FILE "src/index/primary-write.lisp" :SOURCE-SHA256
    "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/index/primary-write.fasl"
    :FASL-SHA256
    "133a8e6a2d99700874f3c968a39c8de5a1a1f98539176bd0b4cd0f8498368f11")
   (:FILE "src/index/primary-types.lisp" :SOURCE-SHA256
    "f17ca0dcd8a538b921f00044e23872b28272638c4435eacd30f0509422505e64" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/index/primary-types.fasl"
    :FASL-SHA256
    "f66caa8fc5e07a9aef4dbba0ea57463eeb84171c2a05fc359baac5204c89ac54")
   (:FILE "src/index/primary-relocate.lisp" :SOURCE-SHA256
    "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/index/primary-relocate.fasl"
    :FASL-SHA256
    "d5ad721ff35d7f2a5476f98b5cb41dea42048c7985bbbf0e3181d2e7aabfa1c9")
   (:FILE "src/index/primary-read.lisp" :SOURCE-SHA256
    "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/index/primary-read.fasl"
    :FASL-SHA256
    "48e2f452cf474d10c62503dedd75676022cf6eaf5e81cde61a9ff24f69eb0f70")
   (:FILE "src/index/primary-probe.lisp" :SOURCE-SHA256
    "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/index/primary-probe.fasl"
    :FASL-SHA256
    "9f49076faf48d584409214d97992ec47b4648d412c48696d9dc5020463a547d1")
   (:FILE "src/index/primary-package.lisp" :SOURCE-SHA256
    "0682eb9a61596506b6788bd0285f9808db2496246caae64ab3203182ed46b860" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/index/primary-package.fasl"
    :FASL-SHA256
    "e682d56b58b2a2196770cf9a2ac300996c4420cbafbb33a3e4d26aae952129d7")
   (:FILE "src/index/primary-directory.lisp" :SOURCE-SHA256
    "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/index/primary-directory.fasl"
    :FASL-SHA256
    "822ff73f8d7460b0ce410063ff5ee71a6172c28ec1c2ace04f4638a54acd8110")
   (:FILE "src/index/primary-core.lisp" :SOURCE-SHA256
    "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/index/primary-core.fasl"
    :FASL-SHA256
    "e1b264f82c92f867d3b79fdda3192677942dc1a255f71ff8207cd42c5fb14e42")
   (:FILE "src/index/primary-build.lisp" :SOURCE-SHA256
    "06ca5ac8c03504e2d2f973873e5cabf7518c090cd1f8f2118c46e0ea2f9bf37b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/index/primary-build.fasl"
    :FASL-SHA256
    "c6acc959d18fed3ed1be6d51fe3ac7e21234dd5624e9f2aec526d828b67dcaee")
   (:FILE "src/index/primary-arena.lisp" :SOURCE-SHA256
    "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/index/primary-arena.fasl"
    :FASL-SHA256
    "250a617fa83669b93b73c7c93c450cf3d0f9274538c75dab1c6a4f29843980f9")
   (:FILE "src/index/package.lisp" :SOURCE-SHA256
    "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/index/package.fasl"
    :FASL-SHA256
    "11d338c658c0720908205d4e6668e2ef53b572ddcf002586799b69349867aa17")
   (:FILE "src/index/hash-seed.lisp" :SOURCE-SHA256
    "ae86514101e95737747ba58a4f0c5dc1ddb44d2b3a18bceb8fd0d0756b57a7a1" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/index/hash-seed.fasl"
    :FASL-SHA256
    "1c95846a03c24a9537ae26e800314345838b6a772db28d4ee8dbfed77c47788c")
   (:FILE "src/index/hash-digests.lisp" :SOURCE-SHA256
    "924bb7dab91ff56c1e909f2b06dff5f74b443ac6442e379498f29b25f1fa2673" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/index/hash-digests.fasl"
    :FASL-SHA256
    "ce5bf77496b1f2877b686ee33d6119e79d89525ea789c70adf3fc6acd513326d")
   (:FILE "src/index/core.lisp" :SOURCE-SHA256
    "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/index/core.fasl"
    :FASL-SHA256
    "0826425a23c2749b2cd92b61632c1482ebeffe5f9a7abd30e411429ed13c9504")
   (:FILE "src/hash/package.lisp" :SOURCE-SHA256
    "1e7668fa26fc1a8e3b3cfe824aa3e08b30b57441d5f90d44453fc3a9259a10d0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/hash/package.fasl"
    :FASL-SHA256
    "07afa71e72284dbfa5ff44f109a4f9b88e98876439f3bc6eace55509600d2b57")
   (:FILE "src/hash/hash64.lisp" :SOURCE-SHA256
    "99e4c8394a8f877ce1f552f15a57a082c0ec81015e87119ee4ffea28cf3ae77f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/hash/hash64.fasl"
    :FASL-SHA256
    "b07b20dd76220f1ab29b41115f8b4d4266671548e0a0fed3d7029a36fd0fda91")
   (:FILE "src/hash/blocks.lisp" :SOURCE-SHA256
    "5f5dff95ae6c34dfc15538c537ba2fa8d34ba2376ad66ad9975745ea13a2175f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/hash/blocks.fasl"
    :FASL-SHA256
    "6b32da107f8addaafc371f2167d61f9fbca2338aa854cfe2431d42eaf836731b")
   (:FILE "src/hash/arithmetic.lisp" :SOURCE-SHA256
    "c439e534b768acb123d69b921b85e1e56683aa8335bbc87efba95fe95f256fa9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/hash/arithmetic.fasl"
    :FASL-SHA256
    "b5842b375db0c7083498bb8e6df06279aa261693fcdea755246cd5d6a26b8d88")
   (:FILE "src/get/types.lisp" :SOURCE-SHA256
    "653b23a6e719cd1f55e7c58b4d7e8143aec5983992ba210d0eac1f4c8682f623" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/get/types.fasl"
    :FASL-SHA256
    "2aecc2344d601b9da12b9ee1d032f7de29874de42e8b882b376d6b89845e01ba")
   (:FILE "src/get/target.lisp" :SOURCE-SHA256
    "9f682f735e49108cad176a6143ec99e1be64da98f29cae0b52f9b49cdea34250" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/get/target.fasl"
    :FASL-SHA256
    "23998994d37cb2dac120810147329906028261baad916a3a6476779095eef764")
   (:FILE "src/get/segment.lisp" :SOURCE-SHA256
    "4a486528cb2c1cc3471cb4b332d4314d24011889e1f885db6fd5600bb077eea3" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/get/segment.fasl"
    :FASL-SHA256
    "883d4d0f04653847b576ee9d515a1edfb53964451d1b0f297df03f114729dd8f")
   (:FILE "src/get/package.lisp" :SOURCE-SHA256
    "87b795779aef0c4b918a039d182daddd22b902a9ad10c763df4364b7e630151c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/get/package.fasl"
    :FASL-SHA256
    "12f78fb7dd0e9359d30f3b81d4747bb6b15d8abee8f70d74c4d0f6669ae9250f")
   (:FILE "src/get/lookup.lisp" :SOURCE-SHA256
    "9d1042d4cf1e7bd9c6d1153de12b2459e7a2724e47bd32534cd7ae56cb274c5f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/get/lookup.fasl"
    :FASL-SHA256
    "0cdae9d3cea7bf1b1743618dd4a0e7d715899a9ce0fcaa32b7889fe35eefdaa3")
   (:FILE "src/get/lifecycle.lisp" :SOURCE-SHA256
    "885ba4141114ea411cac37c9b5f924aaa7f9f2a5ba311ebf92a392e5da1e3c59" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/get/lifecycle.fasl"
    :FASL-SHA256
    "1f9c8425047f572fa2ea56c1550e466c566649b20e0e9a6f9ba9de28dbffd047")
   (:FILE "src/get/build.lisp" :SOURCE-SHA256
    "bcfc4916e9a85833dc151c4ce176bc905f2c03b6bc6d636f97a60df0d8c16739" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/get/build.fasl"
    :FASL-SHA256
    "71caf734912aa8e282d5d99279ec5b788f61dc0faddc43675085e75c3b3c8c7d")
   (:FILE "src/get-resolver/types.lisp" :SOURCE-SHA256
    "b847d6c388f4d052a2d707b7c410cc7c2ef60482fb5cd9ef384c016c31d1dc00" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/get-resolver/types.fasl"
    :FASL-SHA256
    "67970dcb0ff9bf18e94fa31697e50294780cfad3b870216136c26d5533e7f9b3")
   (:FILE "src/get-resolver/sort.lisp" :SOURCE-SHA256
    "974bf44efeb1cd26c5e9db0601aea295c8f1a18234894ad9d41938a2880e2255" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/get-resolver/sort.fasl"
    :FASL-SHA256
    "ae1c22c136e5c8a2fadc575cbe7510a9d5aa4a7398e80a9bd891417aaefb0238")
   (:FILE "src/get-resolver/scan.lisp" :SOURCE-SHA256
    "35a1780c6bf66364ef94c4151fa91f02eebe359f0ca0639985d2a907fd9d512d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/get-resolver/scan.fasl"
    :FASL-SHA256
    "b0338963e8d75d9fbe7b199f10362a3b953dee9724f99faa54822b189719ac42")
   (:FILE "src/get-resolver/rows.lisp" :SOURCE-SHA256
    "d9db85d788006fc7ad1f9a7cdeef28b992605de7fac8c295dd7fdc51f5511854" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/get-resolver/rows.fasl"
    :FASL-SHA256
    "e0e77320d488f4b4747093710243fc81c1f7a5499885b4df700ed699745852c6")
   (:FILE "src/get-resolver/read.lisp" :SOURCE-SHA256
    "dd100bb17e15589124916767f8a690ae683ac8c462102c778639f917a5f1924d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/get-resolver/read.fasl"
    :FASL-SHA256
    "b62b040a947714783e7fbb1f272273b1b36cad84d7d373832809b8ad15d79d11")
   (:FILE "src/get-resolver/package.lisp" :SOURCE-SHA256
    "663a5a15a630ed2b9042a3a3365598358df97d3dd1cd3d7610b283526281f39a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/get-resolver/package.fasl"
    :FASL-SHA256
    "61ea06dff17f0a9d901eb863285fd30bf2037916ddcbaf0d0c308e2e06ddf38b")
   (:FILE "src/get-resolver/build.lisp" :SOURCE-SHA256
    "c649c80c2b510669fc1c0a7f15b3080b7fb46a3423a1e49db5bb9ff248176e0a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/get-resolver/build.fasl"
    :FASL-SHA256
    "88ae22bd30545a11fde82e796edaec523c5de927386a31fa95c4b4e070dbab30")
   (:FILE "src/get-resolver/active-types.lisp" :SOURCE-SHA256
    "a3cb954a265b263e0e03d2f1a80824589670efbf89adcd69007987d26df2e29a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/get-resolver/active-types.fasl"
    :FASL-SHA256
    "105ecc581565c3db4038fda7d629037f187b4334a70f39c6396808bd19745f32")
   (:FILE "src/get-resolver/active-scan.lisp" :SOURCE-SHA256
    "97dd4f59d4449334b113e9403a208007ed1a398a9b53f88bda3e3c0bbf3a1067" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/get-resolver/active-scan.fasl"
    :FASL-SHA256
    "6c1227b72940a092df86520eb385557949e45615111b6292db65fe9876a5572e")
   (:FILE "src/get-resolver/active-read.lisp" :SOURCE-SHA256
    "47630e5d42c785e39e15dd714177cd86159129a5391d82321385f92317bea659" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/get-resolver/active-read.fasl"
    :FASL-SHA256
    "1bf02c4f76f3934e591e564a768a49fce0076e84d217b5970985862803c88304")
   (:FILE "src/get-resolver/active-preflight.lisp" :SOURCE-SHA256
    "eb56f5704666cac3a88ec97f58f70c7d61db2e8feea6a094db4c468a1a2775a9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/get-resolver/active-preflight.fasl"
    :FASL-SHA256
    "d83da8c045c290a72603a6d4ab19cb4ad33b86884ef2f9d9e9ee145b1781dd5c")
   (:FILE "src/get-resolver/active-init.lisp" :SOURCE-SHA256
    "2f9380674cf4b590b071ab9d769a4b79292f544d920c0fc5ff33146dde7686f6" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/get-resolver/active-init.fasl"
    :FASL-SHA256
    "751f8708864d332a622ff7aa09dc56eb15d59a790451f71df79d97b49a41dd30")
   (:FILE "src/get-resolver/active-directory.lisp" :SOURCE-SHA256
    "c2b9a9ac3209270e9949720473908460548430a8098c9199fb55d2317a87682b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/get-resolver/active-directory.fasl"
    :FASL-SHA256
    "45ed423ba216b50230f25851ed737a3e65c0c36143d80f744bde05840910c47c")
   (:FILE "src/get-resolver/active-build.lisp" :SOURCE-SHA256
    "0eed95930d41c515965ae8ab0a14fbb94597a42ea38b86f205ea0938cf4631de" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/get-resolver/active-build.fasl"
    :FASL-SHA256
    "a346e6b6545f11b9f009da44d548756af5bb674daf52772139de153c91067eea")
   (:FILE "src/get-directory/types.lisp" :SOURCE-SHA256
    "0e2348291a4994f45bd1f6fe5efdc66041d2fdce18641d1af11b6c850ed69b2b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/get-directory/types.fasl"
    :FASL-SHA256
    "38b55be1b6fc5d1b3f47c218566196b9c76b93c8b08703ec4e5e2fcffaf744fb")
   (:FILE "src/get-directory/sources-types.lisp" :SOURCE-SHA256
    "862342b07d6a8aae834aaf3da4149682fcd1dcbdae971adad640597583547099" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/get-directory/sources-types.fasl"
    :FASL-SHA256
    "65a8263e88ee4349a9f88e1e12ddce91b0fe1f312bd143d704fdd5f5fbf7bf2f")
   (:FILE "src/get-directory/sources-read.lisp" :SOURCE-SHA256
    "ee4a3b81322fbd51ce928be0b73e9bc180af7ed39f936b68ec9a152dd2a180c2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/get-directory/sources-read.fasl"
    :FASL-SHA256
    "a5fbeef46513498552a24a70b875abcaa2eb2bd59e39ad348bd6810c21c4303c")
   (:FILE "src/get-directory/read.lisp" :SOURCE-SHA256
    "a2287eb7e91bed84f3727baaf81376bbe5bf5df15cde1ea268c6d2fa66fe0a5d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/get-directory/read.fasl"
    :FASL-SHA256
    "cbcd374b6aa726c02d26a090b55784401628550f4a5e0858f465dad6334b9b0d")
   (:FILE "src/get-directory/package.lisp" :SOURCE-SHA256
    "e779202c8df502749a81d0c6f9f0d505d000e09231f3679b1a91303fbcbf36f9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/get-directory/package.fasl"
    :FASL-SHA256
    "377c589dd93838541e915a598e97bd76781cf659460b6823476d5cbf0e325ce8")
   (:FILE "src/get-directory/build.lisp" :SOURCE-SHA256
    "9bebb3cd9d66a8ec2fd0c72ad828e00ab2347093642653da45ef263bc855f947" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/get-directory/build.fasl"
    :FASL-SHA256
    "b5a504aa2b945811efb8963d3e79306da30b8f0b7d24fc2a4d52746b793f6981")
   (:FILE "src/foundation/record.lisp" :SOURCE-SHA256
    "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/foundation/record.fasl"
    :FASL-SHA256
    "478f31b02f82543977de0d5b9f629628cf64dde93234d030b1eaa2bc1c86c5cd")
   (:FILE "src/foundation/package.lisp" :SOURCE-SHA256
    "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/foundation/package.fasl"
    :FASL-SHA256
    "549883ffec47d184b9c84eda5e9fb18f6ca56ddec8bbf33d2e937cb4efda69d3")
   (:FILE "src/foundation/crc32c.lisp" :SOURCE-SHA256
    "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/foundation/crc32c.fasl"
    :FASL-SHA256
    "32c0cc01274c86f666e1442d7f7c4262baa0ecf5ebc0cc0b27d328192181120b")
   (:FILE "src/foundation/conditions.lisp" :SOURCE-SHA256
    "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/foundation/conditions.fasl"
    :FASL-SHA256
    "586f4e72fa83f9fa719d776e2d85b7fb1d059cd3fb35408c9455a7f07d6183c6")
   (:FILE "src/foundation/binary.lisp" :SOURCE-SHA256
    "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/foundation/binary.fasl"
    :FASL-SHA256
    "fcae93d175174100cc04b34912ffb0efbcf235e65ca33b093373f8049831d134")
   (:FILE "src/foundation/batch.lisp" :SOURCE-SHA256
    "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/foundation/batch.fasl"
    :FASL-SHA256
    "e3cbc3665f48e4f31781886112f01d13341483dff7762004dfe15f17120ef85f")
   (:FILE "src/execution/writer.lisp" :SOURCE-SHA256
    "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/execution/writer.fasl"
    :FASL-SHA256
    "21e7059f5f6527e5eb71bc8f689228db0e0ee24e72027f80469c556346163c45")
   (:FILE "src/execution/worker-types.lisp" :SOURCE-SHA256
    "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/execution/worker-types.fasl"
    :FASL-SHA256
    "b7cfb6b53029d53e06f4a4940f026c733011cdd5efb5dad42ccd249ca1d06dca")
   (:FILE "src/execution/worker-run.lisp" :SOURCE-SHA256
    "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/execution/worker-run.fasl"
    :FASL-SHA256
    "cbda8d45873327c897108d2a2d66450d4808cc504fe26dee0e7292e93ca38316")
   (:FILE "src/execution/worker-claim.lisp" :SOURCE-SHA256
    "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/execution/worker-claim.fasl"
    :FASL-SHA256
    "a56b4bf348b202f5b00c18923d4497977bd63e17a6065eaad4ffee86a21ad9e8")
   (:FILE "src/execution/worker-boundary.lisp" :SOURCE-SHA256
    "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/execution/worker-boundary.fasl"
    :FASL-SHA256
    "eef608f1340bd006bf62515db6cd7699f6d6cd8360f6d6a9860c79eb80ca976a")
   (:FILE "src/execution/ready.lisp" :SOURCE-SHA256
    "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/execution/ready.fasl"
    :FASL-SHA256
    "aed22c714ae9a6c0375dff5c01e6eabde524393856ddd9ed4cad17ed6de097f3")
   (:FILE "src/execution/ready-types.lisp" :SOURCE-SHA256
    "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/execution/ready-types.fasl"
    :FASL-SHA256
    "5ac46a21b028771b5e6071d91242ed44d9b4c5f9cb450c447ca5276f30c41e16")
   (:FILE "src/execution/ready-recycle.lisp" :SOURCE-SHA256
    "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/execution/ready-recycle.fasl"
    :FASL-SHA256
    "79e7ef11e07094f520fb4d7f94d9b2d9635ae491f9d06840ffe0b3b333be5439")
   (:FILE "src/execution/queue.lisp" :SOURCE-SHA256
    "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/execution/queue.fasl"
    :FASL-SHA256
    "e7097ce4a1ccc4a24b3205d94ed886076c9143a1cc44e8bda200c592d45091e5")
   (:FILE "src/execution/package.lisp" :SOURCE-SHA256
    "833e501e6ee6e3acb8a6d37139c4605a05e06c425a35318adbcf651aa2f9db30" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/execution/package.fasl"
    :FASL-SHA256
    "f6fdf0efe3033d308986f8ca50a0aab20e9a1017ad41c6aefb57e93e5dcacae1")
   (:FILE "src/execution/handoff.lisp" :SOURCE-SHA256
    "3ce9f47008416f210173fd3a83ee7665b2103f26039d36e2601b31e5e3ebd72a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/execution/handoff.fasl"
    :FASL-SHA256
    "0875ff0d7fb92010a4f47fa75d0072655921104598919709c27ed0bb63b4a3cb")
   (:FILE "src/epochs/types.lisp" :SOURCE-SHA256
    "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/epochs/types.fasl"
    :FASL-SHA256
    "1e08a862267dc72d77ac61d87a0d256ecdacdbe7e19edb28cabd412a92515816")
   (:FILE "src/epochs/retire.lisp" :SOURCE-SHA256
    "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/epochs/retire.fasl"
    :FASL-SHA256
    "31e4a52fd01f973a1a7bb74c7e761b7e9b0107ed992151076aa1523cd4c45be9")
   (:FILE "src/epochs/reclaim.lisp" :SOURCE-SHA256
    "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/epochs/reclaim.fasl"
    :FASL-SHA256
    "1bc44ce71882cd47c46a0b8e0ccbf77ca464ea2414cb8278c277d42280a47c0a")
   (:FILE "src/epochs/read.lisp" :SOURCE-SHA256
    "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/epochs/read.fasl"
    :FASL-SHA256
    "2abe7ea310823df4a98cdfb5bdf57b40c2ae07c48b667428689d76ecf7569ea4")
   (:FILE "src/epochs/package.lisp" :SOURCE-SHA256
    "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/epochs/package.fasl"
    :FASL-SHA256
    "3d512c171a955d62bc98ffc0a5b26c06bd40713230c3e032313de817e73498a5")
   (:FILE "src/epochs/core.lisp" :SOURCE-SHA256
    "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/epochs/core.fasl"
    :FASL-SHA256
    "cbcb168b86e6056b13c1b2661dd6dd5cf852afab57239206b20ef193585e1026")
   (:FILE "src/dispatch/types.lisp" :SOURCE-SHA256
    "cc44882c565a89de08f5add79333868ebfca4fc3f97bf9104d36375d014d4720" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/dispatch/types.fasl"
    :FASL-SHA256
    "fb05d887f767b51e19018d16411c793881e0cb544a9be8ff3ba1d57a35acb58c")
   (:FILE "src/dispatch/package.lisp" :SOURCE-SHA256
    "acb5fd19599e89e821a89bcca8f94064f33cdc71cdfcf204aadcd4fb52dd795f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/dispatch/package.fasl"
    :FASL-SHA256
    "ff62493d3ec148e162c73f3cc90de5bd719a5754842b51c82f643fb116c945f3")
   (:FILE "src/dispatch/claim.lisp" :SOURCE-SHA256
    "224e4114b8b91affced874bea9c23cae5c79526e8ddae62e31a0cafcbb763682" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/dispatch/claim.fasl"
    :FASL-SHA256
    "1a90b18439579358f5796eadffe19a927a4cd4ec7c38b61fe33b4fe0775a435b")
   (:FILE "src/dispatch/build.lisp" :SOURCE-SHA256
    "c78d31a753db78baea520e9ea0cccf6e88cad9cca8bc75261a6ff26c2ac01fe5" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/dispatch/build.fasl"
    :FASL-SHA256
    "7241733f2f459e7bb7cfd762b7113eaa7511b834583f1f764c6cad95411154a9")
   (:FILE "src/csn/registry.lisp" :SOURCE-SHA256
    "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/csn/registry.fasl"
    :FASL-SHA256
    "609f69ca20fa35b830cd9fddc8b39e4aa9f4d5a2c7631508805acfa152567532")
   (:FILE "src/csn/package.lisp" :SOURCE-SHA256
    "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/csn/package.fasl"
    :FASL-SHA256
    "5394fc2a3c147c87344cf4dff7521a52a627d31d29cc848598e6d2c86eb41a42")
   (:FILE "src/control/types.lisp" :SOURCE-SHA256
    "ad2f45bcd44fed463d60b580a17d89192a1087177573b1633674ed68d252367d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/control/types.fasl"
    :FASL-SHA256
    "6df452f60bc9f603cb437e35acc91f27be0ebcfe94c0d7aed2b34842d53280fc")
   (:FILE "src/control/transfer.lisp" :SOURCE-SHA256
    "6e257bfb6ce8e6d11263cc6788de4fc35657a82e159af7b46341c3bb208e0275" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/control/transfer.fasl"
    :FASL-SHA256
    "2e7f06043dddf3215220da8f50ee2883b521cdb4284c87d91296989083a66390")
   (:FILE "src/control/publication.lisp" :SOURCE-SHA256
    "3f867f54309b0a2985660dd8145b100eb097c1d7fdfcd917c61d73d082009109" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/control/publication.fasl"
    :FASL-SHA256
    "498d4d31c4bb3af2a14458cdec0fffc7c02bd69545ff35eaff3f1f473c4d143f")
   (:FILE "src/control/publication-read.lisp" :SOURCE-SHA256
    "cfb12232748e62d1edef6896389e8d54057951c058ee43d70dd346b10c5f582e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/control/publication-read.fasl"
    :FASL-SHA256
    "7805ac303e23075da2c6b500397adc8fbb3458b1e8338e2376d4262e392049aa")
   (:FILE "src/control/prepare.lisp" :SOURCE-SHA256
    "1226996af2215e3ebf06265e48d43632a1642ccacd312fabd983c5f3bfa7536d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/control/prepare.fasl"
    :FASL-SHA256
    "e45f1f89b2116eb433cd024b456a775fa45334f413d5d302e3de108631ce8ba8")
   (:FILE "src/control/preflight.lisp" :SOURCE-SHA256
    "48326533ac0934cb3b1e3fc7657ef48f38912b6c08e9e38367301905f7711584" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/control/preflight.fasl"
    :FASL-SHA256
    "2bc318eea7c9172494c9230bf8b0afe7612a4582347df8a1b35daa87a2099ab7")
   (:FILE "src/control/package.lisp" :SOURCE-SHA256
    "c6ca23c7b0a8cea48bec2b7017482802f2078b0d58414c6708fbfe5f7d46377d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/control/package.fasl"
    :FASL-SHA256
    "3a8e66287fd05386552f99cf798e20555094c68c218e2c5e2c3edf912e015e6d")
   (:FILE "src/control/dependency.lisp" :SOURCE-SHA256
    "f328344e4824fd53d03a0476b45fb87efada43ddee895e13afd76ac44413d128" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/control/dependency.fasl"
    :FASL-SHA256
    "b658136f9ce64c06e59d3ac52972a442ebbec350bdd854563819830217549822")
   (:FILE "src/control/build.lisp" :SOURCE-SHA256
    "1904e81a6cebbb178598a41e1b2283240fc21506781b1e31da407610ce0f519c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/control/build.fasl"
    :FASL-SHA256
    "87ad993d02f5db5c9971cba1a175d2b1b6d4a5dc75f2bb4d36847a33ab84ad07")
   (:FILE "src/codec/utf8.lisp" :SOURCE-SHA256
    "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/codec/utf8.fasl"
    :FASL-SHA256
    "c1f04e390d4ad3deedabc6fd0b1823f7cf2fecd5e12e590f5e6368efed518182")
   (:FILE "src/codec/package.lisp" :SOURCE-SHA256
    "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/codec/package.fasl"
    :FASL-SHA256
    "334c3b42e2716ed53ce62875d4d1023b19785b77f571f4c97d94dfc8f991a04b")
   (:FILE "src/codec/cbor-write.lisp" :SOURCE-SHA256
    "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/codec/cbor-write.fasl"
    :FASL-SHA256
    "e003118167a6805ecfde2aacdabe1124bfee4a59f4398cca560913234b1409b4")
   (:FILE "src/codec/cbor-string-write.lisp" :SOURCE-SHA256
    "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/codec/cbor-string-write.fasl"
    :FASL-SHA256
    "97c922ee3ba7ea617c59c6ee6d2f216a05293b6a61701242b9a6a1dba557e95d")
   (:FILE "src/codec/cbor-space.lisp" :SOURCE-SHA256
    "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/codec/cbor-space.fasl"
    :FASL-SHA256
    "0407f8d2f602a91977b87ddd6e260c1f19f6c5e129539e837b2941c1994f0ba2")
   (:FILE "src/codec/cbor-simple-write.lisp" :SOURCE-SHA256
    "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/codec/cbor-simple-write.fasl"
    :FASL-SHA256
    "264f8bf4a3bddab4d1a92e772f38df3cef293fdd330a92e165d3fe97eef5cd17")
   (:FILE "src/codec/cbor-scan.lisp" :SOURCE-SHA256
    "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/codec/cbor-scan.fasl"
    :FASL-SHA256
    "c817f6743580f0b07162aacb1c2f86319091bb881018735639956d0bc395e322")
   (:FILE "src/codec/cbor-scan-stack.lisp" :SOURCE-SHA256
    "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/codec/cbor-scan-stack.fasl"
    :FASL-SHA256
    "5eb03357e87f504ee18dd5cfa0d2ac234cfefb0e661b3c62a64fc5146474f776")
   (:FILE "src/codec/cbor-scan-minimal.lisp" :SOURCE-SHA256
    "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/codec/cbor-scan-minimal.fasl"
    :FASL-SHA256
    "03d61eab5d370375449477d5b166d4e6e344afe266970ec744060f9271602f32")
   (:FILE "src/codec/cbor-scan-items.lisp" :SOURCE-SHA256
    "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/codec/cbor-scan-items.fasl"
    :FASL-SHA256
    "49bd3f139f94ff5c4c6c725250496370a85134434bcc234cf31d2b02beed82b9")
   (:FILE "src/codec/cbor-scan-input.lisp" :SOURCE-SHA256
    "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/codec/cbor-scan-input.fasl"
    :FASL-SHA256
    "df128ae62ecc335831f116593e0f7ebb13109f917302f0ff705e59d2189fb06c")
   (:FILE "src/codec/cbor-package.lisp" :SOURCE-SHA256
    "f74f5d1cb0b71658aaeb36518530c2396d132a783cb58109788e434691acb503" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/codec/cbor-package.fasl"
    :FASL-SHA256
    "bed5ce903ae82ac073a318a73d5b1d2c7a024232a930b44c6c7796abeddf27a4")
   (:FILE "src/codec/cbor-minimal.lisp" :SOURCE-SHA256
    "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/codec/cbor-minimal.fasl"
    :FASL-SHA256
    "71111468132f6c6f065e0ca93f427393a44d5a6a26a37691c1cfcba35e4b1a6d")
   (:FILE "src/codec/cbor-header.lisp" :SOURCE-SHA256
    "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/codec/cbor-header.fasl"
    :FASL-SHA256
    "f6b055674b5a7a506d5c7852bca1c4da8e6ea49fde08f06f72280044c1eaddb3")
   (:FILE "src/codec/cbor-float-write.lisp" :SOURCE-SHA256
    "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/codec/cbor-float-write.fasl"
    :FASL-SHA256
    "a8795d8e043158a3e7cecf38ca314ec54eb12e79293a915ec663e5c36bb26832")
   (:FILE "src/codec/cbor-float-narrow.lisp" :SOURCE-SHA256
    "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/codec/cbor-float-narrow.fasl"
    :FASL-SHA256
    "c5b83d70de5f52944672c8763b96298a19ea6d58c1a1759fe13a6737e0500aee")
   (:FILE "src/codec/cbor-float-minimal.lisp" :SOURCE-SHA256
    "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/codec/cbor-float-minimal.fasl"
    :FASL-SHA256
    "243faf55b9054f8676adb2528f3c60429d3de93c39db39be8b7849e56ddd5524")
   (:FILE "src/codec/cbor-array-write.lisp" :SOURCE-SHA256
    "2f71d857991f32aacf6c7a0ecbe5e06bcba9289b20f46e496b3e3737ce6c242b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/codec/cbor-array-write.fasl"
    :FASL-SHA256
    "71ed92124507a03152b3764d494eb616545cac2e2c8720859d372de099c3d2c5")
   (:FILE "src/codec/cbor-array-input.lisp" :SOURCE-SHA256
    "e36efda9d66f532b8221f898a078b7f77dc2a41cdc953ece0b2e08b4ed2417f4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/codec/cbor-array-input.fasl"
    :FASL-SHA256
    "d72d288904bbda51b78d5b29044f2088c9e3569637b87da871a53c2e8998fa82")
   (:FILE "src/cache/write.lisp" :SOURCE-SHA256
    "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/cache/write.fasl"
    :FASL-SHA256
    "43e6098eae3c90de5169413dd5c06d7316363da9865b75facc22b347630872bd")
   (:FILE "src/cache/types.lisp" :SOURCE-SHA256
    "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/cache/types.fasl"
    :FASL-SHA256
    "f347132249a41268069ffb03b4a5019d4001c506288a42f795a4415d16ce92a8")
   (:FILE "src/cache/read.lisp" :SOURCE-SHA256
    "5700e43ae8ee859e96bdecb5953af43a712fd9e6ec23a53565759676bb07f85a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/cache/read.fasl"
    :FASL-SHA256
    "76969a8078663232733fcd1cbfb4bff00517d6fe9ee8a638ef004d7cf043a73e")
   (:FILE "src/cache/package.lisp" :SOURCE-SHA256
    "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/cache/package.fasl"
    :FASL-SHA256
    "9fa0615a0942498764dd7be30a47dd37fc00efc0fe3e0a6890499eb3ef35b311")
   (:FILE "src/cache/core.lisp" :SOURCE-SHA256
    "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/cache/core.fasl"
    :FASL-SHA256
    "aec2560f9622c519dbb0cbbbd28a587f6811c6d97331341c85230c875ce35fa6")
   (:FILE "src/cache/clock.lisp" :SOURCE-SHA256
    "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/cache/clock.fasl"
    :FASL-SHA256
    "0a39ff8090d557836db02e7ccbe3c7f433d5c91b93c0433726f78d475f4bd05b")
   (:FILE "src/cache/build.lisp" :SOURCE-SHA256
    "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/cache/build.fasl"
    :FASL-SHA256
    "b0a831c7a138cf2d801bbada5e56a908a1ffd8336cbfd4ec1100d13acade91d1")
   (:FILE "src/active/types.lisp" :SOURCE-SHA256
    "48fe584096fc253ef182ab428c1887e443af06d75aaa938df660c77e60b39bfb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/active/types.fasl"
    :FASL-SHA256
    "b978625893c771d02c6583c919228a7116061b517077f94f23822ab5b2b0e8cc")
   (:FILE "src/active/source.lisp" :SOURCE-SHA256
    "ff96fe360b46190ecc08ee9e05a813715dc3399054f93693f9309012aec6547d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/active/source.fasl"
    :FASL-SHA256
    "02612413992dd4051e0f1079333e326237971508754fb92abe64b1213c147e56")
   (:FILE "src/active/prepare.lisp" :SOURCE-SHA256
    "7b45fb01132c45c9bec76f374edaa8de91ac6bb2d61ae5c359e1fa10c6346f53" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/active/prepare.fasl"
    :FASL-SHA256
    "a2c96366a87173b4b7433fda6aa7e52b05c01aae26a3c6d3b56d105725fd17ce")
   (:FILE "src/active/preflight.lisp" :SOURCE-SHA256
    "ef7b592daecc223d78cbcda138b5938abc01593b486482bec06f2721cfd955a2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/active/preflight.fasl"
    :FASL-SHA256
    "a56a2e1b01a4eafccdca27e3932b9faa72a658bf6c0c246631d32bd80af1b2c4")
   (:FILE "src/active/package.lisp" :SOURCE-SHA256
    "4a6fa4187ef5d44aec4e65d57ee6d6046485f283cc9009c1d94263bee745fa3b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/baseline/fasl/src/active/package.fasl"
    :FASL-SHA256
    "def4d930384476a12203cd8f77b4738d400bc312e57e45bef8b82cb793021207"))
  :LOADED-SOURCE-FILES
  ("src/active/package.lisp" "src/active/preflight.lisp"
   "src/active/prepare.lisp" "src/active/source.lisp" "src/active/types.lisp"
   "src/cache/build.lisp" "src/cache/clock.lisp" "src/cache/core.lisp"
   "src/cache/package.lisp" "src/cache/read.lisp" "src/cache/types.lisp"
   "src/cache/write.lisp" "src/codec/cbor-array-input.lisp"
   "src/codec/cbor-array-write.lisp" "src/codec/cbor-float-minimal.lisp"
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
   "src/control/publication-read.lisp" "src/control/publication.lisp"
   "src/control/transfer.lisp" "src/control/types.lisp" "src/csn/package.lisp"
   "src/csn/registry.lisp" "src/dispatch/build.lisp" "src/dispatch/claim.lisp"
   "src/dispatch/package.lisp" "src/dispatch/types.lisp" "src/epochs/core.lisp"
   "src/epochs/package.lisp" "src/epochs/read.lisp" "src/epochs/reclaim.lisp"
   "src/epochs/retire.lisp" "src/epochs/types.lisp"
   "src/execution/handoff.lisp" "src/execution/package.lisp"
   "src/execution/queue.lisp" "src/execution/ready-recycle.lisp"
   "src/execution/ready-types.lisp" "src/execution/ready.lisp"
   "src/execution/worker-boundary.lisp" "src/execution/worker-claim.lisp"
   "src/execution/worker-run.lisp" "src/execution/worker-types.lisp"
   "src/execution/writer.lisp" "src/foundation/batch.lisp"
   "src/foundation/binary.lisp" "src/foundation/conditions.lisp"
   "src/foundation/crc32c.lisp" "src/foundation/package.lisp"
   "src/foundation/record.lisp" "src/get-directory/build.lisp"
   "src/get-directory/package.lisp" "src/get-directory/read.lisp"
   "src/get-directory/sources-read.lisp" "src/get-directory/sources-types.lisp"
   "src/get-directory/types.lisp" "src/get-resolver/active-build.lisp"
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
   "src/io/namespace.lisp" "src/io/native-namespace.lisp" "src/io/native.lisp"
   "src/io/package.lisp" "src/io/rename.lisp" "src/io/transfer.lisp"
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
   "src/scheduler/pool-claim.lisp" "src/scheduler/read.lisp"
   "src/scheduler/types.lisp" "src/scheduler/update.lisp"
   "src/series/events.lisp" "src/series/io-events.lisp"
   "src/series/ownership.lisp" "src/series/package.lisp"
   "src/series/publication.lisp" "src/series/query.lisp"
   "src/series/retirement.lisp" "src/series/routing-build.lisp"
   "src/series/routing-select.lisp" "src/series/routing-types.lisp"
   "src/series/types.lisp" "src/series/worker-boundary.lisp"
   "src/series/worker-package.lisp" "src/series/worker-run.lisp"
   "src/series/worker-types.lisp" "src/storage/compaction-scan.lisp"
   "src/storage/control-payload.lisp" "src/storage/formats.lisp"
   "src/storage/log-header.lisp" "src/storage/package.lisp"
   "src/storage/payload-record.lisp" "src/storage/payload-write.lisp"
   "src/storage/segment-header.lisp" "src/wal/builder.lisp" "src/wal/csn.lisp"
   "src/wal/executor.lisp" "src/wal/group.lisp" "src/wal/package.lisp"
   "src/wal/types.lisp" "tests/codec/cbor-array-write-support.lisp"
   "tests/codec/cbor-array-write-threads.lisp"
   "tests/codec/cbor-array-write.lisp"
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
   "tests/get-active/construction.lisp" "tests/get-active/directory.lisp"
   "tests/get-active/preflight.lisp" "tests/get-active/read.lisp"
   "tests/get-active/support.lisp" "tests/get-directory/construction.lisp"
   "tests/get-directory/read.lisp" "tests/get-directory/series-read.lisp"
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
   "tests/io/native.lisp" "tests/io/rename-native.lisp" "tests/io/rename.lisp"
   "tests/io/support.lisp" "tests/io/transfer.lisp" "tests/mvcc/capture.lisp"
   "tests/mvcc/lifecycle.lisp" "tests/mvcc/support.lisp"
   "tests/read/lifecycle.lisp" "tests/read/support.lisp"
   "tests/read/threads.lisp" "tests/recovery/corruption.lisp"
   "tests/recovery/decisions-audit.lisp" "tests/recovery/decisions-radix.lisp"
   "tests/recovery/decisions-support.lisp" "tests/recovery/decisions.lisp"
   "tests/recovery/inventory-support.lisp" "tests/recovery/inventory.lisp"
   "tests/recovery/manifest-audit.lisp" "tests/recovery/manifest-support.lisp"
   "tests/recovery/manifest.lisp" "tests/recovery/scan.lisp"
   "tests/recovery/support.lisp" "tests/scheduler/controller.lisp"
   "tests/scheduler/dispatch.lisp" "tests/scheduler/lifecycle.lisp"
   "tests/scheduler/pool-claim.lisp" "tests/scheduler/support.lisp"
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
    "4654aa66e1c48d2ee1768bee076344f8e24ce0f3e04a9ee9ba3d3599b03e0dc1")
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
   (:FILE "src/codec/cbor-array-input.lisp" :SHA256
    "e36efda9d66f532b8221f898a078b7f77dc2a41cdc953ece0b2e08b4ed2417f4")
   (:FILE "src/codec/cbor-array-write.lisp" :SHA256
    "2f71d857991f32aacf6c7a0ecbe5e06bcba9289b20f46e496b3e3737ce6c242b")
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
    "f74f5d1cb0b71658aaeb36518530c2396d132a783cb58109788e434691acb503")
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
    "c6ca23c7b0a8cea48bec2b7017482802f2078b0d58414c6708fbfe5f7d46377d")
   (:FILE "src/control/preflight.lisp" :SHA256
    "48326533ac0934cb3b1e3fc7657ef48f38912b6c08e9e38367301905f7711584")
   (:FILE "src/control/prepare.lisp" :SHA256
    "1226996af2215e3ebf06265e48d43632a1642ccacd312fabd983c5f3bfa7536d")
   (:FILE "src/control/publication-read.lisp" :SHA256
    "cfb12232748e62d1edef6896389e8d54057951c058ee43d70dd346b10c5f582e")
   (:FILE "src/control/publication.lisp" :SHA256
    "3f867f54309b0a2985660dd8145b100eb097c1d7fdfcd917c61d73d082009109")
   (:FILE "src/control/transfer.lisp" :SHA256
    "6e257bfb6ce8e6d11263cc6788de4fc35657a82e159af7b46341c3bb208e0275")
   (:FILE "src/control/types.lisp" :SHA256
    "ad2f45bcd44fed463d60b580a17d89192a1087177573b1633674ed68d252367d")
   (:FILE "src/csn/package.lisp" :SHA256
    "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0")
   (:FILE "src/csn/registry.lisp" :SHA256
    "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a")
   (:FILE "src/dispatch/build.lisp" :SHA256
    "c78d31a753db78baea520e9ea0cccf6e88cad9cca8bc75261a6ff26c2ac01fe5")
   (:FILE "src/dispatch/claim.lisp" :SHA256
    "224e4114b8b91affced874bea9c23cae5c79526e8ddae62e31a0cafcbb763682")
   (:FILE "src/dispatch/package.lisp" :SHA256
    "acb5fd19599e89e821a89bcca8f94064f33cdc71cdfcf204aadcd4fb52dd795f")
   (:FILE "src/dispatch/types.lisp" :SHA256
    "cc44882c565a89de08f5add79333868ebfca4fc3f97bf9104d36375d014d4720")
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
    "88e72ad54b8c8048358cbca2d136c62883d8e700d63d92e807cb14df0082ae6a")
   (:FILE "src/io/namespace.lisp" :SHA256
    "f23b46209fa87bee4deee84dbe3d87bc7a20d0a4f98bdafe7d40391fc42e1b59")
   (:FILE "src/io/native-namespace.lisp" :SHA256
    "3a7ada1ffe09c94714629a3679bf26a56bd5570ff3bf06acbce4be83750a47ad")
   (:FILE "src/io/native.lisp" :SHA256
    "74f63dbb2137a344054e82c6707e6262473b3332ff66a85f79ecfee9fd50f9b4")
   (:FILE "src/io/package.lisp" :SHA256
    "605f51109d723267b326c012602a91e7deff984a040c3440d90665b853e3549c")
   (:FILE "src/io/rename.lisp" :SHA256
    "ef9475701a2da4a44d98f9c88a1f547f3be1f07c649c8c3c956c206c80a55598")
   (:FILE "src/io/transfer.lisp" :SHA256
    "c807f294d0211e8433f8f0332ab6ba3ce7d9ae7de3818f43af7ff8d7fcfd341a")
   (:FILE "src/io/types.lisp" :SHA256
    "68df36ae5167c975261f99d63a6598bca1fe93caca02f39e18812e94fcf1b233")
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
    "a44fd2c3d435e1f6729bf861b6caeb54a184f31c92e7909aad9c18b491f03cdf")
   (:FILE "src/scheduler/policy.lisp" :SHA256
    "92b3ca3a81ae0b3ac342a63e5fe5c5d7524091a63065b0232c14c57ee80c4aac")
   (:FILE "src/scheduler/pool-claim.lisp" :SHA256
    "e384f6091a5fcb506e718e12e77b06ab8dd4233a41024bc57ca3b14425e10b14")
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
   (:FILE "tests/codec/cbor-array-write-support.lisp" :SHA256
    "42a59239bec468dea130b87733a077874a5d9e83ff0f491b20312315bc27ee95")
   (:FILE "tests/codec/cbor-array-write-threads.lisp" :SHA256
    "6be0614da2bafdafe2d853fa7845fb913dbf0cd2673771c2c4b0cca277986e35")
   (:FILE "tests/codec/cbor-array-write.lisp" :SHA256
    "9ed6a20ab5ae2db33ef419986c8ee963898894ce239059eae7866d503fe48098")
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
   (:FILE "tests/get-active/construction.lisp" :SHA256
    "31a21762f3c16950e4b6c0ce48a6ab235d2483476d03d4072d63905f7dd13deb")
   (:FILE "tests/get-active/directory.lisp" :SHA256
    "ea6754ab84b53a4be1722985600e280fde6f73da4ea7eb843e99d66989df6fdf")
   (:FILE "tests/get-active/preflight.lisp" :SHA256
    "c65ef56f5f7498d4355e6a1f640969e3e31724fab9b84b5c3247e4e9d37626e3")
   (:FILE "tests/get-active/read.lisp" :SHA256
    "ef1a15c742518b52bdbeecac6b838b0789b73d631f765a30fd016748769a72e6")
   (:FILE "tests/get-active/support.lisp" :SHA256
    "34c73b5323272a24fc01c132133d3cc74be7c00fa7ddd4ad08b8146bb42d589f")
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
   (:FILE "tests/io/rename-native.lisp" :SHA256
    "b1f43b09af8f4253ce22a4793f9267c7d60df69339a3fc51b9fd83b6a331bce5")
   (:FILE "tests/io/rename.lisp" :SHA256
    "cd14164b36977d927f7e4cf4d70d2068661c47f538228957102a4347a853fa59")
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
   (:FILE "tests/scheduler/dispatch.lisp" :SHA256
    "600eb0b5fdf9a52d020e2f4c638f0f3dba43d9d9711be73eaffff208578821eb")
   (:FILE "tests/scheduler/lifecycle.lisp" :SHA256
    "eff59c0cf6d9c6c1ddec57a4efa26a8fcaeedc850b77764b818bc1c22eb73e38")
   (:FILE "tests/scheduler/pool-claim.lisp" :SHA256
    "f968d57b6ff4dfc3cc31f1b1979afa896d95435093406b36320800783629901f")
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
    "7ebbcbfa8da95a0cdeae81bbbdaf869f19999063a5f283c40b22d1ae81420964")
   (:FILE "tools/evidence-storage.lisp" :SHA256
    "8f287772a41b1ebe0e7b3ecc3826a4148082efed428a9749655977e62a9c15a6"))
  :CONFIG-SHA256
  "729a009727e67e08fec5c72daabad19bc07f0d35f8883b93b0a79bb707e44454"
  :SOURCE-MANIFEST-BEFORE
  ((:FILE "arcdocdb.asd" :SHA256
    "4654aa66e1c48d2ee1768bee076344f8e24ce0f3e04a9ee9ba3d3599b03e0dc1")
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
   (:FILE "src/codec/cbor-array-input.lisp" :SHA256
    "e36efda9d66f532b8221f898a078b7f77dc2a41cdc953ece0b2e08b4ed2417f4")
   (:FILE "src/codec/cbor-array-write.lisp" :SHA256
    "2f71d857991f32aacf6c7a0ecbe5e06bcba9289b20f46e496b3e3737ce6c242b")
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
    "f74f5d1cb0b71658aaeb36518530c2396d132a783cb58109788e434691acb503")
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
    "c6ca23c7b0a8cea48bec2b7017482802f2078b0d58414c6708fbfe5f7d46377d")
   (:FILE "src/control/preflight.lisp" :SHA256
    "48326533ac0934cb3b1e3fc7657ef48f38912b6c08e9e38367301905f7711584")
   (:FILE "src/control/prepare.lisp" :SHA256
    "1226996af2215e3ebf06265e48d43632a1642ccacd312fabd983c5f3bfa7536d")
   (:FILE "src/control/publication-read.lisp" :SHA256
    "cfb12232748e62d1edef6896389e8d54057951c058ee43d70dd346b10c5f582e")
   (:FILE "src/control/publication.lisp" :SHA256
    "3f867f54309b0a2985660dd8145b100eb097c1d7fdfcd917c61d73d082009109")
   (:FILE "src/control/transfer.lisp" :SHA256
    "6e257bfb6ce8e6d11263cc6788de4fc35657a82e159af7b46341c3bb208e0275")
   (:FILE "src/control/types.lisp" :SHA256
    "ad2f45bcd44fed463d60b580a17d89192a1087177573b1633674ed68d252367d")
   (:FILE "src/csn/package.lisp" :SHA256
    "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0")
   (:FILE "src/csn/registry.lisp" :SHA256
    "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a")
   (:FILE "src/dispatch/build.lisp" :SHA256
    "c78d31a753db78baea520e9ea0cccf6e88cad9cca8bc75261a6ff26c2ac01fe5")
   (:FILE "src/dispatch/claim.lisp" :SHA256
    "224e4114b8b91affced874bea9c23cae5c79526e8ddae62e31a0cafcbb763682")
   (:FILE "src/dispatch/package.lisp" :SHA256
    "acb5fd19599e89e821a89bcca8f94064f33cdc71cdfcf204aadcd4fb52dd795f")
   (:FILE "src/dispatch/types.lisp" :SHA256
    "cc44882c565a89de08f5add79333868ebfca4fc3f97bf9104d36375d014d4720")
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
    "88e72ad54b8c8048358cbca2d136c62883d8e700d63d92e807cb14df0082ae6a")
   (:FILE "src/io/namespace.lisp" :SHA256
    "f23b46209fa87bee4deee84dbe3d87bc7a20d0a4f98bdafe7d40391fc42e1b59")
   (:FILE "src/io/native-namespace.lisp" :SHA256
    "3a7ada1ffe09c94714629a3679bf26a56bd5570ff3bf06acbce4be83750a47ad")
   (:FILE "src/io/native.lisp" :SHA256
    "74f63dbb2137a344054e82c6707e6262473b3332ff66a85f79ecfee9fd50f9b4")
   (:FILE "src/io/package.lisp" :SHA256
    "605f51109d723267b326c012602a91e7deff984a040c3440d90665b853e3549c")
   (:FILE "src/io/rename.lisp" :SHA256
    "ef9475701a2da4a44d98f9c88a1f547f3be1f07c649c8c3c956c206c80a55598")
   (:FILE "src/io/transfer.lisp" :SHA256
    "c807f294d0211e8433f8f0332ab6ba3ce7d9ae7de3818f43af7ff8d7fcfd341a")
   (:FILE "src/io/types.lisp" :SHA256
    "68df36ae5167c975261f99d63a6598bca1fe93caca02f39e18812e94fcf1b233")
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
    "a44fd2c3d435e1f6729bf861b6caeb54a184f31c92e7909aad9c18b491f03cdf")
   (:FILE "src/scheduler/policy.lisp" :SHA256
    "92b3ca3a81ae0b3ac342a63e5fe5c5d7524091a63065b0232c14c57ee80c4aac")
   (:FILE "src/scheduler/pool-claim.lisp" :SHA256
    "e384f6091a5fcb506e718e12e77b06ab8dd4233a41024bc57ca3b14425e10b14")
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
   (:FILE "tests/codec/cbor-array-write-support.lisp" :SHA256
    "42a59239bec468dea130b87733a077874a5d9e83ff0f491b20312315bc27ee95")
   (:FILE "tests/codec/cbor-array-write-threads.lisp" :SHA256
    "6be0614da2bafdafe2d853fa7845fb913dbf0cd2673771c2c4b0cca277986e35")
   (:FILE "tests/codec/cbor-array-write.lisp" :SHA256
    "9ed6a20ab5ae2db33ef419986c8ee963898894ce239059eae7866d503fe48098")
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
   (:FILE "tests/get-active/construction.lisp" :SHA256
    "31a21762f3c16950e4b6c0ce48a6ab235d2483476d03d4072d63905f7dd13deb")
   (:FILE "tests/get-active/directory.lisp" :SHA256
    "ea6754ab84b53a4be1722985600e280fde6f73da4ea7eb843e99d66989df6fdf")
   (:FILE "tests/get-active/preflight.lisp" :SHA256
    "c65ef56f5f7498d4355e6a1f640969e3e31724fab9b84b5c3247e4e9d37626e3")
   (:FILE "tests/get-active/read.lisp" :SHA256
    "ef1a15c742518b52bdbeecac6b838b0789b73d631f765a30fd016748769a72e6")
   (:FILE "tests/get-active/support.lisp" :SHA256
    "34c73b5323272a24fc01c132133d3cc74be7c00fa7ddd4ad08b8146bb42d589f")
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
   (:FILE "tests/io/rename-native.lisp" :SHA256
    "b1f43b09af8f4253ce22a4793f9267c7d60df69339a3fc51b9fd83b6a331bce5")
   (:FILE "tests/io/rename.lisp" :SHA256
    "cd14164b36977d927f7e4cf4d70d2068661c47f538228957102a4347a853fa59")
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
   (:FILE "tests/scheduler/dispatch.lisp" :SHA256
    "600eb0b5fdf9a52d020e2f4c638f0f3dba43d9d9711be73eaffff208578821eb")
   (:FILE "tests/scheduler/lifecycle.lisp" :SHA256
    "eff59c0cf6d9c6c1ddec57a4efa26a8fcaeedc850b77764b818bc1c22eb73e38")
   (:FILE "tests/scheduler/pool-claim.lisp" :SHA256
    "f968d57b6ff4dfc3cc31f1b1979afa896d95435093406b36320800783629901f")
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
    "7ebbcbfa8da95a0cdeae81bbbdaf869f19999063a5f283c40b22d1ae81420964")
   (:FILE "tools/evidence-storage.lisp" :SHA256
    "8f287772a41b1ebe0e7b3ecc3826a4148082efed428a9749655977e62a9c15a6")))
 :EXIT-CODE 0 :SIGNAL NIL)
