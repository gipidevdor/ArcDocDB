(require :asdf)
(require :sb-md5)
(require :sb-posix)
(defpackage #:arcdocdb.get.directory.mutation (:use #:cl))
(in-package #:arcdocdb.get.directory.mutation)
(DEFPARAMETER *SUITE-FILES*
  '("tests/foundation/support.lisp" "tests/get-directory/support.lisp"
    "tests/get-directory/construction.lisp" "tests/get-directory/read.lisp"
    "tests/get-directory/threads.lisp"))
(DEFPARAMETER *EXPECTED-SUITE*
  '("TEST-REQ-STO-003-DIRECTORY-NATIVE-READ-NONZERO-BUFFER-START"
    "TEST-REQ-IDX-001-DIRECTORY-EMPTY-AND-PAYLOAD12N"
    "TEST-REQ-AFF-008-DIRECTORY-BUDGET-EXACT-AND-ONE-SHORT"
    "TEST-REQ-AFF-008-DIRECTORY-INVALID-CONFIGURATION-AND-MAPS"
    "TEST-REQ-IDX-001-DIRECTORY-INPUT-ARRAY-COPIED"
    "TEST-REQ-IDX-001-DIRECTORY-DUPLICATES-AND-DESCENDING-ORDER"
    "TEST-REQ-CMP-007-DIRECTORY-CANONICAL-OWNER-AND-FOREIGN-OWNER"
    "TEST-REQ-IDX-001-DIRECTORY-SEGMENT-ZERO-HIGHBITS-AND-LIFETIME"
    "TEST-REQ-IDX-001-DIRECTORY-65536-FIRST-LAST-SEARCH17"
    "TEST-REQ-IDX-001-DIRECTORY-NATIVE-READ-V1-V2-VALUES-AND-MAXID"
    "TEST-REQ-CCH-002-DIRECTORY-CACHE-ENUMS-AND-PRIVATE-OUTPUT"
    "TEST-REQ-CCH-004-DIRECTORY-CACHE-VERIFY-FAILED-NATIVE-FALLBACK"
    "TEST-REQ-CCH-001-DIRECTORY-CACHE64-NO-EVICTION-AND-EVERY-HIT"
    "TEST-REQ-FOR-004-DIRECTORY-PREPARED-WRITER-OUTCOME-SEAL"
    "TEST-REQ-IDX-001-DIRECTORY-MISSING-PUBLISHED-CANDIDATE-FAILSTOP"
    "TEST-REQ-CMP-007-DIRECTORY-WRONG-OWNER-CLEANUP-ALL-ENTRYPOINTS"
    "TEST-REQ-IDX-001-DIRECTORY-CANDIDATE-CSN-LOW-AND-HIGH"
    "TEST-REQ-IDX-001-DIRECTORY-CANDIDATE-SIZE-AND-HIGHBITS"
    "TEST-REQ-FOR-004-DIRECTORY-SOURCE-KEY-MISMATCH-NO-AUTHORIZED-VALUE"
    "TEST-REQ-IDX-001-DIRECTORY-SHAPE-FI-BEFORE-SOURCE-READ"
    "TEST-REQ-IDX-001-DIRECTORY-PRIVATE-NIL-ENTRY-SHAPE-FI-ALL-ENTRYPOINTS"
    "TEST-REQ-IDX-001-DIRECTORY-CLOSED-FD-AFTER-PUBLICATION"
    "TEST-REQ-CON-004-DIRECTORY-STATE-BEFORE-CLEANUP-AND-REENTRANCY"
    "TEST-REQ-CON-004-DIRECTORY-THROW-DURING-NATIVE-READ-CLEANS-PIN"
    "TEST-REQ-MVC-004-DIRECTORY-FRESH-SNAPSHOT-FINAL-AUTHORIZATION"
    "TEST-REQ-IDX-001-DIRECTORY-PRIMARY-ABSENCE-AND-SNAPSHOT-HISTORY"
    "TEST-REQ-CON-004-DIRECTORY-BUFFER-REQUIRED-RESTARTS-IN-NEW-WORKER"
    "TEST-REQ-CON-004-DIRECTORY-FOUR-READERS-PRIVATE-OUTPUT-PINS-ZERO"
    "TEST-REQ-CON-004-DIRECTORY-THREAD-TIMEOUTS-AND-CONDITION-TRANSFER"))
