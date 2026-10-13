(:FINISHED-AT-UNIVERSAL-TIME 4000914690 :CONFIG-SHA256-AFTER
 "40aad4a68df10a18fae51698bf2620e32823a9b8ade0233e030da74cd0bc152c"
 :CONDITION-TYPE "SIMPLE-ERROR" :DIAGNOSTIC "Asserzione fallita: (HANDLER-CASE
                     (PROGN
                      (ECASE ARCDOCDB.GET.DIRECTORY.TESTS::FACTORY
                        (:RESOLVER
                         (ARCDOCDB.GET.RESOLVER:INIZIALIZZA-RADICE-GET-ATTIVA
                          (ARCDOCDB.GET.DIRECTORY.TESTS::DIRECTORY-SERIES-FIXTURE-SOURCE
                           ARCDOCDB.GET.DIRECTORY.TESTS::FIXTURE)
                          (ARCDOCDB.GET.DIRECTORY.TESTS::DIRECTORY-SERIES-FIXTURE-LEASE
                           ARCDOCDB.GET.DIRECTORY.TESTS::FIXTURE)))
                        (:DIRECTORY
                         (ARCDOCDB.GET.DIRECTORY:INIZIALIZZA-FONTI-GET-ATTIVE
                          (ARCDOCDB.GET.DIRECTORY.TESTS::DIRECTORY-SERIES-FIXTURE-SOURCE
                           ARCDOCDB.GET.DIRECTORY.TESTS::FIXTURE)
                          (ARCDOCDB.GET.DIRECTORY.TESTS::DIRECTORY-SERIES-FIXTURE-LEASE
                           ARCDOCDB.GET.DIRECTORY.TESTS::FIXTURE)
                          (ARCDOCDB.GET.DIRECTORY.TESTS::DIRECTORY-SERIES-FIXTURE-SOURCES
                           ARCDOCDB.GET.DIRECTORY.TESTS::FIXTURE))))
                      NIL)
                     (ARCDOCDB.CONDITIONS:INVALID-ARGUMENT (CONDITION)
                      (EQ (ARCDOCDB.CONDITIONS:ERROR-REASON CONDITION)
                          :ACTIVE-SOURCE-FILE)))"
 :SCHEMA-VERSION 1 :KIND :GET-ACTIVE-INIT-MUTATION-CHILD :STATUS :FAILED :PHASE
 :TESTS :COMPILED T :SUITE-COMPILED T :COMPILED-FILES
 ((:FILE "tests/wal/support.lisp" :SOURCE-SHA256
   "90a47539e5e2898c0a08059207f30bb5551e7ca8fc166f8f6ce7b95afa757295" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/wal/support.fasl"
   :FASL-SHA256
   "a8e728efeca59242d500232f12aaff932ceb11a404a8aec28184921a586ef6cc")
  (:FILE "tests/wal/native.lisp" :SOURCE-SHA256
   "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/wal/native.fasl"
   :FASL-SHA256
   "df893e7e2f76c7a4f35f56d3148df2c7fc90d7e0ff0cccaacda3f0e9f0038b73")
  (:FILE "tests/wal/group.lisp" :SOURCE-SHA256
   "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/wal/group.fasl"
   :FASL-SHA256
   "16a8ab12b96429eeb42bc6b2be29cbce6c97ad1d01356d764043f2337ef4e4c1")
  (:FILE "tests/wal/fault.lisp" :SOURCE-SHA256
   "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/wal/fault.fasl"
   :FASL-SHA256
   "edaf76947b04875ae363663f3b3744e83f201561289a19e27c2d127485a13122")
  (:FILE "tests/wal/csn.lisp" :SOURCE-SHA256
   "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/wal/csn.fasl"
   :FASL-SHA256
   "64cf11aa8b48916b46f12d475beacca2134a7fbcb699db1fcdeb4c1ce7ff7980")
  (:FILE "tests/wal/csn-threads.lisp" :SOURCE-SHA256
   "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/wal/csn-threads.fasl"
   :FASL-SHA256
   "5f8b945832aa3c29c8b3587afeacd1d13b9da3ab5a6c3e6ca6631997fdb724e5")
  (:FILE "tests/wal/builder.lisp" :SOURCE-SHA256
   "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/wal/builder.fasl"
   :FASL-SHA256
   "b1be3a7831a314a3d6b48b87a21333813733f41a7799ce5325aedd90a73e1d96")
  (:FILE "tests/storage/support.lisp" :SOURCE-SHA256
   "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/storage/support.fasl"
   :FASL-SHA256
   "b97af3e771b7f7140ba2519e1608d79f6032ba565462253a330ee450bbbda2ff")
  (:FILE "tests/storage/segment-header.lisp" :SOURCE-SHA256
   "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/storage/segment-header.fasl"
   :FASL-SHA256
   "72184f41d0c7cad96b9f135c9193819ab1afd9d79a07e6000a93246fda4e4abf")
  (:FILE "tests/storage/log-header.lisp" :SOURCE-SHA256
   "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/storage/log-header.fasl"
   :FASL-SHA256
   "7b32fe9e31324cc826f13e3b72e177011704001457f01cdff9cb2f8ec27c7608")
  (:FILE "tests/storage/control-payload.lisp" :SOURCE-SHA256
   "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/storage/control-payload.fasl"
   :FASL-SHA256
   "32c65b3d89cc5a2b3338a31923d9f52f490c42be9c65971c55a84c8a757d0968")
  (:FILE "tests/storage/compaction-scan.lisp" :SOURCE-SHA256
   "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/storage/compaction-scan.fasl"
   :FASL-SHA256
   "c40c6006184ebc62e9653fdf20736cb100d7d131270bdba51a294e7ac855f938")
  (:FILE "tests/smoke.lisp" :SOURCE-SHA256
   "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/smoke.fasl"
   :FASL-SHA256
   "9fc18335b1d7202f376dcdc479aa73c09e565a0ad194f67634703538fb456b4e")
  (:FILE "tests/series/worker-routing.lisp" :SOURCE-SHA256
   "f495d33f73e3249d1055ea61d65034033367de85edec3db2cac3a63ff449e3f9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/series/worker-routing.fasl"
   :FASL-SHA256
   "dc328ae3d6e97fe882214a552b96aa4aaa5a92cfbd8bc989f364e32461341b8c")
  (:FILE "tests/series/worker-bridge.lisp" :SOURCE-SHA256
   "c1ee49702e63978a83cb86c4e5bf437a5a40e48fa02b65d3eaf3dca0d2e39176" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/series/worker-bridge.fasl"
   :FASL-SHA256
   "4056fd46392d7bf868a0e3e3f5a1b8881ee93221647771e88df5f1664d105988")
  (:FILE "tests/series/threads.lisp" :SOURCE-SHA256
   "b8fe9d7e1c0ca4e18909a0a6f7ac03c8df68dd186fa21e62600be685d6e4c7ae" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/series/threads.fasl"
   :FASL-SHA256
   "5844f275ec29bd23d1f19139707131f0c920b1345406c9bbd8f9ce3fd15c454e")
  (:FILE "tests/series/support.lisp" :SOURCE-SHA256
   "810dd8a69927c75e3399af47b8fff18e4ab88eb41049c50bafee5c041be263b3" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/series/support.fasl"
   :FASL-SHA256
   "fea302187ba4e5c49137794a554cb0bb09ddfaff0182283ebaa644c5f559ef6d")
  (:FILE "tests/series/controller.lisp" :SOURCE-SHA256
   "8bc98ec62e58803cab5613210e1200e0ce296af9aff63b5dff61579c3931670a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/series/controller.fasl"
   :FASL-SHA256
   "14bdf0f3cbd4d333bd7c2f754efa843ff3d3923f567237c48ff4ae959425c289")
  (:FILE "tests/series/boundaries.lisp" :SOURCE-SHA256
   "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/series/boundaries.fasl"
   :FASL-SHA256
   "5b666b23468feeac2921a59baff15a3f7eb3a458101217ba943a60efaca1726b")
  (:FILE "tests/scheduler/support.lisp" :SOURCE-SHA256
   "300234f9ac7931f8c8b9bf305498a2742a3b8868dd9158dbab8c7fdceed5a1e4" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/scheduler/support.fasl"
   :FASL-SHA256
   "165a833e4a74a630dc04d81e28fca5249b1c6ac076cd0948ea2f58d66d46027c")
  (:FILE "tests/scheduler/lifecycle.lisp" :SOURCE-SHA256
   "eff59c0cf6d9c6c1ddec57a4efa26a8fcaeedc850b77764b818bc1c22eb73e38" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/scheduler/lifecycle.fasl"
   :FASL-SHA256
   "e674232af6be4fb511b01f5161bf675e1a456db05cade5824bb1611678a32277")
  (:FILE "tests/scheduler/controller.lisp" :SOURCE-SHA256
   "e986e3facc9d1b9b4eab0d135259a61d7e0f188a7f268cb2e5ee5f9c700c40be" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/scheduler/controller.fasl"
   :FASL-SHA256
   "5899bc47b9b834ec3515c49a0deff59d2fe814888bc45616929d85dc57faafa1")
  (:FILE "tests/recovery/support.lisp" :SOURCE-SHA256
   "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/recovery/support.fasl"
   :FASL-SHA256
   "02bbb80a5e4d3dc510b905a01e2b5e570dd530c83e3c8fc4627c18bda88079a2")
  (:FILE "tests/recovery/scan.lisp" :SOURCE-SHA256
   "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/recovery/scan.fasl"
   :FASL-SHA256
   "730b2358f9ac27ed4f7e19031dc1b33e4a3f2505be0ac3a498167fc75a8ca857")
  (:FILE "tests/recovery/manifest.lisp" :SOURCE-SHA256
   "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/recovery/manifest.fasl"
   :FASL-SHA256
   "6ff0221c6e1295882fe168f79e5fb8a112fedef939161090c1ea611ea214cc89")
  (:FILE "tests/recovery/manifest-support.lisp" :SOURCE-SHA256
   "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/recovery/manifest-support.fasl"
   :FASL-SHA256
   "2b5ee18669e76ad26310b36aa4d8ca81a7dc29aca3b864e6b6839c208359a689")
  (:FILE "tests/recovery/manifest-audit.lisp" :SOURCE-SHA256
   "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/recovery/manifest-audit.fasl"
   :FASL-SHA256
   "84d223a5b4704e2b9e9e4f7a0a8f3385b24d395eeba71c0fad459459b6a98799")
  (:FILE "tests/recovery/inventory.lisp" :SOURCE-SHA256
   "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/recovery/inventory.fasl"
   :FASL-SHA256
   "1b47897de02038dc1645abbdb4f6e0ae5a34a724a58c3a454eee4a021281c382")
  (:FILE "tests/recovery/inventory-support.lisp" :SOURCE-SHA256
   "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/recovery/inventory-support.fasl"
   :FASL-SHA256
   "2299acd4d8c92f189658aaf71b1e63fe805f0e1a6c920822406be6eed6b892c8")
  (:FILE "tests/recovery/decisions.lisp" :SOURCE-SHA256
   "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/recovery/decisions.fasl"
   :FASL-SHA256
   "3441ab2df8c356b0c897d7cda2cad343c557e8655a192cd767ba2798c9bf8ade")
  (:FILE "tests/recovery/decisions-support.lisp" :SOURCE-SHA256
   "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/recovery/decisions-support.fasl"
   :FASL-SHA256
   "afb7e594330f101a93f6c65e00b03f7c86e0361169f0119704bc6582333df102")
  (:FILE "tests/recovery/decisions-radix.lisp" :SOURCE-SHA256
   "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/recovery/decisions-radix.fasl"
   :FASL-SHA256
   "be9d7d6692565dc665cf747db3c2aee4789bd3bb70402e9d17c5996c70e82b57")
  (:FILE "tests/recovery/decisions-audit.lisp" :SOURCE-SHA256
   "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/recovery/decisions-audit.fasl"
   :FASL-SHA256
   "7b91d965ebd1c3a7df655a2dd891b48a3b049dad9d5f1e8519588634874612eb")
  (:FILE "tests/recovery/corruption.lisp" :SOURCE-SHA256
   "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/recovery/corruption.fasl"
   :FASL-SHA256
   "6a7c3d05a1992e745d79417e7fcfdda2343d7e0d5c24aa5a4a31c7473cdb866e")
  (:FILE "tests/read/threads.lisp" :SOURCE-SHA256
   "e2e223b69b08a5d76b9773c6ad4dee13ef2ddbb6f5ababa713cc5654bc7b51c5" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/read/threads.fasl"
   :FASL-SHA256
   "b3c707df8d5d5900aa8a41295d8ba5404fea559dfab3acf371218dba06d45dd1")
  (:FILE "tests/read/support.lisp" :SOURCE-SHA256
   "8095cc39d49342f6e43f3421b4fced839da02d8d11b4d8ddcd91bd346447e754" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/read/support.fasl"
   :FASL-SHA256
   "67d13e7dbaab7eaa1cf6d9ca3107dc5075632c100e1e5573b648caf2322a336d")
  (:FILE "tests/read/lifecycle.lisp" :SOURCE-SHA256
   "c4c4642408816f2e0e809e21d04739b68b9391237e3e46ea0b195ed82857c3a8" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/read/lifecycle.fasl"
   :FASL-SHA256
   "2572d9e2a784d02deeb8deacda162d00697118854517f6c468027a0cc5ed9f54")
  (:FILE "tests/mvcc/support.lisp" :SOURCE-SHA256
   "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/mvcc/support.fasl"
   :FASL-SHA256
   "727f94c870192e44ea54d190271956df7a6738b82d6183b2fb0cce74b779cf6c")
  (:FILE "tests/mvcc/lifecycle.lisp" :SOURCE-SHA256
   "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/mvcc/lifecycle.fasl"
   :FASL-SHA256
   "b0224a53bd016fa8f9ff5e2f85fc0f3a9239b2e7debef0fadb8c351107a75a13")
  (:FILE "tests/mvcc/capture.lisp" :SOURCE-SHA256
   "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/mvcc/capture.fasl"
   :FASL-SHA256
   "9de1e848a8c665de7048c428754a8dcfd434c7119d116715703d79eb3129b172")
  (:FILE "tests/io/transfer.lisp" :SOURCE-SHA256
   "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/io/transfer.fasl"
   :FASL-SHA256
   "c38aa54aae5eb20e8d7610cdc0257ff5b2006b1ab91e529e6b4982ace508e3ae")
  (:FILE "tests/io/support.lisp" :SOURCE-SHA256
   "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/io/support.fasl"
   :FASL-SHA256
   "58748c230e8e58b2ca7be3efa6417dcb1cc5075690fda23c34bc789470fa80f2")
  (:FILE "tests/io/native.lisp" :SOURCE-SHA256
   "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/io/native.fasl"
   :FASL-SHA256
   "80105c46480a5462252c493a69b615dd69c12d1e0b06c8cf79244998389a9d13")
  (:FILE "tests/index/slots.lisp" :SOURCE-SHA256
   "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/index/slots.fasl"
   :FASL-SHA256
   "352dc0b0a4b5cb9ae5b1e2d8d29ce3c23d2fb18e7861b07832d0eeaf5a8aa7fa")
  (:FILE "tests/index/slot-threads.lisp" :SOURCE-SHA256
   "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/index/slot-threads.fasl"
   :FASL-SHA256
   "b5f3e5d27fa154acbc2ba8af119c19d21540420e742d6e9287616ae80191cab9")
  (:FILE "tests/index/slot-support.lisp" :SOURCE-SHA256
   "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/index/slot-support.fasl"
   :FASL-SHA256
   "dd909f23a1f87b4e7164c74165b780e590f22e717b97ff4e5e7e00eee8055ac9")
  (:FILE "tests/index/rebuild.lisp" :SOURCE-SHA256
   "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/index/rebuild.fasl"
   :FASL-SHA256
   "327c89b48ec45ec1406456688bfc2aa9ad050879562a4db8f56f5a5fa221813f")
  (:FILE "tests/index/primary.lisp" :SOURCE-SHA256
   "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/index/primary.fasl"
   :FASL-SHA256
   "4a5cd27e87594e8eaa69778dd97960b4a2ad04582c3abef9f7cd9c326ed211f1")
  (:FILE "tests/index/primary-threads.lisp" :SOURCE-SHA256
   "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/index/primary-threads.fasl"
   :FASL-SHA256
   "e26dd6eaefced546a817ea2c8a374e59941394e664b5ba8705f3decd27b93f19")
  (:FILE "tests/index/primary-support.lisp" :SOURCE-SHA256
   "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/index/primary-support.fasl"
   :FASL-SHA256
   "8ac70d4a4bc18d6191879b714c21bd4048929313be8e0dc52153eaefec70f999")
  (:FILE "tests/index/hash-digests.lisp" :SOURCE-SHA256
   "3b3b39f861883cf2017cab8e6488560a6bb3897d63784f00e820a6450d743225" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/index/hash-digests.fasl"
   :FASL-SHA256
   "9a9e0c997e64a69c89cde351df2c991af4bdaa4f47c250787072e1eb5485feef")
  (:FILE "tests/hash/threads.lisp" :SOURCE-SHA256
   "3fc587a57d26a294aebfc6a7aeadf2f61a42a21106c1c57517f891b76b4e750a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/hash/threads.fasl"
   :FASL-SHA256
   "421101f06a20da252b68ee51b91c077927cf304a483935601d988e07440754b6")
  (:FILE "tests/hash/support.lisp" :SOURCE-SHA256
   "0fae9dc36976af544f83e6051b9cf9d67c9bef0b9e25f1fa2a48fdac48592acb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/hash/support.fasl"
   :FASL-SHA256
   "d06d60feee4729969e393fbc26abb97c052af4a4c208763bc6d9b76a174e763e")
  (:FILE "tests/hash/hash64.lisp" :SOURCE-SHA256
   "70606bc68807143cfea9583871474c84efc868d13692cde28488284dee43e0f1" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/hash/hash64.fasl"
   :FASL-SHA256
   "d8e86babbf745cddd19b63741534c579f69f1f558dffa725df523de19fb9cfd3")
  (:FILE "tests/hash/guards.lisp" :SOURCE-SHA256
   "9af5b38443a57d224990a68e93f12f7a4cda306f94c7ccd3ccb50635865d7864" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/hash/guards.fasl"
   :FASL-SHA256
   "89a49e6b325844be282c8a263c5d9d69d3dec0fae313e7da4d877160245072b3")
  (:FILE "tests/get/support.lisp" :SOURCE-SHA256
   "21f0da34755882f7dcc3ee760528ca39d4731e1a79ea94525c62753b7f60422c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/get/support.fasl"
   :FASL-SHA256
   "18b07082664a2677074066451d178bf24d19b6e819850a98fcdd6f1ed9df25c7")
  (:FILE "tests/get/segment.lisp" :SOURCE-SHA256
   "e9722f419ce0810c98c28d0e1a74da85d52346a0befff40c1119934519fc6f98" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/get/segment.fasl"
   :FASL-SHA256
   "9d0f8a54efd45ff30e8dcbb0a62cd787ed7211abf31cdd41be37bedaad5f03ad")
  (:FILE "tests/get/lifecycle.lisp" :SOURCE-SHA256
   "73bf87c2aee7b537dba31fc0ae554272f7d2be5a4c1e9e96ea2f21a17f6f71f5" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/get/lifecycle.fasl"
   :FASL-SHA256
   "be607d1f879ee2bf836c2832973f0ca3192be80f0b85c11e3326e81121941304")
  (:FILE "tests/get-resolver/support.lisp" :SOURCE-SHA256
   "d30a5c8a61b63e339facfee9f7701eb5a3614bbfd1ebef2c46c747d136640f8b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/get-resolver/support.fasl"
   :FASL-SHA256
   "0927a7caa317c4708e2683abc7c4f812b4d9d914f73eb8d7500c59915e13fd18")
  (:FILE "tests/get-resolver/sort.lisp" :SOURCE-SHA256
   "fd7f97f0fad2e970b972688481c0c132f11c85f5fdcd0f02bee6b0b3f93b97ae" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/get-resolver/sort.fasl"
   :FASL-SHA256
   "b9f270a4247cbc227d8101f7a7ea07fdbb5d66021874a4e41380791afccdb0b6")
  (:FILE "tests/get-resolver/read.lisp" :SOURCE-SHA256
   "70e46d1b88716f44309f46b4955928ca7fa2195edd80bb67d5b97732b971e8fb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/get-resolver/read.fasl"
   :FASL-SHA256
   "443a248f9c850fb25848f3dac96d6a65f65c7aadbd5b8468c04b65babce91dcc")
  (:FILE "tests/get-resolver/construction.lisp" :SOURCE-SHA256
   "45cbef3b35db35d60a4cec2516c24f6ef56f5edb2f19f6f07f24fe00c8737b13" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/get-resolver/construction.fasl"
   :FASL-SHA256
   "45227027b6d83c259f563086f580cc17a14615483b6d1fbebfae66ac6cca0069")
  (:FILE "tests/get-performance/threads.lisp" :SOURCE-SHA256
   "05ace5eb351ab49da59611dc1a2a5abedb9d723a2fc6e75a30fc76e507573a90" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/get-performance/threads.fasl"
   :FASL-SHA256
   "6732e5b16c3a987de850ce37f93fdb5e9699ec0354297bf2232c6c778acb18b6")
  (:FILE "tests/get-performance/support.lisp" :SOURCE-SHA256
   "e586ed94dcb2aaba00282931cdd83313e4f84a86d4d1ba85e2d56e8b7433ed8d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/get-performance/support.fasl"
   :FASL-SHA256
   "9c083d2cea24e7f91af4291d33987a5592541c02000c142e9c21120029e192ce")
  (:FILE "tests/get-performance/paths.lisp" :SOURCE-SHA256
   "3b8d2c9c93467507ea2bb471d42192eb1fa084b55c0f4263b5ef0d3acf468f55" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/get-performance/paths.fasl"
   :FASL-SHA256
   "b056e5aa3be1fe5fef572580eeb927361dd5e711f4ca059fdf81490d23342b64")
  (:FILE "tests/get-performance/guards.lisp" :SOURCE-SHA256
   "c41721b917ed443355ea3707efdd07e7da53a978c0515ab1e5ede5fcc47d63fc" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/get-performance/guards.fasl"
   :FASL-SHA256
   "286e2ee4dab4677f9119ba7d6d2aa9cad60d6b0b4ba6db6ffa7b7bb81066f57a")
  (:FILE "tests/get-directory/threads.lisp" :SOURCE-SHA256
   "e6a93ec22bc6f5a31b37ae99d927d1ca3a53893adb2eae21cd89d132a82d1f64" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/get-directory/threads.fasl"
   :FASL-SHA256
   "7a539e7120855745982c162c44d93742ba7a024c097083b46462159e5169f00c")
  (:FILE "tests/get-directory/support.lisp" :SOURCE-SHA256
   "be3a216a6ec597b63186b6bf3d3e35f3327f3001b1c00535d64b10bcb5d9fe85" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/get-directory/support.fasl"
   :FASL-SHA256
   "a1e348f939e4a3f0174d17b78c0044d8206fefe031b60b0f319bf4a764d5a166")
  (:FILE "tests/get-directory/series-support.lisp" :SOURCE-SHA256
   "40f15fbdf42b80515cbfc57eb74bedcbd96d4a9e7e19dc25d8db59f326fe659a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/get-directory/series-support.fasl"
   :FASL-SHA256
   "2cee9bdb1281d80f17d0bac9e6d753d047ec7f9f5511f243960dec88cdb90a5c")
  (:FILE "tests/get-directory/series-read.lisp" :SOURCE-SHA256
   "4b9856d69cd82c1462c87d16b9eb8e00fb642a46bb22f2f7b01865f7cc2a83a4" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/get-directory/series-read.fasl"
   :FASL-SHA256
   "8a3355f945d340cf99f3502dc84a915adc941f06e7e969eb3c36a252f4e12f84")
  (:FILE "tests/get-directory/read.lisp" :SOURCE-SHA256
   "a222541b6413bb93ff86a269273f1fa15bfad0d1e4072fc058b023fec5143280" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/get-directory/read.fasl"
   :FASL-SHA256
   "7f66e74f121257725c099e608170b13061079a12413dc5ba6e035b5a33363f99")
  (:FILE "tests/get-directory/construction.lisp" :SOURCE-SHA256
   "4ce9aa7064793e908008b9e1055c1e2527d5071006782ea956509c28e8c712d7" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/get-directory/construction.fasl"
   :FASL-SHA256
   "dbd262afd0e3abf7c98e3fe7f4fd5859e4f45a53fd37607d90574113730c35b8")
  (:FILE "tests/foundation/support.lisp" :SOURCE-SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/foundation/support.fasl"
   :FASL-SHA256
   "63d57dc21f4dd65c0cbcf8391f3115713e1778e87d028d90263b0a6f31a15231")
  (:FILE "tests/foundation/record.lisp" :SOURCE-SHA256
   "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/foundation/record.fasl"
   :FASL-SHA256
   "aa4f0d3e36f1e2c4a43b512c64a695c377e516f712ac950d06beedbb01020ba2")
  (:FILE "tests/foundation/binary.lisp" :SOURCE-SHA256
   "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/foundation/binary.fasl"
   :FASL-SHA256
   "15d1b75da8c1d4aade701b8b38e6b3cb4a47cd67c86b8342f554b9b6d612bcb2")
  (:FILE "tests/foundation/batch.lisp" :SOURCE-SHA256
   "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/foundation/batch.fasl"
   :FASL-SHA256
   "da369c9a004d87ae352e7a5ff2620cfb4b6fceb7004eda38d067aceb576920ef")
  (:FILE "tests/execution/worker.lisp" :SOURCE-SHA256
   "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/execution/worker.fasl"
   :FASL-SHA256
   "54f34e35ab5bc41b95961d512184849f607b6c9641b298c46790f913cb14eaaf")
  (:FILE "tests/execution/threads.lisp" :SOURCE-SHA256
   "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/execution/threads.fasl"
   :FASL-SHA256
   "0a1fee4adb61c26bd4748e1a0b80a5eb0710f51098ee0b7853fdd8abc3ea3e59")
  (:FILE "tests/execution/support.lisp" :SOURCE-SHA256
   "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/execution/support.fasl"
   :FASL-SHA256
   "5350f48817adbfb96dbb73072435e88304633463be5baa42ebd5736a6c76029c")
  (:FILE "tests/execution/ready.lisp" :SOURCE-SHA256
   "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/execution/ready.fasl"
   :FASL-SHA256
   "f0c6b829926d9d628409d7cfb91a7cc129bfef19dc8012d56b65335e16f2f8ac")
  (:FILE "tests/execution/ready-recycle.lisp" :SOURCE-SHA256
   "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/execution/ready-recycle.fasl"
   :FASL-SHA256
   "73aa3f1a73bfb9395e4cc3447ca31d09e4ef5a2be7862f0d76f4cbbd4654a16e")
  (:FILE "tests/execution/queue.lisp" :SOURCE-SHA256
   "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/execution/queue.fasl"
   :FASL-SHA256
   "265b793e81ee588f574d5dee50aa7905534ac416106649b284c68db93499c78b")
  (:FILE "tests/execution/handoff.lisp" :SOURCE-SHA256
   "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/execution/handoff.fasl"
   :FASL-SHA256
   "235e23e0bde1e24be3367bc7e33b6e83224617f6ba1a5b22ed4c37a9b343aaf2")
  (:FILE "tests/epochs/threads.lisp" :SOURCE-SHA256
   "54b73e06c61e64f32a3e3af0791891dacb6590e929163dcf0fac95f2c71e66fd" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/epochs/threads.fasl"
   :FASL-SHA256
   "d67401ff93e6f3afb0e4ee2c5e6440408401068ba6782886854ba885fb603752")
  (:FILE "tests/epochs/support.lisp" :SOURCE-SHA256
   "366be7af4bf6c4ed946b3fa9e97aea6b034c83e3b757d81c54078dc76d229b6d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/epochs/support.fasl"
   :FASL-SHA256
   "76e3452017dfa49767380569cb3a5ab6bd829e2551da3ea473b752a51a6d2bb8")
  (:FILE "tests/epochs/lifecycle.lisp" :SOURCE-SHA256
   "ddc2fbdad9f97d2e4ff008c167776a50b17b742398306fbd5198dca474559cbf" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/epochs/lifecycle.fasl"
   :FASL-SHA256
   "abec94fd48c0ae8c52eb260d354b0b5db7ee54b81d47b3949e0731d679fd90da")
  (:FILE "tests/csn/threads.lisp" :SOURCE-SHA256
   "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/csn/threads.fasl"
   :FASL-SHA256
   "18b5ace3eab3eb77600adb9c8824bcd88c0455066afc6ee5e7a2743d3abd679a")
  (:FILE "tests/csn/support.lisp" :SOURCE-SHA256
   "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/csn/support.fasl"
   :FASL-SHA256
   "4415748de351e5774a8fd9f1da01569e706e8a6a0fc32470c9687e287aea967e")
  (:FILE "tests/csn/registry.lisp" :SOURCE-SHA256
   "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/csn/registry.fasl"
   :FASL-SHA256
   "3c1c1c2038089c5fdee5f43f226ffdf15f5dc1ccfb980f4067369d4b78db1b87")
  (:FILE "tests/codec/utf8.lisp" :SOURCE-SHA256
   "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/utf8.fasl"
   :FASL-SHA256
   "04b159f7130a356ac6bb2351d9df756c1301ddcbb679ca26a085503e356cef20")
  (:FILE "tests/codec/threads.lisp" :SOURCE-SHA256
   "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/threads.fasl"
   :FASL-SHA256
   "ce05dd81c399a03d61813f76adc5dd96acc81c9271fc2f41250f8fa22116080b")
  (:FILE "tests/codec/support.lisp" :SOURCE-SHA256
   "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/support.fasl"
   :FASL-SHA256
   "26c5af8ad29fdade3a748d8e90a0f3d8db2536676c0007b123710cf0c3cbe210")
  (:FILE "tests/codec/cbor-write.lisp" :SOURCE-SHA256
   "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-write.fasl"
   :FASL-SHA256
   "0159ac607c05c1e99507fbdd36f64ae4e551555bf7df3bae6a87c1e8fa97140f")
  (:FILE "tests/codec/cbor-write-threads.lisp" :SOURCE-SHA256
   "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-write-threads.fasl"
   :FASL-SHA256
   "ba04ab840ae6d4b0cbdacac08ce3fb90f1218ffb03833b91aeeccf131aa0f448")
  (:FILE "tests/codec/cbor-write-support.lisp" :SOURCE-SHA256
   "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-write-support.fasl"
   :FASL-SHA256
   "f2083eaf064f15f452ea78b89c50f0b2b8629121b5ad919e985d879fe2a202cd")
  (:FILE "tests/codec/cbor-write-roundtrip.lisp" :SOURCE-SHA256
   "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-write-roundtrip.fasl"
   :FASL-SHA256
   "a4dc89a71fba2c0b6505e09eb596f681fe9c667d797a9aeca668680dd924588f")
  (:FILE "tests/codec/cbor-threads.lisp" :SOURCE-SHA256
   "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-threads.fasl"
   :FASL-SHA256
   "e8a9e2744c0c93953f16f1a19d3169abaa234de3824df96a0a157e6beff0c7fb")
  (:FILE "tests/codec/cbor-support.lisp" :SOURCE-SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-support.fasl"
   :FASL-SHA256
   "ad48b121e7b34fa51ba3fbce235134ccd770414e80783b35a74a7bf8f54537ac")
  (:FILE "tests/codec/cbor-structure.lisp" :SOURCE-SHA256
   "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-structure.fasl"
   :FASL-SHA256
   "a041fd2a6826323574340f222dfa1ec66a43af4c45fcd5b485602b61b2f759ff")
  (:FILE "tests/codec/cbor-structure-threads.lisp" :SOURCE-SHA256
   "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-structure-threads.fasl"
   :FASL-SHA256
   "9eeb1a86dbe56fbdf25b1cdd53deebed34939211e6453888534c44f9186820bc")
  (:FILE "tests/codec/cbor-structure-support.lisp" :SOURCE-SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-structure-support.fasl"
   :FASL-SHA256
   "840efc421ae572f64f6415d5bd19974a892deaf09e139b9dabf626e57328f2fc")
  (:FILE "tests/codec/cbor-string-write.lisp" :SOURCE-SHA256
   "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-string-write.fasl"
   :FASL-SHA256
   "2fbdcab74d99400293be45fda6cd1ed12a7836c6289cdee7637ec7a0fc4d545b")
  (:FILE "tests/codec/cbor-string-write-threads.lisp" :SOURCE-SHA256
   "8e07b881a55e2554a429f1c8b2c69f67862ac015217d90d019167d636564d27d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-string-write-threads.fasl"
   :FASL-SHA256
   "c8319b3b4b98a8ab95215a439f4201907b343403eade4a81fcdfaa0532fdc50f")
  (:FILE "tests/codec/cbor-string-write-support.lisp" :SOURCE-SHA256
   "2cbdb601f442a56456bc637c94e759cc965f44b178268dce3c636c385d34fc39" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-string-write-support.fasl"
   :FASL-SHA256
   "af29287314a2607c932e45d2bc22678fa6c4574f60ff2de12a71e3b0792b927d")
  (:FILE "tests/codec/cbor-simple-write.lisp" :SOURCE-SHA256
   "958bdd3901cfc41032c09d6c9023b192799981884e09ce3573256ff45bc5329a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-simple-write.fasl"
   :FASL-SHA256
   "2573569996663ad889b6a2b07be6b36eb08f49e9bd3c3e6251726cda7c4ea64d")
  (:FILE "tests/codec/cbor-simple-write-threads.lisp" :SOURCE-SHA256
   "77074033e75a224fd02e890f98dffa8e97d3a1f8bedd510b00ea55d8ff8687b2" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-simple-write-threads.fasl"
   :FASL-SHA256
   "8a6d70a39b0aa3296739b7b994ea3a93f3bc46f5118e16e264b3cda0ee9b2a2a")
  (:FILE "tests/codec/cbor-simple-write-support.lisp" :SOURCE-SHA256
   "53ceafc72a027a2ff1f787900558ff26f2ff70bbb212f1b37926a6d520fbe86e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-simple-write-support.fasl"
   :FASL-SHA256
   "1aa5407799f24e695a29053f996138e8d6fea1bc35be5a874b2c9ec5e342247b")
  (:FILE "tests/codec/cbor-minimal.lisp" :SOURCE-SHA256
   "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-minimal.fasl"
   :FASL-SHA256
   "43d1cbb739e2e73ed87da0d8b7f7d89e9927c53658c3f3a97f3e214df3879a14")
  (:FILE "tests/codec/cbor-minimal-threads.lisp" :SOURCE-SHA256
   "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-minimal-threads.fasl"
   :FASL-SHA256
   "660ea12ab7e9209cd653ee23063e56f5316a7105db8431f1e9d5429d94e7a751")
  (:FILE "tests/codec/cbor-minimal-support.lisp" :SOURCE-SHA256
   "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-minimal-support.fasl"
   :FASL-SHA256
   "eca8b756eaefd09ed654736f84318a4e76ec74cea80078e8b69053664f01a429")
  (:FILE "tests/codec/cbor-minimal-scan.lisp" :SOURCE-SHA256
   "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-minimal-scan.fasl"
   :FASL-SHA256
   "c87f373633419a123ec69c8ab123be6a12b4ee252d926002a47399f6f344f628")
  (:FILE "tests/codec/cbor-minimal-scan-threads.lisp" :SOURCE-SHA256
   "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-minimal-scan-threads.fasl"
   :FASL-SHA256
   "af4c580454fa1670346477bea7ff02d1b86f0fcdc0632c54a4b369cab2e1954b")
  (:FILE "tests/codec/cbor-minimal-scan-support.lisp" :SOURCE-SHA256
   "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-minimal-scan-support.fasl"
   :FASL-SHA256
   "cc96e9309c0ada09c0549153b6c98b9969a2d26f931b9315a018c9cb17c46164")
  (:FILE "tests/codec/cbor-minimal-edges.lisp" :SOURCE-SHA256
   "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-minimal-edges.fasl"
   :FASL-SHA256
   "3edf498d5dce4b80a03c2ed9647da3cf095cead5aff05b076766e3282eaaf2d5")
  (:FILE "tests/codec/cbor-header.lisp" :SOURCE-SHA256
   "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-header.fasl"
   :FASL-SHA256
   "59dabe724e880d5b06cdbafa52d31d8d787011fe0fcbeeb8111cf1db146d8caf")
  (:FILE "tests/codec/cbor-float-write.lisp" :SOURCE-SHA256
   "2d163a64bff4b9d9b9de576c4a4df05f4d8853f1c3d039e790cbb827be98c8b6" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-float-write.fasl"
   :FASL-SHA256
   "2525f1ef9b522479a1e16e85150f841b057d179d8d8184e223036e80dc427d51")
  (:FILE "tests/codec/cbor-float-write-threads.lisp" :SOURCE-SHA256
   "96a1b205c01f75e271684132ff3e48b4da5cf8a01210257b591ec4951f097043" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-float-write-threads.fasl"
   :FASL-SHA256
   "63a4c34b5e0c19ecec017147285f936cc8ed8642ad5c392d21d3f740a0ab03ca")
  (:FILE "tests/codec/cbor-float-write-support.lisp" :SOURCE-SHA256
   "158f18dcf4b2d7e5562713caa3625aeba16dd1eba21f4413345e8a10b616c748" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-float-write-support.fasl"
   :FASL-SHA256
   "e899d2618944f731865fda83eea77250cb01a7c18d5fa7b9ffac447a170b6a35")
  (:FILE "src/wal/types.lisp" :SOURCE-SHA256
   "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/wal/types.fasl"
   :FASL-SHA256
   "025d4d98186a8ca6e940ca07085c6fae6b5ea4e4acc31e3b1df8af88ace90df2")
  (:FILE "src/wal/package.lisp" :SOURCE-SHA256
   "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/wal/package.fasl"
   :FASL-SHA256
   "a4806607a200fe065cc161d3c93a56bc8621fdf48403a499acb01b17b26a785a")
  (:FILE "src/wal/group.lisp" :SOURCE-SHA256
   "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/wal/group.fasl"
   :FASL-SHA256
   "e76961b10c3a66345037ff64f12ac5a05a8876784ef97792f96655c6e5ede00c")
  (:FILE "src/wal/executor.lisp" :SOURCE-SHA256
   "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/wal/executor.fasl"
   :FASL-SHA256
   "4e9c90abcc1b95a54336f817272a0adb9fb243e390eea40085bc7b8953776068")
  (:FILE "src/wal/csn.lisp" :SOURCE-SHA256
   "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/wal/csn.fasl"
   :FASL-SHA256
   "10f70aa1529db4e266bbf5ecaa6c04cf8e923086769e22f1025686aa8ca3313e")
  (:FILE "src/wal/builder.lisp" :SOURCE-SHA256
   "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/wal/builder.fasl"
   :FASL-SHA256
   "8018825a4aa6b497576bc6cca7418d6208ffe6d6e22891ee8cba3296b52e18c0")
  (:FILE "src/storage/segment-header.lisp" :SOURCE-SHA256
   "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/storage/segment-header.fasl"
   :FASL-SHA256
   "76571ddbc53a59b69a4a6bd32a898fff1dfb7b470287fb7ab0c9a2561d826ea9")
  (:FILE "src/storage/payload-write.lisp" :SOURCE-SHA256
   "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/storage/payload-write.fasl"
   :FASL-SHA256
   "a076a928fb40ffc9e3f2a801a4c6af847fe0fd1125730b92adef08fcbae208c3")
  (:FILE "src/storage/payload-record.lisp" :SOURCE-SHA256
   "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/storage/payload-record.fasl"
   :FASL-SHA256
   "168e27cfdfa4618370b3d763b9b6ff23837517a4a9febb45600d8a56914d0d09")
  (:FILE "src/storage/package.lisp" :SOURCE-SHA256
   "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/storage/package.fasl"
   :FASL-SHA256
   "671bfe4491f42a8c9b745bc7f0ba9df36672b1201cd1731ea7a62809fa865716")
  (:FILE "src/storage/log-header.lisp" :SOURCE-SHA256
   "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/storage/log-header.fasl"
   :FASL-SHA256
   "2dd2ca5c6521e9695c8e041bc40287dcb8f1dcfe10bbbe0196ad361bcf8329b9")
  (:FILE "src/storage/formats.lisp" :SOURCE-SHA256
   "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/storage/formats.fasl"
   :FASL-SHA256
   "db08a423dbb27803553eec586b21854c77206857edd3b65c1af615a57135af63")
  (:FILE "src/storage/control-payload.lisp" :SOURCE-SHA256
   "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/storage/control-payload.fasl"
   :FASL-SHA256
   "fa99c0fe350c3fc11e4dd6e7bb63f5f77bb97c57cde7993e4899aea5a58deeed")
  (:FILE "src/storage/compaction-scan.lisp" :SOURCE-SHA256
   "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/storage/compaction-scan.fasl"
   :FASL-SHA256
   "a5df9022f51a405c66ece5127e00c465c94c4f0dcd2468c5357462d3c304d952")
  (:FILE "src/series/worker-types.lisp" :SOURCE-SHA256
   "a366799fd9b938bfaa48b0ffda228ff8369ab9acb5b5ead7f081dfc66ab2c81a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/series/worker-types.fasl"
   :FASL-SHA256
   "344de0fb1b4c741f7a3b1227f3d7ad2015b93c8df1fd55f61b1b0b5361523ebb")
  (:FILE "src/series/worker-run.lisp" :SOURCE-SHA256
   "f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/series/worker-run.fasl"
   :FASL-SHA256
   "acb1711335c5c7e674e0fa981d2585330da277d8c61386a505782a7ddb3bfeb9")
  (:FILE "src/series/worker-package.lisp" :SOURCE-SHA256
   "dcab7a17e4fabcf256c2eddfb655d18145a1d789dd8d64a889945badc418e4b7" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/series/worker-package.fasl"
   :FASL-SHA256
   "c2182ea56b8acada038baa00e87bf1e17442e917636d6ce230afad8f3ccc12f1")
  (:FILE "src/series/worker-boundary.lisp" :SOURCE-SHA256
   "793d401d1b9acc7b67923d815560f277f3d390ca050740f735f07d88dbacfe73" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/series/worker-boundary.fasl"
   :FASL-SHA256
   "174c052b240090a6ebce5e197e703b8ceb85db4deaa9ea772e08ee9b86e5d699")
  (:FILE "src/series/types.lisp" :SOURCE-SHA256
   "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/series/types.fasl"
   :FASL-SHA256
   "3e304fa29174f4560f82910e740637f4bfebb869f1fbfd2489c15b42fb968b72")
  (:FILE "src/series/routing-types.lisp" :SOURCE-SHA256
   "31ae51c0fb11a802164a4d1e11ec63f835a2c67b52c751c5685bcc8947e5e0f1" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/series/routing-types.fasl"
   :FASL-SHA256
   "665b6a717b1c7245e5524ad19d10cb551c035a4621037740297b09edf34551e0")
  (:FILE "src/series/routing-select.lisp" :SOURCE-SHA256
   "796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/series/routing-select.fasl"
   :FASL-SHA256
   "6991c45eddb834bdb61a6cf919f7b39efbf081acba4893dcdafdc8b38f720876")
  (:FILE "src/series/routing-build.lisp" :SOURCE-SHA256
   "70135e73ecb1f6080683dd615c47a50530485061797382d74441743cd9a0f92d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/series/routing-build.fasl"
   :FASL-SHA256
   "77c36cfc3361179f720d32f05cf4974bebf0e4134c3189a7d9b2711926147865")
  (:FILE "src/series/retirement.lisp" :SOURCE-SHA256
   "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/series/retirement.fasl"
   :FASL-SHA256
   "17ec8a8ccea090e69bc59710aa01e3f57abe64acc3009950527e5b7c91086254")
  (:FILE "src/series/query.lisp" :SOURCE-SHA256
   "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/series/query.fasl"
   :FASL-SHA256
   "a45e0ee0c97d99e91d20a067dd21598b3f6a001c23d2612173382d596da850b1")
  (:FILE "src/series/publication.lisp" :SOURCE-SHA256
   "5de121c83ea6bd1243e420d9d898102aebb054cd1fa7ac79fcde9bf0792a95d8" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/series/publication.fasl"
   :FASL-SHA256
   "85bd6129afc137005d077e0c8636979ba2c2ed50bd165ad3a0e7a915ed5fedd5")
  (:FILE "src/series/package.lisp" :SOURCE-SHA256
   "9a402f5225860c483dec9064a84d6462d28f5377a27977a63f64a5fbdbdd3764" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/series/package.fasl"
   :FASL-SHA256
   "f9025ef3675556a90435957580e87ce96171f0ea764aea9715f6ce828bd1fefa")
  (:FILE "src/series/ownership.lisp" :SOURCE-SHA256
   "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/series/ownership.fasl"
   :FASL-SHA256
   "c56cd06acc70a505e3b17804719ce34e20737cbe1ecd2d992ef754d2d8a33cf6")
  (:FILE "src/series/io-events.lisp" :SOURCE-SHA256
   "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/series/io-events.fasl"
   :FASL-SHA256
   "5e2d39a1af92a2d41c372f2ac6dcbff144ab7b2b6934b56a01cf7d20ae753253")
  (:FILE "src/series/events.lisp" :SOURCE-SHA256
   "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/series/events.fasl"
   :FASL-SHA256
   "15c614c2ddf0de71224ff151ecc96629ca5e01519d6b7b21aded88b046301e15")
  (:FILE "src/scheduler/update.lisp" :SOURCE-SHA256
   "e35a704ee0b9445c559a768de048169a8e39837a6df21843d8df58215c482472" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/scheduler/update.fasl"
   :FASL-SHA256
   "3afc671ef173e3bb8f50c97cb709710eebdfb331f2f4111da23954cd26231743")
  (:FILE "src/scheduler/types.lisp" :SOURCE-SHA256
   "3b174be0919f8b27312ada4071d831c3753d62bb12be99d7e9394c48dcab474a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/scheduler/types.fasl"
   :FASL-SHA256
   "3cf644dc81a894c45e29aa2b52c4f09de00ee856ad41eb323267da2df1e7d113")
  (:FILE "src/scheduler/read.lisp" :SOURCE-SHA256
   "5cdc1e5b7ba97c9aab66a5acaf74336b0df33144e24104e0242b7fc2552a1ae2" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/scheduler/read.fasl"
   :FASL-SHA256
   "ccde9170890c33742a44a5b61e11e246be3ce42db7cbc4b23501d24bb0d9bfcb")
  (:FILE "src/scheduler/policy.lisp" :SOURCE-SHA256
   "92b3ca3a81ae0b3ac342a63e5fe5c5d7524091a63065b0232c14c57ee80c4aac" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/scheduler/policy.fasl"
   :FASL-SHA256
   "d4344e363576b5a4c03a111dd793ef021ecec5c70375ecf0c6a7a46751c5c109")
  (:FILE "src/scheduler/package.lisp" :SOURCE-SHA256
   "5a139172de1648b30e09fdc6fc068141299c2034702f8d5b5f44bb0de14a3112" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/scheduler/package.fasl"
   :FASL-SHA256
   "7e3b00ef3945fc8d03aa0879095d40beb0979f208a2f180f8ffda2ffe1bbee51")
  (:FILE "src/scheduler/lifecycle-worker.lisp" :SOURCE-SHA256
   "ec8b462ff3f5f7a6435f0f0c01b62034d8de2a784a9e354d469a0adfec9cf837" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/scheduler/lifecycle-worker.fasl"
   :FASL-SHA256
   "3c7556937beffe6da59bcdddc445792199f4f10c08b066ad03e285be19ed72f6")
  (:FILE "src/scheduler/lifecycle-update.lisp" :SOURCE-SHA256
   "2020e46809e9fe8fa74e061a420b8085679d5f461eabd8b044f3975c1024800e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/scheduler/lifecycle-update.fasl"
   :FASL-SHA256
   "e5bc4136f0a7d8cf53dcfb943c2d0a418d73eb15f3faf0ab614cf7b014365e35")
  (:FILE "src/scheduler/lifecycle-types.lisp" :SOURCE-SHA256
   "4fe980e00f1d273e9b8278cd2daace6b4a9e4ab948ddfac83b79f4b0c537cb7c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/scheduler/lifecycle-types.fasl"
   :FASL-SHA256
   "49c3d9fa2b7efb4f3a6049cec1cb2cefc1cc51a88ae4cc072d38b419abc3be4c")
  (:FILE "src/scheduler/lifecycle-read.lisp" :SOURCE-SHA256
   "c60e1d5f67eeafb216b374fa001d27f87d1a734c5d066fc092902c0301069200" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/scheduler/lifecycle-read.fasl"
   :FASL-SHA256
   "0574f17247abe8f353abb9b493458e6526f0c89415bf2a7f9d45affdb3feaa41")
  (:FILE "src/scheduler/lifecycle-build.lisp" :SOURCE-SHA256
   "d6d67faf8721f26e7fcd228d6ab9a7dfdc36ff5ec56c67ed9e5fb6d914006a9e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/scheduler/lifecycle-build.fasl"
   :FASL-SHA256
   "64a52ee6ede432ca635fc7fa9eae8f18da262f3c23f0d32154804b7fd7732d1b")
  (:FILE "src/scheduler/build.lisp" :SOURCE-SHA256
   "58baf595f221826c64e3fb38344242c3bdf403d65904193bf1a8e06e09d7c336" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/scheduler/build.fasl"
   :FASL-SHA256
   "ff10d2acf4ac731d590c3ff7420d4296fa7a9037f80fd9b7265be91e96fa6910")
  (:FILE "src/recovery/scan.lisp" :SOURCE-SHA256
   "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/recovery/scan.fasl"
   :FASL-SHA256
   "bf1306da81118a0679033e241a51a86a81e8f666dfaf60d306fea237618e69b5")
  (:FILE "src/recovery/package.lisp" :SOURCE-SHA256
   "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/recovery/package.fasl"
   :FASL-SHA256
   "924d7d5b159367de69a892162a52977eb2507cf8ceffd7e14029d88e3347880c")
  (:FILE "src/recovery/manifest-types.lisp" :SOURCE-SHA256
   "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/recovery/manifest-types.fasl"
   :FASL-SHA256
   "a07dee6cdd51ce087ae9dada3f321771241f06a1a0f4b020e51445ec3927ebda")
  (:FILE "src/recovery/manifest-query.lisp" :SOURCE-SHA256
   "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/recovery/manifest-query.fasl"
   :FASL-SHA256
   "c7b975033689787fb844cf0c0cb4ffa56690228d66709c76e818ec58e8bb5a87")
  (:FILE "src/recovery/manifest-package.lisp" :SOURCE-SHA256
   "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/recovery/manifest-package.fasl"
   :FASL-SHA256
   "d9fd7b49d7d24d76b4fd17293bc65b6fbe8912f6a1bf5aee5bf3d9297b183e75")
  (:FILE "src/recovery/manifest-fold.lisp" :SOURCE-SHA256
   "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/recovery/manifest-fold.fasl"
   :FASL-SHA256
   "f09ec31e61f5e142a5cde577294bf8e2ac5f396d4084bd29c97329687ab43c24")
  (:FILE "src/recovery/manifest-decode.lisp" :SOURCE-SHA256
   "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/recovery/manifest-decode.fasl"
   :FASL-SHA256
   "f6f959ab2c89604c43da499ec56cd774588e45d5773c8d7e685de16acc106056")
  (:FILE "src/recovery/manifest-build.lisp" :SOURCE-SHA256
   "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/recovery/manifest-build.fasl"
   :FASL-SHA256
   "9197ac8137f083418aa01aef459873067a07f87167d2e61314e0a064ebaca030")
  (:FILE "src/recovery/inventory-types.lisp" :SOURCE-SHA256
   "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/recovery/inventory-types.fasl"
   :FASL-SHA256
   "fe2bb0cce67b724d2ca64ee00510a45b0b9b157f7d8a0daddda0962fc2112a42")
  (:FILE "src/recovery/inventory-query.lisp" :SOURCE-SHA256
   "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/recovery/inventory-query.fasl"
   :FASL-SHA256
   "5391a052b5c203261dea87ed738e4326070a01a2cf276984262c9092a9a51d3f")
  (:FILE "src/recovery/inventory-build.lisp" :SOURCE-SHA256
   "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/recovery/inventory-build.fasl"
   :FASL-SHA256
   "49a3c34a780925e782cf444eb2c1751b1afa6cabf39d6d7959c6a153b091410c")
  (:FILE "src/recovery/decisions-types.lisp" :SOURCE-SHA256
   "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/recovery/decisions-types.fasl"
   :FASL-SHA256
   "1fa72c461b28a9d8d802bb52d9a91cbf5f81c7f8ea07a52504a335bc8d4043b6")
  (:FILE "src/recovery/decisions-sort.lisp" :SOURCE-SHA256
   "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/recovery/decisions-sort.fasl"
   :FASL-SHA256
   "c6f7c8401d3fbcbd7e30e82d3fec307d22b45a24914d9d264db4d6fc0633949d")
  (:FILE "src/recovery/decisions-radix.lisp" :SOURCE-SHA256
   "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/recovery/decisions-radix.fasl"
   :FASL-SHA256
   "460138a0c535ae7f8e316982ee10d7d7cba03f5200d394cbe72f3913ce22a323")
  (:FILE "src/recovery/decisions-query.lisp" :SOURCE-SHA256
   "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/recovery/decisions-query.fasl"
   :FASL-SHA256
   "7da457c23b8cd5945e9641a3d4fd1a0ce7357451be12a1b6e39e0bdbbca5b790")
  (:FILE "src/recovery/decisions-package.lisp" :SOURCE-SHA256
   "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/recovery/decisions-package.fasl"
   :FASL-SHA256
   "e92573c4d2ac071d0abc6b02ae319d950a41da02f0179f38a57ad6a0f9521b52")
  (:FILE "src/recovery/decisions-build.lisp" :SOURCE-SHA256
   "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/recovery/decisions-build.fasl"
   :FASL-SHA256
   "737fdaa3af689cbd5b0098cb8f98a923d8adf3b3a7471fd5b194551a6852e00f")
  (:FILE "src/read/types.lisp" :SOURCE-SHA256
   "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/read/types.fasl"
   :FASL-SHA256
   "68f3104505caadc1fd3ee07082119d1c20e99adaeabcc16c6b5ad4ceb292ee63")
  (:FILE "src/read/task.lisp" :SOURCE-SHA256
   "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/read/task.fasl"
   :FASL-SHA256
   "5221b60e495ad8e7da1dd28d59a66071bac9b60ac47044fe149c207fda66d669")
  (:FILE "src/read/package.lisp" :SOURCE-SHA256
   "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/read/package.fasl"
   :FASL-SHA256
   "4735502555ad470ce2142fccf268d42c552766a7fb5823e5b0fcf134aa213ba5")
  (:FILE "src/read/core.lisp" :SOURCE-SHA256
   "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/read/core.fasl"
   :FASL-SHA256
   "32d2a46b06e3ed5822e4629f3f658fb7cb359067e4ffb084a91a7c00eeb231b8")
  (:FILE "src/package.lisp" :SOURCE-SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/package.fasl"
   :FASL-SHA256
   "c25dfc2d8d566957f20429ff73cc9eaf9cac18ace95efec1ac1baf3a8fb5896e")
  (:FILE "src/mvcc/types.lisp" :SOURCE-SHA256
   "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/mvcc/types.fasl"
   :FASL-SHA256
   "31b319bce674b853e60de12f215cbf23d4f8b0738808c5c3be543e7f623dfa8f")
  (:FILE "src/mvcc/snapshots-types.lisp" :SOURCE-SHA256
   "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/mvcc/snapshots-types.fasl"
   :FASL-SHA256
   "b57fc4049523ba2cfd91ec718a9f1a1039758a3722d17288bfdd0f6c85b408f7")
  (:FILE "src/mvcc/snapshots-register.lisp" :SOURCE-SHA256
   "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/mvcc/snapshots-register.fasl"
   :FASL-SHA256
   "5bcdcdaf1008c0fa073bee08db936b9f0939009c6f1c8004d8867679a123c15f")
  (:FILE "src/mvcc/snapshots-read.lisp" :SOURCE-SHA256
   "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/mvcc/snapshots-read.fasl"
   :FASL-SHA256
   "65e03a0469ed6c702376174dad0904e5610330707349f02cdd028c7836494951")
  (:FILE "src/mvcc/snapshots-lifecycle.lisp" :SOURCE-SHA256
   "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/mvcc/snapshots-lifecycle.fasl"
   :FASL-SHA256
   "86fd2f6429a24b5722eeb7e05355ce0fb202a86d983565e741f0bac08dd31835")
  (:FILE "src/mvcc/snapshots-csn.lisp" :SOURCE-SHA256
   "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/mvcc/snapshots-csn.fasl"
   :FASL-SHA256
   "cd4f6ff62ee756d0320425277c19ff663d26a8e638581b58e66d6c7dc1d4e4d5")
  (:FILE "src/mvcc/snapshots-core.lisp" :SOURCE-SHA256
   "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/mvcc/snapshots-core.fasl"
   :FASL-SHA256
   "84a75cd175503780bb8c95921dac9fc03166efc9ef7ab5be91d721320c46c8c6")
  (:FILE "src/mvcc/package.lisp" :SOURCE-SHA256
   "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/mvcc/package.fasl"
   :FASL-SHA256
   "56698c6a9307ff1be73d4b6264437631f6b82461ddbecbcb414a6bd8ca499c43")
  (:FILE "src/io/types.lisp" :SOURCE-SHA256
   "63e3c4af997e26aaa48cb1df6298aaf97bb3971b88e59e8b7fa2c3736617450a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/io/types.fasl"
   :FASL-SHA256
   "29455c2b895db93793251a41fd724b731c7163a5f9a7d2f59b1243da69c4db45")
  (:FILE "src/io/transfer.lisp" :SOURCE-SHA256
   "c807f294d0211e8433f8f0332ab6ba3ce7d9ae7de3818f43af7ff8d7fcfd341a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/io/transfer.fasl"
   :FASL-SHA256
   "d0fef18f6146fd316e63ec8cf7943d5ccaa0c4995bc1cd1a1349f1b56d01285e")
  (:FILE "src/io/package.lisp" :SOURCE-SHA256
   "a2437f320b170b4e8df8684ee9b61ab317b8aa10d3c107461450551ff7aec4bd" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/io/package.fasl"
   :FASL-SHA256
   "f87f96dbfe769971619c550f4c7f437bbccaf93c5cf6b3cb5ccc8c8c0efa2e37")
  (:FILE "src/io/native.lisp" :SOURCE-SHA256
   "74f63dbb2137a344054e82c6707e6262473b3332ff66a85f79ecfee9fd50f9b4" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/io/native.fasl"
   :FASL-SHA256
   "0be2087cddc350bf4a6c1c6884f4361616de9a01cb7f44c5207815160093e099")
  (:FILE "src/io/lifecycle.lisp" :SOURCE-SHA256
   "baa1f763fe0f394a14d381b753dcb1be1e90eb03eaff5d6469465b5d4eca015f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/io/lifecycle.fasl"
   :FASL-SHA256
   "1d6f3e8ffce753d9461de16f5f510885c05fe6c572a966ce46ef8c33762a0525")
  (:FILE "src/io/identity.lisp" :SOURCE-SHA256
   "d2b6f7932b66f2ef74241e573ed253cf9b710f217cd570ef23f6671614d90a2c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/io/identity.fasl"
   :FASL-SHA256
   "7249bd0edaa54a066887efaaa035827c8f5aa583adc3142e6eededd358732253")
  (:FILE "src/io/identity-types.lisp" :SOURCE-SHA256
   "5794dd5094f34c24e7e09e4a7937f1988d85ea9cd37e478abaf836273da5d5c1" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/io/identity-types.fasl"
   :FASL-SHA256
   "08607b552b9c283b4169d1b37f927ef121ff183d1d44220bcf03e339623f6f28")
  (:FILE "src/io/flush.lisp" :SOURCE-SHA256
   "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/io/flush.fasl"
   :FASL-SHA256
   "051408f32bcb2d00c38501e77dcb0f7a6f05feed37376af9dd3209dc95c6d3c9")
  (:FILE "src/index/write.lisp" :SOURCE-SHA256
   "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/index/write.fasl"
   :FASL-SHA256
   "06da13800b27ea9fd67191db932436a769436874c1f7fdc019b67f1f71c1eb82")
  (:FILE "src/index/validation.lisp" :SOURCE-SHA256
   "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/index/validation.fasl"
   :FASL-SHA256
   "1b60346054c4d8c42021dfda287ebff2c6ee33afd404567d21a03de41e44dcc2")
  (:FILE "src/index/types.lisp" :SOURCE-SHA256
   "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/index/types.fasl"
   :FASL-SHA256
   "c5e36a81b11ca4b135d4817a5598dd1878014f26be29c8c9d4d86db576a795ac")
  (:FILE "src/index/relocate.lisp" :SOURCE-SHA256
   "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/index/relocate.fasl"
   :FASL-SHA256
   "8f73be56cd7919ebe73e634879fe73499252df1e4f2bf59d6202f5e9faad62d9")
  (:FILE "src/index/rebuild.lisp" :SOURCE-SHA256
   "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/index/rebuild.fasl"
   :FASL-SHA256
   "48044bb0bf7091ae9a3726618959a7d651ae316a027c4e49d8ce06dbb8da6f46")
  (:FILE "src/index/rebuild-scan.lisp" :SOURCE-SHA256
   "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/index/rebuild-scan.fasl"
   :FASL-SHA256
   "c6d2ddf9e2be1f2bf08926ae18afea9720b0f0819e6f5c010d7000ec3932ea93")
  (:FILE "src/index/rebuild-copy.lisp" :SOURCE-SHA256
   "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/index/rebuild-copy.fasl"
   :FASL-SHA256
   "1de259ea855f9586adcefc7cc2c2ddc016c0bc48d68ed4b8d6495904e51014fd")
  (:FILE "src/index/rebuild-budget.lisp" :SOURCE-SHA256
   "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/index/rebuild-budget.fasl"
   :FASL-SHA256
   "d468a87e39a3635b772db988a5286eb3a6b9dedfa50247a89a5907d25a59e528")
  (:FILE "src/index/read.lisp" :SOURCE-SHA256
   "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/index/read.fasl"
   :FASL-SHA256
   "5cd9e7a896f7c75dd52c7a48d590730251150f860902169638e4bb7505cda6e5")
  (:FILE "src/index/primary-write.lisp" :SOURCE-SHA256
   "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/index/primary-write.fasl"
   :FASL-SHA256
   "a67ff5b7a8136a274dbd0a1c58fd6948a02d541959a858db477e89c58be4bfa1")
  (:FILE "src/index/primary-types.lisp" :SOURCE-SHA256
   "f17ca0dcd8a538b921f00044e23872b28272638c4435eacd30f0509422505e64" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/index/primary-types.fasl"
   :FASL-SHA256
   "8943bda0292dfeda9e8649850e7116dbea256037596707ec5f017d8c9ebd8fbc")
  (:FILE "src/index/primary-relocate.lisp" :SOURCE-SHA256
   "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/index/primary-relocate.fasl"
   :FASL-SHA256
   "87786adffb8b50eb44b86b495740f135cdc0d9279a177fe6098db930cb39a588")
  (:FILE "src/index/primary-read.lisp" :SOURCE-SHA256
   "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/index/primary-read.fasl"
   :FASL-SHA256
   "2ce8968489988c802fe7ee64a6bd7503b7cfb749c1a5c6a78e7ac95ca05aa634")
  (:FILE "src/index/primary-probe.lisp" :SOURCE-SHA256
   "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/index/primary-probe.fasl"
   :FASL-SHA256
   "0d9773f24e5855bd91c46150a1eabf1a245e43ee2d63951f1a8e235f6f1bbba4")
  (:FILE "src/index/primary-package.lisp" :SOURCE-SHA256
   "0682eb9a61596506b6788bd0285f9808db2496246caae64ab3203182ed46b860" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/index/primary-package.fasl"
   :FASL-SHA256
   "9833b4868efecb1c2946abfc4c914d372be91aaabfa8fe19a1fa1ccee24f6dcb")
  (:FILE "src/index/primary-directory.lisp" :SOURCE-SHA256
   "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/index/primary-directory.fasl"
   :FASL-SHA256
   "f213c096085ae7bfe5f0a9fbd8f103e313b86e8c35c9be9061e4f43bb139acfc")
  (:FILE "src/index/primary-core.lisp" :SOURCE-SHA256
   "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/index/primary-core.fasl"
   :FASL-SHA256
   "07892ac30562291b675bf699388a09ec673bdbd019652cbc52cb2a57e2998e7f")
  (:FILE "src/index/primary-build.lisp" :SOURCE-SHA256
   "06ca5ac8c03504e2d2f973873e5cabf7518c090cd1f8f2118c46e0ea2f9bf37b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/index/primary-build.fasl"
   :FASL-SHA256
   "172045960fc2c7021d032140316cb9db8d0995b1b292dfa256c8688beb363cbf")
  (:FILE "src/index/primary-arena.lisp" :SOURCE-SHA256
   "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/index/primary-arena.fasl"
   :FASL-SHA256
   "a2dc178c1657ed5376c391d57efa1a3712276cada933ce06bb199760c4cabcf0")
  (:FILE "src/index/package.lisp" :SOURCE-SHA256
   "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/index/package.fasl"
   :FASL-SHA256
   "fcecadff8bcb282d2e61c1ae428c423f4fc1021a452b303c48fc2608b469b44a")
  (:FILE "src/index/hash-seed.lisp" :SOURCE-SHA256
   "ae86514101e95737747ba58a4f0c5dc1ddb44d2b3a18bceb8fd0d0756b57a7a1" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/index/hash-seed.fasl"
   :FASL-SHA256
   "eb9fc3529c55478fedab3400d1274c0ae56f5e3e78d9aaabeccd41ad0ccb6c00")
  (:FILE "src/index/hash-digests.lisp" :SOURCE-SHA256
   "924bb7dab91ff56c1e909f2b06dff5f74b443ac6442e379498f29b25f1fa2673" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/index/hash-digests.fasl"
   :FASL-SHA256
   "31ec2ac307b2b86560dc4ac5f06bbdd7686340cf2e17be6b0a36ab5fb3f85fa1")
  (:FILE "src/index/core.lisp" :SOURCE-SHA256
   "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/index/core.fasl"
   :FASL-SHA256
   "b5b567c2a6ead0a3bce26e11ea4d4fa448074a110b6e5af7c5d9902c1637faf3")
  (:FILE "src/hash/package.lisp" :SOURCE-SHA256
   "1e7668fa26fc1a8e3b3cfe824aa3e08b30b57441d5f90d44453fc3a9259a10d0" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/hash/package.fasl"
   :FASL-SHA256
   "b45c635fcd5d2d7e571b1e1b6fcd818054821163b5141fa6c7e3798f43850cd2")
  (:FILE "src/hash/hash64.lisp" :SOURCE-SHA256
   "99e4c8394a8f877ce1f552f15a57a082c0ec81015e87119ee4ffea28cf3ae77f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/hash/hash64.fasl"
   :FASL-SHA256
   "45e12b9fce9417c6f5a325a8eff78f19279e9122729906c940b87792d49ff8a7")
  (:FILE "src/hash/blocks.lisp" :SOURCE-SHA256
   "5f5dff95ae6c34dfc15538c537ba2fa8d34ba2376ad66ad9975745ea13a2175f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/hash/blocks.fasl"
   :FASL-SHA256
   "ce875d54d19f8d6e56cfaab981e425c2c404a72f7863de9783a380ff9eea6842")
  (:FILE "src/hash/arithmetic.lisp" :SOURCE-SHA256
   "c439e534b768acb123d69b921b85e1e56683aa8335bbc87efba95fe95f256fa9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/hash/arithmetic.fasl"
   :FASL-SHA256
   "25f1c215d546ffc4ebf4ac275fd868b677034b4be96b0ef17c4aebf038545d57")
  (:FILE "src/get/types.lisp" :SOURCE-SHA256
   "653b23a6e719cd1f55e7c58b4d7e8143aec5983992ba210d0eac1f4c8682f623" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/get/types.fasl"
   :FASL-SHA256
   "052accd4c1149d309bf78346234d5732e75cd20d948915321bd13140c749b944")
  (:FILE "src/get/target.lisp" :SOURCE-SHA256
   "9f682f735e49108cad176a6143ec99e1be64da98f29cae0b52f9b49cdea34250" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/get/target.fasl"
   :FASL-SHA256
   "23145950c4244761d85e224ab086f16bf80bfaca8e087f13a9937cae2b683f73")
  (:FILE "src/get/segment.lisp" :SOURCE-SHA256
   "4a486528cb2c1cc3471cb4b332d4314d24011889e1f885db6fd5600bb077eea3" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/get/segment.fasl"
   :FASL-SHA256
   "1a7616d19fd7db526cab4194589bd6c8c63133e19a7f1db4154f4407566020ad")
  (:FILE "src/get/package.lisp" :SOURCE-SHA256
   "87b795779aef0c4b918a039d182daddd22b902a9ad10c763df4364b7e630151c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/get/package.fasl"
   :FASL-SHA256
   "ea763034b581c11ea73f7cab6a5cf7a3698c199c5e77c742887606a49d4f1edd")
  (:FILE "src/get/lookup.lisp" :SOURCE-SHA256
   "9d1042d4cf1e7bd9c6d1153de12b2459e7a2724e47bd32534cd7ae56cb274c5f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/get/lookup.fasl"
   :FASL-SHA256
   "4e076e3678ddad1d231c5eabf3c5cae85d7a782ad9eec5e88b69cd33e347024f")
  (:FILE "src/get/lifecycle.lisp" :SOURCE-SHA256
   "885ba4141114ea411cac37c9b5f924aaa7f9f2a5ba311ebf92a392e5da1e3c59" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/get/lifecycle.fasl"
   :FASL-SHA256
   "00fef3a9ba5afb15e999b33e099ce9325a58c2c0ed516d2a4eab648621085877")
  (:FILE "src/get/build.lisp" :SOURCE-SHA256
   "bcfc4916e9a85833dc151c4ce176bc905f2c03b6bc6d636f97a60df0d8c16739" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/get/build.fasl"
   :FASL-SHA256
   "5d663da79970b585f512c0243bb6a903e2a83398f843ceb424c79898cdf6e89d")
  (:FILE "src/get-resolver/types.lisp" :SOURCE-SHA256
   "b847d6c388f4d052a2d707b7c410cc7c2ef60482fb5cd9ef384c016c31d1dc00" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/get-resolver/types.fasl"
   :FASL-SHA256
   "f1c19e43147e89ba37741deaf832e9c182416f78e4bb1d662c04f3c5d46a37c4")
  (:FILE "src/get-resolver/sort.lisp" :SOURCE-SHA256
   "974bf44efeb1cd26c5e9db0601aea295c8f1a18234894ad9d41938a2880e2255" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/get-resolver/sort.fasl"
   :FASL-SHA256
   "516b1a3dabcc2fbb392bb0157ec241914d50d85e6ed7f9e96d62db7a6e603536")
  (:FILE "src/get-resolver/scan.lisp" :SOURCE-SHA256
   "35a1780c6bf66364ef94c4151fa91f02eebe359f0ca0639985d2a907fd9d512d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/get-resolver/scan.fasl"
   :FASL-SHA256
   "6dc089a397d35ad3c5810594179190264fc0bd2e45ebc31da16dddbbc33fef74")
  (:FILE "src/get-resolver/rows.lisp" :SOURCE-SHA256
   "d9db85d788006fc7ad1f9a7cdeef28b992605de7fac8c295dd7fdc51f5511854" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/get-resolver/rows.fasl"
   :FASL-SHA256
   "eebfb37756ef78384c6e152dd60972a8a65fc3d27c74f6aca236308e6b240fc6")
  (:FILE "src/get-resolver/read.lisp" :SOURCE-SHA256
   "dd100bb17e15589124916767f8a690ae683ac8c462102c778639f917a5f1924d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/get-resolver/read.fasl"
   :FASL-SHA256
   "f8fec0be065f9950d4bfa6c08edff127d09a18d20cc91adc677476dd1cb9125a")
  (:FILE "src/get-resolver/package.lisp" :SOURCE-SHA256
   "663a5a15a630ed2b9042a3a3365598358df97d3dd1cd3d7610b283526281f39a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/get-resolver/package.fasl"
   :FASL-SHA256
   "66668f57eaa7ccf9fad9a8012a349ecc09c7f56db2e0553642227d6071b0ab7c")
  (:FILE "src/get-resolver/build.lisp" :SOURCE-SHA256
   "c649c80c2b510669fc1c0a7f15b3080b7fb46a3423a1e49db5bb9ff248176e0a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/get-resolver/build.fasl"
   :FASL-SHA256
   "1bc83a23025a89397f7a6d8eec0b25b53bf34e1bd93fdbabbb7a370870f98e8b")
  (:FILE "src/get-resolver/active-types.lisp" :SOURCE-SHA256
   "a3cb954a265b263e0e03d2f1a80824589670efbf89adcd69007987d26df2e29a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/get-resolver/active-types.fasl"
   :FASL-SHA256
   "252de6c74a764316f36fe91e1fd871d3ae5ea63dd54dfaf47f81afd1b1bc597d")
  (:FILE "src/get-resolver/active-scan.lisp" :SOURCE-SHA256
   "97dd4f59d4449334b113e9403a208007ed1a398a9b53f88bda3e3c0bbf3a1067" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/get-resolver/active-scan.fasl"
   :FASL-SHA256
   "c10f8dcf4760a9abefee8046f9c196d05e2589dfb656bac6cca5b416b1859d12")
  (:FILE "src/get-resolver/active-read.lisp" :SOURCE-SHA256
   "47630e5d42c785e39e15dd714177cd86159129a5391d82321385f92317bea659" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/get-resolver/active-read.fasl"
   :FASL-SHA256
   "a5e79e83d68040bacf32881e6d97005513094554db0f842f16b1620baa1002b7")
  (:FILE "src/get-resolver/active-preflight.lisp" :SOURCE-SHA256
   "eb56f5704666cac3a88ec97f58f70c7d61db2e8feea6a094db4c468a1a2775a9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/get-resolver/active-preflight.fasl"
   :FASL-SHA256
   "63e33bb65a209bd7be42d04e97a4562ea5164936e6c71a1c0f6a7a3bfdde13c1")
  (:FILE "src/get-resolver/active-init.lisp" :SOURCE-SHA256
   "a27a7618216170e66b57113239ac60e8f1cccd8cf5d526e1b94e88894b3fb9f1" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/get-resolver/active-init.fasl"
   :FASL-SHA256
   "c76b6b504cc7d3f945c9bad53ff0346bc6910114c776b850c5499af768a1e154")
  (:FILE "src/get-resolver/active-directory.lisp" :SOURCE-SHA256
   "c2b9a9ac3209270e9949720473908460548430a8098c9199fb55d2317a87682b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/get-resolver/active-directory.fasl"
   :FASL-SHA256
   "04ca93a2d8dc600d4deb3fe2c4765785c4ac8d85683e5c9b562c6ea420fc02c7")
  (:FILE "src/get-resolver/active-build.lisp" :SOURCE-SHA256
   "0eed95930d41c515965ae8ab0a14fbb94597a42ea38b86f205ea0938cf4631de" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/get-resolver/active-build.fasl"
   :FASL-SHA256
   "bd7683e666ba66c6db9f2a45dae7b93a607b8728974c82e03eca5ff837bc1dd6")
  (:FILE "src/get-directory/types.lisp" :SOURCE-SHA256
   "0e2348291a4994f45bd1f6fe5efdc66041d2fdce18641d1af11b6c850ed69b2b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/get-directory/types.fasl"
   :FASL-SHA256
   "69fe153738da8ddfeb171ff400157c6f1a0762e2f7bf08aa0662c96976e5d01a")
  (:FILE "src/get-directory/sources-types.lisp" :SOURCE-SHA256
   "862342b07d6a8aae834aaf3da4149682fcd1dcbdae971adad640597583547099" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/get-directory/sources-types.fasl"
   :FASL-SHA256
   "7bec7ea60d715eb9b387dc80c2b41ce267fd8fd805ee9a847cb86934497b3d12")
  (:FILE "src/get-directory/sources-read.lisp" :SOURCE-SHA256
   "ee4a3b81322fbd51ce928be0b73e9bc180af7ed39f936b68ec9a152dd2a180c2" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/get-directory/sources-read.fasl"
   :FASL-SHA256
   "ae9efbfb0c71412ccabb0949eed5ff8a1c723e7a77c7f4ea5deba69e860a6be3")
  (:FILE "src/get-directory/read.lisp" :SOURCE-SHA256
   "a2287eb7e91bed84f3727baaf81376bbe5bf5df15cde1ea268c6d2fa66fe0a5d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/get-directory/read.fasl"
   :FASL-SHA256
   "31f96eb69e4be50b351aa544c8477dda41cdc03c0f63571c6de51284dc8dd3d4")
  (:FILE "src/get-directory/package.lisp" :SOURCE-SHA256
   "e779202c8df502749a81d0c6f9f0d505d000e09231f3679b1a91303fbcbf36f9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/get-directory/package.fasl"
   :FASL-SHA256
   "27469e493ea12bfd5cb07113a3d38720afa0b56037cd599b54bfad4162a69db5")
  (:FILE "src/get-directory/build.lisp" :SOURCE-SHA256
   "9bebb3cd9d66a8ec2fd0c72ad828e00ab2347093642653da45ef263bc855f947" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/get-directory/build.fasl"
   :FASL-SHA256
   "4917a6828ae17b22a8faac502a95eb3e2e496dc89c2badc23d6eb2c31eee95c4")
  (:FILE "src/foundation/record.lisp" :SOURCE-SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/foundation/record.fasl"
   :FASL-SHA256
   "6b52687aaa0d104d1c15c60d74ee4a9d47b10c364ac6b4da013e38fbd4f52c07")
  (:FILE "src/foundation/package.lisp" :SOURCE-SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/foundation/package.fasl"
   :FASL-SHA256
   "bdff399c51370f330c685b45cd3abfffc824c1e5b206babc83b7b161d610fd5a")
  (:FILE "src/foundation/crc32c.lisp" :SOURCE-SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/foundation/crc32c.fasl"
   :FASL-SHA256
   "4e2811834d4381f3fb5a04a2a7270dcd8afb5b8af721818df9af2ef086b715ed")
  (:FILE "src/foundation/conditions.lisp" :SOURCE-SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/foundation/conditions.fasl"
   :FASL-SHA256
   "5c0c4b50351e1d37cd1dd4b9dbe745ec2d40d2d1a7e15978d7c094f641cf4fca")
  (:FILE "src/foundation/binary.lisp" :SOURCE-SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/foundation/binary.fasl"
   :FASL-SHA256
   "a32769c484c747bd61a1cba02c9dfe1ab64e512a55b0b2b519f1c8357d57340f")
  (:FILE "src/foundation/batch.lisp" :SOURCE-SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/foundation/batch.fasl"
   :FASL-SHA256
   "788eaba3a1e193aff08f8d4272b6a5a63e8fb63cbf4d96de737c23f627e83f27")
  (:FILE "src/execution/writer.lisp" :SOURCE-SHA256
   "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/execution/writer.fasl"
   :FASL-SHA256
   "74d25906ee61393162def5884e8b1e69aecf3d0cee1dbf04874691824fd12f72")
  (:FILE "src/execution/worker-types.lisp" :SOURCE-SHA256
   "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/execution/worker-types.fasl"
   :FASL-SHA256
   "9bb3d0c936c4a070c4fea56a23b53ff234f5c363b3cded6efc024ec6132aef7c")
  (:FILE "src/execution/worker-run.lisp" :SOURCE-SHA256
   "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/execution/worker-run.fasl"
   :FASL-SHA256
   "f481a736d7a2c7a10d86c8102f4daf8d84ec9de5d2f457bc1e25fce8063eb935")
  (:FILE "src/execution/worker-claim.lisp" :SOURCE-SHA256
   "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/execution/worker-claim.fasl"
   :FASL-SHA256
   "da86983977619315bd92ab230e69c3db630dc473b5c4072325054a212277b5a7")
  (:FILE "src/execution/worker-boundary.lisp" :SOURCE-SHA256
   "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/execution/worker-boundary.fasl"
   :FASL-SHA256
   "2da58a7a773e76687877d201cbe0973ce1b49d6908b18f68de57726e373d0c45")
  (:FILE "src/execution/ready.lisp" :SOURCE-SHA256
   "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/execution/ready.fasl"
   :FASL-SHA256
   "2cb153d914ef6b1ef0aeca29eaef2c9b9248f09295dc3a797d88f330ae0af1d1")
  (:FILE "src/execution/ready-types.lisp" :SOURCE-SHA256
   "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/execution/ready-types.fasl"
   :FASL-SHA256
   "47fd9f4e47b7008142341c46677970c65c9146e5ceb6f794d15fa4b1a64b7ca8")
  (:FILE "src/execution/ready-recycle.lisp" :SOURCE-SHA256
   "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/execution/ready-recycle.fasl"
   :FASL-SHA256
   "8b5138dc6be47421f0f0216f572d139c736a49bc7f5a996f411f76a80d62f01d")
  (:FILE "src/execution/queue.lisp" :SOURCE-SHA256
   "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/execution/queue.fasl"
   :FASL-SHA256
   "113681c00463096aba13d05cc46f03bae8a2a3541e5f835b650b3451628b5cf0")
  (:FILE "src/execution/package.lisp" :SOURCE-SHA256
   "833e501e6ee6e3acb8a6d37139c4605a05e06c425a35318adbcf651aa2f9db30" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/execution/package.fasl"
   :FASL-SHA256
   "9d9ccf3008f4dee4ad49085cc005ad4c49c21cd1e963219a7841b52ebbbda9da")
  (:FILE "src/execution/handoff.lisp" :SOURCE-SHA256
   "3ce9f47008416f210173fd3a83ee7665b2103f26039d36e2601b31e5e3ebd72a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/execution/handoff.fasl"
   :FASL-SHA256
   "1ebe9441aff3cb77eb0c40eb986fb1dd2402941291f4116af03130702a49c386")
  (:FILE "src/epochs/types.lisp" :SOURCE-SHA256
   "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/epochs/types.fasl"
   :FASL-SHA256
   "2401fc280cce0aa540aec5a68944298a38590a54d1f59154984595416a13abf2")
  (:FILE "src/epochs/retire.lisp" :SOURCE-SHA256
   "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/epochs/retire.fasl"
   :FASL-SHA256
   "99a16da4f85725d1eda0933761abb5aef2707466dc26dc63cdab9ffad555bb5e")
  (:FILE "src/epochs/reclaim.lisp" :SOURCE-SHA256
   "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/epochs/reclaim.fasl"
   :FASL-SHA256
   "4c75e66fc906d0506bc68625e9dc0bb63c55055ed5f610c0b8f667f380c53d6c")
  (:FILE "src/epochs/read.lisp" :SOURCE-SHA256
   "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/epochs/read.fasl"
   :FASL-SHA256
   "6f2c12000f124cdcec92a98b6bdd56edecebd11fccc5bd26bce141b0b6cffe72")
  (:FILE "src/epochs/package.lisp" :SOURCE-SHA256
   "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/epochs/package.fasl"
   :FASL-SHA256
   "dd07df4a0c5f5e2dd56eeeb35af1b047dcc1f60d2f3b4b0c44eb2d10468c7dae")
  (:FILE "src/epochs/core.lisp" :SOURCE-SHA256
   "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/epochs/core.fasl"
   :FASL-SHA256
   "5949996a0b06f8fa712cf8bde24c7806bdf789418b38f2794cb03aae1bc85d65")
  (:FILE "src/csn/registry.lisp" :SOURCE-SHA256
   "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/csn/registry.fasl"
   :FASL-SHA256
   "22605e3365d3c4818cae1f11126fd077ae25a071ba9b665f5ec85bafd0a5a8e0")
  (:FILE "src/csn/package.lisp" :SOURCE-SHA256
   "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/csn/package.fasl"
   :FASL-SHA256
   "013369326303cda41260e57922c1dc87d24dd30b83331504fbb7adaef97be12a")
  (:FILE "src/control/types.lisp" :SOURCE-SHA256
   "7f7932e0c38d3fa26273342df2be2da436024ff9a9a647c8a3dc5c65c452f563" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/control/types.fasl"
   :FASL-SHA256
   "2fbef7666160bc57e62860df9ec959cce155e3485a44fa162e94de3fb0905141")
  (:FILE "src/control/transfer.lisp" :SOURCE-SHA256
   "6e257bfb6ce8e6d11263cc6788de4fc35657a82e159af7b46341c3bb208e0275" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/control/transfer.fasl"
   :FASL-SHA256
   "9ce306ce11c44d6bf5961d2ab4b4daec354040310f3e6fb49d46bdf4730b7f44")
  (:FILE "src/control/prepare.lisp" :SOURCE-SHA256
   "878b15074bfcb3f3aec784e78e545f1ae617539b9ddcb975504880cb000b7f87" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/control/prepare.fasl"
   :FASL-SHA256
   "937ba7b52061afcb1491ce65dbfd17f61f0273c3673f38a77c4cda9b53b2cd47")
  (:FILE "src/control/preflight.lisp" :SOURCE-SHA256
   "48326533ac0934cb3b1e3fc7657ef48f38912b6c08e9e38367301905f7711584" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/control/preflight.fasl"
   :FASL-SHA256
   "9657c181e40417aa08aedf9482666ad0092cbdff8bae90218354f579dcc712c8")
  (:FILE "src/control/package.lisp" :SOURCE-SHA256
   "405b91843049e7f9e38896535ad615886443852b39eb0687c29e44dbd675429d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/control/package.fasl"
   :FASL-SHA256
   "c255136bf58a8020e114a7ef0bfd490639f24e00f233840c606ea4b79baddbc6")
  (:FILE "src/control/dependency.lisp" :SOURCE-SHA256
   "f328344e4824fd53d03a0476b45fb87efada43ddee895e13afd76ac44413d128" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/control/dependency.fasl"
   :FASL-SHA256
   "54eb069c150053d04bdcbfcfeb4b946779873138f81d90f1eea3911bd7028481")
  (:FILE "src/control/build.lisp" :SOURCE-SHA256
   "1904e81a6cebbb178598a41e1b2283240fc21506781b1e31da407610ce0f519c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/control/build.fasl"
   :FASL-SHA256
   "1a36842e24de2d7b3d3620b777655173f1e89b3132ec56bcf172a9307bc0bdab")
  (:FILE "src/codec/utf8.lisp" :SOURCE-SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/codec/utf8.fasl"
   :FASL-SHA256
   "e9cb75efc3e3abd3581832397d9f987fd8e3a31fb3369cb9ee112d4d93a8cf10")
  (:FILE "src/codec/package.lisp" :SOURCE-SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/codec/package.fasl"
   :FASL-SHA256
   "19e3db3d974b98e7fc7eeb422d3f894bd74681821807476bff612c3757e7ad71")
  (:FILE "src/codec/cbor-write.lisp" :SOURCE-SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/codec/cbor-write.fasl"
   :FASL-SHA256
   "a9ccf6bab641e12767f7170bcaecf50166782e7a12dd3ab1f45b1b82ac44b891")
  (:FILE "src/codec/cbor-string-write.lisp" :SOURCE-SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/codec/cbor-string-write.fasl"
   :FASL-SHA256
   "810dccadb9e1895f44a371237103bcdd0522147636dbe0dd91287db0ff8d171e")
  (:FILE "src/codec/cbor-space.lisp" :SOURCE-SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/codec/cbor-space.fasl"
   :FASL-SHA256
   "e70ace2f2e12b454bd34b6ed88aed1dce739ca45bd330e7b9d9f7d159e6049bd")
  (:FILE "src/codec/cbor-simple-write.lisp" :SOURCE-SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/codec/cbor-simple-write.fasl"
   :FASL-SHA256
   "ee81a18c57b864523551b15ffb5b30f69864a098d9e0b1bbc0c777952953966f")
  (:FILE "src/codec/cbor-scan.lisp" :SOURCE-SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/codec/cbor-scan.fasl"
   :FASL-SHA256
   "03af447f7eac23328c9682508d270a4b50545c641b379c8f690fb21763da9eab")
  (:FILE "src/codec/cbor-scan-stack.lisp" :SOURCE-SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/codec/cbor-scan-stack.fasl"
   :FASL-SHA256
   "b2a7208d6276bd5dac180daa69ad8471158d9e8d89414b422e44d2430026b39b")
  (:FILE "src/codec/cbor-scan-minimal.lisp" :SOURCE-SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/codec/cbor-scan-minimal.fasl"
   :FASL-SHA256
   "7244cd731fc1ecc8e47bd0c011e421acd968d60702963f684cf7380cf96717c2")
  (:FILE "src/codec/cbor-scan-items.lisp" :SOURCE-SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/codec/cbor-scan-items.fasl"
   :FASL-SHA256
   "e667b70aa20bed2fa799fc4704c46f9c5cf44fd68e034f4e1d5cf69070ce6b9e")
  (:FILE "src/codec/cbor-scan-input.lisp" :SOURCE-SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/codec/cbor-scan-input.fasl"
   :FASL-SHA256
   "faaf4720e7e5162993653bccb65c51951a7f4cfc5020872a3aecab4e32f7eff5")
  (:FILE "src/codec/cbor-package.lisp" :SOURCE-SHA256
   "c2a6fe51760c871705e4cf213ada92fed140fac26cf177d06889e18ab87fb45b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/codec/cbor-package.fasl"
   :FASL-SHA256
   "5bd9c13866d6fcb20665b37d440974104b6663cd2131018778f0a8e9cf15b531")
  (:FILE "src/codec/cbor-minimal.lisp" :SOURCE-SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/codec/cbor-minimal.fasl"
   :FASL-SHA256
   "85abce1bbe8d0ced66bcf0f518fed1044f1b0738665244f828a767b6173532ed")
  (:FILE "src/codec/cbor-header.lisp" :SOURCE-SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/codec/cbor-header.fasl"
   :FASL-SHA256
   "b6a2697bc2c52698cea3ec05853da7a3606d121d379079725ff559d6140721c7")
  (:FILE "src/codec/cbor-float-write.lisp" :SOURCE-SHA256
   "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/codec/cbor-float-write.fasl"
   :FASL-SHA256
   "9751a91838837cde27b020b76bb2c311bdfe607d1667278f9f40efb0a458aafe")
  (:FILE "src/codec/cbor-float-narrow.lisp" :SOURCE-SHA256
   "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/codec/cbor-float-narrow.fasl"
   :FASL-SHA256
   "734e5def993f1489af0cc981d998b1c343c98a78f4072fef802cb19f74b57926")
  (:FILE "src/codec/cbor-float-minimal.lisp" :SOURCE-SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/codec/cbor-float-minimal.fasl"
   :FASL-SHA256
   "360599888c7162dd2f444ecb00509ea2a8e705086a3df9e2458bc54ce12833c6")
  (:FILE "src/cache/write.lisp" :SOURCE-SHA256
   "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/cache/write.fasl"
   :FASL-SHA256
   "e04dfa23eeffe75018446ad7796bf29d51a0c78a09f9fdac4b9bb7e8e0fd885c")
  (:FILE "src/cache/types.lisp" :SOURCE-SHA256
   "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/cache/types.fasl"
   :FASL-SHA256
   "b18749143d6fb0894c3aaa9c7a28b5e29b41ec19e3fdc119c8bf905ec1610b4b")
  (:FILE "src/cache/read.lisp" :SOURCE-SHA256
   "5700e43ae8ee859e96bdecb5953af43a712fd9e6ec23a53565759676bb07f85a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/cache/read.fasl"
   :FASL-SHA256
   "d5a6a339a578f944625e21e3ecd0b71e5ed13b59e71cf0d54c4125e6b53daec9")
  (:FILE "src/cache/package.lisp" :SOURCE-SHA256
   "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/cache/package.fasl"
   :FASL-SHA256
   "27857146a482206c48410419236866c94f62fd7f4bd7bceca44dcff1ab670795")
  (:FILE "src/cache/core.lisp" :SOURCE-SHA256
   "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/cache/core.fasl"
   :FASL-SHA256
   "07f27476ae254a2d54f6ce859efc9a46b5f6341041ac4fac7de9d307aee1873d")
  (:FILE "src/cache/clock.lisp" :SOURCE-SHA256
   "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/cache/clock.fasl"
   :FASL-SHA256
   "c955f79a9b19d995d3ac536e94889f5a55e197b9e7e62d0d8a012c50017683a7")
  (:FILE "src/cache/build.lisp" :SOURCE-SHA256
   "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/cache/build.fasl"
   :FASL-SHA256
   "cb2e8c08d761146428fc474ddb7246b68035e2f96d8af6b8b402ec03478a9e86")
  (:FILE "src/active/types.lisp" :SOURCE-SHA256
   "48fe584096fc253ef182ab428c1887e443af06d75aaa938df660c77e60b39bfb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/active/types.fasl"
   :FASL-SHA256
   "f7a85cbe33c5f06fe6cf99778deb4a09622f2a06b547906772b85f0d6451419f")
  (:FILE "src/active/source.lisp" :SOURCE-SHA256
   "ff96fe360b46190ecc08ee9e05a813715dc3399054f93693f9309012aec6547d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/active/source.fasl"
   :FASL-SHA256
   "626faed550921a3ed1bcba5483959fedf24840a6568e9f0425b461238be3f4b7")
  (:FILE "src/active/prepare.lisp" :SOURCE-SHA256
   "7b45fb01132c45c9bec76f374edaa8de91ac6bb2d61ae5c359e1fa10c6346f53" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/active/prepare.fasl"
   :FASL-SHA256
   "572ff87077c835b8f9eaa0d048b053edc872830ab4e2b4916f264f608cf24e28")
  (:FILE "src/active/preflight.lisp" :SOURCE-SHA256
   "ef7b592daecc223d78cbcda138b5938abc01593b486482bec06f2721cfd955a2" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/active/preflight.fasl"
   :FASL-SHA256
   "ee4cca6bcfd2e8eab72d4cdc24f6cbe854cce5647ec4993251fe4373c689e04e")
  (:FILE "src/active/package.lisp" :SOURCE-SHA256
   "4a6fa4187ef5d44aec4e65d57ee6d6046485f283cc9009c1d94263bee745fa3b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/active-empty/ArcDocDB/spikes/out/get-series-mutations-active-empty-E/raw/isolatedtests/ignore-readonly-open/fasl/src/active/package.fasl"
   :FASL-SHA256
   "74836e283556afabfa934d443f93cb81165aff3d5f4c3f161e4eeef5f0a159d5"))
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
   "TEST-REQ-CMP-007-SERIES-GET-EMPTY-ACTIVE-FIXTURE-CLEANUP-NATIVE-V1-V2"))
 :FAILED-TEST
 ("ARCDOCDB.GET.DIRECTORY.TESTS"
  "TEST-REQ-WAL-006-SERIES-GET-EMPTY-ACTIVE-CLOSED-CAPABILITIES-REFUSED")
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
   "a27a7618216170e66b57113239ac60e8f1cccd8cf5d526e1b94e88894b3fb9f1")
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
 "40aad4a68df10a18fae51698bf2620e32823a9b8ade0233e030da74cd0bc152c"
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
   "a27a7618216170e66b57113239ac60e8f1cccd8cf5d526e1b94e88894b3fb9f1")
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
