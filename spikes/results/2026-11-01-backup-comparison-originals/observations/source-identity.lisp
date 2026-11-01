(:SCHEMA-VERSION 1 :KIND :COMPARISON-SOURCE-IDENTITY :STATUS :OK :TIMING-DRIVER
 ((:LABEL "baseline" :TIMING-DRIVER-BLOB
   "ff42da4ed7374f4c0c6b997a8c36e576a9d5977b")
  (:LABEL "optimized" :TIMING-DRIVER-BLOB
   "ff42da4ed7374f4c0c6b997a8c36e576a9d5977b")
  (:LABEL "repeat" :TIMING-DRIVER-BLOB
   "ff42da4ed7374f4c0c6b997a8c36e576a9d5977b")
  (:LABEL "equalp" :TIMING-DRIVER-BLOB
   "ff42da4ed7374f4c0c6b997a8c36e576a9d5977b")
  (:LABEL "equalp-repeat" :TIMING-DRIVER-BLOB
   "ff42da4ed7374f4c0c6b997a8c36e576a9d5977b")
  (:LABEL "final-benchmark" :TIMING-DRIVER-BLOB
   "ff42da4ed7374f4c0c6b997a8c36e576a9d5977b"))
 :PRESERVED-VARIANTS
 ((:VARIANT "baseline-copy.lisp.txt" :RECORD "baseline" :SOURCE-PATH
   "src/backup/copy.lisp" :SNAPSHOT-BLOB
   "0a7a2b895a70924383f0948b83d34f7d7ea409bb" :RETAINED-BLOB
   "0a7a2b895a70924383f0948b83d34f7d7ea409bb" :COMPARISON :EQUAL)
  (:VARIANT "driver-before-syntax-fix.lisp.txt" :RECORD "driver-self-test"
   :SOURCE-PATH "spikes/backup-compare-bench.lisp" :SNAPSHOT-BLOB
   "fa1efe32c802ac53e535f5e6c6ecf355a990ac82" :RETAINED-BLOB
   "fa1efe32c802ac53e535f5e6c6ecf355a990ac82" :COMPARISON :EQUAL)
  (:VARIANT "copy-before-syntax-fix.lisp.txt" :RECORD "product-self-test"
   :SOURCE-PATH "src/backup/copy.lisp" :SNAPSHOT-BLOB
   "4f0fb61f8f79a4836fb509ed583ce6646624a5b2" :RETAINED-BLOB
   "4f0fb61f8f79a4836fb509ed583ce6646624a5b2" :COMPARISON :EQUAL)
  (:VARIANT "mismatch-copy.lisp.txt" :RECORD "optimized" :SOURCE-PATH
   "src/backup/copy.lisp" :SNAPSHOT-BLOB
   "ce043539f6c5f4c21ad41bdf0b374ed98244f64a" :RETAINED-BLOB
   "ce043539f6c5f4c21ad41bdf0b374ed98244f64a" :COMPARISON :EQUAL))
 :FINAL-PRODUCTION-BINDINGS
 ((:LABEL "final-benchmark" :SOURCE-FILES 546 :COMPARISON :EQUAL)
  (:LABEL "qualification" :SOURCE-FILES 546 :COMPARISON :EQUAL)
  (:LABEL "docs" :SOURCE-FILES 546 :COMPARISON :EQUAL)
  (:LABEL "docs-runtime" :SOURCE-FILES 546 :COMPARISON :EQUAL)
  (:LABEL "ci-selftest" :SOURCE-FILES 546 :COMPARISON :EQUAL))
 :PRODUCTION-INVENTORY
 ((:PATH "src/active/package.lisp" :GIT-BLOB
   "fbd3a32b30808508424c007ece26c9f3ea9ad0a9")
  (:PATH "src/active/preflight.lisp" :GIT-BLOB
   "9a7da536a7286f5996bf1720db7f9b9dbf20abff")
  (:PATH "src/active/prepare.lisp" :GIT-BLOB
   "e6739a357bdce50ca6bfda7dcd147ce8ffb790fd")
  (:PATH "src/active/source.lisp" :GIT-BLOB
   "27316c9e39b54ff4b2f6b4fe491ab7e67197a950")
  (:PATH "src/active/types.lisp" :GIT-BLOB
   "fc4c2d3ac0839aab37b91d4e017cdaf18bc5041e")
  (:PATH "src/backup/api.lisp" :GIT-BLOB
   "4fc446e398e3ec001866b649de3f9746f375e5b8")
  (:PATH "src/backup/copy.lisp" :GIT-BLOB
   "6f7c5382b58f14ad9dfae3685f95699587a227e4")
  (:PATH "src/backup/directory.lisp" :GIT-BLOB
   "faf380642e75fe2854c41162f2488edc20005e86")
  (:PATH "src/backup/manifest-read.lisp" :GIT-BLOB
   "cc63b272a0d56904b562073062178bfa0cd11d0d")
  (:PATH "src/backup/manifest-write.lisp" :GIT-BLOB
   "279f104596bbb52e9ea42d673cd650d5d9b3cb48")
  (:PATH "src/backup/operations.lisp" :GIT-BLOB
   "0862ad677ff8430ca427c3761fbe7b00a7bd609d")
  (:PATH "src/backup/package.lisp" :GIT-BLOB
   "e68d963329c55bbffa978862aa5a0e3dad720174")
  (:PATH "src/backup/resources.lisp" :GIT-BLOB
   "b972bb5c8a16e30f8c416fe5d6cf16315bc137e2")
  (:PATH "src/backup/types.lisp" :GIT-BLOB
   "bffc3f58535e2f1811595a1a1bcae2799dbbf874")
  (:PATH "src/backup/verify.lisp" :GIT-BLOB
   "9d0c5c55199e16367c358c4efd065af224f55509")
  (:PATH "src/cache/build.lisp" :GIT-BLOB
   "b0230656edbe3dea63568e74a97e5193cab7c54a")
  (:PATH "src/cache/clock.lisp" :GIT-BLOB
   "a1db79505e00f465b0f0debacbcbd8aad60c5b75")
  (:PATH "src/cache/core.lisp" :GIT-BLOB
   "9725836f0c142b5e292fea4d073f5fbc52b99825")
  (:PATH "src/cache/package.lisp" :GIT-BLOB
   "c86ef56ec05e92ebc0fa155423289775970eedd2")
  (:PATH "src/cache/read.lisp" :GIT-BLOB
   "84b090e318216a832ab684fc5a936c68e465c169")
  (:PATH "src/cache/types.lisp" :GIT-BLOB
   "93ecc29914d02b4b6066896de8c2590906ca91bc")
  (:PATH "src/cache/write.lisp" :GIT-BLOB
   "03bdfeeef2e2639030d3509bd6905364c55f345a")
  (:PATH "src/codec/cbor-array-input.lisp" :GIT-BLOB
   "1b028f9e5f945266f1144b664bf206e89f603863")
  (:PATH "src/codec/cbor-array-write.lisp" :GIT-BLOB
   "625b61e204f7485e1015d109426810ef9d92827c")
  (:PATH "src/codec/cbor-float-minimal.lisp" :GIT-BLOB
   "b7c915a734f60d820debb0694a09fcc8706c556b")
  (:PATH "src/codec/cbor-float-narrow.lisp" :GIT-BLOB
   "a2424c60204a55c7ec315de4446e41e243a1afca")
  (:PATH "src/codec/cbor-float-write.lisp" :GIT-BLOB
   "5a44cea28eb51016ce5155ebdf5750b93d15a1b3")
  (:PATH "src/codec/cbor-header.lisp" :GIT-BLOB
   "646ae0cc73acd7cf38882c0066cda7feecc68ca7")
  (:PATH "src/codec/cbor-item-read.lisp" :GIT-BLOB
   "e95db7d9f407e9e0039dc8892e4af8065490d99d")
  (:PATH "src/codec/cbor-map-input.lisp" :GIT-BLOB
   "87c9fd9dd6eb1f3ee1b79bdf2957801762601d97")
  (:PATH "src/codec/cbor-map-write.lisp" :GIT-BLOB
   "84887090a1fa543da817bd096528b576f3d58d9e")
  (:PATH "src/codec/cbor-minimal.lisp" :GIT-BLOB
   "0c424427595a99e281ec41009f1210a2978dc693")
  (:PATH "src/codec/cbor-package.lisp" :GIT-BLOB
   "3e31d60234585442baa5664be96a83915e034397")
  (:PATH "src/codec/cbor-scan-input.lisp" :GIT-BLOB
   "f7b702e065a9a3183f63ee68e784d6767ca2d6d1")
  (:PATH "src/codec/cbor-scan-items.lisp" :GIT-BLOB
   "fd984a4c3069787c6d0a45fab8bf1854c9fcf00a")
  (:PATH "src/codec/cbor-scan-minimal.lisp" :GIT-BLOB
   "3ee967ae0158b992fd2629dd79e8f4c4b6c5edcf")
  (:PATH "src/codec/cbor-scan-stack.lisp" :GIT-BLOB
   "dc2141629f609c56bb852b92699b07188a29b769")
  (:PATH "src/codec/cbor-scan.lisp" :GIT-BLOB
   "2fb5a339d2131187f3b62a41ee1b96b1d84fac1b")
  (:PATH "src/codec/cbor-simple-write.lisp" :GIT-BLOB
   "d9c686fef43c16c5cbf85672b2480a3d0340edfc")
  (:PATH "src/codec/cbor-space.lisp" :GIT-BLOB
   "37d9b785db8645666403b3d2a45f29da4fb9cd55")
  (:PATH "src/codec/cbor-string-read.lisp" :GIT-BLOB
   "446498b0f3b0f014471312eeb01b3d9a254b6535")
  (:PATH "src/codec/cbor-string-write.lisp" :GIT-BLOB
   "a9028c0b30a22367baad2711346a5517089b1940")
  (:PATH "src/codec/cbor-tag-input.lisp" :GIT-BLOB
   "760e81952f8eb3210465a6cea5c0b89c3f15c5a4")
  (:PATH "src/codec/cbor-tag-write.lisp" :GIT-BLOB
   "4680d759cf12aaa61df5823cb86e71ed7379914c")
  (:PATH "src/codec/cbor-write.lisp" :GIT-BLOB
   "159033291735d23258b340f8da17ad6bd001ccbf")
  (:PATH "src/codec/package.lisp" :GIT-BLOB
   "7139b8ce1a947efe6599f2cbbdf78a02e35a68f1")
  (:PATH "src/codec/utf8.lisp" :GIT-BLOB
   "685040c58e99547c42b0577ffecc8a86de1a680e")
  (:PATH "src/control/build.lisp" :GIT-BLOB
   "d5aca4f9ade3c126e88709f1ada1a9e39132b6a1")
  (:PATH "src/control/dependency.lisp" :GIT-BLOB
   "144f908c5cafddc397dd8a1cab04cd641d93a32c")
  (:PATH "src/control/package.lisp" :GIT-BLOB
   "e56a6bb83abe9441350baa46573d74c6d55edf4e")
  (:PATH "src/control/preflight.lisp" :GIT-BLOB
   "850a8f3bedb592dad251e36d7e95ad9fa993979d")
  (:PATH "src/control/prepare.lisp" :GIT-BLOB
   "51cdc2f60ef3da074e98f5bbabd1bb1b4ffbd6ed")
  (:PATH "src/control/publication-read.lisp" :GIT-BLOB
   "a5ebb2f8fafe283f3816d48e633ef8471bfbf4ba")
  (:PATH "src/control/publication.lisp" :GIT-BLOB
   "c8c482c65af3a94bea9acc38b3b93f04933c93b1")
  (:PATH "src/control/recovery-publication.lisp" :GIT-BLOB
   "b01545b6647f5dbac8097dcab394260fb7f9d3cd")
  (:PATH "src/control/recovery-read.lisp" :GIT-BLOB
   "430665c20905e5f7d67245e2d7503bb0f9e0c11f")
  (:PATH "src/control/recovery-types.lisp" :GIT-BLOB
   "2ac4f985eec224f17cea5658cd9d42f4aed99cce")
  (:PATH "src/control/transfer.lisp" :GIT-BLOB
   "69bb7c2e27817201c5533fa4d6099a26750a38b7")
  (:PATH "src/control/types.lisp" :GIT-BLOB
   "7eaa6e2298ac264b7d64c1f7a78de8d1fab8ce09")
  (:PATH "src/csn/package.lisp" :GIT-BLOB
   "c2ff554d80181b48d8ba414e9d2c6a84080cb413")
  (:PATH "src/csn/registry.lisp" :GIT-BLOB
   "c46fd76164808980af1d8b639890b3cc0ce8fb79")
  (:PATH "src/dispatch/begin.lisp" :GIT-BLOB
   "bb45bcad39e438aa082e92d01358d1059cc5fd20")
  (:PATH "src/dispatch/build.lisp" :GIT-BLOB
   "9d1c974830e92918b572af978e8a2b4acae257b6")
  (:PATH "src/dispatch/claim.lisp" :GIT-BLOB
   "a9d55f610fbd14b5bff7f9d6c2a6c8abb7ba405c")
  (:PATH "src/dispatch/package.lisp" :GIT-BLOB
   "db21c798588ff4a88be5b69b5fbe72bc84811a46")
  (:PATH "src/dispatch/recycle.lisp" :GIT-BLOB
   "57955f63a0cfc4efc3f7f742fd479c032dcec5b2")
  (:PATH "src/dispatch/start.lisp" :GIT-BLOB
   "4d519c9fba0c085d5789c2883c8d04079e3933ea")
  (:PATH "src/dispatch/step.lisp" :GIT-BLOB
   "36c8c1e84c7329f4a0b24186e09a40b2ce2d2b61")
  (:PATH "src/dispatch/types.lisp" :GIT-BLOB
   "6f3b3841a3158cac6daf70cc8a1ae3984f52566c")
  (:PATH "src/engine/adopt.lisp" :GIT-BLOB
   "e91cde14fcff879a1858b28c6063e5188dca4da0")
  (:PATH "src/engine/compaction-control.lisp" :GIT-BLOB
   "02cbb0127a3e9519ed0dc90730f077ade17fb5dd")
  (:PATH "src/engine/compaction-install.lisp" :GIT-BLOB
   "167777a12cf87a02b36a73c5609d098d9d8d1b46")
  (:PATH "src/engine/compaction-plan.lisp" :GIT-BLOB
   "d255c8440ee3abb0c190801e7c5b2e1a4872b47e")
  (:PATH "src/engine/compaction-reclaim.lisp" :GIT-BLOB
   "00076045f47b9b8a5a4a0aeee449a3a0cc5e2047")
  (:PATH "src/engine/compaction-relocate.lisp" :GIT-BLOB
   "3f316d79bf63b30bb5fa0cbac38927cf2a6e540d")
  (:PATH "src/engine/compaction-scan.lisp" :GIT-BLOB
   "942e0b2ba2be30a2e94efa1c80564dd7159e322a")
  (:PATH "src/engine/compaction-types.lisp" :GIT-BLOB
   "ee6f36958a147af9cdabdfee2ebe77752476da74")
  (:PATH "src/engine/compaction-verify.lisp" :GIT-BLOB
   "57628bb40f5be4c42b4366e81a0662f7f98c0137")
  (:PATH "src/engine/compaction-write.lisp" :GIT-BLOB
   "41cc966628e64d765c8a8f9d132321451025a3bd")
  (:PATH "src/engine/compaction.lisp" :GIT-BLOB
   "1eac672cf412fc36ae6fbfe5d8b4e7b93dcf480e")
  (:PATH "src/engine/conditional-group-types.lisp" :GIT-BLOB
   "f018f3b3512695c2fd5cc35f88e0e04ca90aef19")
  (:PATH "src/engine/conditional-group.lisp" :GIT-BLOB
   "f502618dc0a4c33aa5024408baccb116ed943c94")
  (:PATH "src/engine/conditional.lisp" :GIT-BLOB
   "e31cf1694c34220247c84e57022561e3757aa796")
  (:PATH "src/engine/config.lisp" :GIT-BLOB
   "354198f7b04489a46d0a67018d181a4c8668a42e")
  (:PATH "src/engine/delta-location.lisp" :GIT-BLOB
   "367601a853f8d2dd155b1dc0002b86d1b4bcdd5b")
  (:PATH "src/engine/delta-types.lisp" :GIT-BLOB
   "539f08cdb3736546b2b1556f81050d6c5d09ece9")
  (:PATH "src/engine/delta.lisp" :GIT-BLOB
   "b865dc6c8be351c3e89fcddbce61a4e0d7a2dd5d")
  (:PATH "src/engine/files.lisp" :GIT-BLOB
   "eda0f6adb8eb34225b6775b8ef666224e753deda")
  (:PATH "src/engine/image-activation.lisp" :GIT-BLOB
   "51ef93215340364bc2c881f3e7efa6a47aac6aa8")
  (:PATH "src/engine/image-auto-types.lisp" :GIT-BLOB
   "8879e3aa9b00d18cb138da9ca6d04028816502af")
  (:PATH "src/engine/image-auto-write.lisp" :GIT-BLOB
   "ac1ad97829a4b076b6f223e9e010c55752bf3066")
  (:PATH "src/engine/image-auto.lisp" :GIT-BLOB
   "0449392da3326308f5697fc231d24d329a691db8")
  (:PATH "src/engine/image-build-io.lisp" :GIT-BLOB
   "fbd185cd56d4d980575c4d0fec5597b715074f61")
  (:PATH "src/engine/image-build-plan.lisp" :GIT-BLOB
   "ccd01ee41d0d7a103680785731c5271a54f6f2df")
  (:PATH "src/engine/image-build-read.lisp" :GIT-BLOB
   "b11e63f292b93ddaee8b0c645d525a175a1906b0")
  (:PATH "src/engine/image-build-tree.lisp" :GIT-BLOB
   "d9a657c2fbdbb294e34fe8ba40c4fe8c8df11f03")
  (:PATH "src/engine/image-build-types.lisp" :GIT-BLOB
   "d2aacfe57703a7a99354657e4823a641d6eabb43")
  (:PATH "src/engine/image-build.lisp" :GIT-BLOB
   "a4c8ad027a796610299f457399f566ac0ca4284d")
  (:PATH "src/engine/image-config.lisp" :GIT-BLOB
   "47becee77666bb573500cc1d23735e627e65411b")
  (:PATH "src/engine/image-discovery-config.lisp" :GIT-BLOB
   "66c7f2c7f7eb87e0147d858c11787ffdd06b14bb")
  (:PATH "src/engine/image-discovery.lisp" :GIT-BLOB
   "aa41ecbc41a335a25fd3f62761147be516ebce6c")
  (:PATH "src/engine/image-maintenance-config.lisp" :GIT-BLOB
   "cbd5f1cdde00a60ee8cd952898c06e205c8edf1c")
  (:PATH "src/engine/image-maintenance.lisp" :GIT-BLOB
   "44bdff3e98ff1176b51b1bbc20bb8f54b94f5f3d")
  (:PATH "src/engine/image-recovery.lisp" :GIT-BLOB
   "f42286cf6d43cd486d9c4a79f764c99c35e2aa37")
  (:PATH "src/engine/image-renewal.lisp" :GIT-BLOB
   "0e6c21fcdec1d316551417b024e1ba5bda472abc")
  (:PATH "src/engine/image-source.lisp" :GIT-BLOB
   "8b7c7ecdebbf07ada9b68037976be5af53a6a106")
  (:PATH "src/engine/index-auto-api.lisp" :GIT-BLOB
   "1241871a3195c1c42b890e08373803a816809817")
  (:PATH "src/engine/index-auto-apply.lisp" :GIT-BLOB
   "7062c70c0f6322cda8de3f089bab2a216dae3d44")
  (:PATH "src/engine/index-auto-files.lisp" :GIT-BLOB
   "2c79ded6eb822d4f238f31cd7756bcdc79d5be7d")
  (:PATH "src/engine/index-auto-memory.lisp" :GIT-BLOB
   "8199f78030cc2d21af63d223c7d9cb99cb22b4fb")
  (:PATH "src/engine/index-auto-migrate.lisp" :GIT-BLOB
   "52e44cd130f7dc77bf6fa0be130dfc4827b4ec59")
  (:PATH "src/engine/index-auto-resolver.lisp" :GIT-BLOB
   "82554d4e3b9382c60bbdb0cf2986a4e75af1dafa")
  (:PATH "src/engine/index-auto-types.lisp" :GIT-BLOB
   "7d848c894841cdcf2abf615cd8140568a264351c")
  (:PATH "src/engine/index.lisp" :GIT-BLOB
   "650e3e008a6e489ebc3972366724edab5a3189c0")
  (:PATH "src/engine/initialize.lisp" :GIT-BLOB
   "8c39b866a402a30b1aa1ef7409e675f367e4ec97")
  (:PATH "src/engine/lifecycle.lisp" :GIT-BLOB
   "717898da19e3288ee03ac782959c23d32c9b8170")
  (:PATH "src/engine/package.lisp" :GIT-BLOB
   "b67b3b15539954ba4d3c92fcb3f4ccfafebca4c1")
  (:PATH "src/engine/preflight.lisp" :GIT-BLOB
   "272b6ffeb63fa9536bade7a0fd48764340128e4c")
  (:PATH "src/engine/read.lisp" :GIT-BLOB
   "a1737e9c70b317464520811512a42d4ae059bbdd")
  (:PATH "src/engine/record-cache.lisp" :GIT-BLOB
   "6d00296bffb12094dafd46a4ac898c9a20f81dfa")
  (:PATH "src/engine/recovery.lisp" :GIT-BLOB
   "05b64c0a49c59c209af8bac92f6823c193a92122")
  (:PATH "src/engine/rotation.lisp" :GIT-BLOB
   "db73c93ab163dc4cf2699cb6c357cfa3591be092")
  (:PATH "src/engine/startup.lisp" :GIT-BLOB
   "5245c459ca92fa0f69ff1810befc748fbb303f7f")
  (:PATH "src/engine/types.lisp" :GIT-BLOB
   "9a3c91e2a88056e611555fad3f5bd90c3ec1cbdd")
  (:PATH "src/engine/write-group-build.lisp" :GIT-BLOB
   "20a777cd92be4b8f91dad208132945c42309496c")
  (:PATH "src/engine/write-group-commit.lisp" :GIT-BLOB
   "18a21f787b8bdb1f41dd4f1ee3e215253cd62c0c")
  (:PATH "src/engine/write-group-index.lisp" :GIT-BLOB
   "b28196235d2b2853edbe75fcb5d024c0e7ea1b11")
  (:PATH "src/engine/write-group-legacy.lisp" :GIT-BLOB
   "a0c17966476bfa9d5a008bec9b6071c91070040f")
  (:PATH "src/engine/write-group-plan.lisp" :GIT-BLOB
   "d126d7176bef13a8dc19bac5836581cb65dfbd35")
  (:PATH "src/engine/write-group-types.lisp" :GIT-BLOB
   "2f1e78aef52cbdb0aabc663873b832eb31713bba")
  (:PATH "src/engine/write-group.lisp" :GIT-BLOB
   "bacee8da25a18c7736921c10357a344394eb5ed8")
  (:PATH "src/engine/write.lisp" :GIT-BLOB
   "3b83c17a8bf510c110648b4257fe9b8df43b6bf5")
  (:PATH "src/epochs/core.lisp" :GIT-BLOB
   "93dbc244d3e8a86e64254b31e2954102f65ab149")
  (:PATH "src/epochs/package.lisp" :GIT-BLOB
   "43bc1aefdeec0e19e729160b3aa085091634a11a")
  (:PATH "src/epochs/read.lisp" :GIT-BLOB
   "0fc4c81f23e27dabfe52485a3976ec3eb390eb4c")
  (:PATH "src/epochs/reclaim.lisp" :GIT-BLOB
   "e0d503d2ad85689ac6162636857f4e44f2b5c7f9")
  (:PATH "src/epochs/retire.lisp" :GIT-BLOB
   "474ddacfc871629aad94b6d59b87de7cd4349475")
  (:PATH "src/epochs/types.lisp" :GIT-BLOB
   "838611d288696767dc539b155fcfefe3feec79e2")
  (:PATH "src/execution/handoff.lisp" :GIT-BLOB
   "bbed8c36a799b57baebe6350dd96c3a968dd05e7")
  (:PATH "src/execution/package.lisp" :GIT-BLOB
   "dcdf82cb17b20f6d4e96cc94d3f1522520c3a236")
  (:PATH "src/execution/queue.lisp" :GIT-BLOB
   "b27df62179c9f43132c445c82f0c2bf4ee78f366")
  (:PATH "src/execution/ready-recycle.lisp" :GIT-BLOB
   "5d4e27472170bfffa85a6e8aac0760236e7fefb6")
  (:PATH "src/execution/ready-types.lisp" :GIT-BLOB
   "f79bbd85269d50eb929816276353b2fbb85f92c9")
  (:PATH "src/execution/ready.lisp" :GIT-BLOB
   "a36b9bc921e8d58f9cf3a10a8426eb388e710226")
  (:PATH "src/execution/worker-boundary.lisp" :GIT-BLOB
   "c066712083a07bc574481ae3a3cdcc996c9303a8")
  (:PATH "src/execution/worker-claim.lisp" :GIT-BLOB
   "3c970d0cbd3866d837c07bd03d7e4e0fae24f21f")
  (:PATH "src/execution/worker-run.lisp" :GIT-BLOB
   "c048d0e7321d26e5ec3ec4eb7d3bd79b4714aef5")
  (:PATH "src/execution/worker-types.lisp" :GIT-BLOB
   "7170e6de30721bcb89cb94b56e9d3c579a1269be")
  (:PATH "src/execution/writer.lisp" :GIT-BLOB
   "8be80a716738875d5e6fe056c5f3c81d2ffad2e5")
  (:PATH "src/foundation/batch.lisp" :GIT-BLOB
   "5560532f4cae67478c11adc65e632cfe3da10ad7")
  (:PATH "src/foundation/binary.lisp" :GIT-BLOB
   "1548e1cf2f30a547b7e8a4331ced97e293718bbb")
  (:PATH "src/foundation/conditions.lisp" :GIT-BLOB
   "a652b2e7ea5a431ce46827a9ba37d7d4931f6cba")
  (:PATH "src/foundation/crc32c-native.lisp" :GIT-BLOB
   "2e80dc72cce0064a460b8ee78970acae71a9da35")
  (:PATH "src/foundation/crc32c-vops.lisp" :GIT-BLOB
   "0677d1d29c7fc16dbd8bda529cffa5f1076327a8")
  (:PATH "src/foundation/crc32c.lisp" :GIT-BLOB
   "3dee5a43950d683f83deffaa6f329d6dcbc6cfc2")
  (:PATH "src/foundation/package.lisp" :GIT-BLOB
   "964bc89007b51d5176bf73358e90d25ce7499497")
  (:PATH "src/foundation/record.lisp" :GIT-BLOB
   "6fca7bd583990cf07093243c95f399d294b74d45")
  (:PATH "src/fulltext-admission/build.lisp" :GIT-BLOB
   "ba813f4178d646f412363e8b3f86f7309878a4a1")
  (:PATH "src/fulltext-admission/copy.lisp" :GIT-BLOB
   "43488c42525991544b355bfc061c2c753e866c88")
  (:PATH "src/fulltext-admission/guards.lisp" :GIT-BLOB
   "c4734194dc53a5f98397bd0b35079c5739f95a41")
  (:PATH "src/fulltext-admission/lifecycle.lisp" :GIT-BLOB
   "088b775f74cf633ecb3b84a0c0b9445209cc4b93")
  (:PATH "src/fulltext-admission/package.lisp" :GIT-BLOB
   "74d06aa6d0d0b263b806f678b23cec40b5db3ef1")
  (:PATH "src/fulltext-admission/preflight.lisp" :GIT-BLOB
   "eeff3e04503f0dac81da9816112f2da68e384dc2")
  (:PATH "src/fulltext-admission/query.lisp" :GIT-BLOB
   "a8aac3c938ada73cb2b18abfaf44d7bc1ff4cfa5")
  (:PATH "src/fulltext-admission/reserve.lisp" :GIT-BLOB
   "374c03ecf29417aad8e760dd432ff3e5a6383e4c")
  (:PATH "src/fulltext-admission/row-update.lisp" :GIT-BLOB
   "1d77f5d5c6e1ddb8ab08136d7d7afaf1f79a7f79")
  (:PATH "src/fulltext-admission/rows.lisp" :GIT-BLOB
   "f1c6dc8236477b5de6b2f0e5db4bab8a02fcbe95")
  (:PATH "src/fulltext-admission/types.lisp" :GIT-BLOB
   "b4766a5b561c1a1f3e53bfc9485f72b128dfb1d1")
  (:PATH "src/fulltext-put/append.lisp" :GIT-BLOB
   "df244937278aebfabba27f14555b36476e6d9858")
  (:PATH "src/fulltext-put/binding.lisp" :GIT-BLOB
   "c47d939287b3be63ec090d24bd64903556b2b86a")
  (:PATH "src/fulltext-put/build.lisp" :GIT-BLOB
   "1f4113fb6ce043099672cf72c995b976c9543cea")
  (:PATH "src/fulltext-put/package.lisp" :GIT-BLOB
   "0ffd3fb459d14ef6da0ab6789930b8ee54b78fe5")
  (:PATH "src/fulltext-put/physical-header.lisp" :GIT-BLOB
   "8fbb48b2ceb0ccb9c73b9344e14fbb025174b7e4")
  (:PATH "src/fulltext-put/physical.lisp" :GIT-BLOB
   "f7a1a29690b384cdd8bf791e62ac2d98deb7495b")
  (:PATH "src/fulltext-put/prepare.lisp" :GIT-BLOB
   "5a6929f64ba29f63efa2717a79fb79c93206b74c")
  (:PATH "src/fulltext-put/reserve.lisp" :GIT-BLOB
   "81642e379bb158bed9bec2f0fa9c70190a637567")
  (:PATH "src/fulltext-put/row-reference.lisp" :GIT-BLOB
   "b24f1dc1bd7ea08b7efe05e954cd30190f8a1aa1")
  (:PATH "src/fulltext-put/start.lisp" :GIT-BLOB
   "8c6677841d374a7bfc1834a83ccf610eecce0890")
  (:PATH "src/fulltext-put/types.lisp" :GIT-BLOB
   "c0bb31863f4f17894f85f69df42d5476d988f9da")
  (:PATH "src/fulltext/analysis-emit.lisp" :GIT-BLOB
   "17bcef98c46d7a035d2945be0c7407ed178e3da7")
  (:PATH "src/fulltext/analysis-nfc.lisp" :GIT-BLOB
   "e3e34d111a4cbab7a860d995e0658e154f1a4031")
  (:PATH "src/fulltext/analysis-package.lisp" :GIT-BLOB
   "5729cfba660c391cf9dee6fc3d5e6ccbddcd2552")
  (:PATH "src/fulltext/analysis-properties.lisp" :GIT-BLOB
   "320a03b22e01f755184d3d8b6aa1a61b009ce538")
  (:PATH "src/fulltext/analysis-space.lisp" :GIT-BLOB
   "7ab493596664f1488b369fc0b14b083e9eee31af")
  (:PATH "src/fulltext/analysis-word-context.lisp" :GIT-BLOB
   "023c1d7676f5f1325e7b112ba38a132a010f36e8")
  (:PATH "src/fulltext/analysis-word-rules.lisp" :GIT-BLOB
   "0278fccb36c8320d8b0b11b26e067773b8435e1a")
  (:PATH "src/fulltext/analysis.lisp" :GIT-BLOB
   "496c3196aa6efc23695486f15253f9275b58c1c6")
  (:PATH "src/fulltext/codec-input.lisp" :GIT-BLOB
   "ff8ede224c154fa075b7f1eb53cacecbcc7d73c3")
  (:PATH "src/fulltext/codec-package.lisp" :GIT-BLOB
   "fcd63be08134216e7a0d79c68ba6fc1120415689")
  (:PATH "src/fulltext/codec-plan.lisp" :GIT-BLOB
   "b614382a5beec3c0ccc3134f0e2abffc0fb44e87")
  (:PATH "src/fulltext/codec-query.lisp" :GIT-BLOB
   "1047b265bf2140ea5d14ea55987f1bdfae2f6e0c")
  (:PATH "src/fulltext/codec-read-base.lisp" :GIT-BLOB
   "5a24b81342a564255563e9309efcc9f043aa33a4")
  (:PATH "src/fulltext/codec-read-dict.lisp" :GIT-BLOB
   "5958a63148c0942343fa93fce59a59d614850bb2")
  (:PATH "src/fulltext/codec-read-lengths.lisp" :GIT-BLOB
   "91b77b0ef9cc16fb29c437130453ca97c19de60f")
  (:PATH "src/fulltext/codec-read-postings.lisp" :GIT-BLOB
   "46fc1a96ed8bd3e616392ac6c891a678b4e8f33a")
  (:PATH "src/fulltext/codec-read-term.lisp" :GIT-BLOB
   "bf77c4c7d7f7faeaa68077cc1dfbb8349ff6eeb7")
  (:PATH "src/fulltext/codec-run.lisp" :GIT-BLOB
   "fbe693aa1579466dc55fc03fe88a1bb04d7c097f")
  (:PATH "src/fulltext/codec-space.lisp" :GIT-BLOB
   "48e907be585f73c58fd7fa4e89a0b5cdfbfef309")
  (:PATH "src/fulltext/codec-view.lisp" :GIT-BLOB
   "49a4547d0153a45281e2bd2188891f2c5517523d")
  (:PATH "src/fulltext/codec-write-entries.lisp" :GIT-BLOB
   "035e0c6d0826d7be8e5308c3dbabf9f4b6b94b50")
  (:PATH "src/fulltext/codec-write.lisp" :GIT-BLOB
   "64731ed8f9fc9f1246a62c659b18fa85ae2a0f3e")
  (:PATH "src/fulltext/descriptor.lisp" :GIT-BLOB
   "d53475000e9a1f3f3ab97f29780b526b39c43e58")
  (:PATH "src/fulltext/document-analysis.lisp" :GIT-BLOB
   "5f4635b04bf39a7673c4071ac423f3c23b595c57")
  (:PATH "src/fulltext/document-bound.lisp" :GIT-BLOB
   "6eb42da6fa77f01a38b92559b1eccc32f1313d43")
  (:PATH "src/fulltext/document-config-input.lisp" :GIT-BLOB
   "f9522d52f03c808c9e31903ac6393ba113c487f0")
  (:PATH "src/fulltext/document-config.lisp" :GIT-BLOB
   "4d28290bec4b6bca2f8a79338323fa1e4b2ed617")
  (:PATH "src/fulltext/document-package.lisp" :GIT-BLOB
   "c699e405a2ce6c5a18cc27842352f8ad43647e4b")
  (:PATH "src/fulltext/document-paths.lisp" :GIT-BLOB
   "dc31d23d3316043885526af964aab860fe4a6f45")
  (:PATH "src/fulltext/document-scan.lisp" :GIT-BLOB
   "62df7660d399fe08ccb948a21fe6ceb0bbca507b")
  (:PATH "src/fulltext/document-space.lisp" :GIT-BLOB
   "ab484dddcbd81d464e8739e4aa28a1be667accc1")
  (:PATH "src/fulltext/document-start.lisp" :GIT-BLOB
   "d59279a55290ed8b35e722dd9ee47cef68502a1a")
  (:PATH "src/fulltext/document.lisp" :GIT-BLOB
   "447a0f0d27d1e197483f839e7a03d75bce92585d")
  (:PATH "src/fulltext/format-constants.lisp" :GIT-BLOB
   "cc040653f809c725a063eee35fff6e2f9570b675")
  (:PATH "src/fulltext/format-input.lisp" :GIT-BLOB
   "891ad11bf97386317a7a56d6e81c7d425745dfdb")
  (:PATH "src/fulltext/format-package.lisp" :GIT-BLOB
   "1f72e2d40467a20422c5bfaa2564bb5b84fedf29")
  (:PATH "src/fulltext/format-read.lisp" :GIT-BLOB
   "323807f0a973049dd290dd7dad4d2266301e6e57")
  (:PATH "src/fulltext/format-write.lisp" :GIT-BLOB
   "2b89b266d96de0264d92b164b4d59e4e27079f82")
  (:PATH "src/fulltext/index-build.lisp" :GIT-BLOB
   "54ae060c29f1345430a44b2b378c8cb43039dcdc")
  (:PATH "src/fulltext/index-lookup.lisp" :GIT-BLOB
   "9ef394661c96beef9e4cbf3f2e8e5812ec6828c6")
  (:PATH "src/fulltext/index-package.lisp" :GIT-BLOB
   "20bfb93adc06f0782e20fe842f4805b2249d440a")
  (:PATH "src/fulltext/index-sort.lisp" :GIT-BLOB
   "369d3de6ee0ecee94aadfe6ebbce619b84e8147b")
  (:PATH "src/fulltext/index-step.lisp" :GIT-BLOB
   "9206fd68138b97057494978f7713618063510654")
  (:PATH "src/fulltext/meta-fields.lisp" :GIT-BLOB
   "afaeeadd5831bac5804c57a9b67428a3e3c2eaa0")
  (:PATH "src/fulltext/meta-read.lisp" :GIT-BLOB
   "9a4f5a543e68b9c585126096feadaa754f10c6d7")
  (:PATH "src/fulltext/unicode-tables.lisp" :GIT-BLOB
   "a0b079ee4bfba2d1a6ca83b4bb9c555462b75b3c")
  (:PATH "src/get-directory/build.lisp" :GIT-BLOB
   "4ebfa97211671287aa2c972a8923654c2390d0f9")
  (:PATH "src/get-directory/package.lisp" :GIT-BLOB
   "8dcddeb0536c1104af92c722ffbfab2059601c74")
  (:PATH "src/get-directory/read.lisp" :GIT-BLOB
   "a957b1f91e495637b700756736a96baafd233abe")
  (:PATH "src/get-directory/sources-read.lisp" :GIT-BLOB
   "fbb8b26fcfd9de939bf4f3c61d5fd0c5c335754c")
  (:PATH "src/get-directory/sources-types.lisp" :GIT-BLOB
   "ce426ea6409d588e0ca6add8e6c95a1c594e0c89")
  (:PATH "src/get-directory/types.lisp" :GIT-BLOB
   "564cdaea8cb9aae672cbbd4328ea7e76b4430f4a")
  (:PATH "src/get-resolver/active-arena-read.lisp" :GIT-BLOB
   "b70b14e779d6c841bd52ca53a599822b77dcdc32")
  (:PATH "src/get-resolver/active-arena-write.lisp" :GIT-BLOB
   "2f893bf07fc9a7d36761a54cf2bbd03300d5a945")
  (:PATH "src/get-resolver/active-arena.lisp" :GIT-BLOB
   "8195220c0d648304d57dac090ab0da03f7812fe9")
  (:PATH "src/get-resolver/active-build.lisp" :GIT-BLOB
   "136d22104439f016932e90d45622553f070c1724")
  (:PATH "src/get-resolver/active-directory.lisp" :GIT-BLOB
   "3a3dae662d06b1e2b6bc936b227894d2f0396b6d")
  (:PATH "src/get-resolver/active-init.lisp" :GIT-BLOB
   "89d45e100f395e65aeca93e7d317073cfb5ffdc3")
  (:PATH "src/get-resolver/active-preflight.lisp" :GIT-BLOB
   "93a32b00aef08a29b4ae7d638eaf16cc68a284ff")
  (:PATH "src/get-resolver/active-read.lisp" :GIT-BLOB
   "430b3ba6b063931e60c477a22ce3c50fa1898750")
  (:PATH "src/get-resolver/active-scan.lisp" :GIT-BLOB
   "6e481f4d41ba4d20649978f806df1685b7afa8fb")
  (:PATH "src/get-resolver/active-types.lisp" :GIT-BLOB
   "9634424bab5ea2fe66d950f30e7d51b1baa3a395")
  (:PATH "src/get-resolver/build.lisp" :GIT-BLOB
   "d6854c7ec8b7125b33391a27760be11cd01c89db")
  (:PATH "src/get-resolver/package.lisp" :GIT-BLOB
   "33d7b898b5f5a7b20c8112484191c14df44b770e")
  (:PATH "src/get-resolver/read.lisp" :GIT-BLOB
   "1a5479dc776fd56b3c6871dd2984a620bf43f991")
  (:PATH "src/get-resolver/rows.lisp" :GIT-BLOB
   "b747d3a4b6517d7574225dc26cab8703747f0e05")
  (:PATH "src/get-resolver/scan.lisp" :GIT-BLOB
   "c0f1a6b32a1725b6e9ae05e00e130a3e0097be78")
  (:PATH "src/get-resolver/sort.lisp" :GIT-BLOB
   "7f2f8b496d65b70d83eee58c19b5b679b5d632ba")
  (:PATH "src/get-resolver/types.lisp" :GIT-BLOB
   "77b07c57b7e57505ff35724dc36a90cb554679ee")
  (:PATH "src/get/build.lisp" :GIT-BLOB
   "76ac8e35c01b887cec70ccd78d29d87690557eae")
  (:PATH "src/get/lifecycle.lisp" :GIT-BLOB
   "2a393aae53a7b13b567dc5a44b5d0d1da83714f3")
  (:PATH "src/get/lookup.lisp" :GIT-BLOB
   "01233e1565f301c96ce6ee3bb33a50f10cb2e937")
  (:PATH "src/get/package.lisp" :GIT-BLOB
   "a22de99a63db56417822bb5e66f82e5c89d73bc2")
  (:PATH "src/get/segment.lisp" :GIT-BLOB
   "7a3600dfe26168cc956e1ef62d07221a6d51a61f")
  (:PATH "src/get/target.lisp" :GIT-BLOB
   "fe1475f001e9b5719980f7e7507f735edc7e208a")
  (:PATH "src/get/types.lisp" :GIT-BLOB
   "4dd3840c525e54acc7d1577b45aadff217a77c4b")
  (:PATH "src/hash/arithmetic.lisp" :GIT-BLOB
   "f1a5060bb6071bec929476a9151fba0ec68e1604")
  (:PATH "src/hash/blocks.lisp" :GIT-BLOB
   "db2d060ad9f747deaa7f5016d09eb8ff0299d36e")
  (:PATH "src/hash/hash64.lisp" :GIT-BLOB
   "9827cb4af0343e4241d2fed6e3c62830455f8749")
  (:PATH "src/hash/package.lisp" :GIT-BLOB
   "0c73ce15b8de3f9173a99f7216ead4e79d04d535")
  (:PATH "src/index-disk/api.lisp" :GIT-BLOB
   "daeaeeaef31f8cd903ad02f6cd60193611714643")
  (:PATH "src/index-disk/balance.lisp" :GIT-BLOB
   "c1189c5fcb2a3389004a0b2d19357c4f93e9e026")
  (:PATH "src/index-disk/build.lisp" :GIT-BLOB
   "85d0f397ea8062235c537806caa21fe03d790589")
  (:PATH "src/index-disk/cache.lisp" :GIT-BLOB
   "e61013c7d4d60aa0711024615dcdf42476c69ecb")
  (:PATH "src/index-disk/copy.lisp" :GIT-BLOB
   "b26cdc656f9112ab344983c5a7f473e97442c8e3")
  (:PATH "src/index-disk/mutate.lisp" :GIT-BLOB
   "ac7a72b3d506de92ec80bbb9653904188b98d8f8")
  (:PATH "src/index-disk/package.lisp" :GIT-BLOB
   "23536e507f5fee4b20554184835addebab23ba3e")
  (:PATH "src/index-disk/read.lisp" :GIT-BLOB
   "20599afde6adbb9cd9decdc852f0de469a5d72e5")
  (:PATH "src/index-disk/relocate.lisp" :GIT-BLOB
   "34399623c2c31e68c16d069f57d1b7e6b9bd4ab2")
  (:PATH "src/index-disk/types.lisp" :GIT-BLOB
   "df13ba528aa6bba71981c44b8fbf14c69fa4551e")
  (:PATH "src/index-disk/visit.lisp" :GIT-BLOB
   "ec8ae71e8f2d27b7e2a49cefbeb2c86e7367bbe2")
  (:PATH "src/index-disk/write.lisp" :GIT-BLOB
   "7b6e37218626e782f22cc2903328c40f23d52fac")
  (:PATH "src/index/core.lisp" :GIT-BLOB
   "64be10d7b2dc85c6dd6c31becefbb6ee3ae74d21")
  (:PATH "src/index/hash-digests.lisp" :GIT-BLOB
   "ec86f5be5b5d465d5e32dc3c492cbc0c90daaba5")
  (:PATH "src/index/hash-seed.lisp" :GIT-BLOB
   "6dc9775423900dd855c71c06079cdc5e69411c5b")
  (:PATH "src/index/image-codec.lisp" :GIT-BLOB
   "e3b96642767e7e0d116481f41e279274646c2b12")
  (:PATH "src/index/image-constants.lisp" :GIT-BLOB
   "6c123802b75884937c2e9bcd7cfe4e214173ab9e")
  (:PATH "src/index/image-publication.lisp" :GIT-BLOB
   "7733d528d07acc24ec9f8c00c6767c2e3b09975e")
  (:PATH "src/index/image-recovery.lisp" :GIT-BLOB
   "ea1a681932b0fa2a1a7a3f44238816657505e55c")
  (:PATH "src/index/image-seal.lisp" :GIT-BLOB
   "f788cc87a9f2f963210d5bb54310f359df78adba")
  (:PATH "src/index/image-types.lisp" :GIT-BLOB
   "69315a89f5b007ebfbb838bc87dde37221fa69c8")
  (:PATH "src/index/image-verify-edges.lisp" :GIT-BLOB
   "2bdfd22b88408ff57efe6dc6e8c61fb5bb4f2fa1")
  (:PATH "src/index/image-verify-entry.lisp" :GIT-BLOB
   "6d240011e6b3f2c8795537bdead86763cd5a0dd5")
  (:PATH "src/index/image-verify-key.lisp" :GIT-BLOB
   "c7bde57d3d327f32321c29d358cb84eb90f1eadc")
  (:PATH "src/index/image-verify-types.lisp" :GIT-BLOB
   "a7f39bfa563402bb113c3430c5229926c0354ff9")
  (:PATH "src/index/mode-package.lisp" :GIT-BLOB
   "53da3230da115c0d702cc762d3f2ab69e6af253e")
  (:PATH "src/index/mode-policy.lisp" :GIT-BLOB
   "2acdfd94b5a0e5bfc04135cf9f39b4a72ef93482")
  (:PATH "src/index/mode-types.lisp" :GIT-BLOB
   "9e42e46cfa22a400da7635e45ab7c8192e25204c")
  (:PATH "src/index/package.lisp" :GIT-BLOB
   "02d4fd9bf5f1701eefd5e6997b89c1d98a8cef5c")
  (:PATH "src/index/page-body.lisp" :GIT-BLOB
   "c4143fd0c6350883ff10db74c2f8b9c7320b7600")
  (:PATH "src/index/page-bucket.lisp" :GIT-BLOB
   "f6f9c5b2076c8f3c1ae9dd1c23bdab00cbd69005")
  (:PATH "src/index/page-build-config.lisp" :GIT-BLOB
   "8d34342f4e34d3edacf6edb07a3059b8cd199d62")
  (:PATH "src/index/page-build-emit.lisp" :GIT-BLOB
   "479818ed5d901eee9ecfee456e39b66d4f02c620")
  (:PATH "src/index/page-build-plan.lisp" :GIT-BLOB
   "86bf82eb3913ca8dad0f7e1dbe1e9016da5b18a9")
  (:PATH "src/index/page-build-proof.lisp" :GIT-BLOB
   "f86fd7f850a9f1559e9af7fdf445971e07020eff")
  (:PATH "src/index/page-build-types.lisp" :GIT-BLOB
   "4fb20f67faa960088aadf112246f84a98f58117a")
  (:PATH "src/index/page-build.lisp" :GIT-BLOB
   "b632710d7d32cac680b10a9312bd9c4878024fd0")
  (:PATH "src/index/page-cache-types.lisp" :GIT-BLOB
   "bbea574ced62361daf59b1d03fb6f06cdb840991")
  (:PATH "src/index/page-cache.lisp" :GIT-BLOB
   "e66d3fa17f78dde39eff02eb8993a7c68f9ba9f5")
  (:PATH "src/index/page-constants.lisp" :GIT-BLOB
   "de904d211f301a087b3d1d53fa47a8054ccf2eb7")
  (:PATH "src/index/page-lookup-key.lisp" :GIT-BLOB
   "9e2e8f43e9a787b7a9223d57dcbab979dbbc233e")
  (:PATH "src/index/page-lookup-types.lisp" :GIT-BLOB
   "9abfe5a3024425124a8e9cc3b0a7087ad5cad1ff")
  (:PATH "src/index/page-lookup.lisp" :GIT-BLOB
   "9dde416acf27111c21e3f439dd2c948d27517eb7")
  (:PATH "src/index/page-package.lisp" :GIT-BLOB
   "d3f1ff0b939b5a4a1e2df7f22fb04077886220ea")
  (:PATH "src/index/page-read.lisp" :GIT-BLOB
   "0386ec4059fbb6a01d34a137e5bf5a6f44a6f589")
  (:PATH "src/index/page-types.lisp" :GIT-BLOB
   "74a9db44b348db25a046c9250f092a0e03f82ca0")
  (:PATH "src/index/page-validation.lisp" :GIT-BLOB
   "a45eb2aa3d449c9500a95950709cb6019fb8f76b")
  (:PATH "src/index/page-write.lisp" :GIT-BLOB
   "6206be6610c55d48389763a3205ff80ebd79a6d8")
  (:PATH "src/index/primary-arena.lisp" :GIT-BLOB
   "27c03d2d3e8bfb6b93088bb55bd6e615350261d0")
  (:PATH "src/index/primary-build.lisp" :GIT-BLOB
   "83fe7ca83cad1b84f41a579d56bb02ee0bac881e")
  (:PATH "src/index/primary-core.lisp" :GIT-BLOB
   "86debb0798063a5e05be0a96f125dece7edd0f0a")
  (:PATH "src/index/primary-directory.lisp" :GIT-BLOB
   "5afb91ab551d915d29f6630573a17328839cc616")
  (:PATH "src/index/primary-package.lisp" :GIT-BLOB
   "099d59bb9acc155380a3baaa3a10816e0902d8ca")
  (:PATH "src/index/primary-probe.lisp" :GIT-BLOB
   "d054587f29d5108d65704fe8b5b6794178923902")
  (:PATH "src/index/primary-read.lisp" :GIT-BLOB
   "7cc651a3e3de17decfe71f3ee9b826dfa7b3ca2f")
  (:PATH "src/index/primary-relocate.lisp" :GIT-BLOB
   "fde846254989ef432159c1ffcfc25fb3f950dbcc")
  (:PATH "src/index/primary-restore.lisp" :GIT-BLOB
   "252bd2cb57700c33fd4ec94749ea6f0b80ae6817")
  (:PATH "src/index/primary-types.lisp" :GIT-BLOB
   "179de5b6f466cfcb72c719c49a0e885b5bcf6a12")
  (:PATH "src/index/primary-write.lisp" :GIT-BLOB
   "621a82743aceafa1653340330e413bc902c58ebb")
  (:PATH "src/index/read.lisp" :GIT-BLOB
   "0187f4d9603d23a6ddb0a76d282af9c811080534")
  (:PATH "src/index/rebuild-budget.lisp" :GIT-BLOB
   "589e1557b2906a15c6c874f126968669206ceed9")
  (:PATH "src/index/rebuild-copy.lisp" :GIT-BLOB
   "bebb4f103854e0b3dbfc248cae5b82cdeafb0b57")
  (:PATH "src/index/rebuild-scan.lisp" :GIT-BLOB
   "ad43248f2f9ec4978a07df5bb696c49a1c055ea7")
  (:PATH "src/index/rebuild.lisp" :GIT-BLOB
   "6a55454412edc8466e9c7972f9c81d9a3c945697")
  (:PATH "src/index/relocate.lisp" :GIT-BLOB
   "d42c883908d8a8c9c467342b8977498f38dcf33b")
  (:PATH "src/index/types.lisp" :GIT-BLOB
   "83bec7e5e8d66f78d9b127c5310b2058b3c3fed6")
  (:PATH "src/index/validation.lisp" :GIT-BLOB
   "ab3fd8e8abe4fd803038cf11e13c3fef75a8144b")
  (:PATH "src/index/write.lisp" :GIT-BLOB
   "0e8ca5847c6683a89cdd47e3476665b1bd46e6da")
  (:PATH "src/io/cpu-build.lisp" :GIT-BLOB
   "0dd046093289729dbc7817a3eeb7dff004f0e9fa")
  (:PATH "src/io/cpu-features.lisp" :GIT-BLOB
   "80653c6c8871127b3d76cc631d47ba0e711b6e5d")
  (:PATH "src/io/cpu-package.lisp" :GIT-BLOB
   "baf8aa6f2ef5231eb6462bca65d83ac1886d09e5")
  (:PATH "src/io/create-relative.lisp" :GIT-BLOB
   "eb4a8c292b30a3083cd256eda697b05737553022")
  (:PATH "src/io/derived-remove.lisp" :GIT-BLOB
   "a0631348bc17fc4e5c1638522be73ae87fa53a97")
  (:PATH "src/io/directory-identity.lisp" :GIT-BLOB
   "c8c0d5158db99bce8a93a68921265d080a801f49")
  (:PATH "src/io/directory-lock.lisp" :GIT-BLOB
   "f0135b3b43625d9535db6196507b55154d36f852")
  (:PATH "src/io/directory-node.lisp" :GIT-BLOB
   "6b6d384771d4a7d5f1bdd2b44ffc2e072b44f7a6")
  (:PATH "src/io/directory-publish.lisp" :GIT-BLOB
   "5b839c56bd0c76ebc63e715a99e58e6684a2194a")
  (:PATH "src/io/directory.lisp" :GIT-BLOB
   "8b3fb30b5fa092a5f88ce55cbcf5ebfa6bddf993")
  (:PATH "src/io/flush.lisp" :GIT-BLOB
   "9b04b83cf53f493aaf75d1c19a6d5f9f4ee0971f")
  (:PATH "src/io/identity-types.lisp" :GIT-BLOB
   "d53f8c4793af7e98dcab62ee5c94571dd8d520a2")
  (:PATH "src/io/identity.lisp" :GIT-BLOB
   "0cb49ca63800c1fc25bee5bf94c2811969511a07")
  (:PATH "src/io/lifecycle.lisp" :GIT-BLOB
   "9ea7d77f1bccbb7051123ac2e5793d38b770ffbf")
  (:PATH "src/io/namespace.lisp" :GIT-BLOB
   "1f73f6bf5c4b8f12064b515008d6c8f9076518ce")
  (:PATH "src/io/native-create-relative.lisp" :GIT-BLOB
   "9d715484a72332fb056b8102d2277140128b2f59")
  (:PATH "src/io/native-directory-node.lisp" :GIT-BLOB
   "90c0aaeb12ffbd70927e11d414d461a5aa6649e6")
  (:PATH "src/io/native-directory.lisp" :GIT-BLOB
   "95ea1018b8693a89e0967f9a7a6dea95542d6005")
  (:PATH "src/io/native-namespace.lisp" :GIT-BLOB
   "599c21713f3d82b6bc9faac71e42a45da0e6cd90")
  (:PATH "src/io/native-open-relative.lisp" :GIT-BLOB
   "d924a8a202ab02406cdae147cfa0cb742a0917e6")
  (:PATH "src/io/native-publish.lisp" :GIT-BLOB
   "d62f716c3965b838e0cdb7a629c78bdf845bbdc2")
  (:PATH "src/io/native.lisp" :GIT-BLOB
   "37f1e1782e0e3580447aa0ef56cb0942cfbd0e66")
  (:PATH "src/io/open-relative.lisp" :GIT-BLOB
   "5661db137129352877e2b2d563f459fb5cc306fb")
  (:PATH "src/io/package.lisp" :GIT-BLOB
   "0cbac7310ba0328485e82041f1fa3904da4c3c48")
  (:PATH "src/io/publish.lisp" :GIT-BLOB
   "cb759a6c4c6d4b9300c1bb9e1e7b7d781f629f65")
  (:PATH "src/io/readiness.lisp" :GIT-BLOB
   "8ae8de38729e3866227360cc1cf6022c9220490b")
  (:PATH "src/io/rename.lisp" :GIT-BLOB
   "38a7d50880a012266e59eb915edafe64f2047e4e")
  (:PATH "src/io/segment-remove.lisp" :GIT-BLOB
   "8530ef67554d751b20d1004a9af49f20b8fc1861")
  (:PATH "src/io/stabilize-preflight.lisp" :GIT-BLOB
   "290915923be47b7739c3f44560a62f9819c7a26e")
  (:PATH "src/io/stabilize.lisp" :GIT-BLOB
   "504c9dca2fece31bc79f8788f7524d7397a1fee2")
  (:PATH "src/io/transfer.lisp" :GIT-BLOB
   "b66a02dbc2eda6d43388a0946ae46b795efb2a76")
  (:PATH "src/io/types.lisp" :GIT-BLOB
   "01429af78ae0c433582ea93d596204b6b9173b4e")
  (:PATH "src/local/cli.lisp" :GIT-BLOB
   "801ea182eab95273f82e3b5687605dfbf31aef75")
  (:PATH "src/local/client-conditional-group.lisp" :GIT-BLOB
   "8d12830d12a112368469e0718c0ddfe168b79e7c")
  (:PATH "src/local/client-group.lisp" :GIT-BLOB
   "a55657c6d0e22e5dedf411fe33aa6c2f1c153503")
  (:PATH "src/local/client-read-group.lisp" :GIT-BLOB
   "3ca89d062de82fec20c9410c7149e53a4741755b")
  (:PATH "src/local/client-version.lisp" :GIT-BLOB
   "9880ac8380a3db16e8eb22f70ae63d3d8d7943f2")
  (:PATH "src/local/client.lisp" :GIT-BLOB
   "f44ab49bbccb626b59571aae29deb2920ebc9867")
  (:PATH "src/local/conditional-group-build.lisp" :GIT-BLOB
   "e2ddc3a893bbf3eea01088a464efd73abfa5a6cd")
  (:PATH "src/local/conditional-group-dispatch.lisp" :GIT-BLOB
   "f820570f134d630a00902d502929eb6a385e00e2")
  (:PATH "src/local/conditional-group-read.lisp" :GIT-BLOB
   "a553ce75413332d7663b6068b3adc940976c50c7")
  (:PATH "src/local/dispatch.lisp" :GIT-BLOB
   "39d79ba99a3215d88d5508a1e31e293623bae800")
  (:PATH "src/local/group-build.lisp" :GIT-BLOB
   "428ad39cb77c5e6e5e9328a1ac9e86e27646174a")
  (:PATH "src/local/group-dispatch.lisp" :GIT-BLOB
   "302d9e8be91d13b7602e9102eb4a1022e437e0da")
  (:PATH "src/local/group-read.lisp" :GIT-BLOB
   "ba4b57f80dec489589233d4d62d6d87084600026")
  (:PATH "src/local/group-types.lisp" :GIT-BLOB
   "c16e042f44592838506d24b88bd0aa62278532c9")
  (:PATH "src/local/native.lisp" :GIT-BLOB
   "380f655e5da39eaff4daeef4c6eaf63217762a48")
  (:PATH "src/local/package.lisp" :GIT-BLOB
   "0f17791b74c83f3745e536dc696cc9a2e5895ce2")
  (:PATH "src/local/read-group-dispatch.lisp" :GIT-BLOB
   "36e54c6bc2f11c73dfc9dec62a32f3975ad5edee")
  (:PATH "src/local/read-group-wire.lisp" :GIT-BLOB
   "e959bfb13b654e27f5420bf6abcb9f48197960c3")
  (:PATH "src/local/readiness.lisp" :GIT-BLOB
   "bbc9fce59ab612aa4dd003d90a854506c7b047f1")
  (:PATH "src/local/server.lisp" :GIT-BLOB
   "4e66c50f51bf570605f4b835b9ad766942c3397b")
  (:PATH "src/local/state.lisp" :GIT-BLOB
   "a164a655cecd9a8375008529391f0cc6038abd29")
  (:PATH "src/local/version-dispatch.lisp" :GIT-BLOB
   "861ebbf4facb1fcdde20fea1d5a28ed4ed03faf4")
  (:PATH "src/local/version-wire.lisp" :GIT-BLOB
   "bf2032d91087f0eeb1f947128a005b446b8f6c4c")
  (:PATH "src/local/wire.lisp" :GIT-BLOB
   "95e4ccc5010a4b8261ec0125c281816f85c9faa5")
  (:PATH "src/local/write-group.lisp" :GIT-BLOB
   "3af25a194f451448fd87b37c4b635267386e60f4")
  (:PATH "src/local/write-queue.lisp" :GIT-BLOB
   "739d7a6ba109c153afe9534a98dbe04f21efb844")
  (:PATH "src/mvcc/package.lisp" :GIT-BLOB
   "d45fbf57051e43d0d998f3de9b4177665d24c9d9")
  (:PATH "src/mvcc/snapshots-core.lisp" :GIT-BLOB
   "fdeac572e64c3591208a87872b8aa9d520c3bde7")
  (:PATH "src/mvcc/snapshots-csn.lisp" :GIT-BLOB
   "74ebd63accc8216dfe5a1794c0e430bb9bccd29e")
  (:PATH "src/mvcc/snapshots-lifecycle.lisp" :GIT-BLOB
   "a05a5732511ffca3591110f617e3a19be819b47b")
  (:PATH "src/mvcc/snapshots-read.lisp" :GIT-BLOB
   "158b5a6d1eb171d07bd4f67addc2f4be5495d54b")
  (:PATH "src/mvcc/snapshots-register.lisp" :GIT-BLOB
   "06a0af0e813b9c22ce98d523d42c031c79ca3734")
  (:PATH "src/mvcc/snapshots-types.lisp" :GIT-BLOB
   "95f5a8c59ff1fef05bcd3fd220d6a14d9c332d61")
  (:PATH "src/mvcc/types.lisp" :GIT-BLOB
   "4cf0edbc70bc9e02ff3b0442cbce4ca44630d3e6")
  (:PATH "src/package.lisp" :GIT-BLOB
   "576f0467295d8cac40fe8238d4d9df123ee81b23")
  (:PATH "src/read/core.lisp" :GIT-BLOB
   "e5130ba55ee942238a5a98ecc51e07725e1c9655")
  (:PATH "src/read/package.lisp" :GIT-BLOB
   "dd00cd8e7dc8340e2006cfe03b0bf141968223fd")
  (:PATH "src/read/task.lisp" :GIT-BLOB
   "2de7b390c89ab19f8be03767ecb07af8fe1e4fb1")
  (:PATH "src/read/types.lisp" :GIT-BLOB
   "172a43f86726ec68af730700c99098d66500ad66")
  (:PATH "src/recovery-active/build.lisp" :GIT-BLOB
   "0fa0e554f7e3aa6990d861dec7cbf8408db28068")
  (:PATH "src/recovery-active/closure.lisp" :GIT-BLOB
   "326b2070076e6e9a8d8ee66567d05b5c19329467")
  (:PATH "src/recovery-active/csn.lisp" :GIT-BLOB
   "42b1279ccd9910816bd8d0887b60bcfe9b6e252a")
  (:PATH "src/recovery-active/frames.lisp" :GIT-BLOB
   "3d01c07ff8118b92e5de7b31ca72b19db5ec72ff")
  (:PATH "src/recovery-active/package.lisp" :GIT-BLOB
   "474cd54f2a31f4ded95fd723b4170bee8addece4")
  (:PATH "src/recovery-active/publication.lisp" :GIT-BLOB
   "38542ec938fd3409d73d7531e90fc6474ef42fad")
  (:PATH "src/recovery-active/query.lisp" :GIT-BLOB
   "e2a5aea0f5a97670cc20a583ed312c89df1c7187")
  (:PATH "src/recovery-active/read.lisp" :GIT-BLOB
   "f801950d67755cd15804ef43f1461d435eda54a6")
  (:PATH "src/recovery-active/resolve.lisp" :GIT-BLOB
   "66f4ada585e085a8403d4cdbc9a3dfee31754bce")
  (:PATH "src/recovery-active/types.lisp" :GIT-BLOB
   "069ca4b815c98d82695dd7eb9337a83c5f35b98b")
  (:PATH "src/recovery-archive-csn/build.lisp" :GIT-BLOB
   "ea5a6abf3d6b0817cfa99db490e9e5df57cb200a")
  (:PATH "src/recovery-archive-csn/package.lisp" :GIT-BLOB
   "bacf4fc95e38a8d0416110c6b87b506d561a7e59")
  (:PATH "src/recovery-archive-csn/preflight.lisp" :GIT-BLOB
   "a7a20c65ba54da28dd88c941736fb374065d580f")
  (:PATH "src/recovery-archive-csn/query.lisp" :GIT-BLOB
   "28f8acd47abad20efb95ec0ea8bd765bfa10baff")
  (:PATH "src/recovery-archive-csn/series.lisp" :GIT-BLOB
   "f8eb49763d533cd34cdf05593d2416a63c5f1d0c")
  (:PATH "src/recovery-archive-csn/types.lisp" :GIT-BLOB
   "d30bb8cb36fd1c64a720073fd3f4b4921e507cad")
  (:PATH "src/recovery-archive/active.lisp" :GIT-BLOB
   "5eb16b6f93d24ac3c6f06af8ed3c005328b457a5")
  (:PATH "src/recovery-archive/build.lisp" :GIT-BLOB
   "81a581f63c21154b8a55f2f429ec28ee32a659b3")
  (:PATH "src/recovery-archive/package.lisp" :GIT-BLOB
   "82c707853b1a5b2b6d657e120c7e0ecb82404134")
  (:PATH "src/recovery-archive/query.lisp" :GIT-BLOB
   "8ae65f7a41d2b4a395d6e6a1829d334dfbe88878")
  (:PATH "src/recovery-archive/read.lisp" :GIT-BLOB
   "07ee8571028ca0ec5f754ec9f8478077650ee48d")
  (:PATH "src/recovery-archive/types.lisp" :GIT-BLOB
   "80d29b79c185d0007d0b0e4baa913ed18ec0524c")
  (:PATH "src/recovery-bootstrap/build.lisp" :GIT-BLOB
   "60d549030aa9d16b823fcb98398f14cd3786f73b")
  (:PATH "src/recovery-bootstrap/package.lisp" :GIT-BLOB
   "29ce39efa53a72cd766810b81a08c9a2f86afc91")
  (:PATH "src/recovery-bootstrap/preflight.lisp" :GIT-BLOB
   "601685cad9fd3829ea36672e86b94952f3fe4493")
  (:PATH "src/recovery-bootstrap/shape.lisp" :GIT-BLOB
   "56e6694b910c05854961e920deeb0da390d4a428")
  (:PATH "src/recovery-bootstrap/stabilize-preflight.lisp" :GIT-BLOB
   "5c05f4f7b52c72cce8f3a086a64c4d190e7de36e")
  (:PATH "src/recovery-bootstrap/stabilize-shape.lisp" :GIT-BLOB
   "649080985356be430b25c841c7d345e9d24cb543")
  (:PATH "src/recovery-bootstrap/stabilize.lisp" :GIT-BLOB
   "2ef2dda4858003135215d7d36f816f4929d214a3")
  (:PATH "src/recovery-checkpoint/build.lisp" :GIT-BLOB
   "c274d47f45d845a6e16049e2a573e8d9d76fbc3a")
  (:PATH "src/recovery-checkpoint/order.lisp" :GIT-BLOB
   "a265f08779f2abc94be058454cf75643c33272ca")
  (:PATH "src/recovery-checkpoint/package.lisp" :GIT-BLOB
   "7b191ecff3dbac6b5f690ad221c68b4762a9f0aa")
  (:PATH "src/recovery-checkpoint/preflight.lisp" :GIT-BLOB
   "61e245a5495de984a94fef573f88d11245e86b71")
  (:PATH "src/recovery-checkpoint/sections.lisp" :GIT-BLOB
   "eb05b6c58fe3131fbd597dff5655e4a476b55092")
  (:PATH "src/recovery-closed/build.lisp" :GIT-BLOB
   "bab6c80812e70ffb31a59f29ffaaa6f90678cea1")
  (:PATH "src/recovery-closed/csn-serie.lisp" :GIT-BLOB
   "078d9bbd66289b667c4273053f706a3a2af120e6")
  (:PATH "src/recovery-closed/csn.lisp" :GIT-BLOB
   "41144f854694ff9338e0067d2f59b3312119c5b2")
  (:PATH "src/recovery-closed/package.lisp" :GIT-BLOB
   "49ac245e2430e719b1d417b91b0ffcd53555e47d")
  (:PATH "src/recovery-closed/publication.lisp" :GIT-BLOB
   "fc512bece4fead39a0c75c943cc5d10bbfb810b4")
  (:PATH "src/recovery-closed/read.lisp" :GIT-BLOB
   "08bcf5a490ceba1ae7a94258f1c0bd9ca148cdaa")
  (:PATH "src/recovery-closed/resolve.lisp" :GIT-BLOB
   "2f107b18e7060dc54e902dbe0363d836285ace5f")
  (:PATH "src/recovery-closed/types.lisp" :GIT-BLOB
   "a403121cd1459db7eb753981a402152615541caa")
  (:PATH "src/recovery-closed/verify.lisp" :GIT-BLOB
   "bac75f2ed61947826ca194cf57f8d2feb003f7fc")
  (:PATH "src/recovery-replay/package.lisp" :GIT-BLOB
   "8639d959e29e9f36270a94831eace49f6535a863")
  (:PATH "src/recovery-replay/read.lisp" :GIT-BLOB
   "05eade0aed1e83cf2df5f5e2bab563d31c95081a")
  (:PATH "src/recovery-replay/resolve.lisp" :GIT-BLOB
   "85eb7133fe1463016604e6a6c9ca26dea7bb5633")
  (:PATH "src/recovery-replay/visit.lisp" :GIT-BLOB
   "0c94187caae5986c8481cf1a8e8bc060db2a7b53")
  (:PATH "src/recovery-selection/frame.lisp" :GIT-BLOB
   "101813cb3536365ac914f10e926f424dec18647e")
  (:PATH "src/recovery-selection/index-preflight.lisp" :GIT-BLOB
   "c3d336e63fbb2b5d972a314a86edd123f050aa7b")
  (:PATH "src/recovery-selection/index.lisp" :GIT-BLOB
   "b4b3488404b09fd1df4f351910043b333c1f355e")
  (:PATH "src/recovery-selection/key.lisp" :GIT-BLOB
   "f751a1ed921903353ab48e52e9fa24d374202ed1")
  (:PATH "src/recovery-selection/package.lisp" :GIT-BLOB
   "9dd583b4bf868183f7555b1e4f7c29f2a13c244c")
  (:PATH "src/recovery-selection/read.lisp" :GIT-BLOB
   "04903a7aa14fe3c332bad4255ff62f87d2e69b77")
  (:PATH "src/recovery-selection/select.lisp" :GIT-BLOB
   "dc4345cbad0fd4223eb50ed2d0ed6bcccb8ec709")
  (:PATH "src/recovery-selection/types.lisp" :GIT-BLOB
   "85930de29d2bc071ea7bbb8677d9aa0ac4e1310e")
  (:PATH "src/recovery-series/build.lisp" :GIT-BLOB
   "41324774ac594767e6931c141858270d2a2125ad")
  (:PATH "src/recovery-series/entry.lisp" :GIT-BLOB
   "a37b7c87eff82670540beb78aa78cb40fab88455")
  (:PATH "src/recovery-series/package.lisp" :GIT-BLOB
   "51f3d64796df1a2180cb977adb8a094e7c7fd94b")
  (:PATH "src/recovery-series/preflight.lisp" :GIT-BLOB
   "0daff10989f88386221d11ff4123384a67092075")
  (:PATH "src/recovery-series/read.lisp" :GIT-BLOB
   "d7ec011280d40883408a816425210f60f4ae4561")
  (:PATH "src/recovery-series/stabilize-preflight.lisp" :GIT-BLOB
   "4e6d9e8047e76ce2fa5324ebca9456d29bd69c2f")
  (:PATH "src/recovery-series/stabilize-set-preflight.lisp" :GIT-BLOB
   "81cc2dcf0e684ccc710e51b221b84c10f057db8f")
  (:PATH "src/recovery-series/stabilize-set.lisp" :GIT-BLOB
   "7fe9646c0721b02d48f8ee99cf3f2e5fa020d4c5")
  (:PATH "src/recovery-series/stabilize.lisp" :GIT-BLOB
   "1fe16c3863409635d882ebce5a9f5abc03ad5ecc")
  (:PATH "src/recovery-series/types.lisp" :GIT-BLOB
   "eb8d4a347b96aca4e5277435fe1361ed794f39b6")
  (:PATH "src/recovery/decisions-build.lisp" :GIT-BLOB
   "d7ac44761869f57e333497212510416fd1e794c9")
  (:PATH "src/recovery/decisions-package.lisp" :GIT-BLOB
   "58a3e620a8def39d2b24cd210d9283184c247ed2")
  (:PATH "src/recovery/decisions-query.lisp" :GIT-BLOB
   "b30dd16f31dcb00316d6983c7cfc5cb2948ce0ee")
  (:PATH "src/recovery/decisions-radix.lisp" :GIT-BLOB
   "54b5092b76b1c609ee195c44bd9206c1800542c4")
  (:PATH "src/recovery/decisions-sort.lisp" :GIT-BLOB
   "c7bd0b41e7a84ef73829aeaef3a113f12e7a6031")
  (:PATH "src/recovery/decisions-types.lisp" :GIT-BLOB
   "c2fab3b7b2cec568adfe88f0037fc216f83765c9")
  (:PATH "src/recovery/inventory-build.lisp" :GIT-BLOB
   "2059363677925a732eb1c70fc1ed1be94d715ea9")
  (:PATH "src/recovery/inventory-directory-id.lisp" :GIT-BLOB
   "7b7f3c4c1bbcd252583249b650f82ab968409e24")
  (:PATH "src/recovery/inventory-directory.lisp" :GIT-BLOB
   "4f253cf7dbe6dad5814749ff53d40759ab882d73")
  (:PATH "src/recovery/inventory-id.lisp" :GIT-BLOB
   "c6dabcd733010fe6966aa1d27656b0760744e55d")
  (:PATH "src/recovery/inventory-query.lisp" :GIT-BLOB
   "47bc32082a709eb46a5fdb5a5b3011d2c4377f80")
  (:PATH "src/recovery/inventory-sources-build.lisp" :GIT-BLOB
   "149e9ca5fc1bf3ed1f473beb075d5c35b6099886")
  (:PATH "src/recovery/inventory-sources-query.lisp" :GIT-BLOB
   "9742c023b3347d38f678c7a1752a9cc37b665996")
  (:PATH "src/recovery/inventory-sources-types.lisp" :GIT-BLOB
   "b52908d02b1cda451190be58333ef9c9508fddf9")
  (:PATH "src/recovery/inventory-sources.lisp" :GIT-BLOB
   "3619190b49dcbaa32ef4dd2111995df5beace5c5")
  (:PATH "src/recovery/inventory-types.lisp" :GIT-BLOB
   "1cbb826a8999579a98e51b9c0ecd1cd6a6ff9661")
  (:PATH "src/recovery/manifest-build.lisp" :GIT-BLOB
   "1a98289ea132f2b68309efb3a7552f99a514796e")
  (:PATH "src/recovery/manifest-decode.lisp" :GIT-BLOB
   "801976598bd390814c4ddfaf00377ee38369405c")
  (:PATH "src/recovery/manifest-fold.lisp" :GIT-BLOB
   "2ddd4fb6d4c1717a25c369c6a7252f9f80769221")
  (:PATH "src/recovery/manifest-package.lisp" :GIT-BLOB
   "9754b563a1d0fbfcda0f306e94b1b6d0257dfb0e")
  (:PATH "src/recovery/manifest-query.lisp" :GIT-BLOB
   "43af5d7e8cf2c8465492531133ea9647f614e613")
  (:PATH "src/recovery/manifest-transition.lisp" :GIT-BLOB
   "c871c345eb51367427adbb9bda778a6857a97510")
  (:PATH "src/recovery/manifest-types.lisp" :GIT-BLOB
   "40c49f4692e11b4c7f9f55b93bae69210adbdcbb")
  (:PATH "src/recovery/package.lisp" :GIT-BLOB
   "b97b5c9bca6955e5dc45d9d4257089ab7132f3fb")
  (:PATH "src/recovery/scan.lisp" :GIT-BLOB
   "eb0e60664ad7abeefde7a4fc81fa7b3fa38ac57f")
  (:PATH "src/runtime/active.lisp" :GIT-BLOB
   "d7889b0103e18eb47878a88c760cae38de48b3fa")
  (:PATH "src/runtime/build.lisp" :GIT-BLOB
   "4fbf71ebd764f7d90977d027372437e113fdeed3")
  (:PATH "src/runtime/closed-preflight.lisp" :GIT-BLOB
   "5e10ae83ae0e4cd3adbbdae389629a0a854182a2")
  (:PATH "src/runtime/closed-transfer.lisp" :GIT-BLOB
   "3db2e73c10bf24d3931cbf993f240aac45e88e0f")
  (:PATH "src/runtime/closed.lisp" :GIT-BLOB
   "b06f0ae33a9c084c5101cfa5170e358bd4f7fe55")
  (:PATH "src/runtime/package.lisp" :GIT-BLOB
   "5eb61dac53e09bdaf493680967ab65938b6b8f63")
  (:PATH "src/runtime/preflight.lisp" :GIT-BLOB
   "7babef89ceacca9a7c8fac7068b54f653a4a3c58")
  (:PATH "src/runtime/query.lisp" :GIT-BLOB
   "34a7a4ebe5d0baeb93acca991f02a38b0cad2204")
  (:PATH "src/runtime/types.lisp" :GIT-BLOB
   "19fe3cc6004382550ea7939c5bf100d1fcc92607")
  (:PATH "src/scheduler/build.lisp" :GIT-BLOB
   "a55b8e7089ba3880ffa69cee4adb13dc0543069c")
  (:PATH "src/scheduler/lifecycle-build.lisp" :GIT-BLOB
   "7dfa330d606ef9c4dbceeb83845a32e75eb62fe6")
  (:PATH "src/scheduler/lifecycle-read.lisp" :GIT-BLOB
   "3b7ece551dae47957d9350c49285617d60b6ee3f")
  (:PATH "src/scheduler/lifecycle-types.lisp" :GIT-BLOB
   "5a03c1176d6bc019bcd230b0fd665cc48d555395")
  (:PATH "src/scheduler/lifecycle-update.lisp" :GIT-BLOB
   "47d323541ba45f5fb507ebcdb2eae9dd701533a2")
  (:PATH "src/scheduler/lifecycle-worker.lisp" :GIT-BLOB
   "8ae274af549a3464fd5f03d64e3c10ac73145630")
  (:PATH "src/scheduler/package.lisp" :GIT-BLOB
   "cadff5f2e29e7c5b625b95f9387faf29aad02178")
  (:PATH "src/scheduler/policy.lisp" :GIT-BLOB
   "37ed8717cf05ca8f03c06204641f47af18858a7b")
  (:PATH "src/scheduler/pool-claim.lisp" :GIT-BLOB
   "9ba00e2b77cbca2189e947e00b435fb81145668e")
  (:PATH "src/scheduler/read.lisp" :GIT-BLOB
   "ea882e41d231cc0dbafc9eac66bdd1f935433f00")
  (:PATH "src/scheduler/types.lisp" :GIT-BLOB
   "6fcd3d494dc339f8061a64fcce4133b9c86708b3")
  (:PATH "src/scheduler/update.lisp" :GIT-BLOB
   "eb0ad7a3abf119d733ae571d98695980ca4fe694")
  (:PATH "src/series/events.lisp" :GIT-BLOB
   "b1aeaa0032d7418cd3c9a7dcbc35add751fb17ce")
  (:PATH "src/series/io-events.lisp" :GIT-BLOB
   "5b189fb0ff0e54abaf72adcb05e5da58ebecb741")
  (:PATH "src/series/ownership.lisp" :GIT-BLOB
   "f81c0946f3e173fa6bf87c24e7c51999afc46363")
  (:PATH "src/series/package.lisp" :GIT-BLOB
   "6fd26253982dba01e9eef2702c5f4ede6ba70659")
  (:PATH "src/series/publication.lisp" :GIT-BLOB
   "95cf61b5df1cdd57975f64a05f890528568046b1")
  (:PATH "src/series/query.lisp" :GIT-BLOB
   "79cc08666f83630adba9cab148bb71c2f6d46253")
  (:PATH "src/series/retirement.lisp" :GIT-BLOB
   "f21cae5c4f5cfd94d5d4b6a437ac2ede15750b5d")
  (:PATH "src/series/routing-build.lisp" :GIT-BLOB
   "4d09a75d977a0eed0819e7c7d61737d245514b00")
  (:PATH "src/series/routing-select.lisp" :GIT-BLOB
   "dee5f67f723edb5ba47b78e68baeee49eb56015c")
  (:PATH "src/series/routing-types.lisp" :GIT-BLOB
   "18a29843546af6fc28fa36742a175fc3e6f19e1c")
  (:PATH "src/series/types.lisp" :GIT-BLOB
   "3b6335d3c665f5fe66771242c4d43db3de10b333")
  (:PATH "src/series/worker-boundary.lisp" :GIT-BLOB
   "16700994fa5959633b21d4c7eb21483cd489f0c4")
  (:PATH "src/series/worker-package.lisp" :GIT-BLOB
   "d0316128bae48e4251a519d7daab25dbaf52f031")
  (:PATH "src/series/worker-run.lisp" :GIT-BLOB
   "2a15783bbd1f5fdd1adb0ae4a045449970f46650")
  (:PATH "src/series/worker-types.lisp" :GIT-BLOB
   "d7c667389bf8ad8ec4a04ce2b1bc9ec90e64a54d")
  (:PATH "src/storage/compaction-scan.lisp" :GIT-BLOB
   "fd552f6657ade1482eeada765c0880b6afe8a73f")
  (:PATH "src/storage/control-payload.lisp" :GIT-BLOB
   "6643873870526ee603a5c5b554a91650e5be0e6f")
  (:PATH "src/storage/formats.lisp" :GIT-BLOB
   "028c7b1111e43c0749479067451894b38479a7ec")
  (:PATH "src/storage/log-header.lisp" :GIT-BLOB
   "10af1f2b835f387f7c5c69011b712c37bce142f9")
  (:PATH "src/storage/package.lisp" :GIT-BLOB
   "c15553a65171e5dfb2dbadb62c92ed4dc48aee3a")
  (:PATH "src/storage/payload-record.lisp" :GIT-BLOB
   "0548df3e81bff3332c67897fc70d7aece4c822ea")
  (:PATH "src/storage/payload-write.lisp" :GIT-BLOB
   "0e6f1849a77fd2de1109e3576f174f13e2eca665")
  (:PATH "src/storage/segment-header.lisp" :GIT-BLOB
   "05cb8e127c9384da1c40d21c7566f5d57b705ecf")
  (:PATH "src/verify/order.lisp" :GIT-BLOB
   "d563554aeaddb02585f4e4ad03b739dea5387669")
  (:PATH "src/verify/package.lisp" :GIT-BLOB
   "917b51d93c95c088f1b6c9f60b4b128633a8c9ce")
  (:PATH "src/verify/read.lisp" :GIT-BLOB
   "913463f4e6529cda367092c7aefe85e8471416c7")
  (:PATH "src/verify/report.lisp" :GIT-BLOB
   "5771c02a6384a61711735571ee64e219bdbc145c")
  (:PATH "src/verify/resources.lisp" :GIT-BLOB
   "e5e270db76476a6ceb9a4775852a098cb3a9c057")
  (:PATH "src/verify/types.lisp" :GIT-BLOB
   "ed2a9617dce5a03c691bc2826a5996f8a3161e2a")
  (:PATH "src/wal/append.lisp" :GIT-BLOB
   "769b86afb5de6d2f706a015e049ea04b63031f79")
  (:PATH "src/wal/builder.lisp" :GIT-BLOB
   "65b17519d6d6e5d9e104bc37b2c4eb4d3b93f132")
  (:PATH "src/wal/csn.lisp" :GIT-BLOB
   "51110c6784e99fc94ddf5a2344e0d85262c297d5")
  (:PATH "src/wal/executor.lisp" :GIT-BLOB
   "ae53e978652629ff407be47d3abe04176626dbb4")
  (:PATH "src/wal/frame.lisp" :GIT-BLOB
   "2f2f1af60a399d9263f15ce4565502da1c70f173")
  (:PATH "src/wal/group.lisp" :GIT-BLOB
   "17858cffba82609484a6f4a32d082d14ceec1c4b")
  (:PATH "src/wal/package.lisp" :GIT-BLOB
   "e0ea179069a7b297c7c26f6c294c7d4aea3db671")
  (:PATH "src/wal/types.lisp" :GIT-BLOB
   "d9f682a05cf5adb22850728a839228f02744c5f2"))
 :PRIOR-CI-ARTIFACT
 (:RUN-ID 41311168018 :JOB-ID 124861769262 :ARTIFACT-ID 13085950153 :SHA256
  "2ae98c372f39dc90db41105ea9bb5f5fa8a805e422b30e5d48ce52052b6acc74")
 :LIMITS (:SOURCE-BINDING :NOT-RUNTIME-OR-PERFORMANCE-QUALIFICATION))