(DEFPARAMETER *TARGET-FILE* '"src/get-directory/read.lisp")
(DEFPARAMETER *EXPECTED-SOURCES*
  '((:FILE "arcdocdb.asd" :ROLE :SYSTEM :SOURCE-MD5
     #A((32) BASE-CHAR . "b5e1e1260d8364e7eb1549db37153364"))
    (:FILE "src/cache/build.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "5d70197c8b64ad6f20c8be47a60c73ca"))
    (:FILE "src/cache/clock.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "3546cf7f5c5ed138068548c20064f499"))
    (:FILE "src/cache/core.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "72f3a33ce27ddf94c49c495580520004"))
    (:FILE "src/cache/package.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "a1f6a8e7aa4faed88e984b39871d1e53"))
    (:FILE "src/cache/read.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "82f937b7b08bd1696ad9c88da2e1c60c"))
    (:FILE "src/cache/types.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "a25648d870eaa4f0b6e1e3b2cf76e28e"))
    (:FILE "src/cache/write.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "fc09021f74fb50aac57589614dae04d7"))
    (:FILE "src/codec/cbor-float-minimal.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "bc7a7b176e8cdd361b7c4306a1a4de4b"))
    (:FILE "src/codec/cbor-header.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "6e8c6a49314c2f460aa6f8a1759200b6"))
    (:FILE "src/codec/cbor-minimal.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "ecd8fe950344059c629927b38fb6e4aa"))
    (:FILE "src/codec/cbor-package.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "c3f19ffb4aacfdfe502c5e8b12a234f2"))
    (:FILE "src/codec/cbor-scan-input.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "f6488e987889432b375254021825dbe5"))
    (:FILE "src/codec/cbor-scan-items.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "706c0baa4158bf272c4b0df17c1439d2"))
    (:FILE "src/codec/cbor-scan-minimal.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "987e8ed576a21eb644ac1ef2e06edbda"))
    (:FILE "src/codec/cbor-scan-stack.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "cf1999ddb10f879aeefbeea853742d57"))
    (:FILE "src/codec/cbor-scan.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "0c33aedcdb352e78a3c694cf796e6692"))
    (:FILE "src/codec/cbor-simple-write.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "200373402e6e082dd8c7afde305302bb"))
    (:FILE "src/codec/cbor-space.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "c33cdcc45f45218aa3e8bf26ce0ee575"))
    (:FILE "src/codec/cbor-string-write.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "b13e92b5f24a42fe283c17b649722b6a"))
    (:FILE "src/codec/cbor-write.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "69e77bcd15b5413a815a65c5081229db"))
    (:FILE "src/codec/package.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "d885bd2a9860eb60aec1a775e5031d5e"))
    (:FILE "src/codec/utf8.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "0f67dd5c51bf6a63bc292ab4e2a280c2"))
    (:FILE "src/csn/package.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "1130012fc5613a5648d22ed8628be0e8"))
    (:FILE "src/csn/registry.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "a1cdb5661fc54beba5bf00e4765f3235"))
    (:FILE "src/epochs/core.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "765d14c88cd288093a77a57930cd6999"))
    (:FILE "src/epochs/package.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "875201dfab0a84efd40fe9828cc293c8"))
    (:FILE "src/epochs/read.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "975b5f74e0c5a38ce978f4d9c7fcc6b8"))
    (:FILE "src/epochs/reclaim.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "036dd02adf87d33c3ae2f40735c733fa"))
    (:FILE "src/epochs/retire.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "653b974f310c09f6e2224a84acc43bbf"))
    (:FILE "src/epochs/types.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "82253491f995f5bc153fb5ebf30d564c"))
    (:FILE "src/execution/handoff.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "6b85eebe69366e78ed5fc5cc20735f00"))
    (:FILE "src/execution/package.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "cb5710d6c111cadb7121a50998a747fa"))
    (:FILE "src/execution/queue.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "8202843bddb817da4279ac959ae3f3c4"))
    (:FILE "src/execution/ready-recycle.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "38d26f8c749dd946dfc4b9c57103a892"))
    (:FILE "src/execution/ready-types.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "a64d98c9ff429d6103d6e10ee1fd7980"))
    (:FILE "src/execution/ready.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "2c1892002f0599bb8273093031017520"))
    (:FILE "src/execution/worker-boundary.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "c24065d6c8d80d1be53994a0041743df"))
    (:FILE "src/execution/worker-claim.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "babd0a78b4185af24ae1fef870c0fabb"))
    (:FILE "src/execution/worker-run.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "aa34ca6bc07535e35fea723878d99f66"))
    (:FILE "src/execution/worker-types.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "0679ee07c46f69db330706303c70d8d2"))
    (:FILE "src/execution/writer.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "73019644090e2971f2b54dc36e4491f5"))
    (:FILE "src/foundation/batch.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "ca642ea47e4bff76f78f5b6d7287d6bd"))
    (:FILE "src/foundation/binary.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "a06115175f450776762761dce25acdb8"))
    (:FILE "src/foundation/conditions.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "942b596396c19815290a57830af2121b"))
    (:FILE "src/foundation/crc32c.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "4db58e2f48bf77d751f1b83bb9f84b5c"))
    (:FILE "src/foundation/package.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "5ee593a112958d94163dab17c5aa4ba2"))
    (:FILE "src/foundation/record.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "c3ed0f09fa3fa6fe20c98e2ed6e69abe"))
    (:FILE "src/get-directory/build.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "cde24b2bf5c5637d5501b95bed47df31"))
    (:FILE "src/get-directory/package.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "4233eef9d87bdec712d4f690bcb699a9"))
    (:FILE "src/get-directory/read.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "74a694385f1aaf03ec87721545494119"))
    (:FILE "src/get-directory/types.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "17c957d6934a31f4ed64313e756de2d2"))
    (:FILE "src/get-resolver/active-build.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "8d26428a4e17ad18990b8ee7d5f5b53a"))
    (:FILE "src/get-resolver/active-directory.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "6d95f29b331d335175843f47ae44a6ea"))
    (:FILE "src/get-resolver/active-preflight.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "f13d422adb6aa9e8489352884137f25a"))
    (:FILE "src/get-resolver/active-read.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "3da469a7aa1e682dd8f2e516ee451de1"))
    (:FILE "src/get-resolver/active-scan.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "d6aaec49504a96f37c8ff1bc182c977b"))
    (:FILE "src/get-resolver/active-types.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "bd7182e9871fe82530d0c828e473ccde"))
    (:FILE "src/get-resolver/build.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "bbfb2082103e6712419e180ab972245c"))
    (:FILE "src/get-resolver/package.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "cbfb17bf1f65698fb7c7889953d02d1e"))
    (:FILE "src/get-resolver/read.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "1339edff0223dbf122f11ff0adbba61c"))
    (:FILE "src/get-resolver/rows.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "ca9002b81efd0aed9761cd1f78514762"))
    (:FILE "src/get-resolver/scan.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "536e9dc4ed51072b8a6d1528d3ec18bf"))
    (:FILE "src/get-resolver/sort.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "2d869293ba47444c4721713d955c6254"))
    (:FILE "src/get-resolver/types.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "9df13bcc6908e9fa601d173a671e1ccf"))
    (:FILE "src/get/build.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "c5cc36884b238221cc13ca0c087ec7c2"))
    (:FILE "src/get/lifecycle.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "e70bfeddd694336bbd088e65f8761834"))
    (:FILE "src/get/lookup.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "82258ec87aca513a508bc5dee8410dd6"))
    (:FILE "src/get/package.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "c72633d15c3488699072eb610ebde7c8"))
    (:FILE "src/get/segment.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "811869eb6a197d3c4e26af4322e52652"))
    (:FILE "src/get/target.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "1b70dac05d6d2418909eb5105b808e81"))
    (:FILE "src/get/types.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "c394e5684de5e2d938991c7cb348b93c"))
    (:FILE "src/hash/arithmetic.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "b5c51802e607e3dd22de68204baf64e9"))
    (:FILE "src/hash/blocks.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "bef497b9a267c7306d4100000491c814"))
    (:FILE "src/hash/hash64.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "886b7c08b9929283e8968831cbe5c039"))
    (:FILE "src/hash/package.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "2d9060e41bc5252067d35e59ac70ee06"))
    (:FILE "src/index/core.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "65076c355c099b5dc73d185948d3bec4"))
    (:FILE "src/index/hash-digests.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "43d2209225707352daec6186ef95a805"))
    (:FILE "src/index/hash-seed.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "45ce41749bc6fa638539815d3f802b96"))
    (:FILE "src/index/package.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "598a9b65e73151c924b2cdcaf6d96705"))
    (:FILE "src/index/primary-arena.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "a319691e3e28b7ea7b927de490cf69ba"))
    (:FILE "src/index/primary-build.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "ff2cfbb865290d7a1510fdf6877c7229"))
    (:FILE "src/index/primary-core.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "fa52433eae199ceeb874bf2bc47afca7"))
    (:FILE "src/index/primary-directory.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "1dd67c527257e43f17e006644ecdbd00"))
    (:FILE "src/index/primary-package.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "d65cfce399b04f905bf969929962e59a"))
    (:FILE "src/index/primary-probe.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "699ce3f1615296fc27fcde3e0d63a4bc"))
    (:FILE "src/index/primary-read.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "3f317a0d3c5ee86a73651aad36135cc3"))
    (:FILE "src/index/primary-relocate.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "5155959766645d3172ae5e73c58cc071"))
    (:FILE "src/index/primary-types.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "a59eab6425a60fa2656f86bf87d5c9ac"))
    (:FILE "src/index/primary-write.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "e8e31e599356e592af29c0cc4604872b"))
    (:FILE "src/index/read.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "5b22b90cfe8534086f6aff96d156713e"))
    (:FILE "src/index/rebuild-budget.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "0417dd41cb3ec1d62dfd913c19f810ad"))
    (:FILE "src/index/rebuild-copy.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "8befbbd00ed5c31c1487a11887eba495"))
    (:FILE "src/index/rebuild-scan.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "1188e7a64a7a5d9482c1233cb9acb452"))
    (:FILE "src/index/rebuild.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "a450cac8071513365267e7024cbe94b0"))
    (:FILE "src/index/relocate.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "475dd7d5809a836f01544b447cc8df27"))
    (:FILE "src/index/types.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "5157fd03ee806ee998ad8f0002d56268"))
    (:FILE "src/index/validation.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "3384cadf737c7d80c004222022a281f6"))
    (:FILE "src/index/write.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "f0c8c579cd7db466d243ed3ea9f8e8aa"))
    (:FILE "src/io/flush.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "716866194d6b9f076e102e84187229c0"))
    (:FILE "src/io/lifecycle.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "11c7103efbe733bbf0a13927f23c3d34"))
    (:FILE "src/io/native.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "9500cfb800603de002d6d2b24f1bf056"))
    (:FILE "src/io/package.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "c9380ad46a1d7acf41655aaed20db478"))
    (:FILE "src/io/transfer.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "a5e7108e80664eb3b562fbd7e680801f"))
    (:FILE "src/io/types.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "db8497f9cff35b1ee261f1f410f46ca6"))
    (:FILE "src/mvcc/package.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "f188d1dbd5d0adb49f53acf09157aef9"))
    (:FILE "src/mvcc/snapshots-core.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "8bb066aab61a18eff175b9edb11e42a2"))
    (:FILE "src/mvcc/snapshots-csn.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "0e9365e674d1584b111f915ce1f58634"))
    (:FILE "src/mvcc/snapshots-lifecycle.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "ff98aea5cb9a7ae2671f6a887a003725"))
    (:FILE "src/mvcc/snapshots-read.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "ae3ad96269b5e711a9dbb455f3c0ce48"))
    (:FILE "src/mvcc/snapshots-register.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "2d5a795bcefd605c75da91c725ae83a2"))
    (:FILE "src/mvcc/snapshots-types.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "475517bd7ba04a1c37a82efeb8ff73d9"))
    (:FILE "src/mvcc/types.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "a9bc70eab6720b5c6f8503178e2c966b"))
    (:FILE "src/package.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "becf5c78049c85f2c05cd1ef54454032"))
    (:FILE "src/read/core.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "4040905f4a64ba704a480d82e87ec748"))
    (:FILE "src/read/package.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "7d74d9decc5a0bc9f9331d89bd503e21"))
    (:FILE "src/read/task.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "9e0baf22c53329d393e047c669679645"))
    (:FILE "src/read/types.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "9c37ff8237fcc9fe9ae4f44316e854e3"))
    (:FILE "src/recovery/decisions-build.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "1a51ef4a488bb9fde2ff7d47bae01379"))
    (:FILE "src/recovery/decisions-package.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "cbdc30f93109c474e1fc25066c9b9b13"))
    (:FILE "src/recovery/decisions-query.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "f782d1137b8ce342b91c9999cfb7accc"))
    (:FILE "src/recovery/decisions-radix.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "852149de4c289b8e067602780378d87a"))
    (:FILE "src/recovery/decisions-sort.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "b33e57a643f2fca810846f6226366253"))
    (:FILE "src/recovery/decisions-types.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "f4433fd19ebc7239dbc2628c39f3ecdb"))
    (:FILE "src/recovery/inventory-build.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "9bd6820c4feba3e552aab1a4edd87861"))
    (:FILE "src/recovery/inventory-query.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "fcea263de1938767772e5b11411ecd5e"))
    (:FILE "src/recovery/inventory-types.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "78c136d5838dcfe3019d9069643a8d8f"))
    (:FILE "src/recovery/manifest-build.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "bf65b1731eab6e0572461ef5cc60fc40"))
    (:FILE "src/recovery/manifest-decode.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "67975249aaabd751757cdfb9222cc3c4"))
    (:FILE "src/recovery/manifest-fold.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "e0d2498db1011e857b7b0daa1934f187"))
    (:FILE "src/recovery/manifest-package.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "37ace42844c11b52446ee1fc500b8e0b"))
    (:FILE "src/recovery/manifest-query.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "ebd7a54adea2213294a887e6d4db0927"))
    (:FILE "src/recovery/manifest-types.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "7b1d4054415faca7e5fca59ad83b4d4a"))
    (:FILE "src/recovery/package.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "1c1c8ad0cd15b1703a2fe19cbf3f13c2"))
    (:FILE "src/recovery/scan.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "fcacd15460db25ea9cc4036065f9f096"))
    (:FILE "src/series/events.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "32b2156739a6f2ca996abb91df0a2603"))
    (:FILE "src/series/io-events.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "b6026a8b7bb64b45c37a65effda70d8e"))
    (:FILE "src/series/ownership.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "de1aca16a35d34d16aba12ff541c0d2b"))
    (:FILE "src/series/package.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "59e3c59c90d8d0fc5731b87496a785aa"))
    (:FILE "src/series/publication.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "056d2c6a67c9d9f2bf9fe2d2c348d53c"))
    (:FILE "src/series/query.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "cb0d91405325b508e6b2ab24d178de7a"))
    (:FILE "src/series/retirement.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "b8e04971b8ad75a1bd0c722997badfd2"))
    (:FILE "src/series/routing-build.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "d6924deff152b941bd49f0bb200b4197"))
    (:FILE "src/series/routing-select.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "e0f987d8767744050ec4d1b3ecb699ed"))
    (:FILE "src/series/routing-types.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "ce649df47dd38888d5103c98345f7e41"))
    (:FILE "src/series/types.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "ab19ec8d15af91511e817858c41cebc8"))
    (:FILE "src/series/worker-boundary.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "2340e0c9074f7b1bf80c74f774986bc5"))
    (:FILE "src/series/worker-package.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "a93ce2e84e8aee647b5083ad1d2b899b"))
    (:FILE "src/series/worker-run.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "f0fee18adf357bad98e8a3c3e8c70c0c"))
    (:FILE "src/series/worker-types.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "2b23d468be0165fa009c5ebd5d1bbe23"))
    (:FILE "src/storage/compaction-scan.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "1cda77a357ab2147035993b72d135a37"))
    (:FILE "src/storage/control-payload.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "cb64f806b8d69eb42d865b4abfff0b27"))
    (:FILE "src/storage/formats.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "061147be459d8d3b08c661bd3f91d152"))
    (:FILE "src/storage/log-header.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "b53d27dcc9f4badf18b50519c50bc614"))
    (:FILE "src/storage/package.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "f86bd104f20616a76b42c02227f72844"))
    (:FILE "src/storage/payload-record.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "8c03f9c01dcb30f2d3970a5694968ecf"))
    (:FILE "src/storage/payload-write.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "c4ece3c4fa8d9492d2a80df7c0a4f5a0"))
    (:FILE "src/storage/segment-header.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "d6812fa59bf8fd1252fbf85a9bfa3896"))
    (:FILE "src/wal/builder.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "a229f76f7036f3573a6e528dcd390a19"))
    (:FILE "src/wal/csn.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "42b990e3b254e6fb488c0ab91b6a6502"))
    (:FILE "src/wal/executor.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "c0340924c9130e14d0e8efedeec078f1"))
    (:FILE "src/wal/group.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "7a0e7c99ab70b4720cbb091156560f5e"))
    (:FILE "src/wal/package.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "96c41b1d417135a24fc65659ea3abe11"))
    (:FILE "src/wal/types.lisp" :ROLE :PRODUCT :SOURCE-MD5
     #A((32) BASE-CHAR . "f799f27a8ac1a4c736c04796c1e543f9"))
    (:FILE "tests/foundation/support.lisp" :ROLE :SUITE :SOURCE-MD5
     #A((32) BASE-CHAR . "758adad069aec2f9dbe0635797314ff6"))
    (:FILE "tests/get-directory/support.lisp" :ROLE :SUITE :SOURCE-MD5
     #A((32) BASE-CHAR . "3f868ebe4307ad4238b314c37eceed9a"))
    (:FILE "tests/get-directory/construction.lisp" :ROLE :SUITE :SOURCE-MD5
     #A((32) BASE-CHAR . "1137938073e71d6d8d62c751fbad05d5"))
    (:FILE "tests/get-directory/read.lisp" :ROLE :SUITE :SOURCE-MD5
     #A((32) BASE-CHAR . "d1ab36d05cc1266e4533d27c693f12f4"))
    (:FILE "tests/get-directory/threads.lisp" :ROLE :SUITE :SOURCE-MD5
     #A((32) BASE-CHAR . "63dd01c852de1399c2c82274d481d257"))))
(DEFPARAMETER *SELECTED-TEST* 'NIL)
(DEFVAR *CURRENT-TEST* NIL)
(DEFVAR *PASSED-TESTS* NIL)
(DEFUN CHILD-MD5 (PATH)
  (FORMAT NIL "~(~{~2,'0X~}~)" (COERCE (SB-MD5:MD5SUM-FILE PATH) 'LIST)))
(DEFUN CHILD-SOURCE-MANIFEST ()
  (LOOP FOR SOURCE IN *EXPECTED-SOURCES*
        COLLECT (LIST :FILE (GETF SOURCE :FILE) :ROLE (GETF SOURCE :ROLE)
                      :SOURCE-MD5 (CHILD-MD5 (GETF SOURCE :FILE)))))
(DEFUN CHILD-ATTEST (SOURCE FASL DESTINATION)
  (UNLESS
      (AND (PROBE-FILE FASL)
           (UIOP/PATHNAME:SUBPATHP (TRUENAME FASL) DESTINATION)
           (STRING= (GETF SOURCE :SOURCE-MD5) (CHILD-MD5 (GETF SOURCE :FILE))))
    (ERROR "Source/FASL non attestabile: ~A" (GETF SOURCE :FILE)))
  (APPEND SOURCE
          (LIST :FASL (NAMESTRING (TRUENAME FASL)) :FASL-MD5 (CHILD-MD5 FASL))))
(DEFUN COMPILE-SUITE-FILE (SOURCE DESTINATION)
  (LET* ((FILE (GETF SOURCE :FILE))
         (OUTPUT
          (MERGE-PATHNAMES (MAKE-PATHNAME :TYPE "fasl" :DEFAULTS FILE)
                           DESTINATION)))
    (ENSURE-DIRECTORIES-EXIST OUTPUT)
    (MULTIPLE-VALUE-BIND (FASL WARNINGS FAILED)
        (COMPILE-FILE FILE :OUTPUT-FILE OUTPUT)
      (WHEN (OR WARNINGS FAILED (NULL FASL))
        (ERROR "Compilazione suite non valida: ~A" FILE))
      (LOAD FASL)
      (CHILD-ATTEST SOURCE FASL DESTINATION))))
(DEFUN CONDITION-IN-PACKAGE-P (CONDITION PACKAGE-NAME NAME)
  (LET* ((PACKAGE (FIND-PACKAGE PACKAGE-NAME))
         (SYMBOL (AND PACKAGE (FIND-SYMBOL NAME PACKAGE))))
    (AND SYMBOL (FIND-CLASS SYMBOL NIL) (TYPEP CONDITION SYMBOL))))
(DEFUN SEMANTIC-KIND (CONDITION)
  (COND
   ((OR (TYPEP CONDITION 'SB-EXT:TIMEOUT)
        (CONDITION-IN-PACKAGE-P CONDITION "ARCDOCDB.GET.DIRECTORY.TESTS"
         "DIRECTORY-FIXTURE-TIMEOUT"))
    :FIXTURE-TIMEOUT)
   ((OR
     (CONDITION-IN-PACKAGE-P CONDITION "ARCDOCDB.GET.DIRECTORY.TESTS"
      "DIRECTORY-FIXTURE-ERROR")
     (CONDITION-IN-PACKAGE-P CONDITION "ARCDOCDB.CONDITIONS" "IO-FAULT")
     (CONDITION-IN-PACKAGE-P CONDITION "SB-POSIX" "SYSCALL-ERROR"))
    :INFRASTRUCTURE)
   ((CONDITION-IN-PACKAGE-P CONDITION "ARCDOCDB.CONDITIONS" "ARCDOCDB-ERROR")
    :PRODUCT-CONDITION)
   ((AND (TYPEP CONDITION 'SIMPLE-ERROR)
         (LET ((CONTROL (SIMPLE-CONDITION-FORMAT-CONTROL CONDITION)))
           (AND (STRINGP CONTROL)
                (UIOP/UTILITY:STRING-PREFIX-P "Asserzione fallita:" CONTROL))))
    :ASSERTION)
   (T :INFRASTRUCTURE)))
(DEFUN CHILD-MAIN ()
  (LET ((PHASE :SETUP)
        (FAILURE NIL)
        (CODE 0)
        (FAILURE-KIND NIL)
        (PRODUCT-COMPILED NIL)
        (SUITE-COMPILED NIL)
        (PRODUCT NIL)
        (SUITE NIL)
        (TARGET NIL)
        (SOURCES NIL)
        (REGISTERED NIL))
    (HANDLER-CASE
     (LET* ((*STANDARD-OUTPUT* *ERROR-OUTPUT*)
            (ROOT (TRUENAME "./"))
            (DESTINATION (MERGE-PATHNAMES "fasl/" ROOT)))
       (SETF SOURCES (CHILD-SOURCE-MANIFEST))
       (UNLESS (EQUAL SOURCES *EXPECTED-SOURCES*)
         (ERROR "Copia sorgenti cambiata prima della compilazione."))
       (ASDF/SOURCE-REGISTRY:INITIALIZE-SOURCE-REGISTRY
        `(:SOURCE-REGISTRY (:DIRECTORY ,ROOT) :IGNORE-INHERITED-CONFIGURATION))
       (ASDF/OUTPUT-TRANSLATIONS:INITIALIZE-OUTPUT-TRANSLATIONS
        `(:OUTPUT-TRANSLATIONS
          (,(MERGE-PATHNAMES "**/*.*" ROOT)
           ,(MERGE-PATHNAMES "**/*.*" DESTINATION))
          :IGNORE-INHERITED-CONFIGURATION))
       (DOLIST (SOURCE *EXPECTED-SOURCES*)
         (WHEN (EQ :PRODUCT (GETF SOURCE :ROLE))
           (UNLESS
               (UIOP/PATHNAME:SUBPATHP
                (ASDF/OUTPUT-TRANSLATIONS:APPLY-OUTPUT-TRANSLATIONS
                 (MAKE-PATHNAME :TYPE "fasl" :DEFAULTS
                                (MERGE-PATHNAMES (GETF SOURCE :FILE) ROOT)))
                DESTINATION)
             (ERROR "Output ASDF non privato prima della compilazione: ~A"
                    (GETF SOURCE :FILE)))))
       (HANDLER-BIND ((WARNING
                       (LAMBDA (CONDITION)
                         (UNLESS
                             (TYPEP CONDITION 'SB-KERNEL:REDEFINITION-WARNING)
                           (ERROR CONDITION)))))
         (SETF PHASE :COMPILE-PRODUCT)
         (ASDF/FIND-SYSTEM:LOAD-ASD (MERGE-PATHNAMES "arcdocdb.asd" ROOT))
         (ASDF/OPERATE:LOAD-SYSTEM "arcdocdb" :FORCE T)
         (SETF PRODUCT-COMPILED T
               PHASE :ATTEST-PRODUCT)
         (DOLIST (SOURCE *EXPECTED-SOURCES*)
           (WHEN (EQ :PRODUCT (GETF SOURCE :ROLE))
             (LET ((FASL
                    (ASDF/OUTPUT-TRANSLATIONS:APPLY-OUTPUT-TRANSLATIONS
                     (MAKE-PATHNAME :TYPE "fasl" :DEFAULTS
                                    (MERGE-PATHNAMES (GETF SOURCE :FILE)
                                                     ROOT)))))
               (PUSH (CHILD-ATTEST SOURCE FASL DESTINATION) PRODUCT))))
         (SETF PRODUCT (NREVERSE PRODUCT)
               TARGET
                 (FIND *TARGET-FILE* PRODUCT :KEY (LAMBDA (E) (GETF E :FILE))
                       :TEST #'EQUAL))
         (UNLESS TARGET (ERROR "Bersaglio non compilato dal sistema prodotto."))
         (SETF PHASE :COMPILE-SUITE)
         (DOLIST (FILE *SUITE-FILES*)
           (LET ((SOURCE
                  (FIND FILE *EXPECTED-SOURCES* :KEY
                        (LAMBDA (S) (GETF S :FILE)) :TEST #'EQUAL)))
             (PUSH (COMPILE-SUITE-FILE SOURCE DESTINATION) SUITE)))
         (SETF SUITE (NREVERSE SUITE)
               SUITE-COMPILED T
               PHASE :VALIDATE-SUITE))
       (UNLESS (EQUAL SOURCES (CHILD-SOURCE-MANIFEST))
         (ERROR "Source cambiati durante la compilazione."))
       (LET* ((PACKAGE
               (OR (FIND-PACKAGE "ARCDOCDB.GET.DIRECTORY.TESTS")
                   (ERROR "Package directory assente.")))
              (REGISTRY (FIND-SYMBOL "*GET-DIRECTORY-TESTS*" PACKAGE)))
         (UNLESS (AND REGISTRY (BOUNDP REGISTRY))
           (ERROR "Registro directory assente."))
         (SETF REGISTERED
                 (MAPCAR #'SYMBOL-NAME (REVERSE (SYMBOL-VALUE REGISTRY))))
         (UNLESS (EQUAL *EXPECTED-SUITE* REGISTERED)
           (ERROR "Registro diverso dai DEFTEST congelati."))
         (DOLIST (NAME REGISTERED)
           (UNLESS (FBOUNDP (FIND-SYMBOL NAME PACKAGE))
             (ERROR "Test directory assente: ~A" NAME)))
         (WHEN
             (AND *SELECTED-TEST*
                  (NOT (MEMBER *SELECTED-TEST* REGISTERED :TEST #'STRING=)))
           (ERROR "Test selezionato non preregistrato."))
         (SETF PHASE :TESTS)
         (DOLIST (NAME REGISTERED)
           (WHEN (OR (NULL *SELECTED-TEST*) (STRING= *SELECTED-TEST* NAME))
             (SETF *CURRENT-TEST* NAME)
             (FUNCALL (FIND-SYMBOL NAME PACKAGE))
             (PUSH NAME *PASSED-TESTS*)))
         (SETF *CURRENT-TEST* NIL
               PHASE :COMPLETE)))
     (ERROR (CONDITION)
            (SETF FAILURE CONDITION
                  FAILURE-KIND
                    (IF (EQ PHASE :TESTS)
                        (SEMANTIC-KIND CONDITION)
                        :INFRASTRUCTURE)
                  CODE
                    (IF (AND (EQ PHASE :TESTS)
                             (MEMBER FAILURE-KIND
                                     '(:ASSERTION :PRODUCT-CONDITION)))
                        1
                        2))
            (FORMAT *ERROR-OUTPUT* "~&~A: ~A~%" (TYPE-OF CONDITION)
                    CONDITION)))
    (LET ((*PRINT-READABLY* NIL)
          (*PRINT-ESCAPE* T)
          (*PRINT-LENGTH* NIL)
          (*PRINT-LEVEL* NIL))
      (WRITE
       (LIST :SCHEMA-VERSION 1 :KIND :GET-DIRECTORY-MUTATION-CHILD :PHASE PHASE
             :STATUS
             (IF FAILURE
                 :FAILED
                 :OK)
             :ROOT (NAMESTRING (TRUENAME "./")) :SOURCE-MANIFEST SOURCES
             :SUITE-FILES *SUITE-FILES* :REGISTERED-TESTS REGISTERED
             :SELECTED-TEST *SELECTED-TEST* :PRODUCT-COMPILED PRODUCT-COMPILED
             :SUITE-COMPILED SUITE-COMPILED :COMPILED-TARGET TARGET
             :COMPILED-PRODUCT PRODUCT :COMPILED-SUITE SUITE :FAILED-TEST
             *CURRENT-TEST* :PASSED-TESTS (REVERSE *PASSED-TESTS*)
             :FAILURE-KIND FAILURE-KIND :CONDITION-TYPE
             (WHEN FAILURE (PRINC-TO-STRING (TYPE-OF FAILURE))) :DIAGNOSTIC
             (WHEN FAILURE (PRINC-TO-STRING FAILURE)))
       :PRETTY T)
      (TERPRI)
      (FINISH-OUTPUT))
    (SB-EXT:EXIT :CODE CODE)))
(CHILD-MAIN)
