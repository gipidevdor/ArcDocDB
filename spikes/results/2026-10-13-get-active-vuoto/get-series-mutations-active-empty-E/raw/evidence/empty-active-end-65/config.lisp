(:SCHEMA-VERSION 1 :KIND :GET-ACTIVE-INIT-MUTATION-CONFIG :FILES
 ("arcdocdb.asd" "src/active/package.lisp" "src/active/preflight.lisp"
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
  "src/get-resolver/active-build.lisp" "src/get-resolver/active-directory.lisp"
  "src/get-resolver/active-init.lisp" "src/get-resolver/active-preflight.lisp"
  "src/get-resolver/active-read.lisp" "src/get-resolver/active-scan.lisp"
  "src/get-resolver/active-types.lisp" "src/get-resolver/build.lisp"
  "src/get-resolver/package.lisp" "src/get-resolver/read.lisp"
  "src/get-resolver/rows.lisp" "src/get-resolver/scan.lisp"
  "src/get-resolver/sort.lisp" "src/get-resolver/types.lisp"
  "src/get/build.lisp" "src/get/lifecycle.lisp" "src/get/lookup.lisp"
  "src/get/package.lisp" "src/get/segment.lisp" "src/get/target.lisp"
  "src/get/types.lisp" "src/hash/arithmetic.lisp" "src/hash/blocks.lisp"
  "src/hash/hash64.lisp" "src/hash/package.lisp" "src/index/core.lisp"
  "src/index/hash-digests.lisp" "src/index/hash-seed.lisp"
  "src/index/package.lisp" "src/index/primary-arena.lisp"
  "src/index/primary-build.lisp" "src/index/primary-core.lisp"
  "src/index/primary-directory.lisp" "src/index/primary-package.lisp"
  "src/index/primary-probe.lisp" "src/index/primary-read.lisp"
  "src/index/primary-relocate.lisp" "src/index/primary-types.lisp"
  "src/index/primary-write.lisp" "src/index/read.lisp"
  "src/index/rebuild-budget.lisp" "src/index/rebuild-copy.lisp"
  "src/index/rebuild-scan.lisp" "src/index/rebuild.lisp"
  "src/index/relocate.lisp" "src/index/types.lisp" "src/index/validation.lisp"
  "src/index/write.lisp" "src/io/flush.lisp" "src/io/identity-types.lisp"
  "src/io/identity.lisp" "src/io/lifecycle.lisp" "src/io/native.lisp"
  "src/io/package.lisp" "src/io/transfer.lisp" "src/io/types.lisp"
  "src/mvcc/package.lisp" "src/mvcc/snapshots-core.lisp"
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
  "tests/codec/cbor-write-roundtrip.lisp" "tests/codec/cbor-write-support.lisp"
  "tests/codec/cbor-write-threads.lisp" "tests/codec/cbor-write.lisp"
  "tests/codec/support.lisp" "tests/codec/threads.lisp" "tests/codec/utf8.lisp"
  "tests/csn/registry.lisp" "tests/csn/support.lisp" "tests/csn/threads.lisp"
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
  "tests/lint-fixtures/bad.lisp" "tests/lint-fixtures/good.lisp"
  "tests/lint-fixtures/keyword-barrier.lisp"
  "tests/lint-fixtures/qualified-reader.lisp" "tests/mvcc/capture.lisp"
  "tests/mvcc/lifecycle.lisp" "tests/mvcc/support.lisp"
  "tests/read/lifecycle.lisp" "tests/read/support.lisp"
  "tests/read/threads.lisp" "tests/recovery/corruption.lisp"
  "tests/recovery/decisions-audit.lisp" "tests/recovery/decisions-radix.lisp"
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
  "tests/wal/support.lisp" "tools/get-active-init-mutation.lisp"
  "tools/evidence-storage.lisp")
 :BASELINE-MANIFEST
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
 :MANIFEST
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
   "c797bc3c8384be42342d27961ab894933365d7a89e9a47bfc6e40e7c091e3267")
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
 :CHANGED-PATHS ("src/get-resolver/active-init.lisp") :MUTATION
 (:NAME "empty-active-end-65" :FILE "src/get-resolver/active-init.lisp" :TEST
  ("ARCDOCDB.GET.DIRECTORY.TESTS"
   "TEST-REQ-WAL-006-SERIES-GET-EMPTY-ACTIVE-INITIALIZATION-NATIVE-V1-V2")
  :BEFORE
  "(%make-radice-get-attiva source nil 0 0 0 +segment-header-bytes+ content)"
  :AFTER "(%make-radice-get-attiva source nil 0 0 0 65 content)"
  :EXPECTED-FAILURE :EMPTY-END-FRONTIER)
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
 :TEST-SUITES
 (("ARCDOCDB.SERIES.TESTS" "*TESTS*" "tests/series/controller.lisp"
   "SERIES-BOOTSTRAP-")
  ("ARCDOCDB.SERIES.TESTS" "*TESTS*" "tests/series/threads.lisp"
   "SERIES-BOOTSTRAP-")
  ("ARCDOCDB.GET.DIRECTORY.TESTS" "*GET-DIRECTORY-TESTS*"
   "tests/get-directory/series-read.lisp" "SERIES-GET-EMPTY-ACTIVE-"))
 :COMPILED-SOURCE-FILES
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
  "src/get-resolver/active-build.lisp" "src/get-resolver/active-directory.lisp"
  "src/get-resolver/active-init.lisp" "src/get-resolver/active-preflight.lisp"
  "src/get-resolver/active-read.lisp" "src/get-resolver/active-scan.lisp"
  "src/get-resolver/active-types.lisp" "src/get-resolver/build.lisp"
  "src/get-resolver/package.lisp" "src/get-resolver/read.lisp"
  "src/get-resolver/rows.lisp" "src/get-resolver/scan.lisp"
  "src/get-resolver/sort.lisp" "src/get-resolver/types.lisp"
  "src/get/build.lisp" "src/get/lifecycle.lisp" "src/get/lookup.lisp"
  "src/get/package.lisp" "src/get/segment.lisp" "src/get/target.lisp"
  "src/get/types.lisp" "src/hash/arithmetic.lisp" "src/hash/blocks.lisp"
  "src/hash/hash64.lisp" "src/hash/package.lisp" "src/index/core.lisp"
  "src/index/hash-digests.lisp" "src/index/hash-seed.lisp"
  "src/index/package.lisp" "src/index/primary-arena.lisp"
  "src/index/primary-build.lisp" "src/index/primary-core.lisp"
  "src/index/primary-directory.lisp" "src/index/primary-package.lisp"
  "src/index/primary-probe.lisp" "src/index/primary-read.lisp"
  "src/index/primary-relocate.lisp" "src/index/primary-types.lisp"
  "src/index/primary-write.lisp" "src/index/read.lisp"
  "src/index/rebuild-budget.lisp" "src/index/rebuild-copy.lisp"
  "src/index/rebuild-scan.lisp" "src/index/rebuild.lisp"
  "src/index/relocate.lisp" "src/index/types.lisp" "src/index/validation.lisp"
  "src/index/write.lisp" "src/io/flush.lisp" "src/io/identity-types.lisp"
  "src/io/identity.lisp" "src/io/lifecycle.lisp" "src/io/native.lisp"
  "src/io/package.lisp" "src/io/transfer.lisp" "src/io/types.lisp"
  "src/mvcc/package.lisp" "src/mvcc/snapshots-core.lisp"
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
  "tests/codec/cbor-write-roundtrip.lisp" "tests/codec/cbor-write-support.lisp"
  "tests/codec/cbor-write-threads.lisp" "tests/codec/cbor-write.lisp"
  "tests/codec/support.lisp" "tests/codec/threads.lisp" "tests/codec/utf8.lisp"
  "tests/csn/registry.lisp" "tests/csn/support.lisp" "tests/csn/threads.lisp"
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
  "tests/recovery/decisions-radix.lisp" "tests/recovery/decisions-support.lisp"
  "tests/recovery/decisions.lisp" "tests/recovery/inventory-support.lisp"
  "tests/recovery/inventory.lisp" "tests/recovery/manifest-audit.lisp"
  "tests/recovery/manifest-support.lisp" "tests/recovery/manifest.lisp"
  "tests/recovery/scan.lisp" "tests/recovery/support.lisp"
  "tests/scheduler/controller.lisp" "tests/scheduler/lifecycle.lisp"
  "tests/scheduler/support.lisp" "tests/series/boundaries.lisp"
  "tests/series/controller.lisp" "tests/series/support.lisp"
  "tests/series/threads.lisp" "tests/series/worker-bridge.lisp"
  "tests/series/worker-routing.lisp" "tests/smoke.lisp"
  "tests/storage/compaction-scan.lisp" "tests/storage/control-payload.lisp"
  "tests/storage/log-header.lisp" "tests/storage/segment-header.lisp"
  "tests/storage/support.lisp" "tests/wal/builder.lisp"
  "tests/wal/csn-threads.lisp" "tests/wal/csn.lisp" "tests/wal/fault.lisp"
  "tests/wal/group.lisp" "tests/wal/native.lisp" "tests/wal/support.lisp")
 :CHILD-REPORT
 "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/evidence/empty-active-end-65/child-report.lisp")
