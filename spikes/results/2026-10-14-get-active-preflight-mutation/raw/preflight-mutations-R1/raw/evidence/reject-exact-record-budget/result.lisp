(:DEADLINE-SECONDS 120 :ARGV
 ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--disable-debugger"
  "--script"
  "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/evidence/reject-exact-record-budget/driver.lisp"
  "--child"
  "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/evidence/reject-exact-record-budget/config.lisp")
 :EXECUTED-TESTS
 (("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-AFF-008-ACTIVE-PREFLIGHT-RECORD-BOUNDARY"))
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
 :NAME "reject-exact-record-budget" :FILE
 "src/get-resolver/active-preflight.lisp" :RESULT :DETECTED :STATUS :OK
 :COPY-DIRECTORY
 "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/"
 :EVIDENCE-DIRECTORY
 "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/evidence/reject-exact-record-budget/"
 :EXPECTED-FAILURE :EXACT-BUDGET-REFUSED :SUGGESTED-DETECTION-TEST
 ("ARCDOCDB.GET.ACTIVE.TESTS"
  "TEST-REQ-AFF-008-ACTIVE-PREFLIGHT-RECORD-BOUNDARY")
 :EXPECTED-TESTS
 (("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-AFF-008-ACTIVE-PREFLIGHT-RECORD-BOUNDARY"))
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
   "f42416d916d734e0f93fa56cf2632ef0aa882240acae0d7e1faccec964464db0")
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
   "f42416d916d734e0f93fa56cf2632ef0aa882240acae0d7e1faccec964464db0")
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
 "06e4fd3e25400ef7f025788baebbefa0b9a3a4aacc28473926df8179e6468f4e"
 :CONFIG-SHA256-AFTER
 "06e4fd3e25400ef7f025788baebbefa0b9a3a4aacc28473926df8179e6468f4e"
 :ARTIFACTS-VERIFIED T :CHILD-REPORT
 (:FINISHED-AT-UNIVERSAL-TIME 4000985429 :CONFIG-SHA256-AFTER
  "06e4fd3e25400ef7f025788baebbefa0b9a3a4aacc28473926df8179e6468f4e"
  :CONDITION-TYPE "RESOURCE-EXHAUSTED" :DIAGNOSTIC
  "ArcDocDB: ACTIVE-BATCH-RECORD-BUDGET" :CONDITION-REASON
  :ACTIVE-BATCH-RECORD-BUDGET :CONDITION-NAME "RESOURCE-EXHAUSTED"
  :CONDITION-PACKAGE "ARCDOCDB.CONDITIONS" :EXECUTED-TESTS
  (("ARCDOCDB.GET.ACTIVE.TESTS"
    "TEST-REQ-AFF-008-ACTIVE-PREFLIGHT-RECORD-BOUNDARY"))
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
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/wal/support.fasl"
    :FASL-SHA256
    "36331484d2dbcabb2cc5d0962084c66eb8631206fd729e5da2f10953ac435f44")
   (:FILE "tests/wal/native.lisp" :SOURCE-SHA256
    "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/wal/native.fasl"
    :FASL-SHA256
    "d33aba638b9125857da0f1ed3825b9ea65ba21990a190a839a71212dbce77907")
   (:FILE "tests/wal/group.lisp" :SOURCE-SHA256
    "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/wal/group.fasl"
    :FASL-SHA256
    "29a53cdf33c31de1836c0374afcaa8ecdd068ee99219fb61b42269db57ad0ba7")
   (:FILE "tests/wal/fault.lisp" :SOURCE-SHA256
    "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/wal/fault.fasl"
    :FASL-SHA256
    "a2806c0daab996fb4fe023ab67d281b5d1f9cf484d061e193d401110f1417e6c")
   (:FILE "tests/wal/csn.lisp" :SOURCE-SHA256
    "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/wal/csn.fasl"
    :FASL-SHA256
    "2af05482588b69840405a1702d66d5c9d069ac400795ae1809ee4e9a2188b338")
   (:FILE "tests/wal/csn-threads.lisp" :SOURCE-SHA256
    "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/wal/csn-threads.fasl"
    :FASL-SHA256
    "18ac5002fe20a3c731b3216b1f682df1bab0e9b488e1f7a60142403a5959ce75")
   (:FILE "tests/wal/builder.lisp" :SOURCE-SHA256
    "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/wal/builder.fasl"
    :FASL-SHA256
    "6fd5686319ed26e7de5a0590c8eef9e52266fc3603bf751bf127a981200ea00e")
   (:FILE "tests/storage/support.lisp" :SOURCE-SHA256
    "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/storage/support.fasl"
    :FASL-SHA256
    "efe3ac751e85be006fd7290f374c21af55342e51833b386f0279c269bc385173")
   (:FILE "tests/storage/segment-header.lisp" :SOURCE-SHA256
    "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/storage/segment-header.fasl"
    :FASL-SHA256
    "aa3555629cdb96e6d4682350e0cc33f2db9c709030d6bf7b7bdafe8a45cf3d61")
   (:FILE "tests/storage/log-header.lisp" :SOURCE-SHA256
    "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/storage/log-header.fasl"
    :FASL-SHA256
    "19f72090d23dc60d6ec475c6f433a1809b3eb7f20cb3031da03b43f093f68c0b")
   (:FILE "tests/storage/control-payload.lisp" :SOURCE-SHA256
    "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/storage/control-payload.fasl"
    :FASL-SHA256
    "d14cd30b5d8d6135d974ebd71548b44fecd5da257a37a0c516e61c4773cc2a9b")
   (:FILE "tests/storage/compaction-scan.lisp" :SOURCE-SHA256
    "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/storage/compaction-scan.fasl"
    :FASL-SHA256
    "08fdc2661079308af436007ef624778792e9dd5faa8524a9b7f7463134731404")
   (:FILE "tests/smoke.lisp" :SOURCE-SHA256
    "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/smoke.fasl"
    :FASL-SHA256
    "dbe7bcc6c97843c252093d5830ae3c01a60a4f025b05b7d4bc5d0f310cbc1e72")
   (:FILE "tests/series/worker-routing.lisp" :SOURCE-SHA256
    "f495d33f73e3249d1055ea61d65034033367de85edec3db2cac3a63ff449e3f9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/series/worker-routing.fasl"
    :FASL-SHA256
    "87baec5228d9d0a05cf4115e28ef861d5fc30fbc4d157537f4647a81c34dbc6c")
   (:FILE "tests/series/worker-bridge.lisp" :SOURCE-SHA256
    "c1ee49702e63978a83cb86c4e5bf437a5a40e48fa02b65d3eaf3dca0d2e39176" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/series/worker-bridge.fasl"
    :FASL-SHA256
    "9ce3e01fa7947417e84adffb2605d52ff112ae43dc349357c9724be3689447f1")
   (:FILE "tests/series/threads.lisp" :SOURCE-SHA256
    "b8fe9d7e1c0ca4e18909a0a6f7ac03c8df68dd186fa21e62600be685d6e4c7ae" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/series/threads.fasl"
    :FASL-SHA256
    "fd8f1d9acc52acc6ee90555e42c586282a4422af636d459ab269a228d5195d3a")
   (:FILE "tests/series/support.lisp" :SOURCE-SHA256
    "810dd8a69927c75e3399af47b8fff18e4ab88eb41049c50bafee5c041be263b3" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/series/support.fasl"
    :FASL-SHA256
    "c1b38847a884ad75f46e4f8d94b1f6f4e3199cb0b53624e57a162b9c4ed58f45")
   (:FILE "tests/series/controller.lisp" :SOURCE-SHA256
    "8bc98ec62e58803cab5613210e1200e0ce296af9aff63b5dff61579c3931670a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/series/controller.fasl"
    :FASL-SHA256
    "39fb48dd9766ae9704e79f41caaf005b9e02d3076c53a50ae8b2de1938a80d46")
   (:FILE "tests/series/boundaries.lisp" :SOURCE-SHA256
    "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/series/boundaries.fasl"
    :FASL-SHA256
    "b7bd5dc7a660d85b790925640c11a6079d8688b2414b34f9a2168e2f02a805f6")
   (:FILE "tests/scheduler/support.lisp" :SOURCE-SHA256
    "300234f9ac7931f8c8b9bf305498a2742a3b8868dd9158dbab8c7fdceed5a1e4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/scheduler/support.fasl"
    :FASL-SHA256
    "c2ec89705bc27170d06c4a1a5d62fbe239c895e5434201b7e119e215adc8501f")
   (:FILE "tests/scheduler/pool-claim.lisp" :SOURCE-SHA256
    "f968d57b6ff4dfc3cc31f1b1979afa896d95435093406b36320800783629901f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/scheduler/pool-claim.fasl"
    :FASL-SHA256
    "c00d1bf6a597aad29af81e1d493005e85419d872bdedccaa081edf3ed3ea9f9f")
   (:FILE "tests/scheduler/lifecycle.lisp" :SOURCE-SHA256
    "eff59c0cf6d9c6c1ddec57a4efa26a8fcaeedc850b77764b818bc1c22eb73e38" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/scheduler/lifecycle.fasl"
    :FASL-SHA256
    "fdbdcadaaf1569a08016a8af870003c3bff3884d61b18307256716cb76f7b437")
   (:FILE "tests/scheduler/dispatch.lisp" :SOURCE-SHA256
    "600eb0b5fdf9a52d020e2f4c638f0f3dba43d9d9711be73eaffff208578821eb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/scheduler/dispatch.fasl"
    :FASL-SHA256
    "6bef311a1fe9d9b42384db900ce55db1b418b9458d9a46153da28e136a9730a2")
   (:FILE "tests/scheduler/controller.lisp" :SOURCE-SHA256
    "e986e3facc9d1b9b4eab0d135259a61d7e0f188a7f268cb2e5ee5f9c700c40be" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/scheduler/controller.fasl"
    :FASL-SHA256
    "104037c52b3a2a64b1b9e94bff370cbf846722afa606101668da47501fb13d7c")
   (:FILE "tests/recovery/support.lisp" :SOURCE-SHA256
    "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/recovery/support.fasl"
    :FASL-SHA256
    "b2827aab843f999acbd120957d25e004846c9eaec24e00dc438c03b83e892eb4")
   (:FILE "tests/recovery/scan.lisp" :SOURCE-SHA256
    "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/recovery/scan.fasl"
    :FASL-SHA256
    "d60e66867b1fbd7452296e578fcf78bc4d553f39c53d89c2dbfc7495c9d41c69")
   (:FILE "tests/recovery/manifest.lisp" :SOURCE-SHA256
    "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/recovery/manifest.fasl"
    :FASL-SHA256
    "d02a29061454d35f10ab7939348bbb0f266983b272bb5a4e62cf230e955a7e49")
   (:FILE "tests/recovery/manifest-support.lisp" :SOURCE-SHA256
    "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/recovery/manifest-support.fasl"
    :FASL-SHA256
    "f8c59b92e4b0334d0d2dbc2830c5e6bcff65a10c015be4c8c771ea41b42beffc")
   (:FILE "tests/recovery/manifest-audit.lisp" :SOURCE-SHA256
    "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/recovery/manifest-audit.fasl"
    :FASL-SHA256
    "d00e1ad7fe6a2714228ada423cc7218db06945433a7278f83e85d2023cb06238")
   (:FILE "tests/recovery/inventory.lisp" :SOURCE-SHA256
    "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/recovery/inventory.fasl"
    :FASL-SHA256
    "53c86384ae90bbb25f120ef0ad771baffef8176f3b28ba8d914097bcbf299bb8")
   (:FILE "tests/recovery/inventory-support.lisp" :SOURCE-SHA256
    "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/recovery/inventory-support.fasl"
    :FASL-SHA256
    "f83de1786c58178e014da5ca9568c6ff02118aaf5f8ec78d8bd63a2a785e3b85")
   (:FILE "tests/recovery/decisions.lisp" :SOURCE-SHA256
    "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/recovery/decisions.fasl"
    :FASL-SHA256
    "b27088e224f1f40a6e1bbb06ac570ebbfc1e591d5377635cbb8af4bf892a9e6f")
   (:FILE "tests/recovery/decisions-support.lisp" :SOURCE-SHA256
    "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/recovery/decisions-support.fasl"
    :FASL-SHA256
    "9823cea7920836c34d1b91b79e1d92a9cb24cb65a47c334a4c5f50b9164be77f")
   (:FILE "tests/recovery/decisions-radix.lisp" :SOURCE-SHA256
    "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/recovery/decisions-radix.fasl"
    :FASL-SHA256
    "e13c4c797e900e4993480b6bba30af87dd5d4883a809d0371880bb5860408089")
   (:FILE "tests/recovery/decisions-audit.lisp" :SOURCE-SHA256
    "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/recovery/decisions-audit.fasl"
    :FASL-SHA256
    "bf5cc0399c3b6da30b499aec8f5a4aae112bf4b6c3d1790d931236a4f9d9b20c")
   (:FILE "tests/recovery/corruption.lisp" :SOURCE-SHA256
    "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/recovery/corruption.fasl"
    :FASL-SHA256
    "8bb21835e558cb78d149ebedfda5dddad0ca57cf5f412be967ff9a7e8b8c2c30")
   (:FILE "tests/read/threads.lisp" :SOURCE-SHA256
    "e2e223b69b08a5d76b9773c6ad4dee13ef2ddbb6f5ababa713cc5654bc7b51c5" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/read/threads.fasl"
    :FASL-SHA256
    "751cacf987deea4b80aab9ef862fe3c9b6761a5b79559ac7728aea46bf62f45b")
   (:FILE "tests/read/support.lisp" :SOURCE-SHA256
    "8095cc39d49342f6e43f3421b4fced839da02d8d11b4d8ddcd91bd346447e754" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/read/support.fasl"
    :FASL-SHA256
    "33e7cd597342377484c1803f41e96391b55c2b81cd78d91baf7ed8e20d59b67d")
   (:FILE "tests/read/lifecycle.lisp" :SOURCE-SHA256
    "c4c4642408816f2e0e809e21d04739b68b9391237e3e46ea0b195ed82857c3a8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/read/lifecycle.fasl"
    :FASL-SHA256
    "3ab636ab299bfe9bbe5bb5c489b9600f19b793cb20b410d5912791f9fe99e944")
   (:FILE "tests/mvcc/support.lisp" :SOURCE-SHA256
    "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/mvcc/support.fasl"
    :FASL-SHA256
    "68e5c4855daeb53dc738ca54f2bc42af00ad1f356e84377f1f61c679784e1deb")
   (:FILE "tests/mvcc/lifecycle.lisp" :SOURCE-SHA256
    "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/mvcc/lifecycle.fasl"
    :FASL-SHA256
    "b05b66b4ae0fa493332893f78c7b31948a6ac8f8a21f90f407ef791a5df42c45")
   (:FILE "tests/mvcc/capture.lisp" :SOURCE-SHA256
    "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/mvcc/capture.fasl"
    :FASL-SHA256
    "068885326eaeeacc69934af644f76ee8fa6a544887cc3df737eda72ffacb88e5")
   (:FILE "tests/io/transfer.lisp" :SOURCE-SHA256
    "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/io/transfer.fasl"
    :FASL-SHA256
    "810758221fe6f861e7a1790e3a1afd6be77cdbc1c88a7e4d60e26839987d3208")
   (:FILE "tests/io/support.lisp" :SOURCE-SHA256
    "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/io/support.fasl"
    :FASL-SHA256
    "7d1008f103102d09b50f1dbf67aa911b40f810701a0e4bf203c108ad6e3e39e0")
   (:FILE "tests/io/rename.lisp" :SOURCE-SHA256
    "cd14164b36977d927f7e4cf4d70d2068661c47f538228957102a4347a853fa59" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/io/rename.fasl"
    :FASL-SHA256
    "11c7adbd9446cb59bfdc241a11360137f16ff646a743ac24d3f4c382d0b4839f")
   (:FILE "tests/io/rename-native.lisp" :SOURCE-SHA256
    "b1f43b09af8f4253ce22a4793f9267c7d60df69339a3fc51b9fd83b6a331bce5" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/io/rename-native.fasl"
    :FASL-SHA256
    "93fc568063e27f5228bed3ac058fd57a5c860558925fc8179f9bb6b8e0e53956")
   (:FILE "tests/io/native.lisp" :SOURCE-SHA256
    "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/io/native.fasl"
    :FASL-SHA256
    "660f61971564fc5801a9b4e4a4ab7ff58b5f236d1ded5e070d2ea2ac7d5084e8")
   (:FILE "tests/index/slots.lisp" :SOURCE-SHA256
    "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/index/slots.fasl"
    :FASL-SHA256
    "6d7047ccfcfaa4dc957b22aef44cd630a961084805dd36d2efae07fc05011413")
   (:FILE "tests/index/slot-threads.lisp" :SOURCE-SHA256
    "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/index/slot-threads.fasl"
    :FASL-SHA256
    "046d7938fc1daeaa9a1f0bf44885ad905c8584e06341be3910b8c5de9c2d4bb0")
   (:FILE "tests/index/slot-support.lisp" :SOURCE-SHA256
    "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/index/slot-support.fasl"
    :FASL-SHA256
    "1caee8461d040f55ed7fc9ce213f9c6e7abde1da4da0ee857dfda50dc68c3630")
   (:FILE "tests/index/rebuild.lisp" :SOURCE-SHA256
    "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/index/rebuild.fasl"
    :FASL-SHA256
    "87f35c6f60240d775dbf7a284e955b2840f59c0ef07e7c0b8772d4311e73b169")
   (:FILE "tests/index/primary.lisp" :SOURCE-SHA256
    "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/index/primary.fasl"
    :FASL-SHA256
    "3be940250948f660aa3d58677e5adc4a2b4b997952cbe6e1cab9e88379c60dab")
   (:FILE "tests/index/primary-threads.lisp" :SOURCE-SHA256
    "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/index/primary-threads.fasl"
    :FASL-SHA256
    "ab80dee0e1213985ea9f77f51b9e8d7ed7084672e91de6eb00e4f0808338f652")
   (:FILE "tests/index/primary-support.lisp" :SOURCE-SHA256
    "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/index/primary-support.fasl"
    :FASL-SHA256
    "9156f4dd42c8908799d73ea57abcd9353d2dd32d2f3a1c00b4992940373e5eb6")
   (:FILE "tests/index/hash-digests.lisp" :SOURCE-SHA256
    "3b3b39f861883cf2017cab8e6488560a6bb3897d63784f00e820a6450d743225" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/index/hash-digests.fasl"
    :FASL-SHA256
    "c533449c78cbed8a1cc657fdcabb933fdfb66456d083df205abe36ee6f187c87")
   (:FILE "tests/hash/threads.lisp" :SOURCE-SHA256
    "3fc587a57d26a294aebfc6a7aeadf2f61a42a21106c1c57517f891b76b4e750a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/hash/threads.fasl"
    :FASL-SHA256
    "7abe64d2a5a87aba80712960a9e404e93b2803239be0128cffdfb99d1f2ce141")
   (:FILE "tests/hash/support.lisp" :SOURCE-SHA256
    "0fae9dc36976af544f83e6051b9cf9d67c9bef0b9e25f1fa2a48fdac48592acb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/hash/support.fasl"
    :FASL-SHA256
    "625a41c91d52fd5ee7b3dbce6ddb0761c5cb96c68adfedd18090344384c546f1")
   (:FILE "tests/hash/hash64.lisp" :SOURCE-SHA256
    "70606bc68807143cfea9583871474c84efc868d13692cde28488284dee43e0f1" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/hash/hash64.fasl"
    :FASL-SHA256
    "1aa4db4e8133ed7de0acd879b4c5ec3f641bcd62d921c2928a570aaa5d602a67")
   (:FILE "tests/hash/guards.lisp" :SOURCE-SHA256
    "9af5b38443a57d224990a68e93f12f7a4cda306f94c7ccd3ccb50635865d7864" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/hash/guards.fasl"
    :FASL-SHA256
    "54d2d6268ebee8b8b140e56478d7c7adefb33d08b945d0bed784b7f2920c894a")
   (:FILE "tests/get/support.lisp" :SOURCE-SHA256
    "21f0da34755882f7dcc3ee760528ca39d4731e1a79ea94525c62753b7f60422c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/get/support.fasl"
    :FASL-SHA256
    "7d8c9d827232db2f2ecfaebcfc60c79d9ceb4f1d9a75bf3bece922f33ce42845")
   (:FILE "tests/get/segment.lisp" :SOURCE-SHA256
    "e9722f419ce0810c98c28d0e1a74da85d52346a0befff40c1119934519fc6f98" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/get/segment.fasl"
    :FASL-SHA256
    "482295207f3f5aff56d8e3b646628fc26fd5b7613da844c0d340c5b7145c32b8")
   (:FILE "tests/get/lifecycle.lisp" :SOURCE-SHA256
    "73bf87c2aee7b537dba31fc0ae554272f7d2be5a4c1e9e96ea2f21a17f6f71f5" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/get/lifecycle.fasl"
    :FASL-SHA256
    "aec08c029e89f39e10d5d092550049710cc1511a1a9fc52a5a92ac042bce9d77")
   (:FILE "tests/get-resolver/support.lisp" :SOURCE-SHA256
    "d30a5c8a61b63e339facfee9f7701eb5a3614bbfd1ebef2c46c747d136640f8b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/get-resolver/support.fasl"
    :FASL-SHA256
    "4520287b5c5fd0b89aff77abf4e615d503fbcfe4fb2bc1ba90f3c6a4fa22c666")
   (:FILE "tests/get-resolver/sort.lisp" :SOURCE-SHA256
    "fd7f97f0fad2e970b972688481c0c132f11c85f5fdcd0f02bee6b0b3f93b97ae" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/get-resolver/sort.fasl"
    :FASL-SHA256
    "bba1d649e61469027f102b15cc1934afa1aaa987921f68d189f76666b94b2f7d")
   (:FILE "tests/get-resolver/read.lisp" :SOURCE-SHA256
    "70e46d1b88716f44309f46b4955928ca7fa2195edd80bb67d5b97732b971e8fb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/get-resolver/read.fasl"
    :FASL-SHA256
    "f1ac83304ba285ddb5112ee743db22b14c9a66ed212a97e93b06a83609e7e2c1")
   (:FILE "tests/get-resolver/construction.lisp" :SOURCE-SHA256
    "45cbef3b35db35d60a4cec2516c24f6ef56f5edb2f19f6f07f24fe00c8737b13" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/get-resolver/construction.fasl"
    :FASL-SHA256
    "8f9478d4b2e9d4121ebfd5a342073a8c6b1394ef92f4dd6d89e22af71deab922")
   (:FILE "tests/get-performance/threads.lisp" :SOURCE-SHA256
    "05ace5eb351ab49da59611dc1a2a5abedb9d723a2fc6e75a30fc76e507573a90" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/get-performance/threads.fasl"
    :FASL-SHA256
    "7f8367c070b1053a7c00eb451ee4bdb2b0c72d0c1025172fd4b13c8273fdfa11")
   (:FILE "tests/get-performance/support.lisp" :SOURCE-SHA256
    "e586ed94dcb2aaba00282931cdd83313e4f84a86d4d1ba85e2d56e8b7433ed8d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/get-performance/support.fasl"
    :FASL-SHA256
    "87652d994867dce306c437129d81bab756231de0437ebff0b0f69c7a3d387d64")
   (:FILE "tests/get-performance/paths.lisp" :SOURCE-SHA256
    "3b8d2c9c93467507ea2bb471d42192eb1fa084b55c0f4263b5ef0d3acf468f55" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/get-performance/paths.fasl"
    :FASL-SHA256
    "996e9e1e94f60168b7f165c6aed784f18179e69ff42c2c11791ec5abbbe13688")
   (:FILE "tests/get-performance/guards.lisp" :SOURCE-SHA256
    "c41721b917ed443355ea3707efdd07e7da53a978c0515ab1e5ede5fcc47d63fc" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/get-performance/guards.fasl"
    :FASL-SHA256
    "3aaa1ed6c77eae909f82b401f117070b8fe37e4764ed5ea7e7199cd06783e5a5")
   (:FILE "tests/get-directory/threads.lisp" :SOURCE-SHA256
    "e6a93ec22bc6f5a31b37ae99d927d1ca3a53893adb2eae21cd89d132a82d1f64" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/get-directory/threads.fasl"
    :FASL-SHA256
    "b75a923b5bb7adddaaf44487554b7cdb6374956505c400b1f74e9dc70d09ad86")
   (:FILE "tests/get-directory/support.lisp" :SOURCE-SHA256
    "be3a216a6ec597b63186b6bf3d3e35f3327f3001b1c00535d64b10bcb5d9fe85" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/get-directory/support.fasl"
    :FASL-SHA256
    "590beceabd78dbf4ffecb789e9fec03d24f872801a9683b9d6997a7cb38b8e6b")
   (:FILE "tests/get-directory/series-support.lisp" :SOURCE-SHA256
    "40f15fbdf42b80515cbfc57eb74bedcbd96d4a9e7e19dc25d8db59f326fe659a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/get-directory/series-support.fasl"
    :FASL-SHA256
    "8efdf0a3499ae5002cb2492f5f873aabbffb45d5f8c571e702c35145f00ae1a6")
   (:FILE "tests/get-directory/series-read.lisp" :SOURCE-SHA256
    "4b9856d69cd82c1462c87d16b9eb8e00fb642a46bb22f2f7b01865f7cc2a83a4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/get-directory/series-read.fasl"
    :FASL-SHA256
    "3b9f4daca4dcb11fbb13ac040b215c7171cafe8d65cd5e688de2c78bcbb38934")
   (:FILE "tests/get-directory/read.lisp" :SOURCE-SHA256
    "a222541b6413bb93ff86a269273f1fa15bfad0d1e4072fc058b023fec5143280" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/get-directory/read.fasl"
    :FASL-SHA256
    "efe1cfb66e2a8c484c8cf2e89da6bec4d80be595a5e77bd25d070807aef14358")
   (:FILE "tests/get-directory/construction.lisp" :SOURCE-SHA256
    "4ce9aa7064793e908008b9e1055c1e2527d5071006782ea956509c28e8c712d7" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/get-directory/construction.fasl"
    :FASL-SHA256
    "0058f0a317417b23468770f65df6013f09246aba67d64cecb98bef76269f0fcd")
   (:FILE "tests/get-active/support.lisp" :SOURCE-SHA256
    "34c73b5323272a24fc01c132133d3cc74be7c00fa7ddd4ad08b8146bb42d589f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/get-active/support.fasl"
    :FASL-SHA256
    "540fce2748f3e5865ba476f4b037f27669373719fd9d012260f50756e64b4ce0")
   (:FILE "tests/get-active/read.lisp" :SOURCE-SHA256
    "ef1a15c742518b52bdbeecac6b838b0789b73d631f765a30fd016748769a72e6" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/get-active/read.fasl"
    :FASL-SHA256
    "9acc8d8fdfa46e44de4df1dd0ecf95608c958106e8ab8f5b419b978791c9a0c9")
   (:FILE "tests/get-active/preflight.lisp" :SOURCE-SHA256
    "c65ef56f5f7498d4355e6a1f640969e3e31724fab9b84b5c3247e4e9d37626e3" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/get-active/preflight.fasl"
    :FASL-SHA256
    "1dae2f3d86e23666a233218c5f8706af5b5a58631274f41e37794f48c043d7ef")
   (:FILE "tests/get-active/directory.lisp" :SOURCE-SHA256
    "ea6754ab84b53a4be1722985600e280fde6f73da4ea7eb843e99d66989df6fdf" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/get-active/directory.fasl"
    :FASL-SHA256
    "c768f8250d823f5be705f8a28237fcf37027619b5c00c60bdeff4771ce51508b")
   (:FILE "tests/get-active/construction.lisp" :SOURCE-SHA256
    "31a21762f3c16950e4b6c0ce48a6ab235d2483476d03d4072d63905f7dd13deb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/get-active/construction.fasl"
    :FASL-SHA256
    "315f03534bfebeab10db1b88e64869c47f4da7538e18e2ada9f1175fc5fcd10a")
   (:FILE "tests/foundation/support.lisp" :SOURCE-SHA256
    "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/foundation/support.fasl"
    :FASL-SHA256
    "27c6ad0ca3dbd025eb07e2df52b96782e66b269ff325aa5b5164fd737e1bf461")
   (:FILE "tests/foundation/record.lisp" :SOURCE-SHA256
    "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/foundation/record.fasl"
    :FASL-SHA256
    "88da47918c7ca6b6421442f6f66202ed8fe68cc1dc80b205413da728e7d39960")
   (:FILE "tests/foundation/binary.lisp" :SOURCE-SHA256
    "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/foundation/binary.fasl"
    :FASL-SHA256
    "0542898ed9484ef954a5e20782b2db1da338c41f1b7569fabf78c0b0ef90c38a")
   (:FILE "tests/foundation/batch.lisp" :SOURCE-SHA256
    "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/foundation/batch.fasl"
    :FASL-SHA256
    "782a7c0bdaa9f6276b5497f6ff214648afa3dae340b691065b4f86c0b645722d")
   (:FILE "tests/execution/worker.lisp" :SOURCE-SHA256
    "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/execution/worker.fasl"
    :FASL-SHA256
    "9718cac8ae000ebd1130a01c66ac31f282dfff37a8a482e12e4a48c855e59cf8")
   (:FILE "tests/execution/threads.lisp" :SOURCE-SHA256
    "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/execution/threads.fasl"
    :FASL-SHA256
    "8a2b7740af41468364abf509df8c26f5cbcaed7d810efbc968ac626a7cd85a41")
   (:FILE "tests/execution/support.lisp" :SOURCE-SHA256
    "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/execution/support.fasl"
    :FASL-SHA256
    "b3ebf11c62dc997d77fb6bd86483610f9bba9bc78f0fb451d88fbfe4a8917fdc")
   (:FILE "tests/execution/ready.lisp" :SOURCE-SHA256
    "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/execution/ready.fasl"
    :FASL-SHA256
    "5b18904740794ce4fccc82beea0ece4082f2c1b62e2826c9f4977dcb42a29466")
   (:FILE "tests/execution/ready-recycle.lisp" :SOURCE-SHA256
    "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/execution/ready-recycle.fasl"
    :FASL-SHA256
    "a1fb9d56dbb9e0aa3897f4c92ff43f5544c2bbe755bc9bd0852b63b4e16bd046")
   (:FILE "tests/execution/queue.lisp" :SOURCE-SHA256
    "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/execution/queue.fasl"
    :FASL-SHA256
    "9ef17f2bd7dd1acf6ce79dde11dec5d9f6f21404eba0245d9f2b2b939e3001e7")
   (:FILE "tests/execution/handoff.lisp" :SOURCE-SHA256
    "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/execution/handoff.fasl"
    :FASL-SHA256
    "557579c760af98e3f661db48cfd0ba3fddb7b84156c68649b98ed0c9f677da41")
   (:FILE "tests/epochs/threads.lisp" :SOURCE-SHA256
    "54b73e06c61e64f32a3e3af0791891dacb6590e929163dcf0fac95f2c71e66fd" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/epochs/threads.fasl"
    :FASL-SHA256
    "a6f400fca00faa78afa95caddf3cdb41b25f6b85e88ac0dbb1d506135a0f38fe")
   (:FILE "tests/epochs/support.lisp" :SOURCE-SHA256
    "366be7af4bf6c4ed946b3fa9e97aea6b034c83e3b757d81c54078dc76d229b6d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/epochs/support.fasl"
    :FASL-SHA256
    "ea5a00ef8b48fcdf9df7b0306e619f0726d81a32864cf584f957751f6ca2a478")
   (:FILE "tests/epochs/lifecycle.lisp" :SOURCE-SHA256
    "ddc2fbdad9f97d2e4ff008c167776a50b17b742398306fbd5198dca474559cbf" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/epochs/lifecycle.fasl"
    :FASL-SHA256
    "c5350475d9444d2b6a46bc6e65882e184fb9cc77b390b4b1df41521da1455293")
   (:FILE "tests/csn/threads.lisp" :SOURCE-SHA256
    "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/csn/threads.fasl"
    :FASL-SHA256
    "6f73f084ba2dc91346d9388fbe1ff6c74eb18d1dc92673e918ee36deb704c8a3")
   (:FILE "tests/csn/support.lisp" :SOURCE-SHA256
    "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/csn/support.fasl"
    :FASL-SHA256
    "ccc3161024c3a4a299515ddf0dea0d3647f7abc1e51b04e420e737edc8d82d44")
   (:FILE "tests/csn/registry.lisp" :SOURCE-SHA256
    "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/csn/registry.fasl"
    :FASL-SHA256
    "3405b40114acdd2a392b554a0f5163bfb9ba59075a9ee2516156e90bd75b87ec")
   (:FILE "tests/codec/utf8.lisp" :SOURCE-SHA256
    "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/codec/utf8.fasl"
    :FASL-SHA256
    "707defbeb6a06add80098c88cf3e9cf1fa105887ef969df3c07ad18406b84feb")
   (:FILE "tests/codec/threads.lisp" :SOURCE-SHA256
    "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/codec/threads.fasl"
    :FASL-SHA256
    "46ac161e0b7cb27d4a8d136e79661df80ea6366b563ffca1b73f8988eedeea07")
   (:FILE "tests/codec/support.lisp" :SOURCE-SHA256
    "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/codec/support.fasl"
    :FASL-SHA256
    "32af74426f73a59f96e4a7a523675275cc46d430a0a61948f56b5dca2c1a971b")
   (:FILE "tests/codec/cbor-write.lisp" :SOURCE-SHA256
    "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/codec/cbor-write.fasl"
    :FASL-SHA256
    "dc385c3f0ca5cf43a99a45e9e47c7220e662921a6a345ac5e458f7ccc57ca4b1")
   (:FILE "tests/codec/cbor-write-threads.lisp" :SOURCE-SHA256
    "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/codec/cbor-write-threads.fasl"
    :FASL-SHA256
    "c9226a8110da8eddb258c956197dcdfdf3675e6d89255a7c709cc726796d1077")
   (:FILE "tests/codec/cbor-write-support.lisp" :SOURCE-SHA256
    "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/codec/cbor-write-support.fasl"
    :FASL-SHA256
    "e16584893a85c43be6d29db514e4bdf07113654177dbc98dffdf2ca47808d275")
   (:FILE "tests/codec/cbor-write-roundtrip.lisp" :SOURCE-SHA256
    "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/codec/cbor-write-roundtrip.fasl"
    :FASL-SHA256
    "5c13643e626b0f04af0ecc108a7c427413f453ed882dbfd6deb4f0f756421225")
   (:FILE "tests/codec/cbor-threads.lisp" :SOURCE-SHA256
    "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/codec/cbor-threads.fasl"
    :FASL-SHA256
    "29713d770c545d4c4cef5ad48ad9c22ee5f977d33a3bcc60665e410610b9ecda")
   (:FILE "tests/codec/cbor-support.lisp" :SOURCE-SHA256
    "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/codec/cbor-support.fasl"
    :FASL-SHA256
    "e0f72e57e5480e95817c234f1eaf6bfbe12b9c0867e17d3ea45c92e0c7d08115")
   (:FILE "tests/codec/cbor-structure.lisp" :SOURCE-SHA256
    "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/codec/cbor-structure.fasl"
    :FASL-SHA256
    "c3fb6899ac1f9293c22b1bbb4f9cdb11c5b534a284ac0fea1180f866c253fd3c")
   (:FILE "tests/codec/cbor-structure-threads.lisp" :SOURCE-SHA256
    "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/codec/cbor-structure-threads.fasl"
    :FASL-SHA256
    "b367613a9a0ea06027a983d014b9c342b92dc1c44fecaa26d932d7bf2a83b17a")
   (:FILE "tests/codec/cbor-structure-support.lisp" :SOURCE-SHA256
    "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/codec/cbor-structure-support.fasl"
    :FASL-SHA256
    "128d648f98f49468ca1d7ba659f0d21e58442eb0f1b026d37f85a3c9f97f1813")
   (:FILE "tests/codec/cbor-string-write.lisp" :SOURCE-SHA256
    "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/codec/cbor-string-write.fasl"
    :FASL-SHA256
    "165a80ce1fad02b98b2814a231af0f0f712615e27ae89f424326225e420cd79b")
   (:FILE "tests/codec/cbor-string-write-threads.lisp" :SOURCE-SHA256
    "8e07b881a55e2554a429f1c8b2c69f67862ac015217d90d019167d636564d27d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/codec/cbor-string-write-threads.fasl"
    :FASL-SHA256
    "07ea097c34cde16e15ca41489f7769dfb67bfa16af24bab54bdceb2c5d84c8c0")
   (:FILE "tests/codec/cbor-string-write-support.lisp" :SOURCE-SHA256
    "2cbdb601f442a56456bc637c94e759cc965f44b178268dce3c636c385d34fc39" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/codec/cbor-string-write-support.fasl"
    :FASL-SHA256
    "ff27e935ef645463b58defb68ca3c67383ee14b1245b17d8c4047715c7c3bea3")
   (:FILE "tests/codec/cbor-simple-write.lisp" :SOURCE-SHA256
    "958bdd3901cfc41032c09d6c9023b192799981884e09ce3573256ff45bc5329a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/codec/cbor-simple-write.fasl"
    :FASL-SHA256
    "7fa2f1c0798bd95b2be9bd7b3dcc0ceb4afde8c125c52c34cd56b598af517bcc")
   (:FILE "tests/codec/cbor-simple-write-threads.lisp" :SOURCE-SHA256
    "77074033e75a224fd02e890f98dffa8e97d3a1f8bedd510b00ea55d8ff8687b2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/codec/cbor-simple-write-threads.fasl"
    :FASL-SHA256
    "afdd503f10bcda610ee37acf7d4f0ff986b2b364f9e62ef7a0027bb1ec56b628")
   (:FILE "tests/codec/cbor-simple-write-support.lisp" :SOURCE-SHA256
    "53ceafc72a027a2ff1f787900558ff26f2ff70bbb212f1b37926a6d520fbe86e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/codec/cbor-simple-write-support.fasl"
    :FASL-SHA256
    "bea1e99925755664535941d8612c3138723e789e3c50b839e98cb74814ccd63d")
   (:FILE "tests/codec/cbor-minimal.lisp" :SOURCE-SHA256
    "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/codec/cbor-minimal.fasl"
    :FASL-SHA256
    "bfc6285cf035d259ea5ca0072a252e0777f66260f0f02c738c5299489f05e2a6")
   (:FILE "tests/codec/cbor-minimal-threads.lisp" :SOURCE-SHA256
    "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/codec/cbor-minimal-threads.fasl"
    :FASL-SHA256
    "9f0ea04aa9dfe729df46de03f7934d4fc8849d1ba29a5783b36ed0daa2d2298b")
   (:FILE "tests/codec/cbor-minimal-support.lisp" :SOURCE-SHA256
    "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/codec/cbor-minimal-support.fasl"
    :FASL-SHA256
    "ae143d2cf68855b2858601e1e709e05dd70d3aec81e0cca2e81c0f73d42b9548")
   (:FILE "tests/codec/cbor-minimal-scan.lisp" :SOURCE-SHA256
    "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/codec/cbor-minimal-scan.fasl"
    :FASL-SHA256
    "429a72fd6204732baca9e732b4682b60f4c945471b638e32c2300506a0c3edd1")
   (:FILE "tests/codec/cbor-minimal-scan-threads.lisp" :SOURCE-SHA256
    "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/codec/cbor-minimal-scan-threads.fasl"
    :FASL-SHA256
    "753f4acc7ccf35f1ac93187559dc0486df78cf2bc83111895e0a77da2d7f9494")
   (:FILE "tests/codec/cbor-minimal-scan-support.lisp" :SOURCE-SHA256
    "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/codec/cbor-minimal-scan-support.fasl"
    :FASL-SHA256
    "5cb8619eb2d6decf22e71e68677099a22efb481895fec057155dd1c73c819395")
   (:FILE "tests/codec/cbor-minimal-edges.lisp" :SOURCE-SHA256
    "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/codec/cbor-minimal-edges.fasl"
    :FASL-SHA256
    "589d2898e6937610425cfc4424c33fcb2cdbf55de516327d9763c665124ca9f2")
   (:FILE "tests/codec/cbor-header.lisp" :SOURCE-SHA256
    "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/codec/cbor-header.fasl"
    :FASL-SHA256
    "b627d6a79884c0b6528b94df182eba3b3c8b7067446b517a107339c6d17299bc")
   (:FILE "tests/codec/cbor-float-write.lisp" :SOURCE-SHA256
    "2d163a64bff4b9d9b9de576c4a4df05f4d8853f1c3d039e790cbb827be98c8b6" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/codec/cbor-float-write.fasl"
    :FASL-SHA256
    "1c9a56e78f54c6b2048fd33174a9a2f5e272542172f048d6fd992f2f8a1bb630")
   (:FILE "tests/codec/cbor-float-write-threads.lisp" :SOURCE-SHA256
    "96a1b205c01f75e271684132ff3e48b4da5cf8a01210257b591ec4951f097043" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/codec/cbor-float-write-threads.fasl"
    :FASL-SHA256
    "04628697be03167ef30859824a4138fe63bdec3f3d9114ac90cf9077ef1de888")
   (:FILE "tests/codec/cbor-float-write-support.lisp" :SOURCE-SHA256
    "158f18dcf4b2d7e5562713caa3625aeba16dd1eba21f4413345e8a10b616c748" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/codec/cbor-float-write-support.fasl"
    :FASL-SHA256
    "f209f755d54222387bbe129e16134d9aa1dc50acbddb84c8c8289b5e6e655aca")
   (:FILE "tests/codec/cbor-array-write.lisp" :SOURCE-SHA256
    "9ed6a20ab5ae2db33ef419986c8ee963898894ce239059eae7866d503fe48098" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/codec/cbor-array-write.fasl"
    :FASL-SHA256
    "e9c88c1a38bd545e4340b3fd333b1118030acdd9d179c326ba27caf52932d37f")
   (:FILE "tests/codec/cbor-array-write-threads.lisp" :SOURCE-SHA256
    "6be0614da2bafdafe2d853fa7845fb913dbf0cd2673771c2c4b0cca277986e35" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/codec/cbor-array-write-threads.fasl"
    :FASL-SHA256
    "dcba04e267c8ffb842a3572f66c0fe75c0c94dcc4703995007e444ae31dd5655")
   (:FILE "tests/codec/cbor-array-write-support.lisp" :SOURCE-SHA256
    "42a59239bec468dea130b87733a077874a5d9e83ff0f491b20312315bc27ee95" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/tests/codec/cbor-array-write-support.fasl"
    :FASL-SHA256
    "c17a631ce754f14f39041c0f647582b63d8387508add005a67d6cacfda8ab2fa")
   (:FILE "src/wal/types.lisp" :SOURCE-SHA256
    "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/wal/types.fasl"
    :FASL-SHA256
    "a26bacf580e8eea79573645b4435b05dc2fcb2d21fd15803157d4b7b8ab427ff")
   (:FILE "src/wal/package.lisp" :SOURCE-SHA256
    "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/wal/package.fasl"
    :FASL-SHA256
    "824a0e6ed9ae10c790080a2f200b322bc25764d0e35898a19e566b8c5ec93279")
   (:FILE "src/wal/group.lisp" :SOURCE-SHA256
    "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/wal/group.fasl"
    :FASL-SHA256
    "27bcb8e2ee789d92dc44e5217babbb5099ec2aa386ab4b49d07e2afb2aa68fbe")
   (:FILE "src/wal/executor.lisp" :SOURCE-SHA256
    "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/wal/executor.fasl"
    :FASL-SHA256
    "50c2f83a8b7795ddd72383b339e9b63b0c7b55e19dec9f4b97f308b44871a350")
   (:FILE "src/wal/csn.lisp" :SOURCE-SHA256
    "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/wal/csn.fasl"
    :FASL-SHA256
    "12b0898e50b969ab1e89b8d0b0dd4c36a65f5cbc143c289573db140a19d25812")
   (:FILE "src/wal/builder.lisp" :SOURCE-SHA256
    "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/wal/builder.fasl"
    :FASL-SHA256
    "0782f69dec08b1382435b1a03c81bafa927dcbe488344d87c5b2bc31b9361083")
   (:FILE "src/storage/segment-header.lisp" :SOURCE-SHA256
    "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/storage/segment-header.fasl"
    :FASL-SHA256
    "70bb6883954f7fe801bcbc39ad90cc91520d29a49fbe9473edaeea8be66a46a6")
   (:FILE "src/storage/payload-write.lisp" :SOURCE-SHA256
    "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/storage/payload-write.fasl"
    :FASL-SHA256
    "4ed4da1f91cd58383464c5fd754dbada99708c7191c0b161c3425948a7b3fead")
   (:FILE "src/storage/payload-record.lisp" :SOURCE-SHA256
    "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/storage/payload-record.fasl"
    :FASL-SHA256
    "0a5046aa20718169f60eee5119ea533a763c305380e322ea05d79b86b893b4f4")
   (:FILE "src/storage/package.lisp" :SOURCE-SHA256
    "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/storage/package.fasl"
    :FASL-SHA256
    "713989440c8a42520066612aaddebed773bb6dc7bd733a12c02a52a5a46173dd")
   (:FILE "src/storage/log-header.lisp" :SOURCE-SHA256
    "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/storage/log-header.fasl"
    :FASL-SHA256
    "ffaa84a73b70df6ec243c7c793ecf29bfbb2f3895c2543d4f455b7194eed4355")
   (:FILE "src/storage/formats.lisp" :SOURCE-SHA256
    "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/storage/formats.fasl"
    :FASL-SHA256
    "76abd30def04ab235acc2a6771e6f266e340e947595876b399e83dafa8aabd3b")
   (:FILE "src/storage/control-payload.lisp" :SOURCE-SHA256
    "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/storage/control-payload.fasl"
    :FASL-SHA256
    "49a42208271f28d08bc400841898ae40d0602d7ca6da6e44fd7c99a7c5c6afe1")
   (:FILE "src/storage/compaction-scan.lisp" :SOURCE-SHA256
    "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/storage/compaction-scan.fasl"
    :FASL-SHA256
    "43786e5b42a8b28232e6ceeae290dc8c2dca317f0b9c0ce784d619ac680c7fc8")
   (:FILE "src/series/worker-types.lisp" :SOURCE-SHA256
    "a366799fd9b938bfaa48b0ffda228ff8369ab9acb5b5ead7f081dfc66ab2c81a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/series/worker-types.fasl"
    :FASL-SHA256
    "067759f6fa43a3ebc7a788d7c37c9f01eb26587c7891ef31439796b0d1160531")
   (:FILE "src/series/worker-run.lisp" :SOURCE-SHA256
    "f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/series/worker-run.fasl"
    :FASL-SHA256
    "43d8b7d6289ed25a82c45f607e36049c4dbfeb0c8418e59bb132d381b1264643")
   (:FILE "src/series/worker-package.lisp" :SOURCE-SHA256
    "dcab7a17e4fabcf256c2eddfb655d18145a1d789dd8d64a889945badc418e4b7" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/series/worker-package.fasl"
    :FASL-SHA256
    "ab190fd58ba5cccb174abdd4cffabf3e0f97701e31c80499f4ece52480c7ee1e")
   (:FILE "src/series/worker-boundary.lisp" :SOURCE-SHA256
    "793d401d1b9acc7b67923d815560f277f3d390ca050740f735f07d88dbacfe73" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/series/worker-boundary.fasl"
    :FASL-SHA256
    "628f28e98996722964ec2226fd9b22cd369f268f9a7ae749af69d73d72479cb5")
   (:FILE "src/series/types.lisp" :SOURCE-SHA256
    "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/series/types.fasl"
    :FASL-SHA256
    "bc9110b05024cb3082462d0682a981c193d7564ce8558a85227c29a8e25e1f1c")
   (:FILE "src/series/routing-types.lisp" :SOURCE-SHA256
    "31ae51c0fb11a802164a4d1e11ec63f835a2c67b52c751c5685bcc8947e5e0f1" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/series/routing-types.fasl"
    :FASL-SHA256
    "3b5973a03aace9f20ac95801be017878b40f9e3221d32b46f9d326c6366491a9")
   (:FILE "src/series/routing-select.lisp" :SOURCE-SHA256
    "796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/series/routing-select.fasl"
    :FASL-SHA256
    "c081f904a00eeb936d9ac001c6299752874ed676c8c6e80578fa25276ce1c7fb")
   (:FILE "src/series/routing-build.lisp" :SOURCE-SHA256
    "70135e73ecb1f6080683dd615c47a50530485061797382d74441743cd9a0f92d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/series/routing-build.fasl"
    :FASL-SHA256
    "2afc21702c333c50be6c5ea2f48ba5b00491b378648b009158a66262fbd21006")
   (:FILE "src/series/retirement.lisp" :SOURCE-SHA256
    "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/series/retirement.fasl"
    :FASL-SHA256
    "18244fc3b63d8414a41ac5190cf46a6196d53265121f0c15499598f73a862af7")
   (:FILE "src/series/query.lisp" :SOURCE-SHA256
    "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/series/query.fasl"
    :FASL-SHA256
    "673e09a67a1840b1d12437dc6782b5b43aa1cbcfa5431c5352b29af4a9cdc476")
   (:FILE "src/series/publication.lisp" :SOURCE-SHA256
    "5de121c83ea6bd1243e420d9d898102aebb054cd1fa7ac79fcde9bf0792a95d8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/series/publication.fasl"
    :FASL-SHA256
    "6d33a2af51f67839184917c83124571320a94e97dcc109118e314750e2a40494")
   (:FILE "src/series/package.lisp" :SOURCE-SHA256
    "9a402f5225860c483dec9064a84d6462d28f5377a27977a63f64a5fbdbdd3764" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/series/package.fasl"
    :FASL-SHA256
    "441154eb0e997a836d4fe7f9cb70df4a2110fd3b9355080406fe91461eae5a37")
   (:FILE "src/series/ownership.lisp" :SOURCE-SHA256
    "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/series/ownership.fasl"
    :FASL-SHA256
    "3601c6737b87b65f3eb7de960e24cb9be55b41e5d39acfa06d1277ba04708027")
   (:FILE "src/series/io-events.lisp" :SOURCE-SHA256
    "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/series/io-events.fasl"
    :FASL-SHA256
    "496128ef8d85ed3ba54ea43ca3077200e0889c6033770e2e7fc44017806d23a8")
   (:FILE "src/series/events.lisp" :SOURCE-SHA256
    "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/series/events.fasl"
    :FASL-SHA256
    "48c6dea2dac1a8ef84c24eca05d69714bf9ce258a200217b2e6b56fe24af7ff8")
   (:FILE "src/scheduler/update.lisp" :SOURCE-SHA256
    "e35a704ee0b9445c559a768de048169a8e39837a6df21843d8df58215c482472" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/scheduler/update.fasl"
    :FASL-SHA256
    "27417a69faca05b313c419e5ba8f57ac4c65d31bd15c305126d3ba73d1773678")
   (:FILE "src/scheduler/types.lisp" :SOURCE-SHA256
    "3b174be0919f8b27312ada4071d831c3753d62bb12be99d7e9394c48dcab474a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/scheduler/types.fasl"
    :FASL-SHA256
    "26eaf03ab77f29680377e472ff128fbc093adecdf02779d498a655bf28ecea12")
   (:FILE "src/scheduler/read.lisp" :SOURCE-SHA256
    "5cdc1e5b7ba97c9aab66a5acaf74336b0df33144e24104e0242b7fc2552a1ae2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/scheduler/read.fasl"
    :FASL-SHA256
    "3eb686979c988898a6f0178e40a583eedd03521abd88218f330c675fa56d703f")
   (:FILE "src/scheduler/pool-claim.lisp" :SOURCE-SHA256
    "e384f6091a5fcb506e718e12e77b06ab8dd4233a41024bc57ca3b14425e10b14" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/scheduler/pool-claim.fasl"
    :FASL-SHA256
    "c7e3c6f840c9deaed12a37cc6733a5d0ce8e5650bc392b607ec88af19acb4bc6")
   (:FILE "src/scheduler/policy.lisp" :SOURCE-SHA256
    "92b3ca3a81ae0b3ac342a63e5fe5c5d7524091a63065b0232c14c57ee80c4aac" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/scheduler/policy.fasl"
    :FASL-SHA256
    "c0df89a5f61e9327352ea35a0147f8732fd440a6fed07e82644fd160a291811f")
   (:FILE "src/scheduler/package.lisp" :SOURCE-SHA256
    "a44fd2c3d435e1f6729bf861b6caeb54a184f31c92e7909aad9c18b491f03cdf" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/scheduler/package.fasl"
    :FASL-SHA256
    "6fda877ba5ff51ba41891fdeb142b42c8c1b0e79b99a68e1032096008d1fd838")
   (:FILE "src/scheduler/lifecycle-worker.lisp" :SOURCE-SHA256
    "ec8b462ff3f5f7a6435f0f0c01b62034d8de2a784a9e354d469a0adfec9cf837" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/scheduler/lifecycle-worker.fasl"
    :FASL-SHA256
    "09bc7acb1ec91e8b8fa0d817b39a67cd4b523fb58a634e6b936abd5f9fa2000b")
   (:FILE "src/scheduler/lifecycle-update.lisp" :SOURCE-SHA256
    "2020e46809e9fe8fa74e061a420b8085679d5f461eabd8b044f3975c1024800e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/scheduler/lifecycle-update.fasl"
    :FASL-SHA256
    "8448c2690938edf6607125993cd074317cf06ee412b82c0a8815abf2f6712852")
   (:FILE "src/scheduler/lifecycle-types.lisp" :SOURCE-SHA256
    "4fe980e00f1d273e9b8278cd2daace6b4a9e4ab948ddfac83b79f4b0c537cb7c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/scheduler/lifecycle-types.fasl"
    :FASL-SHA256
    "2dad1006fa1af42018d877557581dfcb3504881590c93dc5ac1fbc671a1a2945")
   (:FILE "src/scheduler/lifecycle-read.lisp" :SOURCE-SHA256
    "c60e1d5f67eeafb216b374fa001d27f87d1a734c5d066fc092902c0301069200" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/scheduler/lifecycle-read.fasl"
    :FASL-SHA256
    "b5f7ceb0222fba022c84c932da5a4637aa76675cedb20b0b8a8688d65a8fbd3a")
   (:FILE "src/scheduler/lifecycle-build.lisp" :SOURCE-SHA256
    "d6d67faf8721f26e7fcd228d6ab9a7dfdc36ff5ec56c67ed9e5fb6d914006a9e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/scheduler/lifecycle-build.fasl"
    :FASL-SHA256
    "b4f484c955ff83bceca300d4051f388ef281e77494a2b7580e4bf89afc51f0be")
   (:FILE "src/scheduler/build.lisp" :SOURCE-SHA256
    "58baf595f221826c64e3fb38344242c3bdf403d65904193bf1a8e06e09d7c336" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/scheduler/build.fasl"
    :FASL-SHA256
    "674ffa556660936864705bd66d827c4939392579c1bae710bcf47fa772703132")
   (:FILE "src/recovery/scan.lisp" :SOURCE-SHA256
    "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/recovery/scan.fasl"
    :FASL-SHA256
    "66f49265bec3f17fde68e84494726ec885e6a5ff850bee35cbd2572df1204813")
   (:FILE "src/recovery/package.lisp" :SOURCE-SHA256
    "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/recovery/package.fasl"
    :FASL-SHA256
    "73649f04a54a20703e7277c21b6bfe68989e25f5c1cb20f6a6cc9d3b331aa64b")
   (:FILE "src/recovery/manifest-types.lisp" :SOURCE-SHA256
    "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/recovery/manifest-types.fasl"
    :FASL-SHA256
    "3de27267d6d22592861e4db4f4df39534d32d0efa3b9df04e0cd45d6d6c206fd")
   (:FILE "src/recovery/manifest-query.lisp" :SOURCE-SHA256
    "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/recovery/manifest-query.fasl"
    :FASL-SHA256
    "2c553e04a5c44874a095d23394702d995928c814eb97936422f29cd12343fd6d")
   (:FILE "src/recovery/manifest-package.lisp" :SOURCE-SHA256
    "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/recovery/manifest-package.fasl"
    :FASL-SHA256
    "6355e9d26a83c18db9f44c3c70faaf6e5c6d621963c2446659d844e7b2f76c5b")
   (:FILE "src/recovery/manifest-fold.lisp" :SOURCE-SHA256
    "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/recovery/manifest-fold.fasl"
    :FASL-SHA256
    "474a01c1461aaec317f0aaf8f77041c0b1ca9bede72bf171c848a541ab392f9d")
   (:FILE "src/recovery/manifest-decode.lisp" :SOURCE-SHA256
    "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/recovery/manifest-decode.fasl"
    :FASL-SHA256
    "59e414b9859ec33e57ed7b83687b9dfde2f11b434b8c73ac83c820527b957d44")
   (:FILE "src/recovery/manifest-build.lisp" :SOURCE-SHA256
    "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/recovery/manifest-build.fasl"
    :FASL-SHA256
    "4cb7533c25f79256b23a5b0d551a1b9fc3eadffa7fa3fe6c24ac849e99716906")
   (:FILE "src/recovery/inventory-types.lisp" :SOURCE-SHA256
    "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/recovery/inventory-types.fasl"
    :FASL-SHA256
    "7b77a1ddad3b740fe3ff2708df66d5f863371dc2fd650c13907a00c57fe0f37f")
   (:FILE "src/recovery/inventory-query.lisp" :SOURCE-SHA256
    "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/recovery/inventory-query.fasl"
    :FASL-SHA256
    "0eca86f110efa03707a70005bc5d03e2d11b2298f0cd2c91b12d06d2c7b4bbc5")
   (:FILE "src/recovery/inventory-build.lisp" :SOURCE-SHA256
    "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/recovery/inventory-build.fasl"
    :FASL-SHA256
    "c735c296a5afb10a8a5b7413d18cbe133a84f4d07d43df88caa559853496d646")
   (:FILE "src/recovery/decisions-types.lisp" :SOURCE-SHA256
    "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/recovery/decisions-types.fasl"
    :FASL-SHA256
    "637db0b0e35592651c8e768a45cf77cff9fed8b7ee25cb57abbf7267c9db16da")
   (:FILE "src/recovery/decisions-sort.lisp" :SOURCE-SHA256
    "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/recovery/decisions-sort.fasl"
    :FASL-SHA256
    "1840587a1f63c3c7ffc900978225facff3f290927624f587df5a5211fb51ba4c")
   (:FILE "src/recovery/decisions-radix.lisp" :SOURCE-SHA256
    "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/recovery/decisions-radix.fasl"
    :FASL-SHA256
    "f47de10749784eb24a53459665d4f0bfc511ac715e9934f4d9057789eb12bd96")
   (:FILE "src/recovery/decisions-query.lisp" :SOURCE-SHA256
    "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/recovery/decisions-query.fasl"
    :FASL-SHA256
    "bfba4cb6e83af9431e78b4ea9ea2423df998756d4e16b6eb95d2db889e5207d5")
   (:FILE "src/recovery/decisions-package.lisp" :SOURCE-SHA256
    "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/recovery/decisions-package.fasl"
    :FASL-SHA256
    "3f9b796a0f0fe7f8c32474d25228c0ade978331b7bd7f6359ecbd4e02dbb2e57")
   (:FILE "src/recovery/decisions-build.lisp" :SOURCE-SHA256
    "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/recovery/decisions-build.fasl"
    :FASL-SHA256
    "c6c3b763c514199ebfedf6c9ef3fec6e207745a14d58efdb1193ebdf945565d0")
   (:FILE "src/read/types.lisp" :SOURCE-SHA256
    "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/read/types.fasl"
    :FASL-SHA256
    "31716be37ed33c514ed1f4d72c78e30ac24aec263167b32e6655bc176ff9f11e")
   (:FILE "src/read/task.lisp" :SOURCE-SHA256
    "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/read/task.fasl"
    :FASL-SHA256
    "fe07ca17d9fe805b43e3bc6f42a7a73b22e46e23130b2ab32bec848256828c62")
   (:FILE "src/read/package.lisp" :SOURCE-SHA256
    "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/read/package.fasl"
    :FASL-SHA256
    "341688b8b903887853a578a58dd28f4483def3cfa250ce652ad4198ff609bdfe")
   (:FILE "src/read/core.lisp" :SOURCE-SHA256
    "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/read/core.fasl"
    :FASL-SHA256
    "26a3c7f038b65a1094a712bc0c97cf02df2d60e64e59c35c0b9e51b25e501377")
   (:FILE "src/package.lisp" :SOURCE-SHA256
    "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/package.fasl"
    :FASL-SHA256
    "2f98400d675528569f71329bbb513844a75964fbaf09a1e12eec847c4d268a37")
   (:FILE "src/mvcc/types.lisp" :SOURCE-SHA256
    "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/mvcc/types.fasl"
    :FASL-SHA256
    "ee373bb1bd461e3fe205a169e74839afbd74b529a31277b843c2a629e4cf460f")
   (:FILE "src/mvcc/snapshots-types.lisp" :SOURCE-SHA256
    "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/mvcc/snapshots-types.fasl"
    :FASL-SHA256
    "4435d19bf34f9c9b6a9db89e532abe3b318ec7807a5fc1546bfe91a055b410d3")
   (:FILE "src/mvcc/snapshots-register.lisp" :SOURCE-SHA256
    "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/mvcc/snapshots-register.fasl"
    :FASL-SHA256
    "8137f3e504120202f20e13fe31d30ed831bce8789ad0f80f7e1bc82f2070a70a")
   (:FILE "src/mvcc/snapshots-read.lisp" :SOURCE-SHA256
    "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/mvcc/snapshots-read.fasl"
    :FASL-SHA256
    "55f5da7c2cd1ab2254736bf2fdb10d9148d791157d6b511b402f847083adc82c")
   (:FILE "src/mvcc/snapshots-lifecycle.lisp" :SOURCE-SHA256
    "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/mvcc/snapshots-lifecycle.fasl"
    :FASL-SHA256
    "243c9dbf9dbfdb4272e72a6161cd3ffa73dec95a26654b4ec7d961438b213fed")
   (:FILE "src/mvcc/snapshots-csn.lisp" :SOURCE-SHA256
    "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/mvcc/snapshots-csn.fasl"
    :FASL-SHA256
    "d4ca0a4f78365e0dd13dc442be4a87d0f5cd5a7818a1585faf72f655b3c71f7d")
   (:FILE "src/mvcc/snapshots-core.lisp" :SOURCE-SHA256
    "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/mvcc/snapshots-core.fasl"
    :FASL-SHA256
    "5e842cc283b0153ff17c020958b359dc0832b48cde64da484f7d12125ba3047f")
   (:FILE "src/mvcc/package.lisp" :SOURCE-SHA256
    "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/mvcc/package.fasl"
    :FASL-SHA256
    "ad8ee4591768ffc94c227247d3c6006ff8593bf6db30a2b60ec9454d26c0030c")
   (:FILE "src/io/types.lisp" :SOURCE-SHA256
    "68df36ae5167c975261f99d63a6598bca1fe93caca02f39e18812e94fcf1b233" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/io/types.fasl"
    :FASL-SHA256
    "0a348b038dd61660df2cd14fcc5d353a7901dde081fb07d63e1b8e312df9b8e3")
   (:FILE "src/io/transfer.lisp" :SOURCE-SHA256
    "c807f294d0211e8433f8f0332ab6ba3ce7d9ae7de3818f43af7ff8d7fcfd341a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/io/transfer.fasl"
    :FASL-SHA256
    "3992db4fc6a725e9c67254542a7ac9053d6ba7b91ccf3bb14c4dc41978543128")
   (:FILE "src/io/rename.lisp" :SOURCE-SHA256
    "ef9475701a2da4a44d98f9c88a1f547f3be1f07c649c8c3c956c206c80a55598" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/io/rename.fasl"
    :FASL-SHA256
    "e3970a8e2358ca421d43fd6ea3d341cb755d89e25a31f053935bd7e5acb2752b")
   (:FILE "src/io/package.lisp" :SOURCE-SHA256
    "605f51109d723267b326c012602a91e7deff984a040c3440d90665b853e3549c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/io/package.fasl"
    :FASL-SHA256
    "b0458ced9723257d1f8caff23d2837728435f49e7f9cf4cda3cfa5725b86f10d")
   (:FILE "src/io/native.lisp" :SOURCE-SHA256
    "74f63dbb2137a344054e82c6707e6262473b3332ff66a85f79ecfee9fd50f9b4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/io/native.fasl"
    :FASL-SHA256
    "4fb941b5a09d8a26d09837c85b794f499b9d4ed042ea77f16c0ad62c337ed022")
   (:FILE "src/io/native-namespace.lisp" :SOURCE-SHA256
    "3a7ada1ffe09c94714629a3679bf26a56bd5570ff3bf06acbce4be83750a47ad" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/io/native-namespace.fasl"
    :FASL-SHA256
    "e4a8f84a71e4b1e8018ad24192e4bd53c483b3f5c45b73e9ac6d89538079916e")
   (:FILE "src/io/namespace.lisp" :SOURCE-SHA256
    "f23b46209fa87bee4deee84dbe3d87bc7a20d0a4f98bdafe7d40391fc42e1b59" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/io/namespace.fasl"
    :FASL-SHA256
    "265da9a8576da5f4a1f30ff116ab3ff76f4691d8b1f25a858c1433586ff6e5b4")
   (:FILE "src/io/lifecycle.lisp" :SOURCE-SHA256
    "88e72ad54b8c8048358cbca2d136c62883d8e700d63d92e807cb14df0082ae6a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/io/lifecycle.fasl"
    :FASL-SHA256
    "b4aefb8971781be560ecf6bffec0084ed48630007bb56515f8aedb3aea1914e3")
   (:FILE "src/io/identity.lisp" :SOURCE-SHA256
    "d2b6f7932b66f2ef74241e573ed253cf9b710f217cd570ef23f6671614d90a2c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/io/identity.fasl"
    :FASL-SHA256
    "9706440403443c71a4d109b4185699b662ccdc334c0a7b54fd6144ac44f8195b")
   (:FILE "src/io/identity-types.lisp" :SOURCE-SHA256
    "5794dd5094f34c24e7e09e4a7937f1988d85ea9cd37e478abaf836273da5d5c1" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/io/identity-types.fasl"
    :FASL-SHA256
    "6eb5883eabc96b5f5b48909ced72b6748a398f0eafb1ad43f60d4094f9749a54")
   (:FILE "src/io/flush.lisp" :SOURCE-SHA256
    "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/io/flush.fasl"
    :FASL-SHA256
    "0c265a8b39691d95631b3c7106677beb5c30b8a018dbe013c8c2f83a84bfa6c3")
   (:FILE "src/index/write.lisp" :SOURCE-SHA256
    "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/index/write.fasl"
    :FASL-SHA256
    "330875030e687d11f1934a4ec6c5a8a8a3dcb8b69710d80e964cd560a2e095c3")
   (:FILE "src/index/validation.lisp" :SOURCE-SHA256
    "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/index/validation.fasl"
    :FASL-SHA256
    "996e7f1f4615036867eb8fc0692eef65425081f5fc9bba7590629a7a159fe045")
   (:FILE "src/index/types.lisp" :SOURCE-SHA256
    "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/index/types.fasl"
    :FASL-SHA256
    "36f4b19052bd4db1597b97d367085e72fc2972c88dee17d9fe97249d292df070")
   (:FILE "src/index/relocate.lisp" :SOURCE-SHA256
    "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/index/relocate.fasl"
    :FASL-SHA256
    "b7a33b0a5b7975f8279938e6aa55ba4970bd0e4f69e031c84ff0514cd6b4638b")
   (:FILE "src/index/rebuild.lisp" :SOURCE-SHA256
    "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/index/rebuild.fasl"
    :FASL-SHA256
    "a97f3b22c538149974a79e89c713bc12aa2f78c3ba62fce45f16a54caee084ce")
   (:FILE "src/index/rebuild-scan.lisp" :SOURCE-SHA256
    "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/index/rebuild-scan.fasl"
    :FASL-SHA256
    "cbd9eeff297336350cd0f654c17408ed844bba95239eae3ce859efb3affb2465")
   (:FILE "src/index/rebuild-copy.lisp" :SOURCE-SHA256
    "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/index/rebuild-copy.fasl"
    :FASL-SHA256
    "e6843807ea84fee038668fbc6103d0bf93160a35817828f8310415a1cf091ff6")
   (:FILE "src/index/rebuild-budget.lisp" :SOURCE-SHA256
    "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/index/rebuild-budget.fasl"
    :FASL-SHA256
    "8fa663ff49ba34f8d5546fe54b38d8f46927f18e8e5f39e421a535508b944925")
   (:FILE "src/index/read.lisp" :SOURCE-SHA256
    "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/index/read.fasl"
    :FASL-SHA256
    "c32a7efb6905f1343cd0d82756d019f96b94af84dbbec8fad7439e812ea8ec93")
   (:FILE "src/index/primary-write.lisp" :SOURCE-SHA256
    "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/index/primary-write.fasl"
    :FASL-SHA256
    "e4b8b041f8dab31eec1b0413fad92458a5b8bd41bbadc32550957919e35c7a10")
   (:FILE "src/index/primary-types.lisp" :SOURCE-SHA256
    "f17ca0dcd8a538b921f00044e23872b28272638c4435eacd30f0509422505e64" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/index/primary-types.fasl"
    :FASL-SHA256
    "b450dcaec297258a5c5e0365f72a108da04cacfbd16a6e269d252d33d8545d2d")
   (:FILE "src/index/primary-relocate.lisp" :SOURCE-SHA256
    "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/index/primary-relocate.fasl"
    :FASL-SHA256
    "16415357906018ee12a36231fb517b73f6bc6196c20a9646cf17b403fb01d026")
   (:FILE "src/index/primary-read.lisp" :SOURCE-SHA256
    "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/index/primary-read.fasl"
    :FASL-SHA256
    "fa2826086e6b45ea97629485b0ec45d35d654de9ed72957db42ea45d9a9754b5")
   (:FILE "src/index/primary-probe.lisp" :SOURCE-SHA256
    "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/index/primary-probe.fasl"
    :FASL-SHA256
    "4036c7bf393e8e48c06e3b5f8dbbadeb6aa02df46f92170991b920dfc21dccc8")
   (:FILE "src/index/primary-package.lisp" :SOURCE-SHA256
    "0682eb9a61596506b6788bd0285f9808db2496246caae64ab3203182ed46b860" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/index/primary-package.fasl"
    :FASL-SHA256
    "2789eb6e0fbd60744f0aed760ef2c7758927b15f9e26f05e34e7c88bcbd851f6")
   (:FILE "src/index/primary-directory.lisp" :SOURCE-SHA256
    "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/index/primary-directory.fasl"
    :FASL-SHA256
    "f7265f84459f75c4ae0158d14fec0586402195be5d73e4b8d737685c22a086a1")
   (:FILE "src/index/primary-core.lisp" :SOURCE-SHA256
    "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/index/primary-core.fasl"
    :FASL-SHA256
    "569c40d04cade579602740a8cacecca48260d95c81779a721b2f1611d4fe750a")
   (:FILE "src/index/primary-build.lisp" :SOURCE-SHA256
    "06ca5ac8c03504e2d2f973873e5cabf7518c090cd1f8f2118c46e0ea2f9bf37b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/index/primary-build.fasl"
    :FASL-SHA256
    "eaf745fbc699f454db653d4a44a7e864fcfbd1e68bd16250063c054d09dc1c05")
   (:FILE "src/index/primary-arena.lisp" :SOURCE-SHA256
    "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/index/primary-arena.fasl"
    :FASL-SHA256
    "6bc9890c762df1740481e2e8e4821d0fb062e86e7674686da692e6e8bef563cb")
   (:FILE "src/index/package.lisp" :SOURCE-SHA256
    "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/index/package.fasl"
    :FASL-SHA256
    "278281c620b8d2fc87d2111a42c1067687f02d28b891ced4aaddc6c3e22f8a79")
   (:FILE "src/index/hash-seed.lisp" :SOURCE-SHA256
    "ae86514101e95737747ba58a4f0c5dc1ddb44d2b3a18bceb8fd0d0756b57a7a1" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/index/hash-seed.fasl"
    :FASL-SHA256
    "9c265fb950820156e2950359e08cb97f3f570f950ef06ea67178151f0488c6f9")
   (:FILE "src/index/hash-digests.lisp" :SOURCE-SHA256
    "924bb7dab91ff56c1e909f2b06dff5f74b443ac6442e379498f29b25f1fa2673" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/index/hash-digests.fasl"
    :FASL-SHA256
    "b404c0c8aec66857529b27ce8a37a33cd206315898749cae37082ae9f12ae5dd")
   (:FILE "src/index/core.lisp" :SOURCE-SHA256
    "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/index/core.fasl"
    :FASL-SHA256
    "c3f0b1705e95a23905ddf892119ac20111e9882ad10febdab0388d3ead62306f")
   (:FILE "src/hash/package.lisp" :SOURCE-SHA256
    "1e7668fa26fc1a8e3b3cfe824aa3e08b30b57441d5f90d44453fc3a9259a10d0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/hash/package.fasl"
    :FASL-SHA256
    "0f60e2907b28c3f82f07d4891fd6fed4e14f595dc43fff02c0eae063a8f5d082")
   (:FILE "src/hash/hash64.lisp" :SOURCE-SHA256
    "99e4c8394a8f877ce1f552f15a57a082c0ec81015e87119ee4ffea28cf3ae77f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/hash/hash64.fasl"
    :FASL-SHA256
    "eef71d1acc0dc89962da0fab790f800c7d326bf3cff566de4bcac2a795b31c43")
   (:FILE "src/hash/blocks.lisp" :SOURCE-SHA256
    "5f5dff95ae6c34dfc15538c537ba2fa8d34ba2376ad66ad9975745ea13a2175f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/hash/blocks.fasl"
    :FASL-SHA256
    "19c3c59c0ef1801425f718eba0f58a8082b1e92331f9a504713cd6edb6b222ee")
   (:FILE "src/hash/arithmetic.lisp" :SOURCE-SHA256
    "c439e534b768acb123d69b921b85e1e56683aa8335bbc87efba95fe95f256fa9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/hash/arithmetic.fasl"
    :FASL-SHA256
    "75572c1e4aa4d3b359435da5b532fec4ecede71fe318938ae1c71292d22c2bbc")
   (:FILE "src/get/types.lisp" :SOURCE-SHA256
    "653b23a6e719cd1f55e7c58b4d7e8143aec5983992ba210d0eac1f4c8682f623" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/get/types.fasl"
    :FASL-SHA256
    "ba4faa35abb5a343e49c6cf8a694f9deffa5bf4004080eac9dad314e061b90f6")
   (:FILE "src/get/target.lisp" :SOURCE-SHA256
    "9f682f735e49108cad176a6143ec99e1be64da98f29cae0b52f9b49cdea34250" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/get/target.fasl"
    :FASL-SHA256
    "040279ae1737a3f34749a26b94c8cd9f18b44c345a5f993c1efb632d6509b752")
   (:FILE "src/get/segment.lisp" :SOURCE-SHA256
    "4a486528cb2c1cc3471cb4b332d4314d24011889e1f885db6fd5600bb077eea3" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/get/segment.fasl"
    :FASL-SHA256
    "904fb3c0b072e9414941fd78c16e0dde76d8918b5f03b294b84e34b8de4076f2")
   (:FILE "src/get/package.lisp" :SOURCE-SHA256
    "87b795779aef0c4b918a039d182daddd22b902a9ad10c763df4364b7e630151c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/get/package.fasl"
    :FASL-SHA256
    "1a5e75bcc551a31c56416e6bf06aa4d4c8de178bbb0e5780187eb2a12fe40b80")
   (:FILE "src/get/lookup.lisp" :SOURCE-SHA256
    "9d1042d4cf1e7bd9c6d1153de12b2459e7a2724e47bd32534cd7ae56cb274c5f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/get/lookup.fasl"
    :FASL-SHA256
    "1eda944109c3424cda151c56d50cfdade4c9a9a7ea9edfef95c16aa328cfc0f0")
   (:FILE "src/get/lifecycle.lisp" :SOURCE-SHA256
    "885ba4141114ea411cac37c9b5f924aaa7f9f2a5ba311ebf92a392e5da1e3c59" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/get/lifecycle.fasl"
    :FASL-SHA256
    "eb9b7e319ff8fa22c2d9e98dc56174f11b150d0f7736edf8d36a0c694eaf295f")
   (:FILE "src/get/build.lisp" :SOURCE-SHA256
    "bcfc4916e9a85833dc151c4ce176bc905f2c03b6bc6d636f97a60df0d8c16739" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/get/build.fasl"
    :FASL-SHA256
    "a46a5ca30a41b45622709a585408abd7acf7ddb6ad82c799d32f54399795e845")
   (:FILE "src/get-resolver/types.lisp" :SOURCE-SHA256
    "b847d6c388f4d052a2d707b7c410cc7c2ef60482fb5cd9ef384c016c31d1dc00" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/get-resolver/types.fasl"
    :FASL-SHA256
    "accf772eb41f83a2654f749af1f26b51eb23d9f75e3340281abe785f674880a3")
   (:FILE "src/get-resolver/sort.lisp" :SOURCE-SHA256
    "974bf44efeb1cd26c5e9db0601aea295c8f1a18234894ad9d41938a2880e2255" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/get-resolver/sort.fasl"
    :FASL-SHA256
    "a4b4151d15efebca5ba9192f57cecaf285986624bdc957fb8acca0f6d3037574")
   (:FILE "src/get-resolver/scan.lisp" :SOURCE-SHA256
    "35a1780c6bf66364ef94c4151fa91f02eebe359f0ca0639985d2a907fd9d512d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/get-resolver/scan.fasl"
    :FASL-SHA256
    "4f9921a1ea1decfe1ebe7d43764ec2581a750ede43048da7048a23e77afc54b4")
   (:FILE "src/get-resolver/rows.lisp" :SOURCE-SHA256
    "d9db85d788006fc7ad1f9a7cdeef28b992605de7fac8c295dd7fdc51f5511854" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/get-resolver/rows.fasl"
    :FASL-SHA256
    "ed6ba92cc23d1b42f93e3c2214a88f5232a42c8f0b16aacbdac58a7aff5b8d52")
   (:FILE "src/get-resolver/read.lisp" :SOURCE-SHA256
    "dd100bb17e15589124916767f8a690ae683ac8c462102c778639f917a5f1924d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/get-resolver/read.fasl"
    :FASL-SHA256
    "0d17aaa0f82e0f77f6adc5eaa89cb549975c9f3406b4dca1bf05e43328f6122a")
   (:FILE "src/get-resolver/package.lisp" :SOURCE-SHA256
    "663a5a15a630ed2b9042a3a3365598358df97d3dd1cd3d7610b283526281f39a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/get-resolver/package.fasl"
    :FASL-SHA256
    "ff0c7e7cf2328fee32b88d7e7cda53129a7e26a3942e7e957caa2adfeb19bd39")
   (:FILE "src/get-resolver/build.lisp" :SOURCE-SHA256
    "c649c80c2b510669fc1c0a7f15b3080b7fb46a3423a1e49db5bb9ff248176e0a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/get-resolver/build.fasl"
    :FASL-SHA256
    "a44971ee764c289952ae1ae703980e96552bc5a590df78aaf1f558283a407647")
   (:FILE "src/get-resolver/active-types.lisp" :SOURCE-SHA256
    "a3cb954a265b263e0e03d2f1a80824589670efbf89adcd69007987d26df2e29a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/get-resolver/active-types.fasl"
    :FASL-SHA256
    "804c58711f23d54ba0b9a45b5bb67ca95b1ae5a0f9c6640ea3ea82f140593617")
   (:FILE "src/get-resolver/active-scan.lisp" :SOURCE-SHA256
    "97dd4f59d4449334b113e9403a208007ed1a398a9b53f88bda3e3c0bbf3a1067" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/get-resolver/active-scan.fasl"
    :FASL-SHA256
    "b7016da8be6e9ea9d6e2758042456bdcaa0f760363c5450c6990b7a6192e8dc2")
   (:FILE "src/get-resolver/active-read.lisp" :SOURCE-SHA256
    "47630e5d42c785e39e15dd714177cd86159129a5391d82321385f92317bea659" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/get-resolver/active-read.fasl"
    :FASL-SHA256
    "fee6682ca804516e29395351b766cc3b3b1198a4c8135d194c83765beb89cd56")
   (:FILE "src/get-resolver/active-preflight.lisp" :SOURCE-SHA256
    "f42416d916d734e0f93fa56cf2632ef0aa882240acae0d7e1faccec964464db0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/get-resolver/active-preflight.fasl"
    :FASL-SHA256
    "9a8101b4e24267632e38bf659dd970e15aa0bae18fc8ea1a0678fd19ce781119")
   (:FILE "src/get-resolver/active-init.lisp" :SOURCE-SHA256
    "2f9380674cf4b590b071ab9d769a4b79292f544d920c0fc5ff33146dde7686f6" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/get-resolver/active-init.fasl"
    :FASL-SHA256
    "421568e86e2e381a5f8718b68944356c8b88cd3ee314dd01b3cdd2d56af52d2d")
   (:FILE "src/get-resolver/active-directory.lisp" :SOURCE-SHA256
    "c2b9a9ac3209270e9949720473908460548430a8098c9199fb55d2317a87682b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/get-resolver/active-directory.fasl"
    :FASL-SHA256
    "d7e7a59f6421faf56002869e3cfd32befc843b167283f204889cc6f8c0c38aee")
   (:FILE "src/get-resolver/active-build.lisp" :SOURCE-SHA256
    "0eed95930d41c515965ae8ab0a14fbb94597a42ea38b86f205ea0938cf4631de" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/get-resolver/active-build.fasl"
    :FASL-SHA256
    "eafb5195712d92a5ef62cfbb4117e9e7cb682271cc527e0e1a12d5a36b134abc")
   (:FILE "src/get-directory/types.lisp" :SOURCE-SHA256
    "0e2348291a4994f45bd1f6fe5efdc66041d2fdce18641d1af11b6c850ed69b2b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/get-directory/types.fasl"
    :FASL-SHA256
    "278ef45e050f967cc5cb4ef5ea99c5397173fa574811a1ed4151f4a5dd17ec2a")
   (:FILE "src/get-directory/sources-types.lisp" :SOURCE-SHA256
    "862342b07d6a8aae834aaf3da4149682fcd1dcbdae971adad640597583547099" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/get-directory/sources-types.fasl"
    :FASL-SHA256
    "b3cb1f83654061253c5371fe9d5ef62cd10ce2b75eeb7e0b379002241a172248")
   (:FILE "src/get-directory/sources-read.lisp" :SOURCE-SHA256
    "ee4a3b81322fbd51ce928be0b73e9bc180af7ed39f936b68ec9a152dd2a180c2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/get-directory/sources-read.fasl"
    :FASL-SHA256
    "d4ef6ecf4f90d2bb519a82847fc62164bc1cf4f56f7621b823e98c171c6f6880")
   (:FILE "src/get-directory/read.lisp" :SOURCE-SHA256
    "a2287eb7e91bed84f3727baaf81376bbe5bf5df15cde1ea268c6d2fa66fe0a5d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/get-directory/read.fasl"
    :FASL-SHA256
    "59cc237a6c40d341b5aafc2f5b80a9118185f16771bbeaf9194940f7fa9f2058")
   (:FILE "src/get-directory/package.lisp" :SOURCE-SHA256
    "e779202c8df502749a81d0c6f9f0d505d000e09231f3679b1a91303fbcbf36f9" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/get-directory/package.fasl"
    :FASL-SHA256
    "0180e11dbf88d8b31e5bc6b33270104f6f92fa59b7da8a92efe4d8d938e22d47")
   (:FILE "src/get-directory/build.lisp" :SOURCE-SHA256
    "9bebb3cd9d66a8ec2fd0c72ad828e00ab2347093642653da45ef263bc855f947" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/get-directory/build.fasl"
    :FASL-SHA256
    "0c0bcaa7c9c35b9e9d9257fbcc7d1ba2c4de11806426a8a7f07b4d2746501de7")
   (:FILE "src/foundation/record.lisp" :SOURCE-SHA256
    "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/foundation/record.fasl"
    :FASL-SHA256
    "a580ace4a677181ebd660c56d51888e41eb530ffc875e760057b46eed8bad6d7")
   (:FILE "src/foundation/package.lisp" :SOURCE-SHA256
    "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/foundation/package.fasl"
    :FASL-SHA256
    "f540715bb9a09a7961352b489ab31668127a07df59322df69b4b7ff1ab1a2e5f")
   (:FILE "src/foundation/crc32c.lisp" :SOURCE-SHA256
    "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/foundation/crc32c.fasl"
    :FASL-SHA256
    "0ad357970eac93f58b30fed6610fe85bf3e1f1bb2886bad5fd27c5aa45b3b52d")
   (:FILE "src/foundation/conditions.lisp" :SOURCE-SHA256
    "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/foundation/conditions.fasl"
    :FASL-SHA256
    "9e973e5b82939c8a14ecc4e235dca36e1d4d041a18068480e1d6132aed5be207")
   (:FILE "src/foundation/binary.lisp" :SOURCE-SHA256
    "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/foundation/binary.fasl"
    :FASL-SHA256
    "5a507494da3680ca4425a97899ee2a122867de4040a94fe6dffd861aeb887eda")
   (:FILE "src/foundation/batch.lisp" :SOURCE-SHA256
    "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/foundation/batch.fasl"
    :FASL-SHA256
    "1433b361fcd10ec59220570e3a53ffecd63e46894634ff2381efa371125b570a")
   (:FILE "src/execution/writer.lisp" :SOURCE-SHA256
    "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/execution/writer.fasl"
    :FASL-SHA256
    "7559fc98fa011b8d3d3d653557ee7408fe00a4562922527fd4dfabf212d12374")
   (:FILE "src/execution/worker-types.lisp" :SOURCE-SHA256
    "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/execution/worker-types.fasl"
    :FASL-SHA256
    "5404119cf45d6024c641b3f6ba0b3afcd8668c0c0db958d636212f3bb08ccd64")
   (:FILE "src/execution/worker-run.lisp" :SOURCE-SHA256
    "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/execution/worker-run.fasl"
    :FASL-SHA256
    "38354d6b5a0d85d784c80fa1579c607b68aaba1439c5383a44f3e3fc1ca5d770")
   (:FILE "src/execution/worker-claim.lisp" :SOURCE-SHA256
    "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/execution/worker-claim.fasl"
    :FASL-SHA256
    "6ada29e1325434572c9d9dcb88175bcbb905550f3f21054008f332ac5f0ebfee")
   (:FILE "src/execution/worker-boundary.lisp" :SOURCE-SHA256
    "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/execution/worker-boundary.fasl"
    :FASL-SHA256
    "6c9f4c7328365d5c8e2b3acfcb6b2225515f9b3bdcc530b10d3faa3b3a8cad62")
   (:FILE "src/execution/ready.lisp" :SOURCE-SHA256
    "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/execution/ready.fasl"
    :FASL-SHA256
    "a20968a1f7de8d8198d4b5aed53ebe28d292e6b2412ecca2b53ea0ad5c343854")
   (:FILE "src/execution/ready-types.lisp" :SOURCE-SHA256
    "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/execution/ready-types.fasl"
    :FASL-SHA256
    "a5f9e8c09423350aad4ca79efd444810b800d6f5da9a7aac3483dfee7d0ce2d0")
   (:FILE "src/execution/ready-recycle.lisp" :SOURCE-SHA256
    "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/execution/ready-recycle.fasl"
    :FASL-SHA256
    "e82b61eda0d0e344a0c38947308c9cae0220c75dc30bdae1e11c762dca44aa59")
   (:FILE "src/execution/queue.lisp" :SOURCE-SHA256
    "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/execution/queue.fasl"
    :FASL-SHA256
    "d6ceaa3d6ccd878505ee30b392f853178206e2127d856fa24ca835fb83243935")
   (:FILE "src/execution/package.lisp" :SOURCE-SHA256
    "833e501e6ee6e3acb8a6d37139c4605a05e06c425a35318adbcf651aa2f9db30" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/execution/package.fasl"
    :FASL-SHA256
    "aa5ce1628b9077f5b87e8b9c2afcb614311b1861468dcd714cd4e92c75b5c2f3")
   (:FILE "src/execution/handoff.lisp" :SOURCE-SHA256
    "3ce9f47008416f210173fd3a83ee7665b2103f26039d36e2601b31e5e3ebd72a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/execution/handoff.fasl"
    :FASL-SHA256
    "0cd3ae725826b904a58b7067ffb9ae427fd9c5e29af39bcef75b8632ac1f2bb0")
   (:FILE "src/epochs/types.lisp" :SOURCE-SHA256
    "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/epochs/types.fasl"
    :FASL-SHA256
    "7e9a95cdcc9cfaa2ab896c10b67a966c9cdd7ebea97df2a3971c6d305e171e06")
   (:FILE "src/epochs/retire.lisp" :SOURCE-SHA256
    "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/epochs/retire.fasl"
    :FASL-SHA256
    "67baecc3fa2da4c3791f99f3394c621f7b7ef29effb2050266114f66074897c2")
   (:FILE "src/epochs/reclaim.lisp" :SOURCE-SHA256
    "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/epochs/reclaim.fasl"
    :FASL-SHA256
    "f930cd3e257458ebb5b1e78be4dc1782b28ca2ef227b6f07d5a4ad5da0e247f3")
   (:FILE "src/epochs/read.lisp" :SOURCE-SHA256
    "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/epochs/read.fasl"
    :FASL-SHA256
    "c410abca1e45f2e98d3b07096fa65b44d90f85ada0be6cf8015a8ff7d252e3b3")
   (:FILE "src/epochs/package.lisp" :SOURCE-SHA256
    "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/epochs/package.fasl"
    :FASL-SHA256
    "df7642d7dc999edc46b07c47cb294bc930d114860bdb069e57b349cae9dd019a")
   (:FILE "src/epochs/core.lisp" :SOURCE-SHA256
    "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/epochs/core.fasl"
    :FASL-SHA256
    "9e18cdbe63b2b5320b154a538e0158b2bff757349b5ec606e6b9832ed7103b00")
   (:FILE "src/dispatch/types.lisp" :SOURCE-SHA256
    "cc44882c565a89de08f5add79333868ebfca4fc3f97bf9104d36375d014d4720" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/dispatch/types.fasl"
    :FASL-SHA256
    "5c94875c79b8100464766da45537497f1a0a92a9e90653c9cf82a659f045ea15")
   (:FILE "src/dispatch/package.lisp" :SOURCE-SHA256
    "acb5fd19599e89e821a89bcca8f94064f33cdc71cdfcf204aadcd4fb52dd795f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/dispatch/package.fasl"
    :FASL-SHA256
    "bd4419bc3753d886ea531ead5f2c46fc9e210d6ce6cd27d26f894faab65c4d19")
   (:FILE "src/dispatch/claim.lisp" :SOURCE-SHA256
    "224e4114b8b91affced874bea9c23cae5c79526e8ddae62e31a0cafcbb763682" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/dispatch/claim.fasl"
    :FASL-SHA256
    "541a43aa32fb57cda04ee30481ea8e1cc80aec89d9c4ec8f9aa8701353da9c23")
   (:FILE "src/dispatch/build.lisp" :SOURCE-SHA256
    "c78d31a753db78baea520e9ea0cccf6e88cad9cca8bc75261a6ff26c2ac01fe5" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/dispatch/build.fasl"
    :FASL-SHA256
    "575bc6d73409204da84c407df84be7383a6ae77ff75dcace9b0d97064b59941a")
   (:FILE "src/csn/registry.lisp" :SOURCE-SHA256
    "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/csn/registry.fasl"
    :FASL-SHA256
    "ad11879c64867a69af0d30fef8de07d834fad03f3ef26a20c9689388a5bd5d0d")
   (:FILE "src/csn/package.lisp" :SOURCE-SHA256
    "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/csn/package.fasl"
    :FASL-SHA256
    "67479f343b9a16cb5203a3dcd3bedd810ed101ec70d92e6bbb125dbeb8d0f1ff")
   (:FILE "src/control/types.lisp" :SOURCE-SHA256
    "ad2f45bcd44fed463d60b580a17d89192a1087177573b1633674ed68d252367d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/control/types.fasl"
    :FASL-SHA256
    "c728dfecf0e78aa0d1aec427df8d5751c363b650608bec65b2044a36164d9cd2")
   (:FILE "src/control/transfer.lisp" :SOURCE-SHA256
    "6e257bfb6ce8e6d11263cc6788de4fc35657a82e159af7b46341c3bb208e0275" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/control/transfer.fasl"
    :FASL-SHA256
    "f124b22e13abb613878c9d53064befe307bc5ce65d12925d73fa5f27a0a35be4")
   (:FILE "src/control/publication.lisp" :SOURCE-SHA256
    "3f867f54309b0a2985660dd8145b100eb097c1d7fdfcd917c61d73d082009109" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/control/publication.fasl"
    :FASL-SHA256
    "eaa28e40676408a318b7679be094abbb33e6306a5a5cfbefafa86c43aa2f837d")
   (:FILE "src/control/publication-read.lisp" :SOURCE-SHA256
    "cfb12232748e62d1edef6896389e8d54057951c058ee43d70dd346b10c5f582e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/control/publication-read.fasl"
    :FASL-SHA256
    "74b075d1b32ff0c67d832ffb017014a1d172aad1620d29be615b9dc34c0b0e33")
   (:FILE "src/control/prepare.lisp" :SOURCE-SHA256
    "1226996af2215e3ebf06265e48d43632a1642ccacd312fabd983c5f3bfa7536d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/control/prepare.fasl"
    :FASL-SHA256
    "d35a01d60482fd259be58a256ec09658c5b9a0402ece8108b3aaa854ac06a4cb")
   (:FILE "src/control/preflight.lisp" :SOURCE-SHA256
    "48326533ac0934cb3b1e3fc7657ef48f38912b6c08e9e38367301905f7711584" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/control/preflight.fasl"
    :FASL-SHA256
    "fa6f5576d3367fd38135485c2fdfe4a083afc57d4f10dcb2f3bfc0b8394d2165")
   (:FILE "src/control/package.lisp" :SOURCE-SHA256
    "c6ca23c7b0a8cea48bec2b7017482802f2078b0d58414c6708fbfe5f7d46377d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/control/package.fasl"
    :FASL-SHA256
    "23e074402bcf91a86b5d19dec854911545b321668729e1b506e6195eaef321e8")
   (:FILE "src/control/dependency.lisp" :SOURCE-SHA256
    "f328344e4824fd53d03a0476b45fb87efada43ddee895e13afd76ac44413d128" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/control/dependency.fasl"
    :FASL-SHA256
    "627f905b22d23e3ba63ce946b9d06c19dcabd4239b96142efa674b5f89713b17")
   (:FILE "src/control/build.lisp" :SOURCE-SHA256
    "1904e81a6cebbb178598a41e1b2283240fc21506781b1e31da407610ce0f519c" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/control/build.fasl"
    :FASL-SHA256
    "c5a5af590d6a8645941436e01bf8fe0543bd46a0a3243496c39ca86bc4a2433a")
   (:FILE "src/codec/utf8.lisp" :SOURCE-SHA256
    "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/codec/utf8.fasl"
    :FASL-SHA256
    "577c93bdd3915f7112457a90947afa99d388194fc20ed188d88bf58a66443792")
   (:FILE "src/codec/package.lisp" :SOURCE-SHA256
    "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/codec/package.fasl"
    :FASL-SHA256
    "af7e10890e6632e183af61ea876f27f7ed32ca4461cae0811efbc794939aa3cc")
   (:FILE "src/codec/cbor-write.lisp" :SOURCE-SHA256
    "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/codec/cbor-write.fasl"
    :FASL-SHA256
    "52be86f5b04a512a37f21a0588febb7ecd1e166cb8a7542802893e4e66cdba00")
   (:FILE "src/codec/cbor-string-write.lisp" :SOURCE-SHA256
    "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/codec/cbor-string-write.fasl"
    :FASL-SHA256
    "3f3a2e519fa4cad1176952df455916c829fd67e39b67c427498b6c0fd6c33242")
   (:FILE "src/codec/cbor-space.lisp" :SOURCE-SHA256
    "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/codec/cbor-space.fasl"
    :FASL-SHA256
    "64ad5baac16c4f2e74a57a1f1cbf7b918ffaf3f08cf1e1c66961cf0df4b29820")
   (:FILE "src/codec/cbor-simple-write.lisp" :SOURCE-SHA256
    "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/codec/cbor-simple-write.fasl"
    :FASL-SHA256
    "b428892da822e3e7a04e9d056da7f853774a19196ffeb7b2a6b355aafa95c1db")
   (:FILE "src/codec/cbor-scan.lisp" :SOURCE-SHA256
    "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/codec/cbor-scan.fasl"
    :FASL-SHA256
    "7900e4c3c577a1601bc9b9df672671ce95e672d91bb0c35cd91a9fde45ef5c7a")
   (:FILE "src/codec/cbor-scan-stack.lisp" :SOURCE-SHA256
    "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/codec/cbor-scan-stack.fasl"
    :FASL-SHA256
    "1dd32802181be559e87d7e446bbab0c0bec53a7239b8cc74349e10195ebc94da")
   (:FILE "src/codec/cbor-scan-minimal.lisp" :SOURCE-SHA256
    "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/codec/cbor-scan-minimal.fasl"
    :FASL-SHA256
    "4f2bee3e661cc51d1edd33714a681eafa87c6293bda94b9e7b946a452a611f5c")
   (:FILE "src/codec/cbor-scan-items.lisp" :SOURCE-SHA256
    "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/codec/cbor-scan-items.fasl"
    :FASL-SHA256
    "2af8ebda81483bf59a75ce53c1f3e76de27c269eecb80424aea1c87b13fcf931")
   (:FILE "src/codec/cbor-scan-input.lisp" :SOURCE-SHA256
    "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/codec/cbor-scan-input.fasl"
    :FASL-SHA256
    "3f177d27869d73a89b753ab6d356c6d91107ec301fc07cbb7d5a4e480a6806ca")
   (:FILE "src/codec/cbor-package.lisp" :SOURCE-SHA256
    "f74f5d1cb0b71658aaeb36518530c2396d132a783cb58109788e434691acb503" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/codec/cbor-package.fasl"
    :FASL-SHA256
    "d969dc825686d0f6be625106fe65bb497f81ecaa6fbe429fe2a518b8a3d4b879")
   (:FILE "src/codec/cbor-minimal.lisp" :SOURCE-SHA256
    "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/codec/cbor-minimal.fasl"
    :FASL-SHA256
    "c895e229496dbe6c9ef78cab1fd5ad57c584ba07035aa4531ac5566289714269")
   (:FILE "src/codec/cbor-header.lisp" :SOURCE-SHA256
    "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/codec/cbor-header.fasl"
    :FASL-SHA256
    "e1ed4f2e2c13dde7228290704030b5472e2b6ad753935617a7828628f2825d89")
   (:FILE "src/codec/cbor-float-write.lisp" :SOURCE-SHA256
    "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/codec/cbor-float-write.fasl"
    :FASL-SHA256
    "c6606ca2fc846a766c67614d59285bd5bf6f551268f08e2f4fc90c125aa24a1d")
   (:FILE "src/codec/cbor-float-narrow.lisp" :SOURCE-SHA256
    "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/codec/cbor-float-narrow.fasl"
    :FASL-SHA256
    "3b43acc2f2c8850445c4400cb835d3d104e903bbb37d83485100c6462ef28c02")
   (:FILE "src/codec/cbor-float-minimal.lisp" :SOURCE-SHA256
    "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/codec/cbor-float-minimal.fasl"
    :FASL-SHA256
    "451e25324887d0c9a47c4a63099af6dd7b3c9ff5f4f4cb94cdc6bc403a457d7e")
   (:FILE "src/codec/cbor-array-write.lisp" :SOURCE-SHA256
    "2f71d857991f32aacf6c7a0ecbe5e06bcba9289b20f46e496b3e3737ce6c242b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/codec/cbor-array-write.fasl"
    :FASL-SHA256
    "0090edda1d03ffa68d72d86331d9529dfa26817346d8e288c40971887af5619f")
   (:FILE "src/codec/cbor-array-input.lisp" :SOURCE-SHA256
    "e36efda9d66f532b8221f898a078b7f77dc2a41cdc953ece0b2e08b4ed2417f4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/codec/cbor-array-input.fasl"
    :FASL-SHA256
    "d9f4cbce816583052930a5bd98353d8283332e2d8cf742aafc3f61f1a4de3c6b")
   (:FILE "src/cache/write.lisp" :SOURCE-SHA256
    "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/cache/write.fasl"
    :FASL-SHA256
    "65755ae69a300c68099fed30d23ac737da64a294e6394e462f65469e1113dd20")
   (:FILE "src/cache/types.lisp" :SOURCE-SHA256
    "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/cache/types.fasl"
    :FASL-SHA256
    "5c5ca5ed8afb257154de0fbd1f79d83256cba1a5dfa19402f96bf87057b52ac1")
   (:FILE "src/cache/read.lisp" :SOURCE-SHA256
    "5700e43ae8ee859e96bdecb5953af43a712fd9e6ec23a53565759676bb07f85a" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/cache/read.fasl"
    :FASL-SHA256
    "4e28159e93946847c2a8b3ef27846f0cda36ad97d3fd77e16c9bfb6eaedda54e")
   (:FILE "src/cache/package.lisp" :SOURCE-SHA256
    "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/cache/package.fasl"
    :FASL-SHA256
    "08effdd72b614d229732e206d4a06e05ef8800bfc80549b3912d540233fff4bd")
   (:FILE "src/cache/core.lisp" :SOURCE-SHA256
    "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/cache/core.fasl"
    :FASL-SHA256
    "ac7e5f931e06ba23fda35cffd2749e256007836da3313fa1a90000d03171dbe7")
   (:FILE "src/cache/clock.lisp" :SOURCE-SHA256
    "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/cache/clock.fasl"
    :FASL-SHA256
    "b0cf571ce7d8d919f2d3363cb48d826fa0d4ad0c76c6ed0ca2183ba230bd7a97")
   (:FILE "src/cache/build.lisp" :SOURCE-SHA256
    "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/cache/build.fasl"
    :FASL-SHA256
    "6fe56f6e8e01270265ab66f0226b137b11660c75fc6e4c2bb0de161f4bc92ef1")
   (:FILE "src/active/types.lisp" :SOURCE-SHA256
    "48fe584096fc253ef182ab428c1887e443af06d75aaa938df660c77e60b39bfb" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/active/types.fasl"
    :FASL-SHA256
    "a82581748a4e49ded4cfdd550d25d99de900d527eba56271732b060dba3c8e04")
   (:FILE "src/active/source.lisp" :SOURCE-SHA256
    "ff96fe360b46190ecc08ee9e05a813715dc3399054f93693f9309012aec6547d" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/active/source.fasl"
    :FASL-SHA256
    "82a4e8ff040910fa63033d6765a0e849635957876defba6383b5eff8518f58c3")
   (:FILE "src/active/prepare.lisp" :SOURCE-SHA256
    "7b45fb01132c45c9bec76f374edaa8de91ac6bb2d61ae5c359e1fa10c6346f53" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/active/prepare.fasl"
    :FASL-SHA256
    "1482f602e0871ffaa12d20c0516554e582e7100fba3847914825e0ea3fc473ba")
   (:FILE "src/active/preflight.lisp" :SOURCE-SHA256
    "ef7b592daecc223d78cbcda138b5938abc01593b486482bec06f2721cfd955a2" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/active/preflight.fasl"
    :FASL-SHA256
    "a6d42ff5b3bb858ae47f8c507e8ba4e5d1cd6ffe957c16b3b9c8f376bbb44cf5")
   (:FILE "src/active/package.lisp" :SOURCE-SHA256
    "4a6fa4187ef5d44aec4e65d57ee6d6046485f283cc9009c1d94263bee745fa3b" :FASL
    "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/reject-exact-record-budget/fasl/src/active/package.fasl"
    :FASL-SHA256
    "625f9d2ffa52e76072a0f005120b13c482e42ecd02102890216b4dd5366e1fd0"))
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
    "TEST-REQ-AFF-008-ACTIVE-PREFLIGHT-RECORD-BOUNDARY"))
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
   "TEST-REQ-AFF-008-ACTIVE-PREFLIGHT-RECORD-BOUNDARY")
  :FAILURE-KIND :PRODUCT-CONDITION :SOURCE-MANIFEST
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
    "f42416d916d734e0f93fa56cf2632ef0aa882240acae0d7e1faccec964464db0")
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
  "06e4fd3e25400ef7f025788baebbefa0b9a3a4aacc28473926df8179e6468f4e"
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
    "f42416d916d734e0f93fa56cf2632ef0aa882240acae0d7e1faccec964464db0")
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
