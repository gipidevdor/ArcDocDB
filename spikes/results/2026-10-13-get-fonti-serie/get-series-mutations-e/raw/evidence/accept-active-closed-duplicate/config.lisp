(:FILES
 ("arcdocdb.asd" "src/cache/build.lisp" "src/cache/clock.lisp"
  "src/cache/core.lisp" "src/cache/package.lisp" "src/cache/read.lisp"
  "src/cache/types.lisp" "src/cache/write.lisp"
  "src/codec/cbor-float-minimal.lisp" "src/codec/cbor-header.lisp"
  "src/codec/cbor-minimal.lisp" "src/codec/cbor-package.lisp"
  "src/codec/cbor-scan-input.lisp" "src/codec/cbor-scan-items.lisp"
  "src/codec/cbor-scan-minimal.lisp" "src/codec/cbor-scan-stack.lisp"
  "src/codec/cbor-scan.lisp" "src/codec/cbor-simple-write.lisp"
  "src/codec/cbor-space.lisp" "src/codec/cbor-string-write.lisp"
  "src/codec/cbor-write.lisp" "src/codec/package.lisp" "src/codec/utf8.lisp"
  "src/csn/package.lisp" "src/csn/registry.lisp" "src/epochs/core.lisp"
  "src/epochs/package.lisp" "src/epochs/read.lisp" "src/epochs/reclaim.lisp"
  "src/epochs/retire.lisp" "src/epochs/types.lisp" "src/execution/handoff.lisp"
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
  "src/recovery/package.lisp" "src/recovery/scan.lisp" "src/series/events.lisp"
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
  "tests/foundation/support.lisp" "tests/get-directory/support.lisp"
  "tests/get-directory/construction.lisp" "tests/get-directory/read.lisp"
  "tests/get-directory/threads.lisp" "tests/get-directory/series-support.lisp"
  "tests/get-directory/series-read.lisp" "tools/get-series-mutation.lisp")
 :MANIFEST
 ((:FILE "arcdocdb.asd" :MD5 "e8571ddf559a7a9b6d291de4fdf50717")
  (:FILE "src/cache/build.lisp" :MD5 "5d70197c8b64ad6f20c8be47a60c73ca")
  (:FILE "src/cache/clock.lisp" :MD5 "3546cf7f5c5ed138068548c20064f499")
  (:FILE "src/cache/core.lisp" :MD5 "72f3a33ce27ddf94c49c495580520004")
  (:FILE "src/cache/package.lisp" :MD5 "a1f6a8e7aa4faed88e984b39871d1e53")
  (:FILE "src/cache/read.lisp" :MD5 "82f937b7b08bd1696ad9c88da2e1c60c")
  (:FILE "src/cache/types.lisp" :MD5 "a25648d870eaa4f0b6e1e3b2cf76e28e")
  (:FILE "src/cache/write.lisp" :MD5 "fc09021f74fb50aac57589614dae04d7")
  (:FILE "src/codec/cbor-float-minimal.lisp" :MD5
   "bc7a7b176e8cdd361b7c4306a1a4de4b")
  (:FILE "src/codec/cbor-header.lisp" :MD5 "6e8c6a49314c2f460aa6f8a1759200b6")
  (:FILE "src/codec/cbor-minimal.lisp" :MD5 "ecd8fe950344059c629927b38fb6e4aa")
  (:FILE "src/codec/cbor-package.lisp" :MD5 "c3f19ffb4aacfdfe502c5e8b12a234f2")
  (:FILE "src/codec/cbor-scan-input.lisp" :MD5
   "f6488e987889432b375254021825dbe5")
  (:FILE "src/codec/cbor-scan-items.lisp" :MD5
   "706c0baa4158bf272c4b0df17c1439d2")
  (:FILE "src/codec/cbor-scan-minimal.lisp" :MD5
   "987e8ed576a21eb644ac1ef2e06edbda")
  (:FILE "src/codec/cbor-scan-stack.lisp" :MD5
   "cf1999ddb10f879aeefbeea853742d57")
  (:FILE "src/codec/cbor-scan.lisp" :MD5 "0c33aedcdb352e78a3c694cf796e6692")
  (:FILE "src/codec/cbor-simple-write.lisp" :MD5
   "200373402e6e082dd8c7afde305302bb")
  (:FILE "src/codec/cbor-space.lisp" :MD5 "c33cdcc45f45218aa3e8bf26ce0ee575")
  (:FILE "src/codec/cbor-string-write.lisp" :MD5
   "b13e92b5f24a42fe283c17b649722b6a")
  (:FILE "src/codec/cbor-write.lisp" :MD5 "69e77bcd15b5413a815a65c5081229db")
  (:FILE "src/codec/package.lisp" :MD5 "d885bd2a9860eb60aec1a775e5031d5e")
  (:FILE "src/codec/utf8.lisp" :MD5 "0f67dd5c51bf6a63bc292ab4e2a280c2")
  (:FILE "src/csn/package.lisp" :MD5 "1130012fc5613a5648d22ed8628be0e8")
  (:FILE "src/csn/registry.lisp" :MD5 "a1cdb5661fc54beba5bf00e4765f3235")
  (:FILE "src/epochs/core.lisp" :MD5 "765d14c88cd288093a77a57930cd6999")
  (:FILE "src/epochs/package.lisp" :MD5 "875201dfab0a84efd40fe9828cc293c8")
  (:FILE "src/epochs/read.lisp" :MD5 "975b5f74e0c5a38ce978f4d9c7fcc6b8")
  (:FILE "src/epochs/reclaim.lisp" :MD5 "036dd02adf87d33c3ae2f40735c733fa")
  (:FILE "src/epochs/retire.lisp" :MD5 "653b974f310c09f6e2224a84acc43bbf")
  (:FILE "src/epochs/types.lisp" :MD5 "82253491f995f5bc153fb5ebf30d564c")
  (:FILE "src/execution/handoff.lisp" :MD5 "6b85eebe69366e78ed5fc5cc20735f00")
  (:FILE "src/execution/package.lisp" :MD5 "cb5710d6c111cadb7121a50998a747fa")
  (:FILE "src/execution/queue.lisp" :MD5 "8202843bddb817da4279ac959ae3f3c4")
  (:FILE "src/execution/ready-recycle.lisp" :MD5
   "38d26f8c749dd946dfc4b9c57103a892")
  (:FILE "src/execution/ready-types.lisp" :MD5
   "a64d98c9ff429d6103d6e10ee1fd7980")
  (:FILE "src/execution/ready.lisp" :MD5 "2c1892002f0599bb8273093031017520")
  (:FILE "src/execution/worker-boundary.lisp" :MD5
   "c24065d6c8d80d1be53994a0041743df")
  (:FILE "src/execution/worker-claim.lisp" :MD5
   "babd0a78b4185af24ae1fef870c0fabb")
  (:FILE "src/execution/worker-run.lisp" :MD5
   "aa34ca6bc07535e35fea723878d99f66")
  (:FILE "src/execution/worker-types.lisp" :MD5
   "0679ee07c46f69db330706303c70d8d2")
  (:FILE "src/execution/writer.lisp" :MD5 "73019644090e2971f2b54dc36e4491f5")
  (:FILE "src/foundation/batch.lisp" :MD5 "ca642ea47e4bff76f78f5b6d7287d6bd")
  (:FILE "src/foundation/binary.lisp" :MD5 "a06115175f450776762761dce25acdb8")
  (:FILE "src/foundation/conditions.lisp" :MD5
   "942b596396c19815290a57830af2121b")
  (:FILE "src/foundation/crc32c.lisp" :MD5 "4db58e2f48bf77d751f1b83bb9f84b5c")
  (:FILE "src/foundation/package.lisp" :MD5 "5ee593a112958d94163dab17c5aa4ba2")
  (:FILE "src/foundation/record.lisp" :MD5 "c3ed0f09fa3fa6fe20c98e2ed6e69abe")
  (:FILE "src/get-directory/build.lisp" :MD5
   "cde24b2bf5c5637d5501b95bed47df31")
  (:FILE "src/get-directory/package.lisp" :MD5
   "894f6e238fe4047f2bf607fceae86846")
  (:FILE "src/get-directory/read.lisp" :MD5 "74a694385f1aaf03ec87721545494119")
  (:FILE "src/get-directory/sources-read.lisp" :MD5
   "f308c6780bdb4e3839a67eb57e0bbcba")
  (:FILE "src/get-directory/sources-types.lisp" :MD5
   "b846a6348ff7d4b5f7b380b5b3ff8c17")
  (:FILE "src/get-directory/types.lisp" :MD5
   "17c957d6934a31f4ed64313e756de2d2")
  (:FILE "src/get-resolver/active-build.lisp" :MD5
   "c65593cf172f53a8e90a853bbe9504c2")
  (:FILE "src/get-resolver/active-directory.lisp" :MD5
   "6d95f29b331d335175843f47ae44a6ea")
  (:FILE "src/get-resolver/active-preflight.lisp" :MD5
   "f13d422adb6aa9e8489352884137f25a")
  (:FILE "src/get-resolver/active-read.lisp" :MD5
   "521737861e057d663964b0c030552587")
  (:FILE "src/get-resolver/active-scan.lisp" :MD5
   "d6aaec49504a96f37c8ff1bc182c977b")
  (:FILE "src/get-resolver/active-types.lisp" :MD5
   "bd7182e9871fe82530d0c828e473ccde")
  (:FILE "src/get-resolver/build.lisp" :MD5 "bbfb2082103e6712419e180ab972245c")
  (:FILE "src/get-resolver/package.lisp" :MD5
   "6226d131f5562a475048b6444049c4ca")
  (:FILE "src/get-resolver/read.lisp" :MD5 "1339edff0223dbf122f11ff0adbba61c")
  (:FILE "src/get-resolver/rows.lisp" :MD5 "ca9002b81efd0aed9761cd1f78514762")
  (:FILE "src/get-resolver/scan.lisp" :MD5 "536e9dc4ed51072b8a6d1528d3ec18bf")
  (:FILE "src/get-resolver/sort.lisp" :MD5 "2d869293ba47444c4721713d955c6254")
  (:FILE "src/get-resolver/types.lisp" :MD5 "9df13bcc6908e9fa601d173a671e1ccf")
  (:FILE "src/get/build.lisp" :MD5 "c5cc36884b238221cc13ca0c087ec7c2")
  (:FILE "src/get/lifecycle.lisp" :MD5 "e70bfeddd694336bbd088e65f8761834")
  (:FILE "src/get/lookup.lisp" :MD5 "82258ec87aca513a508bc5dee8410dd6")
  (:FILE "src/get/package.lisp" :MD5 "c72633d15c3488699072eb610ebde7c8")
  (:FILE "src/get/segment.lisp" :MD5 "811869eb6a197d3c4e26af4322e52652")
  (:FILE "src/get/target.lisp" :MD5 "1b70dac05d6d2418909eb5105b808e81")
  (:FILE "src/get/types.lisp" :MD5 "c394e5684de5e2d938991c7cb348b93c")
  (:FILE "src/hash/arithmetic.lisp" :MD5 "b5c51802e607e3dd22de68204baf64e9")
  (:FILE "src/hash/blocks.lisp" :MD5 "bef497b9a267c7306d4100000491c814")
  (:FILE "src/hash/hash64.lisp" :MD5 "886b7c08b9929283e8968831cbe5c039")
  (:FILE "src/hash/package.lisp" :MD5 "2d9060e41bc5252067d35e59ac70ee06")
  (:FILE "src/index/core.lisp" :MD5 "65076c355c099b5dc73d185948d3bec4")
  (:FILE "src/index/hash-digests.lisp" :MD5 "43d2209225707352daec6186ef95a805")
  (:FILE "src/index/hash-seed.lisp" :MD5 "45ce41749bc6fa638539815d3f802b96")
  (:FILE "src/index/package.lisp" :MD5 "598a9b65e73151c924b2cdcaf6d96705")
  (:FILE "src/index/primary-arena.lisp" :MD5
   "a319691e3e28b7ea7b927de490cf69ba")
  (:FILE "src/index/primary-build.lisp" :MD5
   "ff2cfbb865290d7a1510fdf6877c7229")
  (:FILE "src/index/primary-core.lisp" :MD5 "fa52433eae199ceeb874bf2bc47afca7")
  (:FILE "src/index/primary-directory.lisp" :MD5
   "1dd67c527257e43f17e006644ecdbd00")
  (:FILE "src/index/primary-package.lisp" :MD5
   "d65cfce399b04f905bf969929962e59a")
  (:FILE "src/index/primary-probe.lisp" :MD5
   "699ce3f1615296fc27fcde3e0d63a4bc")
  (:FILE "src/index/primary-read.lisp" :MD5 "3f317a0d3c5ee86a73651aad36135cc3")
  (:FILE "src/index/primary-relocate.lisp" :MD5
   "5155959766645d3172ae5e73c58cc071")
  (:FILE "src/index/primary-types.lisp" :MD5
   "a59eab6425a60fa2656f86bf87d5c9ac")
  (:FILE "src/index/primary-write.lisp" :MD5
   "e8e31e599356e592af29c0cc4604872b")
  (:FILE "src/index/read.lisp" :MD5 "5b22b90cfe8534086f6aff96d156713e")
  (:FILE "src/index/rebuild-budget.lisp" :MD5
   "0417dd41cb3ec1d62dfd913c19f810ad")
  (:FILE "src/index/rebuild-copy.lisp" :MD5 "8befbbd00ed5c31c1487a11887eba495")
  (:FILE "src/index/rebuild-scan.lisp" :MD5 "1188e7a64a7a5d9482c1233cb9acb452")
  (:FILE "src/index/rebuild.lisp" :MD5 "a450cac8071513365267e7024cbe94b0")
  (:FILE "src/index/relocate.lisp" :MD5 "475dd7d5809a836f01544b447cc8df27")
  (:FILE "src/index/types.lisp" :MD5 "5157fd03ee806ee998ad8f0002d56268")
  (:FILE "src/index/validation.lisp" :MD5 "3384cadf737c7d80c004222022a281f6")
  (:FILE "src/index/write.lisp" :MD5 "f0c8c579cd7db466d243ed3ea9f8e8aa")
  (:FILE "src/io/flush.lisp" :MD5 "716866194d6b9f076e102e84187229c0")
  (:FILE "src/io/identity-types.lisp" :MD5 "d354a095fb378c1b6f27397ffb902227")
  (:FILE "src/io/identity.lisp" :MD5 "06ea105db71f021ea60b2c59645273b4")
  (:FILE "src/io/lifecycle.lisp" :MD5 "11c7103efbe733bbf0a13927f23c3d34")
  (:FILE "src/io/native.lisp" :MD5 "58030bc0c811248a6537e2909d8762d6")
  (:FILE "src/io/package.lisp" :MD5 "c43618d5b3d8725e167f72cb90d9369a")
  (:FILE "src/io/transfer.lisp" :MD5 "a5e7108e80664eb3b562fbd7e680801f")
  (:FILE "src/io/types.lisp" :MD5 "e7b6ee5fd2d57281dbd32bf9b07d0fa6")
  (:FILE "src/mvcc/package.lisp" :MD5 "f188d1dbd5d0adb49f53acf09157aef9")
  (:FILE "src/mvcc/snapshots-core.lisp" :MD5
   "8bb066aab61a18eff175b9edb11e42a2")
  (:FILE "src/mvcc/snapshots-csn.lisp" :MD5 "0e9365e674d1584b111f915ce1f58634")
  (:FILE "src/mvcc/snapshots-lifecycle.lisp" :MD5
   "ff98aea5cb9a7ae2671f6a887a003725")
  (:FILE "src/mvcc/snapshots-read.lisp" :MD5
   "ae3ad96269b5e711a9dbb455f3c0ce48")
  (:FILE "src/mvcc/snapshots-register.lisp" :MD5
   "2d5a795bcefd605c75da91c725ae83a2")
  (:FILE "src/mvcc/snapshots-types.lisp" :MD5
   "475517bd7ba04a1c37a82efeb8ff73d9")
  (:FILE "src/mvcc/types.lisp" :MD5 "a9bc70eab6720b5c6f8503178e2c966b")
  (:FILE "src/package.lisp" :MD5 "becf5c78049c85f2c05cd1ef54454032")
  (:FILE "src/read/core.lisp" :MD5 "4040905f4a64ba704a480d82e87ec748")
  (:FILE "src/read/package.lisp" :MD5 "7d74d9decc5a0bc9f9331d89bd503e21")
  (:FILE "src/read/task.lisp" :MD5 "9e0baf22c53329d393e047c669679645")
  (:FILE "src/read/types.lisp" :MD5 "9c37ff8237fcc9fe9ae4f44316e854e3")
  (:FILE "src/recovery/decisions-build.lisp" :MD5
   "1a51ef4a488bb9fde2ff7d47bae01379")
  (:FILE "src/recovery/decisions-package.lisp" :MD5
   "cbdc30f93109c474e1fc25066c9b9b13")
  (:FILE "src/recovery/decisions-query.lisp" :MD5
   "f782d1137b8ce342b91c9999cfb7accc")
  (:FILE "src/recovery/decisions-radix.lisp" :MD5
   "852149de4c289b8e067602780378d87a")
  (:FILE "src/recovery/decisions-sort.lisp" :MD5
   "b33e57a643f2fca810846f6226366253")
  (:FILE "src/recovery/decisions-types.lisp" :MD5
   "f4433fd19ebc7239dbc2628c39f3ecdb")
  (:FILE "src/recovery/inventory-build.lisp" :MD5
   "9bd6820c4feba3e552aab1a4edd87861")
  (:FILE "src/recovery/inventory-query.lisp" :MD5
   "fcea263de1938767772e5b11411ecd5e")
  (:FILE "src/recovery/inventory-types.lisp" :MD5
   "78c136d5838dcfe3019d9069643a8d8f")
  (:FILE "src/recovery/manifest-build.lisp" :MD5
   "bf65b1731eab6e0572461ef5cc60fc40")
  (:FILE "src/recovery/manifest-decode.lisp" :MD5
   "67975249aaabd751757cdfb9222cc3c4")
  (:FILE "src/recovery/manifest-fold.lisp" :MD5
   "e0d2498db1011e857b7b0daa1934f187")
  (:FILE "src/recovery/manifest-package.lisp" :MD5
   "37ace42844c11b52446ee1fc500b8e0b")
  (:FILE "src/recovery/manifest-query.lisp" :MD5
   "ebd7a54adea2213294a887e6d4db0927")
  (:FILE "src/recovery/manifest-types.lisp" :MD5
   "7b1d4054415faca7e5fca59ad83b4d4a")
  (:FILE "src/recovery/package.lisp" :MD5 "1c1c8ad0cd15b1703a2fe19cbf3f13c2")
  (:FILE "src/recovery/scan.lisp" :MD5 "fcacd15460db25ea9cc4036065f9f096")
  (:FILE "src/series/events.lisp" :MD5 "32b2156739a6f2ca996abb91df0a2603")
  (:FILE "src/series/io-events.lisp" :MD5 "b6026a8b7bb64b45c37a65effda70d8e")
  (:FILE "src/series/ownership.lisp" :MD5 "de1aca16a35d34d16aba12ff541c0d2b")
  (:FILE "src/series/package.lisp" :MD5 "59e3c59c90d8d0fc5731b87496a785aa")
  (:FILE "src/series/publication.lisp" :MD5 "056d2c6a67c9d9f2bf9fe2d2c348d53c")
  (:FILE "src/series/query.lisp" :MD5 "cb0d91405325b508e6b2ab24d178de7a")
  (:FILE "src/series/retirement.lisp" :MD5 "b8e04971b8ad75a1bd0c722997badfd2")
  (:FILE "src/series/routing-build.lisp" :MD5
   "d6924deff152b941bd49f0bb200b4197")
  (:FILE "src/series/routing-select.lisp" :MD5
   "e0f987d8767744050ec4d1b3ecb699ed")
  (:FILE "src/series/routing-types.lisp" :MD5
   "ce649df47dd38888d5103c98345f7e41")
  (:FILE "src/series/types.lisp" :MD5 "ab19ec8d15af91511e817858c41cebc8")
  (:FILE "src/series/worker-boundary.lisp" :MD5
   "2340e0c9074f7b1bf80c74f774986bc5")
  (:FILE "src/series/worker-package.lisp" :MD5
   "a93ce2e84e8aee647b5083ad1d2b899b")
  (:FILE "src/series/worker-run.lisp" :MD5 "f0fee18adf357bad98e8a3c3e8c70c0c")
  (:FILE "src/series/worker-types.lisp" :MD5
   "2b23d468be0165fa009c5ebd5d1bbe23")
  (:FILE "src/storage/compaction-scan.lisp" :MD5
   "1cda77a357ab2147035993b72d135a37")
  (:FILE "src/storage/control-payload.lisp" :MD5
   "cb64f806b8d69eb42d865b4abfff0b27")
  (:FILE "src/storage/formats.lisp" :MD5 "061147be459d8d3b08c661bd3f91d152")
  (:FILE "src/storage/log-header.lisp" :MD5 "b53d27dcc9f4badf18b50519c50bc614")
  (:FILE "src/storage/package.lisp" :MD5 "f86bd104f20616a76b42c02227f72844")
  (:FILE "src/storage/payload-record.lisp" :MD5
   "8c03f9c01dcb30f2d3970a5694968ecf")
  (:FILE "src/storage/payload-write.lisp" :MD5
   "c4ece3c4fa8d9492d2a80df7c0a4f5a0")
  (:FILE "src/storage/segment-header.lisp" :MD5
   "d6812fa59bf8fd1252fbf85a9bfa3896")
  (:FILE "src/wal/builder.lisp" :MD5 "a229f76f7036f3573a6e528dcd390a19")
  (:FILE "src/wal/csn.lisp" :MD5 "42b990e3b254e6fb488c0ab91b6a6502")
  (:FILE "src/wal/executor.lisp" :MD5 "c0340924c9130e14d0e8efedeec078f1")
  (:FILE "src/wal/group.lisp" :MD5 "7a0e7c99ab70b4720cbb091156560f5e")
  (:FILE "src/wal/package.lisp" :MD5 "96c41b1d417135a24fc65659ea3abe11")
  (:FILE "src/wal/types.lisp" :MD5 "f799f27a8ac1a4c736c04796c1e543f9")
  (:FILE "tests/foundation/support.lisp" :MD5
   "758adad069aec2f9dbe0635797314ff6")
  (:FILE "tests/get-directory/support.lisp" :MD5
   "3f868ebe4307ad4238b314c37eceed9a")
  (:FILE "tests/get-directory/construction.lisp" :MD5
   "1137938073e71d6d8d62c751fbad05d5")
  (:FILE "tests/get-directory/read.lisp" :MD5
   "d1ab36d05cc1266e4533d27c693f12f4")
  (:FILE "tests/get-directory/threads.lisp" :MD5
   "63dd01c852de1399c2c82274d481d257")
  (:FILE "tests/get-directory/series-support.lisp" :MD5
   "8d7ed4f8d3f9e8394b15c648a3a4507b")
  (:FILE "tests/get-directory/series-read.lisp" :MD5
   "23a9e837d437b705ca7bd826fa755f89")
  (:FILE "tools/get-series-mutation.lisp" :MD5
   "2068edb227d28b9e53c4eecc125fca54"))
 :SUITE-TESTS
 ("TEST-REQ-IDX-001-SERIES-GET-CONTENT-ROUNDTRIP"
  "TEST-REQ-IDX-001-SERIES-GET-CLOSED-CONTROLLER-NATIVE-V1-V2"
  "TEST-REQ-IDX-001-SERIES-GET-ACTIVE-AND-CLOSED-MIXED"
  "TEST-REQ-CCH-002-SERIES-GET-FIVE-OUTCOMES-COLD-AND-HOT"
  "TEST-REQ-CCH-004-SERIES-GET-CACHE-CORRUPTION-NATIVE-FALLBACK"
  "TEST-REQ-CMP-007-SERIES-GET-WRONG-OWNER-CLEANUP"
  "TEST-REQ-AFF-004-SERIES-GET-NIL-AND-CORRUPT-ROOT-FAULTED"
  "TEST-REQ-AFF-004-SERIES-GET-CORRUPT-ACTIVE-CONTENT-FAULTED"
  "TEST-REQ-AFF-004-SERIES-GET-SOURCE-CONTROLLER-MISMATCH-TYPED-FAULTED"
  "TEST-REQ-IDX-001-SERIES-GET-MISSING-CLOSED-ID-FAULTED"
  "TEST-REQ-CON-004-SERIES-GET-WRONG-STATE-NO-PIN-STEAL"
  "TEST-REQ-WAL-006-SERIES-GET-ONE-ROOT-AFTER-PIN-DURING-PUBLICATION"
  "TEST-REQ-WAL-006-SERIES-GET-EXPLICIT-ROOT-PRESERVES-CAPTURED-PAGE"
  "TEST-REQ-WAL-006-SERIES-GET-EXPLICIT-ROOT-EXCLUDES-LATER-PUBLICATION"
  "TEST-REQ-WAL-005-SERIES-GET-WRITER-FOREIGN-OWNER-BEFORE-ADOPTION"
  "TEST-REQ-WAL-005-SERIES-GET-WRITER-DUPLICATE-ACTIVE-BEFORE-ADOPTION"
  "TEST-REQ-AFF-004-SERIES-GET-PUBLISHED-ACTIVE-DUPLICATE-FAULTED"
  "TEST-REQ-AFF-004-SERIES-GET-ACTIVE-OWNER-AND-ID-GUARDS"
  "TEST-REQ-IDX-001-SERIES-GET-CONTAINS-EMPTY-AND-ID-EXTREMES"
  "TEST-REQ-IDX-001-SERIES-GET-CONTAINS-65536-GEOMETRY-SEARCH17"
  "TEST-REQ-CON-004-SERIES-GET-BUFFER-REQUIRED-FIVE-OUTCOMES-AND-RESTART"
  "TEST-REQ-AFF-004-SERIES-GET-DIRECTORY-GEOMETRY-READER-FAULTED"
  "TEST-REQ-AFF-004-SERIES-GET-DIRECTORY-GEOMETRY-WRITER-ARCHIVE-FAULTED")
 :EXPECTED-TESTS
 ("TEST-REQ-AFF-004-SERIES-GET-PUBLISHED-ACTIVE-DUPLICATE-FAULTED")
 :CHILD-REPORT
 "/Users/gpicchiarelli/.codex/worktrees/get-controller/ArcDocDB/spikes/out/get-series-mutations-e/raw/evidence/accept-active-closed-duplicate/child-report.lisp")
