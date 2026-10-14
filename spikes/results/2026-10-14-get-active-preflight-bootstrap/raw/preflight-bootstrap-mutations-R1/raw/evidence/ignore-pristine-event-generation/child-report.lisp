(:FINISHED-AT-UNIVERSAL-TIME 4000985503 :CONFIG-SHA256-AFTER
 "07eb718b584e29414257819f508a423c6863d726ea03936ff1dc4f20e108a630"
 :CONDITION-TYPE "SIMPLE-ERROR" :DIAGNOSTIC "Asserzione fallita: (HANDLER-CASE
                     (PROGN (FUNCALL ARCDOCDB.SERIES.TESTS::THUNK) NIL)
                     (ARCDOCDB.CONDITIONS:ARCDOCDB-ERROR (CONDITION)
                      (ARCDOCDB.FOUNDATION.TESTS::IS (TYPEP CONDITION TYPE))
                      (WHEN ARCDOCDB.SERIES.TESTS::REASON
                        (ARCDOCDB.FOUNDATION.TESTS::IS
                         (EQ ARCDOCDB.SERIES.TESTS::REASON
                             (ARCDOCDB.CONDITIONS:ERROR-REASON CONDITION))))
                      T))"
 :SCHEMA-VERSION 1 :KIND :GET-ACTIVE-INIT-MUTATION-CHILD :STATUS :FAILED :PHASE
 :TESTS :COMPILED T :SUITE-COMPILED T :COMPILED-FILES
 ((:FILE "tests/wal/support.lisp" :SOURCE-SHA256
   "90a47539e5e2898c0a08059207f30bb5551e7ca8fc166f8f6ce7b95afa757295" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/wal/support.fasl"
   :FASL-SHA256
   "dfb46a694ae13138f684ceff1860bc0c0a457c7f2620587d899e071815d82016")
  (:FILE "tests/wal/native.lisp" :SOURCE-SHA256
   "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/wal/native.fasl"
   :FASL-SHA256
   "3c4bb22ecc3dc9a0b28dabdede9ee8e8b669e30c0f8578eb297c567b4bb59dd1")
  (:FILE "tests/wal/group.lisp" :SOURCE-SHA256
   "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/wal/group.fasl"
   :FASL-SHA256
   "76fce72d8266993e1a43ff14e6c1aef35ca352bd7973cfa1a79a67d207249744")
  (:FILE "tests/wal/fault.lisp" :SOURCE-SHA256
   "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/wal/fault.fasl"
   :FASL-SHA256
   "6c0609f2e8eb145ec253225bc7d9d51c6b5edf03a1b921eca77602e09ced56af")
  (:FILE "tests/wal/csn.lisp" :SOURCE-SHA256
   "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/wal/csn.fasl"
   :FASL-SHA256
   "5f8b8ee8543ed4afce28191a8dd57b4a14ee003a95c50ea563d22f9ea32a7a42")
  (:FILE "tests/wal/csn-threads.lisp" :SOURCE-SHA256
   "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/wal/csn-threads.fasl"
   :FASL-SHA256
   "3cc5d8c6e36597697e50b4e01ce956a804a7368b35ea3b9bfa92fdbee21e8877")
  (:FILE "tests/wal/builder.lisp" :SOURCE-SHA256
   "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/wal/builder.fasl"
   :FASL-SHA256
   "d5e08111f141f66bae07793a237a77710198853920229be5b2da14bd789c7bd3")
  (:FILE "tests/storage/support.lisp" :SOURCE-SHA256
   "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/storage/support.fasl"
   :FASL-SHA256
   "ca9c5a75128a845c01f37086d9df00165e7af7690c7d3ac949df14bfa1d25a65")
  (:FILE "tests/storage/segment-header.lisp" :SOURCE-SHA256
   "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/storage/segment-header.fasl"
   :FASL-SHA256
   "037e6c54a651ee98a08f05686f4c9885aaa4e4218dcfcf17b59b59cbb96ed8f5")
  (:FILE "tests/storage/log-header.lisp" :SOURCE-SHA256
   "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/storage/log-header.fasl"
   :FASL-SHA256
   "2a7b56eaa2e9ac04c10facd4de0018df7e5c41773c2ac61755c14d1b8e0419e7")
  (:FILE "tests/storage/control-payload.lisp" :SOURCE-SHA256
   "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/storage/control-payload.fasl"
   :FASL-SHA256
   "531826dea6f843710bf84e6ab2fcdee700a1f92da6d68e28255c62a2da9d6406")
  (:FILE "tests/storage/compaction-scan.lisp" :SOURCE-SHA256
   "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/storage/compaction-scan.fasl"
   :FASL-SHA256
   "0f64e42e468879f1ac7ef6861b6bcb4e634b93aba13d55ef8c0f0a468fd1b1a4")
  (:FILE "tests/smoke.lisp" :SOURCE-SHA256
   "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/smoke.fasl"
   :FASL-SHA256
   "e71838e2523d021a76470aa81db6b89d832074f0275a60a517a6651dea739edd")
  (:FILE "tests/series/worker-routing.lisp" :SOURCE-SHA256
   "f495d33f73e3249d1055ea61d65034033367de85edec3db2cac3a63ff449e3f9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/series/worker-routing.fasl"
   :FASL-SHA256
   "ef793f14b04fe26323dc2bbabcdacf1e8ac2af68021e15a947196e5e8b6df3cb")
  (:FILE "tests/series/worker-bridge.lisp" :SOURCE-SHA256
   "c1ee49702e63978a83cb86c4e5bf437a5a40e48fa02b65d3eaf3dca0d2e39176" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/series/worker-bridge.fasl"
   :FASL-SHA256
   "4796b771e5b0a1be67eaff7ccb12b1fc21ea3a55eb49dfb6051fd33bc5c44bb3")
  (:FILE "tests/series/threads.lisp" :SOURCE-SHA256
   "b8fe9d7e1c0ca4e18909a0a6f7ac03c8df68dd186fa21e62600be685d6e4c7ae" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/series/threads.fasl"
   :FASL-SHA256
   "ab51b2e26247601c0cdd92361092fe833353629ce2ecbfe044848e44c26a7dcd")
  (:FILE "tests/series/support.lisp" :SOURCE-SHA256
   "810dd8a69927c75e3399af47b8fff18e4ab88eb41049c50bafee5c041be263b3" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/series/support.fasl"
   :FASL-SHA256
   "19f6e9071ce459ee5527dff5a4292776bd48cc25f532c5de1da0d08bca7e67ec")
  (:FILE "tests/series/controller.lisp" :SOURCE-SHA256
   "8bc98ec62e58803cab5613210e1200e0ce296af9aff63b5dff61579c3931670a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/series/controller.fasl"
   :FASL-SHA256
   "30397ba6a1be586e41fad75d6bf040535866ea8daa4f74bcf2010fdf834a1d8d")
  (:FILE "tests/series/boundaries.lisp" :SOURCE-SHA256
   "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/series/boundaries.fasl"
   :FASL-SHA256
   "7cb53d32c9a034318cc03dc547a1925a11219ae4469e6ab39491145a79be2a5f")
  (:FILE "tests/scheduler/support.lisp" :SOURCE-SHA256
   "300234f9ac7931f8c8b9bf305498a2742a3b8868dd9158dbab8c7fdceed5a1e4" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/scheduler/support.fasl"
   :FASL-SHA256
   "3524d96ab82dd61aadc454a6667371c089c6aabc757d8d356bff73f1ec81f34c")
  (:FILE "tests/scheduler/pool-claim.lisp" :SOURCE-SHA256
   "f968d57b6ff4dfc3cc31f1b1979afa896d95435093406b36320800783629901f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/scheduler/pool-claim.fasl"
   :FASL-SHA256
   "271e08f7c80d1ce0a1dcb09761dde47f1fc6e1d99142447fee84a25c8c571b90")
  (:FILE "tests/scheduler/lifecycle.lisp" :SOURCE-SHA256
   "eff59c0cf6d9c6c1ddec57a4efa26a8fcaeedc850b77764b818bc1c22eb73e38" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/scheduler/lifecycle.fasl"
   :FASL-SHA256
   "dfa09511e13c634292c04c315dbd5744550a4520139df4c1d3a5295b7220dc13")
  (:FILE "tests/scheduler/dispatch.lisp" :SOURCE-SHA256
   "600eb0b5fdf9a52d020e2f4c638f0f3dba43d9d9711be73eaffff208578821eb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/scheduler/dispatch.fasl"
   :FASL-SHA256
   "ae273de7bc782fed16f4eb2fda26d471bb868274f0c1c80dfc9294c61bfbe0cf")
  (:FILE "tests/scheduler/controller.lisp" :SOURCE-SHA256
   "e986e3facc9d1b9b4eab0d135259a61d7e0f188a7f268cb2e5ee5f9c700c40be" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/scheduler/controller.fasl"
   :FASL-SHA256
   "ea1e91fe761ba7d87b71144241027a95872190e165dd9d9509da9fac3989b12a")
  (:FILE "tests/recovery/support.lisp" :SOURCE-SHA256
   "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/recovery/support.fasl"
   :FASL-SHA256
   "d88c34a8181e102613491c6b380ba1684cd8084d89e7fa89ee60850039fdc895")
  (:FILE "tests/recovery/scan.lisp" :SOURCE-SHA256
   "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/recovery/scan.fasl"
   :FASL-SHA256
   "3d7ef7ecf004d66f964bcdf73f2156bc50ac4e863809dc3955559311eee8c42f")
  (:FILE "tests/recovery/manifest.lisp" :SOURCE-SHA256
   "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/recovery/manifest.fasl"
   :FASL-SHA256
   "f01bc41805aca702e81c57569248876a9f88f522078fe83c486d0634cf023458")
  (:FILE "tests/recovery/manifest-support.lisp" :SOURCE-SHA256
   "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/recovery/manifest-support.fasl"
   :FASL-SHA256
   "e6f8d616cd69864c82915ac88abf32ef07e272e7a8504362be05d9d7bef94500")
  (:FILE "tests/recovery/manifest-audit.lisp" :SOURCE-SHA256
   "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/recovery/manifest-audit.fasl"
   :FASL-SHA256
   "66b1c2460f3158846810e21f965422be4980392d4cd1e6ff8a02ed3577b03f4b")
  (:FILE "tests/recovery/inventory.lisp" :SOURCE-SHA256
   "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/recovery/inventory.fasl"
   :FASL-SHA256
   "e8a9a47ffe963190cd0797f8bd1aae6372eb96c6c3aff3135c00b44b19413013")
  (:FILE "tests/recovery/inventory-support.lisp" :SOURCE-SHA256
   "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/recovery/inventory-support.fasl"
   :FASL-SHA256
   "0ba32cdbcab560aff85744dca1324bf8361ed84f009b8a02f55a2c567205bb0f")
  (:FILE "tests/recovery/decisions.lisp" :SOURCE-SHA256
   "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/recovery/decisions.fasl"
   :FASL-SHA256
   "6bd4467e78805b2e00c18d61495b5ddcb5280f909713332b9abea286dec5f33f")
  (:FILE "tests/recovery/decisions-support.lisp" :SOURCE-SHA256
   "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/recovery/decisions-support.fasl"
   :FASL-SHA256
   "3434b0ee616178c8fe18bcf9d3653d412b9833f964af72caff99b491d10ce0a0")
  (:FILE "tests/recovery/decisions-radix.lisp" :SOURCE-SHA256
   "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/recovery/decisions-radix.fasl"
   :FASL-SHA256
   "f7b24a21fa0b04e9e694927e6c78eb34f01b544c7fec48985c74322d817dd91c")
  (:FILE "tests/recovery/decisions-audit.lisp" :SOURCE-SHA256
   "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/recovery/decisions-audit.fasl"
   :FASL-SHA256
   "8151560ccde9ebb188d4cae84458104c90cb474884061a4815dc75fa406c8b99")
  (:FILE "tests/recovery/corruption.lisp" :SOURCE-SHA256
   "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/recovery/corruption.fasl"
   :FASL-SHA256
   "e43d377dd08b38b5ecb6b384ab60f148bb0face754ce3e31e6507ad686b0ebff")
  (:FILE "tests/read/threads.lisp" :SOURCE-SHA256
   "e2e223b69b08a5d76b9773c6ad4dee13ef2ddbb6f5ababa713cc5654bc7b51c5" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/read/threads.fasl"
   :FASL-SHA256
   "c00c3a3f299f5ddc33e81b357af52ff3065cee62bce27d8e3f7615084dd6d136")
  (:FILE "tests/read/support.lisp" :SOURCE-SHA256
   "8095cc39d49342f6e43f3421b4fced839da02d8d11b4d8ddcd91bd346447e754" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/read/support.fasl"
   :FASL-SHA256
   "9557ef0a33439ccd3d7d7a8fa9bc9c082c89911df0a4c54ea68c9c97cf4ddf3e")
  (:FILE "tests/read/lifecycle.lisp" :SOURCE-SHA256
   "c4c4642408816f2e0e809e21d04739b68b9391237e3e46ea0b195ed82857c3a8" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/read/lifecycle.fasl"
   :FASL-SHA256
   "e63c4bc1a84d442a6cfc9d3068170e8536f8b0b0edfe0b68172bb0d2be2ae554")
  (:FILE "tests/mvcc/support.lisp" :SOURCE-SHA256
   "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/mvcc/support.fasl"
   :FASL-SHA256
   "bd874854a2b62f48d179a702ffd002d56de0395e341e794f65744c6156bd754f")
  (:FILE "tests/mvcc/lifecycle.lisp" :SOURCE-SHA256
   "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/mvcc/lifecycle.fasl"
   :FASL-SHA256
   "8004ae8a6cb304f8ed041cb18d5a92d61e9e3de8b2d8dc8a408246e0acc0b209")
  (:FILE "tests/mvcc/capture.lisp" :SOURCE-SHA256
   "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/mvcc/capture.fasl"
   :FASL-SHA256
   "fa29f5fcf109a1e145149c93afb9f79dcc7b85f4dbf0cd600ede7bd7e4d03396")
  (:FILE "tests/io/transfer.lisp" :SOURCE-SHA256
   "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/io/transfer.fasl"
   :FASL-SHA256
   "6935e146fbc6e5574e869d92cc562f0a4bdeb147a8961a5e3b33cd89573c8cc9")
  (:FILE "tests/io/support.lisp" :SOURCE-SHA256
   "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/io/support.fasl"
   :FASL-SHA256
   "306695e44c18fd0c8909fae9a0e07f5a1f8e70bd1939d6793a4e55608eb4aa10")
  (:FILE "tests/io/rename.lisp" :SOURCE-SHA256
   "cd14164b36977d927f7e4cf4d70d2068661c47f538228957102a4347a853fa59" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/io/rename.fasl"
   :FASL-SHA256
   "a072a4b81584dac5926b3dd643d3e9241b0528a8604ac0bfc92a3a4a56fe6bc4")
  (:FILE "tests/io/rename-native.lisp" :SOURCE-SHA256
   "b1f43b09af8f4253ce22a4793f9267c7d60df69339a3fc51b9fd83b6a331bce5" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/io/rename-native.fasl"
   :FASL-SHA256
   "f40adf50424e52c577e815e1741280116b12add08d7792a5f03b5253865124ca")
  (:FILE "tests/io/native.lisp" :SOURCE-SHA256
   "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/io/native.fasl"
   :FASL-SHA256
   "b52a61199e17dbf26139700c74742eda3ff477702ddeee9d6d029bfa18d68e97")
  (:FILE "tests/index/slots.lisp" :SOURCE-SHA256
   "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/index/slots.fasl"
   :FASL-SHA256
   "dd15161afca01ea69d2b6d7f621dd62a4f747a8e8b0028cba24356caafa345cb")
  (:FILE "tests/index/slot-threads.lisp" :SOURCE-SHA256
   "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/index/slot-threads.fasl"
   :FASL-SHA256
   "b03d25e04786624b303d742963c0956373e1a39e9a667e62f6d7f813d970c4bd")
  (:FILE "tests/index/slot-support.lisp" :SOURCE-SHA256
   "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/index/slot-support.fasl"
   :FASL-SHA256
   "b46fb87e6c9a54326b9505abbcc75c09fc8b5b45de6e3c1f624a528c8299dda8")
  (:FILE "tests/index/rebuild.lisp" :SOURCE-SHA256
   "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/index/rebuild.fasl"
   :FASL-SHA256
   "b3267a392b9f51663b08c31247fc531916f2c983517911469998867303ff7685")
  (:FILE "tests/index/primary.lisp" :SOURCE-SHA256
   "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/index/primary.fasl"
   :FASL-SHA256
   "eff704a9182b1c0181f972966a7743cea3b21aa8235139a374fb9f5fa86ea457")
  (:FILE "tests/index/primary-threads.lisp" :SOURCE-SHA256
   "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/index/primary-threads.fasl"
   :FASL-SHA256
   "bb6de07fad30dbd0222b9090bc6b4738a03efa8aef48d5fe69ddc8a4afedb828")
  (:FILE "tests/index/primary-support.lisp" :SOURCE-SHA256
   "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/index/primary-support.fasl"
   :FASL-SHA256
   "c9ae7e4f38d1882f6fd04df1ca6355ca3d27985f573a3e8786496019efcccc18")
  (:FILE "tests/index/hash-digests.lisp" :SOURCE-SHA256
   "3b3b39f861883cf2017cab8e6488560a6bb3897d63784f00e820a6450d743225" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/index/hash-digests.fasl"
   :FASL-SHA256
   "f3b72a0dc842af735e357907ffade7230490dd1b88386bd66acc1995437d61c4")
  (:FILE "tests/hash/threads.lisp" :SOURCE-SHA256
   "3fc587a57d26a294aebfc6a7aeadf2f61a42a21106c1c57517f891b76b4e750a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/hash/threads.fasl"
   :FASL-SHA256
   "dff88673113034b32becbbc73f10998d4fefe3d21756a6b114892c715607df02")
  (:FILE "tests/hash/support.lisp" :SOURCE-SHA256
   "0fae9dc36976af544f83e6051b9cf9d67c9bef0b9e25f1fa2a48fdac48592acb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/hash/support.fasl"
   :FASL-SHA256
   "8b0f0c2d129ca8e9ce779b8f06b57c267813fc054179ca529acef0eeb739e2c3")
  (:FILE "tests/hash/hash64.lisp" :SOURCE-SHA256
   "70606bc68807143cfea9583871474c84efc868d13692cde28488284dee43e0f1" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/hash/hash64.fasl"
   :FASL-SHA256
   "f082da231136d744978599aa2bc665f96d8ae30605639dacb17da0f39af63bca")
  (:FILE "tests/hash/guards.lisp" :SOURCE-SHA256
   "9af5b38443a57d224990a68e93f12f7a4cda306f94c7ccd3ccb50635865d7864" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/hash/guards.fasl"
   :FASL-SHA256
   "9d9e6febd84e2672de3c3e97fe0c6a8f21300360786860cdb4211efa00152800")
  (:FILE "tests/get/support.lisp" :SOURCE-SHA256
   "21f0da34755882f7dcc3ee760528ca39d4731e1a79ea94525c62753b7f60422c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get/support.fasl"
   :FASL-SHA256
   "aa8a5268d845bd7c01b443937fe1e32fafc29197e5d2a5b693b441ab4f80f432")
  (:FILE "tests/get/segment.lisp" :SOURCE-SHA256
   "e9722f419ce0810c98c28d0e1a74da85d52346a0befff40c1119934519fc6f98" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get/segment.fasl"
   :FASL-SHA256
   "6470a0e0f866792deaa654dda0e16d3a7473af6e954f1e02bc128cb75913713b")
  (:FILE "tests/get/lifecycle.lisp" :SOURCE-SHA256
   "73bf87c2aee7b537dba31fc0ae554272f7d2be5a4c1e9e96ea2f21a17f6f71f5" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get/lifecycle.fasl"
   :FASL-SHA256
   "4024ad94fc1e72aaf18db6216070ef66e89ef72d9571242b1acd3070ddcb4ff7")
  (:FILE "tests/get-resolver/support.lisp" :SOURCE-SHA256
   "d30a5c8a61b63e339facfee9f7701eb5a3614bbfd1ebef2c46c747d136640f8b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get-resolver/support.fasl"
   :FASL-SHA256
   "aa9d1a5fd00298ad096e874ea373ca40f5aabd3a072639dbd41935629a6f363b")
  (:FILE "tests/get-resolver/sort.lisp" :SOURCE-SHA256
   "fd7f97f0fad2e970b972688481c0c132f11c85f5fdcd0f02bee6b0b3f93b97ae" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get-resolver/sort.fasl"
   :FASL-SHA256
   "7007d2ae3884b4f943f51dc9feae3a4c52a83036279d052ed9e21a65e7484729")
  (:FILE "tests/get-resolver/read.lisp" :SOURCE-SHA256
   "70e46d1b88716f44309f46b4955928ca7fa2195edd80bb67d5b97732b971e8fb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get-resolver/read.fasl"
   :FASL-SHA256
   "7e39aa3dedb4f85fbcc536bf96eb35826e980989ec74a13411779329f77daea1")
  (:FILE "tests/get-resolver/construction.lisp" :SOURCE-SHA256
   "45cbef3b35db35d60a4cec2516c24f6ef56f5edb2f19f6f07f24fe00c8737b13" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get-resolver/construction.fasl"
   :FASL-SHA256
   "37a3b2df7bf37309665bffd1d435881f3c4673ac8d7d06196810963e0f8a5f83")
  (:FILE "tests/get-performance/threads.lisp" :SOURCE-SHA256
   "05ace5eb351ab49da59611dc1a2a5abedb9d723a2fc6e75a30fc76e507573a90" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get-performance/threads.fasl"
   :FASL-SHA256
   "dd3efa8134547f754f8e22d3f4d7fa416984d98d14b8aecaa2599b25507e3f40")
  (:FILE "tests/get-performance/support.lisp" :SOURCE-SHA256
   "e586ed94dcb2aaba00282931cdd83313e4f84a86d4d1ba85e2d56e8b7433ed8d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get-performance/support.fasl"
   :FASL-SHA256
   "e3c72e070854f3b52dba6f6948e119845e84f94375483b6b9142c8ce9113c245")
  (:FILE "tests/get-performance/paths.lisp" :SOURCE-SHA256
   "3b8d2c9c93467507ea2bb471d42192eb1fa084b55c0f4263b5ef0d3acf468f55" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get-performance/paths.fasl"
   :FASL-SHA256
   "8f87724e98feb2a1fd33c5c33e60e6cd43fed74b481843a69a15b15bb52f8e29")
  (:FILE "tests/get-performance/guards.lisp" :SOURCE-SHA256
   "c41721b917ed443355ea3707efdd07e7da53a978c0515ab1e5ede5fcc47d63fc" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get-performance/guards.fasl"
   :FASL-SHA256
   "eadc9c28043cdb4cf055b81d89b314d71e9d2d2080191c5a5f5a6029006c851d")
  (:FILE "tests/get-directory/threads.lisp" :SOURCE-SHA256
   "e6a93ec22bc6f5a31b37ae99d927d1ca3a53893adb2eae21cd89d132a82d1f64" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get-directory/threads.fasl"
   :FASL-SHA256
   "f41025eeb5179e9a8f3d496125a2c92d3f9306d1c1149584e5961cd059804026")
  (:FILE "tests/get-directory/support.lisp" :SOURCE-SHA256
   "be3a216a6ec597b63186b6bf3d3e35f3327f3001b1c00535d64b10bcb5d9fe85" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get-directory/support.fasl"
   :FASL-SHA256
   "21f36dafd3714ff308f4f094c698f83eca1279f25e1ec3e53fd8129307f09c83")
  (:FILE "tests/get-directory/series-support.lisp" :SOURCE-SHA256
   "40f15fbdf42b80515cbfc57eb74bedcbd96d4a9e7e19dc25d8db59f326fe659a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get-directory/series-support.fasl"
   :FASL-SHA256
   "6a83b46755a43e0545af8a19e3c281a2c34ebc72e4bbb63765b126007e97c531")
  (:FILE "tests/get-directory/series-read.lisp" :SOURCE-SHA256
   "4b9856d69cd82c1462c87d16b9eb8e00fb642a46bb22f2f7b01865f7cc2a83a4" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get-directory/series-read.fasl"
   :FASL-SHA256
   "6e70559562364814eb0e9f9bbdd8b459c8ea71f34967a9e4d8873ea04999a924")
  (:FILE "tests/get-directory/read.lisp" :SOURCE-SHA256
   "a222541b6413bb93ff86a269273f1fa15bfad0d1e4072fc058b023fec5143280" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get-directory/read.fasl"
   :FASL-SHA256
   "7fcc3fdcb458c588f114f0fca48988750fba347b55d6892cc2d959477b248707")
  (:FILE "tests/get-directory/construction.lisp" :SOURCE-SHA256
   "4ce9aa7064793e908008b9e1055c1e2527d5071006782ea956509c28e8c712d7" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get-directory/construction.fasl"
   :FASL-SHA256
   "ec8794f323df06704d45c9d1c6605265ba7fe9db953bd95e3d4caa48900b40f3")
  (:FILE "tests/get-active/support.lisp" :SOURCE-SHA256
   "34c73b5323272a24fc01c132133d3cc74be7c00fa7ddd4ad08b8146bb42d589f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get-active/support.fasl"
   :FASL-SHA256
   "ea692f1a6d1fd694abec09dd484c5877c4f852d5de20c76e50371ce65f92df29")
  (:FILE "tests/get-active/read.lisp" :SOURCE-SHA256
   "ef1a15c742518b52bdbeecac6b838b0789b73d631f765a30fd016748769a72e6" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get-active/read.fasl"
   :FASL-SHA256
   "28ed25f24acf81598a5c8c173ae38af84efd40b80598f68b62f6270e0e357b14")
  (:FILE "tests/get-active/preflight.lisp" :SOURCE-SHA256
   "c65ef56f5f7498d4355e6a1f640969e3e31724fab9b84b5c3247e4e9d37626e3" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get-active/preflight.fasl"
   :FASL-SHA256
   "057e423c8a9ff27884c120235fef176f252c25c9fd1efcce3a0e08c6f465ba30")
  (:FILE "tests/get-active/directory.lisp" :SOURCE-SHA256
   "ea6754ab84b53a4be1722985600e280fde6f73da4ea7eb843e99d66989df6fdf" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get-active/directory.fasl"
   :FASL-SHA256
   "e25bb75ec0aabad531410bcfe5549f98978537daaf9ad6a69af2a8e05a5ab79d")
  (:FILE "tests/get-active/construction.lisp" :SOURCE-SHA256
   "31a21762f3c16950e4b6c0ce48a6ab235d2483476d03d4072d63905f7dd13deb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/get-active/construction.fasl"
   :FASL-SHA256
   "a8c23766649640ca71f83d0078792523ca108feba7979a6cf7bd205326668d27")
  (:FILE "tests/foundation/support.lisp" :SOURCE-SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/foundation/support.fasl"
   :FASL-SHA256
   "05ef620dfeb6bd51c050ea8d9d204ecc44a4a3cb0a0d1206a9b33eb1a2fa7f1f")
  (:FILE "tests/foundation/record.lisp" :SOURCE-SHA256
   "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/foundation/record.fasl"
   :FASL-SHA256
   "1dd26f88c0429b1e8165e2800b55a90abad5979fc9932e1b21647d1a7c520fcb")
  (:FILE "tests/foundation/binary.lisp" :SOURCE-SHA256
   "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/foundation/binary.fasl"
   :FASL-SHA256
   "e3adb1bc23ad68aed1754347e0a05a2bdaa95f3102487f41ea9874f82c21469d")
  (:FILE "tests/foundation/batch.lisp" :SOURCE-SHA256
   "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/foundation/batch.fasl"
   :FASL-SHA256
   "3d264c19817210aafe72b184b16fbdc11db080b0e848bc6e3a312fc5d2899d7a")
  (:FILE "tests/execution/worker.lisp" :SOURCE-SHA256
   "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/execution/worker.fasl"
   :FASL-SHA256
   "2f39b254a416f216fed0ded370e5e641cee1790cc7571926f3072c781167f844")
  (:FILE "tests/execution/threads.lisp" :SOURCE-SHA256
   "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/execution/threads.fasl"
   :FASL-SHA256
   "661dd0d31777ee26dbcd4c51b19fc1de6cadedf9fe0684d1872651f676dce88d")
  (:FILE "tests/execution/support.lisp" :SOURCE-SHA256
   "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/execution/support.fasl"
   :FASL-SHA256
   "5c0c26b152972113d4dda54eae606d37c3f2a656eb34a511da8d87d1f37dcbc6")
  (:FILE "tests/execution/ready.lisp" :SOURCE-SHA256
   "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/execution/ready.fasl"
   :FASL-SHA256
   "0cf59ef57db51743a22a535739f4a1194e7fc347b4356e2d19cff363f71e30c3")
  (:FILE "tests/execution/ready-recycle.lisp" :SOURCE-SHA256
   "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/execution/ready-recycle.fasl"
   :FASL-SHA256
   "8db587c3d2ace7e662f8af7d3bc90d3c04b7f56df51f28e3af90161e094d7a08")
  (:FILE "tests/execution/queue.lisp" :SOURCE-SHA256
   "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/execution/queue.fasl"
   :FASL-SHA256
   "ece475b9ba263bb17660ab325de87efcab4b912359a84375a74d86cd343b984e")
  (:FILE "tests/execution/handoff.lisp" :SOURCE-SHA256
   "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/execution/handoff.fasl"
   :FASL-SHA256
   "8e3dee5b12dca9c7c07622c6ad9300ad115de10b7e1f3250f15b4168afddb006")
  (:FILE "tests/epochs/threads.lisp" :SOURCE-SHA256
   "54b73e06c61e64f32a3e3af0791891dacb6590e929163dcf0fac95f2c71e66fd" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/epochs/threads.fasl"
   :FASL-SHA256
   "768d39ed76e30de2fa67fe7f99f93945509458fbdffe4483f26c111a1332a387")
  (:FILE "tests/epochs/support.lisp" :SOURCE-SHA256
   "366be7af4bf6c4ed946b3fa9e97aea6b034c83e3b757d81c54078dc76d229b6d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/epochs/support.fasl"
   :FASL-SHA256
   "c4d56f1ab64ae36b6ac4e4c6a5d4306403a2960fe0d6b2b3707dfcc1336ebf64")
  (:FILE "tests/epochs/lifecycle.lisp" :SOURCE-SHA256
   "ddc2fbdad9f97d2e4ff008c167776a50b17b742398306fbd5198dca474559cbf" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/epochs/lifecycle.fasl"
   :FASL-SHA256
   "e8a65382eeb987b63dcdcab1df35a3ac3b07311be3e13cc8c4d83af90c8c75f3")
  (:FILE "tests/csn/threads.lisp" :SOURCE-SHA256
   "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/csn/threads.fasl"
   :FASL-SHA256
   "f8089073af25ecf2a1cf35dca91a6e69f4e56e1b75244765996488feb0019b26")
  (:FILE "tests/csn/support.lisp" :SOURCE-SHA256
   "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/csn/support.fasl"
   :FASL-SHA256
   "5a3f5094d888e2f401f68c17521b38b4f769ecb3dd1fb9fc20aa5489a71890b0")
  (:FILE "tests/csn/registry.lisp" :SOURCE-SHA256
   "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/csn/registry.fasl"
   :FASL-SHA256
   "2c74c4df1517d68c8cf407bb70c11d2e590dc764aaad04e32592f7ccb76c16ff")
  (:FILE "tests/codec/utf8.lisp" :SOURCE-SHA256
   "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/utf8.fasl"
   :FASL-SHA256
   "0b1efccda41425a18d6f7ab37349b4b7457e0b88588f75b70e2d685e539b2a85")
  (:FILE "tests/codec/threads.lisp" :SOURCE-SHA256
   "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/threads.fasl"
   :FASL-SHA256
   "2911048e8974f0b678e6dab5c8942b9be0a906df91edccca2df216e518af1889")
  (:FILE "tests/codec/support.lisp" :SOURCE-SHA256
   "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/support.fasl"
   :FASL-SHA256
   "90f3f4f5d7b49a58d6c4397ec10d48af2dd4f3abc141e74e10d1b652be542a8c")
  (:FILE "tests/codec/cbor-write.lisp" :SOURCE-SHA256
   "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-write.fasl"
   :FASL-SHA256
   "a1b62c562d9b73b03a7087295aa0cadf1a7567218584809f683a0d4d111a4df8")
  (:FILE "tests/codec/cbor-write-threads.lisp" :SOURCE-SHA256
   "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-write-threads.fasl"
   :FASL-SHA256
   "988bee3b19e390b9ef27b797ad51eed6e6417d2143dc4b2f0b6939f80628022e")
  (:FILE "tests/codec/cbor-write-support.lisp" :SOURCE-SHA256
   "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-write-support.fasl"
   :FASL-SHA256
   "6541ea1f5e6bf08fe3dfca71ebe5e4066190b34249c3724d5e91d8eaef482bd5")
  (:FILE "tests/codec/cbor-write-roundtrip.lisp" :SOURCE-SHA256
   "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-write-roundtrip.fasl"
   :FASL-SHA256
   "ea480c9a83cc416b8d053fc48f95018afa42002d7db677ac639c56b9e525965f")
  (:FILE "tests/codec/cbor-threads.lisp" :SOURCE-SHA256
   "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-threads.fasl"
   :FASL-SHA256
   "1e0a42b124f39ef7823ee3f1b3f0d41951cb4bd4bcf45b305605d736d21e7df1")
  (:FILE "tests/codec/cbor-support.lisp" :SOURCE-SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-support.fasl"
   :FASL-SHA256
   "6df2444acd85601de70e5d0b0c30a47c4da6d7ffb12978d5a99c39d20e0a0546")
  (:FILE "tests/codec/cbor-structure.lisp" :SOURCE-SHA256
   "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-structure.fasl"
   :FASL-SHA256
   "e4925b14cf88329efe426103f3bb27bd1b6bff21039719848d41075b81a5713d")
  (:FILE "tests/codec/cbor-structure-threads.lisp" :SOURCE-SHA256
   "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-structure-threads.fasl"
   :FASL-SHA256
   "87cad95fe3b5803771e8c49a761d835ed3c9e7620a01a0080bf2907e6bacab14")
  (:FILE "tests/codec/cbor-structure-support.lisp" :SOURCE-SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-structure-support.fasl"
   :FASL-SHA256
   "f9ac36822c20eeedd9e577a9d64e6b51b603b5437755db743855705917003651")
  (:FILE "tests/codec/cbor-string-write.lisp" :SOURCE-SHA256
   "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-string-write.fasl"
   :FASL-SHA256
   "5d38f6c100bd0ae36bc5435fbaee0bb8f83cb8c3e503a915d9595278ed129a8b")
  (:FILE "tests/codec/cbor-string-write-threads.lisp" :SOURCE-SHA256
   "8e07b881a55e2554a429f1c8b2c69f67862ac015217d90d019167d636564d27d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-string-write-threads.fasl"
   :FASL-SHA256
   "c4b86402612eba51c5fdb6a99244f334dcdeb12022c1106ee78601269a416ecd")
  (:FILE "tests/codec/cbor-string-write-support.lisp" :SOURCE-SHA256
   "2cbdb601f442a56456bc637c94e759cc965f44b178268dce3c636c385d34fc39" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-string-write-support.fasl"
   :FASL-SHA256
   "5c463819764e4590d15f4a850f32f0135b4bcf24b4dca742e2954789e7ba0e1e")
  (:FILE "tests/codec/cbor-simple-write.lisp" :SOURCE-SHA256
   "958bdd3901cfc41032c09d6c9023b192799981884e09ce3573256ff45bc5329a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-simple-write.fasl"
   :FASL-SHA256
   "0b80ce5bc23aa85950dbe917fb84887d5155f83f33512cf1c1fb314d3a95495d")
  (:FILE "tests/codec/cbor-simple-write-threads.lisp" :SOURCE-SHA256
   "77074033e75a224fd02e890f98dffa8e97d3a1f8bedd510b00ea55d8ff8687b2" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-simple-write-threads.fasl"
   :FASL-SHA256
   "c5f16c22a0c72cc41fcbb624e62dfca877631868ab7320d096a0c8e05b76665e")
  (:FILE "tests/codec/cbor-simple-write-support.lisp" :SOURCE-SHA256
   "53ceafc72a027a2ff1f787900558ff26f2ff70bbb212f1b37926a6d520fbe86e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-simple-write-support.fasl"
   :FASL-SHA256
   "8ff5e198708ec52f5025b4925ba1baa1dad9113b689d611bfeb2f7474fde1f8f")
  (:FILE "tests/codec/cbor-minimal.lisp" :SOURCE-SHA256
   "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-minimal.fasl"
   :FASL-SHA256
   "3a48da7466d85b5f0b690c7c26706fcdbf523ad5140ade193412a304cb2c8669")
  (:FILE "tests/codec/cbor-minimal-threads.lisp" :SOURCE-SHA256
   "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-minimal-threads.fasl"
   :FASL-SHA256
   "86c9d65eb819cf351b2420ab61be5f5fca71e605e893d14cdea25f618f503958")
  (:FILE "tests/codec/cbor-minimal-support.lisp" :SOURCE-SHA256
   "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-minimal-support.fasl"
   :FASL-SHA256
   "2bc1a4f9631bda27c96096dee2b38fe4dcc6b989fced81dbb77cee342c360bee")
  (:FILE "tests/codec/cbor-minimal-scan.lisp" :SOURCE-SHA256
   "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-minimal-scan.fasl"
   :FASL-SHA256
   "0d4a87c284ace38778578caae96d543f1f4fb6086c001fd6faf572cd8de0e051")
  (:FILE "tests/codec/cbor-minimal-scan-threads.lisp" :SOURCE-SHA256
   "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-minimal-scan-threads.fasl"
   :FASL-SHA256
   "6473b55af3dc3e73bef281dff61c0e44aff3774ddc44279372a116bdac5625f9")
  (:FILE "tests/codec/cbor-minimal-scan-support.lisp" :SOURCE-SHA256
   "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-minimal-scan-support.fasl"
   :FASL-SHA256
   "45b83aadb4b87118adcff939546e185057c3162395cdf3eb340efaad04dfbb19")
  (:FILE "tests/codec/cbor-minimal-edges.lisp" :SOURCE-SHA256
   "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-minimal-edges.fasl"
   :FASL-SHA256
   "d3f591286d3857e7c39a9f676a0f64cefeb48eb656e88a840ed339399716157d")
  (:FILE "tests/codec/cbor-header.lisp" :SOURCE-SHA256
   "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-header.fasl"
   :FASL-SHA256
   "b112251b5e0b5f9b871423fe6d8d27d53b322f608aee2d8f2a6d5a52129d135d")
  (:FILE "tests/codec/cbor-float-write.lisp" :SOURCE-SHA256
   "2d163a64bff4b9d9b9de576c4a4df05f4d8853f1c3d039e790cbb827be98c8b6" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-float-write.fasl"
   :FASL-SHA256
   "2654cd74e1926197ec5239939e75c97982e859209965eca46a4cac75cd814259")
  (:FILE "tests/codec/cbor-float-write-threads.lisp" :SOURCE-SHA256
   "96a1b205c01f75e271684132ff3e48b4da5cf8a01210257b591ec4951f097043" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-float-write-threads.fasl"
   :FASL-SHA256
   "d5f577c0c1c704645b58f7bdff02af52d136663d198ed80019d09659990de859")
  (:FILE "tests/codec/cbor-float-write-support.lisp" :SOURCE-SHA256
   "158f18dcf4b2d7e5562713caa3625aeba16dd1eba21f4413345e8a10b616c748" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-float-write-support.fasl"
   :FASL-SHA256
   "6a42d8d323d22fc677610e71f6892fd37cbbe2c4b47c275b5d88dfa9fc80cac6")
  (:FILE "tests/codec/cbor-array-write.lisp" :SOURCE-SHA256
   "9ed6a20ab5ae2db33ef419986c8ee963898894ce239059eae7866d503fe48098" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-array-write.fasl"
   :FASL-SHA256
   "e869de687d4b86f4db26063b9953150bb991f58d29ce47bce3f01bdd3d21b440")
  (:FILE "tests/codec/cbor-array-write-threads.lisp" :SOURCE-SHA256
   "6be0614da2bafdafe2d853fa7845fb913dbf0cd2673771c2c4b0cca277986e35" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-array-write-threads.fasl"
   :FASL-SHA256
   "bab845ae5c70fe146d96597d3d64fe8076fc0c00a50f698fbc93051a1450d430")
  (:FILE "tests/codec/cbor-array-write-support.lisp" :SOURCE-SHA256
   "42a59239bec468dea130b87733a077874a5d9e83ff0f491b20312315bc27ee95" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/tests/codec/cbor-array-write-support.fasl"
   :FASL-SHA256
   "3d6f2a2fd0dd489cee53d575226786bf2637cef0c0ff53e38b902bb915c254f3")
  (:FILE "src/wal/types.lisp" :SOURCE-SHA256
   "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/wal/types.fasl"
   :FASL-SHA256
   "39aafc8dd83bb885cb70431fc61e51ccb3706fa643184af126b754a766ebdc93")
  (:FILE "src/wal/package.lisp" :SOURCE-SHA256
   "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/wal/package.fasl"
   :FASL-SHA256
   "513a2d3cad13169f6e2c08457d7b0bdea743aea01c58e95aa5653a1845e22b98")
  (:FILE "src/wal/group.lisp" :SOURCE-SHA256
   "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/wal/group.fasl"
   :FASL-SHA256
   "3192e10e1b93d58102ce5a4febf0ca33ce87fa9c68e54a5889eeffbe32c0c293")
  (:FILE "src/wal/executor.lisp" :SOURCE-SHA256
   "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/wal/executor.fasl"
   :FASL-SHA256
   "4715d28274651c0d0e84d921c9d2a5db42fc82b8a0883046094ae5bb795bef21")
  (:FILE "src/wal/csn.lisp" :SOURCE-SHA256
   "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/wal/csn.fasl"
   :FASL-SHA256
   "bcf072d6417710093ca64deb40a63b35ba013181797bd203bb51d502c0e3b1a6")
  (:FILE "src/wal/builder.lisp" :SOURCE-SHA256
   "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/wal/builder.fasl"
   :FASL-SHA256
   "44d411f2911c7724b34128dabd2f65e7ec1559260d425d1b12bd523f4cae1e36")
  (:FILE "src/storage/segment-header.lisp" :SOURCE-SHA256
   "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/storage/segment-header.fasl"
   :FASL-SHA256
   "6e68ea3e12cb92e0ef5fc510779ee40610109defe0079782193da0ca9b5d0115")
  (:FILE "src/storage/payload-write.lisp" :SOURCE-SHA256
   "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/storage/payload-write.fasl"
   :FASL-SHA256
   "dc0ce281a43a0cb6aac80c6ad3ece3beb6b193258b5ff825823edb4cbd102977")
  (:FILE "src/storage/payload-record.lisp" :SOURCE-SHA256
   "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/storage/payload-record.fasl"
   :FASL-SHA256
   "e887f15fb8b46c37bf98cc2fc67ff87d385346b460c1c7be22aa3df1da344a1f")
  (:FILE "src/storage/package.lisp" :SOURCE-SHA256
   "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/storage/package.fasl"
   :FASL-SHA256
   "602ec1c6d4257e633007b6c936157fd010a678ec618e9d84c967923a67f462f6")
  (:FILE "src/storage/log-header.lisp" :SOURCE-SHA256
   "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/storage/log-header.fasl"
   :FASL-SHA256
   "d0ef0a476933db31ced0dbbc4857bdf3ab502bf78fdb8ba80e9a414d2b7af93b")
  (:FILE "src/storage/formats.lisp" :SOURCE-SHA256
   "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/storage/formats.fasl"
   :FASL-SHA256
   "de4c318eefb079c11d7f5634cca8e8ff0752c86f4b1ab7fc6b47ed0d97e558b0")
  (:FILE "src/storage/control-payload.lisp" :SOURCE-SHA256
   "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/storage/control-payload.fasl"
   :FASL-SHA256
   "ca261e57b2d4369fa2755e3e669a82b0ad4c630322f8b4d77b34555f55f252b0")
  (:FILE "src/storage/compaction-scan.lisp" :SOURCE-SHA256
   "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/storage/compaction-scan.fasl"
   :FASL-SHA256
   "88c8f6e80450f91eb3bc7a5088689a5177159fd307d6d5fbd3722498319d34a3")
  (:FILE "src/series/worker-types.lisp" :SOURCE-SHA256
   "a366799fd9b938bfaa48b0ffda228ff8369ab9acb5b5ead7f081dfc66ab2c81a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/series/worker-types.fasl"
   :FASL-SHA256
   "092b7b19d2073ddf3a2cfae89453112261cc2d37f0a656e1ea72edb650310174")
  (:FILE "src/series/worker-run.lisp" :SOURCE-SHA256
   "f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/series/worker-run.fasl"
   :FASL-SHA256
   "9c530a851bf4a23ae95093ac669d10b2ddcf05c9292a2a8c4e09b050f28aebf6")
  (:FILE "src/series/worker-package.lisp" :SOURCE-SHA256
   "dcab7a17e4fabcf256c2eddfb655d18145a1d789dd8d64a889945badc418e4b7" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/series/worker-package.fasl"
   :FASL-SHA256
   "2fb733ef548e28830254dd5577404fc158068e928c1d620624a473791cae6cd5")
  (:FILE "src/series/worker-boundary.lisp" :SOURCE-SHA256
   "793d401d1b9acc7b67923d815560f277f3d390ca050740f735f07d88dbacfe73" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/series/worker-boundary.fasl"
   :FASL-SHA256
   "70edbda06d8649504eed20ac9f5195a407e6ac23459edd4c3ed8cf0107d4aea2")
  (:FILE "src/series/types.lisp" :SOURCE-SHA256
   "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/series/types.fasl"
   :FASL-SHA256
   "7e76b7574ad578b90389df1a1d692c5267893fdc1b3642865ee82e16ea331b40")
  (:FILE "src/series/routing-types.lisp" :SOURCE-SHA256
   "31ae51c0fb11a802164a4d1e11ec63f835a2c67b52c751c5685bcc8947e5e0f1" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/series/routing-types.fasl"
   :FASL-SHA256
   "1e13a01dea70771218648234c822cfa160d103387646e83a3eed0fed5f5ceffb")
  (:FILE "src/series/routing-select.lisp" :SOURCE-SHA256
   "796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/series/routing-select.fasl"
   :FASL-SHA256
   "5fa6c2c8fc78d926bb0d84139304b265a67a6a3a8a9091e0be609e2636541567")
  (:FILE "src/series/routing-build.lisp" :SOURCE-SHA256
   "70135e73ecb1f6080683dd615c47a50530485061797382d74441743cd9a0f92d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/series/routing-build.fasl"
   :FASL-SHA256
   "9c5d56c67d35c72ea3e960697df440944d768be7490fa9025bebe7d73a6b2dea")
  (:FILE "src/series/retirement.lisp" :SOURCE-SHA256
   "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/series/retirement.fasl"
   :FASL-SHA256
   "d71bf77e5d2f59ebb8f2af26936b158a044dda92791b16d6294babcb334058fe")
  (:FILE "src/series/query.lisp" :SOURCE-SHA256
   "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/series/query.fasl"
   :FASL-SHA256
   "765fd81c4d37639074cf2ae7b1247a689a821a3d6ea007db23b806b45c5d3ecd")
  (:FILE "src/series/publication.lisp" :SOURCE-SHA256
   "2afb3846f4d034e3ee819075dccf69f2030da2dd67919028a14427c447f9d7bc" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/series/publication.fasl"
   :FASL-SHA256
   "83a25a99d363ce9be184930d08e9c545140aae4268a6178d774b59c307aca50a")
  (:FILE "src/series/package.lisp" :SOURCE-SHA256
   "9a402f5225860c483dec9064a84d6462d28f5377a27977a63f64a5fbdbdd3764" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/series/package.fasl"
   :FASL-SHA256
   "29a3bcdecccb4cf43a289a255610c036072b5dcad416e54088e2cc5e79ade849")
  (:FILE "src/series/ownership.lisp" :SOURCE-SHA256
   "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/series/ownership.fasl"
   :FASL-SHA256
   "de49087f61bcb5185cd07843018882bd94b5114f58f74efbcfa07711eba57bb4")
  (:FILE "src/series/io-events.lisp" :SOURCE-SHA256
   "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/series/io-events.fasl"
   :FASL-SHA256
   "a9ae2b09c5591bc1a93ab0a016eb7c7522dd82575acae87bc92a97842be40185")
  (:FILE "src/series/events.lisp" :SOURCE-SHA256
   "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/series/events.fasl"
   :FASL-SHA256
   "49b4372cd09e5b7e75d48afe1e7a8902953e31fc06fc362b6d252e01b1527f6e")
  (:FILE "src/scheduler/update.lisp" :SOURCE-SHA256
   "e35a704ee0b9445c559a768de048169a8e39837a6df21843d8df58215c482472" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/scheduler/update.fasl"
   :FASL-SHA256
   "f63116405cc2f2a6496719579a19402aa6e8d6efa84f4f2c2fe63b7831fb7e31")
  (:FILE "src/scheduler/types.lisp" :SOURCE-SHA256
   "3b174be0919f8b27312ada4071d831c3753d62bb12be99d7e9394c48dcab474a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/scheduler/types.fasl"
   :FASL-SHA256
   "4f064d9dffcef37e98a23816d1b1fb30748a7d2751cb8506d6478c18b929e383")
  (:FILE "src/scheduler/read.lisp" :SOURCE-SHA256
   "5cdc1e5b7ba97c9aab66a5acaf74336b0df33144e24104e0242b7fc2552a1ae2" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/scheduler/read.fasl"
   :FASL-SHA256
   "fb212f3afae1501dfc2698c54e4d768da3cd568c54b46e63adc175d31cea390c")
  (:FILE "src/scheduler/pool-claim.lisp" :SOURCE-SHA256
   "e384f6091a5fcb506e718e12e77b06ab8dd4233a41024bc57ca3b14425e10b14" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/scheduler/pool-claim.fasl"
   :FASL-SHA256
   "1e762f68a42e2c69290c07880439577cdf6532be6759e9c6b20559f6ad393d5e")
  (:FILE "src/scheduler/policy.lisp" :SOURCE-SHA256
   "92b3ca3a81ae0b3ac342a63e5fe5c5d7524091a63065b0232c14c57ee80c4aac" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/scheduler/policy.fasl"
   :FASL-SHA256
   "2820ae4f8862cf6a5e8b6e510d2b93f95f1ecb9d09105396e63f86933cb968bd")
  (:FILE "src/scheduler/package.lisp" :SOURCE-SHA256
   "a44fd2c3d435e1f6729bf861b6caeb54a184f31c92e7909aad9c18b491f03cdf" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/scheduler/package.fasl"
   :FASL-SHA256
   "21c428456d57536ff849ce829468b3822b4d869e34fc3a9f537155f9bacb0761")
  (:FILE "src/scheduler/lifecycle-worker.lisp" :SOURCE-SHA256
   "ec8b462ff3f5f7a6435f0f0c01b62034d8de2a784a9e354d469a0adfec9cf837" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/scheduler/lifecycle-worker.fasl"
   :FASL-SHA256
   "336ca5d720a8aeaab3ed3037261be95fb742c7ae334fe1723c74c402f130656b")
  (:FILE "src/scheduler/lifecycle-update.lisp" :SOURCE-SHA256
   "2020e46809e9fe8fa74e061a420b8085679d5f461eabd8b044f3975c1024800e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/scheduler/lifecycle-update.fasl"
   :FASL-SHA256
   "8358d23043ca98e42b5b332ac53e142ff0647ca33b50fc46c5bcdfa687a7e695")
  (:FILE "src/scheduler/lifecycle-types.lisp" :SOURCE-SHA256
   "4fe980e00f1d273e9b8278cd2daace6b4a9e4ab948ddfac83b79f4b0c537cb7c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/scheduler/lifecycle-types.fasl"
   :FASL-SHA256
   "d07bec1da1eb42fc832b6101d1923e48d39015319f28e15876bca7898f2a740e")
  (:FILE "src/scheduler/lifecycle-read.lisp" :SOURCE-SHA256
   "c60e1d5f67eeafb216b374fa001d27f87d1a734c5d066fc092902c0301069200" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/scheduler/lifecycle-read.fasl"
   :FASL-SHA256
   "2b5761eb3036cff2c8ed38df4b0cfed7a8cffc03cfe8a9662c9f0600d069f3ee")
  (:FILE "src/scheduler/lifecycle-build.lisp" :SOURCE-SHA256
   "d6d67faf8721f26e7fcd228d6ab9a7dfdc36ff5ec56c67ed9e5fb6d914006a9e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/scheduler/lifecycle-build.fasl"
   :FASL-SHA256
   "4da1fc183f720de2d0e2d15e2cd9d8915c8fd7d148065c1eb80b69684b8b538f")
  (:FILE "src/scheduler/build.lisp" :SOURCE-SHA256
   "58baf595f221826c64e3fb38344242c3bdf403d65904193bf1a8e06e09d7c336" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/scheduler/build.fasl"
   :FASL-SHA256
   "0de24b38831b197f78f94b5ec47544856b7104f54e0b48820ed578b21db161be")
  (:FILE "src/recovery/scan.lisp" :SOURCE-SHA256
   "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/recovery/scan.fasl"
   :FASL-SHA256
   "7ba2e5790ce8eb6d15ed0bcc44a71cd0d09b61684fb1ec3c7291fe6b0685da17")
  (:FILE "src/recovery/package.lisp" :SOURCE-SHA256
   "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/recovery/package.fasl"
   :FASL-SHA256
   "d7b82fcfabfaaff0b1de593765559d0614ff61c22e836b45a4ad84eb0df9323d")
  (:FILE "src/recovery/manifest-types.lisp" :SOURCE-SHA256
   "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/recovery/manifest-types.fasl"
   :FASL-SHA256
   "54ce9dec7a032b60ea744b5ab6d32f8e3a59289f913c141b2521d28826662e02")
  (:FILE "src/recovery/manifest-query.lisp" :SOURCE-SHA256
   "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/recovery/manifest-query.fasl"
   :FASL-SHA256
   "4924905d80683b49b258e4fa81b7d24f1bc6be1a7c3dc66df6caf2dcf1c40086")
  (:FILE "src/recovery/manifest-package.lisp" :SOURCE-SHA256
   "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/recovery/manifest-package.fasl"
   :FASL-SHA256
   "ce78b43c7ff200de98959370219ab4a5fc29cc6c015b46a9132b59c94493a4d7")
  (:FILE "src/recovery/manifest-fold.lisp" :SOURCE-SHA256
   "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/recovery/manifest-fold.fasl"
   :FASL-SHA256
   "19f37ea59cd342856b2143aa75153d88a743b6e3af49b1cf7871104e977d699c")
  (:FILE "src/recovery/manifest-decode.lisp" :SOURCE-SHA256
   "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/recovery/manifest-decode.fasl"
   :FASL-SHA256
   "ed3184533b37cfcc69af1969d8ac96ace03f7b2273695deb7b075809499e0585")
  (:FILE "src/recovery/manifest-build.lisp" :SOURCE-SHA256
   "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/recovery/manifest-build.fasl"
   :FASL-SHA256
   "b715b8182d42a90cdff5eb33bafde45054ddf99ffa189c0944ad8864c88b3b93")
  (:FILE "src/recovery/inventory-types.lisp" :SOURCE-SHA256
   "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/recovery/inventory-types.fasl"
   :FASL-SHA256
   "84a6e51044b69c18a7179161b17bb61030b48d0596c6f3d665841723f45e574d")
  (:FILE "src/recovery/inventory-query.lisp" :SOURCE-SHA256
   "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/recovery/inventory-query.fasl"
   :FASL-SHA256
   "1db30564c1400aa047d57a896df8fa5a96ffad87998110036509c1e3cd54bbf4")
  (:FILE "src/recovery/inventory-build.lisp" :SOURCE-SHA256
   "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/recovery/inventory-build.fasl"
   :FASL-SHA256
   "351626ec14b1265f843b4ad425992cceca17684b188b2e613e6de37f23987060")
  (:FILE "src/recovery/decisions-types.lisp" :SOURCE-SHA256
   "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/recovery/decisions-types.fasl"
   :FASL-SHA256
   "82a2dccde93244c00a186999943af7fffc6e3a17e6962a5ed5a9d05854fdf76d")
  (:FILE "src/recovery/decisions-sort.lisp" :SOURCE-SHA256
   "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/recovery/decisions-sort.fasl"
   :FASL-SHA256
   "157d969a58e290c0d6d02e02910d93cf31af33effc81eac1701c69ba5b8f0268")
  (:FILE "src/recovery/decisions-radix.lisp" :SOURCE-SHA256
   "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/recovery/decisions-radix.fasl"
   :FASL-SHA256
   "66a6e76b80cf0fbc7a059717204df82418f9a4862afdd6f739c86e7f8a81cd08")
  (:FILE "src/recovery/decisions-query.lisp" :SOURCE-SHA256
   "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/recovery/decisions-query.fasl"
   :FASL-SHA256
   "143becc5760a7f2225a751a4a92d935b956eed0a5b594279410d97aacf9fee08")
  (:FILE "src/recovery/decisions-package.lisp" :SOURCE-SHA256
   "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/recovery/decisions-package.fasl"
   :FASL-SHA256
   "838b6b4279e1425d4af603d87d3fdc0c7834a314e1f72c0cfd5ce0be2e2f9768")
  (:FILE "src/recovery/decisions-build.lisp" :SOURCE-SHA256
   "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/recovery/decisions-build.fasl"
   :FASL-SHA256
   "aed1f2cce732c0a2b4fe92776cf26acef04d2cd562b38c8c5dda325947640594")
  (:FILE "src/read/types.lisp" :SOURCE-SHA256
   "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/read/types.fasl"
   :FASL-SHA256
   "978c733a7501e8fc5d8d7f42a35ff7367bcb8b4d5f45577c7372d49ea7460758")
  (:FILE "src/read/task.lisp" :SOURCE-SHA256
   "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/read/task.fasl"
   :FASL-SHA256
   "5c90e80296c9af28f52897604622a328f232b514fa8856f56682821e8eefca10")
  (:FILE "src/read/package.lisp" :SOURCE-SHA256
   "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/read/package.fasl"
   :FASL-SHA256
   "49b41f76c492503376cf6bbb4654a7242e4d2c575b07d9e1fea463774f50df7b")
  (:FILE "src/read/core.lisp" :SOURCE-SHA256
   "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/read/core.fasl"
   :FASL-SHA256
   "a953a56b3ea11c243ca879949bbc3f52104b9b7958642ab1ce08d1782ba7a0f6")
  (:FILE "src/package.lisp" :SOURCE-SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/package.fasl"
   :FASL-SHA256
   "a2ded4190adc849a5b7dbea99b5d0e2384b47387249cf9fa6faddf1ac7d8609a")
  (:FILE "src/mvcc/types.lisp" :SOURCE-SHA256
   "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/mvcc/types.fasl"
   :FASL-SHA256
   "397bc6b90a9867d70d4b682d43511c72d3abc944c8a7a7355082fc253f251d52")
  (:FILE "src/mvcc/snapshots-types.lisp" :SOURCE-SHA256
   "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/mvcc/snapshots-types.fasl"
   :FASL-SHA256
   "d19e2e189d4a8d21c55556c88d20d959b5b2089a334624e7e2f8a870ac3c9137")
  (:FILE "src/mvcc/snapshots-register.lisp" :SOURCE-SHA256
   "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/mvcc/snapshots-register.fasl"
   :FASL-SHA256
   "962efd7ad431a7a5b23e7c037f9fee6b9cdb73084658145fc7b4f7d9b29021f6")
  (:FILE "src/mvcc/snapshots-read.lisp" :SOURCE-SHA256
   "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/mvcc/snapshots-read.fasl"
   :FASL-SHA256
   "11662b1fc0e1d23821968efeb076b3d5cf5dd444f299299a78ce0b2335cdb1a2")
  (:FILE "src/mvcc/snapshots-lifecycle.lisp" :SOURCE-SHA256
   "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/mvcc/snapshots-lifecycle.fasl"
   :FASL-SHA256
   "3b3b7fd19cf80f095a8e36d164c0f37083ab6f2e752f4aedd3de5f6c59e70d15")
  (:FILE "src/mvcc/snapshots-csn.lisp" :SOURCE-SHA256
   "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/mvcc/snapshots-csn.fasl"
   :FASL-SHA256
   "6fcb27e4035d73d5b190c89d365951b56370cac7f2d009095ebbffd22fb95413")
  (:FILE "src/mvcc/snapshots-core.lisp" :SOURCE-SHA256
   "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/mvcc/snapshots-core.fasl"
   :FASL-SHA256
   "000efaabdd882b750319f836211de8808fd4792f2f2204e9c89b094cf131805a")
  (:FILE "src/mvcc/package.lisp" :SOURCE-SHA256
   "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/mvcc/package.fasl"
   :FASL-SHA256
   "b498d3a4d6060f0309fd5f4ddac96b3a442923baac250fd5084c94e31d8bf5b5")
  (:FILE "src/io/types.lisp" :SOURCE-SHA256
   "68df36ae5167c975261f99d63a6598bca1fe93caca02f39e18812e94fcf1b233" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/io/types.fasl"
   :FASL-SHA256
   "17b37ac1a8e6235e69bcf581ba8591b35b461309bd6ae3e55f78c09c6cd29061")
  (:FILE "src/io/transfer.lisp" :SOURCE-SHA256
   "c807f294d0211e8433f8f0332ab6ba3ce7d9ae7de3818f43af7ff8d7fcfd341a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/io/transfer.fasl"
   :FASL-SHA256
   "9033b88f0930462a2aeb0f3f0ebc088fda27f07fd44055be80776b1abd70ebca")
  (:FILE "src/io/rename.lisp" :SOURCE-SHA256
   "ef9475701a2da4a44d98f9c88a1f547f3be1f07c649c8c3c956c206c80a55598" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/io/rename.fasl"
   :FASL-SHA256
   "ec5439e58cd6f86aea8cce7c62c986a8ccc1880ccf07e6f42e6671b92f7dc855")
  (:FILE "src/io/package.lisp" :SOURCE-SHA256
   "605f51109d723267b326c012602a91e7deff984a040c3440d90665b853e3549c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/io/package.fasl"
   :FASL-SHA256
   "a4c20df280a405fd846c2b88ddfa3e33ee3fe9f105e0779b1e63f41fdfa48731")
  (:FILE "src/io/native.lisp" :SOURCE-SHA256
   "74f63dbb2137a344054e82c6707e6262473b3332ff66a85f79ecfee9fd50f9b4" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/io/native.fasl"
   :FASL-SHA256
   "59c74248e24ea9a123e061743368beabdb3a74bfa817d758d7ce867a2863aed2")
  (:FILE "src/io/native-namespace.lisp" :SOURCE-SHA256
   "3a7ada1ffe09c94714629a3679bf26a56bd5570ff3bf06acbce4be83750a47ad" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/io/native-namespace.fasl"
   :FASL-SHA256
   "e9f07f7e5630dfa592073e60489d92b48f284640a57f96bc85052178a4b8edfd")
  (:FILE "src/io/namespace.lisp" :SOURCE-SHA256
   "f23b46209fa87bee4deee84dbe3d87bc7a20d0a4f98bdafe7d40391fc42e1b59" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/io/namespace.fasl"
   :FASL-SHA256
   "4da0b7cf1b5350316d123c9d04cbf148013ad2b9e5060ee070ed8cb9c19c7cef")
  (:FILE "src/io/lifecycle.lisp" :SOURCE-SHA256
   "88e72ad54b8c8048358cbca2d136c62883d8e700d63d92e807cb14df0082ae6a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/io/lifecycle.fasl"
   :FASL-SHA256
   "4eefaa337a4234683df3e52d15bf7d121b3358dec490a199ea243c8c1e481e5f")
  (:FILE "src/io/identity.lisp" :SOURCE-SHA256
   "d2b6f7932b66f2ef74241e573ed253cf9b710f217cd570ef23f6671614d90a2c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/io/identity.fasl"
   :FASL-SHA256
   "58286ac6e00c33d58bf9799701f50b000fb739d065c6cd1f2bd12651007dba3b")
  (:FILE "src/io/identity-types.lisp" :SOURCE-SHA256
   "5794dd5094f34c24e7e09e4a7937f1988d85ea9cd37e478abaf836273da5d5c1" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/io/identity-types.fasl"
   :FASL-SHA256
   "f44276b9624436dcc53b2b592178d37ffe5790015966f472ead11c20a46677d5")
  (:FILE "src/io/flush.lisp" :SOURCE-SHA256
   "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/io/flush.fasl"
   :FASL-SHA256
   "99532e3d512df9678138b986e4841abc308aefd3c62bb228f15c43b061f2bf3f")
  (:FILE "src/index/write.lisp" :SOURCE-SHA256
   "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/write.fasl"
   :FASL-SHA256
   "def57362019d4ee3e24ba5bdaa7cdaae46319b9187fbd99e038dd3e1883dbf3b")
  (:FILE "src/index/validation.lisp" :SOURCE-SHA256
   "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/validation.fasl"
   :FASL-SHA256
   "90a49dc04a550f64d8dd4e574b440ffb9115cd674dd1bc7228c33ea206679bf3")
  (:FILE "src/index/types.lisp" :SOURCE-SHA256
   "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/types.fasl"
   :FASL-SHA256
   "3f7e56b83ba6a8db3d8d8afa88ddb115810e23347adbbef564cd95cb810decad")
  (:FILE "src/index/relocate.lisp" :SOURCE-SHA256
   "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/relocate.fasl"
   :FASL-SHA256
   "b04292dec52a49a27f987de066f33a67358f80cf7b211ccd6cf0daf8e90a012f")
  (:FILE "src/index/rebuild.lisp" :SOURCE-SHA256
   "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/rebuild.fasl"
   :FASL-SHA256
   "7fae5ed330824a67902670e05d5ff4343a9da46994013f92bc98dc666893be0d")
  (:FILE "src/index/rebuild-scan.lisp" :SOURCE-SHA256
   "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/rebuild-scan.fasl"
   :FASL-SHA256
   "b59abc2ebac8bca80e9404ac3052375824c1bfc775eb585de7207227ccaf9bf0")
  (:FILE "src/index/rebuild-copy.lisp" :SOURCE-SHA256
   "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/rebuild-copy.fasl"
   :FASL-SHA256
   "53be2644989ff14d90162b04506bb1dbc4ac774780de769f7af5fad71a6f3ea6")
  (:FILE "src/index/rebuild-budget.lisp" :SOURCE-SHA256
   "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/rebuild-budget.fasl"
   :FASL-SHA256
   "8321008a0d5384c8baf42ef5a216c176551ba5d4473b103b54d4f91cbc7c9d2c")
  (:FILE "src/index/read.lisp" :SOURCE-SHA256
   "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/read.fasl"
   :FASL-SHA256
   "da5d8df2ed8d2d055a66c20060a38777216b325d2c4fab799ff9c098cb16e7a4")
  (:FILE "src/index/primary-write.lisp" :SOURCE-SHA256
   "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/primary-write.fasl"
   :FASL-SHA256
   "430808c44050337ae5bc160fa014cdea664a3bc90e03dae580603394c89c2f05")
  (:FILE "src/index/primary-types.lisp" :SOURCE-SHA256
   "f17ca0dcd8a538b921f00044e23872b28272638c4435eacd30f0509422505e64" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/primary-types.fasl"
   :FASL-SHA256
   "e4551969ff9267fccaccfc8d1f118021f0f4b013de0329009da00cfb93f79a53")
  (:FILE "src/index/primary-relocate.lisp" :SOURCE-SHA256
   "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/primary-relocate.fasl"
   :FASL-SHA256
   "0ef5c3a32d15092377122b9a5e8ad02717dd55f8cd7dbfd2fb58e02dff4537b2")
  (:FILE "src/index/primary-read.lisp" :SOURCE-SHA256
   "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/primary-read.fasl"
   :FASL-SHA256
   "2fd06d53691096273272f52deaf2a4665ffa460d5d41733a59e6f0b578e0520b")
  (:FILE "src/index/primary-probe.lisp" :SOURCE-SHA256
   "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/primary-probe.fasl"
   :FASL-SHA256
   "cb8bbadf7f84cf7483fe57fa96b40d3a9c22cca989b2e9de8b20ce9b6c4cefd9")
  (:FILE "src/index/primary-package.lisp" :SOURCE-SHA256
   "0682eb9a61596506b6788bd0285f9808db2496246caae64ab3203182ed46b860" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/primary-package.fasl"
   :FASL-SHA256
   "a538a29de4e0e1a52b811ccfc905aa6314012f2e585591c882bae3f213b0ee4b")
  (:FILE "src/index/primary-directory.lisp" :SOURCE-SHA256
   "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/primary-directory.fasl"
   :FASL-SHA256
   "e80ef69b6aeafceb5db741d3470b21c1d3fb617cfac504810443a996accc35fc")
  (:FILE "src/index/primary-core.lisp" :SOURCE-SHA256
   "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/primary-core.fasl"
   :FASL-SHA256
   "ad34134bda14c9cfb4997160e8d327ac3e3399b462829e98167b390b8994f1b7")
  (:FILE "src/index/primary-build.lisp" :SOURCE-SHA256
   "06ca5ac8c03504e2d2f973873e5cabf7518c090cd1f8f2118c46e0ea2f9bf37b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/primary-build.fasl"
   :FASL-SHA256
   "3457fab78c9c0e88f3a0c0e5d889f57e889fd248e4631e6d89bfe21dd13c6ec8")
  (:FILE "src/index/primary-arena.lisp" :SOURCE-SHA256
   "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/primary-arena.fasl"
   :FASL-SHA256
   "b8995dfe07cc6a37200bb8fcde27bfb5207951393b5a773842d8731b552f2ff8")
  (:FILE "src/index/package.lisp" :SOURCE-SHA256
   "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/package.fasl"
   :FASL-SHA256
   "eaea7fc96fd7ccdec4a2e13e4732d2d19064944553f239248eb2c63ea3a2c7e2")
  (:FILE "src/index/hash-seed.lisp" :SOURCE-SHA256
   "ae86514101e95737747ba58a4f0c5dc1ddb44d2b3a18bceb8fd0d0756b57a7a1" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/hash-seed.fasl"
   :FASL-SHA256
   "8152b0c3254fd1d92ab1368c6f07e0b1804efa97ac1a87540e0211cc9dab557b")
  (:FILE "src/index/hash-digests.lisp" :SOURCE-SHA256
   "924bb7dab91ff56c1e909f2b06dff5f74b443ac6442e379498f29b25f1fa2673" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/hash-digests.fasl"
   :FASL-SHA256
   "ade85793f9920917e6ae40bbb68cabb1ab3ccf992d5209792e663fd7faf93532")
  (:FILE "src/index/core.lisp" :SOURCE-SHA256
   "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/index/core.fasl"
   :FASL-SHA256
   "5a8dc3a7f622db170ea62a9f3961a605085216a126d902e6c8b8aeae0239c6d3")
  (:FILE "src/hash/package.lisp" :SOURCE-SHA256
   "1e7668fa26fc1a8e3b3cfe824aa3e08b30b57441d5f90d44453fc3a9259a10d0" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/hash/package.fasl"
   :FASL-SHA256
   "13e91e9c3d644bcb78e046ceacce39e13cb1258a41f6eb2af37f1fef20e5ca41")
  (:FILE "src/hash/hash64.lisp" :SOURCE-SHA256
   "99e4c8394a8f877ce1f552f15a57a082c0ec81015e87119ee4ffea28cf3ae77f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/hash/hash64.fasl"
   :FASL-SHA256
   "090d0b91712f32afbee93dce53752baf157be6e3fd2186e321c7cd28dae52cf4")
  (:FILE "src/hash/blocks.lisp" :SOURCE-SHA256
   "5f5dff95ae6c34dfc15538c537ba2fa8d34ba2376ad66ad9975745ea13a2175f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/hash/blocks.fasl"
   :FASL-SHA256
   "efcbad88b8691a3ef1edffb7c0553eb991f33664402862a9cf97b6611984e4d9")
  (:FILE "src/hash/arithmetic.lisp" :SOURCE-SHA256
   "c439e534b768acb123d69b921b85e1e56683aa8335bbc87efba95fe95f256fa9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/hash/arithmetic.fasl"
   :FASL-SHA256
   "de860bd704d749d469868840289b707e2d6aa0f9ebc6d2fd66379ae63816bfdc")
  (:FILE "src/get/types.lisp" :SOURCE-SHA256
   "653b23a6e719cd1f55e7c58b4d7e8143aec5983992ba210d0eac1f4c8682f623" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get/types.fasl"
   :FASL-SHA256
   "dbd9f05ed86347314954ef5169966692a3c9ce5f479c4d8bacf2847d2934974f")
  (:FILE "src/get/target.lisp" :SOURCE-SHA256
   "9f682f735e49108cad176a6143ec99e1be64da98f29cae0b52f9b49cdea34250" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get/target.fasl"
   :FASL-SHA256
   "e822d2be6aad0b52e81f95a45d5329ccb45a9eae52bc84dfdd1be5e0e098adb6")
  (:FILE "src/get/segment.lisp" :SOURCE-SHA256
   "4a486528cb2c1cc3471cb4b332d4314d24011889e1f885db6fd5600bb077eea3" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get/segment.fasl"
   :FASL-SHA256
   "5773a84e6b0f4fd929c4fa498dd056f5dbc1601f6a216f6551b48f96c60ce29e")
  (:FILE "src/get/package.lisp" :SOURCE-SHA256
   "87b795779aef0c4b918a039d182daddd22b902a9ad10c763df4364b7e630151c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get/package.fasl"
   :FASL-SHA256
   "b4329269038c9eade917067f0d0ed474c7db7a71c897a2f963f2369ab91bd328")
  (:FILE "src/get/lookup.lisp" :SOURCE-SHA256
   "9d1042d4cf1e7bd9c6d1153de12b2459e7a2724e47bd32534cd7ae56cb274c5f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get/lookup.fasl"
   :FASL-SHA256
   "75e83abc7cbb312c1b67aa8129f724e3621d11eda6f59ff3deede698cdc4d7a8")
  (:FILE "src/get/lifecycle.lisp" :SOURCE-SHA256
   "885ba4141114ea411cac37c9b5f924aaa7f9f2a5ba311ebf92a392e5da1e3c59" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get/lifecycle.fasl"
   :FASL-SHA256
   "c2df1808518d41e8ff4de2e413eefc944aec4c4dd9190d4c1db30e93f0a83006")
  (:FILE "src/get/build.lisp" :SOURCE-SHA256
   "bcfc4916e9a85833dc151c4ce176bc905f2c03b6bc6d636f97a60df0d8c16739" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get/build.fasl"
   :FASL-SHA256
   "5f12364d6ee88518c24acad4240166f3a00018fc138740bedb15635747e1b0d3")
  (:FILE "src/get-resolver/types.lisp" :SOURCE-SHA256
   "b847d6c388f4d052a2d707b7c410cc7c2ef60482fb5cd9ef384c016c31d1dc00" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-resolver/types.fasl"
   :FASL-SHA256
   "8c29692f7768ff41035d807b93ebaef05801794dfb5cdca7927f4956a44e8ee9")
  (:FILE "src/get-resolver/sort.lisp" :SOURCE-SHA256
   "974bf44efeb1cd26c5e9db0601aea295c8f1a18234894ad9d41938a2880e2255" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-resolver/sort.fasl"
   :FASL-SHA256
   "ad92a98786a3ac0d8a690f493cd177234fc38ad87b3668abffa5963de21ecb94")
  (:FILE "src/get-resolver/scan.lisp" :SOURCE-SHA256
   "35a1780c6bf66364ef94c4151fa91f02eebe359f0ca0639985d2a907fd9d512d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-resolver/scan.fasl"
   :FASL-SHA256
   "3ddeebccb54145dbc40419b20ff7c36756e6430b9338b1fbc2bd7a5ead61a9a1")
  (:FILE "src/get-resolver/rows.lisp" :SOURCE-SHA256
   "d9db85d788006fc7ad1f9a7cdeef28b992605de7fac8c295dd7fdc51f5511854" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-resolver/rows.fasl"
   :FASL-SHA256
   "f4c750bf7cbf2a98d72e3c1a4da78cf2c0cda269a88d17d2cbfd33fd49e7d31c")
  (:FILE "src/get-resolver/read.lisp" :SOURCE-SHA256
   "dd100bb17e15589124916767f8a690ae683ac8c462102c778639f917a5f1924d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-resolver/read.fasl"
   :FASL-SHA256
   "a579677ec0463d0a81e96b8e4f7a45368af6686194a8596ea801d12e223726a8")
  (:FILE "src/get-resolver/package.lisp" :SOURCE-SHA256
   "663a5a15a630ed2b9042a3a3365598358df97d3dd1cd3d7610b283526281f39a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-resolver/package.fasl"
   :FASL-SHA256
   "097f24c7da7a54e109021e2b79ee319a6213e6a045e184e6536bfc7dda79c89a")
  (:FILE "src/get-resolver/build.lisp" :SOURCE-SHA256
   "c649c80c2b510669fc1c0a7f15b3080b7fb46a3423a1e49db5bb9ff248176e0a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-resolver/build.fasl"
   :FASL-SHA256
   "8837b3511ffae99baedffec9cc6b83818c66ac589ecdd992cca755a539783ca9")
  (:FILE "src/get-resolver/active-types.lisp" :SOURCE-SHA256
   "a3cb954a265b263e0e03d2f1a80824589670efbf89adcd69007987d26df2e29a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-resolver/active-types.fasl"
   :FASL-SHA256
   "6edf09f92fbf3371b687e66584fb83dadbd542d527479f27839855ac8b2ffaff")
  (:FILE "src/get-resolver/active-scan.lisp" :SOURCE-SHA256
   "97dd4f59d4449334b113e9403a208007ed1a398a9b53f88bda3e3c0bbf3a1067" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-resolver/active-scan.fasl"
   :FASL-SHA256
   "df853a10e5f0be37aef4f4c6dfe52b468cb276127c7a3c26d2212cbb8e25b734")
  (:FILE "src/get-resolver/active-read.lisp" :SOURCE-SHA256
   "47630e5d42c785e39e15dd714177cd86159129a5391d82321385f92317bea659" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-resolver/active-read.fasl"
   :FASL-SHA256
   "5ab45a9f99dfd71c625e2a2867d5411482549ffee5b550a6040b0e0e497fe1e4")
  (:FILE "src/get-resolver/active-preflight.lisp" :SOURCE-SHA256
   "eb56f5704666cac3a88ec97f58f70c7d61db2e8feea6a094db4c468a1a2775a9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-resolver/active-preflight.fasl"
   :FASL-SHA256
   "3a8a35892fc4ade89445cf0e4b7aab45cc6250fb3d0180d2645845dcb8ccc1ba")
  (:FILE "src/get-resolver/active-init.lisp" :SOURCE-SHA256
   "2f9380674cf4b590b071ab9d769a4b79292f544d920c0fc5ff33146dde7686f6" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-resolver/active-init.fasl"
   :FASL-SHA256
   "db965a9b6cfc5f31ddc09eb94a7b7a7835c712f7f123e9b2eed695e1019f49cb")
  (:FILE "src/get-resolver/active-directory.lisp" :SOURCE-SHA256
   "c2b9a9ac3209270e9949720473908460548430a8098c9199fb55d2317a87682b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-resolver/active-directory.fasl"
   :FASL-SHA256
   "1d81fbd896ff6a90d5b43a6ffd00e4f6209f4888abd129bd85d18ac6cba3c26c")
  (:FILE "src/get-resolver/active-build.lisp" :SOURCE-SHA256
   "0eed95930d41c515965ae8ab0a14fbb94597a42ea38b86f205ea0938cf4631de" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-resolver/active-build.fasl"
   :FASL-SHA256
   "705cf5490e212d88ce84081cab1900d4ee1b0eb2bafbbcb264f70fd310b1eaa7")
  (:FILE "src/get-directory/types.lisp" :SOURCE-SHA256
   "0e2348291a4994f45bd1f6fe5efdc66041d2fdce18641d1af11b6c850ed69b2b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-directory/types.fasl"
   :FASL-SHA256
   "4666522533ac55fd9b8bf9f567423bad209f9ec4119ace9c94623ebc572ce38c")
  (:FILE "src/get-directory/sources-types.lisp" :SOURCE-SHA256
   "862342b07d6a8aae834aaf3da4149682fcd1dcbdae971adad640597583547099" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-directory/sources-types.fasl"
   :FASL-SHA256
   "9dd056152b0e4a2861219eb09cf02c3ccff32149cd2df0e729efadc29daf2994")
  (:FILE "src/get-directory/sources-read.lisp" :SOURCE-SHA256
   "ee4a3b81322fbd51ce928be0b73e9bc180af7ed39f936b68ec9a152dd2a180c2" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-directory/sources-read.fasl"
   :FASL-SHA256
   "06c228f409a7add2770ab3018fda0c811749b84adf5e6bde6f270d2565bc0093")
  (:FILE "src/get-directory/read.lisp" :SOURCE-SHA256
   "a2287eb7e91bed84f3727baaf81376bbe5bf5df15cde1ea268c6d2fa66fe0a5d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-directory/read.fasl"
   :FASL-SHA256
   "111e03845b4e2d8f62d292bde445ea07ae27f03d3799a39b996dca66091c5609")
  (:FILE "src/get-directory/package.lisp" :SOURCE-SHA256
   "e779202c8df502749a81d0c6f9f0d505d000e09231f3679b1a91303fbcbf36f9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-directory/package.fasl"
   :FASL-SHA256
   "e62425d044a73521d6ed542460196b3a1bb5684aa15b0dda64994f853c47dbbf")
  (:FILE "src/get-directory/build.lisp" :SOURCE-SHA256
   "9bebb3cd9d66a8ec2fd0c72ad828e00ab2347093642653da45ef263bc855f947" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/get-directory/build.fasl"
   :FASL-SHA256
   "c828239b4f4f374443e9f432cc9fbd26628778ec38b598dd73a092f785bba1ee")
  (:FILE "src/foundation/record.lisp" :SOURCE-SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/foundation/record.fasl"
   :FASL-SHA256
   "faa2bee107ced67f113056adec558bb44fd6ad2fb777b2e9bb45457697f82465")
  (:FILE "src/foundation/package.lisp" :SOURCE-SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/foundation/package.fasl"
   :FASL-SHA256
   "762adbdc78be92fc238ea4d722b397b55d011c4964697eb4e9864cc1016b14e7")
  (:FILE "src/foundation/crc32c.lisp" :SOURCE-SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/foundation/crc32c.fasl"
   :FASL-SHA256
   "0e3a52bac26fe9c59397a06e6c785a11c802bfe32875702f55dda17acfb5fcad")
  (:FILE "src/foundation/conditions.lisp" :SOURCE-SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/foundation/conditions.fasl"
   :FASL-SHA256
   "d34ab2e66e4a634be03a24c207f1a0fb2d7cc9c51b3766b3e9011e1f17f95a27")
  (:FILE "src/foundation/binary.lisp" :SOURCE-SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/foundation/binary.fasl"
   :FASL-SHA256
   "9735b98516dad8996663e228493093c2bae35aeaee113d798aefc650ba45981f")
  (:FILE "src/foundation/batch.lisp" :SOURCE-SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/foundation/batch.fasl"
   :FASL-SHA256
   "82b4593fbf3cda665ee36ccddefd75fcdc4533176c9cbe7abbeb9fcde8890d63")
  (:FILE "src/execution/writer.lisp" :SOURCE-SHA256
   "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/execution/writer.fasl"
   :FASL-SHA256
   "e239aa45c38e4a8228b3e0244a0e38b877cb8d6d67263c762656c94c8571c084")
  (:FILE "src/execution/worker-types.lisp" :SOURCE-SHA256
   "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/execution/worker-types.fasl"
   :FASL-SHA256
   "cb23c580f5da585e1ae0ef994c4be96298efb5a30c0dd11ea6f18d8094193ad7")
  (:FILE "src/execution/worker-run.lisp" :SOURCE-SHA256
   "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/execution/worker-run.fasl"
   :FASL-SHA256
   "a7cfa5864dce0e59f110dd89ac4de92f81adc6574d7fd5237ef27e1e7493032f")
  (:FILE "src/execution/worker-claim.lisp" :SOURCE-SHA256
   "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/execution/worker-claim.fasl"
   :FASL-SHA256
   "49fb807d2a006cdbdb6314bfe5716018623c5ffb4c5a1ff97a3d00ae22502c84")
  (:FILE "src/execution/worker-boundary.lisp" :SOURCE-SHA256
   "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/execution/worker-boundary.fasl"
   :FASL-SHA256
   "44a6be9356650152fc6988c1e956a954fa00e5b19facece587f8f3c1487f2430")
  (:FILE "src/execution/ready.lisp" :SOURCE-SHA256
   "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/execution/ready.fasl"
   :FASL-SHA256
   "ce36b6e5ae1b64461cb43cfaa5d02875a7a7c65cebb6549775d9e73de266d5e1")
  (:FILE "src/execution/ready-types.lisp" :SOURCE-SHA256
   "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/execution/ready-types.fasl"
   :FASL-SHA256
   "42ede5a752e3d2912a2f38d407e7a1afb16bd36e9bab488b927c2f30ba0b4fa7")
  (:FILE "src/execution/ready-recycle.lisp" :SOURCE-SHA256
   "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/execution/ready-recycle.fasl"
   :FASL-SHA256
   "23892bc9aa9c05378bf951fc1e6f5afda6c4e0a343726971a48e37afcdef6030")
  (:FILE "src/execution/queue.lisp" :SOURCE-SHA256
   "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/execution/queue.fasl"
   :FASL-SHA256
   "53d21c32d24b7ef476619cde7b3f10dbd1dfd5fb61d1b25dedea61c266ba8548")
  (:FILE "src/execution/package.lisp" :SOURCE-SHA256
   "833e501e6ee6e3acb8a6d37139c4605a05e06c425a35318adbcf651aa2f9db30" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/execution/package.fasl"
   :FASL-SHA256
   "2419b56ff41e01a38074bdc011e87e451632a58d7bf8062d91d80507ea354d63")
  (:FILE "src/execution/handoff.lisp" :SOURCE-SHA256
   "3ce9f47008416f210173fd3a83ee7665b2103f26039d36e2601b31e5e3ebd72a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/execution/handoff.fasl"
   :FASL-SHA256
   "938b9c6e63cd4dcb03eadcc33d031083e84539bffd1b0f6dbf3cb89bb52ef678")
  (:FILE "src/epochs/types.lisp" :SOURCE-SHA256
   "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/epochs/types.fasl"
   :FASL-SHA256
   "bd2dc8a614d457856e7fcb50ed1273907d7ff5f8c5f0140adfa2dc016d6854a5")
  (:FILE "src/epochs/retire.lisp" :SOURCE-SHA256
   "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/epochs/retire.fasl"
   :FASL-SHA256
   "9301adb433e1276898c7f4091af044d8e12f04394a49acf0827b67b03520eae1")
  (:FILE "src/epochs/reclaim.lisp" :SOURCE-SHA256
   "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/epochs/reclaim.fasl"
   :FASL-SHA256
   "c131819702a9c78d2d519d79f7413ffdfaef6901521a9eedbcb96ce9b4db1a97")
  (:FILE "src/epochs/read.lisp" :SOURCE-SHA256
   "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/epochs/read.fasl"
   :FASL-SHA256
   "53a03b8b0ecfebd36d7e1fead3e95e1a00000b0d16ada5638772f9c0f6ff4320")
  (:FILE "src/epochs/package.lisp" :SOURCE-SHA256
   "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/epochs/package.fasl"
   :FASL-SHA256
   "6f6afb547437ec465a55fd81ff04d65a4b7b1d70586504e85ae2d72de868e64d")
  (:FILE "src/epochs/core.lisp" :SOURCE-SHA256
   "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/epochs/core.fasl"
   :FASL-SHA256
   "4c3f49c4b7c9dc422d42695813c6295a9d6b86701a9a6f024c065db6c573dc1a")
  (:FILE "src/dispatch/types.lisp" :SOURCE-SHA256
   "cc44882c565a89de08f5add79333868ebfca4fc3f97bf9104d36375d014d4720" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/dispatch/types.fasl"
   :FASL-SHA256
   "617a7b1df94b514caf4a0b0a80351faa7e452c945eab186192a3292f67bef90b")
  (:FILE "src/dispatch/package.lisp" :SOURCE-SHA256
   "acb5fd19599e89e821a89bcca8f94064f33cdc71cdfcf204aadcd4fb52dd795f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/dispatch/package.fasl"
   :FASL-SHA256
   "c2d2d6b0c3b929b91eee6678065866db1be1f43cc6282184631d46482292b125")
  (:FILE "src/dispatch/claim.lisp" :SOURCE-SHA256
   "224e4114b8b91affced874bea9c23cae5c79526e8ddae62e31a0cafcbb763682" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/dispatch/claim.fasl"
   :FASL-SHA256
   "e232f478dbe6ee8794f6d912e8a508166022efc3a6b6fcebd89e97d07ebc6f0e")
  (:FILE "src/dispatch/build.lisp" :SOURCE-SHA256
   "c78d31a753db78baea520e9ea0cccf6e88cad9cca8bc75261a6ff26c2ac01fe5" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/dispatch/build.fasl"
   :FASL-SHA256
   "714a8fc6c12b6820b2204028137de6aec5ffd144253624ac6889c497d72f8a25")
  (:FILE "src/csn/registry.lisp" :SOURCE-SHA256
   "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/csn/registry.fasl"
   :FASL-SHA256
   "44235dad859314b085c58f837fc45c5bccb9eb3b74dd89f146b8c63b3bd4787e")
  (:FILE "src/csn/package.lisp" :SOURCE-SHA256
   "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/csn/package.fasl"
   :FASL-SHA256
   "7b91d148eea90f1bfbf0539dccd7b6004bb81b4e5d2eb40f30617bf93dede00b")
  (:FILE "src/control/types.lisp" :SOURCE-SHA256
   "ad2f45bcd44fed463d60b580a17d89192a1087177573b1633674ed68d252367d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/control/types.fasl"
   :FASL-SHA256
   "fa966287c1fcac3b1fbdc26aca10622b24f5f6cafd6316dcaaba723578f8c8b2")
  (:FILE "src/control/transfer.lisp" :SOURCE-SHA256
   "6e257bfb6ce8e6d11263cc6788de4fc35657a82e159af7b46341c3bb208e0275" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/control/transfer.fasl"
   :FASL-SHA256
   "56be07deb784f0ca4ae5913b31520775551bc1938e49d674df0071e7b44cd4ff")
  (:FILE "src/control/publication.lisp" :SOURCE-SHA256
   "3f867f54309b0a2985660dd8145b100eb097c1d7fdfcd917c61d73d082009109" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/control/publication.fasl"
   :FASL-SHA256
   "6aecd56cc7a86c04fabb2f2f0d015cb6c79fddf03b1ed764a63e5c4fea9872b3")
  (:FILE "src/control/publication-read.lisp" :SOURCE-SHA256
   "cfb12232748e62d1edef6896389e8d54057951c058ee43d70dd346b10c5f582e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/control/publication-read.fasl"
   :FASL-SHA256
   "7e83bca4bc1ee3f39632a4339d2e446c30336030a6cf69ad03a3fd252225e908")
  (:FILE "src/control/prepare.lisp" :SOURCE-SHA256
   "1226996af2215e3ebf06265e48d43632a1642ccacd312fabd983c5f3bfa7536d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/control/prepare.fasl"
   :FASL-SHA256
   "33d23e470cbdb1e496e3ed8d599c48962e086ffc0508ef1d92278c5245ff5b04")
  (:FILE "src/control/preflight.lisp" :SOURCE-SHA256
   "48326533ac0934cb3b1e3fc7657ef48f38912b6c08e9e38367301905f7711584" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/control/preflight.fasl"
   :FASL-SHA256
   "ca534629f01963b776419da4448eab8f5648afd015e3434c33e6d4f3e83b27d9")
  (:FILE "src/control/package.lisp" :SOURCE-SHA256
   "c6ca23c7b0a8cea48bec2b7017482802f2078b0d58414c6708fbfe5f7d46377d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/control/package.fasl"
   :FASL-SHA256
   "f933c6add3167dcdc9b01d6195abd6a56f219652c211b5d36ddfe03c790f51eb")
  (:FILE "src/control/dependency.lisp" :SOURCE-SHA256
   "f328344e4824fd53d03a0476b45fb87efada43ddee895e13afd76ac44413d128" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/control/dependency.fasl"
   :FASL-SHA256
   "c45469c39023939e593ea35076a4144e18282db710223e43e38817e2cd627b71")
  (:FILE "src/control/build.lisp" :SOURCE-SHA256
   "1904e81a6cebbb178598a41e1b2283240fc21506781b1e31da407610ce0f519c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/control/build.fasl"
   :FASL-SHA256
   "43c643a21fe034b092416685b6716b4f864fbd0bcabde5c1bf4971a7bd6288a9")
  (:FILE "src/codec/utf8.lisp" :SOURCE-SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/codec/utf8.fasl"
   :FASL-SHA256
   "3ae32603943c97c3c6c1a938a18e57f8ec7885578ff51d0b606bf29a6b2a962f")
  (:FILE "src/codec/package.lisp" :SOURCE-SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/codec/package.fasl"
   :FASL-SHA256
   "df8af5cd67cf127816ae8dc766744381a911c6f5b1d11943e006e6db56e04cf5")
  (:FILE "src/codec/cbor-write.lisp" :SOURCE-SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/codec/cbor-write.fasl"
   :FASL-SHA256
   "c8bddf3d07e992a354ed264bf343f81e674c7b4082decdf472962bef3f5c4ead")
  (:FILE "src/codec/cbor-string-write.lisp" :SOURCE-SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/codec/cbor-string-write.fasl"
   :FASL-SHA256
   "703166f629b2b81acc24a4407c680dbf3098f3adef8281dba1a96cf43c384bfb")
  (:FILE "src/codec/cbor-space.lisp" :SOURCE-SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/codec/cbor-space.fasl"
   :FASL-SHA256
   "bc59bd3009a3ffaaface0ad9c75d43280166df8fac405a83a09c24e5192fa60c")
  (:FILE "src/codec/cbor-simple-write.lisp" :SOURCE-SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/codec/cbor-simple-write.fasl"
   :FASL-SHA256
   "baece647bb202aef17b6c556355d2f2e3564fdf41327527af4b234cbed6048da")
  (:FILE "src/codec/cbor-scan.lisp" :SOURCE-SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/codec/cbor-scan.fasl"
   :FASL-SHA256
   "e2bfba7bdf54bc24e7567a2b1ee399ced863c3a63e5270eb5a6765bf509ff3b6")
  (:FILE "src/codec/cbor-scan-stack.lisp" :SOURCE-SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/codec/cbor-scan-stack.fasl"
   :FASL-SHA256
   "a6c0ff9cce47ee862e41497495ed60b682a4341f652f155c38c9ff8a56730dd2")
  (:FILE "src/codec/cbor-scan-minimal.lisp" :SOURCE-SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/codec/cbor-scan-minimal.fasl"
   :FASL-SHA256
   "6beb8b43443dc1ee7d6f9e463187a5b2349c77d184afd8183a17086cc167ea68")
  (:FILE "src/codec/cbor-scan-items.lisp" :SOURCE-SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/codec/cbor-scan-items.fasl"
   :FASL-SHA256
   "80aa8e580b958e49fae0b255e4a6e1f5670806b170b8fbd00aae2c310cf8d29e")
  (:FILE "src/codec/cbor-scan-input.lisp" :SOURCE-SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/codec/cbor-scan-input.fasl"
   :FASL-SHA256
   "6fd5325c15791a3be892fc7fe26852ada99a30bfe317594489bb51b1a71685ba")
  (:FILE "src/codec/cbor-package.lisp" :SOURCE-SHA256
   "f74f5d1cb0b71658aaeb36518530c2396d132a783cb58109788e434691acb503" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/codec/cbor-package.fasl"
   :FASL-SHA256
   "d629aba8d981f3a961d28026f3d059e26781e62901547fe5335a285148322eb8")
  (:FILE "src/codec/cbor-minimal.lisp" :SOURCE-SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/codec/cbor-minimal.fasl"
   :FASL-SHA256
   "2acc8aac19518739eb38cd2f92a0531cbc0e42edb9822d5e9d4f7a36760dcf54")
  (:FILE "src/codec/cbor-header.lisp" :SOURCE-SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/codec/cbor-header.fasl"
   :FASL-SHA256
   "35a4b585fd2c41c1dabb2047252e386bc9558f1744463168fbe62fb538546d83")
  (:FILE "src/codec/cbor-float-write.lisp" :SOURCE-SHA256
   "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/codec/cbor-float-write.fasl"
   :FASL-SHA256
   "53d2914c53776028c2f0e9b8486f56e8bc61c4d3bc51a66572215d3926ef4a3f")
  (:FILE "src/codec/cbor-float-narrow.lisp" :SOURCE-SHA256
   "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/codec/cbor-float-narrow.fasl"
   :FASL-SHA256
   "49f450ab9620a100909e5e2d3cec537699055761a314c3142487df5616d837df")
  (:FILE "src/codec/cbor-float-minimal.lisp" :SOURCE-SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/codec/cbor-float-minimal.fasl"
   :FASL-SHA256
   "05ebf23164493a149102ddddd4b830a15bca0d47867e8ebfa316d9151270a43b")
  (:FILE "src/codec/cbor-array-write.lisp" :SOURCE-SHA256
   "2f71d857991f32aacf6c7a0ecbe5e06bcba9289b20f46e496b3e3737ce6c242b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/codec/cbor-array-write.fasl"
   :FASL-SHA256
   "99e32e5e10dd67f9859903a966b08d50f318164e17e3a5752dc796e70eab4c82")
  (:FILE "src/codec/cbor-array-input.lisp" :SOURCE-SHA256
   "e36efda9d66f532b8221f898a078b7f77dc2a41cdc953ece0b2e08b4ed2417f4" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/codec/cbor-array-input.fasl"
   :FASL-SHA256
   "1cbc73d64a207b34d7429272513a576110b43f051e2d58407c99747f6e01eb2e")
  (:FILE "src/cache/write.lisp" :SOURCE-SHA256
   "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/cache/write.fasl"
   :FASL-SHA256
   "f4229281262c961192132edb3a0c5e37ea8958fd24daf921cca4979515a05107")
  (:FILE "src/cache/types.lisp" :SOURCE-SHA256
   "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/cache/types.fasl"
   :FASL-SHA256
   "7e81fccbb9f9375fca3dd74f166b87697f42a93a5b8b7cc271ed566041b62403")
  (:FILE "src/cache/read.lisp" :SOURCE-SHA256
   "5700e43ae8ee859e96bdecb5953af43a712fd9e6ec23a53565759676bb07f85a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/cache/read.fasl"
   :FASL-SHA256
   "ce6bc192450f7c2de901d23016dad1eddb82667eb8d9057743315e178c8533ad")
  (:FILE "src/cache/package.lisp" :SOURCE-SHA256
   "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/cache/package.fasl"
   :FASL-SHA256
   "99aea8cae57bb82b27c198caa82d85c74c6bf0d88adb3d20b5d5d6c8db2d1f6e")
  (:FILE "src/cache/core.lisp" :SOURCE-SHA256
   "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/cache/core.fasl"
   :FASL-SHA256
   "e62daa4f824d4434221e3ec5f9b0975d20c4a57bd3507b43fc5ad9628952f703")
  (:FILE "src/cache/clock.lisp" :SOURCE-SHA256
   "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/cache/clock.fasl"
   :FASL-SHA256
   "176341312bec35889362731c7dbb04002f3e72426f24a471ca58179d6d420372")
  (:FILE "src/cache/build.lisp" :SOURCE-SHA256
   "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/cache/build.fasl"
   :FASL-SHA256
   "d6c5a29a26556a0dd9aa7a08ec904e2150ddab89e243e63b42a66caed23e6bd6")
  (:FILE "src/active/types.lisp" :SOURCE-SHA256
   "48fe584096fc253ef182ab428c1887e443af06d75aaa938df660c77e60b39bfb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/active/types.fasl"
   :FASL-SHA256
   "0e50a6157e564b9e703699fe8e875323931759bfd9938c441bf1fa88fed8bb8d")
  (:FILE "src/active/source.lisp" :SOURCE-SHA256
   "ff96fe360b46190ecc08ee9e05a813715dc3399054f93693f9309012aec6547d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/active/source.fasl"
   :FASL-SHA256
   "1d92a1719549d8998308ea1f7e2553d8366fe5825a34638aee289ae2c7b96a1b")
  (:FILE "src/active/prepare.lisp" :SOURCE-SHA256
   "7b45fb01132c45c9bec76f374edaa8de91ac6bb2d61ae5c359e1fa10c6346f53" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/active/prepare.fasl"
   :FASL-SHA256
   "723fcf9de8fdaa4a6b6136ac35882550cadd0b2df67e4eee234b51f56a17aec1")
  (:FILE "src/active/preflight.lisp" :SOURCE-SHA256
   "ef7b592daecc223d78cbcda138b5938abc01593b486482bec06f2721cfd955a2" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/active/preflight.fasl"
   :FASL-SHA256
   "81ca6a98970f0603700e18a32f59504fddc0f6183de613e90b40b583f8ea937b")
  (:FILE "src/active/package.lisp" :SOURCE-SHA256
   "4a6fa4187ef5d44aec4e65d57ee6d6046485f283cc9009c1d94263bee745fa3b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-pristine-event-generation/fasl/src/active/package.fasl"
   :FASL-SHA256
   "12471c0c11a42d0a726c2a422aa89342d4028cde83eae71a84145da1b3a3f43d"))
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
  "src/io/identity.lisp" "src/io/lifecycle.lisp" "src/io/namespace.lisp"
  "src/io/native-namespace.lisp" "src/io/native.lisp" "src/io/package.lisp"
  "src/io/rename.lisp" "src/io/transfer.lisp" "src/io/types.lisp"
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
   "TEST-REQ-AFF-004-SERIES-BOOTSTRAP-NIL-STALE-AND-REPEATED-BEFORE-EFFECT"))
 :FAILED-TEST
 ("ARCDOCDB.SERIES.TESTS"
  "TEST-REQ-AFF-004-SERIES-BOOTSTRAP-VIRGIN-GUARDS-AND-EXISTING-READER-ROOT")
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
 "07eb718b584e29414257819f508a423c6863d726ea03936ff1dc4f20e108a630"
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
