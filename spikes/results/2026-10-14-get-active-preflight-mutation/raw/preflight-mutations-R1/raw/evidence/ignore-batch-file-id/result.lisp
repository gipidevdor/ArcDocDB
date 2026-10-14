(:DEADLINE-SECONDS 120 :ARGV
 ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--disable-debugger"
  "--script"
  "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/evidence/ignore-batch-file-id/driver.lisp"
  "--child"
  "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/evidence/ignore-batch-file-id/config.lisp")
 :EXECUTED-TESTS
 (("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-WAL-005-ACTIVE-PREFLIGHT-BATCH-FILE-ID"))
 :SUITE-TESTS
 (("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-FOR-001-ACTIVE-SOURCE-CONFIGURATION-IDENTITY-AND-FD")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-FOR-003-ACTIVE-NATIVE-V1-V2-PUT-AND-TOMBSTONE")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-IDX-001-ACTIVE-TOMBSTONE-PAGE-ZERO-PUTS")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-WAL-005-ACTIVE-PREFLIGHT-IMMUTABLE-NO-CSN-OR-IO")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-AFF-008-ACTIVE-FIRST-PAYLOAD-EXACT-ONE-SHORT")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-AFF-008-ACTIVE-SECOND-PAYLOAD-PEAK-EXACT-ONE-SHORT")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-AFF-008-ACTIVE-PAGE-BUDGET-EXACT-REFUSES-NEXT")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-AFF-008-ACTIVE-PUT-BUDGET-EXACT-REFUSES-NEXT")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-AFF-008-ACTIVE-RECORD-BYTE-BUDGETS-EXACT-ONE-SHORT")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-FOR-004-ACTIVE-PREPARED-OUTCOME-REFUSED-BEFORE-CSN")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-CON-004-ACTIVE-ROOTS-PERSIST-AFTER-PUBLIC-BATCH-REUSE")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-AFF-001-ACTIVE-SEALED-CRC-FAULTS-ARCHIVE-PRESERVES-CAUSE")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-WAL-005-ACTIVE-PREFLIGHT-BATCH-FILE-ID")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-WAL-005-ACTIVE-PREFLIGHT-BATCH-VERSION")
  ("ARCDOCDB.GET.ACTIVE.TESTS" "TEST-REQ-WAL-005-ACTIVE-PREFLIGHT-EMPTY-OPEN")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-WAL-005-ACTIVE-PREFLIGHT-OPEN-TOKEN-BOUND")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-WAL-005-ACTIVE-PREFLIGHT-SEALED-REFUSED-WITH-TOKEN-PRESERVED")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-WAL-005-ACTIVE-PREFLIGHT-PREVIOUS-ORDER")
  ("ARCDOCDB.GET.ACTIVE.TESTS" "TEST-REQ-AFF-008-ACTIVE-PREFLIGHT-RING-FULL")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-AFF-008-ACTIVE-PREFLIGHT-EVENT-GENERATION-BOUND")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-WAL-005-ACTIVE-PREFLIGHT-CONTIGUOUS-OFFSET")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-AFF-008-ACTIVE-PREFLIGHT-SEGMENT-SPACE")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-AFF-008-ACTIVE-PREFLIGHT-RECORD-BOUNDARY")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-AFF-008-ACTIVE-PREFLIGHT-SEAL-BYTE-BOUNDARY")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-AFF-001-ACTIVE-PREFLIGHT-HEADER-CORRUPTION-FAULTS-ARCHIVE")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-AFF-001-ACTIVE-PREFLIGHT-OPEN-COUNT-FAULTS-ARCHIVE")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-IDX-001-ACTIVE-DIRECTORY-NIBBLE-TRANSITIONS-PERSISTENT")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-IDX-001-ACTIVE-DIRECTORY-65536-FINAL-CONVERGENCE")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-IDX-001-ACTIVE-DIRECTORY-MALFORMED-LOCAL-GUARDS")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-IDX-001-ACTIVE-DIRECTORY-OCCUPIED-APPEND-PRESERVES-GRAPH")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-FOR-003-ACTIVE-NATIVE-V1-V2-CSN-U64-AND-ORDINARY-FLAGS")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-CCH-002-ACTIVE-COLD-READ-AND-WARM-PROBE-AND-READ")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-WAL-006-ACTIVE-DURABLE-PLANNED-ROOT-CANNOT-AUTHORIZE-VALUE")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-WAL-006-ACTIVE-OLD-PUT-USES-OWN-PAGE-END")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-IDX-001-ACTIVE-HEADER-SEAL-TOMBSTONE-FRONTIER-AND-MISSING-ROW-FAULT")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-IDX-001-ACTIVE-CANDIDATE-CSN-LOW-AND-HIGH-WORD-MISMATCH")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-IDX-001-ACTIVE-CANDIDATE-WIRE-SIZE-AND-RESERVED-HIGH-WORD")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-CMP-007-ACTIVE-FOREIGN-SOURCE-OWNER-CLEANS-BEFORE-OUTER-UNWIND")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-CMP-007-ACTIVE-CLOSED-READONLY-FD-IS-TERMINAL-SOURCE-FAULT")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-CON-004-ACTIVE-THROW-AT-NATIVE-PREAD-CLEANS-WITHOUT-AUTHORIZING")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-CON-004-ACTIVE-SMALL-BUFFER-RESTARTS-AND-REACQUIRES-NEW-ROOT")
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-MVC-004-ACTIVE-SNAPSHOT-EXPIRES-AFTER-PRIVATE-COPY"))
 :NAME "ignore-batch-file-id" :FILE "src/get-resolver/active-preflight.lisp"
 :RESULT :DETECTED :STATUS :OK :COPY-DIRECTORY
 "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/"
 :EVIDENCE-DIRECTORY
 "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/evidence/ignore-batch-file-id/"
 :EXPECTED-FAILURE :FOREIGN-BATCH-ADMITTED :SUGGESTED-DETECTION-TEST
 ("ARCDOCDB.GET.ACTIVE.TESTS"
  "TEST-REQ-WAL-005-ACTIVE-PREFLIGHT-BATCH-FILE-ID")
 :EXPECTED-TESTS
 (("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-WAL-005-ACTIVE-PREFLIGHT-BATCH-FILE-ID"))
 :PRODUCER-RECORD
 "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/report.lisp"
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
   "c8579a0917ec95c9c6a6c1f5fc706dc7cdf7702dbf487c76a6fe4582b77fc65c")
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
   "c8579a0917ec95c9c6a6c1f5fc706dc7cdf7702dbf487c76a6fe4582b77fc65c")
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
 :CHANGED-PATHS ("src/get-resolver/active-preflight.lisp") :CONFIG-SHA256
 "c25a52e08a3fc6bcb7dc5240d6d7c0998286cb9173ea4d1d6d6b695e66902b72"
 :CONFIG-SHA256-AFTER
 "c25a52e08a3fc6bcb7dc5240d6d7c0998286cb9173ea4d1d6d6b695e66902b72"
 :ARTIFACTS-VERIFIED T :CHILD-REPORT
 (:FINISHED-AT-UNIVERSAL-TIME 4000985371 :CONFIG-SHA256-AFTER
  "c25a52e08a3fc6bcb7dc5240d6d7c0998286cb9173ea4d1d6d6b695e66902b72"
  :CONDITION-TYPE "SIMPLE-ERROR" :DIAGNOSTIC
  "Asserzione fallita: (TYPEP ARCDOCDB.GET.ACTIVE.TESTS::CAUGHT TYPE)"
  :CONDITION-REASON NIL :CONDITION-NAME "SIMPLE-ERROR" :CONDITION-PACKAGE
  "COMMON-LISP" :EXECUTED-TESTS
  (("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-WAL-005-ACTIVE-PREFLIGHT-BATCH-FILE-ID"))
  :SUITE-TESTS
  (("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-FOR-001-ACTIVE-SOURCE-CONFIGURATION-IDENTITY-AND-FD")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-FOR-003-ACTIVE-NATIVE-V1-V2-PUT-AND-TOMBSTONE")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-IDX-001-ACTIVE-TOMBSTONE-PAGE-ZERO-PUTS")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-WAL-005-ACTIVE-PREFLIGHT-IMMUTABLE-NO-CSN-OR-IO")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-AFF-008-ACTIVE-FIRST-PAYLOAD-EXACT-ONE-SHORT")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-AFF-008-ACTIVE-SECOND-PAYLOAD-PEAK-EXACT-ONE-SHORT")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-AFF-008-ACTIVE-PAGE-BUDGET-EXACT-REFUSES-NEXT")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-AFF-008-ACTIVE-PUT-BUDGET-EXACT-REFUSES-NEXT")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-AFF-008-ACTIVE-RECORD-BYTE-BUDGETS-EXACT-ONE-SHORT")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-FOR-004-ACTIVE-PREPARED-OUTCOME-REFUSED-BEFORE-CSN")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-CON-004-ACTIVE-ROOTS-PERSIST-AFTER-PUBLIC-BATCH-REUSE")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-AFF-001-ACTIVE-SEALED-CRC-FAULTS-ARCHIVE-PRESERVES-CAUSE")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-WAL-005-ACTIVE-PREFLIGHT-BATCH-FILE-ID")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-WAL-005-ACTIVE-PREFLIGHT-BATCH-VERSION")
   ("ARCDOCDB.GET.ACTIVE.TESTS" "TEST-REQ-WAL-005-ACTIVE-PREFLIGHT-EMPTY-OPEN")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-WAL-005-ACTIVE-PREFLIGHT-OPEN-TOKEN-BOUND")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-WAL-005-ACTIVE-PREFLIGHT-SEALED-REFUSED-WITH-TOKEN-PRESERVED")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-WAL-005-ACTIVE-PREFLIGHT-PREVIOUS-ORDER")
   ("ARCDOCDB.GET.ACTIVE.TESTS" "TEST-REQ-AFF-008-ACTIVE-PREFLIGHT-RING-FULL")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-AFF-008-ACTIVE-PREFLIGHT-EVENT-GENERATION-BOUND")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-WAL-005-ACTIVE-PREFLIGHT-CONTIGUOUS-OFFSET")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-AFF-008-ACTIVE-PREFLIGHT-SEGMENT-SPACE")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-AFF-008-ACTIVE-PREFLIGHT-RECORD-BOUNDARY")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-AFF-008-ACTIVE-PREFLIGHT-SEAL-BYTE-BOUNDARY")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-AFF-001-ACTIVE-PREFLIGHT-HEADER-CORRUPTION-FAULTS-ARCHIVE")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-AFF-001-ACTIVE-PREFLIGHT-OPEN-COUNT-FAULTS-ARCHIVE")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-IDX-001-ACTIVE-DIRECTORY-NIBBLE-TRANSITIONS-PERSISTENT")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-IDX-001-ACTIVE-DIRECTORY-65536-FINAL-CONVERGENCE")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-IDX-001-ACTIVE-DIRECTORY-MALFORMED-LOCAL-GUARDS")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-IDX-001-ACTIVE-DIRECTORY-OCCUPIED-APPEND-PRESERVES-GRAPH")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-FOR-003-ACTIVE-NATIVE-V1-V2-CSN-U64-AND-ORDINARY-FLAGS")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-CCH-002-ACTIVE-COLD-READ-AND-WARM-PROBE-AND-READ")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-WAL-006-ACTIVE-DURABLE-PLANNED-ROOT-CANNOT-AUTHORIZE-VALUE")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-WAL-006-ACTIVE-OLD-PUT-USES-OWN-PAGE-END")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-IDX-001-ACTIVE-HEADER-SEAL-TOMBSTONE-FRONTIER-AND-MISSING-ROW-FAULT")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-IDX-001-ACTIVE-CANDIDATE-CSN-LOW-AND-HIGH-WORD-MISMATCH")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-IDX-001-ACTIVE-CANDIDATE-WIRE-SIZE-AND-RESERVED-HIGH-WORD")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-CMP-007-ACTIVE-FOREIGN-SOURCE-OWNER-CLEANS-BEFORE-OUTER-UNWIND")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-CMP-007-ACTIVE-CLOSED-READONLY-FD-IS-TERMINAL-SOURCE-FAULT")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-CON-004-ACTIVE-THROW-AT-NATIVE-PREAD-CLEANS-WITHOUT-AUTHORIZING")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-CON-004-ACTIVE-SMALL-BUFFER-RESTARTS-AND-REACQUIRES-NEW-ROOT")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-MVC-004-ACTIVE-SNAPSHOT-EXPIRES-AFTER-PRIVATE-COPY"))
  :SCHEMA-VERSION 1 :KIND :GET-ACTIVE-PREFLIGHT-MUTATION-CHILD :STATUS :FAILED
  :PHASE :TESTS :COMPILED T :SUITE-COMPILED T :COMPILED-FILES
  ((:FILE "tests/wal/support.lisp" :SOURCE-SHA256
    "90a47539e5e2898c0a08059207f30bb5551e7ca8fc166f8f6ce7b95afa757295" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/wal/support.fasl"
    :FASL-SHA256
    "d786c2f26d8426b756d5658e56ca885a7411011618ea9324a3ddb58d01b80180")
   (:FILE "tests/wal/native.lisp" :SOURCE-SHA256
    "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/wal/native.fasl"
    :FASL-SHA256
    "b3ccef1b8f6e7a15ca6c7d9dc8fbef5bb59b41bc1c26a1357eaab6523b0c1e6e")
   (:FILE "tests/wal/group.lisp" :SOURCE-SHA256
    "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/wal/group.fasl"
    :FASL-SHA256
    "69dc16118931d17af2a2c65ab7d9c88b95bb9a0eba76671a374161259b91e642")
   (:FILE "tests/wal/fault.lisp" :SOURCE-SHA256
    "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/wal/fault.fasl"
    :FASL-SHA256
    "8857cf86e8d5280d3aeeeb0355c0478d899211338101f226bdddfe9a39bbc92e")
   (:FILE "tests/wal/csn.lisp" :SOURCE-SHA256
    "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/wal/csn.fasl"
    :FASL-SHA256
    "850c956912ef392dc5e661959fca120466204a52ef601d5c0ff53eb9af1e4bb0")
   (:FILE "tests/wal/csn-threads.lisp" :SOURCE-SHA256
    "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/wal/csn-threads.fasl"
    :FASL-SHA256
    "a24bc30315f39c843f6fb89c023708086e488d547b41352d0e783e0e75188b5a")
   (:FILE "tests/wal/builder.lisp" :SOURCE-SHA256
    "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/wal/builder.fasl"
    :FASL-SHA256
    "2f815cb97b59dadc54d0691ebd9eaa9c5c33fc58c7235ea0a09d0537ff7db34d")
   (:FILE "tests/storage/support.lisp" :SOURCE-SHA256
    "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/storage/support.fasl"
    :FASL-SHA256
    "08520d4a047a8f77eb2ef9bb54f2ab0477341c2932cfa2d4af7cb3e7cd2a92eb")
   (:FILE "tests/storage/segment-header.lisp" :SOURCE-SHA256
    "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/storage/segment-header.fasl"
    :FASL-SHA256
    "0700a1c62f73f046d10ac1f03a726a8818c92d78c26bc255c07b403aff16ce03")
   (:FILE "tests/storage/log-header.lisp" :SOURCE-SHA256
    "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/storage/log-header.fasl"
    :FASL-SHA256
    "e8ad3ecc20302425f75c79f019ecdd8f2fd6ade73b6e6660468c0667f1bf2784")
   (:FILE "tests/storage/control-payload.lisp" :SOURCE-SHA256
    "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/storage/control-payload.fasl"
    :FASL-SHA256
    "5cc792940fb6b55162a5c046024a1ede548963ba136112917538daac6bf3f255")
   (:FILE "tests/storage/compaction-scan.lisp" :SOURCE-SHA256
    "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/storage/compaction-scan.fasl"
    :FASL-SHA256
    "0073dade59064847479594674af9a3dda794d52db2efc0ea32d6313707710020")
   (:FILE "tests/smoke.lisp" :SOURCE-SHA256
    "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/smoke.fasl"
    :FASL-SHA256
    "e8626d0f29dbe43ce748c8945626f73b8578d4d3cb30944e86bd6d17fa0d983b")
   (:FILE "tests/series/worker-routing.lisp" :SOURCE-SHA256
    "f495d33f73e3249d1055ea61d65034033367de85edec3db2cac3a63ff449e3f9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/series/worker-routing.fasl"
    :FASL-SHA256
    "201d07e5c05794282ba26e426183870e70f29f74dbeb989237d4c8df28bb339a")
   (:FILE "tests/series/worker-bridge.lisp" :SOURCE-SHA256
    "c1ee49702e63978a83cb86c4e5bf437a5a40e48fa02b65d3eaf3dca0d2e39176" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/series/worker-bridge.fasl"
    :FASL-SHA256
    "e49564aca9bf7b597f89824495356b6905af214e87bea0efb2875e893bdf0cfa")
   (:FILE "tests/series/threads.lisp" :SOURCE-SHA256
    "b8fe9d7e1c0ca4e18909a0a6f7ac03c8df68dd186fa21e62600be685d6e4c7ae" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/series/threads.fasl"
    :FASL-SHA256
    "2be2313db274684be47366e6266f22a7d63a9a0d9c012f3019872cc28d69a2e0")
   (:FILE "tests/series/support.lisp" :SOURCE-SHA256
    "810dd8a69927c75e3399af47b8fff18e4ab88eb41049c50bafee5c041be263b3" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/series/support.fasl"
    :FASL-SHA256
    "999bfe6a0d4339d59f1427b80f6a5f1538483214e233e7a6b01b04f6eea1d606")
   (:FILE "tests/series/controller.lisp" :SOURCE-SHA256
    "8bc98ec62e58803cab5613210e1200e0ce296af9aff63b5dff61579c3931670a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/series/controller.fasl"
    :FASL-SHA256
    "30951881b10c382e14642dd4ad0dd6da51e5c174e4c0eed8cb912dd5efa2ff4c")
   (:FILE "tests/series/boundaries.lisp" :SOURCE-SHA256
    "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/series/boundaries.fasl"
    :FASL-SHA256
    "95e1651d75e9a58a516cf3a0ffe6520f9c39c2c2eebb912741b6be69e4a55514")
   (:FILE "tests/scheduler/support.lisp" :SOURCE-SHA256
    "300234f9ac7931f8c8b9bf305498a2742a3b8868dd9158dbab8c7fdceed5a1e4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/scheduler/support.fasl"
    :FASL-SHA256
    "745940479659ed324044f4bdefdbc083da776564867a45aafda62567e08e893d")
   (:FILE "tests/scheduler/pool-claim.lisp" :SOURCE-SHA256
    "f968d57b6ff4dfc3cc31f1b1979afa896d95435093406b36320800783629901f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/scheduler/pool-claim.fasl"
    :FASL-SHA256
    "8c0ba5dc1a81533b26154b51bb93c3304ba331c1985cdb0559c1f0fde894b6e2")
   (:FILE "tests/scheduler/lifecycle.lisp" :SOURCE-SHA256
    "eff59c0cf6d9c6c1ddec57a4efa26a8fcaeedc850b77764b818bc1c22eb73e38" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/scheduler/lifecycle.fasl"
    :FASL-SHA256
    "299b5a21a2319529d063483466b2b81dc96c64f62eaeeef75a04bc3684f1b299")
   (:FILE "tests/scheduler/dispatch.lisp" :SOURCE-SHA256
    "600eb0b5fdf9a52d020e2f4c638f0f3dba43d9d9711be73eaffff208578821eb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/scheduler/dispatch.fasl"
    :FASL-SHA256
    "b298d405ca01d7a61c3a0f8611e5d415662136267dab87a31948fd33acc852d3")
   (:FILE "tests/scheduler/controller.lisp" :SOURCE-SHA256
    "e986e3facc9d1b9b4eab0d135259a61d7e0f188a7f268cb2e5ee5f9c700c40be" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/scheduler/controller.fasl"
    :FASL-SHA256
    "7bbc89fdd099962279e174036e117602bd31186b715c8b25741883d296231c70")
   (:FILE "tests/recovery/support.lisp" :SOURCE-SHA256
    "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/recovery/support.fasl"
    :FASL-SHA256
    "249382c69ff7a4562888a8081e3eb89c7f1daf0d5fce61e3c16f85f3bbeec06b")
   (:FILE "tests/recovery/scan.lisp" :SOURCE-SHA256
    "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/recovery/scan.fasl"
    :FASL-SHA256
    "e260e304b9b77d4a25607d4c758c6f25f949429f291258ec83dc513cad77b472")
   (:FILE "tests/recovery/manifest.lisp" :SOURCE-SHA256
    "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/recovery/manifest.fasl"
    :FASL-SHA256
    "5c0409c52e4e7ad1d7d0b7ee93e0e2be6046b2272f304e0b493e153070577769")
   (:FILE "tests/recovery/manifest-support.lisp" :SOURCE-SHA256
    "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/recovery/manifest-support.fasl"
    :FASL-SHA256
    "34daff3d117b26a49ef1d09c1cc7be021039399e70aa9e36c3903e4e7dc5b4dd")
   (:FILE "tests/recovery/manifest-audit.lisp" :SOURCE-SHA256
    "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/recovery/manifest-audit.fasl"
    :FASL-SHA256
    "3427e9d239afe06097cb6006e4da056c80e1116d6a67f9b65ea28d4540532294")
   (:FILE "tests/recovery/inventory.lisp" :SOURCE-SHA256
    "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/recovery/inventory.fasl"
    :FASL-SHA256
    "ef9bff5fef2ed98666f4202601f303f4d0b5e66005b5fe1396b6edfd3d324b80")
   (:FILE "tests/recovery/inventory-support.lisp" :SOURCE-SHA256
    "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/recovery/inventory-support.fasl"
    :FASL-SHA256
    "535f0f544789672a25993bd7d2b7f08b6db40c0d8d729181e1092c6736c8b69c")
   (:FILE "tests/recovery/decisions.lisp" :SOURCE-SHA256
    "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/recovery/decisions.fasl"
    :FASL-SHA256
    "637dc7eea9fedcfaf3ea5f5190021750be42e29245a11a65a34c129f7bc4c6f6")
   (:FILE "tests/recovery/decisions-support.lisp" :SOURCE-SHA256
    "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/recovery/decisions-support.fasl"
    :FASL-SHA256
    "d58efc9a473673068032f472711748880ef833e9e149a8b633dfaed8ce1cfd0b")
   (:FILE "tests/recovery/decisions-radix.lisp" :SOURCE-SHA256
    "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/recovery/decisions-radix.fasl"
    :FASL-SHA256
    "c6fae5fe8d6a4494277ff4fc679c34b80787d3bec342b2aa471216ed03a05f51")
   (:FILE "tests/recovery/decisions-audit.lisp" :SOURCE-SHA256
    "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/recovery/decisions-audit.fasl"
    :FASL-SHA256
    "6f94cef812be0edc47f128e95fd9b4175df97fde8d9d603f8318901367008280")
   (:FILE "tests/recovery/corruption.lisp" :SOURCE-SHA256
    "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/recovery/corruption.fasl"
    :FASL-SHA256
    "80c45d38b2bfb6d0bf1cd362244aaa1730297580d900ff4fbf7fdd149a4aa6d5")
   (:FILE "tests/read/threads.lisp" :SOURCE-SHA256
    "e2e223b69b08a5d76b9773c6ad4dee13ef2ddbb6f5ababa713cc5654bc7b51c5" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/read/threads.fasl"
    :FASL-SHA256
    "fba3ac6add8ab7c024556d90a2449d776fb9a74051d45f999488000bf6897259")
   (:FILE "tests/read/support.lisp" :SOURCE-SHA256
    "8095cc39d49342f6e43f3421b4fced839da02d8d11b4d8ddcd91bd346447e754" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/read/support.fasl"
    :FASL-SHA256
    "62d8ae9c72e45cd4b818f386c2dcbf2cef6a12f010b4f60c49ba769c14866ad5")
   (:FILE "tests/read/lifecycle.lisp" :SOURCE-SHA256
    "c4c4642408816f2e0e809e21d04739b68b9391237e3e46ea0b195ed82857c3a8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/read/lifecycle.fasl"
    :FASL-SHA256
    "4ac37abeeb1752e4c973b55254c1f46bfb8aa048dd52cb0bb15ae56eab536b73")
   (:FILE "tests/mvcc/support.lisp" :SOURCE-SHA256
    "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/mvcc/support.fasl"
    :FASL-SHA256
    "e96aaf5de14f2ca2c0e2931fde504faa9efcfcfd853c615d4f3e7ea36b84bc1c")
   (:FILE "tests/mvcc/lifecycle.lisp" :SOURCE-SHA256
    "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/mvcc/lifecycle.fasl"
    :FASL-SHA256
    "d815bb4acf45464a5193c419aa75444508144a8e026491b09aed6433b8f00b2f")
   (:FILE "tests/mvcc/capture.lisp" :SOURCE-SHA256
    "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/mvcc/capture.fasl"
    :FASL-SHA256
    "954dd27e7d2677e662b2941ae0db45267b4480eac2e9fee333c54f99f9dcc5fb")
   (:FILE "tests/io/transfer.lisp" :SOURCE-SHA256
    "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/io/transfer.fasl"
    :FASL-SHA256
    "2c453609c8557cb8b87f7f92e0185d62aad6f90be8be9475eb85f9f0c94a61ce")
   (:FILE "tests/io/support.lisp" :SOURCE-SHA256
    "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/io/support.fasl"
    :FASL-SHA256
    "69bd2002212001fd4fc0b2ea3840c34bcb45205f5b1b5d778d21e7632750c250")
   (:FILE "tests/io/rename.lisp" :SOURCE-SHA256
    "cd14164b36977d927f7e4cf4d70d2068661c47f538228957102a4347a853fa59" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/io/rename.fasl"
    :FASL-SHA256
    "2442f35c31853bdb82a7719f4d97a3439b49ff367cc2d6e063671d79b200eb0a")
   (:FILE "tests/io/rename-native.lisp" :SOURCE-SHA256
    "b1f43b09af8f4253ce22a4793f9267c7d60df69339a3fc51b9fd83b6a331bce5" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/io/rename-native.fasl"
    :FASL-SHA256
    "aeb5d6dda47ad7cc350c26a1ac9298c123b7a7e84897d7a333ff65107bfc64d4")
   (:FILE "tests/io/native.lisp" :SOURCE-SHA256
    "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/io/native.fasl"
    :FASL-SHA256
    "d8fdc3b5eae4078f11be2dcc06b3a3d3524906bc115e372750cb239abbb98ec7")
   (:FILE "tests/index/slots.lisp" :SOURCE-SHA256
    "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/index/slots.fasl"
    :FASL-SHA256
    "a0bbb5fd8f4a5dc5ee247e554d5b67525ce52d47dcdda8c802fb465d6854b86d")
   (:FILE "tests/index/slot-threads.lisp" :SOURCE-SHA256
    "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/index/slot-threads.fasl"
    :FASL-SHA256
    "21dae424b9c396742839c4f0b8ef25db5f0300bd02fb9458f6c53155416d1f67")
   (:FILE "tests/index/slot-support.lisp" :SOURCE-SHA256
    "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/index/slot-support.fasl"
    :FASL-SHA256
    "0b3a8dbdbfc20ebdb9504ccd16d39d2692cab963f646cac74ecc058dbe69be10")
   (:FILE "tests/index/rebuild.lisp" :SOURCE-SHA256
    "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/index/rebuild.fasl"
    :FASL-SHA256
    "e14392243f244a6492d0ce9b9202ded0a228fb2745c0905b1e838d648dc5d611")
   (:FILE "tests/index/primary.lisp" :SOURCE-SHA256
    "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/index/primary.fasl"
    :FASL-SHA256
    "bcbf399bf09809eacaea79cf45b514f45023906c5b65122503a032102b1e45f9")
   (:FILE "tests/index/primary-threads.lisp" :SOURCE-SHA256
    "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/index/primary-threads.fasl"
    :FASL-SHA256
    "3696fcdfc7342f9a9e921cb1818a2f56683b2469404ac389ec08fa989f0041e9")
   (:FILE "tests/index/primary-support.lisp" :SOURCE-SHA256
    "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/index/primary-support.fasl"
    :FASL-SHA256
    "26aca8523e3f28e15bca1767a00f7153e8c9bd90995fd230d918bf23d999caad")
   (:FILE "tests/index/hash-digests.lisp" :SOURCE-SHA256
    "3b3b39f861883cf2017cab8e6488560a6bb3897d63784f00e820a6450d743225" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/index/hash-digests.fasl"
    :FASL-SHA256
    "c1e0d0f2219492909ee27f701e32d2bebe8e8e38050810130d947ae8a2ea21ce")
   (:FILE "tests/hash/threads.lisp" :SOURCE-SHA256
    "3fc587a57d26a294aebfc6a7aeadf2f61a42a21106c1c57517f891b76b4e750a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/hash/threads.fasl"
    :FASL-SHA256
    "7760dce81eed25b834f9669e5e5de6c09e9dfae7ebe0dd5c3247eae2fcefe509")
   (:FILE "tests/hash/support.lisp" :SOURCE-SHA256
    "0fae9dc36976af544f83e6051b9cf9d67c9bef0b9e25f1fa2a48fdac48592acb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/hash/support.fasl"
    :FASL-SHA256
    "b6c6318004bd8eb0800b1eeee96306d155c87b0faf25b5fc32a97c23e583a350")
   (:FILE "tests/hash/hash64.lisp" :SOURCE-SHA256
    "70606bc68807143cfea9583871474c84efc868d13692cde28488284dee43e0f1" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/hash/hash64.fasl"
    :FASL-SHA256
    "8926624ddc6eb7daaa7a83200a160a0cc9dd8af5f311ce8a82eb1c19255a361c")
   (:FILE "tests/hash/guards.lisp" :SOURCE-SHA256
    "9af5b38443a57d224990a68e93f12f7a4cda306f94c7ccd3ccb50635865d7864" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/hash/guards.fasl"
    :FASL-SHA256
    "6b1d65dfc9e97288d03926bc440d5ad8492900296f3f39f4c6153168965b6695")
   (:FILE "tests/get/support.lisp" :SOURCE-SHA256
    "21f0da34755882f7dcc3ee760528ca39d4731e1a79ea94525c62753b7f60422c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/get/support.fasl"
    :FASL-SHA256
    "3ff751c285bc33de5a4b1af50b8daeddf553d494461012da085c5dad4677a918")
   (:FILE "tests/get/segment.lisp" :SOURCE-SHA256
    "e9722f419ce0810c98c28d0e1a74da85d52346a0befff40c1119934519fc6f98" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/get/segment.fasl"
    :FASL-SHA256
    "b48f077d9cc2012121771cd9553b83e17b8d87e1c7983f8e5973b66f8e77b6a6")
   (:FILE "tests/get/lifecycle.lisp" :SOURCE-SHA256
    "73bf87c2aee7b537dba31fc0ae554272f7d2be5a4c1e9e96ea2f21a17f6f71f5" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/get/lifecycle.fasl"
    :FASL-SHA256
    "66ec4fe43695690271181f66809e0b474a4838d447e63f87074bd39c54695ace")
   (:FILE "tests/get-resolver/support.lisp" :SOURCE-SHA256
    "d30a5c8a61b63e339facfee9f7701eb5a3614bbfd1ebef2c46c747d136640f8b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/get-resolver/support.fasl"
    :FASL-SHA256
    "5b7354b00753d480dd95d49b19eb293c32d8c785d12fb876c07c0f6ca26d777e")
   (:FILE "tests/get-resolver/sort.lisp" :SOURCE-SHA256
    "fd7f97f0fad2e970b972688481c0c132f11c85f5fdcd0f02bee6b0b3f93b97ae" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/get-resolver/sort.fasl"
    :FASL-SHA256
    "70343bde7e609cf785eee092331583385644b499b45f798a7b24481edb11ca24")
   (:FILE "tests/get-resolver/read.lisp" :SOURCE-SHA256
    "70e46d1b88716f44309f46b4955928ca7fa2195edd80bb67d5b97732b971e8fb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/get-resolver/read.fasl"
    :FASL-SHA256
    "697c510987ed2f859c2d0aac4afc95667d67026e8c646a69f48004e13dfee73e")
   (:FILE "tests/get-resolver/construction.lisp" :SOURCE-SHA256
    "45cbef3b35db35d60a4cec2516c24f6ef56f5edb2f19f6f07f24fe00c8737b13" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/get-resolver/construction.fasl"
    :FASL-SHA256
    "7eb30554c405f27c859679f0598457c08306adeabf86fe3d761dc04880c5768c")
   (:FILE "tests/get-performance/threads.lisp" :SOURCE-SHA256
    "05ace5eb351ab49da59611dc1a2a5abedb9d723a2fc6e75a30fc76e507573a90" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/get-performance/threads.fasl"
    :FASL-SHA256
    "315ba0e73a483badcf106f3b3515398a0d9e8902dd415b23c4d5b63bb7883b2b")
   (:FILE "tests/get-performance/support.lisp" :SOURCE-SHA256
    "e586ed94dcb2aaba00282931cdd83313e4f84a86d4d1ba85e2d56e8b7433ed8d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/get-performance/support.fasl"
    :FASL-SHA256
    "073c9303776d82f2a7fbede7f0d5580f515419ab6179d1dfe601e6fed6697833")
   (:FILE "tests/get-performance/paths.lisp" :SOURCE-SHA256
    "3b8d2c9c93467507ea2bb471d42192eb1fa084b55c0f4263b5ef0d3acf468f55" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/get-performance/paths.fasl"
    :FASL-SHA256
    "a30ffbe5b7ea0116758bd3fc7552f30660486095d67600f37f3a95a5b7db4377")
   (:FILE "tests/get-performance/guards.lisp" :SOURCE-SHA256
    "c41721b917ed443355ea3707efdd07e7da53a978c0515ab1e5ede5fcc47d63fc" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/get-performance/guards.fasl"
    :FASL-SHA256
    "3db1f18356137ce3737ad6f4bcac9e161b7b5adc05e0d45a80d94b064b4bfbf2")
   (:FILE "tests/get-directory/threads.lisp" :SOURCE-SHA256
    "e6a93ec22bc6f5a31b37ae99d927d1ca3a53893adb2eae21cd89d132a82d1f64" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/get-directory/threads.fasl"
    :FASL-SHA256
    "5af5b4c0ea47346c7ca67ef767d3383ffe89aeb9a5c638f41ebb71a663df43f8")
   (:FILE "tests/get-directory/support.lisp" :SOURCE-SHA256
    "be3a216a6ec597b63186b6bf3d3e35f3327f3001b1c00535d64b10bcb5d9fe85" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/get-directory/support.fasl"
    :FASL-SHA256
    "a8f3bfb8d06b6a0b783e02d35454a53bb0a88852bb459c374ed9332f97701c4c")
   (:FILE "tests/get-directory/series-support.lisp" :SOURCE-SHA256
    "40f15fbdf42b80515cbfc57eb74bedcbd96d4a9e7e19dc25d8db59f326fe659a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/get-directory/series-support.fasl"
    :FASL-SHA256
    "236037444c08f24c35590c8b12edb4edaf56ecbe73ed936b74e03eaee7983cbb")
   (:FILE "tests/get-directory/series-read.lisp" :SOURCE-SHA256
    "4b9856d69cd82c1462c87d16b9eb8e00fb642a46bb22f2f7b01865f7cc2a83a4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/get-directory/series-read.fasl"
    :FASL-SHA256
    "0117a6f75e5955fc5fe661566fcdc286da9ffa7433c29b46928717def5db1df4")
   (:FILE "tests/get-directory/read.lisp" :SOURCE-SHA256
    "a222541b6413bb93ff86a269273f1fa15bfad0d1e4072fc058b023fec5143280" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/get-directory/read.fasl"
    :FASL-SHA256
    "7b889c9e818d51c194d8b4537c72194abded02340e88d97f3478718660c34dd3")
   (:FILE "tests/get-directory/construction.lisp" :SOURCE-SHA256
    "4ce9aa7064793e908008b9e1055c1e2527d5071006782ea956509c28e8c712d7" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/get-directory/construction.fasl"
    :FASL-SHA256
    "0c34087e8648b9f1a30a4cb18043ca6ea3aa4cc71746d327a7c06c3522ee492e")
   (:FILE "tests/get-active/support.lisp" :SOURCE-SHA256
    "34c73b5323272a24fc01c132133d3cc74be7c00fa7ddd4ad08b8146bb42d589f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/get-active/support.fasl"
    :FASL-SHA256
    "5bdb26b7ac8d1fd2bc50483a7ea361cd346ad0c0517d069b34440798e3595a74")
   (:FILE "tests/get-active/read.lisp" :SOURCE-SHA256
    "ef1a15c742518b52bdbeecac6b838b0789b73d631f765a30fd016748769a72e6" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/get-active/read.fasl"
    :FASL-SHA256
    "1f1f03d9e970faf81ae3a06d48c4080cc09d151012d422d4a6334700e71e31ec")
   (:FILE "tests/get-active/preflight.lisp" :SOURCE-SHA256
    "c65ef56f5f7498d4355e6a1f640969e3e31724fab9b84b5c3247e4e9d37626e3" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/get-active/preflight.fasl"
    :FASL-SHA256
    "0f9b100d3ad2572e8de8886d7093ebe4351dd29810da9e73755293b16a491daa")
   (:FILE "tests/get-active/directory.lisp" :SOURCE-SHA256
    "ea6754ab84b53a4be1722985600e280fde6f73da4ea7eb843e99d66989df6fdf" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/get-active/directory.fasl"
    :FASL-SHA256
    "930f0999bea4e8718d36ec2bb62dd1d21f416479a3c8ffa12c125057946a4875")
   (:FILE "tests/get-active/construction.lisp" :SOURCE-SHA256
    "31a21762f3c16950e4b6c0ce48a6ab235d2483476d03d4072d63905f7dd13deb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/get-active/construction.fasl"
    :FASL-SHA256
    "fa98edba329f802be9dcc001e6ccbb1d7fbe3bbcb7e18142422d976d8a5d2d3a")
   (:FILE "tests/foundation/support.lisp" :SOURCE-SHA256
    "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/foundation/support.fasl"
    :FASL-SHA256
    "7d01463df57c77840d79f392c56ff086825eb220fac7bb7566f6883f03efe553")
   (:FILE "tests/foundation/record.lisp" :SOURCE-SHA256
    "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/foundation/record.fasl"
    :FASL-SHA256
    "b3ac9a763aa30382728b4cf337c64c45655bb413180904d27700755b54a7324a")
   (:FILE "tests/foundation/binary.lisp" :SOURCE-SHA256
    "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/foundation/binary.fasl"
    :FASL-SHA256
    "95173fa6b925931a9684777552ed35bb219219ab1ce81f2fe788b0643494766d")
   (:FILE "tests/foundation/batch.lisp" :SOURCE-SHA256
    "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/foundation/batch.fasl"
    :FASL-SHA256
    "d4c2a4814c44b75a32f919576c1b651d83569eaad646076e88774f25d9decc25")
   (:FILE "tests/execution/worker.lisp" :SOURCE-SHA256
    "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/execution/worker.fasl"
    :FASL-SHA256
    "4f74c058f47f2ac2b3104b8e6aced9b1e138f158c02193c88c3a0af22a301c3f")
   (:FILE "tests/execution/threads.lisp" :SOURCE-SHA256
    "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/execution/threads.fasl"
    :FASL-SHA256
    "4962858e88e1d59986dea237b767bbc9a3a1e5bf2fd467979163444d6ff9efab")
   (:FILE "tests/execution/support.lisp" :SOURCE-SHA256
    "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/execution/support.fasl"
    :FASL-SHA256
    "b5c8d82dd635a3d969cdc0f8d0b791c96b4bd4de801bfb79569e5ae9d86591f1")
   (:FILE "tests/execution/ready.lisp" :SOURCE-SHA256
    "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/execution/ready.fasl"
    :FASL-SHA256
    "b44d1e2ae8957807ffae5ad95bac70c4a4ed81c26aacad551242514cfdc02810")
   (:FILE "tests/execution/ready-recycle.lisp" :SOURCE-SHA256
    "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/execution/ready-recycle.fasl"
    :FASL-SHA256
    "a55ba4ecebde9496172c0c5ffaadf0129a44f6c16442d606b6334879b7bb78de")
   (:FILE "tests/execution/queue.lisp" :SOURCE-SHA256
    "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/execution/queue.fasl"
    :FASL-SHA256
    "dc026e1f3a6d92ebe855790509c908abc4c61f37e22ea9c27dabed429c597a54")
   (:FILE "tests/execution/handoff.lisp" :SOURCE-SHA256
    "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/execution/handoff.fasl"
    :FASL-SHA256
    "5f7303d20deb9e476434b4af4dd444365e96205fd0dac317e3da62758c82e2e2")
   (:FILE "tests/epochs/threads.lisp" :SOURCE-SHA256
    "54b73e06c61e64f32a3e3af0791891dacb6590e929163dcf0fac95f2c71e66fd" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/epochs/threads.fasl"
    :FASL-SHA256
    "228d849e90e7c10e7f6d175c3d1408ba9411c56d4a356fedf717b8143ca2c366")
   (:FILE "tests/epochs/support.lisp" :SOURCE-SHA256
    "366be7af4bf6c4ed946b3fa9e97aea6b034c83e3b757d81c54078dc76d229b6d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/epochs/support.fasl"
    :FASL-SHA256
    "e604877fea7f809b8ebbc4757fa1690f6a80307b2e1db11254710dad64d59bfd")
   (:FILE "tests/epochs/lifecycle.lisp" :SOURCE-SHA256
    "ddc2fbdad9f97d2e4ff008c167776a50b17b742398306fbd5198dca474559cbf" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/epochs/lifecycle.fasl"
    :FASL-SHA256
    "cc4a8af677657413ff793676eb6c9fd26c9e0860dda7dc9f86f73af72f57a9c8")
   (:FILE "tests/csn/threads.lisp" :SOURCE-SHA256
    "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/csn/threads.fasl"
    :FASL-SHA256
    "d1be0a4dc83e84d511a6360fb435c3ed224591e0e2c22d50ed88e2a8bdd3ac0f")
   (:FILE "tests/csn/support.lisp" :SOURCE-SHA256
    "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/csn/support.fasl"
    :FASL-SHA256
    "4702c20c6363eca3bdbefa53b186ec07dae611415fd7163e43b889924e892b1c")
   (:FILE "tests/csn/registry.lisp" :SOURCE-SHA256
    "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/csn/registry.fasl"
    :FASL-SHA256
    "2d17e6f4f1014480ed70e5281097dc5ce8b295d657a5107607bf3f438a0c24ff")
   (:FILE "tests/codec/utf8.lisp" :SOURCE-SHA256
    "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/codec/utf8.fasl"
    :FASL-SHA256
    "a5a6231c00d41fdc757d421766db1a272f8e099bbbefc0a21d76b53238d88fda")
   (:FILE "tests/codec/threads.lisp" :SOURCE-SHA256
    "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/codec/threads.fasl"
    :FASL-SHA256
    "599079b3e9797c88c9a9612dfb846be390b2f45d5952287a535975c0086b1302")
   (:FILE "tests/codec/support.lisp" :SOURCE-SHA256
    "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/codec/support.fasl"
    :FASL-SHA256
    "a66e49cc7576382b1b0d90e76d36784477832bcf5b9a8c61496e5f6f33792879")
   (:FILE "tests/codec/cbor-write.lisp" :SOURCE-SHA256
    "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/codec/cbor-write.fasl"
    :FASL-SHA256
    "d7a8490a2e71c52318fd1fbc53ef585648755e39a161dd89de6a68d44f16c51a")
   (:FILE "tests/codec/cbor-write-threads.lisp" :SOURCE-SHA256
    "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/codec/cbor-write-threads.fasl"
    :FASL-SHA256
    "2704b45bac5c32affa5a956fd6dd37e4b71776d72b89d7604013a46b73a09d95")
   (:FILE "tests/codec/cbor-write-support.lisp" :SOURCE-SHA256
    "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/codec/cbor-write-support.fasl"
    :FASL-SHA256
    "c771fd77e02aca0916dbbc1c020bfc4555bb1d9267bff052c7d674fba5f14ee9")
   (:FILE "tests/codec/cbor-write-roundtrip.lisp" :SOURCE-SHA256
    "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/codec/cbor-write-roundtrip.fasl"
    :FASL-SHA256
    "5b2887786cd3d513ed601d90455afc50d981cb459b49c98a962d7b0afe7aa54f")
   (:FILE "tests/codec/cbor-threads.lisp" :SOURCE-SHA256
    "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/codec/cbor-threads.fasl"
    :FASL-SHA256
    "5bd2505908b554bedbc144850d10e35f09a0082dc9479d9ab7760ec6bf612ed7")
   (:FILE "tests/codec/cbor-support.lisp" :SOURCE-SHA256
    "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/codec/cbor-support.fasl"
    :FASL-SHA256
    "7ad2c35071ffef3b5f8e16cfbcb463cc50db7587cd91edc761c49caf684338a1")
   (:FILE "tests/codec/cbor-structure.lisp" :SOURCE-SHA256
    "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/codec/cbor-structure.fasl"
    :FASL-SHA256
    "f9f0fc71db1ce2fd20816684da7be74a4d3a929f356f4f16469ba97c35d7c566")
   (:FILE "tests/codec/cbor-structure-threads.lisp" :SOURCE-SHA256
    "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/codec/cbor-structure-threads.fasl"
    :FASL-SHA256
    "4d6886ba3d57b07fe89e5979ce2d4d427890ec37e4c14623fba1cf04c373a99f")
   (:FILE "tests/codec/cbor-structure-support.lisp" :SOURCE-SHA256
    "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/codec/cbor-structure-support.fasl"
    :FASL-SHA256
    "b81e39861277c0c1c58c6fbf283217c5601db345ced127158783a75b9320acc2")
   (:FILE "tests/codec/cbor-string-write.lisp" :SOURCE-SHA256
    "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/codec/cbor-string-write.fasl"
    :FASL-SHA256
    "51e7781cebf4b39bc28e4e420c4c410cd6ec3984e73e60beee993b4eb0b766bb")
   (:FILE "tests/codec/cbor-string-write-threads.lisp" :SOURCE-SHA256
    "8e07b881a55e2554a429f1c8b2c69f67862ac015217d90d019167d636564d27d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/codec/cbor-string-write-threads.fasl"
    :FASL-SHA256
    "bbe6db95ca795312ded48917d70704328ffd51c9b530f77907b0c6d22c151add")
   (:FILE "tests/codec/cbor-string-write-support.lisp" :SOURCE-SHA256
    "2cbdb601f442a56456bc637c94e759cc965f44b178268dce3c636c385d34fc39" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/codec/cbor-string-write-support.fasl"
    :FASL-SHA256
    "0eda2951b9c345155d48a0ef868db6dc04e3acf3d101ef4b17cb1d8579188406")
   (:FILE "tests/codec/cbor-simple-write.lisp" :SOURCE-SHA256
    "958bdd3901cfc41032c09d6c9023b192799981884e09ce3573256ff45bc5329a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/codec/cbor-simple-write.fasl"
    :FASL-SHA256
    "555f1653cca21236c76729e60731478a878a3ee9190888ed58497596c9b9681e")
   (:FILE "tests/codec/cbor-simple-write-threads.lisp" :SOURCE-SHA256
    "77074033e75a224fd02e890f98dffa8e97d3a1f8bedd510b00ea55d8ff8687b2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/codec/cbor-simple-write-threads.fasl"
    :FASL-SHA256
    "2542481c4aea6bdde5066a22eee618d8db5ca79b50030416c58e7acae874d98d")
   (:FILE "tests/codec/cbor-simple-write-support.lisp" :SOURCE-SHA256
    "53ceafc72a027a2ff1f787900558ff26f2ff70bbb212f1b37926a6d520fbe86e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/codec/cbor-simple-write-support.fasl"
    :FASL-SHA256
    "e81555edff768c867208f1f9cfe8faaf2964811cb497e5b56152ca607522bba2")
   (:FILE "tests/codec/cbor-minimal.lisp" :SOURCE-SHA256
    "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/codec/cbor-minimal.fasl"
    :FASL-SHA256
    "846525f99dfb3b19ebba063e1ad97632f468422334840c7f7b62911c3ee3c5aa")
   (:FILE "tests/codec/cbor-minimal-threads.lisp" :SOURCE-SHA256
    "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/codec/cbor-minimal-threads.fasl"
    :FASL-SHA256
    "b5cc73af906476b72dece500b3c4f7f15d622e0b2748786f21f3bb2ef2a8c547")
   (:FILE "tests/codec/cbor-minimal-support.lisp" :SOURCE-SHA256
    "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/codec/cbor-minimal-support.fasl"
    :FASL-SHA256
    "cd6d59e0bb1595a343830506a1272e41002e245e6915aec51b7a26a1430bb38f")
   (:FILE "tests/codec/cbor-minimal-scan.lisp" :SOURCE-SHA256
    "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/codec/cbor-minimal-scan.fasl"
    :FASL-SHA256
    "0e2fa6ff81ba51c78506737e53ac23f0117f91a5c470f1f7f5edd98fb239b848")
   (:FILE "tests/codec/cbor-minimal-scan-threads.lisp" :SOURCE-SHA256
    "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/codec/cbor-minimal-scan-threads.fasl"
    :FASL-SHA256
    "189afe6ad654999e6d4377c7173ae7960b1ef6f484b7827b85d246e93a3fd328")
   (:FILE "tests/codec/cbor-minimal-scan-support.lisp" :SOURCE-SHA256
    "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/codec/cbor-minimal-scan-support.fasl"
    :FASL-SHA256
    "7063c3105aeb1468113c2c1081571c78b015d35bb2cd553439e1a9cff9956e56")
   (:FILE "tests/codec/cbor-minimal-edges.lisp" :SOURCE-SHA256
    "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/codec/cbor-minimal-edges.fasl"
    :FASL-SHA256
    "57112d1fbc70fbf7b17e2cd3bbd6ab94083d266544e031f4a8925dbc1de790e6")
   (:FILE "tests/codec/cbor-header.lisp" :SOURCE-SHA256
    "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/codec/cbor-header.fasl"
    :FASL-SHA256
    "01a38db6056c85da9e6d397e855586043582f438f08a70fad049637c8aeb1424")
   (:FILE "tests/codec/cbor-float-write.lisp" :SOURCE-SHA256
    "2d163a64bff4b9d9b9de576c4a4df05f4d8853f1c3d039e790cbb827be98c8b6" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/codec/cbor-float-write.fasl"
    :FASL-SHA256
    "62b67ecba00e44a8305525ca67d91a462f7b31aa94fa1a9f37bd121e0e782bf8")
   (:FILE "tests/codec/cbor-float-write-threads.lisp" :SOURCE-SHA256
    "96a1b205c01f75e271684132ff3e48b4da5cf8a01210257b591ec4951f097043" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/codec/cbor-float-write-threads.fasl"
    :FASL-SHA256
    "d4218b6a12f3fa5107e8c10f850f4daec0f489c651e44845adc7b1bf6ffc2cb4")
   (:FILE "tests/codec/cbor-float-write-support.lisp" :SOURCE-SHA256
    "158f18dcf4b2d7e5562713caa3625aeba16dd1eba21f4413345e8a10b616c748" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/codec/cbor-float-write-support.fasl"
    :FASL-SHA256
    "5298f8e0ff4411ff38bd1915c3c890786d67c5fe7f77cd44533ad25a6d244111")
   (:FILE "tests/codec/cbor-array-write.lisp" :SOURCE-SHA256
    "9ed6a20ab5ae2db33ef419986c8ee963898894ce239059eae7866d503fe48098" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/codec/cbor-array-write.fasl"
    :FASL-SHA256
    "a44fdb7c0292d73834830816d0b161a1478b786d4222ace390de5690c387aa64")
   (:FILE "tests/codec/cbor-array-write-threads.lisp" :SOURCE-SHA256
    "6be0614da2bafdafe2d853fa7845fb913dbf0cd2673771c2c4b0cca277986e35" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/codec/cbor-array-write-threads.fasl"
    :FASL-SHA256
    "954dab8dbacc3c551415ede0d061868367e8f82547ae208f78a4558ec2751336")
   (:FILE "tests/codec/cbor-array-write-support.lisp" :SOURCE-SHA256
    "42a59239bec468dea130b87733a077874a5d9e83ff0f491b20312315bc27ee95" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/tests/codec/cbor-array-write-support.fasl"
    :FASL-SHA256
    "0ec139335a20bd76c8a3778803ad0089762a2c2bab9ffedb72925997105bbe7a")
   (:FILE "src/wal/types.lisp" :SOURCE-SHA256
    "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/wal/types.fasl"
    :FASL-SHA256
    "19e252bc85487abc93d4dbf71b34cde603176e2ad19285143875b99d57fd2785")
   (:FILE "src/wal/package.lisp" :SOURCE-SHA256
    "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/wal/package.fasl"
    :FASL-SHA256
    "b493c7f858b89750f2f5700d6aa780c0c97d155ce8fb994e8cb10cf8f78b6ba2")
   (:FILE "src/wal/group.lisp" :SOURCE-SHA256
    "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/wal/group.fasl"
    :FASL-SHA256
    "4af00c41085ec8d5027eea0a3bca19c178239d09fcb24acb2df81746bf51654a")
   (:FILE "src/wal/executor.lisp" :SOURCE-SHA256
    "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/wal/executor.fasl"
    :FASL-SHA256
    "5d0388c4ae67485a725d5d13dbe0c858ecc20baa6ab87a85a1962f53a376f592")
   (:FILE "src/wal/csn.lisp" :SOURCE-SHA256
    "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/wal/csn.fasl"
    :FASL-SHA256
    "9a38c6752528e8610271c105fae21974883b0cf08192870d0900cfe02e8cfb5f")
   (:FILE "src/wal/builder.lisp" :SOURCE-SHA256
    "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/wal/builder.fasl"
    :FASL-SHA256
    "5251894442ca9365efcfc4897fa0dad0fa1fd7c089ca479c45577ae956a72214")
   (:FILE "src/storage/segment-header.lisp" :SOURCE-SHA256
    "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/storage/segment-header.fasl"
    :FASL-SHA256
    "f745b0573844ba7e69118e376d76339122327501c0a2c372c666b9b2be3cb4c5")
   (:FILE "src/storage/payload-write.lisp" :SOURCE-SHA256
    "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/storage/payload-write.fasl"
    :FASL-SHA256
    "8b5b4c27932ccecdbcc763052b53ed79aff65ec4b35de178e466377d70d45bb3")
   (:FILE "src/storage/payload-record.lisp" :SOURCE-SHA256
    "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/storage/payload-record.fasl"
    :FASL-SHA256
    "6299ff223305365165d1e0520e0ec98d13b6f0ebe96b1db15aebb83a9fdb0902")
   (:FILE "src/storage/package.lisp" :SOURCE-SHA256
    "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/storage/package.fasl"
    :FASL-SHA256
    "37e6a5818728f0f3ff99f4c69c5baa662aaca0f6736631eaf743279e2a8c7b5d")
   (:FILE "src/storage/log-header.lisp" :SOURCE-SHA256
    "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/storage/log-header.fasl"
    :FASL-SHA256
    "82a4b817aae27b3dc3a3be0d013065c2fe8c51c20154143043479bd260121015")
   (:FILE "src/storage/formats.lisp" :SOURCE-SHA256
    "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/storage/formats.fasl"
    :FASL-SHA256
    "f72a74bb15db69bb0a4457620f8e8c0c027c34097bd51675a267f1a2d60a180d")
   (:FILE "src/storage/control-payload.lisp" :SOURCE-SHA256
    "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/storage/control-payload.fasl"
    :FASL-SHA256
    "4e374200b584c0e09f3836de4998e1cfd621d2711cf751e75d267f3236386f62")
   (:FILE "src/storage/compaction-scan.lisp" :SOURCE-SHA256
    "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/storage/compaction-scan.fasl"
    :FASL-SHA256
    "54b4147fefaadeb5a0a1fc8781c5bfe12c7ba45302fed173c59a5fdb5f97dfe5")
   (:FILE "src/series/worker-types.lisp" :SOURCE-SHA256
    "a366799fd9b938bfaa48b0ffda228ff8369ab9acb5b5ead7f081dfc66ab2c81a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/series/worker-types.fasl"
    :FASL-SHA256
    "f7d0a735dd508ded60555b9c8bc99034044b183cc8bc392a7f0a36947c921442")
   (:FILE "src/series/worker-run.lisp" :SOURCE-SHA256
    "f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/series/worker-run.fasl"
    :FASL-SHA256
    "7392c1a8e59a059d78d2769e9e782edf2978b4bf59cf45dae190a6130485a5e9")
   (:FILE "src/series/worker-package.lisp" :SOURCE-SHA256
    "dcab7a17e4fabcf256c2eddfb655d18145a1d789dd8d64a889945badc418e4b7" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/series/worker-package.fasl"
    :FASL-SHA256
    "52adf58666bf3d8fcc9211b9f1d56a27531d124537136531e842481baaa73d1e")
   (:FILE "src/series/worker-boundary.lisp" :SOURCE-SHA256
    "793d401d1b9acc7b67923d815560f277f3d390ca050740f735f07d88dbacfe73" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/series/worker-boundary.fasl"
    :FASL-SHA256
    "0fa60da0928b987981933d8983e74eb0a1101e56125449f2fb8741943c289330")
   (:FILE "src/series/types.lisp" :SOURCE-SHA256
    "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/series/types.fasl"
    :FASL-SHA256
    "d7000827091a9825a2229bca7d6fc22c7232a18dd0bfde7682409841b2f3a8cf")
   (:FILE "src/series/routing-types.lisp" :SOURCE-SHA256
    "31ae51c0fb11a802164a4d1e11ec63f835a2c67b52c751c5685bcc8947e5e0f1" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/series/routing-types.fasl"
    :FASL-SHA256
    "e9319cc0c9edaff5aeab95668a6ff9fcc0cbcc117cca36c7f8828ed6ed06bd77")
   (:FILE "src/series/routing-select.lisp" :SOURCE-SHA256
    "796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/series/routing-select.fasl"
    :FASL-SHA256
    "572891fde4760a5a4e3169b43ac988c73ecb85012d018ca871b7d1b0858ebea4")
   (:FILE "src/series/routing-build.lisp" :SOURCE-SHA256
    "70135e73ecb1f6080683dd615c47a50530485061797382d74441743cd9a0f92d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/series/routing-build.fasl"
    :FASL-SHA256
    "1cc1461defc6e04aab98c51d7a4d61eaea9ee1ea70a9f96faa4125c4cd41aa58")
   (:FILE "src/series/retirement.lisp" :SOURCE-SHA256
    "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/series/retirement.fasl"
    :FASL-SHA256
    "e332c9e00090e05cb77208e58335a001b7dbde6ead7fde2cfc5003459bdb6e27")
   (:FILE "src/series/query.lisp" :SOURCE-SHA256
    "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/series/query.fasl"
    :FASL-SHA256
    "f9e889e0573b362a3d7354a2c5f785b65f1d02dbe285407c402c6c89aeaae717")
   (:FILE "src/series/publication.lisp" :SOURCE-SHA256
    "5de121c83ea6bd1243e420d9d898102aebb054cd1fa7ac79fcde9bf0792a95d8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/series/publication.fasl"
    :FASL-SHA256
    "d85a3d98718234ac37072a30a141f43f5dba6eafab1c9f07dc3f752d81b3b3d4")
   (:FILE "src/series/package.lisp" :SOURCE-SHA256
    "9a402f5225860c483dec9064a84d6462d28f5377a27977a63f64a5fbdbdd3764" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/series/package.fasl"
    :FASL-SHA256
    "f7eaa5bc277b831b9a50ce2d73ac1f0a70515913a8e5f5d2fa1b76a614d559bb")
   (:FILE "src/series/ownership.lisp" :SOURCE-SHA256
    "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/series/ownership.fasl"
    :FASL-SHA256
    "524e9e437b3d38d467b7a6668a3d49871d4a1040596b27b0865467024fbf89ba")
   (:FILE "src/series/io-events.lisp" :SOURCE-SHA256
    "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/series/io-events.fasl"
    :FASL-SHA256
    "03e58aaa544f0fa6817c3adf9812b8cbdf06e7dfc098e02dbc61cbc32783d4e8")
   (:FILE "src/series/events.lisp" :SOURCE-SHA256
    "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/series/events.fasl"
    :FASL-SHA256
    "3b2c64e6cffacf0d3565fa3cc34f111ac4bbb99827cffbc39a6a5b77f521b337")
   (:FILE "src/scheduler/update.lisp" :SOURCE-SHA256
    "e35a704ee0b9445c559a768de048169a8e39837a6df21843d8df58215c482472" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/scheduler/update.fasl"
    :FASL-SHA256
    "3fc6b52c9b5c8e7e5a762e35da6f3e4a7f9a6d0629de308a270706120e696ccd")
   (:FILE "src/scheduler/types.lisp" :SOURCE-SHA256
    "3b174be0919f8b27312ada4071d831c3753d62bb12be99d7e9394c48dcab474a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/scheduler/types.fasl"
    :FASL-SHA256
    "6f14b8301481c379b9421eef92a1fd896b339df0f2ae619ad1522778ddcdc92b")
   (:FILE "src/scheduler/read.lisp" :SOURCE-SHA256
    "5cdc1e5b7ba97c9aab66a5acaf74336b0df33144e24104e0242b7fc2552a1ae2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/scheduler/read.fasl"
    :FASL-SHA256
    "5edbf382d86f9a5176abefcf555d8c025455279284c9743af8e570a152daf9e7")
   (:FILE "src/scheduler/pool-claim.lisp" :SOURCE-SHA256
    "e384f6091a5fcb506e718e12e77b06ab8dd4233a41024bc57ca3b14425e10b14" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/scheduler/pool-claim.fasl"
    :FASL-SHA256
    "f99bdf66069d91d7da4ef9be7761a310ba48c70ad375882c4b16ddde46891af5")
   (:FILE "src/scheduler/policy.lisp" :SOURCE-SHA256
    "92b3ca3a81ae0b3ac342a63e5fe5c5d7524091a63065b0232c14c57ee80c4aac" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/scheduler/policy.fasl"
    :FASL-SHA256
    "471bbdf39cdd785ceffcce9cb8d5195c7930933f0e7e0e9fcb7509bdd9e08d27")
   (:FILE "src/scheduler/package.lisp" :SOURCE-SHA256
    "a44fd2c3d435e1f6729bf861b6caeb54a184f31c92e7909aad9c18b491f03cdf" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/scheduler/package.fasl"
    :FASL-SHA256
    "37f38ce0b04113e4796c5efa945201a709bb003ff909e042ac0a85f1d1a5cbe1")
   (:FILE "src/scheduler/lifecycle-worker.lisp" :SOURCE-SHA256
    "ec8b462ff3f5f7a6435f0f0c01b62034d8de2a784a9e354d469a0adfec9cf837" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/scheduler/lifecycle-worker.fasl"
    :FASL-SHA256
    "734384f54f47779c40ad78f27c0e82483a6e266a483add3920ea25088d541c62")
   (:FILE "src/scheduler/lifecycle-update.lisp" :SOURCE-SHA256
    "2020e46809e9fe8fa74e061a420b8085679d5f461eabd8b044f3975c1024800e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/scheduler/lifecycle-update.fasl"
    :FASL-SHA256
    "8ef59f5c55b504b35762b202290ac49b4d28e56ef7e7cd4418e28a230feb4bf3")
   (:FILE "src/scheduler/lifecycle-types.lisp" :SOURCE-SHA256
    "4fe980e00f1d273e9b8278cd2daace6b4a9e4ab948ddfac83b79f4b0c537cb7c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/scheduler/lifecycle-types.fasl"
    :FASL-SHA256
    "d45f120d379de91366de16e3ff3bbd9e4f7b2b48543412f534a4523cb6282584")
   (:FILE "src/scheduler/lifecycle-read.lisp" :SOURCE-SHA256
    "c60e1d5f67eeafb216b374fa001d27f87d1a734c5d066fc092902c0301069200" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/scheduler/lifecycle-read.fasl"
    :FASL-SHA256
    "7674663b56077ba8ecb7e4f63b9802d25af49fe8b2bbb35c6ad99a15d32701be")
   (:FILE "src/scheduler/lifecycle-build.lisp" :SOURCE-SHA256
    "d6d67faf8721f26e7fcd228d6ab9a7dfdc36ff5ec56c67ed9e5fb6d914006a9e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/scheduler/lifecycle-build.fasl"
    :FASL-SHA256
    "0ebf53983fafb3076ce7fe3fcfc4ca816a9915e13a94a8ae4aaee8242210179d")
   (:FILE "src/scheduler/build.lisp" :SOURCE-SHA256
    "58baf595f221826c64e3fb38344242c3bdf403d65904193bf1a8e06e09d7c336" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/scheduler/build.fasl"
    :FASL-SHA256
    "ab2bc9dde8e930b94d86f91f73ccd2509301921538365c5685c0d003c54ffa47")
   (:FILE "src/recovery/scan.lisp" :SOURCE-SHA256
    "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/recovery/scan.fasl"
    :FASL-SHA256
    "f71fcd9655eca19c123105aab6e21394857319d32514b8b97b9f62c29d421b89")
   (:FILE "src/recovery/package.lisp" :SOURCE-SHA256
    "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/recovery/package.fasl"
    :FASL-SHA256
    "7d52dfc82118018a966d458107bd465da27d6838aa184ddc02b5fd0b6338d63b")
   (:FILE "src/recovery/manifest-types.lisp" :SOURCE-SHA256
    "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/recovery/manifest-types.fasl"
    :FASL-SHA256
    "7baa88b41a387b0d47589211254556867c7109908936cf85824345e34391f7a6")
   (:FILE "src/recovery/manifest-query.lisp" :SOURCE-SHA256
    "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/recovery/manifest-query.fasl"
    :FASL-SHA256
    "185b497a8ed04320e77b9f090afe30a605a40ec6bd6e167d29f9d1b83e4f58a0")
   (:FILE "src/recovery/manifest-package.lisp" :SOURCE-SHA256
    "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/recovery/manifest-package.fasl"
    :FASL-SHA256
    "b6c4aa38bdb06ea051ed26ceb30a3f44828d432c0812c87c7e03813edbe2c120")
   (:FILE "src/recovery/manifest-fold.lisp" :SOURCE-SHA256
    "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/recovery/manifest-fold.fasl"
    :FASL-SHA256
    "a98e3a58a6e85d3d1fc8d6152209e3f0f2d59209a030dd7c0b23a52df6c53b10")
   (:FILE "src/recovery/manifest-decode.lisp" :SOURCE-SHA256
    "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/recovery/manifest-decode.fasl"
    :FASL-SHA256
    "95d9eafd1c036908319740ec2be0b84ceea79cc607883fd6064b0127f43ada1d")
   (:FILE "src/recovery/manifest-build.lisp" :SOURCE-SHA256
    "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/recovery/manifest-build.fasl"
    :FASL-SHA256
    "1e8840d3825b83b2fa1e7115506482f6828616236e7d2d692a47c1684957c291")
   (:FILE "src/recovery/inventory-types.lisp" :SOURCE-SHA256
    "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/recovery/inventory-types.fasl"
    :FASL-SHA256
    "093a241867b83823126a816dc7fa42db279f4d1e83c1e473b772a0097d47783b")
   (:FILE "src/recovery/inventory-query.lisp" :SOURCE-SHA256
    "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/recovery/inventory-query.fasl"
    :FASL-SHA256
    "2b008fdf8b9bdf0ad38799709964f86369546122c2e9abff82eb7215834d2b47")
   (:FILE "src/recovery/inventory-build.lisp" :SOURCE-SHA256
    "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/recovery/inventory-build.fasl"
    :FASL-SHA256
    "4244bb2cb9583f8855b638bc0d70f7dfe4fcb5267a8cc42b3cc261c47ddf856d")
   (:FILE "src/recovery/decisions-types.lisp" :SOURCE-SHA256
    "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/recovery/decisions-types.fasl"
    :FASL-SHA256
    "c1f05442f4e9b2d18d9160f17bf96429ddfbe6e84c29ce83d24d15f99d95cd59")
   (:FILE "src/recovery/decisions-sort.lisp" :SOURCE-SHA256
    "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/recovery/decisions-sort.fasl"
    :FASL-SHA256
    "547598f417642c4574bd4887500932d51199d75e9dd11e9397b12d20f72ea30c")
   (:FILE "src/recovery/decisions-radix.lisp" :SOURCE-SHA256
    "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/recovery/decisions-radix.fasl"
    :FASL-SHA256
    "61546976cef17bc3b17ab358211edda5bcffa23d04b6948e9a8193c4a10da04d")
   (:FILE "src/recovery/decisions-query.lisp" :SOURCE-SHA256
    "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/recovery/decisions-query.fasl"
    :FASL-SHA256
    "75e56d6055ca47e85ee7d7cc7e781c06c438ecbe649c86622e9726dcd088a858")
   (:FILE "src/recovery/decisions-package.lisp" :SOURCE-SHA256
    "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/recovery/decisions-package.fasl"
    :FASL-SHA256
    "5e5dabeebf162da38a6ec2d6d939c2790cfeccbbd8ae534f51d776f5795156d8")
   (:FILE "src/recovery/decisions-build.lisp" :SOURCE-SHA256
    "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/recovery/decisions-build.fasl"
    :FASL-SHA256
    "9d689d1cd041d03bced5d37068197c2512748b6a8142cf89d457aaf7228b0ff2")
   (:FILE "src/read/types.lisp" :SOURCE-SHA256
    "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/read/types.fasl"
    :FASL-SHA256
    "a51c706ec6ff3bbb44a21827aa6010d7a5226c001832585e999c09decc7a4d17")
   (:FILE "src/read/task.lisp" :SOURCE-SHA256
    "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/read/task.fasl"
    :FASL-SHA256
    "23a8407c3b41e85a0676a2f04ca6efd94fa4521aa9811b0027ecb8baeeec3c7b")
   (:FILE "src/read/package.lisp" :SOURCE-SHA256
    "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/read/package.fasl"
    :FASL-SHA256
    "bf32067d1e2e73bda2c706593e8024928a833eee3e6274f74f135e388a62121c")
   (:FILE "src/read/core.lisp" :SOURCE-SHA256
    "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/read/core.fasl"
    :FASL-SHA256
    "1dcc38a3ab25cf6fc60a8c337fcab67db2ff6e8993f547883b284b3303b701e1")
   (:FILE "src/package.lisp" :SOURCE-SHA256
    "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/package.fasl"
    :FASL-SHA256
    "cc092d7b54d5e24b544fc408a54ad25e379102944f7128f967235381551904a7")
   (:FILE "src/mvcc/types.lisp" :SOURCE-SHA256
    "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/mvcc/types.fasl"
    :FASL-SHA256
    "bc27f7941d031dde6df45d4ab38d2dad8cfb99d65b2429b1670936f01cc154e6")
   (:FILE "src/mvcc/snapshots-types.lisp" :SOURCE-SHA256
    "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/mvcc/snapshots-types.fasl"
    :FASL-SHA256
    "7459caebc40afe6a1af2c641203f2146981d9d93a510743e125dcccbfa3b777c")
   (:FILE "src/mvcc/snapshots-register.lisp" :SOURCE-SHA256
    "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/mvcc/snapshots-register.fasl"
    :FASL-SHA256
    "27f103ae61bd54f96ee68e6f356e425efb599fe26e3e03ab977827a8a7771d88")
   (:FILE "src/mvcc/snapshots-read.lisp" :SOURCE-SHA256
    "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/mvcc/snapshots-read.fasl"
    :FASL-SHA256
    "db1f2e859fdd81ab99673413778db9f6ff0c10d9bc7210652a6efe95e8afd2bc")
   (:FILE "src/mvcc/snapshots-lifecycle.lisp" :SOURCE-SHA256
    "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/mvcc/snapshots-lifecycle.fasl"
    :FASL-SHA256
    "b25282e458ffa9a61269b3cfb9f6da49b3e16d31a882bb5a6abe762b9e259f30")
   (:FILE "src/mvcc/snapshots-csn.lisp" :SOURCE-SHA256
    "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/mvcc/snapshots-csn.fasl"
    :FASL-SHA256
    "ed1711b038b47841a277c256321ea4915efccd61297f23a534427be05f2af471")
   (:FILE "src/mvcc/snapshots-core.lisp" :SOURCE-SHA256
    "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/mvcc/snapshots-core.fasl"
    :FASL-SHA256
    "e84ec3de0c736c5a06383605ec5873752dcf8b1ac1ae08626f68622a14a8e7d0")
   (:FILE "src/mvcc/package.lisp" :SOURCE-SHA256
    "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/mvcc/package.fasl"
    :FASL-SHA256
    "df0506e4bdbdbc64b4b0ca10a114adea5241ba4e4cf8d1d3047350193b89c952")
   (:FILE "src/io/types.lisp" :SOURCE-SHA256
    "68df36ae5167c975261f99d63a6598bca1fe93caca02f39e18812e94fcf1b233" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/io/types.fasl"
    :FASL-SHA256
    "7d2a0728c054f624bf998bf1a4771cf30b6e5c31e7d1f9409eba8040354d5c94")
   (:FILE "src/io/transfer.lisp" :SOURCE-SHA256
    "c807f294d0211e8433f8f0332ab6ba3ce7d9ae7de3818f43af7ff8d7fcfd341a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/io/transfer.fasl"
    :FASL-SHA256
    "e72f8ba0de2ebd690721c2001005ce342b987cdbc2f3e772d2749edf8646cbe1")
   (:FILE "src/io/rename.lisp" :SOURCE-SHA256
    "ef9475701a2da4a44d98f9c88a1f547f3be1f07c649c8c3c956c206c80a55598" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/io/rename.fasl"
    :FASL-SHA256
    "bc667b8d07b2f6f92224e2a768e608c7792e5e98c211ffdcd3a7330a36d3ae12")
   (:FILE "src/io/package.lisp" :SOURCE-SHA256
    "605f51109d723267b326c012602a91e7deff984a040c3440d90665b853e3549c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/io/package.fasl"
    :FASL-SHA256
    "2ad2df9988efa7bd1fb857b4c3e3ad463a13355ba992bc492f71a91da34bb551")
   (:FILE "src/io/native.lisp" :SOURCE-SHA256
    "74f63dbb2137a344054e82c6707e6262473b3332ff66a85f79ecfee9fd50f9b4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/io/native.fasl"
    :FASL-SHA256
    "0a6e7a96c2788d84098ae8caffb8249bc88e4d0171d5f17d5247840a84a0c291")
   (:FILE "src/io/native-namespace.lisp" :SOURCE-SHA256
    "3a7ada1ffe09c94714629a3679bf26a56bd5570ff3bf06acbce4be83750a47ad" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/io/native-namespace.fasl"
    :FASL-SHA256
    "6e05e093224b9395694ea8cb421d3acbc55d40f84c972845e3cf29bc61ad7dad")
   (:FILE "src/io/namespace.lisp" :SOURCE-SHA256
    "f23b46209fa87bee4deee84dbe3d87bc7a20d0a4f98bdafe7d40391fc42e1b59" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/io/namespace.fasl"
    :FASL-SHA256
    "4bdd66c5b5c73f0bcc90251979d48d37c56a75791f6a5b04ea099330a7c42e07")
   (:FILE "src/io/lifecycle.lisp" :SOURCE-SHA256
    "88e72ad54b8c8048358cbca2d136c62883d8e700d63d92e807cb14df0082ae6a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/io/lifecycle.fasl"
    :FASL-SHA256
    "a200af805520664f1d08134d01f0e372bd7b3d7c9819183e05e75a245fdb5e56")
   (:FILE "src/io/identity.lisp" :SOURCE-SHA256
    "d2b6f7932b66f2ef74241e573ed253cf9b710f217cd570ef23f6671614d90a2c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/io/identity.fasl"
    :FASL-SHA256
    "2f43cb1aaa3b9284a2c5483ac1dd7ed59a369b571f59154494eeb9f7991bfd0e")
   (:FILE "src/io/identity-types.lisp" :SOURCE-SHA256
    "5794dd5094f34c24e7e09e4a7937f1988d85ea9cd37e478abaf836273da5d5c1" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/io/identity-types.fasl"
    :FASL-SHA256
    "27166ba11e62e1307b1b6a4c001f0ae3783786e39bbc050a498f3f1f46a87bd5")
   (:FILE "src/io/flush.lisp" :SOURCE-SHA256
    "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/io/flush.fasl"
    :FASL-SHA256
    "05debbdb95b452037f7d1669a7fe93a7db9f22d8e160d9abf5aecb7074c8c7e5")
   (:FILE "src/index/write.lisp" :SOURCE-SHA256
    "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/index/write.fasl"
    :FASL-SHA256
    "c56794c8f895787bf359d599fa875028e154694e23afe2fb78518be6e0709d89")
   (:FILE "src/index/validation.lisp" :SOURCE-SHA256
    "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/index/validation.fasl"
    :FASL-SHA256
    "f407b5694ea3f9b9414f6e829cc62b0a723f012d5dc5b7faa1f62cf65f3150d0")
   (:FILE "src/index/types.lisp" :SOURCE-SHA256
    "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/index/types.fasl"
    :FASL-SHA256
    "64284ef7dd973869bd7f55114b7c8b982298c92d91a74ddd588fd76a1a3bfb75")
   (:FILE "src/index/relocate.lisp" :SOURCE-SHA256
    "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/index/relocate.fasl"
    :FASL-SHA256
    "2f99affdaf04024e0b76a0ee603f9de686142e4bfbbf24c1be7d52a757a75237")
   (:FILE "src/index/rebuild.lisp" :SOURCE-SHA256
    "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/index/rebuild.fasl"
    :FASL-SHA256
    "f8aa21a917d8ded33110c2b46164c632ec121eb9b0b865c0d89465a88bb22ac3")
   (:FILE "src/index/rebuild-scan.lisp" :SOURCE-SHA256
    "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/index/rebuild-scan.fasl"
    :FASL-SHA256
    "99cdae17765609b91e31fc0826f3393a1786fa9d848b6a0da6c85c225a9839a7")
   (:FILE "src/index/rebuild-copy.lisp" :SOURCE-SHA256
    "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/index/rebuild-copy.fasl"
    :FASL-SHA256
    "9f6141351a2d93bf61cf82b2c14499fea65d39d4c5ff16402c9932430aed62f1")
   (:FILE "src/index/rebuild-budget.lisp" :SOURCE-SHA256
    "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/index/rebuild-budget.fasl"
    :FASL-SHA256
    "a6ac6ccf33c448ff844a585cf8213c26d2d64679eb8d518d85795215ff6be263")
   (:FILE "src/index/read.lisp" :SOURCE-SHA256
    "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/index/read.fasl"
    :FASL-SHA256
    "93d5df80559981bc9a2396a8dce2e01ff96e46088411924aec15574215635e10")
   (:FILE "src/index/primary-write.lisp" :SOURCE-SHA256
    "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/index/primary-write.fasl"
    :FASL-SHA256
    "c80e8406a1f188b190f648b7d1d8f04fa11b44551925d532a2ad700462ca5563")
   (:FILE "src/index/primary-types.lisp" :SOURCE-SHA256
    "f17ca0dcd8a538b921f00044e23872b28272638c4435eacd30f0509422505e64" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/index/primary-types.fasl"
    :FASL-SHA256
    "6e994249b815a85bf44e2bc6cf95a9d13d1e2447137e05f6dcd5ce2578d6f9d5")
   (:FILE "src/index/primary-relocate.lisp" :SOURCE-SHA256
    "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/index/primary-relocate.fasl"
    :FASL-SHA256
    "ff947f6fbadf04e1f49d9f739e6355c4f87d75564b80ba3187dd06a20c99f898")
   (:FILE "src/index/primary-read.lisp" :SOURCE-SHA256
    "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/index/primary-read.fasl"
    :FASL-SHA256
    "e91794df2283616f722b59e7d350b355af07b0c6ac80c3fd57d6fd08a56d888f")
   (:FILE "src/index/primary-probe.lisp" :SOURCE-SHA256
    "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/index/primary-probe.fasl"
    :FASL-SHA256
    "260591e6a862d1385dce261626b98f506c3d4f62741f67a10738075838985218")
   (:FILE "src/index/primary-package.lisp" :SOURCE-SHA256
    "0682eb9a61596506b6788bd0285f9808db2496246caae64ab3203182ed46b860" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/index/primary-package.fasl"
    :FASL-SHA256
    "c4304d7343fa6b7ad834fde4f96367368634139a2fee4b3c56053a4ba8e0fd0a")
   (:FILE "src/index/primary-directory.lisp" :SOURCE-SHA256
    "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/index/primary-directory.fasl"
    :FASL-SHA256
    "cb6056ac2cda22c7c875d163b36e548b5d23cc513dfad401209f185ed11d9f22")
   (:FILE "src/index/primary-core.lisp" :SOURCE-SHA256
    "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/index/primary-core.fasl"
    :FASL-SHA256
    "dc78721f6218b259bd682cd6c8caadec8832a50f42b070e3fc818144beb60830")
   (:FILE "src/index/primary-build.lisp" :SOURCE-SHA256
    "06ca5ac8c03504e2d2f973873e5cabf7518c090cd1f8f2118c46e0ea2f9bf37b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/index/primary-build.fasl"
    :FASL-SHA256
    "2213624643317e54a3887b8f312e75420b8f2f75556908bed198f4256916d42d")
   (:FILE "src/index/primary-arena.lisp" :SOURCE-SHA256
    "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/index/primary-arena.fasl"
    :FASL-SHA256
    "147952a99cef6d2bf72f8f93490e1380f6457573530c9e5d962e4f3581279807")
   (:FILE "src/index/package.lisp" :SOURCE-SHA256
    "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/index/package.fasl"
    :FASL-SHA256
    "43576ce251e39b4e98f3c35644fff0e99a8c1fc1eac6eb9e30627bca096ff858")
   (:FILE "src/index/hash-seed.lisp" :SOURCE-SHA256
    "ae86514101e95737747ba58a4f0c5dc1ddb44d2b3a18bceb8fd0d0756b57a7a1" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/index/hash-seed.fasl"
    :FASL-SHA256
    "e2c389664e24c59969f21e91adc47918299e22234290ea7e7336e8c408f3788d")
   (:FILE "src/index/hash-digests.lisp" :SOURCE-SHA256
    "924bb7dab91ff56c1e909f2b06dff5f74b443ac6442e379498f29b25f1fa2673" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/index/hash-digests.fasl"
    :FASL-SHA256
    "1d697f0325791af176beb9754ef86fad3b8e1bb435857403471996d71c9d1596")
   (:FILE "src/index/core.lisp" :SOURCE-SHA256
    "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/index/core.fasl"
    :FASL-SHA256
    "16784560bb78133af79bfa1ca3a2ee288499136feaf88ac0c4fcb3948cb5d88e")
   (:FILE "src/hash/package.lisp" :SOURCE-SHA256
    "1e7668fa26fc1a8e3b3cfe824aa3e08b30b57441d5f90d44453fc3a9259a10d0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/hash/package.fasl"
    :FASL-SHA256
    "0f22112a1153a19076af4a371d4b29204c951c81591b301a11abe9c5b7f46a31")
   (:FILE "src/hash/hash64.lisp" :SOURCE-SHA256
    "99e4c8394a8f877ce1f552f15a57a082c0ec81015e87119ee4ffea28cf3ae77f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/hash/hash64.fasl"
    :FASL-SHA256
    "35072112026682bd40eec58d46deca3bd94331030ce216812afaa9d00f7b6ce5")
   (:FILE "src/hash/blocks.lisp" :SOURCE-SHA256
    "5f5dff95ae6c34dfc15538c537ba2fa8d34ba2376ad66ad9975745ea13a2175f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/hash/blocks.fasl"
    :FASL-SHA256
    "059963469592581dbec2ca642c661e1f431b38d438291366c778976b24ef6446")
   (:FILE "src/hash/arithmetic.lisp" :SOURCE-SHA256
    "c439e534b768acb123d69b921b85e1e56683aa8335bbc87efba95fe95f256fa9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/hash/arithmetic.fasl"
    :FASL-SHA256
    "08889d9920b027cf8eb00d58083f40a6bce70547081eb772937058999fd1e8ae")
   (:FILE "src/get/types.lisp" :SOURCE-SHA256
    "653b23a6e719cd1f55e7c58b4d7e8143aec5983992ba210d0eac1f4c8682f623" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/get/types.fasl"
    :FASL-SHA256
    "c618e4ef01d545786c15bf9b246802c32b76e3d2912de28d243866e8d780e4c9")
   (:FILE "src/get/target.lisp" :SOURCE-SHA256
    "9f682f735e49108cad176a6143ec99e1be64da98f29cae0b52f9b49cdea34250" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/get/target.fasl"
    :FASL-SHA256
    "3b7860411ce66514c76e0e836ae69ce3498a2909f0ba89448b1ff2e50ce4d62b")
   (:FILE "src/get/segment.lisp" :SOURCE-SHA256
    "4a486528cb2c1cc3471cb4b332d4314d24011889e1f885db6fd5600bb077eea3" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/get/segment.fasl"
    :FASL-SHA256
    "de8c9a8712461cd9eb1c4d849005ee09b417b1de688da8436e8bf9b4b61c473e")
   (:FILE "src/get/package.lisp" :SOURCE-SHA256
    "87b795779aef0c4b918a039d182daddd22b902a9ad10c763df4364b7e630151c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/get/package.fasl"
    :FASL-SHA256
    "c698641cfb8fb5a4c57bc16c93410517ab75e84d99da53c580583f52e86fca66")
   (:FILE "src/get/lookup.lisp" :SOURCE-SHA256
    "9d1042d4cf1e7bd9c6d1153de12b2459e7a2724e47bd32534cd7ae56cb274c5f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/get/lookup.fasl"
    :FASL-SHA256
    "39b29477fe62aaaa9fcd094179dd678160b495bac92926c849a8cb7e7acf82e6")
   (:FILE "src/get/lifecycle.lisp" :SOURCE-SHA256
    "885ba4141114ea411cac37c9b5f924aaa7f9f2a5ba311ebf92a392e5da1e3c59" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/get/lifecycle.fasl"
    :FASL-SHA256
    "a593a72ae35f01b69ee84429a7f3eb84d46a01e9e7f84260cb2c70399f1df36d")
   (:FILE "src/get/build.lisp" :SOURCE-SHA256
    "bcfc4916e9a85833dc151c4ce176bc905f2c03b6bc6d636f97a60df0d8c16739" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/get/build.fasl"
    :FASL-SHA256
    "1267d767c08b12dda2c9e9374b647eb9b63e48b08de113de1ce2dddd7d912a1d")
   (:FILE "src/get-resolver/types.lisp" :SOURCE-SHA256
    "b847d6c388f4d052a2d707b7c410cc7c2ef60482fb5cd9ef384c016c31d1dc00" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/get-resolver/types.fasl"
    :FASL-SHA256
    "0f08ff4d31365c58a6c64912010291f52af8be46fc9f169f0e0c7cd30675ec3e")
   (:FILE "src/get-resolver/sort.lisp" :SOURCE-SHA256
    "974bf44efeb1cd26c5e9db0601aea295c8f1a18234894ad9d41938a2880e2255" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/get-resolver/sort.fasl"
    :FASL-SHA256
    "4c239c47109ea507ad7014c10e7193ce72da2f240e3e83f76f6da629a7fa4284")
   (:FILE "src/get-resolver/scan.lisp" :SOURCE-SHA256
    "35a1780c6bf66364ef94c4151fa91f02eebe359f0ca0639985d2a907fd9d512d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/get-resolver/scan.fasl"
    :FASL-SHA256
    "0f364e44c4f757b7f4c4fecdcefbac69a44e91c2e3ec4ca7f941815fb514ddcb")
   (:FILE "src/get-resolver/rows.lisp" :SOURCE-SHA256
    "d9db85d788006fc7ad1f9a7cdeef28b992605de7fac8c295dd7fdc51f5511854" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/get-resolver/rows.fasl"
    :FASL-SHA256
    "77be48f397fc92e4e5ed86d3a4c57965e93a029d34f743c6936c3fdbfe05127f")
   (:FILE "src/get-resolver/read.lisp" :SOURCE-SHA256
    "dd100bb17e15589124916767f8a690ae683ac8c462102c778639f917a5f1924d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/get-resolver/read.fasl"
    :FASL-SHA256
    "8a9aad3d0ad2a27c844ceff990c37888bfd3520eb1740119bae175e303420f74")
   (:FILE "src/get-resolver/package.lisp" :SOURCE-SHA256
    "663a5a15a630ed2b9042a3a3365598358df97d3dd1cd3d7610b283526281f39a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/get-resolver/package.fasl"
    :FASL-SHA256
    "e20c06f9415a0b7f2ac911e33f41c6bb27a0a81457b670bd5994944847eb9fc4")
   (:FILE "src/get-resolver/build.lisp" :SOURCE-SHA256
    "c649c80c2b510669fc1c0a7f15b3080b7fb46a3423a1e49db5bb9ff248176e0a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/get-resolver/build.fasl"
    :FASL-SHA256
    "33c28f8b3ea2ce586b50f049d3308995aca7a66870cb4edc4e3df22145f1b526")
   (:FILE "src/get-resolver/active-types.lisp" :SOURCE-SHA256
    "a3cb954a265b263e0e03d2f1a80824589670efbf89adcd69007987d26df2e29a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/get-resolver/active-types.fasl"
    :FASL-SHA256
    "cb87d8d951336b70c5f96a4ad6a39762db7c1e482902d3c88a10a6831aa59f24")
   (:FILE "src/get-resolver/active-scan.lisp" :SOURCE-SHA256
    "97dd4f59d4449334b113e9403a208007ed1a398a9b53f88bda3e3c0bbf3a1067" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/get-resolver/active-scan.fasl"
    :FASL-SHA256
    "ec49cfea608a74acb5916106fa1d92773a689a975ab90224dc5576ae65a16291")
   (:FILE "src/get-resolver/active-read.lisp" :SOURCE-SHA256
    "47630e5d42c785e39e15dd714177cd86159129a5391d82321385f92317bea659" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/get-resolver/active-read.fasl"
    :FASL-SHA256
    "4b7e7c76fc46c9bc36e61fb654ecfe29b33e6fbf2c49ed3b9817179daffa88d3")
   (:FILE "src/get-resolver/active-preflight.lisp" :SOURCE-SHA256
    "c8579a0917ec95c9c6a6c1f5fc706dc7cdf7702dbf487c76a6fe4582b77fc65c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/get-resolver/active-preflight.fasl"
    :FASL-SHA256
    "b8ee84aa0d09c408b71a7dacd28286331331d8517d7e37fd33822023a4ee14d7")
   (:FILE "src/get-resolver/active-init.lisp" :SOURCE-SHA256
    "2f9380674cf4b590b071ab9d769a4b79292f544d920c0fc5ff33146dde7686f6" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/get-resolver/active-init.fasl"
    :FASL-SHA256
    "d9ca01022dbf4b2e5d61cf02029d8a426f880070ed6d58c31936281c534e1e0d")
   (:FILE "src/get-resolver/active-directory.lisp" :SOURCE-SHA256
    "c2b9a9ac3209270e9949720473908460548430a8098c9199fb55d2317a87682b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/get-resolver/active-directory.fasl"
    :FASL-SHA256
    "d118c5627eb9f9f881543e84d20ab75c750a8f43f636e099d359f8849fe842f8")
   (:FILE "src/get-resolver/active-build.lisp" :SOURCE-SHA256
    "0eed95930d41c515965ae8ab0a14fbb94597a42ea38b86f205ea0938cf4631de" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/get-resolver/active-build.fasl"
    :FASL-SHA256
    "1e248c5c77b805f25c6cac315c9abbc621e42832e7160f9fb2e19e4fdbc7ccb9")
   (:FILE "src/get-directory/types.lisp" :SOURCE-SHA256
    "0e2348291a4994f45bd1f6fe5efdc66041d2fdce18641d1af11b6c850ed69b2b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/get-directory/types.fasl"
    :FASL-SHA256
    "7321b1d0c85fdb6130e25b638143d0271839126bb3351e2f48a89827e635bc0a")
   (:FILE "src/get-directory/sources-types.lisp" :SOURCE-SHA256
    "862342b07d6a8aae834aaf3da4149682fcd1dcbdae971adad640597583547099" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/get-directory/sources-types.fasl"
    :FASL-SHA256
    "9be9a82a0d7ebee771aa0e17eb0d42fc358f061ad75af96292037fa3b99f0359")
   (:FILE "src/get-directory/sources-read.lisp" :SOURCE-SHA256
    "ee4a3b81322fbd51ce928be0b73e9bc180af7ed39f936b68ec9a152dd2a180c2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/get-directory/sources-read.fasl"
    :FASL-SHA256
    "d50de4ab7854ef04f064ecace65d6cd54512091f10c1c972ab24b432e75bb8c3")
   (:FILE "src/get-directory/read.lisp" :SOURCE-SHA256
    "a2287eb7e91bed84f3727baaf81376bbe5bf5df15cde1ea268c6d2fa66fe0a5d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/get-directory/read.fasl"
    :FASL-SHA256
    "a163180f2780d3d45b94f0ae7b5c374e2d5addfee5032a0da024eef2ed5c758c")
   (:FILE "src/get-directory/package.lisp" :SOURCE-SHA256
    "e779202c8df502749a81d0c6f9f0d505d000e09231f3679b1a91303fbcbf36f9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/get-directory/package.fasl"
    :FASL-SHA256
    "622c69c66569923d62cfd155c0d000ead86213c256d1ab0ae2018b676ff5fd96")
   (:FILE "src/get-directory/build.lisp" :SOURCE-SHA256
    "9bebb3cd9d66a8ec2fd0c72ad828e00ab2347093642653da45ef263bc855f947" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/get-directory/build.fasl"
    :FASL-SHA256
    "c0f23a18f8b8bdf329c1800ca94bbd469d87a062c895b7bb09cb15d408b70304")
   (:FILE "src/foundation/record.lisp" :SOURCE-SHA256
    "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/foundation/record.fasl"
    :FASL-SHA256
    "c0072d75bb0c3ed4f5a1513693d1d2d2cce2143c46d169febabd152f8e1ac1d9")
   (:FILE "src/foundation/package.lisp" :SOURCE-SHA256
    "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/foundation/package.fasl"
    :FASL-SHA256
    "06438d9bf6c2d6775b9a755a81ed71ab848d389bd25aeaf0499d0085ec16764d")
   (:FILE "src/foundation/crc32c.lisp" :SOURCE-SHA256
    "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/foundation/crc32c.fasl"
    :FASL-SHA256
    "995a95d53ce915660161830427dfef7792ac10d666e7436478383be439df46fc")
   (:FILE "src/foundation/conditions.lisp" :SOURCE-SHA256
    "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/foundation/conditions.fasl"
    :FASL-SHA256
    "a4d98a1967b03bda9d6007411041fee9157555a5cf75866c298390cc5286e1fd")
   (:FILE "src/foundation/binary.lisp" :SOURCE-SHA256
    "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/foundation/binary.fasl"
    :FASL-SHA256
    "a05aa9b7cfa9e066c055af1b32ae8b1982a676d01986bde9bae26ae07c13dd03")
   (:FILE "src/foundation/batch.lisp" :SOURCE-SHA256
    "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/foundation/batch.fasl"
    :FASL-SHA256
    "e1e197cc1dab99ebf253729cb79b528828ff48953805748ca5f3ec8f0fa589aa")
   (:FILE "src/execution/writer.lisp" :SOURCE-SHA256
    "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/execution/writer.fasl"
    :FASL-SHA256
    "c05643892b6de111cf9e08129c36cf1424e67d3645546ff204d41da669518b11")
   (:FILE "src/execution/worker-types.lisp" :SOURCE-SHA256
    "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/execution/worker-types.fasl"
    :FASL-SHA256
    "2362296e88abd7dd10491076363ec6129df5a7eeb083cf35b39e6481c7c52088")
   (:FILE "src/execution/worker-run.lisp" :SOURCE-SHA256
    "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/execution/worker-run.fasl"
    :FASL-SHA256
    "338a5ebf85fb35d6707af7f2dc6a0f3f672555442a935355bb30b388906693b8")
   (:FILE "src/execution/worker-claim.lisp" :SOURCE-SHA256
    "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/execution/worker-claim.fasl"
    :FASL-SHA256
    "068f91bd418b86160c7642c489d157349fbb9365784c68af754d8758ef79cdb1")
   (:FILE "src/execution/worker-boundary.lisp" :SOURCE-SHA256
    "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/execution/worker-boundary.fasl"
    :FASL-SHA256
    "ebd4580a14649f7f241e0642bb08ccc030e45a865ccc055a08b99bca1edf74d9")
   (:FILE "src/execution/ready.lisp" :SOURCE-SHA256
    "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/execution/ready.fasl"
    :FASL-SHA256
    "1efb2aa63f2afa7349231da6af6bb00b0fd528b8490d2b3d0deeba7e02270a05")
   (:FILE "src/execution/ready-types.lisp" :SOURCE-SHA256
    "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/execution/ready-types.fasl"
    :FASL-SHA256
    "90537fc49db561466ae822fc7fc8616453a1538f0d03e6b0a5f581e4347b746e")
   (:FILE "src/execution/ready-recycle.lisp" :SOURCE-SHA256
    "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/execution/ready-recycle.fasl"
    :FASL-SHA256
    "662b41996b1d5c6bd5344058303ae5cfb01eb37dff1159f6292656ea8442ec4e")
   (:FILE "src/execution/queue.lisp" :SOURCE-SHA256
    "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/execution/queue.fasl"
    :FASL-SHA256
    "889a2e16797fb13c5a91009290bb38fea4c06ce3f1f6d488dd367c053d265eb4")
   (:FILE "src/execution/package.lisp" :SOURCE-SHA256
    "833e501e6ee6e3acb8a6d37139c4605a05e06c425a35318adbcf651aa2f9db30" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/execution/package.fasl"
    :FASL-SHA256
    "fcad84be6ed9c6f31c5381721c025c33292bb6a9ef796e283742434b042e1676")
   (:FILE "src/execution/handoff.lisp" :SOURCE-SHA256
    "3ce9f47008416f210173fd3a83ee7665b2103f26039d36e2601b31e5e3ebd72a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/execution/handoff.fasl"
    :FASL-SHA256
    "6a75855fc75a4ada874c88213bbba60f1214cd765ac00f33f73ed9040380b493")
   (:FILE "src/epochs/types.lisp" :SOURCE-SHA256
    "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/epochs/types.fasl"
    :FASL-SHA256
    "cff628e6c62fa36a8479dceead6fe6ae4464579f37fc1c890576ccac48566152")
   (:FILE "src/epochs/retire.lisp" :SOURCE-SHA256
    "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/epochs/retire.fasl"
    :FASL-SHA256
    "4d02381f956ca2b82555280257ad15c88b02bbd896852738cded371188e0f070")
   (:FILE "src/epochs/reclaim.lisp" :SOURCE-SHA256
    "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/epochs/reclaim.fasl"
    :FASL-SHA256
    "62c1224f8e1848d5891b71d5b6f988562cc77a1b321a6590d4b1352381839e96")
   (:FILE "src/epochs/read.lisp" :SOURCE-SHA256
    "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/epochs/read.fasl"
    :FASL-SHA256
    "079e04afb191c456222ac57c6696c37d5f6c63ecc0c319c63edc3960aeadc5f9")
   (:FILE "src/epochs/package.lisp" :SOURCE-SHA256
    "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/epochs/package.fasl"
    :FASL-SHA256
    "537dd87a63ce04da87137eb804dcee045115e4503e35e48c7fca56ca880f6618")
   (:FILE "src/epochs/core.lisp" :SOURCE-SHA256
    "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/epochs/core.fasl"
    :FASL-SHA256
    "6433873656efef041583daa7ec46ddbe2137a016b2aae5f1e717a711b1de6cce")
   (:FILE "src/dispatch/types.lisp" :SOURCE-SHA256
    "cc44882c565a89de08f5add79333868ebfca4fc3f97bf9104d36375d014d4720" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/dispatch/types.fasl"
    :FASL-SHA256
    "c054bca6524ce3c6374b18efb835ff2ed4407406968786b8d4b02baf01a7b7bd")
   (:FILE "src/dispatch/package.lisp" :SOURCE-SHA256
    "acb5fd19599e89e821a89bcca8f94064f33cdc71cdfcf204aadcd4fb52dd795f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/dispatch/package.fasl"
    :FASL-SHA256
    "64a6123405792bc958b7ce4664aa4ad9a3c8a9ab5387e796a79f6804f2f5ddba")
   (:FILE "src/dispatch/claim.lisp" :SOURCE-SHA256
    "224e4114b8b91affced874bea9c23cae5c79526e8ddae62e31a0cafcbb763682" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/dispatch/claim.fasl"
    :FASL-SHA256
    "c71cf9c872632f57e13c8c753f42b30269c6a024797394da138048bbfe6b6ad8")
   (:FILE "src/dispatch/build.lisp" :SOURCE-SHA256
    "c78d31a753db78baea520e9ea0cccf6e88cad9cca8bc75261a6ff26c2ac01fe5" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/dispatch/build.fasl"
    :FASL-SHA256
    "c6340f04701f7c4350bed80df86518722655348886de5adc48c1f3802f828c66")
   (:FILE "src/csn/registry.lisp" :SOURCE-SHA256
    "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/csn/registry.fasl"
    :FASL-SHA256
    "2c5482a1e16416ebacfbb3d40e080ba6f55e37be6ca8005b954654689d40e745")
   (:FILE "src/csn/package.lisp" :SOURCE-SHA256
    "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/csn/package.fasl"
    :FASL-SHA256
    "70efc679bbdd79b6288033c00222f371489a784448ab64ac2c45d647b2a4988a")
   (:FILE "src/control/types.lisp" :SOURCE-SHA256
    "ad2f45bcd44fed463d60b580a17d89192a1087177573b1633674ed68d252367d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/control/types.fasl"
    :FASL-SHA256
    "fa1cfd43d4bbca22f05b94f214571007b206cca0d00d4bcf5ebca4cf7aa31966")
   (:FILE "src/control/transfer.lisp" :SOURCE-SHA256
    "6e257bfb6ce8e6d11263cc6788de4fc35657a82e159af7b46341c3bb208e0275" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/control/transfer.fasl"
    :FASL-SHA256
    "00b70d49ceb6b229e995ea3bef3ca70f10d47fb19b873afdc44273ab1729e02c")
   (:FILE "src/control/publication.lisp" :SOURCE-SHA256
    "3f867f54309b0a2985660dd8145b100eb097c1d7fdfcd917c61d73d082009109" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/control/publication.fasl"
    :FASL-SHA256
    "513c8f5b054bbb7d639be9920b4168b351fbbe9ba1ecfb2607e2563959a593c9")
   (:FILE "src/control/publication-read.lisp" :SOURCE-SHA256
    "cfb12232748e62d1edef6896389e8d54057951c058ee43d70dd346b10c5f582e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/control/publication-read.fasl"
    :FASL-SHA256
    "7b5c9d7cd68cedf84c6ba07db9c6af6d93fb7d07ff7ebde3c524bf0f8a7ae851")
   (:FILE "src/control/prepare.lisp" :SOURCE-SHA256
    "1226996af2215e3ebf06265e48d43632a1642ccacd312fabd983c5f3bfa7536d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/control/prepare.fasl"
    :FASL-SHA256
    "da8758a62cea0b9ec00514c59c109ef057a09eca2ce088798be03866082673de")
   (:FILE "src/control/preflight.lisp" :SOURCE-SHA256
    "48326533ac0934cb3b1e3fc7657ef48f38912b6c08e9e38367301905f7711584" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/control/preflight.fasl"
    :FASL-SHA256
    "3fd93d2c95700eba57702786ac5beabbfaf441375d26bbd66c386e8f74b8d546")
   (:FILE "src/control/package.lisp" :SOURCE-SHA256
    "c6ca23c7b0a8cea48bec2b7017482802f2078b0d58414c6708fbfe5f7d46377d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/control/package.fasl"
    :FASL-SHA256
    "9740336d9971ebd0d5f71bdd493f62df7eab267e8846f0ae14f8266c854b9227")
   (:FILE "src/control/dependency.lisp" :SOURCE-SHA256
    "f328344e4824fd53d03a0476b45fb87efada43ddee895e13afd76ac44413d128" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/control/dependency.fasl"
    :FASL-SHA256
    "6285bd184f9457736d61070f15b2ec15405144ba7928b37b547f6c8b2f530777")
   (:FILE "src/control/build.lisp" :SOURCE-SHA256
    "1904e81a6cebbb178598a41e1b2283240fc21506781b1e31da407610ce0f519c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/control/build.fasl"
    :FASL-SHA256
    "7daaedf546233c657f86d27c1dded8efc4253e37ee6093c812cc3911789e580e")
   (:FILE "src/codec/utf8.lisp" :SOURCE-SHA256
    "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/codec/utf8.fasl"
    :FASL-SHA256
    "e57d1b9530c7f60f4a78e949566da5e4b114409f9ec18c479cf76442a172cb42")
   (:FILE "src/codec/package.lisp" :SOURCE-SHA256
    "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/codec/package.fasl"
    :FASL-SHA256
    "5c1a61e1263f17d064a65907ba5c69a5371f084e054dafcf4ac4f18e98378f2e")
   (:FILE "src/codec/cbor-write.lisp" :SOURCE-SHA256
    "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/codec/cbor-write.fasl"
    :FASL-SHA256
    "6d11930da88929617530fcd28cb343b48357ff247b38927f88791d64cf88a320")
   (:FILE "src/codec/cbor-string-write.lisp" :SOURCE-SHA256
    "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/codec/cbor-string-write.fasl"
    :FASL-SHA256
    "5d6b38124f52167b9da5c179b6579f7510bcf77c5abccb8d80cd6181fd3db623")
   (:FILE "src/codec/cbor-space.lisp" :SOURCE-SHA256
    "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/codec/cbor-space.fasl"
    :FASL-SHA256
    "519df6d94819f2fe9906c291fc651cce4a52d1b66e51d95c0305aadbac581eb7")
   (:FILE "src/codec/cbor-simple-write.lisp" :SOURCE-SHA256
    "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/codec/cbor-simple-write.fasl"
    :FASL-SHA256
    "2201283fd2edf836587f3633e717f2699f3f2a91b307213f7a7aa39243d526e7")
   (:FILE "src/codec/cbor-scan.lisp" :SOURCE-SHA256
    "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/codec/cbor-scan.fasl"
    :FASL-SHA256
    "e6a8bfa3e8f7c4e5c7bccbb10435ee800e2a7331fb3ff31cd598306fcd4213a6")
   (:FILE "src/codec/cbor-scan-stack.lisp" :SOURCE-SHA256
    "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/codec/cbor-scan-stack.fasl"
    :FASL-SHA256
    "92fbf40c194498cc77bb85ac3baef2093093c40a0fc9b84a9153d6b750e0e9d8")
   (:FILE "src/codec/cbor-scan-minimal.lisp" :SOURCE-SHA256
    "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/codec/cbor-scan-minimal.fasl"
    :FASL-SHA256
    "0ec79aa7bc44976ed5116bc15bd4a0403a4912e6ec05505c437d6e9f0ea472c3")
   (:FILE "src/codec/cbor-scan-items.lisp" :SOURCE-SHA256
    "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/codec/cbor-scan-items.fasl"
    :FASL-SHA256
    "91fd2f4c9f921131ad2622a8b521b69072a9c214046a46fcffdf8315528f484c")
   (:FILE "src/codec/cbor-scan-input.lisp" :SOURCE-SHA256
    "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/codec/cbor-scan-input.fasl"
    :FASL-SHA256
    "e881f89050df0da835dd34a7100e36f05cb9a95d7a68cf3aaa37f7f9163dd758")
   (:FILE "src/codec/cbor-package.lisp" :SOURCE-SHA256
    "f74f5d1cb0b71658aaeb36518530c2396d132a783cb58109788e434691acb503" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/codec/cbor-package.fasl"
    :FASL-SHA256
    "7319e1ae014bee58bf0e4a41cd220e77ff369fb0f8cddf3e17f8c464a0feebc3")
   (:FILE "src/codec/cbor-minimal.lisp" :SOURCE-SHA256
    "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/codec/cbor-minimal.fasl"
    :FASL-SHA256
    "088d9bd983206d5f752eddc21d593a1b0462f15d68483dccc3f628337767ada7")
   (:FILE "src/codec/cbor-header.lisp" :SOURCE-SHA256
    "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/codec/cbor-header.fasl"
    :FASL-SHA256
    "a7433f4615efd78660ecce0478f55c649de722639fc0a5033aad881dae755182")
   (:FILE "src/codec/cbor-float-write.lisp" :SOURCE-SHA256
    "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/codec/cbor-float-write.fasl"
    :FASL-SHA256
    "e36253fecb36562591adb9f8f3844150a336b48addadf1a286d44bb5d96d1038")
   (:FILE "src/codec/cbor-float-narrow.lisp" :SOURCE-SHA256
    "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/codec/cbor-float-narrow.fasl"
    :FASL-SHA256
    "03419dc477ea4ba41fd10e58259e3eb0ed9e7932cb07cee2d97e78f6e2ebeb60")
   (:FILE "src/codec/cbor-float-minimal.lisp" :SOURCE-SHA256
    "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/codec/cbor-float-minimal.fasl"
    :FASL-SHA256
    "c024da14260dc29c47f97fd9275db920f67ac6d78f6168d96b4e6e81e57bba3c")
   (:FILE "src/codec/cbor-array-write.lisp" :SOURCE-SHA256
    "2f71d857991f32aacf6c7a0ecbe5e06bcba9289b20f46e496b3e3737ce6c242b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/codec/cbor-array-write.fasl"
    :FASL-SHA256
    "2e1b1b8f8245e29911d9d280c2b1ae15eb4adb92cdc4baaa52b5cc9eb2c57fe6")
   (:FILE "src/codec/cbor-array-input.lisp" :SOURCE-SHA256
    "e36efda9d66f532b8221f898a078b7f77dc2a41cdc953ece0b2e08b4ed2417f4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/codec/cbor-array-input.fasl"
    :FASL-SHA256
    "9d0791d56af6fce9e788dfadacdcf948de25e32c7cdfd906f4fb6bcbf34455a2")
   (:FILE "src/cache/write.lisp" :SOURCE-SHA256
    "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/cache/write.fasl"
    :FASL-SHA256
    "02499cf93b1d04fd3640136ad434c2977702a03fe5bf8f0409c609edd4aff176")
   (:FILE "src/cache/types.lisp" :SOURCE-SHA256
    "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/cache/types.fasl"
    :FASL-SHA256
    "f739d02678dfda1f8fd96048fd4bca0c0ebf33737e7e8f155c4b7fa2c4f24248")
   (:FILE "src/cache/read.lisp" :SOURCE-SHA256
    "5700e43ae8ee859e96bdecb5953af43a712fd9e6ec23a53565759676bb07f85a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/cache/read.fasl"
    :FASL-SHA256
    "f23c7343228ea25b764ec573fba5b2a9d8d91c681862fe9a8470e10812447c03")
   (:FILE "src/cache/package.lisp" :SOURCE-SHA256
    "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/cache/package.fasl"
    :FASL-SHA256
    "b82037c11991e199ef36f29a5daf237c14e0905b8557197c90a19127e9a254eb")
   (:FILE "src/cache/core.lisp" :SOURCE-SHA256
    "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/cache/core.fasl"
    :FASL-SHA256
    "ccbfe292876e508e83df210051fe693041332d80fb65cb41f4deb7393e5ce721")
   (:FILE "src/cache/clock.lisp" :SOURCE-SHA256
    "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/cache/clock.fasl"
    :FASL-SHA256
    "6d2cf1631a987a53f8286d2f31bd545facb24884fe6f370e9c1346b4791d8031")
   (:FILE "src/cache/build.lisp" :SOURCE-SHA256
    "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/cache/build.fasl"
    :FASL-SHA256
    "470253e298d1c2671914ce689d4ba47730acedd07527c6718eebd1de77c6737c")
   (:FILE "src/active/types.lisp" :SOURCE-SHA256
    "48fe584096fc253ef182ab428c1887e443af06d75aaa938df660c77e60b39bfb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/active/types.fasl"
    :FASL-SHA256
    "7a5e8815b96718ef53334055caf58566a9ecc83d48444905b749f5f31f51abbd")
   (:FILE "src/active/source.lisp" :SOURCE-SHA256
    "ff96fe360b46190ecc08ee9e05a813715dc3399054f93693f9309012aec6547d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/active/source.fasl"
    :FASL-SHA256
    "627e7102be9b24f56d6a98331b7f4a12f10ccbb59b2b73b809b12aa01ce24a71")
   (:FILE "src/active/prepare.lisp" :SOURCE-SHA256
    "7b45fb01132c45c9bec76f374edaa8de91ac6bb2d61ae5c359e1fa10c6346f53" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/active/prepare.fasl"
    :FASL-SHA256
    "8a4fc0c89e6f9e6cc84195efa83050ceee931388cd4f48bbf7f48d5e69feaa74")
   (:FILE "src/active/preflight.lisp" :SOURCE-SHA256
    "ef7b592daecc223d78cbcda138b5938abc01593b486482bec06f2721cfd955a2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/active/preflight.fasl"
    :FASL-SHA256
    "f347faada5c89d2e0b05074a4f1e90be4a060227e98289e79b728d24a0494713")
   (:FILE "src/active/package.lisp" :SOURCE-SHA256
    "4a6fa4187ef5d44aec4e65d57ee6d6046485f283cc9009c1d94263bee745fa3b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/ignore-batch-file-id/fasl/src/active/package.fasl"
    :FASL-SHA256
    "b0033e0a843eac95018b92cb0bb433716416137606b425f02ab44f857e51d5ef"))
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
  (("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-WAL-005-ACTIVE-PREFLIGHT-BATCH-FILE-ID"))
  :REGISTERED-TESTS
  (("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-FOR-001-ACTIVE-SOURCE-CONFIGURATION-IDENTITY-AND-FD")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-FOR-003-ACTIVE-NATIVE-V1-V2-PUT-AND-TOMBSTONE")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-IDX-001-ACTIVE-TOMBSTONE-PAGE-ZERO-PUTS")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-WAL-005-ACTIVE-PREFLIGHT-IMMUTABLE-NO-CSN-OR-IO")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-AFF-008-ACTIVE-FIRST-PAYLOAD-EXACT-ONE-SHORT")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-AFF-008-ACTIVE-SECOND-PAYLOAD-PEAK-EXACT-ONE-SHORT")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-AFF-008-ACTIVE-PAGE-BUDGET-EXACT-REFUSES-NEXT")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-AFF-008-ACTIVE-PUT-BUDGET-EXACT-REFUSES-NEXT")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-AFF-008-ACTIVE-RECORD-BYTE-BUDGETS-EXACT-ONE-SHORT")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-FOR-004-ACTIVE-PREPARED-OUTCOME-REFUSED-BEFORE-CSN")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-CON-004-ACTIVE-ROOTS-PERSIST-AFTER-PUBLIC-BATCH-REUSE")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-AFF-001-ACTIVE-SEALED-CRC-FAULTS-ARCHIVE-PRESERVES-CAUSE")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-WAL-005-ACTIVE-PREFLIGHT-BATCH-FILE-ID")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-WAL-005-ACTIVE-PREFLIGHT-BATCH-VERSION")
   ("ARCDOCDB.GET.ACTIVE.TESTS" "TEST-REQ-WAL-005-ACTIVE-PREFLIGHT-EMPTY-OPEN")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-WAL-005-ACTIVE-PREFLIGHT-OPEN-TOKEN-BOUND")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-WAL-005-ACTIVE-PREFLIGHT-SEALED-REFUSED-WITH-TOKEN-PRESERVED")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-WAL-005-ACTIVE-PREFLIGHT-PREVIOUS-ORDER")
   ("ARCDOCDB.GET.ACTIVE.TESTS" "TEST-REQ-AFF-008-ACTIVE-PREFLIGHT-RING-FULL")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-AFF-008-ACTIVE-PREFLIGHT-EVENT-GENERATION-BOUND")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-WAL-005-ACTIVE-PREFLIGHT-CONTIGUOUS-OFFSET")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-AFF-008-ACTIVE-PREFLIGHT-SEGMENT-SPACE")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-AFF-008-ACTIVE-PREFLIGHT-RECORD-BOUNDARY")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-AFF-008-ACTIVE-PREFLIGHT-SEAL-BYTE-BOUNDARY")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-AFF-001-ACTIVE-PREFLIGHT-HEADER-CORRUPTION-FAULTS-ARCHIVE")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-AFF-001-ACTIVE-PREFLIGHT-OPEN-COUNT-FAULTS-ARCHIVE")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-IDX-001-ACTIVE-DIRECTORY-NIBBLE-TRANSITIONS-PERSISTENT")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-IDX-001-ACTIVE-DIRECTORY-65536-FINAL-CONVERGENCE")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-IDX-001-ACTIVE-DIRECTORY-MALFORMED-LOCAL-GUARDS")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-IDX-001-ACTIVE-DIRECTORY-OCCUPIED-APPEND-PRESERVES-GRAPH")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-FOR-003-ACTIVE-NATIVE-V1-V2-CSN-U64-AND-ORDINARY-FLAGS")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-CCH-002-ACTIVE-COLD-READ-AND-WARM-PROBE-AND-READ")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-WAL-006-ACTIVE-DURABLE-PLANNED-ROOT-CANNOT-AUTHORIZE-VALUE")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-WAL-006-ACTIVE-OLD-PUT-USES-OWN-PAGE-END")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-IDX-001-ACTIVE-HEADER-SEAL-TOMBSTONE-FRONTIER-AND-MISSING-ROW-FAULT")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-IDX-001-ACTIVE-CANDIDATE-CSN-LOW-AND-HIGH-WORD-MISMATCH")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-IDX-001-ACTIVE-CANDIDATE-WIRE-SIZE-AND-RESERVED-HIGH-WORD")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-CMP-007-ACTIVE-FOREIGN-SOURCE-OWNER-CLEANS-BEFORE-OUTER-UNWIND")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-CMP-007-ACTIVE-CLOSED-READONLY-FD-IS-TERMINAL-SOURCE-FAULT")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-CON-004-ACTIVE-THROW-AT-NATIVE-PREAD-CLEANS-WITHOUT-AUTHORIZING")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-CON-004-ACTIVE-SMALL-BUFFER-RESTARTS-AND-REACQUIRES-NEW-ROOT")
   ("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-MVC-004-ACTIVE-SNAPSHOT-EXPIRES-AFTER-PRIVATE-COPY"))
  :PASSED-TESTS NIL :FAILED-TEST
  ("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-WAL-005-ACTIVE-PREFLIGHT-BATCH-FILE-ID")
  :FAILURE-KIND :ASSERTION :SOURCE-MANIFEST
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
    "c8579a0917ec95c9c6a6c1f5fc706dc7cdf7702dbf487c76a6fe4582b77fc65c")
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
  "c25a52e08a3fc6bcb7dc5240d6d7c0998286cb9173ea4d1d6d6b695e66902b72"
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
    "c8579a0917ec95c9c6a6c1f5fc706dc7cdf7702dbf487c76a6fe4582b77fc65c")
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
 :EXIT-CODE 1 :SIGNAL NIL)
